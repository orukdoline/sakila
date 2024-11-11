package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	int insertStore(Store store);
	
	Map<String, Object> selectStoreOne(int storeId);
	
	List<Map<String, Object>> selectStoreListByMenu();
	
	List<Store> selectStoreList();
}
