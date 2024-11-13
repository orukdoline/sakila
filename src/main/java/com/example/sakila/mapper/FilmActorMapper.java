package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// 필름 삭제 시 film_actor들 삭제
	Integer deleteFilmActorByFilm(int filmId);
	
	// /on/removeActor 삭제하기 위한 메서드. - 배우랑 관련된 파일 모두 삭제.
	int deleteFileActorByActor(int actorId);
	
	int deleteFilmActor(FilmActor filmActor);
	
	int insertFilmActor(FilmActor filmActor);
}
