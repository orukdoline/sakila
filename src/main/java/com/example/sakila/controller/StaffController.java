package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.StaffService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	@Autowired StaffService staffService;
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	
	// active 수정
	@GetMapping("/on/modifyStaffActive")
	public String modifyStaffActive(Staff staff) {
		if (staff.getActive() == 1) {
			staff.setActive(2);
		} else {
			staff.setActive(1);
		}
		int row = staffService.modifyStaff(staff);  // 어떤 컬럼 값을 수정하던지 mapper 메서드는 하나임.
		return "redirect:staffList";
	}
	
	// leftMenu.a태그를 클릭하면, addStaff.주소검색.
	@GetMapping("/on/addStaff")
	public String addStaff(Model model, @RequestParam(defaultValue = "") String searchAddress) { //defaultValue : 요청에서 searchAddress 파라미터가 제공되지 않았을 경우 사용할 기본 값을 ""로 설정.
		// model(storList) 필요.
		log.debug("searchAddress : " + searchAddress);
		
		List<Store> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		// model(addressList) 필요. <- searchAddress가 공백이 아니면 검색 후
		if (searchAddress.equals("") == false) {
			List<Address> addressList = addressService.getAddressListByWord(searchAddress);
			log.debug(addressList.toString());
			model.addAttribute("addressList", addressList);
		}
		return "on/addStaff";
	}
	
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) { // 커맨드 객체 생성 -> 커맨드 객체의 set(request.getParameter()) 실행 
		log.debug(staff.toString());
		int row = staffService.insertStaff(staff);
		if (row == 0) {
			return "on/addStaff";
		} else {
			return "redirect:staffList";
		}
	}
	
	@GetMapping("/on/staffList")
	public String staffList(Model model, @RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		// model(StaffList) 필요.
		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());
		
		int lastPage = staffService.getLastPage(rowPerPage);
		
		List<Staff> staffList = staffService.getStaffList(map);
		model.addAttribute("staffList", staffList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "on/staffList";
	}

	@GetMapping("/on/staffOne")
	public String staffOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffService.getStaffOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		return "on/staffOne";
	}
}
