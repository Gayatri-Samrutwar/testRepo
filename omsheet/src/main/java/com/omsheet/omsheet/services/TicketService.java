package com.omsheet.omsheet.services;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omsheet.omsheet.dao.OMRepository;
import com.omsheet.omsheet.model.TicketEntry;
import com.omsheet.omsheet.util.Utils;

@Service
public class TicketService implements ITicketService{
	
	@Autowired
	OMRepository repository;

	@Override
	public void deleteTicket(int ticketId) {
		repository.deleteById(ticketId);
	}
	
	@Override
	public void updateTicket(TicketEntry ticket) {
		repository.save(ticket);
	}
	
	@Override
	public Collection<TicketEntry> findAllTickets(String userName) {
		Collection<TicketEntry> result = new LinkedList<TicketEntry>();
		for (TicketEntry ticketEntry : repository.findByUserName(userName)) {
			result.add(Utils.copy(ticketEntry));
		}
		return result; 
	}
	
	@Override
	public List<TicketEntry> findTicket(String ticketEntryId, String userName) {
		return repository.findByTicketIdAndUserName(ticketEntryId, userName);
	}
	
	@Override
	public TicketEntry findTicket(int ticketId) {
		return Utils.copy(repository.findById(ticketId).get());
	}
	
}
