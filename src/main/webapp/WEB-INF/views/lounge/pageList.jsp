<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

					<!-- paging 삽입부분 -->
					<c:forEach items="${list}" var="bag">
						<div class="bg-light rounded">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${bag.lounge_pet_type}</span>
								</div>
							</div>
							<a href="detail?lounge_id=${bag.lounge_id}">
								<div>
									<h5
										style="padding: 6px; overflow: hidden; text-overflow: ellipsis;">${bag.lounge_title}</h5>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div
										style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${bag.lounge_content}</div>
									<c:if
										test="${not empty bag.lounge_img and bag.lounge_img ne null}">
										<img alt="" src="../resources/upload/${bag.lounge_img}"
											width="80" height="80">
									</c:if>
								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="flex: 1; padding: 5px;">${bag.lounge_writer}</div>
								<div style="flex: 1; padding: 5px;">댓글:
									${bag.lounge_replyCount}</div>
								<div style="flex: 1; padding: 5px;">
									<c:if test="${bag.likeState == 1}">
										<img alt="like" src="../resources/img/heart-On.png"> ${bag.likeCnt}
									</c:if>
									<c:if test="${bag.likeState == 0}">
										<img alt="like" src="../resources/img/heart-Off.png"> ${bag.likeCnt}
									</c:if>

								</div>
								<div style="flex: 1; padding: 1px;">${bag.lounge_date}</div>
							</div>
							<hr>
						</div>
					</c:forEach>