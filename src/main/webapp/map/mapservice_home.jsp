<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle" %>
<%
	ResourceBundle rb = ResourceBundle.getBundle("db");
	String APPKEY = rb.getString("db.KAKAO_API");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../resources/css/mapservice.css">
		<title>로드펫-지도 홈</title>		
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="" name="keywords">
	    <meta content="" name="description">
		
		<!-- Script Setting -->
		<script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=APPKEY%>&libraries=services,clusterer"></script>
   	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
	    
	    <!-- Icon Font Stylesheet -->
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
	    <!-- Libraries Stylesheet -->
	    <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
	    <link href="../resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
	
	    <!-- Customized Bootstrap Stylesheet -->
	    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Template Stylesheet -->
	    <link href="../resources/css/style.css" rel="stylesheet">
	</head>
	<body>
		<div class="container-fluid position-relative bg-white d-flex p-0">
			<!-- Spinner -->
	        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
	            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
	                <span class="sr-only">Loading...</span>
	            </div>
	        </div>

			<!-- Content Start -->
			<div class="content open">
				<!-- Navbar & Sidebar -->
				<%@ include file="../header.jsp"%>
				<%@ include file="../sidebar.jsp"%>
					<div id="alertContainer"></div>
				<!-- Map Start -->
				<div class="container-fluid">
	                <div class="row vh-100 bg-light rounded align-items-start justify-content-center mx-0">
	                	<div class="mapWrapper">
	                		<div id="map" style="width:100%;height:100%;"></div>
	                		<!-- 검색 목록 테스트 -->
	                		<div id="menu_wrap" class="bg_white" style="visibility:hidden;">
						        <div class="option">리스트를 누르면 상세 페이지 창이 열립니다.</div>
						        <hr>
						        <ul style="padding-left:0px;" id="placesList"></ul>
						        <div id="pagination"></div>
						    </div>
	                		<!-- Custom Controller -->
						    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						    <div class="custom_zoomcontrol radius_border"> 
						    	<button type="button" class="btn zoom-btn zoomin mt-1" onClick="javascript:zoomIn();"></button>
						    	<button type="button" class="btn zoom-btn zoomout mt-2" onClick="javascript:zoomOut();"></button>
						    </div>
	                		
	                		<!-- Category -->
	                		<ul style="padding-left:0px;" id="category">
								<li id="missingMark" data-order="0"> 
									<span class="category_bg missing-c"></span>
									실종
								</li>       
								<li id="shelterMark" data-order="1"> 
									<span class="category_bg shelter-c"></span>
									보호소
								</li>  
								<li id="hospitalMark" data-order="2"> 
									<span class="category_bg hospital-c"></span>
									병원
								</li>
							</ul>
							<div class="showlist-btn" role="group" id="hospitallistbtn" aria-label="병원 리스트 체크리스트" style="visibility:hidden;">
								<input type="checkbox" class="btn-check " id="showlistbtn" onClick="javascript:isCheckedShowListBtn()" autocomplete="off">
								<label class="btn btn-outline-primary" id="showlistbtnlb" for="showlistbtn" style="bgcolor:#fff">병원 리스트 보기</label>
							</div>
						    <!-- Buttons -->
							<button type="button" id="myLocationButton" class="btn btn-link btn-outline-danger ml-btn mylocation-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" title="내 위치 이동" onClick="javascript:getMyLocation();"></button>
							<button type="button" id="cancelButton" class="btn btn-light btn-outline-danger ca-btn cancel-btn" style="visibility:hidden;" data-bs-toggle="tooltip" data-bs-placement="top" title="양식 작성 취소" onClick="javascript:cancelWritingMark();"></button>
							<button type="button" id="writingButton" class="btn btn-light btn-outline-primary w-btn writing-btn" data-bs-toggle="tooltip" data-bs-placement="left" title="신고 양식 작성" onClick="javascript:setMissingLocationMark();"></button>
							

							<div id="paginationContainer">
				                <div id="pagination"></div>
				            </div>
				            
							<form method="post" enctype="multipart/form-data" action=insert>
							<!-- Modal -->
							<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <!-- Modal Header -->
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel">실종 신고 양식 작성</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="resetModalContent()"></button>
							      </div>
							      <!-- Modal Body -->
							      <div class="modal-body">
							      	<div class="container-fluid">
							      	  <div class="row">
							      	    <!-- Pet Image Input & Carousel -->
							      	    <div class="col-xl-3">
							      	      <label class="form-label"><h6>펫 사진</h6></label>
							      	    	<div id="carouselInput" class="carousel slide mb-3">
											  <div class="carousel-indicators">
											    <button type="button" data-bs-target="#carouselInput" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
											    <button type="button" data-bs-target="#carouselInput" data-bs-slide-to="1" aria-label="Slide 2"></button>
											    <button type="button" data-bs-target="#carouselInput" data-bs-slide-to="2" aria-label="Slide 3"></button>
											  </div>
											  <div class="carousel-inner"></div>
											  <button class="carousel-control-prev" type="button" data-bs-target="#carouselInput" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Previous</span>
											  </button>
											  <button class="carousel-control-next" type="button" data-bs-target="#carouselInput" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Next</span>
											  </button>
											</div>
											<!-- Input button -->
							      	    	<input class="form-control mb-3" type="file" name="files" id="petImageInput" accept="image/*" onchange="setFormImageUpload(event);" multiple required/>
							      	    </div>
							      	    <!-- Pet Info Input -->
							      	    <div class="col-xl-9">
							      	      <div class="row">
							      	        <div class="col"><h4>펫 정보</h4></div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" name="pet_name" id="formPetnameInput" placeholder="PetName" value="" required>
							      	        	<label for="formPetnameInput">펫 이름</label>
							      	        </div>
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" name="pet_type" id="formPetTypeInput" placeholder="PetType"  value="" required>
							      	        	<label for="formPetTypeInput">펫 종류</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="number" min="0" inputmode="numeric" name="pet_age" class="form-control" id="formPetAgeInput" placeholder="PetAge"  value=""  required>
							      	        	<label for="formPetnameInput">펫 나이</label>
							      	        </div>
							      	        <div class="col">
								      	        <div class="btn-group" role="group" aria-label="PetSex toggle button group">
								      	        	<input type="radio" class="btn-check" name="pet_sex" id="formPetSexRadio1" autocomplete="off" required value='M'>
								      	        	<label class="btn btn-outline-primary" for="formPetSexRadio1">남♂️</label>
								      	        	
								      	        	<input type="radio" class="btn-check" name="pet_sex" id="formPetSexRadio2" autocomplete="off" required value='F'>
								      	        	<label class="btn btn-outline-primary" for="formPetSexRadio2">여♀️</label>
							      	       		</div>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" id="formPhoneNumberInput" name="user_phone" value="010-" placeholder="PhoneNumber" pattern="010-\d{4}-\d{4}$" required>
							      	        	<label for="formPhoneNumberInput">연락처 ex)010-xxxx-xxxx</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row">
								       	    <div class="col"><h6>실종 시간: <input type="datetime-local" name="missing_time" id="formLostTimeInput" required></h6></div> 
								      	  </div>
							      	    </div>
							      	  </div>
							      	  <hr color="black" size="5px">
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">실종 장소<br>설명</span>
							      	  	  <textarea class="form-control" aria-label="실종 장소 설명" name="location_explain" id="formMissingLocationExplationInput" maxlength="500" required></textarea>
							      	  	</div>
							      	  </div>
							      	  
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">특이 사항</span>
							      	  	  <textarea class="form-control" aria-label="특이 사항" name="missing_notice" id="formMissingNoticeInput" maxlength="500" required></textarea>
							      	  	</div>
							      	  </div>
							      	  
							      	  <div class="row mb-3">
							      	  	<div class="form-check">
							      	  	  <input class="form-check-input" type="checkbox" value="" id="formAgreementCheck" required>
								      	  <label class="form-check-label" for="formAgreementCheck">한 번 등록한 글은 수정할 수 없으며, 72시간 이후 소멸합니다.<br>동의하시면 체크해주세요.</label>
								      	  </div>
							      	  </div>
							      	</div>
							      </div>
							      <div class="modal-footer">
							      	<input type="hidden" id="formLat" name="lat" value=""/>	<input type="hidden" id="formLon" name="lon" value=""/>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="resetModalContent()">취소</button>
							        <button type="submit" class="btn btn-primary"  >작성하기</button>
							      </div>
							      
							    </div>
							  </div>
							</div>
							<!-- Modal End -->
							</form>
							<!-- Missing Form Modal -->
							<div class="modal fade" id="missingFormModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <!-- Modal Header -->
							      <div class="modal-header">
							        <h5 class="modal-title" id="staticBackdropLabel">실종 펫 정보</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="resetModalContent()"></button>
							      </div>
							      <!-- Modal Body -->
							      <div class="modal-body">
							      	<div class="container-fluid">
							      	  <div class="row">
							      	    <!-- Pet Image Input & Carousel -->
							      	    <div class="col-xl-3">
							      	      <label class="form-label"><h6>펫 사진</h6></label>
							      	    	<div id="carouselExampleIndicators" class="carousel slide mb-3">
											  <div class="carousel-indicators">
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
											  </div>
											  <div class="carousel-inner carousel-inner-custom"></div>
											  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Previous</span>
											  </button>
											  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Next</span>
											  </button>
											</div>
							      	    </div>
							      	    <!-- Pet Info Input -->
							      	    <div class="col-xl-9">
							      	      <div class="row">
							      	        <div class="col"><h4>펫 정보</h4></div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" name="pet_name" id="formPetname" placeholder="PetName" value="" readonly>
							      	        	<label for="formPetname">펫 이름</label>
							      	        </div>
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" name="pet_type" id="formPetType" placeholder="PetType"  value="" readonly>
							      	        	<label for="formPetType">펫 종류</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="number" min="0" inputmode="numeric" name="pet_age" class="form-control" id="formPetAge" placeholder="PetAge"  value=""  readonly>
							      	        	<label for="formPetname">펫 나이</label>
							      	        </div>
							      	        <div class="col form-floating">
								      	        <input type="text" class="form-control" name="pet_sex" id="formPetSex" placeholder="PetSex"  value="" readonly>
							      	        	<label for="formPetSex">펫 성별</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" id="formPhoneNumber" name="user_phone" value="" placeholder="PhoneNumber"  readonly>
							      	        	<label for="formPhoneNumber">연락처</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row">
								       	    <div class="col"><h6>실종 시간: <input type="datetime-local" name="missing_time" id="formLostTime" readonly></h6></div> 
								      	  </div>
							      	    </div>
							      	  </div>
							      	  <hr color="black" size="5px">
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">실종 장소<br>설명</span>
							      	  	  <textarea class="form-control" aria-label="실종 장소 설명" name="location_explain" id="formMissingLocationExplation" maxlength="500" readonly></textarea>
							      	  	</div>
							      	  </div>
							      	  
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">특이 사항</span>
							      	  	  <textarea class="form-control" aria-label="특이 사항" name="missing_notice" id="formMissingNotice" maxlength="500" readonly></textarea>
							      	  	</div>
							      	  </div>
							      	</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" onclick="makeCall()" >연락하기</button>
							      </div>
							    </div>
							  </div>
							</div>
							<!-- Missing Form Modal End -->	             	
	                	</div>
	                </div>
	            </div>
				<!-- Map End -->
			</div>
		</div>
		<!-- Content End -->
    	<!-- Map Script Start -->
    	<script>
    	getMissingMark();
    		let missingLat; // 실종 등록 위치 (위도)
    		let missingLon; // 실종 등록 위치 (경도)
    		let gpsLat;		// gps 위도
    		let gpsLon;		// gps 경도
    		var missingMarkers = [];
    		var shelterMarkers = [];
    		var hospitalMarkers = [];
    		var missingClusterer;
    		var shelterClusterer;
    		var hospitalClusterer;
    		let gpsMarker = new kakao.maps.Marker({
    	        position: new kakao.maps.LatLng(33.450701, 126.570667)
    	    });;	// gps 마커
	    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		        mapOption = {
		            center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도의 중심좌표
		            level: 3 // 지도의 확대 레벨
		        };
		    // 지도를 표시할 div와 지도 옵션으로 지도 생성
		    var map = new kakao.maps.Map(mapContainer, mapOption);
		    
 		 	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤 생성
		    var mapTypeControl = new kakao.maps.MapTypeControl();

		    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		    
		    // 마커 이미지 설정
		    var imageSrc = '../resources/img/gpsMark.gif', // 마커이미지 주소    
			    imageSize = new kakao.maps.Size(48, 48) // 마커 이미지 크기
			    //imageOption = {offset: new kakao.maps.Point(24, 12)}; // 마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			    
			// 장소 검색 객체 생성
			var ps = new kakao.maps.services.Places();

			let missingFormImage = [];
			updateCarousel();
			getMyLocation();
			
			document.getElementById('sidebarToggle').addEventListener('click',sidebarRelayout);
			// 지도 클릭 이벤트 리스너
		    var infowindow = new kakao.maps.InfoWindow({
	        	map:map,
	        	content: '<div style="width:30px;height:30px;"><img style="width:100%;height:100%;objct-fit: cover;" src="../resources/img/missingMark.png"/></div>'
	        });
			
			// 양식 등록 버튼 실행 시 지도 클릭 이벤트 핸들러 생성 구문 (전역으로 생성 후 필요 할 때마다 이벤트 등록)
			var clickEventHandler = function (mouseEvent) {
		        var latlng = mouseEvent.latLng;
		        missingLat = latlng.getLat();
		        missingLon = latlng.getLng();
		        infowindow.setPosition(latlng);
		        infowindow.setMap(map);
		        console.log("새로운 이벤트 리스너 등록됨 -", missingLat, missingLon); // 리스너 등록 확인 구문
		        // 확인창 생성
		        handleConfirmation();
		    };
		    var writingButton = document.getElementById('writingButton');	// 양식 등록 버튼 hidden 설정 위해 전역 생성
		    var cancelButton = document.getElementById('cancelButton');		// 양식 등록 취소 버튼 hidden 설정 위해 전역 생성

		    <!-- Functions -->
		    // div 사이즈 변경(sidebar 호출)시 지도 사이즈 재설정 호출
		    function relayout() {    
		        map.relayout();
		    }
		    // sidebar 작동 시 애니메이션 이후 지도 사이즈 재설정 호출
		    function sidebarRelayout(){
		    	setTimeout(relayout,490);
		    	console.log('relayout');
		    }
			 // 내 위치 찾기 구문 (using 'gps'naming variable)
			 function getMyLocation(){
				 if (navigator.geolocation) {
				        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				        navigator.geolocation.getCurrentPosition(function(position) {
				            gpsLat = position.coords.latitude; // 위도
				            gpsLon = position.coords.longitude; // 경도
				            var locPosition = new kakao.maps.LatLng(gpsLat, gpsLon);
				            displayMyLocationMarker(locPosition); // 마커를 표시합니다
				            relayout();
				        });
				    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치를 설정합니다
				    	gpsLat = 33.450701;  // 위도
			            gpsLon = 126.570667; // 경도
			            var locPosition = new kakao.maps.LatLng(gpsLat, gpsLon);
			            displayMyLocationMarker(locPosition); // 마커를 표시합니다
			            relayout();
				    }
			 }
			 // 지도에 내위치 마커를 표시하는 함수입니다
			 function displayMyLocationMarker(locPosition) {
			     // 마커를 생성합니다
				 gpsMarker.setMap(null);
			     gpsMarker = new kakao.maps.Marker({  
			         map: map, 
			         position: locPosition,
			         image: markerImage
			     }); 
				 gpsMarker.setMap(map);
			     // 지도 중심좌표를 접속위치로 변경합니다
			     map.setCenter(locPosition);      
			 }

			// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
			function zoomIn() {
			    map.setLevel(map.getLevel() - 1);
			}
			// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
			function zoomOut() {
				map.setLevel(map.getLevel() + 1);
			}
			
			// 실종 위치설정 마커 생성 함수 ( TEST )
			function setMissingLocationMark() {
			    kakao.maps.event.addListener(map, 'click', clickEventHandler);
			    // alert 표시 구문
			 	// 예시로 Bootstrap의 alert를 사용하여 알림창을 표시합니다.
			    var alertContainer = document.getElementById('alertContainer');
			    var alertHTML = `
			        <div class="alert alert-info alert-dismissible fade show help-alert" role="alert">
			            실종 위치를 지도위에 클릭해주세요.
			            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			        </div>
			    `;

			    // 기존의 알림창을 제거하고 새로운 알림창을 추가합니다.
			    alertContainer.innerHTML = alertHTML;
			    
			    // 양식 작성 버튼 비활성화 및 취소 버튼 활성화
			    writingButton.classList.add('disabled');
			    cancelButton.style.visibility = 'visible';
			}
			
			// 양식 등록 실종 위치 지정 확인 함수
			function handleConfirmation() {
			    if (confirm("해당 위치로 등록하시겠습니까?")) {
			    	document.getElementById('formLat').value = missingLat;
			    	document.getElementById('formLon').value = missingLon;
			        showReportModal();
			        alertContainer.innerHTML = null;
			        infowindow.close();
				    writingButton.classList.remove('disabled');
				    cancelButton.style.visibility = 'hidden';
			    } else {
			        alert("원하는 위치를 다시 클릭해주세요.");
			        infowindow.close();
			    }
			}
			
			// 양식 등록 취소 버튼 누를 시 작동
			function cancelWritingMark() {
				alertContainer.innerHTML = null;
		        kakao.maps.event.removeListener(map, 'click',clickEventHandler);
		        infowindow.close();
			    writingButton.classList.remove('disabled');
			    cancelButton.style.visibility = "hidden";
			}
			// 양식 모달 생성 함수 (실종 위치 지정 이후 생성)
			function showReportModal(){
				var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
		        myModal.show();
		        kakao.maps.event.removeListener(map, 'click',clickEventHandler);
			}
			
			// formMypetImageInput 이미지 업로드 함수
			function setFormImageUpload(event) {
			    // 함수 작동 도중 다른 키 입력 방지
			    event.preventDefault();
			    missingFormImage = [];
			    const files = event.currentTarget.files;

			    // 이미지 갯수 확인 (3개 이상이면 경고)
			    if (files.length > 3) {
			        alert('이미지는 최대 3개까지 업로드가 가능합니다.');
			        return;
			    }

			    // 이미지 확장자 확인 (이미지 파일이 아니라면 경고)
			    for (const file of files) {
			        if (!file.type.match("image/.*")) {
			            alert('이미지 파일만 업로드 가능합니다.');
			            return;
			        }
			    }

			 	// missingFormImage 배열을 업데이트
			    missingFormImage = Array.from(files).map(file => {
			        const image = new Image();
			        image.src = URL.createObjectURL(file);
			        return image;
			    });

			    // updateCarousel 호출
			    updateCarousel();
			}
			
			// 이미지 업로드 후에 캐러셀 업데이트
			function updateCarousel() {
			    const carousel = document.querySelector('.carousel-inner');
			    const defaultImageSrc = "../resources/img/imageAdd.png";

			    // 이미지를 비워줌
			    carousel.innerHTML = '';

			    // 업로드된 이미지를 캐러셀에 추가
			    for (let i = 0; i < missingFormImage.length; i++) {
			        const carouselItem = document.createElement('div');
			        carouselItem.className = 'carousel-item';

			        const img = document.createElement('img');
			        img.src = missingFormImage[i].src;
			        img.className = 'd-block w-100';
			        img.alt = `Image ${i + 1}`;
			        img.id = 'missingImg';

			        carouselItem.appendChild(img);
			        carousel.appendChild(carouselItem);

			        // 첫 번째 아이템을 활성화
			        if (i === 0) {
			            carouselItem.classList.add('active');
			        }
			    }
			}
			// 모달 내용 초기화 함수
			function resetModalContent() {
			    // 펫 사진 캐러셀 업데이트
			    missingFormImage = [];
			    updateCarousel();
			    document.getElementById('petImageInput').value='';

			    // 펫 정보 입력 필드 초기화
			    document.getElementById('formPetnameInput').value = '';
			    document.getElementById('formPetTypeInput').value = '';
			    document.getElementById('formPetAgeInput').value = '';
			    document.getElementById('formPetSexRadio1').checked = true;
			    document.getElementById('formPetSexRadio2').checked = false;
			    document.getElementById('formPhoneNumberInput').value = '';
			    document.getElementById('formLostTimeInput').value = '';

			    // 실종 장소 및 특이 사항 입력 필드 초기화
			    document.getElementById('formMissingLocationExplationInput').value = '';
			    document.getElementById('formMissingNoticeInput').value = '';
			    
			}
			
			// 모달 내용 유효성 검사 함수
			function validateForm() {
			    // 펫 이름 유효성 검사
			    var petName = document.getElementById('formPetnameInput').value;
			    if (petName.trim() === '') {
			      alert('펫 이름을 입력해주세요.');
			      return false;
			    }
			
			    // 펫 종류 유효성 검사
			    var petType = document.getElementById('formPetTypeInput').value;
			    if (petType.trim() === '') {
			      alert('펫 종류를 입력해주세요.');
			      return false;
			    }
			
			    // 펫 나이 유효성 검사
			    var petAge = document.getElementById('formPetAgeInput').value;
			    if (petAge < 0 || isNaN(petAge)) {
			      alert('올바른 펫 나이를 입력해주세요.');
			      return false;
			    }
			
			    // 휴대폰 번호 유효성 검사
			    var phoneNumber = document.getElementById('formPhoneNumberInput').value;
			    var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
			    if (!phoneRegex.test(phoneNumber)) {
			      alert('올바른 휴대폰 번호를 입력해주세요. (ex. 010-xxxx-xxxx)');
			      return false;
			    }
			
			    // 실종 시간 유효성 검사
			    var lostTime = document.getElementById('formLostTimeInput').value.trim();
			    if (lostTime === '') {
			    	  alert('실종 시간을 입력해주세요.');
			    	  return false;
			    }
			
			    // 실종 장소 설명 유효성 검사
			    var missingLocationExplanation = document.getElementById('formMissingLocationExplationInput').value;
			    if (missingLocationExplanation.trim() === '') {
			      alert('실종 장소 설명을 입력해주세요.');
			      return false;
			    }
			
			    // 특이 사항 유효성 검사
			    var missingNotice = document.getElementById('formMissingNoticeInput').value;
			    if (missingNotice.trim() === '') {
			      alert('특이 사항을 입력해주세요.');
			      return false;
			    }
			
			    // 동의 체크 유효성 검사
			    var agreementCheck = document.getElementById('formAgreementCheck').checked;
			    if (!agreementCheck) {
			      alert('동의를 체크해주세요.');
			      return false;
			    }
			
			    // 모든 조건을 통과하면 true 반환
			    return true;
			  }
			
			// ajax 사용 양식 작성 버튼
			function checkFormValidation(){
				if(validateForm()){
					insertFormToDatabase();
					console.log("성공");
				}else{
					console.log("error");
				}
			}
		    var missingImageSrc = '../resources/img/missingMark.png', // 마커이미지 주소   
		    	missingImageSize = new kakao.maps.Size(36, 36); // 마커 이미지 크기
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var missingMarkerImage = new kakao.maps.MarkerImage(missingImageSrc, missingImageSize);
			// 실종 마커 추가 함수
			function getMissingMark(){
				$.ajax({
				    url: "missingmark",
				    type: 'GET',
				    dataType: "json",
				    success: function(data) {
				        // 서버로부터 받아온 데이터 활용
				        console.log("missing Mark : "+data.length);
				        // TODO: 데이터를 이용한 추가적인 작업 수행
				        for (var i = 0; i < data.length; i++) {
						    (function (index) {
						        var markerPosition = new kakao.maps.LatLng(data[index].lat, data[index].lon);
						        var marker = new kakao.maps.Marker({
						            position: markerPosition,
						            image: missingMarkerImage
						        });
						
						        missingMarkers.push(marker);
						
						        var thumbnailImage = data[index].pet_img.split(',');
						        var thumbnailImageSrc = '../resources/upload/s_'+thumbnailImage[0],
						        	thumbnailImageSize = new kakao.maps.Size(100,100);
						        var missingThumbnailImage = new kakao.maps.MarkerImage(thumbnailImageSrc,thumbnailImageSize)
						
						        kakao.maps.event.addListener(missingMarkers[index], 'mouseover', function () {
						            missingMarkers[index].setImage(missingThumbnailImage);
						        });
						
						        kakao.maps.event.addListener(missingMarkers[index], 'mouseout', function () {
						            missingMarkers[index].setImage(missingMarkerImage);
						        });
						        
						        kakao.maps.event.addListener(missingMarkers[index],'click',function(mouseEvent){
						        	getFormData(data[index].missing_id, function(err, result){
						        		if(err){
						        			console.error("ERROR: ",err);
						        		}else{
							        		console.log(result);
							        	    fillModalWithData(result);
						        		}
						        	});
						        });
						
						        missingMarkers[index].setMap(map);
						    })(i);
						}
				        missingClusterer = createAndAddClusterer(missingMarkers, map);
				    },error: function(xhr, status, error) {
				        console.error("Error from server:", status, error);
				    }
				});
			}
			function getFormData(missing_id, callback){
				$.ajax({
					url: "getMissingForm",
					type: 'GET',
					dataType: "json",
					data: {missing_id: missing_id},
					success: function(data){
						console.log(data);
						callback(null, data);
					},error: function(xhr, status, error){
				        console.error("Error from server:", status, error);
						callback(error, null);
					}
				});
			}
			var shelterImageSrc = '../resources/img/shelterMark.png', // 마커이미지 주소    
			shelterImageSize = new kakao.maps.Size(36, 36) // 마커 이미지 크기
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var shelterMarkerImage = new kakao.maps.MarkerImage(shelterImageSrc, shelterImageSize);
			getShelterMark();
			//보호소 마커 추가 함수
			function getShelterMark(){
				$.ajax({
					url: "sheltermark",
					type: 'GET',
					dataType: "json",
					success: function(data){
						console.log("shelter Mark : "+data.length);
				        for(var i=0;i<data.length;i++){
				        	(function (index){
					        	var markerPosition = new kakao.maps.LatLng(data[index].lat, data[index].lng);
					        	var marker = new kakao.maps.Marker({
					        		position: markerPosition,
					        		image: shelterMarkerImage
					        	});
					        	shelterMarkers.push(marker);
					        	
					        	var iwContent = generateShelterInfoDiv(data[index], shelterDescriptions),
					        		iwRemoveable = true;
					        	var iwContentShort = '<div style="padding: 10px; background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);"><h5 style="margin-bottom: 5px; color: #333;">'+ data[index].careNm +'</h5> </div>'
					        	var infowindow = new kakao.maps.InfoWindow({
					        		content : iwContent,
					        	    removable : iwRemoveable
					        	});
					        	var infowindowShort = new kakao.maps.InfoWindow({
					        		content: iwContentShort
					        	});
					        	
					        	kakao.maps.event.addListener(shelterMarkers[index], 'mouseover', function () {
						        	infowindowShort.open(map,shelterMarkers[index]);
					        	});
						
						        kakao.maps.event.addListener(shelterMarkers[index], 'mouseout', function () {
						        	infowindowShort.close();
						        });
						        
						        kakao.maps.event.addListener(shelterMarkers[index], 'click', function () {
						        	infowindow.open(map,shelterMarkers[index]);
					        	});
						        
					        	shelterMarkers[index].setMap(map);
				        	})(i);
				        }
				        shelterClusterer = createAndAddClusterer(shelterMarkers, map);
					},error: function(xhr, status, error){
						console.error("Error from server:",status, error);
					}
				});
			}
			
			// shelter 상세내용 infowindow 생성 함수
			var shelterDescriptions = {
			    careNm: '동물보호센터명',
			    orgNm: '관리기관명',
			    divisionNm: '동물보호센터유형',
			    saveTrgtAnimal: '구조대상동물',
			    careAddr: '소재지도로명주소',
			    weekOprStime: '평일운영시작시간',
			    weekOprEtime: '평일운영종료시각',
			    closeDay: '휴무일',
			    careTel: '전화번호'
			};
			
			function generateShelterInfoDiv(data, descriptions) {
			    var containerDiv = document.createElement('div');
			    containerDiv.style.padding = '10px';
			    containerDiv.style.border = '1px solid #ccc';
			    containerDiv.style.borderRadius = '10px';
			    containerDiv.style.marginBottom = '20px';
			    containerDiv.style.maxHeight = '600px';
			    containerDiv.style.overflowY = 'auto'; // 세로 스크롤을 활성화합니다.

			    var rowDiv;

			    for (var key in data) {
			        if (typeof (data[key]) != 'number') {
			            // 소재지도로명주소는 한 줄에 하나씩 표시
			            if (key === 'careAddr') {
			                var fieldDiv = document.createElement('div');
			                fieldDiv.style.marginBottom = '8px';

			                var label = document.createElement('strong');
			                label.textContent = descriptions[key] + ': ';
			                label.style.display = 'block';
			                fieldDiv.appendChild(label);

			                var value = document.createElement('span');
			                value.innerHTML = data[key].replace(/(.{25})/g, '$1<br>'); // 내용이 15글자가 넘어가면 한 줄 띄워서 표시
			                fieldDiv.appendChild(value);

			                containerDiv.appendChild(fieldDiv);
			            } else {
			                // 나머지 항목들은 한 줄에 두 개씩 표시
			                if (!rowDiv || rowDiv.children.length === 2) {
			                    rowDiv = document.createElement('div');
			                    rowDiv.style.display = 'flex';
			                    rowDiv.style.marginBottom = '8px';
			                    containerDiv.appendChild(rowDiv);
			                }

			                var fieldDiv = document.createElement('div');
			                fieldDiv.style.marginRight = '20px';

			                var label = document.createElement('strong');
			                label.textContent = descriptions[key] + ': ';
			                label.style.display = 'block';
			                fieldDiv.appendChild(label);

			                var value = document.createElement('span');
			                value.textContent = data[key];
			                value.style.wordBreak = 'break-all'; // 긴 단어가 표시되는 경우 줄 바꿈
			                fieldDiv.appendChild(value);

			                rowDiv.appendChild(fieldDiv);
			            }
			        }
			    }

			    containerDiv.style.maxWidth = '100%';
			    containerDiv.style.overflow = 'hidden';
			    containerDiv.style.wordWrap = 'break-word';

			    return containerDiv;
			}

			function fillModalWithData(result) {
			    // 펫 사진 캐러셀 초기화
			    var carouselInner = document.querySelector('.carousel-inner-custom');
			    carouselInner.innerHTML = '';

			    // 펫 사진 캐러셀 채우기
			    var fillImages = result.pet_img.split(',');
			    console.log(fillImages);
			    for (var i = 0; i < fillImages.length; i++) {
			        var carouselItem = document.createElement('div');
			        carouselItem.classList.add('carousel-item');
			        if (i === 0) {
			            carouselItem.classList.add('active');
			        }

			        var img = document.createElement('img');
			        img.src = "../resources/upload/"+fillImages[i];
			        img.classList.add('d-block', 'w-100');
			        carouselItem.appendChild(img);
			        carouselInner.appendChild(carouselItem);
			    }

			    // 나머지 필드에 데이터 채워 넣기
			    document.getElementById('formPetname').value = result.pet_name;
			    document.getElementById('formPetType').value = result.pet_type;
			    document.getElementById('formPetAge').value = result.pet_age;
			    if(result.pet_sex=='M'){
			    	document.getElementById('formPetSex').value = "남♂️";
			    }else{
			    	document.getElementById('formPetSex').value = "여♀️";
			    }
			    document.getElementById('formPhoneNumber').value = result.user_phone;
			    document.getElementById('formLostTime').value = result.missing_time;
			    document.getElementById('formMissingLocationExplation').value = result.location_explain;
			    document.getElementById('formMissingNotice').value = result.missing_notice;

			    // 모달 열기
			    var missingmodal = new bootstrap.Modal(document.getElementById('missingFormModal'));
			    missingmodal.show();
			}
			function makeCall() {
			    var phoneNumber = document.getElementById('formPhoneNumber').value;
			    // 전화 걸기
			    document.location.href = 'tel:' + phoneNumber;
			}
			
			//병원 검색 함수
			// 사용자의 현재 위치를 기준으로 검색하는 함수
			function searchHospitalMarks() {
			    console.log('병원찾기!');
			    var keyword = "동물병원";
			    var options = {
			        location: new kakao.maps.LatLng(gpsLat, gpsLon),
			        radius: 10000,
			        sort: kakao.maps.services.SortBy.DISTANCE
			    };
				
			    ps.keywordSearch(keyword, placesSearchCB, options);
			    hospitalClusterer = createAndAddClusterer(hospitalMarkers, map);
			}
			
			//장소 검색 완료시 호출되는 콜백 함수 -> placesSearchCB
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);
			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
			    } else if (status === kakao.maps.services.Status.ERROR) {
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
			    }
			}
			
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
			    var listEl = document.getElementById('placesList'),
			        menuEl = document.getElementById('menu_wrap'),
			        fragment = document.createDocumentFragment(),
			        bounds = new kakao.maps.LatLngBounds(),
			        listStr = '';
			
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);
			
			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			
			    // 전역 변수 hospitalMarkers 초기화
			    hospitalMarkers = [];
			
			    for (var i = 0; i < places.length; i++) {
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i, places[i].place_name); // 마커 생성 및 hospitalMarkers 배열에 추가
			        hospitalMarkers.push(marker); // hospitalMarkers 배열에 마커 추가
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해 LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
			
			        // 검색결과 항목 Element를 생성합니다
			        var itemEl = getListItem(i, places[i]);
			
			        // 마커와 검색결과 항목에 mouseover 했을 때 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // mouseout 했을 때는 인포윈도우를 닫습니다
			        (function (marker, title) {
			            kakao.maps.event.addListener(marker, 'mouseover', function () {
			                displayInfowindow(marker, title);
			            });
			
			            kakao.maps.event.addListener(marker, 'mouseout', function () {
			                infowindow.close();
			            });
			
			            itemEl.onmouseover = function () {
			                displayInfowindow(marker, title);
			            };
			
			            itemEl.onmouseout = function () {
			                infowindow.close();
			            };
			        })(marker, places[i].place_name);
			
			        fragment.appendChild(itemEl);
			    }
			
			    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;
			
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
				console.log(places);
			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h5>' + places.place_name + '</h5>';

			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
			    } else {
			        itemStr += '    <span>' +  places.address_name  + '</span>'; 
			    }
			                 
			      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			                '</div>';           

			    el.innerHTML = itemStr;
			    el.className = 'item';
			 	// 클릭 이벤트 추가
			    el.addEventListener('click', function() {
			        // 새 창을 열어서 place_url 값으로 이동
			        window.open(places.place_url);
			    });
			 	el.addEventListener('mouseenter', function() {
			 		var moveLatLon = new kakao.maps.LatLng(parseFloat(places.y),parseFloat(places.x));
			 		map.setCenter(moveLatLon);
			 	});
			    return el;
			}
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = '../resources/img/hospitalMark.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 37), // 스프라이트 이미지의 크기
			            //spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });
			    kakao.maps.event.addListener(marker, 'click', function () {
			    	map.panTo(marker.getPosition());
			    });
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    hospitalMarkers.push(marker);  // 배열에 생성된 마커를 추가합니다

			    return marker;
			}
			
			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationContainer = document.getElementById('paginationContainer'); // 수정
			    if (!paginationContainer) {
			        console.error("paginationContainer not found");
			        return;
			    }
			
			    var paginationEl = document.getElementById('pagination'); // 수정
			
			    // paginationEl이 null인 경우, HTML에 해당 요소를 추가합니다.
			    if (!paginationEl) {
			        paginationEl = document.createElement('div');
			        paginationEl.id = 'pagination';
			        paginationContainer.appendChild(paginationEl);
			    }
			
			    paginationEl.innerHTML = ''; // 기존에 추가된 페이지번호를 삭제합니다
			
			    var fragment = document.createDocumentFragment();
			    for (var i = 1; i <= pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;
			
			        if (i === pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function (i) {
			                return function () {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }
			
			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}


			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			}

			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
		 	// 기존에 등록된 마커들을 지도에서 제거하는 함수
		    function removeMarker() {
		        hospitalMarkers.forEach(function (marker) {
		            marker.setMap(null);
		        });
		        hospitalMarkers = [];
		    }

		    
		 	// 실종 마커 클릭 시 이벤트 추가
		    document.getElementById('missingMark').addEventListener('click', function () {
		    	console.log('missingMark Click');
		    	removeShelterMarkers();
		    	removeHospitalMarkers();
		    	showMissingMarkers();
		    	missingClusterer = createAndAddClusterer(missingMarkers, map);
		    	destroyClusterer(shelterClusterer);
		    	destroyClusterer(hospitalClusterer);
		    });
		 
		 	// 보호소 마커 클릭 시 이벤트 추가
		    document.getElementById('shelterMark').addEventListener('click', function () {
		    	console.log('shelterMark Click');
		    	removeMissingMarker();
		    	removeHospitalMarkers();
		    	showShelterMarkers();
		    	destroyClusterer(missingClusterer);
		    	shelterClusterer = createAndAddClusterer(shelterMarkers, map);
		    	destroyClusterer(hospitalClusterer);
		    });
			
		    // 병원 마커 클릭 시 이벤트 추가
		    document.getElementById('hospitalMark').addEventListener('click', function () {
		    	console.log('hospitalMark Click');
		    	removeMissingMarker();
		    	removeShelterMarkers();
		 		document.getElementById('hospitallistbtn').style.visibility = 'visible';
		    	searchHospitalMarks();
		    	destroyClusterer(missingClusterer);
		    	destroyClusterer(shelterClusterer);
		    	hospitalClusterer = createAndAddClusterer(hospitalMarkers, map);
		    });
		    
		    // 지도에서 missingMarkers 해제
		    function removeMissingMarker(){
		    	for(var i=0; i<missingMarkers.length;i++){
		    		missingMarkers[i].setMap(null);
		    	}
		    }
		    
		 	// 지도에서 shelterMarkers 해제
		    function removeShelterMarkers(){
		    	for(var i=0; i<shelterMarkers.length;i++){
		    		shelterMarkers[i].setMap(null);
		    	}
		    }
		 	
		 	// 지도에서 hospitalMarkers 해제 및 list 해제
		 	function removeHospitalMarkers(){
		 		document.getElementById('menu_wrap').style.visibility = 'hidden';
		 		document.getElementById('hospitallistbtn').style.visibility = 'hidden';
		 		document.getElementById('showlistbtnlb').value = "병원 리스트 보기";
		 		document.getElementById('showlistbtn').checked = false;
		 		for(var i=0; i<hospitalMarkers.length;i++){
		    		hospitalMarkers[i].setMap(null);
		    	}
		 	}
		 	
		 	// 지도에서 missingMarkers 보이기
		 	function showMissingMarkers(){
		 		for(var i=0; i<missingMarkers.length;i++){
		    		missingMarkers[i].setMap(map);
		    	}
		 	}
		 	
			// 지도에서 shelterMarkers 보이기
		 	function showShelterMarkers(){
		 		for(var i=0; i<shelterMarkers.length;i++){
		    		shelterMarkers[i].setMap(map);
		    	}
		 	}
			
			function isCheckedShowListBtn(){
				var showListBtn = document.getElementById('showlistbtn');
				if(showListBtn.checked){
			 		document.getElementById('menu_wrap').style.visibility = 'visible';
			 		document.getElementById('showlistbtnlb').value = "병원 리스트 숨기기";
				}
				else{
			 		document.getElementById('menu_wrap').style.visibility = 'hidden';
			 		document.getElementById('showlistbtnlb').value = "병원 리스트 보기";
				}
			}
			
			// 수정된 클러스터러 옵션
			var clustererOptions = {
			    averageCenter: true,
			    minLevel: 4, // 지도 레벨 4부터 적용
			    disableClickZoom: true,
			    gridSize: 50,
			    minClusterSize: 2, // 3개 이상일 때 클러스터로 보이도록 설정
			    calculator: [10, 30, 50, 100, 200], // 클러스터 단계에 따른 아이콘 크기
			    styles: [{
			            width: '30px', height: '30px',
			            background: 'rgba(245,139,15,0.7)',
			            border: '1px solid rgba(245,139,15,0.7)',
			            borderRadius: '50%',
			            color: '#fff',
			            textAlign: 'center',
			            lineHeight: '30px'
			        },
			        {
			            width: '40px', height: '40px',
			            background: 'rgba(245,139,15,0.7)',
			            border: '1px solid rgba(245,139,15,0.7)',
			            borderRadius: '50%',
			            color: '#fff',
			            textAlign: 'center',
			            lineHeight: '40px'
			        },
			        {
			            width: '50px', height: '50px',
			            background: 'rgba(245,139,15,0.7)',
			            border: '1px solid rgba(245,139,15,0.7)',
			            borderRadius: '50%',
			            color: '#fff',
			            textAlign: 'center',
			            lineHeight: '50px'
			        }
			    ]
			};
			
			// 클러스터러를 생성하고 마커를 추가하는 함수
			function createAndAddClusterer(markers, map) {
			    var clusterer = new kakao.maps.MarkerClusterer({
			        map: map,
			        averageCenter: clustererOptions.averageCenter,
			        minLevel: clustererOptions.minLevel,
			        disableClickZoom: clustererOptions.disableClickZoom,
			        gridSize: clustererOptions.gridSize,
			        minClusterSize: clustererOptions.minClusterSize,
			        styles: clustererOptions.styles,
			        calculator: clustererOptions.calculator
			    });

			    clusterer.addMarkers(markers);
			    
			 	// 클러스터 클릭 이벤트 추가
			    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
			        var level = map.getLevel();
			        var center = cluster.getCenter();

			        // 클러스터를 클릭하면 해당 위치로 맵 중앙 이동
			        map.setLevel(level - 1); // 지도 레벨을 하나 줄임
			        map.setCenter(center);
			    });
			    return clusterer;
			}
			
			// 클러스터러를 소멸시키고 마커를 지도에서 제거하는 함수
			function destroyClusterer(clusterer) {
			    clusterer.clear(); // 클러스터러에서 마커 제거
			    clusterer.setMap(null); // 클러스터러 소멸
			}
			
		</script>
		<!-- Map Script End -->
	</body>
</html>