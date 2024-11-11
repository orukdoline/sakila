package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Store;

@Service
@Transactional
public class StoreService {
	@Autowired StoreMapper storeMapper;
	
	public int putStore(Store store) {
		return storeMapper.insertStore(store);
	}
	
	public Map<String, Object> getStoreOne(int storeId) {
		return storeMapper.selectStoreOne(storeId);
	}
	
	public List<Map<String, Object>> getStoreListByMenu() {
		return storeMapper.selectStoreListByMenu();
	}
	
	public List<Store> getStoreList() {
		return storeMapper.selectStoreList();
	}
}
