//댓글 쓰기 모달
const writeModal = new bootstrap.Modal('#writeModal');
//diaryId 값 가져오기
var url = window.location.pathname; // URL 경로 가져오기 ("/diary/select/Diary_00073")
const diaryId = url.split('/').pop(); // 마지막 부분 추출 (여기서는 "Diary_00073")
//댓글 관리
var replListTemp = document.querySelector('#replListTemp');
var replTemp = document.querySelector('#replTemp');
var replForm = document.querySelector('#replForm');
var replList = document.querySelector('.replList');
var newRepl = document.querySelector('.newRepl');

refreshList();

//일기 관리
document.querySelector('#diaryEdit').onclick = function(){
	if(!confirm('일기 내용을 변경하시겠습니까?')){
		return false;
	};
	window.location.href = '/diary/update/' + diaryId;
};
//추천 수 가져오기
document.querySelector('#goodBtn').onclick = function(ev){
    let diaryId = ev.target.getAttribute('data-no');
    console.log(diaryId);
    
    fetch('/diary/uppoint/' + diaryId, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    })
    .then(res => res.text())
    .then(data => { 
        if(data === 'success'){
            alert('추천완료!');
            window.location.reload();
        }
    })
    .catch(err => console.error('Error submitting movie data:', err));
};

// 댓글 목록 새로고침
function refreshList() {
	let loginId = document.querySelector('#loginId').textContent;
	fetch('/diaryRepl/list/'+diaryId, {
		method: 'GET',
		headers: { 'Accept': 'application/json' }
	})
	.then(resp => resp.json())
	.then(data => {
		console.log(data);
		replList.textContent = '';
		document.querySelector('#replCount').textContent = data.length;
		data.forEach(function(reply, index){
			let replyData = replListTemp.content.cloneNode(true);

			replyData.querySelector('li').id = reply.diaryReplUser;
			replyData.querySelector('#diaryReplUser').textContent = reply.diaryReplUser;

			if(reply.diaryReplOpen === 'N'){
				if(loginId === reply.diaryReplUser){
					replyData.querySelector('#diaryReplContent').innerHTML = '[ 비공개 댓글 ]<br/>' + reply.diaryReplContent;
				}else{
					replyData.querySelector('#diaryReplContent').innerHTML = '비공개 댓글입니다.';
				}	
			}else{
				replyData.querySelector('#diaryReplContent').innerHTML = reply.diaryReplContent;
			};
			replyData.querySelector('#diaryReplAt').textContent = new Date(reply.diaryReplAt).toISOString().split('T')[0];
			
			if(loginId === reply.diaryReplUser){
				replyData.querySelector('li').style.pointerEvents = '';

				replyData.querySelectorAll('button').forEach(v =>  v.setAttribute('data-no', reply.diaryReplId) );
				replyData.querySelector('#replUpdBtn').onclick = editReplyCheck;
				replyData.querySelector('#replDelBtn').onclick = delReply;
			}else{
				replyData.querySelector('#replUpdBtn').remove();
				replyData.querySelector('#replDelBtn').remove();
			}

			replList.append(replyData);
		});
		
	})
	.catch(err => handleError('댓글 목록 조회 실패', err));
};

// 댓글 쓰기
document.querySelector('#writeBtn').onclick = function(){
	writeModal.show();
	
	newRepl.innerHTML = '';
	
	let newReply = replTemp.content.cloneNode(true); //템플릿 사용

	newReply.querySelector('#diaryReplUserModal').value = document.querySelector('#loginId').textContent;
	newReply.querySelector('#diaryReplAtModal').value = new Date().toISOString().split('T')[0];
	newReply.querySelector('#diaryReplContentModal').readOnly = false;
	newReply.getElementById('diaryReplOpenDiv').style.pointerEvents = '';
	document.querySelector('#addBtn').textContent = '댓글 등록';

	newRepl.prepend(newReply);

	document.querySelector('#addBtn').onclick = function(){
		let diaryReplUser = document.querySelector('#loginId').textContent;
		let diaryReplContent = document.querySelector('#diaryReplContentModal').value;
		let diaryReplOpen = document.querySelector('[name="diaryReplOpen"]:checked').value;

		let addData = {
			'diaryId' : diaryId,
			'diaryReplUser' : diaryReplUser,
			'diaryReplContent' : diaryReplContent,
			'diaryReplAt' : '',
			'diaryReplOpen' : diaryReplOpen
		};
		// 댓글 등록 기능
		fetch('/diaryRepl/add/'+diaryId, {
			method: 'POST',
			headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
			body: JSON.stringify(addData)
		})
		.then(resp => resp.json())
		.then(data => {
			if(data>0){
				refreshList();
				writeModal.hide();
				alert('댓글을 등록하였습니다');
			}
		})
		.catch(err => handleError('댓글 등록 실패', err));
	};
}

// 댓글 삭제 기능
function delReply(ev) {
	let diaryReplId = ev.target.getAttribute('data-no');
	if (!confirm( '댓글을 삭제하시겠습니까?')) return;

	fetch('/diaryRepl/delete/'+diaryReplId , {
		method: 'GET',
		headers: { 'Accept': 'application/json', diaryId: diaryId}
	})
	.then(resp => resp.json())
	.then(data => {
		if(data>0){
			refreshList();
			alert('댓글을 삭제하였습니다!');
		}
	})
	.catch(err => handleError('댓글 삭제 실패', err));
};

// 댓글 변경 기능
function editReplyCheck(ev) {
	let diaryReplId = ev.target.getAttribute('data-no');
	if (!confirm( diaryReplId+'번 댓글을 변경하시겠습니까?')) {
		return false;
	}else{
		fetch('/diaryRepl/select/'+ diaryReplId , {
			method: 'GET',
			headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
		})
		.then(resp => resp.json())
		.then(data => {
			console.log(data);
			writeModal.show();
			let newReply = replTemp.content.cloneNode(true); //템플릿 사용
			newRepl.innerHTML = '';

			newReply.querySelector('#diaryReplUserModal').value = data.diaryReplUser;
			newReply.querySelector('#diaryReplAtModal').value = new Date(data.diaryReplAt).toISOString().split('T')[0];
			newReply.querySelector('#diaryReplContentModal').textContent = data.diaryReplContent;
			newReply.querySelector('#diaryReplContentModal').readOnly = false;
			newReply.getElementById('diaryReplOpenDiv').style.pointerEvents = '';
			
			if(data.diaryReplOpen === 'Y'){
				newReply.querySelector('[name="diaryReplOpen"][id="diaryReplOpenModalY"]').checked = true;
			}else{
				newReply.querySelector('[name="diaryReplOpen"][id="diaryReplOpenModalN"]').checked = true;
			};
			newRepl.prepend(newReply);
			
			document.querySelector('#addBtn').textContent = '댓글 변경';
			document.querySelector('#addBtn').onclick = function(){
				let diaryReplContent = document.querySelector('#diaryReplContentModal').value;
				let diaryReplOpen = document.querySelector('[name="diaryReplOpen"]:checked').value;

				let editData = {
					'diaryReplContent' : diaryReplContent,
					'diaryReplOpen' : diaryReplOpen
				};
				// 댓글 변경 기능
				fetch('/diaryRepl/update/'+diaryReplId, {
					method: 'POST',
					headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
					body: JSON.stringify(editData)
				})
				.then(resp => resp.json())
				.then(data => {
					if(data>0){
						refreshList();
						writeModal.hide();
						alert('댓글을 변경하였습니다');
					}
				})
				.catch(err => handleError('댓글 변경 실패', err));
			};
		})
		.catch(err => handleError('댓글 변경 실패', err));
	};
};

function goPage(pageNo) {
    document.querySelector('[name="currentPageNo"]').value = pageNo;
    document.getElementById('searchForm').submit(); // 폼 제출
};


// 에러 처리
function handleError(message, error) {
	console.error(error);
	alert(message);
};
