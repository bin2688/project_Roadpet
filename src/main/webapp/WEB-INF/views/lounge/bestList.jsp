<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div style="display: flex; gap: 20px;  margin: auto;">
		<c:if test="${empty bestList}">
			<div style="text-align: center;">최근 인기 게시글이 없습니다</div>
		</c:if>
	<c:forEach items="${bestList}" var="vo">
		<div class="bg-light rounded"
			style="max-width: 350px; overflow: hidden; white-space: nowrap; border: 3px solid #ccc; padding: 20px;">
			<div style="display: flex; gap: 20px;">
				<div>
					<span class="badge bg-warning">${vo.lounge_pet_type}</span>
				</div>
			</div>
		<a href="detail?lounge_id=${vo.lounge_id}">
			<div>
				<h6 style="padding: 5px; overflow: hidden; text-overflow: ellipsis;">${vo.lounge_title}</h6><hr>
				
			</div>
			<div style="display: flex; align-items: center; padding: 5px;">
				<div
					style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${vo.lounge_content}</div>
				<c:if test="${not empty vo.lounge_img and vo.lounge_img ne null}">
					<img alt="" src="resources/upload/${vo.lounge_img}" width="40"
						height="40">
				</c:if>
				<hr>
			</div>
			</a>
			<div style="display: flex; justify-content: space-between;">
				<div style="padding: 10px;">${vo.lounge_writer}</div>
				<div style="padding: 10px;">댓글: ${vo.lounge_replyCount}</div>
				<div style="padding: 10px;">
					<c:choose>
						<c:when test="${vo.likeState == 1}">
							<img alt="like" src="resources/img/heart-On.png">${vo.likeCnt}
								</c:when>
						<c:otherwise>
							<img alt="like" src="resources/img/heart-Off.png">${vo.likeCnt}
								</c:otherwise>
					</c:choose>
				</div>
				<div style="padding: 7px;">${vo.lounge_date}</div>
			</div>
		</div>
	</c:forEach>
</div>