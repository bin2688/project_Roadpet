<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<div class="container-fluid pt-4 px-4 comment">
		<div class="bg-light rounded">
			<div style="display: flex; justify-content: space-between;">
				<div style="padding: 5px;">hongg</div>
				<div style="padding: 5px;">${reply_date}</div>
			</div>
			<div class="rpContent">
				<div style="padding: 20px;">${reply_content}</div>
				<div style="display: flex; justify-content: flex-end;">
					<button class="btn btn-primary w-20 m-2"
						id="rpUpdateBtn_${reply_id}" data-reply_id="${reply_id}"
						name="reply_content" value="${reply_content}">댓글수정</button>
					<form action="rpDelete">
						<button class="btn btn-primary w-20 m-2" name="reply_id"
							value="${reply_id}">댓글삭제</button>
					</form>
				</div>
			</div>
			<div class="editForm" style="display: none;">
				<input type="hidden" id="reply_id" name="reply_id"
					value="${reply_id}">
				<textarea class="form-control newReply">${reply_content}</textarea>
				<button class="btn btn-primary w-20 m-2 rpEditDoneBtn"
					data-reply_id="${reply_id}">수정 완료</button>
			</div>
		</div>
	</div>
