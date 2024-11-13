package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmCategory;

@Mapper
public interface CategoryMapper {
	
	// /on/deleteFilmCategory
	Integer deleteFilmCategory(FilmCategory filmCategory);
	
	// /on/addFilmCategory
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer FilmId);
	// 숙제 : 카테고리 삭제 시 
	Integer deleteFilmCategoryByCategory(Integer categoryId);
	
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	List<Category> selectCategoryList();
	
}
