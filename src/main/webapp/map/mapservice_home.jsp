<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
    	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1991e110a0fbe362aac08fce1f5fba8c"></script>
   	    
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
				<!-- Map Start -->
				<div class="container-fluid">
	                <div class="row vh-100 bg-light rounded align-items-start justify-content-center mx-0">
	                	<div class="mapWrapper">
	                		<div id="map" style="width:100%;height:100%;"></div>
	                		<!-- Custom Controller -->
						    <!-- 지도타입 컨트롤 div 입니다 -->
						    <div class="custom_typecontrol radius_border">
						        <span id="btnRoadmap" class="selected_cusbtn" onclick="setMapType('roadmap')">지도</span>
						        <span id="btnSkyview" class="cusbtn" onclick="setMapType('skyview')">스카이뷰</span>
						    </div>
						    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						    <div class="custom_zoomcontrol radius_border"> 
						    	<button type="button" class="zoom-btn zoomin" onClick="javascript:zoomIn();"></button>
						    	<button type="button" class="zoom-btn zoomout" onClick="javascript:zoomOut();"></button>
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
							<button type="button" title="내 위치 이동" class="ml-btn mylocation-btn" onClick="javascript:getMyLocation();"></button>
							<button type="button" title="신고 양식 작성" class="w-btn writing-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop"></button>
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
							      	      <label for="formFile" class="form-label"><h6>펫 사진</h6></label>
							      	    	<div id="carouselExampleIndicators" class="carousel slide mb-3">
											  <div class="carousel-indicators">
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
											  </div>
											  <div class="carousel-inner">
											  </div>
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
							      	    	<input class="form-control mb-3" type="file" id="petImageInput" accept="image/*" onchange="setThumbnail(event);" multiple>
							      	    </div>
							      	    <!-- Pet Info Input -->
							      	    <div class="col-xl-9">
							      	      <div class="row">
							      	        <div class="col"><h4>펫 정보(Label)</h4></div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" id="formPetnameInput" placeholder="PetName">
							      	        	<label for="formPetnameInput">펫 이름</label>
							      	        </div>
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" id="formPetTypeInput" placeholder="PetType">
							      	        	<label for="formPetTypeInput">펫 종류</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="number" min="0" inputmode="numeric" class="form-control" id="formPetAgeInput" placeholder="PetAge">
							      	        	<label for="formPetnameInput">펫 나이</label>
							      	        </div>
							      	        <div class="col">
								      	        <div class="btn-group" role="group" aria-label="PetSex toggle button group">
								      	        	<input type="radio" class="btn-check" name="btnradio" id="formPetSexRadio1" autocomplete="off" checked>
								      	        	<label class="btn btn-outline-primary" for="formPetSexRadio1">남♂️</label>
								      	        	
								      	        	<input type="radio" class="btn-check" name="btnradio" id="formPetSexRadio2" autocomplete="off">
								      	        	<label class="btn btn-outline-primary" for="formPetSexRadio2">여♀️</label>
							      	       		</div>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row mb-3">
							      	        <div class="col form-floating">
							      	        	<input type="text" class="form-control" id="formPhoneNumberInput" placeholder="PhoneNumber">
							      	        	<label for="formPhoneNumberInput">연락처 ex)010-xxxx-xxxx</label>
							      	        </div>
							      	      </div>
							      	      
							      	      <div class="row">
								      	    <div class="col"><h6>실종 시간: <input type="datetime-local" name="formLostTimeInput" id="formLostTimeInput"></h6></div>
								      	  </div>
							      	    </div>
							      	  </div>
							      	  <hr color="black" size="5px">
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">실종 장소<br>설명</span>
							      	  	  <textarea class="form-control" aria-label="실종 장소 설명" id="formMissingLocationExplation"></textarea>
							      	  	</div>
							      	  </div>
							      	  
							      	  <div class="row mb-3">
							      	  	<div class="input-group">
							      	  	  <span class="input-group-text">특이 사항</span>
							      	  	  <textarea class="form-control" aria-label="특이 사항" id="formMissingNotice"></textarea>
							      	  	</div>
							      	  </div>
							      	  
							      	  <div class="row mb-3">
							      	  	<div class="form-check">
							      	  	  <input class="form-check-input" type="checkbox" value="" id="formAgreementCheck">
								      	  <label class="form-check-label" for="formAgreementCheck">한 번 등록한 글은 수정할 수 없으며, 72시간 이후 소멸합니다.<br>동의하시면 체크해주세요.</label>
								      	  </div>
							      	  	</div>
							      	</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="resetModalContent()">취소</button>
							        <button type="button" class="btn btn-primary" >작성하기</button>
							      </div>
							    </div>
							  </div>
							</div>
							<!-- Modal End -->
	                	</div>
	                </div>
	            </div>
				<!-- Map End -->
			</div>
		</div>
		<!-- Content End -->
    	<!-- Map Script Start -->
    	<script>
    		let gpsLat;		// gps 위도
    		let gpsLon;		// gps 경도
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
		    
/* 		 	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤 생성
		    var mapTypeControl = new kakao.maps.MapTypeControl();

		    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		    var zoomControl = new kakao.maps.ZoomControl();
		    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); */
		    
		    // 마커 이미지 설정
		    var imageSrc = '../resources/img/gpsMark.gif', // 마커이미지 주소    
			    imageSize = new kakao.maps.Size(48, 48) // 마커 이미지 크기
			    //imageOption = {offset: new kakao.maps.Point(24, 12)}; // 마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		    
			getMyLocation();
			
			let missingFormImage = [];
			updateCarousel();
			
			dobument.getElementById('sidebarToggle').addEventListener('click',setTimeout(relayout(),800));
		    <!-- Functions -->
		    // div 사이즈 변경(sidebar 호출)시 지도 사이즈 재설정 호출
		    function relayout() {    
		        map.relayout();
		    }
			 // 내 위치 찾기 구문 (using 'gps'naming variable)
			 function getMyLocation(){
				 if (navigator.geolocation) {
				        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				        navigator.geolocation.getCurrentPosition(function(position) {
				            gpsLat = position.coords.latitude; // 위도
				            gpsLon = position.coords.longitude; // 경도
				            
				         	// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				            var locPosition = new kakao.maps.LatLng(gpsLat, gpsLon);
				            displayMyLocationMarker(locPosition);	// 마커를 표시합니다
				          });
				    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치를 설정합니다
				        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
				        displayMyLocationMarker(locPosition);
				    }
				 relayout();
			 }
			 // 지도에 마커를 표시하는 함수입니다
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
			// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
			function setMapType(maptype) {
				//console.error("맵타입");
				var roadmapControl = document.getElementById('btnRoadmap');
				var skyviewControl = document.getElementById('btnSkyview'); 
				if (maptype === 'roadmap') {
				    map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
				    roadmapControl.className = 'selected_cusbtn';
				    skyviewControl.className = 'cusbtn';
				} else {
				    map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
				    skyviewControl.className = 'selected_cusbtn';
				    roadmapControl.className = 'cusbtn';
				}
			}

			// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
			function zoomIn() {
			    map.setLevel(map.getLevel() - 1);
			}
			// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
			function zoomOut() {
				map.setLevel(map.getLevel() + 1);
			}
			
			// formMypetImageInput 이미지 업로드 함수
			function setThumbnail(event) {
			    // 함수 작동 도중 다른 키 입력 방지
			    event.preventDefault();
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
			    for (let i = 0; i < files.length; i++) {
			        missingFormImage[i] = new Image();
			        missingFormImage[i].src = URL.createObjectURL(files[i]);
			    }

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

			        carouselItem.appendChild(img);
			        carousel.appendChild(carouselItem);

			        // 첫 번째 아이템을 활성화
			        if (i === 0) {
			            carouselItem.classList.add('active');
			        }
			    }

			    // 업로드된 이미지의 개수가 3개 미만이면, 기본 이미지를 추가하여 캐러셀을 완성
			    const remainingCount = 3 - missingFormImage.length;
			    for (let i = 0; i < remainingCount; i++) {
			    	console.log("기본"+i);
			        const carouselItem = document.createElement('div');
			        carouselItem.className = 'carousel-item';

			        const img = document.createElement('img');
			        img.src = defaultImageSrc;
			        img.className = 'd-block w-100';
			        img.alt = `Default Image ${i + 1}`;

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
		</script>
		<!-- Map Script End -->
	</body>
</html>