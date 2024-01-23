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
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%=APPKEY%>"></script>
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
	                		<!-- Custom Controller -->
						    <!-- 지도타입 컨트롤 div 입니다 -->
						    <!-- <div class="custom_typecontrol radius_border">
						        <span id="btnRoadmap" class="selected_cusbtn" onclick="setMapType('roadmap')">지도</span>
						        <span id="btnSkyview" class="cusbtn" onclick="setMapType('skyview')">스카이뷰</span>
						    </div> -->
						    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						    <div class="custom_zoomcontrol radius_border"> 
						    	<button type="button" class="btn zoom-btn zoomin mt-1" onClick="javascript:zoomIn();"></button>
						    	<button type="button" class="btn zoom-btn zoomout mt-2" onClick="javascript:zoomOut();"></button>
						        <!-- <span onclick="zoomIn()"><img src="../resources/img/ico_plus.png" alt="확대"></span>  
						        <span onclick="zoomOut()"><img src="../resources/img/ico_minus.png" alt="축소"></span> -->
						    </div>
	                		
	                		<!-- Category -->
	                		<ul id="category">
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
						    <!-- Buttons -->
							<button type="button" id="myLocationButton" class="btn btn-link btn-outline-danger ml-btn mylocation-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" title="내 위치 이동" onClick="javascript:getMyLocation();"></button>
							<button type="button" id="cancelButton" class="btn btn-light btn-outline-danger ca-btn cancel-btn" style="visibility:hidden;" data-bs-toggle="tooltip" data-bs-placement="top" title="양식 작성 취소" onClick="javascript:cancelWritingMark();"></button>
							<button type="button" id="writingButton" class="btn btn-light btn-outline-primary w-btn writing-btn" data-bs-toggle="tooltip" data-bs-placement="left" title="신고 양식 작성" onClick="javascript:setMissingLocationMark();"></button>

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
							      	    	<div id="carouselExampleIndicators" class="carousel slide mb-3">
											  <div class="carousel-indicators">
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
											  </div>
											  <div class="carousel-inner"></div>
											  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Previous</span>
											  </button>
											  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Next</span>
											  </button>
											</div>
											<!-- Input button -->
											
							      	    	<input class="form-control mb-3" type="file" name="files" id="petImageInput" accept="image/*" onchange="setFormImageUpload(event);" multiple required>
							      	    	<!--  <input class="form-control mb-3" type="file" name="file"> -->
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
							      	  	  <textarea class="form-control" aria-label="실종 장소 설명" name="location_explain" id="formMissingLocationExplation" maxlength="500" required></textarea>
							      	  	</div>
							      	  </div>
							      	  
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">특이 사항</span>
							      	  	  <textarea class="form-control" aria-label="특이 사항" name="missing_notice" id="formMissingNotice" maxlength="500" required></textarea>
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
			    document.getElementById('formMissingLocationExplation').value = '';
			    document.getElementById('formMissingNotice').value = '';
			    
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
			    var missingLocationExplanation = document.getElementById('formMissingLocationExplation').value;
			    if (missingLocationExplanation.trim() === '') {
			      alert('실종 장소 설명을 입력해주세요.');
			      return false;
			    }
			
			    // 특이 사항 유효성 검사
			    var missingNotice = document.getElementById('formMissingNotice').value;
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
			
			// 실종 마커 추가 함수
			function getMissingMark(){
				$.ajax({
				    url: "missingmark",
				    type: 'GET',
				    dataType: "json",
				    success: function(data) {
				        // 서버로부터 받아온 데이터 활용
				        console.log(data);
				        console.log(data.length);
				        // TODO: 데이터를 이용한 추가적인 작업 수행
					    var missingImageSrc = '../resources/img/missingMark.png', // 마커이미지 주소    
						    missingImageSize = new kakao.maps.Size(36, 36) // 마커 이미지 크기
						      
						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var missingMarkerImage = new kakao.maps.MarkerImage(missingImageSrc, missingImageSize);
				        for(var i=0;i<data.length;i++){
				        	var markerPosition = new kakao.maps.LatLng(data[i].lat, data[i].lon);
				        	var marker = new kakao.maps.Marker({
				        		position: markerPosition,
				        		image: missingMarkerImage
				        	});
				        	missingMarkers.push(marker);
				        	missingMarkers[i].setMap(map);
				        }
				    },error: function(xhr, status, error) {
				        console.error("Error from server:", status, error);
				    }
				});
			}
			
			//보호소 마커 추가 함수
			function getShelterMark(){
				$.ajax({
					url: "sheltermark",
					type: 'GET',
					dataType: "json",
					success: function(data){
						
					},error: function(xhr, status, error){
						consolr.error("Error from server:",status, error);
					}
				});
			}
		</script>
		<!-- Map Script End -->
	</body>
</html>