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
    
    //댓글 삭제하는 함수
    function deleteReply(rno, callback, error){
    	$.ajax({
    		type: 'delete',
    		url: '/reply/delete/'+rno,
    		success: function(result,status,xhr){
    			if(callback){
    				callback(result);
    			}
    		},
    		error: function(xhr,status,er){
    			if(error){
    				error(er);
    			}
    		}
    	});
    }
    
    //댓글 날짜 출력
    function dateFormat(time){
    	//현재 시간 구하기
    	var curTime = new Date();
    	//현재 시간 - 댓글 작성일의 값이 하루가 안된다면
    	if(curTime-time < (1000 * 60 * 60 * 24)){
    		var hh = new Date(time).getHours();
    		var mi = new Date(time).getMinutes();
    		var ss = new Date(time).getSeconds();
    		
    		return [(hh > 9 ? "":"0")+hh," : ",(mi > 9 ? "":"0")+mi," : ",(ss > 9 ? "":"0")+ss].join("");
    	}else{
        	var year = new Date(time).getFullYear();
        	var month = new Date(time).getMonth()+1;
        	var day = new Date(time).getDate();
        	
        	return [year," / ",(month>9 ? "":"0")+month," / ",(day > 9 ? "":"0")+day].join("");
    	}
    }
    return {
    	getReplyList: getReplyList, 
    	insertReply: insertReply,
    	selectReply: selectReply,
    	modifyReply: modifyReply,
    	deleteReply: deleteReply,
    	dateFormat: dateFormat
	};
})();