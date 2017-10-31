<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
.main {
	width: 100%;
	height: 100%;
	position: relative;
} /*position ???????????*/
.main .work {
	width: 100%;
	height: auto;
	position: relative;
	overflow: hidden;
} /*position work_title�� ���� ����*/
.main .work .work_title {
	width: 100%;
	position: absolute;
	top: 50%;
	margin-top: -40%;
	text-align: center;
} /*position .main .work�� ����* 
/* ����top���� ���ڳ����̸� �����Ͽ��� */
.main .work .media {
	display: block;
	width: 100%;
}

.main .work .caption {
	background: rgba(0, 0, 0, 0.6);
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;		
	opacity: 0;
	transition: all 0.8s;
}
/*position .main .work�� ����*/
.main .work a:hover .caption {
	opacity: 1;
}

.main .work .caption h1 {
	color: #fff;
	font-size: 16px;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #fff;
	padding: 20px;
	width: 100%; /*margin:auto�� ����� ���� �ִ�. �߰�����*/
	display: inline-block;
} /*text-align�ص� ������ ��� ������ �ȵǼ� �ζ������� �ٲ�.*/
</style>

<!--  
   <section class="main clearfix">
      <div class="work">
         <a href="#">
            <img src="/images/a.jpg" alt="" class="media">
            <div class="caption">
               <div class="work_title">
                  <h1>Music App Interface</h1>
               </div><!--work_title->
            </div><!--caption->            
         </a>
      </div><!--work1->   

   </section>
 -->

<div>
	<h2 class="text-center">Favorites List</h2>
</div>
<br>
<div>
	<div class="col-xs-7" style="text-align:center">
		�� <b>${cnt }</b> ���� ���ã�Ⱑ ��ϵǾ� �ֽ��ϴ�.
	</div>

	<a href="/booth/list"><button
			class="w3-btn w3-black w3-round-large">��ü�������</button></a>
</div>
<br>
<div class="w3-container main">

	<div class="row">
		<!-- ù��° �ν� -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/a.jpg">
						<div class="caption">
							<div class="work_title">
								<h1>�ν���(db)</h1>
								</br>
								<h2>�ν��Ұ�(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>
		<!-- 2��° �ν� -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/b.jpg">
						<div class="caption">
							<div class="work_title">
								<h1>�ν���(db)</h1>
								</br>
								<h2>�ν��Ұ�(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>

		<!-- 3��° �ν� -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/c.jpg">
						<div class="caption">
							<div class="work_title">
								<h1>�ν���(db)</h1>
								</br>
								<h2>�ν��Ұ�(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>

		<!-- 4��° �ν� -->
		<div class="col-sm-3 panel-body" align="center">
			<div class="work">
				<div class="media-top">
					<a href="#"> <img class="media-object media"
						src="/images/default.png">
						<div class="caption">
							<div class="work_title">
								<h1>�ν���(db)</h1>
								</br>
								<h2>�ν��Ұ�(db)</h2>
							</div>
						</div>
					</a>
				</div>
			</div>
			<!-- media tag end -->
		</div>

	</div>

</div>


<!-- ������ ó�� -->
<div align="center">
	<c:if test="${param.page ne 1 }">
		<a href="/booth/list?page=${param.page -1 }"
			style="text-decoration: none"> <b style="color: #9c9892;">��</b>
		</a>
	</c:if>
	<c:forEach var="i" begin="1" end="${size }" varStatus="vs">
		<c:choose>
			<c:when test="${i eq param.page }">
				<b style="color: #ff9800;">${i }</b>
			</c:when>
			<c:otherwise>
				<a href="/booth/list?page=${i }" style="text-decoration: none"><b
					style="color: #9c9892;">${i }</b></a>
			</c:otherwise>
		</c:choose>
		<c:if test="${!vs.last }"> | </c:if>
	</c:forEach>
	<c:if test="${param.page ne last }">��</c:if>
</div>