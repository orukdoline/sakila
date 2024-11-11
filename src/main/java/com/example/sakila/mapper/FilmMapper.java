package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper
public interface FilmMapper {
	// film 목록 개수
	int countFilmList(Integer categoryId);
	
	// categoryId가 null이거나 0이 아닐때
	List<Map<String, Object>> selectFilmListByCategory(Map<String, Object> paramMap);
	
	// categoryId가 null이거나 0일때
	List<Map<String, Object>> selectFilmList(Map<String, Object> paramMap);
	
	// /on/actorOne에서 필름을 검색할 때 
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// /on/flimList
	int insertFilm(Film film);
	
	// /on/filmOne
	Map<String, Object> selectFilmOne(int filmId);
	
	// /on/actorOne
	List<Film> selectFilmTitleListByActor(int actorId);
}
