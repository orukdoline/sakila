package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.CategoryService;
import com.example.sakila.vo.FilmCategory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FilmCategoryController {
	@Autowired CategoryService categoryService;
	
	@GetMapping("/on/removeFilmCategory")
	public String removeFilmCategory(FilmCategory filmCategory) {
		int row = categoryService.removeFilmCategory(filmCategory);
		return "redirect:/on/filmOne?filmId=" + filmCategory.getFilmId();
	}
	
	@PostMapping("/on/addFilmCategory")
	public String addFilmCategory(FilmCategory filmCategory) {
		log.debug(filmCategory.toString());
		
		int row = categoryService.addFilmCategory(filmCategory);
		
		// filmCategoryService.addFilmCategory();
		return "redirect:/on/filmOne?filmId=" + filmCategory.getFilmId();
	}
}
