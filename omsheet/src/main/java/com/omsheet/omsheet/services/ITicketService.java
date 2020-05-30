package com.omsheet.omsheet.services;

import java.util.Collection;
import java.util.List;

import com.omsheet.omsheet.model.TicketEntry;

public interface ITicketService {

	public void deleteTicket(int ticketId);
	
	public void updateTicket(TicketEntry ticket);
	
	public Collection<TicketEntry> findAllTickets(String userName);
	
	public List<TicketEntry> findTicket(String ticketEntryId, String userName);
	
	public TicketEntry findTicket(int ticketId);
}
