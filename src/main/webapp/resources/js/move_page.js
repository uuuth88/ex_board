/**
 * 페이지 이동하는 함수
 */

//리스트로 이동하는 함수
function moveBoardList(){
    document.location.href="/board/listArticle.uth";
}

//글쓰기 페이지로 이동하는 함수
function moveWritePage(){
    document.location.href="/board/writeArticle.uth";
}

//글 수정 페이지로 이동하는 함수
function moveModifyPage(bno){
    document.location.href="/board/modifyArticle.uth?bno="+bno;
}