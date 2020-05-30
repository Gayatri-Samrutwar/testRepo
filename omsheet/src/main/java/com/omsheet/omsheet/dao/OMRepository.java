package com.omsheet.omsheet.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.omsheet.omsheet.model.TicketEntry;

public interface OMRepository extends CrudRepository<TicketEntry, Integer>{
	
	public List<TicketEntry> findByUserName(String userName);
	
	public List<TicketEntry> findByTicketIdAndUserName(String ticketId, String userName);
	
	
}
