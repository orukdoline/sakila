package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private String title;
	private String description; // NULL
	private Integer releaseYear; // NULL
	private int languageId;
	private Integer originalLanguageId; // NULL
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // NULL
	private double replacementCost;
	private String rating;
	private List<String> specialFeatures; // private String[] specialFeatures; NULL
}
