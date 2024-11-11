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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	@Autowired StaffService staffService;
	
	@GetMapping("/on/addStore")
	public String addStore(Model model, @RequestParam(defaultValue = "") String searchAddress, @RequestParam(defaultValue = "") String searchStaff) {
		
		if (searchAddress.equals("") == false) {
			List<Address> addressList = addressService.getAddressListByWord(searchAddress);
			log.debug("addressList : " + addressList);
			model.addAttribute("addressList", addressList);
		}
		
		Map<String, Object> staffMap = new HashMap<>();
		staffMap.put("beginRow", null);
		staffMap.put("rowPerPage", null);
		List<Staff> staffList = staffService.getStaffList(staffMap);
		log.debug(searchStaff.toString());
		model.addAttribute("staffList", staffList);
		return "on/addStore";
	}
	
	@PostMapping("/on/addStore")
	public String addStore(Store store) {
		storeService.putStore(store);
		return "redirect:/on/storeList";
	}
	
	@GetMapping("/on/storeList")
	public String storeList(Model model) {
		List<Map<String, Object>> storeListByMenu = storeService.getStoreListByMenu();
		log.debug("storeListByMenu : " + storeListByMenu);
		model.addAttribute("storeListByMenu", storeListByMenu);
		return "on/storeList";
	}
	
	@GetMapping("/on/storeOne")
	public String storeOne(Model model, @RequestParam int storeId) {
		Map<String, Object> storeOne = storeService.getStoreOne(storeId);
		log.debug("storeOne : " + storeOne);
		model.addAttribute("storeOne", storeOne);
		return "on/storeOne";
	}
}
