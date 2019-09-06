/**
 * 댓글 등록 js
 */

var replyService = (function(){
	//댓글 리스트 불러오는 함수
    function getReplyList(param, callback, error){
        var bno = param.bno;

        $.getJSON("/reply/"+bno, function(data){
        	if(callback){
        		callback(data.replyCnt, data.rplList);
        	}
        }).fail(function(xhr,status,err){
        	if(error){
        		error();
        	}
        });
    }

    return {getReplyList: getReplyList};
})();