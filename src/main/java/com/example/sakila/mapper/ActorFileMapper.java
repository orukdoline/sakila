package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	// /on/removeActor 삭제하기 위한 메서드.
	int deleteActorFileByActor(int actorId);
	
	// on/removeActorFile - ActorFileService에서 물리적인 파일 이름을 가져오기 위함.
	ActorFile selectActorFileOne(int actorFileId);
	
	// /on/removeActorFile - actorOne에서 배우삭제기능.
	int deleteActorFile(int actorFileId);
	
	// /on/actorOne
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	int insertActorFile(ActorFile actorFile);
}
