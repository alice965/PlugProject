<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div align="center">
<h3>쪽지보내기</h3>
	<div align="left" style="width: 70%; line-height: 30px;">
	<form action="/memo/send" method="memo" autocomplete="off">
		<p>
			<b>받을사람</b><br /><input type="text" name="receiver" placeholder="받을사람"
				 style="width: 100%;" />
		</p>
		<p>
			<textarea rows="1" name="title" placeholder="보내실 쪽지의 제목을 작성해주세요." 	style="width: 100%; resize:none;"></textarea>
		</p>
		<p>
			<b>보낼내용</b><br />
			<textarea rows="10" name="content" placeholder="보내실 쪽지의 내용을 입력해주세요." 	style="width: 100%; resize:none;"></textarea>
		</p>
		<p>
			<button type="submit" style="width: 100%">쪽지보내기</button>
			
			<!-- <button type="reset">재작성</button> -->
		</p>
	</form>
</div>
</div>