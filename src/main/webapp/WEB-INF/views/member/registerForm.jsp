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
    <div class="container container-register mx-auto my-auto">   
        <form>
            <fieldset>
                <legend>회원가입</legend>
                <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control-plaintext" id="staticEmail" placeholder="예) member@naver.com" required>
                </div>
                </div>
                <div class="form-group row">
                <label for="staticName" class="col-sm-2 col-form-label">닉네임</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control-plaintext" id="staticName" placeholder="사용하실 닉네임을 입력하세요" required>
                </div>
                </div>
                <div class="form-group row">
                <label for="staticPassword" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control-plaintext" id="staticPassword" placeholder="8자리 이상 비밀번호를 입력하세요" onkeyup="checkPassword()" required>
                    <div id="checkpwd"></div>
                </div>
                </div>
                <div class="form-group row">
                <label for="staticRePassword" class="col-sm-2 col-form-label">비밀번호&nbsp; 확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control-plaintext" id="staticRePassword" placeholder="비밀번호를 다시 한번 입력하세요" onkeyup="comparePassword()" required>
                    <div id="comparepwd"></div>
                </div>
                </div>          
                <button type="submit" class="btn btn-primary btn-block" id="regBtn">회 원 가 입</button>
            </fieldset>
        </form>
    </div>
<!--js파일-->
    <script>
        var password = document.getElementById("staticPassword");
        var checkpwd = document.getElementById("checkpwd");
        var repassword = document.getElementById("staticRePassword");
        var comparepwd = document.getElementById("comparepwd");

        function checkPassword(){
            if(password.value.length > 7){
                checkpwd.setAttribute("class","valid-feedback");
                checkpwd.innerHTML="<label>비밀번호가 알맞습니다</label>";
                password.setAttribute("class", "form-control-plaintext form-control is-valid");
            }else{
                checkpwd.setAttribute("class","invalid-feedback");
                checkpwd.innerHTML="<label>비밀번호가 너무 짧습니다</label>";
                password.setAttribute("class", "form-control-plaintext form-control is-invalid");
            }
        }

        function comparePassword(){
            if(password.value != repassword.value){
                comparepwd.setAttribute("class","invalid-feedback");
                comparepwd.innerHTML="<label>비밀번호가 일치하지 않습니다</label>";
                repassword.setAttribute("class","form-control-plaintext form-control is-invalid");
            }else{
                comparepwd.setAttribute("class","valid-feedback");
                comparepwd.innerHTML="<label>비밀번호가 일치합니다</label>";
                repassword.setAttribute("class","form-control-plaintext form-control is-valid");
            }
        }
    </script>
<!--/js파일 끝-->    
<%@ include file="../includes/footer.jsp" %>
</body>
</html>