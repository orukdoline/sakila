package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService ;
	@Autowired CategoryService categoryService;
	@Autowired InventoryService inventoryService;
	
	@GetMapping("/on/modifyFilm")
	public String modifyFilm(Model model, @RequestParam int filmId) {
		log.debug("filmId : " + filmId);
		Map<String, Object> filmOne = filmService.getFilmOne(filmId); // 폼에 뿌려줄 해당 영화정보 가져오기.
		model.addAttribute("filmOne", filmOne);
		
		// specialFeatures를 쪼개서 배열로 저장.
		String[] specialFeaturesArray = ((String)filmOne.get("specialFeatures")).split(",");
		model.addAttribute("specialFeaturesArray", specialFeaturesArray);
		
		List<Language> languageList = languageService.getLanguageList(); // 언어 정보 가져오기.
		model.addAttribute("languageList", languageList);
		
		return "on/modifyFilm";
	}
	
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model, @RequestParam(required = false) Integer filmId) {
		log.debug("filmId : " + filmId);
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if (count != 0) {
//			
//			Map<String, Object> film = filmService.getFilmOne(filmId);
//			List<Actor> actorList = actorService.getActorListByFilm(filmId);
//			
//			model.addAttribute("film", film);
//			model.addAttribute("actorList", actorList);
//			model.addAttribute("removeMsgFilm", "영화가 인벤토리에 존재합니다.");
//			return "on/filmOne?filmId=" + filmId;
			return "redirect:/on/filmOne?filmId=" + filmId; // 메세지 추가는 힘듦.
		}
		filmService.removeFilmByKey(filmId);
		return "redirect:/on/filmList";
	}
	
	@GetMapping("/on/filmList")
	public String filmList(Model model, @RequestParam(required = false) Integer categoryId, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		log.debug("category : " + categoryId);
		log.debug("currentPage : " + currentPage);
		log.debug("rowPerPage : " + rowPerPage);
		
		List<Map<String, Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		log.debug("filmList : " + filmList);
		model.addAttribute("filmList", filmList);
		
		// Model에 category List 추가
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList", categoryList);
		model.addAttribute("categoryList", categoryList);
		
		// 같이 넘겨야 모델값 현재페이지, 현재카테고리ID
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentCategoryId", categoryId);
		
		// 페이징 관련 데이터
		int countRow = filmService.countFilmList(categoryId);
		int lastPage = countRow / rowPerPage;
		if (countRow % rowPerPage != 0) lastPage++;
		model.addAttribute("lastPage", lastPage);
		return "on/filmList";
	}
	
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		// filmService : FilmForm -> Film
		log.debug(filmForm.toString());
		filmService.addFilm(filmForm);
		return "redirect:/on/filmList";
		
	}
	
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		// languageList
		List<Language> languageList = languageService.getLanguageList();
		log.debug(languageList.toString());
		model.addAttribute("languageList", languageList);
		return "on/addFilm";
	}
	
	@GetMapping("/on/filmOne")
	public String filmOne(Model model, @RequestParam int filmId, @RequestParam(required = false) String searchName) {
		// 필름 정보
		Map<String , Object> film = filmService.getFilmOne(filmId);
		log.debug(film.toString());
		model.addAttribute("film", film);
		
		// 전체 카테고리
		List<Category> allCategoryList = categoryService.getCategoryList();
		log.debug(allCategoryList.toString());
		model.addAttribute("allCategoryList", allCategoryList);
		
		// 현재 필름의 카테고리
		List<Map<String, Object>> filmCategoryList = categoryService.getFilmCategoryListByFilm(filmId);
		log.debug(filmCategoryList.toString());
		model.addAttribute("filmCategoryList", filmCategoryList);
		
		// 검색 배우 리스트(searchName이 null이 아닐 때)
		if (searchName != null) { // 배우이름 검색 버튼으로 왔다면 
			List<Actor> searchActorList = actorService.getActorListByActor(searchName);
			model.addAttribute("searchActorList", searchActorList);
		}
		
		// 현재 필름의 배우 리스트
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		model.addAttribute("actorList", actorList);
		
		return "on/filmOne";
	}
}
