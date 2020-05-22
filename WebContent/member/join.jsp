<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type="text/css">	
	.input { width:500px;  }
	label{margin-top: 10px;}
</style>



<div id="wrap">
	<h1>회원가입</h1>	
	<form method="post" action="${pageContext.request.contextPath }/member/join.do">
		<label for="exampleInputEmail1">아이디*</label>
		<div class="input input-group mb-3"> 	
		  <input type="text" name="id" id="id" onkeyup="idvalidate()" class="form-control" placeholder="사용할 아이디를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-btn">
		    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="idcheck()" >중복확인</button> 	
		  </div>
		</div>
		 <div id="idval"></div>
		 <div id="idcheck"></div>		
		
		
		<label for="exampleInputEmail1">비밀번호* </label>
		<div class="input input-group mb-3"> 	
		  <input type="password" name="pwd" id="pwd" onkeyup="pwdval()" onkeyup="idvalidate()" class="form-control" placeholder="사용할 비밀번호를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">	
		</div>
		<div id="pwdval"></div>
			
		<label for="exampleInputEmail1">비밀번호확인* </label>
		<div class="input input-group mb-3"> 	
		  <input type="password" name="pwdCheck" id="pwdCheck" onkeyup="pwddouble()" class="form-control" placeholder="똑같은 비밀번호를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">	
		</div>
		<div id="pwddiv"></div> 
			
		<label for="exampleInputEmail1">이름* </label>	
		<div class="input input-group mb-3"> 	
		  <input type="text" name="name" class="form-control" placeholder="이름을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">	
		</div>
		
	
		<label for="exampleInputEmail1">이메일* </label>		
		<div class="input input-group mb-3"> 	
		  <input type="text"  name="email" id= "email" class="form-control" placeholder="이메일을 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
		  <div class="input-group-btn">
		    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="emailCheck()">이메일중복확인</button>	
		  </div>
		</div>
		<div id="emailcheck"></div>
		
		<label for="exampleInputEmail1">전화번호* </label>	
		<div class="input input-group mb-3"> 	
		  <input type="text" name="phone" class="form-control" placeholder="전화번호를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">	
		</div>	
		
		<label for="exampleInputEmail1">배송주소* </label>	
		<div class="input input-group mb-3"> 	
		  <input type="text" name="addr" class="form-control" placeholder="주소를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">	
		</div>	
			
		<label for="exampleInputEmail1">성별 </label><br>
		
		<input type="radio" name="gender" value="1" >남자 &nbsp&nbsp&nbsp
		<input type="radio" name="gender" value="2" >여자<br>
		
			
		<label for="exampleInputEmail1">생년월일 </label>	
		<div class="input input-group mb-3"> 	
		  <input type="text" name="birth" class="form-control" placeholder="YYYY/MM/DD" aria-label="Recipient's username" aria-describedby="button-addon2">	
		</div>	
			
		<input type="submit" value="가입하기">
	</form>
</div>


<script>
	var xhr = null;
	function idcheck(){
		var id = document.getElementById("id").value;
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange= function() {
			if(xhr.readyState==4 && xhr.status==200){
				var data = xhr.responseText;
				var json = JSON.parse(data);
				//if(eval(using)==true)
				var div = document.getElementById("idcheck");

				if(json.check==true){
					div.innerHTML=	"이미가입된 회원입니다.";
					div.style.color="red";
				}else{
					div.innerHTML="가입가능한 아이디입니다.";
					div.style.color="green";
				}		
			}
		};
		xhr.open('get','${pageContext.request.contextPath }/member/idcheck.do?id='+id, true);
		xhr.send();
	}
	
	
	
	var xhrval;
	function idvalidate() {
		var id = document.getElementById("id").value;
		xhrval = new XMLHttpRequest();
		xhrval.onreadystatechange=function() {
			if(xhrval.readyState==4 && xhrval.status==200){
				var data = xhrval.responseText;
				var json = JSON.parse(data);
				//if(eval(using)==true)
				var div = document.getElementById("idval");

				if(json.msg==true){
					div.innerHTML=	"아이디는 4자 이상으로 기입하세요.";
					div.style.color="red";
				}else{
					div.innerHTML="4자이상으로 입력하셨습니다.";
					div.style.color="green";
				}			
			}
		};
		xhrval.open('get','${pageContext.request.contextPath }/member/idval.do?id='+id, true);
		xhrval.send();
	}
	
	
	
	var xhr3
	function pwdval() {
		var pwd = document.getElementById("pwd").value;
		xhr3 = new XMLHttpRequest();
		xhr3.onreadystatechange= function(){
			if (xhr3.readyState==4 && xhr3.status==200) {
				var data = xhr3.responseText;
				var json = JSON.parse(data);
				var div = document.getElementById("pwdval");
				
				if(json.msg==true){
					div.innerHTML=	"비밀번호는 6자 이상으로 기입하세요.";
					div.style.color="red";
				}else{
					div.innerHTML="6자이상으로 입력하셨습니다.";
					div.style.color="green";
				}				
			}
		};
		xhr3.open('get','${pageContext.request.contextPath }/member/pwdval.do?pwd='+pwd, true);
		xhr3.send();
	}
	
	
	
	function pwddouble(){
		var pwd = document.getElementById("pwd").value;
		var pwdCheck = document.getElementById("pwdCheck").value;
		var div = document.getElementById("pwddiv");
		
		if(pwd==pwdCheck){
			div.innerHTML="일치하는 비밀번호입니다.";
			div.style.color="green";
		}else{
			div.innerHTML="비밀번호가 일치하지 않습니다."
			div.style.color="red";
		}
	}
	
	
	var xhr4 = null;
	function emailCheck(){
		var email = document.getElementById("email").value;
		xhr4 = new XMLHttpRequest();
		xhr4.onreadystatechange= function() {
			if(xhr4.readyState==4 && xhr4.status==200){
				var data = xhr4.responseText;
				var json = JSON.parse(data);
				var div = document.getElementById("emailcheck");

				if(json.check==true){
					div.innerHTML=	"이미 사용중인 이메일입니다.";
					div.style.color="red";
				}else{
					div.innerHTML="사용가능한 이메일입니다.";
					div.style.color="green";
				}		
			}
		};
		xhr4.open('get','${pageContext.request.contextPath }/member/emailCheck.do?email='+email, true);
		xhr4.send();
	}

</script>
