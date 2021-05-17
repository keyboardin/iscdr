package com.insung.isup.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MakeXMLData {
	
	public String getAPIAuthenticateUser(String siteName, String webExID, String password) {
		
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
		  		"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n" + 
		  		"    xmlns:serv=\"http://www.webex.com/schemas/2002/06/service\">\r\n" + 
		  		"    <header>\r\n" + 
		  		"        <securityContext>\r\n" + 
		  		"          <siteName>" + siteName + "</siteName>\r\n" + 
		  		"          <webExID>" + webExID + "</webExID>\r\n" + 
		  		"          <password>" + password + "</password>            \r\n" + 
		  		"        </securityContext>\r\n" + 
		  		"    </header>\r\n" + 
		  		"    <body>\r\n" + 
		  		"       <bodyContent xsi:type=\"java:com.webex.service.binding.user.AuthenticateUser\">\r\n" + 
		  		"       </bodyContent>\r\n" + 
		  		"    </body>\r\n" + 
		  		"</serv:message>";
		
		return urlParameters;
	}
	
	public String getAPILstRecording(String siteName, String webExID, String sessionTicket, String siteID, String partnerID, String stratTime, String endTime, 
			String startFrom, String maximumNum) {
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
		  		"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n" + 
		  		"    xmlns:serv=\"http://www.webex.com/schemas/2002/06/service\">\r\n" + 
		  		"    <header>\r\n" + 
		  		"        <securityContext>\r\n" + 
		  		"          <siteName>" + siteName + "</siteName>\r\n" + 
		  		"          <webExID>" + webExID + "</webExID>\r\n";
		  		if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
		  		 
		  		urlParameters += "          <siteID>" + siteID + "</siteID>            \r\n" + 
		  		"          <partnerID>" + partnerID + "</partnerID>            \r\n" + 
		  		"          <email>" + webExID + "</email>            \r\n" + 
		  		"        </securityContext>\r\n" + 
		  		"    </header>\r\n" + 
		  		"    <body>\r\n" +
		  		"       <bodyContent xsi:type=\"java:com.webex.service.binding.ep.LstRecording\">\r\n"; 
		  		if(stratTime != "" && endTime != "" && stratTime != null && endTime != null) {
		  			urlParameters += 
		  			"            <createTimeScope>\r\n" + 
			  		"                <createTimeStart>" + stratTime + "</createTimeStart>\r\n" + 
			  		"                <createTimeEnd>" + endTime + "</createTimeEnd>\r\n" + 
			  		"            </createTimeScope>";
		  		}
		  		
		  		urlParameters += 
  				"            <listControlType>\r\n" + 
		  		"                <startFrom>" + startFrom + "</startFrom>\r\n" + 
		  		"                <maximumNum>" + maximumNum + "</maximumNum>\r\n" + 
		  		"            </listControlType>" + 
		  		"       </bodyContent>\r\n" + 
		  		"    </body>\r\n" + 
		  		"</serv:message>";
		
		return urlParameters;
	}
	
	public String GetAPIGetUser(String siteName, String webExID, String sessionTicket, String targetID) {
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n" + 
				"    xmlns:serv=\"http://www.webex.com/schemas/2002/06/service\">\r\n" + 
				"    <header>\r\n" + 
				"        <securityContext>\r\n" + 
				"          <siteName>" + siteName +  "</siteName>\r\n" + 
				"          <webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "        </securityContext>\r\n" + 
				"    </header>\r\n" + 
				"    <body>\r\n" + 
				"       <bodyContent xsi:type=\"java:com.webex.service.binding.user.GetUser\">\r\n" + 
				"            <webExId>" + targetID + "</webExId>\r\n" + 
				"        </bodyContent>\r\n" + 
				"    </body>\r\n" + 
				"</serv:message>";
		
		return urlParameters;
	}
	
	public String GetLstsummaryMeeting(String siteName, String webExID, String sessionTicket, String siteID, String partnerID, 
			String startDateStart, String startDateEnd, String endDateStart, String endDateEnd, String startFrom, String maximumNum) {
		
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>	\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"	\r\n" + 
				"    xmlns:serv=\"http://www.webex.com/schemas/2002/06/service\">	\r\n" + 
				"    <header>	\r\n" + 
				"        <securityContext>	\r\n" + 
				"          <siteName>" + siteName + "</siteName>\r\n" + 
				"          <webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "          <siteID>" + siteID + "</siteID>\r\n" + 
				"          <partnerID>" + partnerID + "</partnerID>\r\n" + 
				"          <email>" + webExID + "</email>\r\n" + 
				"        </securityContext>	\r\n" + 
				"    </header>	\r\n" + 
				"    <body>	\r\n" + 
				"       <bodyContent xsi:type=\"java:com.webex.service.binding.meeting.LstsummaryMeeting\">\r\n" + 
				"    		<listControl>\r\n" + 
				"                <startFrom>" + startFrom +  "</startFrom>\r\n" + 
				"                <maximumNum>" + maximumNum + "</maximumNum>\r\n" + 
				"                <listMethod>OR</listMethod>\r\n" + 
				"            </listControl>\r\n" + 
				"			 <order>\r\n" + 
				"            	<orderBy>STARTTIME</orderBy>\r\n" + 
				"            	<orderAD>ASC</orderAD>\r\n" + 
				"            </order>\r\n" +
				"            <dateScope>\r\n"; 
				
		if(startDateStart != "" && startDateEnd != "" && startDateStart != null && startDateEnd != null) {
			urlParameters += "            	<startDateStart>" + startDateStart + "</startDateStart>\r\n" + 
					"            	<startDateEnd>" + startDateEnd + "</startDateEnd>\r\n";
			}
		
		if(endDateStart != "" && endDateEnd != "" && endDateStart != null && endDateEnd != null) {
			urlParameters += "            	<endDateStart>" + endDateStart + "</endDateStart>\r\n" + 
					"            	<endDateEnd>" + endDateEnd + "</endDateEnd>\r\n";
			}
		
		if(startDateStart == null && startDateEnd == null && endDateStart == null && endDateEnd == null) {
			SimpleDateFormat format1 = new SimpleDateFormat ( "MM/dd/yyyy HH:mm:ss");
			Date time = new Date();
			Calendar cal = Calendar.getInstance();

			// default 현재시간 ~ 7일
			startDateStart = format1.format(time);
			cal.add(Calendar.DATE, 7);
			startDateEnd = format1.format(cal.getTime());
			
			urlParameters += "            	<startDateStart>" + startDateStart + "</startDateStart>\r\n" + 
					"            	<startDateEnd>" + startDateEnd + "</startDateEnd>\r\n";
		}
				
				
				urlParameters += 
				"            </dateScope>\r\n" + 
				"       </bodyContent>	\r\n" + 
				"    </body>	\r\n" + 
				"</serv:message>";
		
		return urlParameters;
	}
	
	public String GetAPISetMeeting(String siteName, String webExID, String sessionTicket,
			String siteID, String partnerID, String meetingPassword, String confName, String agenda, String maxUserNumber, String attendee,
			String autoRecord, String startDate, String timeZoneID, String duration, String meetingkey,
			String repeatType, String interval, String afterMeetingNumber, String dayInWeek, String expirationDate,
			String dayInMonth, String weekInMonth, String monthInYear) {
		
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r\n" + 
				"    <header>\r\n" + 
				"        <securityContext>\r\n" + 
				"          <siteName>" + siteName + "</siteName>\r\n" + 
				"          <webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "          <siteID>" + siteID + "</siteID>\r\n" + 
				"          <partnerID>" + partnerID + "</partnerID>\r\n" + 
				"          <email>" + webExID + "</email>\r\n" + 
				"        </securityContext>\r\n" + 
				"    </header>\r\n" + 
				"    <body>\r\n" + 
				"       <bodyContent xsi:type=\"java:com.webex.service.binding.meeting.SetMeeting\">\r\n" + 
				"       		<accessControl>\r\n" + 
				"                <meet:meetingPassword>" + meetingPassword + "</meet:meetingPassword>\r\n" + 
				"            </accessControl>\r\n" + 
				"            <metaData>\r\n" + 
				"                <confName>" + confName + "</confName>\r\n" + 
				"                <agenda>" + agenda + "</agenda>\r\n" + 
				"            </metaData>\r\n" + 
				"			<participants>\r\n" + 
				"                <maxUserNumber>" + maxUserNumber + "</maxUserNumber>\r\n" + 
				"                <attendees>\r\n";
				String[] attendeeArray = attendee.split(";");
				for(int i=0; i<attendeeArray.length; i++) {
					urlParameters += "                    <attendee>\r\n" + 
									"                        <person>\r\n" + 
									"                            <email>" + attendeeArray[i] + "</email>\r\n" + 
									"                        </person>\r\n" + 
									"                    </attendee>\r\n"; 	
				}
				
				urlParameters +=  "                </attendees>\r\n" + 
				"            </participants>\r\n" + 
				"            <enableOptions>\r\n" + 
				"                <chat>true</chat>\r\n" + 
				"                <poll>true</poll>\r\n" + 
				"                <audioVideo>true</audioVideo>\r\n" + 
				"                <supportE2E>TRUE</supportE2E>\r\n" + 
				"                <autoRecord>" + autoRecord + "</autoRecord>\r\n" + 
				"            </enableOptions>\r\n" + 
				"            <schedule>\r\n" + 
				"                <startDate>" + startDate + "</startDate>\r\n" + 
				"                <timeZoneID>" + timeZoneID + "</timeZoneID>\r\n" + 
				"                <duration>" + duration + "</duration>\r\n" + 
				"            </schedule>\r\n" + 
				"            <repeat>\r\n";
				
				urlParameters += "            	<repeatType>" + repeatType + "</repeatType>\r\n";
				
				String[] dayInWeekArray = null;
				switch(repeatType) {
				case "DAILY":
					if(interval != "" && interval != null) {
						urlParameters += "            	<interval>" + interval + "</interval>\r\n";
					} else {
						dayInWeekArray = dayInWeek.split(";");
						urlParameters += "            	<dayInWeek>\r\n";
						for(int i=0; i<dayInWeekArray.length; i++) {
							urlParameters += "            		<day>" + dayInWeekArray[i] + "</day>\r\n";									
						}
						urlParameters += "            	</dayInWeek>\r\n";
					}
					break;
				case "WEEKLY":
					dayInWeekArray = dayInWeek.split(";");
					urlParameters += "            	<interval>" + interval + "</interval>\r\n";
					urlParameters += "            	<dayInWeek>\r\n";
					for(int i=0; i<dayInWeekArray.length; i++) {
						urlParameters += "            		<day>" + dayInWeekArray[i] + "</day>\r\n";									
					}
					urlParameters += "            	</dayInWeek>\r\n";					
					break;
				case "MONTHLY":
					urlParameters += "            	<interval>" + interval + "</interval>\r\n";
					if(dayInMonth != "" && dayInMonth != null) {
						urlParameters += "            	<dayInMonth>" + dayInMonth + "</dayInMonth>\r\n";
					} else {
						dayInWeekArray = dayInWeek.split(";");
						urlParameters += "            	<dayInWeek>\r\n";
						urlParameters += "            		<day>" + dayInWeekArray[0] + "</day>\r\n";
						urlParameters += "            	</dayInWeek>\r\n";
					}
					break;
				case "YEARLY":
					urlParameters += "            	<monthInYear>" + monthInYear + "</monthInYear>\r\n";
					if(dayInMonth != "" && dayInMonth != null) {
						urlParameters += "            	<dayInMonth>" + dayInMonth + "</dayInMonth>\r\n";
					} else {
						dayInWeekArray = dayInWeek.split(";");
						urlParameters += "            	<weekInMonth>" + weekInMonth + "</weekInMonth>\r\n";
						urlParameters += "            	<dayInWeek>\r\n";
						urlParameters += "            		<day>" + dayInWeekArray[0] + "</day>\r\n";
						urlParameters += "            	</dayInWeek>\r\n";						
					}
					break;
				default:
					break;
				
				}
				if(expirationDate != "" && expirationDate != null) {
					urlParameters += "            	<expirationDate>" + expirationDate + "</expirationDate>\r\n";
				}
				if(afterMeetingNumber != "" && afterMeetingNumber != null) {
					urlParameters += "            	<afterMeetingNumber>" + afterMeetingNumber + "</afterMeetingNumber>\r\n";
				}
				
				urlParameters +=  "            </repeat>\r\n" + 
				"            <remind>\r\n" + 
				"                <enableReminder>true</enableReminder>\r\n" + 
				"                <sendEmail>true</sendEmail>\r\n" + 
				"                <sendMobile>true</sendMobile>\r\n" + 
				"                <emails>\r\n"; 
				for(int i=0; i<attendeeArray.length; i++) {
					urlParameters += "<email>" + attendeeArray[i] + "</email>\r\n";
				}

				urlParameters +=  "                </emails>\r\n" + 
				
				"            </remind>\r\n" + 
				"            <meetingkey>" + meetingkey + "</meetingkey>\r\n" + 
				"        </bodyContent>\r\n" + 
				"    </body>\r\n" + 
				"</serv:message>\r\n" + 
				"\r\n" + 
				"";
		
		return urlParameters;
		
	}
	
	public String GetCreateMeeting(String siteName, String webExID, String sessionTicket,
			String meetingPassword, String confName, String agenda, String maxUserNumber, String attendee, String meetingType,
			String autoRecord, String startDate, String timeZoneID, String openTime, String duration,
			String repeatType, String interval, String afterMeetingNumber, String dayInWeek, String expirationDate,
			String dayInMonth, String weekInMonth, String monthInYear) {
		
		String joinTeleconfBeforeHost = "TRUE";
		if(openTime.charAt(0) == '0') {
			joinTeleconfBeforeHost = "FALSE";
		}
		
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n" + 
				"    xmlns:serv=\"http://www.webex.com/schemas/2002/06/service\">\r\n" + 
				"    <header>\r\n" + 
				"        <securityContext>\r\n" + 
				"          <siteName>" + siteName + "</siteName>\r\n" + 
				"          <webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "        </securityContext>\r\n" + 
				"    </header>\r\n" + 
				"    <body>\r\n" + 
				"       <bodyContent\r\n" + 
				"            xsi:type=\"java:com.webex.service.binding.meeting.CreateMeeting\">\r\n" + 
				"            <accessControl>\r\n" + 
				"                <meetingPassword>" + meetingPassword + "</meetingPassword>\r\n" + 
				"            </accessControl>\r\n" + 
				"            <metaData>\r\n" + 
				"                <confName>" + confName + "</confName>\r\n" + 
				"                <meetingType>" + meetingType + "</meetingType>\r\n" + 
				"                <agenda>" + agenda + "</agenda>\r\n" + 
				"            </metaData>\r\n" + 
				"            <participants>\r\n" + 
				"                <maxUserNumber>" + maxUserNumber + "</maxUserNumber>\r\n" + 
				"                <attendees>\r\n"; 
		String[] attendeeArray = attendee.split(";");
		for(int i=0; i<attendeeArray.length; i++) {
			urlParameters += "                    <attendee>\r\n" + 
							"                        <person>\r\n" + 
							"                            <email>" + attendeeArray[i] + "</email>\r\n" + 
							"                        </person>\r\n" + 
							"                    </attendee>\r\n"; 	
		}

				urlParameters += "                </attendees>\r\n" + 
				"            </participants>\r\n" + 
				"            <enableOptions>\r\n" + 
				"                <chat>true</chat>\r\n" + 
				"                <poll>true</poll>\r\n" + 
				"                <audioVideo>true</audioVideo>\r\n" + 
				"                <supportE2E>TRUE</supportE2E>\r\n" + 
				"                <autoRecord>" + autoRecord + "</autoRecord>\r\n" + 
				"            </enableOptions>\r\n" + 
				"            <schedule>\r\n" + 
				"                <startDate>" + startDate + "</startDate>\r\n" + 
				"                <openTime>" + openTime + "</openTime>\r\n" + 
				"                <joinTeleconfBeforeHost>" + joinTeleconfBeforeHost + "</joinTeleconfBeforeHost>\r\n" + 
				"                <duration>" + duration + "</duration>\r\n" + 
				"                <timeZoneID>" + timeZoneID + "</timeZoneID>\r\n" + 
				"            </schedule>\r\n" + 
				"            <repeat>\r\n";
				
				urlParameters += "            	<repeatType>" + repeatType + "</repeatType>\r\n";
				
				String[] dayInWeekArray = null;
				switch(repeatType) {
				case "DAILY":
					if(interval != "" && interval != null) {
						urlParameters += "            	<interval>" + interval + "</interval>\r\n";
					} else {
						dayInWeekArray = dayInWeek.split(";");
						urlParameters += "            	<dayInWeek>\r\n";
						for(int i=0; i<dayInWeekArray.length; i++) {
							urlParameters += "            		<day>" + dayInWeekArray[i] + "</day>\r\n";									
						}
						urlParameters += "            	</dayInWeek>\r\n";
					}
					break;
				case "WEEKLY":
					dayInWeekArray = dayInWeek.split(";");
					urlParameters += "            	<interval>" + interval + "</interval>\r\n";
					urlParameters += "            	<dayInWeek>\r\n";
					for(int i=0; i<dayInWeekArray.length; i++) {
						urlParameters += "            		<day>" + dayInWeekArray[i] + "</day>\r\n";									
					}
					urlParameters += "            	</dayInWeek>\r\n";					
					break;
				case "MONTHLY":
					urlParameters += "            	<interval>" + interval + "</interval>\r\n";
					if(dayInMonth != "" && dayInMonth != null) {
						urlParameters += "            	<dayInMonth>" + dayInMonth + "</dayInMonth>\r\n";
					} else {
						dayInWeekArray = dayInWeek.split(";");
						urlParameters += "            	<dayInWeek>\r\n";
						urlParameters += "            		<day>" + dayInWeekArray[0] + "</day>\r\n";
						urlParameters += "            	</dayInWeek>\r\n";
					}
					break;
				case "YEARLY":
					urlParameters += "            	<monthInYear>" + monthInYear + "</monthInYear>\r\n";
					if(dayInMonth != "" && dayInMonth != null) {
						urlParameters += "            	<dayInMonth>" + dayInMonth + "</dayInMonth>\r\n";
					} else {
						dayInWeekArray = dayInWeek.split(";");
						urlParameters += "            	<weekInMonth>" + weekInMonth + "</weekInMonth>\r\n";
						urlParameters += "            	<dayInWeek>\r\n";
						urlParameters += "            		<day>" + dayInWeekArray[0] + "</day>\r\n";
						urlParameters += "            	</dayInWeek>\r\n";						
					}
					break;
				default:
					break;
				
				}
				if(expirationDate != "" && expirationDate != null) {
					urlParameters += "            	<expirationDate>" + expirationDate + "</expirationDate>\r\n";
				}
				if(afterMeetingNumber != "" && afterMeetingNumber != null) {
					urlParameters += "            	<afterMeetingNumber>" + afterMeetingNumber + "</afterMeetingNumber>\r\n";
				}
				
				urlParameters +=  "            </repeat>\r\n" + 
				"        </bodyContent>\r\n" + 
				"    </body>\r\n" + 
				"</serv:message>";
		
		return urlParameters;
	}
	
	public String GetDelMeeting(String siteName, String webExID, String sessionTicket,
			String siteID, String partnerID, String meetingKey) {
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r\n" + 
				"    <header>\r\n" + 
				"        <securityContext>\r\n" + 
				"          <siteName>" + siteName + "</siteName>\r\n" + 
				"          <webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "          <siteID>" + siteID + "</siteID>\r\n" + 
				"          <partnerID>" + partnerID + "</partnerID>\r\n" + 
				"          <email>" + webExID + "</email>\r\n" + 
				"        </securityContext>\r\n" + 
				"    </header>\r\n" + 
				"    <body>\r\n" + 
				"        <bodyContent\r\n" + 
				"            xsi:type=\"java:com.webex.service.binding.meeting.DelMeeting\">\r\n" + 
				"            <meetingKey>" + meetingKey + "</meetingKey>\r\n" + 
				"        </bodyContent>\r\n" + 
				"    </body>\r\n" + 
				"</serv:message>";
		return urlParameters;
	}
	
	public String GetLstMeetingType(String siteName, String webExID, String sessionTicket,
			String startFrom, String maximumNum) {
		
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r\n" + 
				"    <header>\r\n" + 
				"        <securityContext>\r\n" + 
				"             <siteName>" + siteName + "</siteName>\r\n" + 
				"        	<webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "        </securityContext>\r\n" + 
				"    </header>\r\n" + 
				"	<body>\r\n" + 
				"        <bodyContent xsi:type=\"java:com.webex.service.binding.meetingtype.LstMeetingType\">\r\n" + 
				"            <listControl>\r\n" + 
				"                <startFrom>" + startFrom + "</startFrom>\r\n" + 
				"                <maximumNum>" + maximumNum + "</maximumNum>\r\n" + 
				"                <listMethod>OR</listMethod>\r\n" + 
				"            </listControl>\r\n" + 
				"            <!--<meetingTypeID>232</meetingTypeID>-->\r\n" + 
				"        </bodyContent>\r\n" + 
				"    </body>\r\n" + 
				"</serv:message>";
		
		return urlParameters;
	}
	
	public String GetapiLstTimeZone(String siteName, String webExID, String sessionTicket,
			String timeZoneID) {
		
		String urlParameters = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<serv:message xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\r\n" + 
				"    <header>\r\n" + 
				"        <securityContext>\r\n" + 
				"             <siteName>" + siteName + "</siteName>\r\n" + 
				"        	<webExID>" + webExID + "</webExID>\r\n";
				if(sessionTicket.length() > 128) {
		  			urlParameters += "          <sessionTicket>" + sessionTicket + "</sessionTicket>            \r\n";
		  		} else {
		  			urlParameters += "          <password>" + sessionTicket + "</password>            \r\n";
		  		}
				urlParameters += "        </securityContext>\r\n" + 
				"    </header>\r\n" + 
				"	<body>\r\n" + 
				"        <bodyContent xsi:type=\"site.LstTimeZone\">\r\n";
		if(timeZoneID != "" && timeZoneID != null) {
			urlParameters += "			<timeZoneID>" + timeZoneID + "</timeZoneID>\r\n";
		}
				
				urlParameters += 
				"        </bodyContent>\r\n" + 
				"    </body>\r\n" + 
				"</serv:message>";
		
		return urlParameters;
	
	}
}
