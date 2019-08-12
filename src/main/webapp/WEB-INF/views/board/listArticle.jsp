<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!--header.html include 포함-->    
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
        <table class="table table-hover">
            <thead>
              <tr>
                <th scope="col">#no.</th>
                <th scope="col">제목</th>
                <th scope="col">글쓴이</th>
                <th scope="col">날짜</th>
                <th scope="col">조회수</th>
                <th scope="col">추천</th>
              </tr>
            </thead>
            <tbody>
              <tr class="col-sm-12">
                <td scope="row">1</td>
                <!-- <td class="col-lg-6">안녕하세요? 가입인사 올립니다.</td> -->
                <td class="col-sm-6">
                  <a href="read_article.html" id="title">안녕하세요???????????? 가입인사 올립니다.</a> 
                </td>
                <td class="col-sm-2">뉴비</td>
                <td class="col-sm-2">2019/08/01</td>
                <td class="col-sm-1">20190801</td>
                <td class="col-sm-1">13</td>
              </tr>
              <tr>
                <td scope="row">2</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">3</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">4</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">5</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">6</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">7</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">8</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">9</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>
              <tr>
                <td scope="row">10</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
              </tr>              
            </tbody>
          </table> 
          <button type="button" class="btn btn-outline-info btn-block" id="writeBtn" onclick="moveWritePage()">글쓰기</button>
    </div>
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

<script>
  function moveWritePage(){
    document.location.href="write_article.html";
  }
</script>    
<!-- footer.html -->
    <footer class="my-3">
        <i class="fab fa-github"></i>&nbsp;&nbsp;<a href="https://github.com/uuuth88" id="toGitNBlog" target="_blank">uuuth's github . </a>&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; <i class="fas fa-blog"></i>&nbsp;&nbsp;<a href="https://uuuth.tistory.com/" id="toGitNBlog" target="_blank">uuuth's blog .</a>
    </footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>