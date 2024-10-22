//일기 관리
document.querySelector('#diaryEdit').onclick = function(){
	if(!confirm('일기 내용을 변경하시겠습니까?') === true){
		return false;
	}else{
		alert('변경 내용을 저장하였습니다.');
	};
};
//if(!confirm('목록으로 돌아가시겠습니까?') === true){
//	return false;
//}else{
//	window.location.href = '/diary/list';
//}

//댓글 관리
var replTemp = document.querySelector('#replTemp');
var replList = document.querySelector('.replList');
var content = document.querySelector('.showRepl');

// 댓글 쓰기
document.querySelector('#writeBtn').onclick = function(){
	if (content.style.display === 'none') {
		content.style.display = 'block';
		document.querySelector('#writeBtn').textContent = '댓글 작성 중';
		
		replList.innerHTML = '';

		let newReply = replTemp.content.cloneNode(true);
		newReply.querySelector('.diaryReplUser').value = document.querySelector('#loginId').value;
		newReply.querySelector('.diaryReplAt').value = new Date().toISOString().split('T')[0];
		newReply.querySelector('.diaryReplContent').readOnly = false;
		newReply.querySelectorAll('.diaryReplOpen').forEach(function(v){
			v.disabled = false;
			v.name = 'diaryReplOpenNew';
		});

		// 삭제, 수정 버튼 제거, 등록 버튼만 남기기
		removeElements(newReply, ['.del', '.edit']);
		newReply.querySelector('.add').onclick = addReply;

		replList.prepend(newReply);
	} else {
		content.style.display = 'none';
		this.textContent = '댓글 쓰기';
	};
}
// 댓글 보기
document.querySelector('#showBtn').onclick = toggleReplyView;

// 댓글 보기 폼 토글
function toggleReplyView() {
	if (content.style.display === 'none') {
		refreshList();
		content.style.display = 'block';
		this.textContent = '댓글 숨기기';
	} else {
		content.style.display = 'none';
		this.textContent = '댓글 보기';
	};
};

// 댓글 목록 새로고침
function refreshList() {
	let diaryId = document.querySelector('#diaryId').value;
	fetch('../../diaryRepl/list/'+diaryId, {
		method: 'GET',
		headers: { 'Accept': 'application/json' }
	})
	.then(resp => resp.json())
	.then(data => {
		console.log(data);
		replList.innerHTML = '';
		
		data.forEach(function(reply,index){
			let replyElem = replTemp.content.cloneNode(true);
			replyElem.querySelector('.diaryReplUser').value = reply.diaryReplUser;
			
			replyElem.querySelector('.diaryReplContent').textContent = reply.diaryReplContent;
			replyElem.querySelector('.diaryReplContent').id = 'diaryReplContent'+index;
			replyElem.querySelector('.diaryReplContent').readOnly = false;
			
			replyElem.querySelector('.diaryReplAt').value = new Date(reply.diaryReplAt).toISOString().split('T')[0];
			
			replyElem.querySelector('.edit').id = 'editBtn'+index;
			
			replyElem.querySelectorAll('[type="radio"]').forEach(v => v.name = 'diaryReplOpen'+index );
			replyElem.querySelectorAll(`[name="diaryReplOpen${index}"]`).disabled = true;
			
			setupReplyVisibility(replyElem, reply);
			//등록 버튼 제거
			removeElements(replyElem, ['.add']);
			replList.append(replyElem);
		});
	})
	.catch(err => handleError('댓글 목록 조회 실패', err));
};

// 댓글 삭제 기능
function delReply(event) {
	let delReplId = event.target.getAttribute('data-no');
	if (!confirm( delReplId+'번 댓글을 삭제하시겠습니까?')) return;

	fetch('../../diaryRepl/delete/'+delReplId , {
		method: 'GET',
		headers: { 'Accept': 'application/json', diaryId:'${diaryVo.diaryId}'}
	})
	.then(resp => resp.json())
	.then(data => handleReplyAction('삭제', data))
	.catch(err => handleError('댓글 삭제 실패', err));
};

// 댓글 변경 기능
function editReplyCheck(event) {
	let replyId = event.target.getAttribute('data-no');
	let radioGroupName = event.target.getAttribute('data-name');
	let contentId = event.target.getAttribute('data-contentId');

	if (confirm( replyId+'번 댓글을 변경하시겠습니까?')) {
		document.querySelector('#'+contentId).readOnly = false;
		
		document.querySelectorAll(`[name="${radioGroupName}"]`).forEach(v => v.disabled = false);

		editReply(replyId, contentId, radioGroupName, event.target.id);
	}else{
		return;
	};
};

// 댓글 등록 기능
function addReply() {
	let diaryId = document.querySelector('#diaryId').value;
	let diaryReplUser = document.querySelector('#loginId').value;
	let diaryReplContent = document.querySelector('.diaryReplContent').value;
	let diaryReplOpen = document.querySelector('input[name=diaryReplOpenNew]:checked').value;

	let addData = {
		'diaryReplUser' : diaryReplUser,
		'diaryReplContent' : diaryReplContent,
		'diaryReplAt' : '',
		'diaryReplOpen' : diaryReplOpen
	};

	fetch('../../diaryRepl/add/'+diaryId, {
		method: 'POST',
		headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
		body: JSON.stringify(addData)
	})
	.then(resp => resp.json())
	.then(data => handleReplyAction('등록', data))
	.catch(err => handleError('댓글 등록 실패', err));
};

// 댓글 수정 기능
function editReply(replyId, contentId, radioGroupName, editBtnId) {
	document.querySelector('#'+editBtnId).onclick = function(){
		let updatedContent = document.querySelector('#'+contentId).value;
		let updatedVisibility = document.querySelector(`[name="${radioGroupName}"]:checked`).value;
		
		let editData = {
			'diaryReplContent': updatedContent,
			'diaryReplOpen': updatedVisibility
		};
		
		console.log(editData);
		
		if(confirm('변경한 댓글을 저장하시겠습니까?')){
			fetch('../../diaryRepl/update/'+ replyId , {
				method: 'POST',
				headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
				body: JSON.stringify(editData)
			})
			.then(resp => resp.json())
			.then(data => handleReplyAction('변경', data))
			.catch(err => handleError('댓글 변경 실패', err));
		}return;
		
	};
};

// 댓글 공개 여부 설정
function setupReplyVisibility(replyElem, replyData) {
	let contentId = replyElem.querySelector('.diaryReplContent').id;
	let radioName = replyElem.querySelector('[type="radio"]').name;
	let loginId = document.querySelector('#loginId').value;

	if (replyData.diaryReplOpen === 'Y') {
		replyElem.querySelector('#diaryReplOpenY').checked = true;
	} else {
		replyElem.querySelector('#diaryReplOpenN').checked = true;

		if (replyData.diaryReplUser !== loginId) {
			replyElem.querySelector('#diaryReplUser').style.display = 'none';
			replyElem.querySelector('#diaryReplAt').style.display = 'none';
			replyElem.querySelector('.diaryReplContent').textContent = '비공개 댓글입니다.';
		};
	};

	if (replyData.diaryReplUser === loginId) {
		// 삭제 및 수정 버튼 설정
		replyElem.querySelector('.del').setAttribute('data-no', replyData.diaryReplId);
		replyElem.querySelector('.del').onclick = delReply;
			
		replyElem.querySelector('.edit').setAttribute('data-no', replyData.diaryReplId);
		replyElem.querySelector('.edit').setAttribute('data-name', radioName);
		replyElem.querySelector('.edit').setAttribute('data-contentId', contentId);
		
		replyElem.querySelector('.edit').onclick = editReplyCheck;

	} else {
		removeElements(replyElem, ['.del', '.edit']);
	};
};

// 삭제할 요소 제거
function removeElements(parent, selectors) {
	selectors.forEach(selector => {
		var element = parent.querySelector(selector);
		if (element) element.remove();
	});
};

// 댓글 액션 처리
function handleReplyAction(action, result) {
	if (result > 0) {
		alert('댓글을'+action+'하였습니다.');
		refreshList();
		
		if(action == '등록'){
			document.querySelector('#writeBtn').textContent = '댓글 쓰기';
			document.querySelector('#showBtn').textContent = '댓글 숨기기';
		}
	} else {
		alert('댓글'+action+'에 실패하였습니다.');
	}
};

// 에러 처리
function handleError(message, error) {
	console.error(error);
	alert(message);
};
