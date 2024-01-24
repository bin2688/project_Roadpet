<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<div style="display: flex; flex-direction: row; gap: 20px;">
					<c:forEach items="${bestList}" var="vo">
						<div class="bg-light rounded"
							style="max-width: 200px; overflow: hidden; white-space: nowrap;">
							<div style="display: flex; gap: 20px;">
								<div>
									<span class="badge bg-warning">${vo.lounge_pet_type}</span>
								</div>
							</div>
							<a href="one?lounge_id=${vo.lounge_id}">
								<div>
									<h6 style="padding: 5px;">${vo.lounge_title}</h6>
								</div>
								<div style="display: flex; align-items: center; padding: 5px;">
									<div style="flex: 1; padding-right: 10px; overflow: hidden; text-overflow: ellipsis;">${vo.lounge_content}</div>
									<img alt="" src="../resources/upload/${vo.lounge_img}" width="40" height="40">
								</div>
							</a>
							<div style="display: flex; justify-content: space-between;">
								<div style="padding: 2px;">${vo.lounge_writer}</div>
								<div style="padding: 2px;">댓글: ${vo.lounge_replyCount}</div>
								<div style="padding: 2px;">
									<img alt="like" src="../resources/img/heartDefault.png">
									${vo.lounge_likeCount}
								</div>
								<div style="padding: 2px;">${vo.lounge_date}</div>
							</div>

						</div>
					</c:forEach>
				</div>