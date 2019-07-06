package com.pro;

import java.util.ArrayList;
import java.util.TreeSet;

import com.beans.Category;
import com.beans.Product;

public class A {
TreeSet<Category> c=new TreeSet<>();
	public TreeSet<Category> getCatList(ArrayList<Product> list) {
		for(Product p : list){
			int id = p.getCat().getId();
			String name = p.getCat().getName();
			String status = p.getCat().getStatus();
			Category cat = new Category(); //1000x 2000x 3000x
			cat.setId(id);
			cat.setName(name);
			cat.setStatus(status);
			c.add(cat);//mobiles 
		}
		return c;
	}

}
