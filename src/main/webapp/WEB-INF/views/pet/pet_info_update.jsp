<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@page import="com.multi.roadpet.pet.PetInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
	<%@ include file="../../../header.jsp"%>
	<%@ include file="../../../sidebar.jsp"%>
	

</head>
<body>

   <div class="bg-light rounded h-100 p-4">
       <div style="width:60%; margin:auto;">
        <h3 class="mb-4">펫정보 수정</h3>
		
		<form action="pet_info_update2" id="form" method="post" enctype="multipart/form-data">
			
			<div class="mb-3">
				 <input type=hidden
					name="pet_id" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" value="${dto.pet_id}">
			</div>
			
			<div class="mb-3">
				<h5 style="margin-top:20px; margin-bottom:20px;">1.펫 이름</h5> <input
					name="pet_name" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" value="${dto.pet_name}">
			</div>
			<div class="mb-3">
				<h5 style="margin-top:20px; margin-bottom:20px;">2.분류</h5>
				 <select
				 	name=pet_type
					class="form-select form-select-sm mb-3"
					aria-label=".form-select-sm example">
					<option selected>펫 분류를 선택하세요</option>
					<option value="1">강아지</option>
					<option value="2">고양이</option>
					<option value="3">소동물</option>
					<option value="4">물고기</option>
				</select>
			</div>
			<div class="mb-3">
				<h5 style="margin-top:20px; margin-bottom:20px;">3.품종</h5>
				 <input name="pet_detail" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" value="${dto.pet_detail}">
			</div>
			 
			<fieldset class="row mb-3"> 
			<div class="col-sm-10"> 
			<h5 style="margin-top:20px; margin-bottom:20px;">4.성별</h5>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="pet_sex"
						id="gridRadios1" value="0" checked> <label
						class="form-check-label" for="gridRadios1" > 남 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="pet_sex"
						id="gridRadios2" value="1"> <label
						class="form-check-label" for="gridRadios2"> 여 </label>
				</div>
			</div>
			</fieldset>


			<div class="mb-3">
				<h5 style="margin-top:20px; margin-bottom:20px;">5.생년월일</h5> <input
					name="pet_birth" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" value="${dto.pet_birth}">
			</div>

		<fieldset class="row mb-3"> 
			<div class="col-sm-10">
			<h5 style="margin-top:20px; margin-bottom:20px;">6.중성화여부</h5>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="pet_neutering"
						id="gridRadios1" value="0" checked> <label
						class="form-check-label" for="gridRadios1"> 예 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="pet_neutering"
						id="gridRadios2" value="1"> <label
						class="form-check-label" for="gridRadios2"> 아니오 </label>
				</div>
			</div>
			</fieldset>
			
			<fieldset class="row mb-3"> 
			<div class="col-sm-10">
			<h5 style="margin-top:20px; margin-bottom:20px;">7.백신접종여부</h5>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="pet_vaccin"
						id="gridRadios1" value="0" checked> <label
						class="form-check-label" for="gridRadios1"> 예 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="pet_vaccin"
						id="gridRadios2" value="1"> <label
						class="form-check-label" for="gridRadios2"> 아니오 </label>
				</div>
			</div>
			</fieldset>


			<div class="input-form-box">
				<h5 style="margin-top:20px; margin-bottom:20px;">9.펫 사진</h5><input type="file" name="file" class="form-control" value="${dto.pet_photo}">
			</div>
			<br>
			<div class="button-login-box">
				<button type="submit" class="btn btn-primary">완료</button>
			</div>

		</form>
		</div>
</div>
</body>
</html>