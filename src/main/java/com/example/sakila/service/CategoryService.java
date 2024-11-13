package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmCategory;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	public Integer removeFilmCategory(FilmCategory filmCategory) {
		return categoryMapper.deleteFilmCategory(filmCategory);
	}
	
	public Integer addFilmCategory(FilmCategory filmCategory) {
		return categoryMapper.insertFilmCategory(filmCategory);
	}
	
	public List<Map<String, Object>> getFilmCategoryListByFilm(Integer filmId) {
		return categoryMapper.selectFilmCategoryListByFilm(filmId);
	}
	
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
}
