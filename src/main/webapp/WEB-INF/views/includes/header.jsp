<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${contextPath }/resources/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/228e3adb19.js"></script>
<!-- header.html -->
    <title>회원제 게시판</title>
    <style>
        footer{
            background-color: #979A9A;
            padding: 10px;
            text-align: center;
            color: white;
        }
        #toGitNBlog{
            color: white;
        }
    </style>
  </head>
  <body>
    <div class="header-container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand">uth</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarColor03">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${contextPaht }/index.uth">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPaht }/board/listArticle.uth">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPaht }/member/loginForm.uth">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPaht }/member/registerForm.uth">회원가입</a>
                </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
                </form>
            </div>
        </nav>
    </div>