package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.vo.FilmActor;

@Service
@Transactional
public class FilmActorService {
	@Autowired FilmActorMapper filmActorMapper;
	
	public int removeFilmActor(FilmActor filmActor) {
		return filmActorMapper.deleteFilmActor(filmActor);
	}
	public int addFilmActor(FilmActor filmActor) {
		return filmActorMapper.insertFilmActor(filmActor);
	}
}
