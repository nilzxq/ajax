package com.edu.ajax.app2.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.edu.ajax.app2.beans.ShoppingCart;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/addToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //1.获取请求参数：id，price
		String bookName=request.getParameter("id");
		int price=Integer.parseInt(request.getParameter("price"));
	  //2.获取购物车对象
		HttpSession session=request.getSession();
		ShoppingCart sc=(ShoppingCart)session.getAttribute("sc");
		if(sc==null) {
			sc=new ShoppingCart();
			session.setAttribute("sc",sc);
		}
	 //3.把点击的选项加入到购物车中
		sc.addToCart(bookName,price);
	/*4.准备响应的JSON对象
	 *如果从服务器端返回JSON字符串，则属性值必须使用双引号
	 * index.jsp
	 *  $("#bookName").text(data.bookName);
	 *  $("#totalBookNumber").text(totalBookNumber);
	 *   $("#totalMoney").text(data.totalMoney);
	 *   {"bookName":"","totalBookNumber":1,"totalMoney":1}
	*/
		StringBuilder result=new StringBuilder();
		result.append("{")
		         .append("\"bookName\":\""+bookName+"\"")
		         .append(",")
		         .append("\"totalBookNumber\":"+sc.getTotalBookNumber())
		         .append(",")
		         .append("\"totalMoney\":"+sc.getTotalMoney())
		         .append("}");
		//5.响应JSON对象
		response.setContentType("text/javascript");
		response.getWriter().print(result.toString());
	}

}
