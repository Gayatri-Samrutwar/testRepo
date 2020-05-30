package com.omsheet.omsheet.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.omsheet.omsheet.model.TicketEntry;
import com.omsheet.omsheet.services.ITicketService;

@RestController
public class MainRestController {
	
	@Autowired
	ITicketService ticketService;
	
	@GetMapping(value = "/findAllTickets")
	public Collection<TicketEntry> findAllTickets(){
		return ticketService.findAllTickets("Neeraj");
	}
}
