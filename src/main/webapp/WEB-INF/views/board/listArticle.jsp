<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

    <style>
        th, td{
            text-align: center;
            /* display: inline-block; */
            /* width : 500px; */
            white-space: nowrap;
            /* overflow: hidden; */
            text-overflow: ellipsis;            
        }
        #title{
          display: inline-block;
          width : 500px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }
        .page-link.active{
        	background-color: #D9230F;
        	color: #fff;
        }
    </style>    
    <div class="container board-container my-5 mx-auto">   
    <c:set var="member" value="${loginmember }"/>  
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">#no.</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">날짜</th>
                <th scope="col">조회수</th>
                <th scope="col">추천</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="article" items="${articles }">
              <tr class="col-sm-12">
                <td scope="row"><c:out value="${article.bno }"/></td>
                <td class="col-sm-6">
                  <a class="getArticle" href="<c:out value='${article.bno }'/>" id="title"><c:out value="${article.title }"/></a> 
                </td>
                <td class="col-sm-2"><c:out value="${member.nickname}"/></td>
                <td class="col-sm-2"><fmt:formatDate pattern="yyyy/MM/dd" value="${article.writeDate }"/></td>
                <td class="col-sm-1"><c:out value="${article.viewCnt }"/></td>
                <td class="col-sm-1"><c:out value="${article.likeCnt-article.hateCnt }"/></td>
              </tr>
            </c:forEach>
            </tbody>
          </table> 
          <button type="button" class="btn btn-outline-info btn-block" id="writeBtn" onclick="moveWritePage()">글쓰기</button>
    </div>
    
    
 <!-- 페이징 처리 -->     
    <div class="container container-bottom">
        <div class="row mx-auto">
            <ul class="pagination mr-auto">
            <c:if test="${pageNav.prev }">
                <li class="page-item">
                	<a class="page-link prev" href="${pageNav.start-1 }">&laquo;</a>
                </li>
            </c:if>
            <c:forEach begin="${pageNav.start }" end="${pageNav.end }" var="pageNum">
                <li class="page-item">
                	<a class="page-link ${pageNav.cri.pageNo == pageNum ? 'active':'' }" href="${pageNum }">${pageNum}</a>
                </li>
            </c:forEach>
            <c:if test="${pageNav.next }">
                <li class="page-item">
                	<a class="page-link next" href="${pageNav.end+1 }">&raquo;</a>
                </li>
            </c:if>
            </ul>  
            <form id="pageForm" method="get" action="/board/listArticle.uth">
        		<input type="hidden" name="pageNo" value="<c:out value='${pageNav.cri.pageNo }'/>">
        		<input type="hidden" name="pageSize" value="<c:out value='${pageNav.cri.pageSize }'/>">
        		<input type="hidden" name="key" value="<c:out value='${pageNav.cri.key }'/>">
        		<input type="hidden" name="word" value="<c:out value='${pageNav.cri.word }'/>">
        	</form>         
            <form id="searchForm" method="get" action="/board/listArticle.uth" class="col-lg-6"> 
            	<div class="form-group row col-lg-12 mx-5">
                    <select class="custom-select col-lg-3 mx-1" name="key"> 
                      <option value="" <c:out value="${pageNav.cri.key eq null ? 'selected' : '' }"/>>--</option> 
                      <option value="T" <c:out value="${pageNav.cri.key eq 'T' ? 'selected' : '' }"/>>제목</option> 
                      <option value="C" <c:out value="${pageNav.cri.key eq 'C' ? 'selected' : '' }"/>>내용</option> 
                      <option value="N" <c:out value="${pageNav.cri.key eq 'N' ? 'selected' : '' }"/>>작성자</option>
                      <option value="TC" <c:out value="${pageNav.cri.key eq 'TC' ? 'selected' : '' }"/>>제목+내용</option> 
                      <option value="TN" <c:out value="${pageNav.cri.key eq 'TN' ? 'selected' : '' }"/>>제목+작성자</option> 
                      <option value="TCN" <c:out value="${pageNav.cri.key eq 'TCN' ? 'selected' : '' }"/>>모두</option>
                    </select>
                <input class="form-control mr-lg-2 col-lg-6" type="text" placeholder="Search" name="word" value="<c:out value='${pageNav.cri.word }'/>">
                <input type="hidden" name="pageNo" value="${pageNav.cri.pageNo }"> 
                <input type="hidden" name="pageSize" value="${pageNav.cri.pageSize }"> 
                <button id="searchBtn" class="btn btn-secondary my-2 my-sm-0 col-lg-2" type="submit">검색</button> 
                </div>    
             </form>
        </div>
    </div>


<!--  기능, 함수들  -->
<script src="${contextPath }/resources/js/move_page.js"></script>
<!--  footer.html --> 
<%@ include file="../includes/footer.jsp" %>
<script>
$(document).ready(function(){
	/* 페이징 처리 */	
	var pageForm = $("#pageForm");
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		pageForm.find("input[name='pageNo']").val($(this).attr("href"));
		pageForm.submit();
	});
	$(".getArticle").on("click",function(e){
		e.preventDefault();
		pageForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		pageForm.attr("action","/board/readArticle.uth");
		pageForm.submit();
	});
	/* 검색 처리 */
	var searchForm = $("#searchForm");
	$("#searchBtn").on("click", function(e) {
		if(!searchForm.find("option:selected").val()){
			alert('검색 조건을 선택하세요');
			return false;
		}
		if(!searchForm.find("input[name='word']").val()){
			alert('검색어를 입력하세요');
			return false;
		}
		
		searchForm.find("input[name='pageNo']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
}); 
</script>
</body>
</html>