package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.service.ActorService;
import com.example.sakila.service.FilmService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
import com.example.sakila.vo.Film;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	@Autowired ActorFileService actorFileService;
	@Autowired FilmService filmService;
	
	@GetMapping("/on/actorOne")
	public String actorOne(Model model, @RequestParam int actorId) {
		Actor actor = actorService.getActorOne(actorId);
		List<ActorFile> actorFileList = actorFileService.getActorFileListByActor(actorId);
		List<Film> filmList = filmService.getFilmTitleListByActor(actorId);
		log.debug(actor.toString());
		log.debug(actorFileList.toString());
		log.debug(filmList.toString());
		
		return "on/actorOne";
	}
	
	// /on/actorList.jsp 파일 호출.
	@GetMapping("/on/actorList")
	public String actorList(Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage, @RequestParam(required = false) String searchWord) {
		log.debug("searchWord : " + searchWord);
		
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord); // 배우 데이터 가져옴.
		
		int lastPage = actorService.getLastPage(rowPerPage, searchWord); // 마지막 페이지 정보 가져옴.
		
		// JSP에서 출력에 필요한 데이터들을 모델에 넣음.
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("actorList", actorList);
		model.addAttribute("searchWord", searchWord);
		
		// JSP 호출.
		return "on/actorList";
	}
	
	// 
	@PostMapping("/on/addActor")
	public String addActor(ActorForm actorForm, HttpSession session) { // input type="file"
		log.debug(actorForm.getFirstName());
		log.debug(actorForm.getLastName());
		log.debug("actorFile : "+actorForm.getActorFile());
		
		// ActorFile이 비어있다면 오류가 발생하기에 actorForm 인스턴스의 ActorFile이 비었다면, 수행하지 않음.
		if(actorForm.getActorFile() != null) {
			log.debug("actorFile size : " + actorForm.getActorFile().size());
		}
		
		String path = session.getServletContext().getRealPath("/upload");
		actorService.addActor(actorForm, path);
		
		return "redirect:/on/actorList";
	}	
	
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	

}