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
        <div class="row">
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
        	</form>         
            <form class="form-inline my-2 my-lg-0"> 
                <div class="form-group"> 
                    <select class="custom-select"> 
                      <option selected="">--</option> 
                      <option value="1">One</option> 
                      <option value="2">Two</option> 
                      <option value="3">Three</option> 
                    </select> 
                </div> 
                <input class="form-control mr-sm-2" type="text" placeholder="Search"> 
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button> 
             </form>
        </div>
    </div>


<!--  기능, 함수들  -->
<script src="${contextPath }/resources/js/move_page.js"></script>
<!--  footer.html --> 
<%@ include file="../includes/footer.jsp" %>
<script>
$(document).ready(function(){
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
}); 
</script>
</body>
</html>