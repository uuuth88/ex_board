<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<c:set value="${getArticle }" var="artcl"/>
<!--/header.html-->
<style>
    .i-thumbs{
        float: right;
        margin-right: 0;
    }
    ul{
          list-style: none;
    }
</style>
<div class="wrapper mx-5 my-5">
    <div class="row">
        <div class="col-lg-12">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">#글번호</label>
                <div class="col-sm-10">
                <input class="form-control" name="bno" value='<c:out value="${artcl.bno }" />' disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                <input class="form-control" name="title" value='<c:out value="${artcl.title }" />' disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                <textarea class="form-control" rows="10" name="content" disabled><c:out value="${artcl.content }" /></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">작성자</label>
                <div class="col-sm-10">
                <input class="form-control" name="writer" value='<c:out value="${artcl.nickname }" />' disabled>
                </div>
            </div> 
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">작성일</label>
                <div class="col-sm-10">
                <input class="form-control" name="writedate" value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${artcl.writeDate }"/>' disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">수정일</label>
                <div class="col-sm-10">
                <input class="form-control" name="modifydate" value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${artcl.modifyDate }"/>' disabled>
                </div>
            </div>    
            <!--작성자 이외의 화면-->                      
            <div class="form-group row">
                <div class="col-sm-5"></div>
                <div class="col-sm-2">
                    <div class="btn-group mx-auto my-2" role="group" aria-label="Basic example">
                        <button type="button" id="likeBtn" class="btn btn-info" onclick="updateLike()">&nbsp;
                        	<i class="fas fa-thumbs-up"></i> &nbsp;추천 &nbsp;<c:out value="${artcl.likeCnt }"/>
                       	</button>
                        <button type="button" id="hateBtn" class="btn btn-secondary" onclick="updateHate()">
                        	<i class="fas fa-thumbs-down"></i> 비추천 -&nbsp;<c:out value="${artcl.hateCnt }"/>
                       	</button>
                    </div>
                </div>
                <div class="col-sm-5"></div>
            </div>

            <!--글 작성자 화면-->
            <div class="form-group row">
                <div class="col-sm-5"></div>
                <div class="col-sm-3">
                    <div class="btn-group mx-auto my-2" role="group" aria-label="Basic example">
                    	<button type="button" class="btn btn-primary modBtn">수정하기</button>
                        <button type="button" class="btn btn-outline-secondary listBtn">목록으로</button>
                        <button type="button" class="btn btn-outline-primary" onclick="alert('글을 삭제하시겠습니까?');">글 삭제</button>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>            
            <form id="pageForm" method="get" action="">
            	<input type="hidden" name="bno" value="<c:out value='${artcl.bno }'/>">
            	<input type="hidden" name="pageNo" value="<c:out value='${cri.pageNo }'/>">
            	<input type="hidden" name="pageSize" value="<c:out value='${cri.pageSize }'/>">
        	    <input type="hidden" name="key" value="<c:out value='${cri.key }'/>">
        		<input type="hidden" name="word" value="<c:out value='${cri.word }'/>">
            </form>
        </div>
    </div>
    
    <hr>
    
<!-- 댓글 영역 -->
<div class="row">
	<div class="col-lg-12 replyDiv">
		<ul class="replyul"><span>댓글을 달아주세요!</span>
<!-- 			<li class="replyno"> -->
<!-- 				<div class="row"> -->
<!-- <!--댓글작성자-->     
<!-- 					<div class="replyer col-lg-2"> -->
<!-- 						<label class="col-form-label"><i class="fas fa-user"></i>&nbsp;&nbsp; -->
<%-- 							<c:out value="${loginmember.nickname }" /> --%>
<!-- 						</label> -->
<!-- 					</div> -->
<!-- <!--댓글 내용-->
<!-- 					<div class="replycontent col-lg-8"> -->
<!-- 						<textarea class="form-control" name="replyContent" rows="1" readonly onclick="showModal();">###</textarea> -->
<!-- 					</div> -->
<!-- <!--댓글작성일,추천,비추천-->
<!-- 					<div class="replydate col-lg-2"> -->
<!-- 						<label class="col-form-label"><small> -->
<%-- 							<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${artcl.writeDate }"/> --%>
<!-- 						</small></label><br> -->
<!-- 						<small> -->
<!-- 							<span id="replyLike" onclick="updateReplLike()"><i class="fas fa-thumbs-up"></i> 추천 </span>0 |  -->
<!-- 							<span id="replyHate" onclick="updateReplHate()"><i class="fas fa-thumbs-down"></i> 비추천</span>0 -->
<!-- 						</small> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<br> -->
<!--대댓글-->   
<!-- 				<ul> -->
<!-- 					<li> -->
<!-- 					<div class="row"> -->
<!-- <!--대댓글작성자-->     
<!-- 						<div class="replyer col-lg-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp; -->
<!-- 							<label class="col-form-label"><i class="fas fa-user"></i>&nbsp; -->
<%-- 								<c:out value="${loginmember.nickname }" /> --%>
<!-- 							</label> -->
<!-- 						</div> -->
<!-- <!--대댓글 내용-->
<!-- 						<div class="replycontent col-lg-8"> -->
<!-- 							<textarea class="form-control" name="replyContent" rows="1" readonly onclick="showModal();">###</textarea> -->
<!-- 						</div> -->
<!-- <!--대댓글작성일,추천,비추천 -->
<!-- 						<div class="replydate col-lg-2"> -->
<!-- 							<label class="col-form-label"> -->
<%-- 								<small><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${artcl.writeDate }"/></small> --%>
<!-- 							</label><br> -->
<!-- 							<small> -->
<!-- 								<span id="replyLike" onclick="updateReplLike()"><i class="fas fa-thumbs-up"></i> 추천 </span>0 |  -->
<!-- 								<span id="replyHate" onclick="updateReplHate()"><i class="fas fa-thumbs-down"></i> 비추천</span>0 -->
<!-- 							</small> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</li> -->
		</ul>
<!--댓글버튼-->
	<hr>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label"><i class="fa fa-comment"></i> 댓글</label>
		<div class="col-sm-10">
			<input type="hidden" name="rplWriter" value='<c:out value="${loginmember.email }"/>'>
			<textarea class="form-control"  rows="3" name="rplContent" placeholder="댓글 내용을 입력하세요."></textarea>
			<button id="addRplBtn" type="submit" class="btn btn-primary btn-block">댓글등록</button>
		</div>
	</div>
<!--/댓글버튼-->
	</div>
</div>
<!-- 댓글 달기 스크립트 -->
	<script>

	</script>
<!-- 대댓글 달기 스크립트 -->
	<script>
    function eoeotrmf(){
        var rerepl = document.querySelector('li.replyno ul');
        console.log('대댓글 생성');
        var str = "";
        str += '<li>';
        str += '<div class="row">';
        str += '<div class="replyer col-lg-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;<label class="col-form-label"><i class="fas fa-user"></i>&nbsp;';
        str += '댓글 작성자를 출력하는 c태그 선언';
        str += '</label></div>';
        str += '<div class="replycontent col-lg-8"><textarea class="form-control" name="replyContent" rows="1" readonly onclick="showModal();">';
        str += '댓글 내용 출력하는 c태그 선언';
        str += '</textarea></div>';
        str += '<div class="replydate col-lg-2">';
        str += '<label class="col-form-label"><small>';
        str += '댓글 작성일을 출력하는 c태그 선언';
        str += '</small></label><br>';
        str += '<small><span id="replyLike" onclick="updateReplLike()"><i class="fas fa-thumbs-up"></i> 추천 </span>0 | <span id="replyHate" onclick="updateReplHate()"><i class="fas fa-thumbs-down"></i> 비추천</span>0</small>';
        str += '</div>';
        str += '</div>';
        str += '</li>';

        rerepl.innerHTML += str;
        $('.modal').modal('hide');
    }
	</script>

<!--모달창-->
<div class="modal" id="rplModal">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">댓글 달기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="form-group row">
                <div class="col-sm-12">
                    <textarea class="form-control" rows="3" name="modalContent"></textarea>
                </div>
            </div>            
        </div>
        <div class="modal-footer">
        </div>
    </div>
    </div>
</div>
<!--/모달창-->


<!--브라우저상에서 추천기능구현 -->
<script src="${contextPath }/resources/js/getXhrObj.js"></script>
<script src="${contextPath }/resources/js/like_hate_update.js"></script>
<script src="${contextPath }/resources/js/modal_btn.js"></script>
<script>
//	본문 추천, 비추천 변수선언
	var lcnt = '<c:out value="${artcl.likeCnt }"/>';
	var lcnt2 = '<c:out value="${artcl.likeCnt }"/>';
	var hcnt = '<c:out value="${artcl.hateCnt }"/>';
	var hcnt2 = '<c:out value="${artcl.hateCnt }"/>';
	var alreadyLikeClick = false;
	var alreadyHateClick = false;
	var likeBtn = document.getElementById("likeBtn");
	var hateBnt = document.getElementById("hateBtn");
	
	
// 	모달창 버튼 만들기 변수선언
    var modal = document.querySelector(".modal");
    var modalFooter = document.querySelector(".modal-footer");

    var btnNode = document.createElement("button");
    var btnNode2 = document.createElement("button");
    var btnNode3 = document.createElement("button");
    var btnNode4 = document.createElement("button");
        
    var modTextNode = document.createTextNode("수정");    
    var delTextNode = document.createTextNode("삭제");
    var closeTextNode = document.createTextNode("닫기");
    var replyTextNode = document.createTextNode("댓글달기");  	
</script>
<script>
//	본문 추천, 비추천 ajax 기능 구현
	function updateLikeAjax(){
	    xhr.onreadystatechange = function(){
	        if(xhr.readyState===4 && xhr.status===200){
				console.log('좋아요 추천...');
	        }
	    }
	    xhr.open("put", "${contextPath}/commons/like/${artcl.bno}", "true");
	    xhr.send();
	}
	function updateHateAjax(){
	    xhr.onreadystatechange = function(){
	        if(xhr.readyState===4 && xhr.status===200){
				console.log('싫어요 추천...');
	        }
	    }
	    xhr.open("put", "${contextPath}/commons/hate/${artcl.bno}", "true");
	    xhr.send();
	}
</script>
<!--js script-->

<!--footer.html-->
<%@ include file="../includes/footer.jsp" %>
<script>
$(document).ready(function() {
	var pageForm = $("#pageForm");
	var listBtn = $(".listBtn");
	var modBtn = $(".modBtn");
	
	listBtn.on("click", function(){
		pageForm.attr("action","/board/listArticle.uth");
		var inputBno = $("input[name='bno]").clone();
		var inputPageNo = $("input[name='pageNo']").clone();
		var inputPageSize = $("input[name='pageSize']").clone();
		var inputKey = $("input[name='key']").clone();
		var inputWord = $("input[name='word']").clone();
		
		pageForm.empty();
		pageForm.append(inputBno);
		pageForm.append(inputPageNo);
		pageForm.append(inputPageSize);
		pageForm.append(inputKey);
		pageForm.append(inputWord);
		
		pageForm.submit();
	});
	
	modBtn.on("click", function() {
		pageForm.attr("action","/board/modifyArticle.uth");
		var inputBno = $("input[name='bno]").clone();
		var inputPageNo = $("input[name='pageNo']").clone();
		var inputPageSize = $("input[name='pageSize']").clone();
		var inputKey = $("input[name='key']").clone();
		var inputWord = $("input[name='word']").clone();
		
		pageForm.append(inputBno);
		
		pageForm.submit();
	});
});
</script>
<!-- 댓글 함수 -->
<script type="text/javascript" src="${contextPath }/resources/js/reply.js"></script>
<script>
$(document).ready(function(){

	console.log('----------');
	
	var bnoVal = '<c:out value="${artcl.bno }"/>';
	var replyUL = $(".replyul");

	showList();
//	댓글 목록	
	function showList(){
		replyService.getReplyList({bno:bnoVal},function(replyCnt,rplList){
			
			var str = "";
			if(rplList==null || rplList.length == 0){
				return;
			}
			for(var i=0, len=rplList.length||0; i<len; i++){
		        str += '<hr><li data-rno="'+rplList[i].rno+'">';
		        str += '<div class="row">';
		        str += '<div class="replyer col-lg-2"><label class="col-form-label"><i class="fas fa-user"></i>&nbsp;&nbsp;';
		        str += rplList[i].nickname;
		        str +='</label></div>';
		        str += '<div class="replycontent col-lg-8"><textarea class="form-control" name="replyContent" rows="1" readonly>';
		        str += rplList[i].rplContent;
		        str += '</textarea></div>';
		        str += '<div class="replydate col-lg-2"><label class="col-form-label"><small>';
		       	str += rplList[i].rplDate;
		       	str += '</small></label><br>';
		        str += '<small><span id="replyLike" onclick="updateReplLike()"><i class="fas fa-thumbs-up"></i> 추천 </span>0 | <span id="replyHate" onclick="updateReplHate()"><i class="fas fa-thumbs-down"></i> 비추천</span>0</small>';
		        str += '</div></div>';
			}
			replyUL.html(str);
		});
	}

//	댓글 등록
	var inputRplContent = document.querySelector("textarea[name='rplContent']");
	var inputWriter = document.querySelector("input[name='rplWriter']");
	
	$("#addRplBtn").on("click", function(e){
		var reply = {
				bno:bnoVal, rplContent: inputRplContent.value, writer: inputWriter.value
		};
		
		replyService.insertReply(reply, function(result){
			alert('댓글 등록에 성공했습니다.');
			showList();
		});
		
	});

	var modal = $("#rplModal");
	var modalContent = document.querySelector("textarea[name='modalContent']");
//	댓글 조회
	replyUL.on("click", "li", function(e){
		var rno = $(this).data("rno");
		replyService.selectReply(rno, function(reply){
			console.log('selectReply를 실행합니다 >>> '+rno);
			console.log("댓글 내용 : "+reply.rplContent);
			modalContent.value = reply.rplContent;
			showModal();

//			댓글 수정 버튼 클릭시 아래 코드 실행			
			$("#modalModBtn").click(function(e){
				var reply = {rno: rno, rplContent: modalContent.value};
				console.log("모달 댓글 번호 : "+reply.rno);
				console.log("모달 댓글 내용 : "+reply.rplContent);
				replyService.modifyReply(reply, function(result){
					alert(result);
					modal.modal("hide");
					showList();
				});
			});
			
//			댓글 삭제 버튼 클릭시 아래 코드 실행
			$("#modalDelBtn").click(function(e){
				console.log("댓글 삭제");
				replyService.deleteReply(rno, function(result){
					alert(result);
					modal.modal("hide");
					showList();
				});
			});
			
		});
	});

})
</script>    
</body>
</html>