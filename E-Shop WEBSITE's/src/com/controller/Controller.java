package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Category;
import com.beans.Product;
import com.model.Account;
import com.pro.A;


public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Account account;
	private ArrayList<Product> cart_list ;
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); //null
		if(id == null){
			//go to Account
			account = new Account();
			ArrayList<Product> list = new ArrayList<>();
			try {
				list = account.fetchProducts();
			
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			A a=new A();
			TreeSet<Category> cat_list = a.getCatList(list);
			session = request.getSession();
			session.setAttribute("list", list);
			
			cart_list = new ArrayList<>(); //null
			session.setAttribute("cart_list", cart_list);
			session.setAttribute("cat_list", cat_list);
			
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); //show_product

		if(id.equals("show_product")){
			String cid = request.getParameter("cat_id");
			request.setAttribute("cid", cid);

			request.getRequestDispatcher("show_product.jsp").forward(request, response);

		}
		
		if(id.equals("show_product_details")){
			String pid = request.getParameter("pid");
			request.setAttribute("pid", pid);

			request.getRequestDispatcher("product_details.jsp").forward(request, response);

		}
		
		if(id.equals("addtocart")){
			String pid = request.getParameter("pid");
			String flag = request.getParameter("flag"); //null -- 100
			
			//cart list -- initially this is 0
			
			//addtocart -- list.add(pid)
			
			account = new Account();
			Product p = new Product();
			try {
				p = account.getProduct(pid);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cart_list.add(p);
			session = request.getSession();
			session.setAttribute("cart_list", cart_list);
			String cid = request.getParameter("cat_id");
			request.setAttribute("cid", cid);
			request.setAttribute("pid", pid);

			request.setAttribute("msg", "Product Added to Cart");
			if(flag == null)
				request.getRequestDispatcher("show_product.jsp").forward(request, response);
			else
				request.getRequestDispatcher("product_details.jsp").forward(request, response);

		}
		
		if(id.equals("showcart")){
			request.getRequestDispatcher("cart.jsp").forward(request, response);

		}
		
		if(id.equals("deletefromcart")){
			String pid = request.getParameter("pid");
			//System.out.println(pid);
			//delete entry from cart_list
			for(Product p : cart_list){
				//System.out.println(p.getPid());

				if(p.getPid().equals(pid)){
					cart_list.remove(p);
					//System.out.println(status);
					break;	

				}
			}
			session = request.getSession();
			session.setAttribute("cart_list", cart_list);
			request.getRequestDispatcher("cart.jsp").forward(request, response);

			
		}
		if(id.equals("checkout")) {
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}
	}

}











