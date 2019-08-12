<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!-- member 작업 전 -->

<!-- //테스트 후 삭제 -->
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
                  <a href="#" id="title"><c:out value="${article.title }"/></a> 
                </td>
                <td class="col-sm-2"><c:out value="${member.nickname}"/></td>
                <td class="col-sm-2"><fmt:formatDate pattern="yyyy/MM/dd" value="${article.writeDate }"/></td>
                <td class="col-sm-1"><c:out value="${article.viewCnt }"/></td>
                <td class="col-sm-1"><c:out value="${article.likeCnt }"/></td>
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
                <li class="page-item disabled">
                <a class="page-link" href="#">&laquo;</a>
                </li>
                <li class="page-item active">
                <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="#">&raquo;</a>
                </li>
            </ul>
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


<!-- 기능, 함수들 -->
<script>
  function moveWritePage(){
    document.location.href="write_article.html";
  }
</script>    
<!-- footer.html -->
<%@ include file="../includes/footer.jsp"%>