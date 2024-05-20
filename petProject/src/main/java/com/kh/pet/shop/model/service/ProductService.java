package com.kh.pet.shop.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.pet.shop.model.vo.Product;

public interface ProductService {

	int selectListCount(HashMap<String, String> map);

	List<Product> selectAll(HashMap<String, String> map, RowBounds rowBounds);

}
