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
                <form method="get" action="" class="countLH">
                    <div class="btn-group mx-auto my-2" role="group" aria-label="Basic example">
                        <button type="button" class="btn btn-info" onclick="alert('추천');">&nbsp;
                        	<i class="fas fa-thumbs-up" onclick="alert('추천');"></i> &nbsp;추천 &nbsp;<c:out value="${artcl.likeCnt }"/>
                       	</button>
                        <button type="button" class="btn btn-secondary" onclick="alert('비추천');">
                        	<i class="fas fa-thumbs-down" onclick="alert('비추천');"></i> 비추천 -<c:out value="${artcl.hateCnt }"/>
                       	</button>
                    </div>
                    <input type="hidden" name="like" value="">
                    <input type="hidden" name="hate" value="">
                </form>
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
                    <small class="i-thumbs"><span onclick="alert('추천');"><i class="fas fa-thumbs-up"></i> 추천</span> 0 | <span onclick="alert('비추천');"><i class="fas fa-thumbs-down"></i> 비추천</span> -0</small>
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

<script>
    // 모달창 버튼 만들기 스크립트
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

    function showModal(){
        $(modal).modal("show");
        //댓글 글쓴이일 경우 수정과 삭제하기 버튼 활성화
        createModBtn();
        createDelBtn();
        createCloseBtn();
        //글쓴이가 아닐 경우 추천과 비추천 버튼 활성화 & 대댓글 쓰기 기능 구현  
        createReplyBtn();
    }

    function showModalInReReply(){
        //대댓글 글쓴이일 경우 모달창은 수정하기와 삭제하기만 구현
        //글쓴이가 아닐 경우 클릭 X 
        $(modal).modal("show");
        createModBtn();
        createDelBtn();
        createCloseBtn();
    }

    function createReplyBtn(){
        btnNode4.setAttribute("class","btn btn-success");
        btnNode4.setAttribute("type","button");
        btnNode4.appendChild(replyTextNode);
        modalFooter.appendChild(btnNode4);
    }
    function createModBtn(){
        btnNode.setAttribute("class", "btn btn-info");
        btnNode.setAttribute("type","button");
        btnNode.appendChild(modTextNode);
        modalFooter.appendChild(btnNode);
    }
    function createDelBtn(){
        btnNode2.setAttribute("class", "btn btn-primary");
        btnNode2.setAttribute("type","button");
        btnNode2.appendChild(delTextNode)
        modalFooter.appendChild(btnNode2);
    }
    function createCloseBtn(){
        btnNode3.setAttribute("type","button");
        btnNode3.setAttribute("class","btn btn-secondary");
        btnNode3.setAttribute("data-dismiss","modal");
        btnNode3.appendChild(closeTextNode);
        modalFooter.appendChild(btnNode3);
    }
</script>

<!--footer.html-->
    <footer class="my-auto">
        <i class="fab fa-github"></i>&nbsp;&nbsp;<a href="https://github.com/uuuth88" id="toGitNBlog" target="_blank">uuuth's github</a>&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; <i class="fas fa-blog"></i>&nbsp;&nbsp;<a href="https://uuuth.tistory.com/" id="toGitNBlog" target="_blank">uuuth's blog</a>
    </footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>    