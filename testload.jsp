<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(function(){
	$("a").click(function(){
		//使用load方法处理Ajax
		var url=this.href;
		var args={"time":new Date()};
		$("#content").load(url,args);
		return false;
	})
})
</script>
</head>
<body>
	<a href="helloAjax.txt">HelloAjax</a>
	<div id="content"></div>
</body>
</html>