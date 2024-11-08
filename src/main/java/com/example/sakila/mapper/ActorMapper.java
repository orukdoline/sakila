package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	int deleteActor(int actorId);
	
	// /on/modifyActor
	int updateActor(Actor actor);
	
	// /on/filmOne
	List<Actor> selectActorListByFilm(int filmId);
	
	Actor selectActorOne(int actorId);
	
	int totalCount(String searchWord);
	
	List<Actor> selectActorList(Map<String, Object> map);
	
	int insertActor(Actor actor);
}