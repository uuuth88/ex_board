<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!--/header.html-->
<style>
    .uploadResult ul{
		display:flex;
		flex-flow:row;
		justify-content:center;
		align-items:center;
	}
	.uploadResult ul li{
		list-style: none;
		padding:10px;
	}
</style>
<div class="wrapper mx-5 my-5">
    <div class="row">
        <div class="col-lg-12">
        <form method="" action="" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" name="title">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                <textarea class="form-control" rows="10" name="content"></textarea>
                </div>
            </div>  
            <div class="form-group row">
                <label class="col-sm-2 col-form-label" for="exampleInputFile">파일 업로드</label>
                <div class="col-sm-9">
                    <input type="file" class="form-control-file" name="uploadFile" aria-describedby="fileHelp" multiple>
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
                        <button type="button" class="btn btn-primary" onclick="moveReadPage()">글작성</button>
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
<script>
    function moveReadPage(){
        document.location.href="read_article.html";
    }
    function moveBoardList(){
        document.location.href="list_article.html";
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

<!--js script-->
<script>
        $(document).ready(function(){
            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|jar)$");
            var maxSize = 102428800;
            
            function checkExtension(fileName, fileSize){
                if(fileSize >= maxSize){
                    alert("파일 사이즈 초과");
                    return false;
                }
                if(regex.test(fileName)){
                    alert("해당 종류의 파일은 업로드할 수 없습니다.");
                    return false;
                }
                return true;
            }
            
            //<input=file> 초기화
            var cloneObj = $(".uploadDiv").clone();
            
            //이미지 목록을 보여주는 함수 처리
            var uploadResult = $(".uploadResult ul");
            
            function showUploadedFile(uploadResultArr){
                var str="";
                $(uploadResultArr).each(function(i, obj){
                    console.log("업로드 경로 : "+obj.uploadPath);
                    if(!obj.image){
                        str += "<li><img src='/resources/img/attach.gif'>"+obj.fileName+"</li>";
                    }else{
                        var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
                        console.log("파일 호출 경로 : "+fileCallPath);
                        str += "<li><img src='/display?fileName="+fileCallPath+"'></li>";
                    }
                });
                
                uploadResult.append(str);
            }
            
            $("#uploadBtn").on("click", function(e) {
                var formData = new FormData();
                var inputFile = $("input[name='uploadFile']");
                var files = inputFile[0].files;
                // var label = document.createElement("label");
                // var uploadResultDiv = document.querySelector(".uploadResult");
    
                // labelclass();
    
                // function labelclass(){
                //     label.setAttribute("class","col-sm-2 col-form-label");
                //     label.appendChild(document.createTextNode("파일 목록"));
                //     document.insertBefore(label, uploadResultDiv);
                // }
                
                console.log(files);
                
                for(var i=0; i<files.length; i++){
                    if(!checkExtension(files[i].name, files[i].size)){
                        return false;
                    }
                    formData.append("uploadFile", files[i]);
                }
                
                $.ajax({
                    url : "/uploadAjaxAction",
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: "post",
                    dataType: "json",
                    success: function(result) {
                        console.log("결과 : "+result);
                        showUploadedFile(result);
                        $(".uploadDiv").html(cloneObj.html());
                    }
                });
            });
        }); 
    </script>
</body>
</html>    