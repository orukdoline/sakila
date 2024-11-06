package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	Actor selectActorOne(int actorId);
	
	int totalCount(String searchWord);
	
	List<Actor> selectActorList(Map<String, Object> map);
	
	public int insertActor(Actor actor);
}
