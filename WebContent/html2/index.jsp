<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>People at Clearleft</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("a").click(function(){
			var url=this.href+" h2 a";
			var args={"time":new Date()};
			//任何一个html节点都可以使用load方法加载Ajax，结果将直接插入html节点中
			$("#details").load(url,args);
			return false;
		})
	})
</script>
</head>
<body>
	<h1>People</h1>
	<ul>
		<li><a href="files/andy.html">Andy</a></li>
		<li><a href="files/richard.html">Richard</a></li>
		<li><a href="files/jeremy.html">Jeremy</a></li>
	</ul>
	<div id="details"></div>
</body>
</html>