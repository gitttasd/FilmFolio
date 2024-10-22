document.getElementById('updateBtn').onclick = function() {
	let text = document.getElementById('updateBtn').textContent;
	if(!confirm('일기를 '+text+'하시겠습니까?')){
		return false;
	}
	document.getElementById('upForm').submit();
};