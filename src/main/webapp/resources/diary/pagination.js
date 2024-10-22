export default class Pagination {
	constructor(data, itemsPerPage) {
		this.data = data; //게시글 전부
		this.itemsPerPage = itemsPerPage; //한페이지에 보여줄 데이터 양(5, 10)
		this.perGroup = 5;//보여줄 pageButtom 그룹
		this.totalPages = Math.ceil(this.data.length / this.itemsPerPage); //총페이지 수
		this.currentPage = 1; //현재페이지, 디폴트 1페이지
		//url 파라미터에를 가져와 현재페이즈를 가져온 주소창 페이지 값으로 변경
		this.queryString = new URLSearchParams(window.location.search);
		if (this.queryString.has('page')) {
			this.currentPage = parseInt(this.queryString.get('page'));
		};
	};
	
	createPagination() {
		const paginationContainer = document.createElement('ul');
		paginationContainer.classList.add('pageContainer pagination justify-content-center');
		let startPage = 1;
		if (this.currentPage > this.itemsPerPage) {
			startPage = Math.floor( (( (this.currentPage - 1) / this.perGroup ) ) + 0 ) * this.perGroup + 1 ;
			//startPage = this.currentPage - this.itemsPerPage;
		}
		let endPage = Math.floor( (( this.totalPages / this.perGroup ) ) + 0 ) * this.perGroup + 1 ;;
		if (endPage > this.totalPages) {
			endPage = this.totalPages;
			startPage = this.totalPages - 9;
		}
		if (startPage < 1) {
			startPage = 1;
		}
		
		//처음 버튼
		const goFirstContainer = document.createElement('li');
		goFirstContainer.classList.add('page-item');
		
		const goFirstButton = goFirstContainer.createElement('a');
		goFirstButton.innerText = '처음';
		goFirstButton.classList.add('page-link');
		
		goFirstButton.disabled = this.currentPage === 1;
		goFirstButton.addEventListener('click', () => {
			let url = new URL(window.location.href);
			url.searchParams.set('page', 1);
			window.location.href = url.toString();
		});
		paginationContainer.appendChild(goFirstButton);
		
		//이전 버튼
		const goBeforeContainer = document.createElement('li');
		goBeforeContainer.classList.add('page-item');
		
		const goBeforeButton = goFirstContainer.createElement('a');
		goBeforeButton.innerText = '이전';
		goBeforeButton.classList.add('page-link');
		
		goBeforeButton.disabled = this.currentPage < this.perGroup;
		goBeforeButton.addEventListener('click', () => {
			let url = new URL(window.location.href);
			url.searchParams.set('page', (startPage - this.perGroup) );
			window.location.href = url.toString();
		});
		paginationContainer.appendChild(goBeforeButton);
		
		//숫자
		for (let i = startPage; i <= endPage; i++) {
			const paginationCon = document.createElement('li');
			paginationCon.classList.add('page-item');
			
			const paginationButton = paginationCon.createElement('a');
			paginationButton.innerText = i;
			paginationButton.classList.add('page-link');
			paginationButton.addEventListener('click', () => {
				let url = new URL(window.location.href);
				let pageValue = i;
				let pageParam = 'page';
				if (!url.searchParams.has(pageParam)) {
					url.searchParams.append(pageParam, pageValue);
				} else {
					url.searchParams.set(pageParam, pageValue);
				}
				window.location.href = url.toString();
			});
			if (i === this.currentPage) {
				paginationButton.classList.add('active');
				paginationButton.disabled = true;
			}
			paginationContainer.appendChild(paginationButton);
		}
		
		//다음 버튼
		const goLastButton = document.createElement('button');
		goLastButton.innerText = '당';
		goLastButton.classList.add('page-btn');
		goLastButton.disabled = this.currentPage >= endPage;
		goLastButton.addEventListener('click', () => {
			let url = new URL(window.location.href);
			url.searchParams.set('page', (startPage + this.perGroup));
			window.location.href = url.toString();
		});
		paginationContainer.appendChild(goLastButton);	
		
		//마지막 버튼
		const goLastContainer = document.createElement('li');
		goLastContainer.classList.add('page-item');
		
		const goLastButton = goFirstContainer.createElement('a');
		goLastButton.innerText = '마지막';
		goLastButton.classList.add('page-link');
		
		goLastButton.disabled = this.currentPage === (startPage + this.perGroup);
		goLastButton.addEventListener('click', () => {
			let url = new URL(window.location.href);
			url.searchParams.set('page', this.totalPages);
			window.location.href = url.toString();
		});
		paginationContainer.appendChild(goLastButton);

		return paginationContainer;
	}
};
