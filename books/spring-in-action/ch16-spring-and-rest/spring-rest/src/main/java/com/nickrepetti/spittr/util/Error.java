package com.nickrepetti.spittr.util;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum Error {
	
	// General exception was thrown
	GENERAL(1,"Oops, something went wrong."),
	
	// Any error relating to database operations
	DATABASE(2, "Oops, something went wrong."),
	
	// Invalid REST url parameter for a request
	INVALID_PARAMETER(3, "The resource that you have requested was not found."),
	
	// Missing parameter for a request
	MISSING_PARAMETER(4, "The resource that you have requested was not found."),
	
	// Could not find resource
	RESOURCE_NOT_FOUND(5, "The resource that you have requested was not found."),
	
	// Spittle with given ID not found
	SPITTLE_NOT_FOUND(6, "The resource that you have requested was not found.");

	private final int errorCode;
	private final String message;

	private Error(int errorCode, String message) {
		this.errorCode = errorCode;
		this.message = message;
	}
	
	public int getErrorCode() {
		return errorCode;
	}
	
	public String getMessage() {
		return message;
	}
}
