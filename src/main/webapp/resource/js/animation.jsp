<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

/*
 * 애니메이션을 구현하는 3가지
 1. 스크립트 절차를 직접 이용
 2. jQuery와 같은 라이브러리를 이용
 3. css3 애니메이션 기능 이용
 */
 
 function animate(target, to){
	 
	//timer는 null 체크 할 필요 없음~ animate에서는 당연히 만드는거니까
		var timer = setInterval(function(){
			/* item 너비를 1씩 늘리는 작업 */
			var width = parseInt(target.style.width);
			target.style.width = (width+1)+"px";
			
			if(width>to){
				clearInterval(timer);
			}
		}, 17);	
	
}
 window.addEventListener("load", function (event){
	var widthButton = document.querySelector("#ex1-tool input[value='너비늘리기']");
	var item = document.querySelector("#ex1-box .item1");
	
	
	widthButton.onclick=function(e){
		
		animate(item, 200);
		
		item.style.transform();
	};
	
	
}); 

$(function(){
	var widthButton = $("#ex1-tool input[value='너비늘리기']");
	var item = $("#ex1-box .item1");
	
	
	widthButton.click(function(e){
		//1. 한번에 변화를 주는방법 from -> to
		//item.css("width", "200px");
/* 		item.animate({
			width:"200px"
		}, 2000);  //2초 */
		
		
		//2. 기간을(duration)을 두고 변화를 주는 방법
/* 		item.animate({
			width:"200px"
				
		}, 2000, "linear", function(){
			alert("성공~!");
		}); */  //2초
		
		item.css({
			
		});
	});
	
});

</script>

<style>
  .item1{
 	width:100px; 
 	height:100px; 
 	background: yellow;
 	transition-duration:300ms;
 	transition-property:width, opacity;
 	transition-delay: 1s;
 	transition-timing-function: cubic-bezier(0.000, 0, 0.090, 0.205);
 }
/* .item1:hover{
 opacity:0.2;
 height:200px;
	width:200px;
 } */
</style>
</head>
<body>
	<!-- 너비를 변경하는 애니메이션 -->
	<div id = "ex1-tool">
		<input type="button" value="너비늘리기" />
	</div>
	<div id ="ex1-box" style="width:500px; height:300px; background: gray;" >
		<div class="item1" >
		</div>
	</div>
	<hr />
</body>
</html>