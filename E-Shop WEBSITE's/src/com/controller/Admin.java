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

public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Account account;
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
			
			
			session.setAttribute("cat_list", cat_list);
			
			request.setAttribute("msg", "");

			request.getRequestDispatcher("WEB-INF/admin/login.jsp").forward(request, response);
		}
		else{
			doPost(request,response);
		}
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); //login_form
		if(id.equals("login_form")){
			String username = request.getParameter("username"); //admin
			String password = request.getParameter("password"); //1234
			if(username.equals("admin") && password.equals("1234")){
				request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("msg", "Invalid username/password");
				request.getRequestDispatcher("WEB-INF/admin/login.jsp").forward(request, response);

			}
		}
		
		if(id.equals("add_category")){
			request.getRequestDispatcher("WEB-INF/admin/add_category.jsp").forward(request, response);

		}
		
		if(id.equals("add_product")){
			request.getRequestDispatcher("WEB-INF/admin/add_product.jsp").forward(request, response);

		}
		
		
		
		if(id.equals("add_category_form")){
			String name = request.getParameter("name");
			 account = new Account();
			 try {
				account.addCategory(name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 request.setAttribute("msg", "Category Added to System");
			 
			
			request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);

		}
		if(id.equals("add_product_form")){
			String cat_id = request.getParameter("cat_id");
			String pname = request.getParameter("pname");
			String pprice = request.getParameter("pprice");
			String short_desc = request.getParameter("short_desc");
			String description = request.getParameter("description");
			
			try {
				account.addProduct(cat_id,pname,pprice,short_desc,description);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 request.setAttribute("msg", "product Added to System");

			request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);

		}
		
		if(id.equals("delete_cat")){
			String cat_id = request.getParameter("cat_id");
			account = new Account();
			 try {
				account.deActivateCategory(cat_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 TreeSet<Category> clist = (TreeSet<Category>)session.getAttribute("cat_list");
			 for( Category c: clist){
				 if(c.getId() == Integer.parseInt(cat_id)){
					 c.setStatus("false");
				 }
			 }
			 session = request.getSession();
			 session.setAttribute("cat_list", clist);
			 request.setAttribute("msg", "Category deactivated from System");
			 
			
			request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);


		}
		
		
		
		if(id.equals("activate_cat")){
			String cat_id = request.getParameter("cat_id");
			account = new Account();
			 try {
				account.activateCategory(cat_id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 TreeSet<Category> clist = (TreeSet<Category>)session.getAttribute("cat_list");
			 for( Category c: clist){
				 if(c.getId() == Integer.parseInt(cat_id)){
					 c.setStatus("true");
				 }
			 }
			 session = request.getSession();
			 session.setAttribute("cat_list", clist);
			 request.setAttribute("msg", "Category activated again in the System");
			 
			
			request.getRequestDispatcher("WEB-INF/admin/index.jsp").forward(request, response);


		}
	}

}
