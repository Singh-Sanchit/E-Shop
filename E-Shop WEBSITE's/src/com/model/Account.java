package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Category;
import com.beans.Product;


public class Account {

	private String username= "root";
	private String password="040916030411";
	private String url="jdbc:mysql://localhost:3306/shop";
	private String driver="com.mysql.jdbc.Driver";
	Connection con; //null
	
	private void dbConnect() throws ClassNotFoundException, SQLException{
		Class.forName(driver); //Register Driver
		 con = DriverManager.getConnection(url,username,password); //Create Conn and save
		
	}
	
	private void dbClose() throws SQLException {
		con.close();
	}
	

	public ArrayList<Product> fetchProducts() throws SQLException, ClassNotFoundException {
		dbConnect();
		String sql="SELECT * FROM product,category where category.cat_id = product.cat_id";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rst = pstmt.executeQuery();
		ArrayList<Product> list = new ArrayList<>();

		while(rst.next()){
			String pid = rst.getString("id");
			String pname = rst.getString("name");
			String price = rst.getString("price");
			String short_desc = rst.getString("short_desc");
			String description = rst.getString("description");
			String image = rst.getString("image");
			int cat_id = rst.getInt("cat_id");
			String cat_name = rst.getString("cname");
			String status = rst.getString("status");
			//ArrayList
			Product p = new Product();
			Category c = new Category();

			p.setPid(pid);
			p.setPname(pname);
			p.setPrice(price);
			p.setShort_desc(short_desc);
			p.setDescription(description);
			p.setImage(image);
			c.setId(cat_id);
			c.setName(cat_name);
			c.setStatus(status);
			p.setCat(c);
			list.add(p); //
		}
		dbClose();
		return list;
	}

	public void addCategory(String name) throws Exception {
		dbConnect();
		String sql="insert into category(cname) values(?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.executeUpdate();
		dbClose();		
	}
 public void addProduct(String cat_id, String pname, String pprice,
			String short_desc, String description)  throws Exception{
		dbConnect();
		String sql="insert into product(name,price,short_desc,description,cat_id) values(?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setString(2, pprice);
		pstmt.setString(3, short_desc);
		pstmt.setString(4, description);
		pstmt.setString(5, cat_id);

		pstmt.executeUpdate();
		dbClose();
		
	}

		public void deActivateCategory(String cat_id)  throws Exception{
			dbConnect();
			String sql="update category set status=? where cat_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "false");
			pstmt.setString(2, cat_id);
			pstmt.executeUpdate();
			dbClose();
			
		}

		public void activateCategory(String cat_id) throws Exception{
			dbConnect();
			String sql="update category set status=? where cat_id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "true");
			pstmt.setString(2, cat_id);
			pstmt.executeUpdate();
			dbClose();
			
		}

		public Product getProduct(String pid) throws Exception{
			dbConnect();
			String sql="select * from product,category where product.cat_id = category.cat_id AND id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(pid));
			Product p = new Product();

			ResultSet rst = pstmt.executeQuery();
			while(rst.next()){
				String id = rst.getString("id");
				String pname = rst.getString("name");
				String price = rst.getString("price");
				String short_desc = rst.getString("short_desc");
				String description = rst.getString("description");
				String image = rst.getString("image");
				int cat_id = rst.getInt("cat_id");
				String cat_name = rst.getString("cname");
				String status = rst.getString("status");
				//ArrayList
				Category c = new Category();

				p.setPid(id);
				p.setPname(pname);
				p.setPrice(price);
				p.setShort_desc(short_desc);
				p.setDescription(description);
				p.setImage(image);
				c.setId(cat_id);
				c.setName(cat_name);
				c.setStatus(status);
				p.setCat(c);
			}
			dbClose();

			return p;
		}

}








