package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmActorController {
	@Autowired FilmActorService filmActorService;
	
	@GetMapping("/on/removeFilmActorByFilm")
	public String removeFilmActorByFilm(FilmActor filmActor) {
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		int row = filmActorService.removeFilmActor(filmActor);
		return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
	
	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		int row = filmActorService.removeFilmActor(filmActor);
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	// redirect:/on/filmOne으로 가는거.
	@PostMapping("/on/addFilmActorByFilm")
	public String addFilmActorByFilm(FilmActor filmActor) {
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		int row = filmActorService.addFilmActor(filmActor);
		return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
	
	// redirect:/on/actorOne으로 가는거.
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(FilmActor filmActor) {
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		int row = filmActorService.addFilmActor(filmActor);
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
}
