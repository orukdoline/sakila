package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;
//DB 관련 트랜젝션이 아니고, Spring 관련 트랜젝션.
@Service
@Transactional 
public class StaffService {
	@Autowired StaffMapper staffMapper;
	
	public int getLastPage(int rowPerPage) {
		int count = staffMapper.selectStaffCount();
		int lastPage = count / rowPerPage;
		if (count % rowPerPage != 0) lastPage++;
		return lastPage;
	}
	
	public Map<String, Object> getStaffOne(int staffId) {
		return staffMapper.selectStaffOne(staffId);
	}
	
	public List<Staff> getStaffList(Map paramMap) {
		return staffMapper.selectStaffList(paramMap);
	}
	
	public int insertStaff(Staff paramStaff) {
		return staffMapper.addStaff(paramStaff);
	}
	public int modifyStaff(Staff paramStaff) {
		return staffMapper.updateStaff(paramStaff);
	}
	
	public Staff login(Staff paramStaff) {
		return staffMapper.login(paramStaff);
	}
	
}
