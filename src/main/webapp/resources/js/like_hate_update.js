/**
 *	글 조회 페이지에서 추천 비추천 업데이트 스크립트 파일
 */
function updateLike(){
	if(!alreadyLikeClick){
		lcnt2 = parseInt(lcnt)+1;
		likeBtn.innerHTML = "<i class=\"fas fa-thumbs-up\"></i> &nbsp;추천 &nbsp;"+lcnt2;
		alreadyLikeClick = true;            			
		alreadyHateClick = true;
		updateLikeAjax();
	}else{
		if(hcnt != hcnt2){
			alert('이미 비추천하신 글입니다.');
			return;
		}else{
			alert('이미 추천하신 글입니다.');
			return;
			
		}
	}
}
function updateHate(){
	if(!alreadyHateClick){
	    hcnt2 = parseInt(hcnt)+1;
		hateBnt.innerHTML = "<i class=\"fas fa-thumbs-down\"></i> 비추천 -&nbsp;"+hcnt2;
		alreadyLikeClick = true;            			
		alreadyHateClick = true;            			
		updateHateAjax();
	}else{
		if(lcnt != lcnt2){
			alert('이미 추천하신 글입니다.');
			return;
		}else{
			alert('이미 비추천하신 글입니다.');
			return;
		}
	}
}
//댓글 대댓글 추천 비추천 함수
//function updateReplLike(){
//	if(!alreadyLikeClick){
//		lcnt2 = parseInt(lcnt)+1;
//		likeBtn.innerHTML = "<i class=\"fas fa-thumbs-up\"></i> &nbsp;추천 &nbsp;"+lcnt2;
//		alreadyLikeClick = true;            			
//		alreadyHateClick = true;            			
//	}else{
//		if(hcnt != hcnt2){
//			alert('이미 비추천하신 글입니다.');
//			return;
//		}else{
//			alert('이미 추천하신 글입니다.');
//			return;
//			
//		}
//	}
//}
//function updateReplHate(){
//	if(!alreadyHateClick){
//		hcnt2 = parseInt(hcnt)+1;
//		hateBnt.innerHTML = "<i class=\"fas fa-thumbs-down\"></i> 비추천 -&nbsp;"+hcnt2;
//		alreadyLikeClick = true;            			
//		alreadyHateClick = true;            			
//	}else{
//		if(lcnt != lcnt2){
//			alert('이미 추천하신 글입니다.');
//			return;
//		}else{
//			alert('이미 비추천하신 글입니다.');
//			return;
//		}
//	}
//}
