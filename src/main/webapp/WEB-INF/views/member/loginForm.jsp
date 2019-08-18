<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<!--header.html-->    
    <style>
        form{
            margin-top: 5rem;
            margin-bottom: 5rem;
        }
        legend{
            text-align: center;
        }
    </style>
    <div class="container container-alert mt-3"></div>
    <div class="container container-login">
        <form method="" action="#">
            <fieldset>
                <legend>로그인</legend>
                <div class="form-group">
                    <label for="exampleInputEmail1">이메일</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="이메일을 입력하세요" required>
                    <small id="emailHelp" class="form-text text-muted"></small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">비밀번호</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="비밀번호를 입력하세요" required>
                    <small id="emailHelp" class="form-text text-muted"></small>
                </div>
                <button type="submit" class="btn btn-primary btn-block btn-login" onclick="moveIndex()">로 그 인</button>
                <div class="form-check my-2">
                    <label class="form-check-label">
                      <input class="form-check-input" type="checkbox">
                      자동 로그인
                    </label>
                </div>
            </fieldset>
        </form>
    </div>

<script>
    function moveIndex(){
        var email = document.querySelector("#exampleInputEmail1");
        var password = document.querySelector("#exampleInputPassword1");

        if(email.value == ""||password.value == ""){
            var alertDiv = document.querySelector(".container-alert");
            alertDiv.innerHTML = [
            "<div class='alert alert-dismissible alert-warning'>",
            " <button type='button' class='close' data-dismiss='alert'>&times;</button>",
            " <h4 class='alert-heading'>경고!</h4>",
            " <p class='mb-0'>이메일과 비밀번호를 제대로 입력하세요!</p>",
            "</div>"
            ].join("");
        }else{
            document.location.href="../index.html";
        }
    }
</script>    
<!-- footer.html -->
<%@ include file="../includes/footer.jsp" %>
</body>
</html>