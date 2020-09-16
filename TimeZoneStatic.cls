/*
Created By: Amit Sharma
Purpose - To help the Salesforce developers to handle the timezone conversion
*/
public without sharing class TimeZoneStatic {

    public static Integer fetchMinutesAdjust(String timeZone){
        if(String.isEmpty(timeZone) || String.isBlank(timeZone)) return null;
        timeZone = timeZone.toUpperCase();
        if(!fetchTimeDiff().containsKey(timeZone)) return null;
        else{ 
            // Sometimes the Time zone is GMT +- YY.XX like GMT + 5:30 or GMT + 11:45
            // so when it is :30 or :45 in XX add 30 minutes or 15 minutes for minutes calculation
            if(fetchTimeDiff().get(timeZone).endsWith('3')) return Integer.ValueOf(fetchTimeDiff().get(timeZone))*60 + 30;
            else if(fetchTimeDiff().get(timeZone).endsWith('4')) return Integer.ValueOf(fetchTimeDiff().get(timeZone))*60 + 15;
            else return Integer.ValueOf(fetchTimeDiff().get(timeZone))*60;
        }
    }
    
    public static Map<String,String> fetchTimeDiff(){
        Map<String,String> timeZoneVsGmtDiffTimeMap = new Map<String,String>();
        // These are all the timezones supported by Salesforce on the day this class was written and few records or ommitted due to 
        // multiple time zone in same region.
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/KIRITIMATI','14.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/ENDERBURY','13.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/TONGATAPU','13.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/CHATHAM','12.4');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/CHATHAM','13.4');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KAMCHATKA','12.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/AUCKLAND','12.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/FIJI','12.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/GUADALCANAL','11.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/NORFOLK','11.0');
        timeZoneVsGmtDiffTimeMap.put('AUSTRALIA/LORD_HOWE','10.3');
        timeZoneVsGmtDiffTimeMap.put('AUSTRALIA/BRISBANE','10.0');
        timeZoneVsGmtDiffTimeMap.put('AUSTRALIA/SYDNEY','10.0');
        timeZoneVsGmtDiffTimeMap.put('AUSTRALIA/ADELAIDE','9.3');
        timeZoneVsGmtDiffTimeMap.put('AUSTRALIA/DARWIN','9.3');
        timeZoneVsGmtDiffTimeMap.put('ASIA/SEOUL','9.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/TOKYO','9.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/HONG_KONG','8.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KUALA_LUMPUR','8.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/MANILA','8.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/SHANGHAI','8.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/SINGAPORE','8.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/TAIPEI','8.0');
        timeZoneVsGmtDiffTimeMap.put('AUSTRALIA/PERTH','8.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/BANGKOK','7.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/HO_CHI_MINH','7.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/JAKARTA','7.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/RANGOON','6.3');
        timeZoneVsGmtDiffTimeMap.put('ASIA/DHAKA','6.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KATHMANDU','5.4');
        timeZoneVsGmtDiffTimeMap.put('ASIA/COLOMBO','5.3');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KOLKATA','5.3');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KARACHI','5.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/TASHKENT','5.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/YEKATERINBURG','5.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KABUL','4.3');
        timeZoneVsGmtDiffTimeMap.put('ASIA/BAKU','4.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/DUBAI','4.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/TBILISI','4.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/YEREVAN','4.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/TEHRAN','3.3');
        timeZoneVsGmtDiffTimeMap.put('ASIA/TEHRAN','4.3');
        timeZoneVsGmtDiffTimeMap.put('AFRICA/NAIROBI','3.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/BAGHDAD','3.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/KUWAIT','3.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/RIYADH','3.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/ISTANBUL','3.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/MINSK','3.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/MOSCOW','3.0');
        timeZoneVsGmtDiffTimeMap.put('AFRICA/CAIRO','2.0');
        timeZoneVsGmtDiffTimeMap.put('AFRICA/JOHANNESBURG','2.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/BEIRUT','2.0');
        timeZoneVsGmtDiffTimeMap.put('ASIA/JERUSALEM','2.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/ATHENS','2.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/BUCHAREST','2.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/HELSINKI','2.0');
        timeZoneVsGmtDiffTimeMap.put('AFRICA/ALGIERS','1.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/AMSTERDAM','1.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/BERLIN','1.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/BRUSSELS','1.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/PARIS','1.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/PRAGUE','1.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/ROME','1.0');
        timeZoneVsGmtDiffTimeMap.put('AFRICA/CASABLANCA','0.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/DUBLIN','0.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/LISBON','0.0');
        timeZoneVsGmtDiffTimeMap.put('EUROPE/LONDON','0.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/SCORESBYSUND','-1.0');
        timeZoneVsGmtDiffTimeMap.put('ATLANTIC/AZORES','-1.0');
        timeZoneVsGmtDiffTimeMap.put('ATLANTIC/CAPE_VERDE','-1.0');
        timeZoneVsGmtDiffTimeMap.put('ATLANTIC/SOUTH_GEORGIA','-2.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/ARGENTINA/BUENOS_AIRES','-3.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/SAO_PAULO','-3.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/ST_JOHNS','-3.3');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/CARACAS','-4.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/HALIFAX','-4.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/PUERTO_RICO','-4.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/SANTIAGO','-4.0');
        timeZoneVsGmtDiffTimeMap.put('ATLANTIC/BERMUDA','-4.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/BOGOTA','-5.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/INDIANA/INDIANAPOLIS','-5.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/LIMA','-5.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/NEW_YORK','-4.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/PANAMA','-5.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/CHICAGO','-6.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/EL_SALVADOR','-6.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/MEXICO_CITY','-6.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/DENVER','-7.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/MAZATLAN','-7.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/PHOENIX','-7.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/LOS_ANGELES','-8.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/TIJUANA','-8.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/PITCAIRN','-8.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/ANCHORAGE','-9.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/GAMBIER','-9.0');
        timeZoneVsGmtDiffTimeMap.put('AMERICA/ADAK','-10.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/HONOLULU','-10.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/NIUE','-11.0');
        timeZoneVsGmtDiffTimeMap.put('PACIFIC/PAGO_PAGO','-11.0');
        return timeZoneVsGmtDiffTimeMap;
    }
    
}