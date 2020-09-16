/*
Created By - Amit Sharma
Purpose - To help the Salesforce developers to handle the timezone conversion
Here is the sample code on how to test IST to EST conversion
First param is dateTime, secondparam is the timezone in which you want to conver and third param is from which timezone you are converting
DateTime dt = DateTime.now().addminutes(330);
DateTime nDt = ConvertTimeUtil.convertTime(DateTime.now().addminutes(330),'America/New_York','Asia/Kolkata'); 
system.debug('Sent Time:'+dt);
system.debug('Recieved Time:'+nDt);

*/

public without sharing class ConvertTimeUtil {
   
    public static DateTime convertToGmt(DateTime dt, String fromTimeZone){
        String uTz = Userinfo.getTimeZone().getDisplayName().split('Time')[1].trim(); 
        // uTz = Fetch the current logged in user timezone and extract the timezone from the display name like America/New_York
        // out of (GMT-04:00) Eastern Daylight Time (America/New_York))
		Integer uTzNumber = TimeZoneStatic.fetchMinutesAdjust(uTz.substring(1,uTz.length()-1));
        // uTzNumber = get the time difference in minutes
        Timezone tz = Timezone.getTimeZone(fromTimeZone);
        Integer offsetMins = tz.getOffset(DateTime.newInstanceGmt(dt.date(),dt.time())) / (1000 * 60);
        // DateTime.Date() and DateTime.Time() returns the values in the current logged in user timezone so the the supplied date time
        // in this method changes when we do .Date() or .Time(), generally date remains the same but not the time so we have add or
        // subtract the current user time to make sure the returned time is in GMT. This is handled by uTzNumber
        return DateTime.newInstanceGmt(dt.date(),dt.time()).addMinutes(-1 * offsetMins).addMinutes((-1) * uTzNumber);
    }
    
    public static DateTime convertTime(DateTime dt, String toTimeZone, String fromTimeZone){
        DateTime convDateTime;
        if(String.isEmpty(toTimeZone)   || String.isBlank(toTimeZone) || String.isEmpty(fromTimeZone) || 
           String.isBlank(fromTimeZone) || toTimeZone.equalsIgnoreCase(fromTimeZone)) return null;
        if(fromTimeZone.equalsIgnoreCase('GMT') || fromTimeZone.equalsIgnoreCase('UTC')) convDateTime = dt;
        else convDateTime = convertToGmt(dt,fromTimeZone); // First Convert received timezone to GMT
        convDateTime = DateTime.newInstance(convDateTime.getTime() + Timezone.getTimeZone(toTimeZone).getOffset(convDateTime));
        return convDateTime;
    }
    
    
    
}