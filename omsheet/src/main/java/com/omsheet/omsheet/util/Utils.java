package com.omsheet.omsheet.util;

import com.omsheet.omsheet.model.TicketEntry;

public class Utils {
	public static TicketEntry copy(TicketEntry input) {
		TicketEntry output = new TicketEntry();
		output.setId(input.getId());
		output.setTicketId(input.getTicketId());
		output.setTicketDesc(input.getTicketDesc());
		output.setUserName(input.getUserName());
		output.setHrsSpent(input.getHrsSpent());
		output.setStartDate(input.getStartDate());
		output.setEndDate(input.getEndDate());
		return output;
	}

}
