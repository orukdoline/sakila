package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	//
	int updateStaff(Staff staff); // 업데이트문 하나로 모든 컬럼을 개별 수정가능하도록 함.
	
	// on/staffList.jsp - 페이지 카운트
	int selectStaffCount();
	
	// on/staffList.jsp
	List<Staff> selectStaffList(Map<String, Object> map);
	
	// on/addStaff.jsp
	int addStaff(Staff staff);
	
	// on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	// login.jsp
	Staff login(Staff staff);
}
