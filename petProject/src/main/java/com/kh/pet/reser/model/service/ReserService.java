package com.kh.pet.reser.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.pet.place.model.vo.Place;

public interface ReserService {
	
	List<Place> selectHospital();
	
	List<Place> searchPlace(HashMap<String, String> map);
	
	
	
	
	
	
	
	
	
}