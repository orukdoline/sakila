package com.example.sakila.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorFileService {
	@Autowired ActorFileMapper actorFileMapper;
	
	// on/removeActorFile
	// 1) actor_file 삭제
	// 2) 물리적 파일삭제(이름필요, 경로필요)
	public void removeActorFile(int actorFileId, String path) {
		// 1) 데이터베이스에서 삭제되기 전에 물리적인 파일이름을 먼저 가져오기.
		ActorFile actorFile = actorFileMapper.selectActorFileOne(actorFileId); // 삭제할 actorFile 물리적 파일이름 정보.
		int row = actorFileMapper.deleteActorFile(actorFileId);
		if (row == 1) { // 데이터베이스에서 actor_file 정보가 삭제되었다면 물리적 파일 삭제.
			String fullname = path + actorFile.getFilename() + "." + actorFile.getExt();
			File f = new File(fullname);
			f.delete();
		}
	}
	
	// on/addActorFile
	public void addActorFile(ActorForm actorForm, String path) {
		if(actorForm != null) {
			 // 파일 입력, ActorFile 입력
			 List<MultipartFile> list = actorForm.getActorFile();
			 for(MultipartFile mf : list) {
				 ActorFile actorFile = new ActorFile();
				 
				 actorFile.setActorId(actorForm.getActorId());
				 actorFile.setType(mf.getContentType());
				 actorFile.setSize(mf.getSize());
				 String filename = UUID.randomUUID().toString().replace("-", "");
				 actorFile.setFilename(filename);
				 int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				 String originname = mf.getOriginalFilename().substring(0, dotIdx);
				 String ext = mf.getOriginalFilename().substring(dotIdx+1);
				 actorFile.setOriginname(originname);
				 actorFile.setExt(ext);
				 
				 int row2 = actorFileMapper.insertActorFile(actorFile);
				 if(row2 == 1) {
					 // 물리적 파일 저장
					 try {
						mf.transferTo(new File(path + filename +"."+ ext));
					 } catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						throw new RuntimeException();
					 }	 
				 }
			 }
		 }
	}
	
	// /on/actorOne에서 파일리스트 가져옴.
	public List<ActorFile> getActorFileListByActor(int actorId) {
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
}