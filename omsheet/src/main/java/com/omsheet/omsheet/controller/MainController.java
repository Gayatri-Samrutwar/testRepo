package com.omsheet.omsheet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.omsheet.omsheet.model.TicketEntry;
import com.omsheet.omsheet.services.ITicketService;
import com.omsheet.omsheet.util.Utils;

@Controller
public class MainController {
	
	@Autowired
	ITicketService ticketService;
	
	@GetMapping("/")
	public String init(HttpServletRequest request) {
		request.setAttribute("tickets", ticketService.findAllTickets("Neeraj"));
		return "index";
	}
	
	@GetMapping("/view")
	public ModelAndView viewTicket(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("tickets", ticketService.findAllTickets("Neeraj"));
		mv.addObject("mode", "TICKET_VIEW");
		return mv;
	}
	
	@PostMapping("/save")
	public ModelAndView updateTicket(TicketEntry ticket) {
		
		ModelAndView mv = new ModelAndView("redirect:/view");
		ticketService.updateTicket(ticket);
		mv.addObject("tickets", ticketService.findAllTickets("Neeraj"));
		mv.addObject("mode", "TICKET_VIEW");
		return mv;
	}
	
	@GetMapping("/add")
	public ModelAndView addTicket() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("mode", "TICKET_ADD");
		return mv;
	}
	
	@GetMapping("/edit")
	public ModelAndView editTicket(@RequestParam int id) {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("ticket", Utils.copy(ticketService.findTicket(id)));
		mv.addObject("mode", "TICKET_EDIT");
		return mv;
	}
	
	@GetMapping("/delete")
	public ModelAndView deleteTicket(@RequestParam int id) {
		ModelAndView mv = new ModelAndView("redirect:/view");
		ticketService.deleteTicket(id);
		mv.addObject("tickets", ticketService.findAllTickets("Neeraj"));
		mv.addObject("mode", "TICKET_VIEW");
		return mv;
	}
	
	
	
}
