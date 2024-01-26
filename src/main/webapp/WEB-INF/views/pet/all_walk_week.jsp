<%@page import="java.util.ArrayList"%>
<%@page import="com.multi.roadpet.pet.PetWalkVO"%>
<%@page import="com.multi.roadpet.pet.PetInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
	<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
	    
	  
<body>

	<%
 ArrayList<PetWalkVO> list3 =(ArrayList<PetWalkVO>)request.getAttribute("list3");
for(PetWalkVO dto : list3){
%>


<table cellspacing="10"  width="800" height="200" style="font-size:20px;">
	<tr>
		
		<th scope="col">랭킹</th>
		<th scope="col" >펫 이름</th>
		<th scope="col">시간</th>
		<th scope="col">거리</th>
	</tr>
	<tr>
		<td scope="col" align="center" style="color:red;"><%=dto.getWalk_date() %>위</td>
		<td scope="col" align="center" style="color:orange;"><%=dto.getPet_name()%></td>
		<td scope="col" align="center"><%=dto.getWalk_time()%>분</td>
		<td scope="col" align="center"><%=dto.getWalk_distance() %>m</td>
	</tr>

</table>
<hr color="orange">
<%} %>
	
</body>
</html>