<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	//<!-- 노드 순환 예제 -->
	//window.addEventListener("load", function(){
	$(function() {
		//DOM 객체
		//var _chButton = document.getElemenById("ch-button");
		//jQuery 객체로 바꾸는 방법 1 : jQuery 함수 이용하기
		//var chButton = jQuery(_chButton); //이렇게 하면 jQuery 객체가 된다

		//jQuery 객체로 바꾸는 방법 2 : $ 함수 이용하기
		//var chButton = $(_chButton); 

		//jQuery 객체로 바꾸는 방법 3 : CSS Selector 이용하기
		var chButton = $("#ch-button");

		//이베트 바인딩 두 가지 옵션 : 첫번째 범용 이벤트 바인딩 함수 on()
		/* chButton.on("click", function() {
			alert("dd");
		}); */

		//이베트 바인딩 두 가지 옵션 : 두번째 특수 이벤트 바인딩 함수 click/keydown...()
		chButton.click(function() {
			/* alert("dd"); */

			//여러개의 스타일을 설정해야 하는 경우 : 방법 1
			$("#p").css("background", "red");

			//여러개의 스타일을 설정해야 하는 경우 : 방법 2
			$("#p").css({
				background : "red",
				"font-size" : "23px" // - 가 들어가서 "" 로 감싸줘야 한다
			});
		});

	});

	//--속성변경예제 --
	$(function() {
		var chImgButton = $("#ch-img-button");
		var container = $("#img-container");
		var img = $("img");
		var imgSrc = $("#img-src");

		chImgButton.click(function() {
			img.attr("src",imgSrc.val());
		});
	});
	
	//--자식노드변경예제 -->
	$(function() {
	   var chNodeButton = $("#ch-node-button");
	   var container = $("#ch-node-container");   
	   chNodeButton.click(function() {
	      //1. 텍스트 노드 추가
		   //container.textContent = "<h1>testtestset</h1>"
		   container.text("<h1>testtestset</h1>")
	      //2. 엘리먼트 노드 추가
		   //container.innerHTML = "<h1>testtestset</h1>"
		   //container.html("<h1>testtestset</h1>")
	   });
	});
	
	//<!--텍스트 노드 추가 예제 --
	$(function() {
		   var addTextNodeButton = $("#add-text-node-button");
		   var addImgNodeButton = $("#add-img-node-button");
		   var removeNodeButton = $("#remove-node-button");
		   var container = $("#node-container");   
		   
		   var remove = function(e){
		      //container.removeChild(e.target);
		      container.removeChild(this);
		   }
		   var idx = 0;
		   addTextNodeButton.click(function() {
		      //1.TextNode 생성
		      var span = $('<span />');
		      var txt = '안녕하세여'+ idx++;
		      //2. container(부모) 얻기
		      //3. 부모에 자식을 추가
		      span.append(txt);
		      container.append(span);
		      
		      span.click(remove);
		      
		   });
		   addImgNodeButton.click(function() {
		      //How to 1(성능에 좋음)
		      //1 Element 생성
		      //이 방법은 너무 DOM을 사용하는 스타일로 구현한 코드
		      /* var img = $('<img />');
		      img.attr("src","http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile25.uf.tistory.com/image/2239B038579139CF067E3D");
		      //2. container(부모) 얻기
		      //3. 부모에 자식을 추가
		      container.append(img);
		      img.click(remove); */
		      
		      $("<img src='http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile25.uf.tistory.com/image/2239B038579139CF067E3D' />")
		      .appendTo(container/*부모*/)
		      .click(remove);
		      
		      //How to 2 (성능에 좋지 않지만 편리함.-> 한두개 넣는 상황의 성능에 영향을 주지 않을 거라면 이를 사용)
		      //container.innerHTML += '<img onClick="remove()" src="http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile1.uf.tistory.com/image/2134514F579B4C7D165741" />';
		      
		      
		   });
		   removeNodeButton.click(function() {
		      // 1. 내정된 노드를 지우기
		      if(container.hasChildNodes()){
		         container.removeChild(container.lastChild);
		      }
		      // 2. 선택된 노드를 지우기
		      
		   });
		});
		
	<!--Template 태그를 이용한 노드복제 and Ajax 요청 예제 -->
	$(function(){   
		   var cloneButton = $("#ex2-clone input[value='단순복제']");
		   var ajaxButton = $("#ex2-clone input[value='Ajax요청']");
		   var tbody = $("#ex2-clone tbody");
		   var template = $("#ex2-clone template");
		   var container = $("#ex2-clone div:first-child");
		   
		   var data = [
		      {id:"1", title:"자바스크립트 야호~", writerId:"newlec"},
		      {id:"2", title:"자바도 야호~", writerId:"dragon"},
		      {id:"3", title:"둘다 ~", writerId:"wa~~~"}
		   ];
		   
		 //1.복제하기
		   cloneButton.click (function(e){
		      
			   //jQuery객체의 필드와 속성
			   
		      // 현재 브라우저가 template 태그를 지원하는지에 대한 확인
		      if('content' in template.get(0)){
		         // 1. template의 content에 값을 설정하고 노드를 복제 하는 경우
		         /* var tds = template.content.querySelectorAll("td");
		         tds[0].appendChild(document.createTextNode("1"));
		         tds[1].textContent = "test title";
		         tds[2].textContent = "newlec";
		         
		         var clone = document.importNode(template.content, true); */         
		         
		         // 2. 복제를 한 후에 content를 설정하는 경우         
		         for(var i=0; i<data.length;i++)
		         {
		        	 
		        	 var clone = $(document.importNode(template.prop("content"),true)); //jquery가 지원하지 않는기능이라서 dom기능 그냥 사용
		          //  var clone = template.clone(true);
		            
		            var tds = clone.find("td");
		            //tds.eq(0).text(tds.eq(0).html() + data[i].id); //append 대신
		            tds.eq(0).append(data[i].id)
		            tds.eq(1).text(data[i].title);
		            tds.eq(2).text(data[i].writerId);
		            
		            // 복제된 clone(tr)을 노드 트리에 추가
		            tbody.append(clone);         
		         }
		         
		      }
		      
		      /* var obj = {kor:30, eng:40, math:50};
		      
		      obj.com = 60;
		      
		      if( 'com' in obj)
		         alert(obj.kor + obj.com); */      
		   });
		   
		 
		   ajaxButton.click(function(e){
			   
/* 			   $.get("../../customer/notice-ajax",function(data){
				alert(JSON.parse(data)[0].writerName);   
			   }); */
			   
/* 			   $
			   .ajaxSetup({
					scriptCharset: "utf-8",
					contentType: "application/x-www-form-unlencoded; charset=utf-8"
			   }) */
			   
			   
			   $
			   .get("../../customer/notice-ajax") //요청
			   .done(function(data){  //성공시
					alert(data);					
			   })
 			   .fail(function(){ //실패시
				 //  console.log("공통부분");
			   })
			   .always(function(){  //성공, 실패 상관없이
				   console.log("공통부분");
				   
				}); 
			   
			   
			   
	    	  /* 2. 비동기형으로 문서를 요청한 방식 */
/* 		  	    var xhr = new XMLHttpRequest(); */
		      /* xhr.onreadystatechange = function(e){
		         if(xhr.readyState == 4)
		            data = eval(xhr.responseText);
		      }; */
/* 		      xhr.onload = function(){
		         //alert("tt");
		         data = JSON.parse(xhr.responseText);
		         // 2. ajax icon 제거
		         container.removeChild(container.lastChild);
		      };
		      xhr.onerror = function(e){
		         alert("예기치 못한 오류가 발생하였습니다.");
		      };
		      xhr.open("GET", "../../customer/notice-ajax", true);
		      xhr.send();  */  
		      // 1. ajax icon 추가
/* 		      var img = document.createElement("img");
		      img.src = "../images/ajax-loader.gif";
		      container.appendChild(img); */
		      
		      /* 1. 동기형으로 문서를 요청한 방식 */
		      /* var xhr = new XMLHttpRequest();
		      xhr.open("GET", "../../customer/notice-ajax", false);
		      xhr.send();
		      data = eval(xhr.responseText); */      
		      
		      
		   });
		   
		   
		   
		});
</script>
</head>
<body>

  <!--Template 태그를 이용한 노드복제 and Ajax 요청 예제 -->
   <div id="ex2-clone">
      <div>
         <input type="button" value="단순복제" />
         <input type="button" value="Ajax요청" />
      </div>
      <div id="clone-container">
         <table border="1">
            <thead>
               <tr>
                  <td></td>
                  <td>코드</td>
                  <td>제목</td>
               </tr>
            </thead>
            <tbody>            
            </tbody>
         </table>         
         <template>
            <tr>
               <td><input name="id" type="radio" value="1" /></td>
               <td></td>
               <td></td>
            </tr>   
         </template>
      </div>
   </div>
   <hr />
   
	<!--텍스트 노드 추가 예제 -->
   <input id="add-text-node-button" type="button" value="텍스트노드 추가" />
   <input id="add-img-node-button" type="button" value="이미지노드 추가" />
   <input id="remove-node-button" type="button" value="노드 삭제" />
   <div id="node-container"></div>
   <hr />

	<!--자식노드변경예제 -->
   <input id="ch-node-button" type="button" value="자식노드 변경" />
   <div id="ch-node-container">hello</div>
   <hr />
   
   <!--속성변경예제 -->
   <input type="text" id="img-src" />
   <input id="ch-img-button" type="button" value="이미지 변경" />
   <div id="img-container">
      <img src="http://i.huffpost.com/gen/5524070/thumbs/o-THE-570.jpg?3" />
   </div>
   <hr />
   
	<!-- 노드 순환 예제 -->
	<input id="ch-button" type="button" value="배경색 변경" />
		<div>
			<div>1</div>
			<div id="p">
				<div>2</div>
			</div>
			<div>3</div>
		</div>

</body>
</html>