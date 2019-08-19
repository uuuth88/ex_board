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
                <input class="form-control" name="writer" value='<c:out value="${loginmember.nickname }" />' disabled>
                </div>
            </div> 
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">작성일</label>
                <div class="col-sm-10">
                <input class="form-control" name="writedate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${artcl.writeDate }"/>' disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">수정일</label>
                <div class="col-sm-10">
                <input class="form-control" name="modifydate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${artcl.modifyDate }"/>' disabled>
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
                        <button type="button" class="btn btn-primary" onclick="moveModifyPage()">수정하기</button>
                        <button type="button" class="btn btn-outline-secondary" onclick="moveBoardList()">목록으로</button>
                        <button type="button" class="btn btn-outline-primary" onclick="alert('글을 삭제하시겠습니까?');">글 삭제</button>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>            
            <form id="operForm" action="">
            </form>
        </div>
    </div>
    <hr>
    <!-- 댓글 영역 -->
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"><i class="fas fa-user"></i> 댓글러(replyer)</label>
                <div class="col-sm-8">
                <textarea class="form-control" name="replyContent" rows="1" readonly onclick="showModal();">댓글 내용을 표시합니다. 클릭하면 모달창으로 대댓글을 달거나 추천, 비추천 기능을 넣습니다.</textarea>
                </div>   
                <div class="col-sm-2 px-5 i-thumbs">
                    2019/11/11 23:11:11
                    <small class="i-thumbs"><span id="replyLike" onclick="updateReplLike()"><i class="fas fa-thumbs-up"></i> 추천</span> | <span id="replyHate" onclick="updateReplHate()"><i class="fas fa-thumbs-down"></i> 비추천</span> </small>
                </div>
            </div>


<ul>
    <li>
<!--대댓글 영역-->            
<div class="form-group row">
<label class="col-sm-2 col-form-label">ㄴ <i class="fas fa-user"></i> 댓글러(replyer)</label>
<!-- <div class="col-sm-1"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<div class="col-sm-8">
<textarea class="form-control" name="replyReContent" rows="1" readonly onclick="showModalInReReply();">댓글 내용을 표시합니다. 클릭하면 모달창으로 대댓글을 달거나 추천, 비추천 기능을 넣습니다.</textarea>
</div>   
<div class="col-sm-2 px-5 i-thumbs">
2019/11/11 23:13:13
<small class="i-thumbs"><span onclick="alert('추천');"><i class="fas fa-thumbs-up"></i> 추천</span> 0 | <span onclick="alert('비추천');"><i class="fas fa-thumbs-down"></i> 비추천</span> -0</small>
</div>
</div>
<!--/대댓글 영역-->
</li>
</ul>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"><i class="fa fa-comment"></i> 댓글</label>
                <div class="col-sm-10">
                <textarea class="form-control" rows="3" name="replyContent"><c:out value="댓글을 작성합니다."/></textarea>
                <button type="submit" class="btn btn-primary btn-block">댓글등록</button>
                </div>
            </div>
        </div>
        <div class="oanel-body">
            <ul class="chat">
            </ul>
        </div>
        <div class="panel-footer">
        </div>
    </div>
    <!--//댓글영역 끝-->
</div>

<!--모달창-->
<div class="modal">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">대댓글 달기</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="form-group row">
                    <div class="col-sm-12">
                    <textarea class="form-control" rows="3" name="replyContent"><c:out value="댓글을 작성합니다."/></textarea>
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
<script>
    // 글 수정페이지, 리스트 페이지로 이동하는 함수 스크립트
    function moveModifyPage(){
        document.location.href="modify_article.html";
    }
    function moveBoardList(){
        document.location.href="list_article.html";
    }
</script>

<!--footer.html-->
<%@ include file="../includes/footer.jsp" %>
    
</body>
</html>