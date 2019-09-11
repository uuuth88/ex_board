/**
 * 댓글 등록 js
 */
console.log('loading reply.js ... ');
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

    //댓글 등록하는 함수
    function insertReply(reply, callback, error){
    	console.log('댓글을 등록합니다');
    	
    	$.ajax({
    		type: 'post',
    		url: '/reply/insert',
    		data: JSON.stringify(reply),
    		contentType: "application/json; charset=utf-8",
    		success: function(result, status, xhr){
    			if(callback){
    				callback(result);
    			}
    		},
    		error: function(xhr, status, err){
    			if(error){
    				error(err);
    			}
    		}
    	});
    }
    
    //댓글 출력하는 함수
    function selectReply(rno, callback, error){
    	console.log("선택한 댓글 번호 : "+rno);
    	
    	$.ajax({
    		type: 'get',
    		url: '/reply/select/'+rno,
    		contentType: "application/json; charset=utf-8",
    		success: function(result, status, xhr){
    			if(callback){
    				callback(result);
    			}
    		},
    		error: function(xhr, status, err){
    			if(error){
    				error(err);
    			}
    		}
    	});
    }
    
    //댓글을 수정하는 함수
    function modifyReply(reply, callback, error){
    	console.log("수정할 댓글 번호 : "+reply.rno);
    	
    	$.ajax({
    		type: 'put',
    		url: '/reply/modify/'+reply.rno,
    		data: JSON.stringify(reply),
    		contentType: "application/json; charset=utf-8",
    		success: function(result, status, xhr){
    			if(callback){
    				callback(result);
    			}
    		},
    		error: function(xhr, status, err){
    			if(error){
    				error(err);
    			}
    		}
    	});
    }
    return {
    	getReplyList: getReplyList, 
    	insertReply: insertReply,
    	selectReply: selectReply,
    	modifyReply: modifyReply
	};
})();