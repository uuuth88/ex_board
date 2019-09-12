/**
 * 모달 버튼 생성 스크립트
 */
function showModal(){
    $(modal).modal("show");
    //댓글 글쓴이일 경우 수정과 삭제하기 버튼 활성화
    createModBtn();
    createDelBtn();
    createCloseBtn();
    //글쓴이가 아닐 경우 추천과 비추천 버튼 활성화 & 대댓글 쓰기 기능 구현  
    //createReplyBtn();
}

function showModalInReReply(){
    //대댓글 글쓴이일 경우 모달창은 수정하기와 삭제하기만 구현
    //글쓴이가 아닐 경우 클릭 X 
    $(modal).modal("show");
    createModBtn();
    createDelBtn();
    createCloseBtn();
}

function createReplyBtn(){
    btnNode4.setAttribute("class","btn btn-success");
    btnNode4.setAttribute("type","button");
    btnNode4.setAttribute("onclick", "eoeotrmf()");
    btnNode4.appendChild(replyTextNode);
    modalFooter.appendChild(btnNode4);
}
function createModBtn(){
    btnNode.setAttribute("class", "btn btn-info");
    btnNode.setAttribute("type","button");
    btnNode.setAttribute("id","modalModBtn");
    btnNode.appendChild(modTextNode);
    modalFooter.appendChild(btnNode);
}
function createDelBtn(){
    btnNode2.setAttribute("class", "btn btn-primary");
    btnNode2.setAttribute("type","button");
    btnNode2.setAttribute("id", "modalDelBtn");
    btnNode2.appendChild(delTextNode)
    modalFooter.appendChild(btnNode2);
}
function createCloseBtn(){
    btnNode3.setAttribute("type","button");
    btnNode3.setAttribute("class","btn btn-secondary");
    btnNode3.setAttribute("data-dismiss","modal");
    btnNode3.appendChild(closeTextNode);
    modalFooter.appendChild(btnNode3);
}