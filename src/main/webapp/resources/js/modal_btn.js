/**
 * 모달 버튼 생성 스크립트
 */
function showModal(){
	//댓글 작성자일 경우 수정과 삭제하기 버튼 활성화
    $(modal).modal("show");
    createModBtn();
    createDelBtn();
    createCloseBtn();
}

function reReplyModal(){
    //댓글 작성자가 아닐 경우 댓글 달기 버튼 활성화
    $(modal).modal("show");
    createReplyBtn();
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