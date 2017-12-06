package com.edu.ajax.app2.test;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

/** 
* @classDes:功能描述:()
* @author zxq 
* @version date：2017年12月6日 下午3:33:20 
*/
public class Customer {

	
	private String name;
	private String id;
	public Customer(String name, String id) {
        this.name=name;
        this.id=id;
	}
	public String getCustomerName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCity() {
		return "BeiJing";
	}
	@JsonIgnore
	public String getBirth() {
		return "1990-01-01";
	}
	public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
		//1.导入jar包
		//2.创建ObjectMapper对象
		ObjectMapper mapper=new ObjectMapper();
        //3.调用mapper的writeValueAsString()方法	把一个对象转为Json字符串
	    Customer customer=new Customer("nilzzzz","1001");
	    String jsonStr=mapper.writeValueAsString(customer);
	    System.out.println(jsonStr);
	    
	    //4.注意：JackSon使用getter方法来定位JSON对象的属性！！！！！
	    //5.可以通过添加注解org.codehaus.jackson.annotate.JsonIgnore
	    //忽略某一个getter定义的属性
	    
	    List<Customer> customers=Arrays.asList(customer,new Customer("BCD","2002"));
	    jsonStr=mapper.writeValueAsString(customers);
	    System.out.println(jsonStr);
	}
}
