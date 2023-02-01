



document.addEventListener("DOMContentLoaded", function(){//문서 즉 현재페이지 완벽히 준비(로딩)되어있다면 다음 함수를 실행

 	let nextBtn = document.querySelector(".next");
	let backBtn = document.querySelector(".back");
	let count = parseInt(document.querySelector(".count").value); //현재 페이지의 게시물 수를 표현
	let urlparam = window.location.search; //추가된 파라미터값을 뽑음
	let page = urlparam.split('=')[1]; // 파라미터 값을 받아와 지금 현재페이지를 변수에 넣음
	
	if(urlparam==''|| page =='1' ){
		$(".back").prop("disabled",true);		
	}
	
	if(count<10){//만약에 부분레코드수가 10개 미만이라면 더 값이 없는것이므로 다음 버튼을 잠가야함.
		$(".next").prop("disabled",true);
	}
	
});


function aa(e){
	let id = $(e).data("userId"); //누른 버튼의 해당 아이디를 불러옴
	console.log(id);
	
	var q = confirm("정말로 삭제하시겠습니까?");
	
	if(q){
	$.ajax({
		
		url:"deleteUser_ok",
		type:"POST",
		data:{"id":id},
		dataType:"JSON",
		success:function(data){
			
			console.log(data.code);
			if(data.code ==='성공'){		
				alert("데이터가 성공적으로 삭제 되었습니다.");
				location.reload();
			}
			
		},error:function(){
			console.log("오류");
		}
	
	});
	}
}




