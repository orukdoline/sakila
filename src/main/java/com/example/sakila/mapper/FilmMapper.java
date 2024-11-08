package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	// /on/actorOne에서 필름을 검색할 때 
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// /on/flimList
	int insertFilm(Film film);
	
	// /on/filmOne
	Map<String, Object> selectFilmOne(int filmId);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
