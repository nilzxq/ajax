<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>People at Clearleft</title>
<script type="text/javascript">
	window.onload = function() {
		var aNodes = document.getElementsByTagName("a");
		for(var i=0;i<aNodes.length;i++){
			aNodes[i].onclick=function(){
				var request=new XMLHttpRequest();
				var method="GET";
				var url=this.href;
				
				request.open(method,url);
				request.send(null);
				 
				request.onreadystatechange=function(){
					if(request.readyState==4){
						if(request.status==200||request.status==304){
						//1.结果为XML格式，所以需要使用responseXML来获取
						var result=request.responseXML;
						//2.结果不能使用，必须先创建对应的节点，再把节点加入到#details中
						//目标格式为：
						/*
						<h2><a href="mailto:andy@clearleft.com">Andy Budd</a></h2>
                        <a href="http://anybudd.com/">http://andybudd.com/</a>
						*/
						var name=result.getElementByTagName("name")[0].firstchild.nodeValue;
						var website=result.getElementByTagName("website")[0].firstchild.nodeValue;
						var email=result.getElementByTagName("email")[0].firstchild.nodeValue;
						//alert(name);
						//alert(website);
						//alert(email);
						var aNode=document.createElement("a");
						aNode.appendChild(document.createTextNode(name));
						aNode.href="mailto:"+email;
						
						var h2Node=document.createElement("h2");
						h2Node.appendChild(aNode);
						
						var aNode2=document.createElement("a");
						aNode2.appendChild(document.creatTextNode(website));
						aNode2.href=website;
						
						var detailsNode=document.getElementById("details");
						detailsNode.innerHtml="";
						detailsNode.appendChild(aNode2);
						detailsNode.appendChild(h2Node);
						
						}
					}
				}
				return false;
			}
		
		}
	
	}
</script>
</head>
<body>
	<h1>People</h1>
	<ul>
		<li><a href="files/andy.xml">Andy</a></li>
		<li><a href="files/richard.xml">Richard</a></li>
		<li><a href="files/jeremy.xml">Jeremy</a></li>
	</ul>
	<div id="details"></div>
</body>
</html>