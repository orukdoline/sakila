package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId;
	private String title;
	private String description; // 기본값 NULL
	private Integer releaseYear; // 기본값 NULL
	private int languageId;
	private Integer originalLanguageId;
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // 기본값 NULL
	private double replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;
}
