<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<c:set value="${board}" var="board"/>
<!--/header.html-->
<style>
    ul{
          list-style: none;
    }
</style>
<div class="wrapper mx-5 my-5">
    <div class="row">
        <div class="col-lg-12">
        <form method="post" action="/board/modifyArticle.uth">
        	<input type="hidden" name="bno" value="<c:out value='${board.bno }'/>">
        	<input type="hidden" name="writer" value="<c:out value='${loginmember.nickname }'/>">
        	<input type="hidden" name="writedate" value="<c:out value='${board.writeDate }'/>">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">#글번호</label>
                <div class="col-sm-10">
                <input class="form-control" name="bno" value="<c:out value='${board.bno }'/>" disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" name="title" value="<c:out value='${board.title }'/>">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                <textarea class="form-control" rows="10" name="content"><c:out value='${board.content }'/></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">작성자</label>
                <div class="col-sm-10">
                <input class="form-control" name="writer" value="<c:out value='${loginmember.nickname }'/>" disabled>
                </div>
            </div> 
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">작성일</label>
                <div class="col-sm-10">
                <input class="form-control" name="writedate" value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.writeDate }'/>" disabled>
                </div>
            </div> 
            <div class="form-group row">
                <label class="col-sm-2 col-form-label" for="exampleInputFile">파일 업로드</label>
                <div class="col-sm-9">
                    <!-- <input type="file" class="form-control-file" name="uploadFile" aria-describedby="fileHelp" multiple> -->
                    <small id="fileHelp" class="form-text text-muted">exe,sh,zip,alz,jar 파일은 업로드할 수 없습니다.</small>
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-secondary inline-block" id="uploadBtn">업로드</button>
                </div>
            </div>
            <div class="form-group row uploadDiv">
                <label class="col-sm-2 col-form-label" for="exampleInputFile">파일 목록</label>
                <div class="col-sm-10 uploadResult">
                    <ul></ul>
                </div>
            </div>                                    
            <div class="form-group row">
                <div class="col-sm-5"></div>
                <div class="col-sm-2">
                    <div class="btn-group mx-auto my-2" role="group" aria-label="Basic example">
                        <button type="submit" class="btn btn-primary">수정하기</button>
                        <button type="button" class="btn btn-secondary" onclick="moveBoardList()">목록으로</button>
                    </div>
                </div>
                <div class="col-sm-5"></div>
            </div>
        </form>                
        </div>
        <form id="operForm" action="">
        </form>
    </div>
</div>    

<!--js script-->
<script src="${contextPath }/resources/js/move_page.js"></script>
<!--footer.html-->
<%@ include file="../includes/footer.jsp" %>
</body>
</html>