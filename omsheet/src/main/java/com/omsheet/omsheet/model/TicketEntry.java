package com.omsheet.omsheet.model;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter@EqualsAndHashCode@ToString
@Entity(name = "TICKET_ENTRY_TABLE")
public class TicketEntry implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name= "Id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="Ticket_Id")
	private String ticketId;
	
	@Column(name="TicketDesc")
	private String ticketDesc;
	
	@Column(name="UserName")
	private String userName;
	
	@Column(name="HrSpent")
	private int hrsSpent;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@Column(name="StartDate")
	private LocalDate startDate;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate endDate;
}
