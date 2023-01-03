


let img = document.querySelector(".img");
let img2 = document.querySelector(".img2");

img.addEventListener("click",function(){
	document.querySelector(".chooseImg").click();
});

img2.addEventListener("click",function(){
	document.querySelector(".chooseImg").click();
});


let save = document.querySelector(".save");
save.addEventListener("click",function(){
	
	
	if($("#memo_title").val() ==''){
		alert("제목이 비어있습니다. 다시 확인해주세요. ");
		$("#memo_title").focus();
		return false;
	}
	
	if($("#memo_cont").html()==''){
		alert("내용이 비어있습니다. 다시 확인해주세요. ");
		$("#memo_cont").focus();
		return false;
	}
	
	saveData();
});

function saveData(){

	$.ajax({
		type:"post",
		url:"update_cmmemo_ok",
		data:{title:$("#memo_title").val(), content:$("#memo_cont").html(),color:$("select[name=memo_color]").val()},
		dataType:"json",
		success:function(data){
			let msg = data.code;
			console.log(msg);
			if(msg.includes("성공")){
				console.log("여기까지 들어옴");
				window.location.replace("community"); // window.location.replace("") 이방식은 js에서 리다이렉트로 보내는 방법이다.
				alert("메모가 작성되었습니다.")
			}else{
				console.log("아이디 제목 내용중하나라도 없음 여기로들어옴");
				window.location.replace("/");
				alert("메모작성을 실패하였습니다.");
			}
			
		},error : function(){
			console.log("오류");
		}
	
	
	});
}


   

window.onload = function(){

	const editor = document.getElementById("memo_cont");
	const btnBold = document.querySelector(".Bold");
	const btnItalic = document.querySelector(".Italic");
	const btnUnderline = document.querySelector(".Underline");
	const btnStrikethrough = document.querySelector(".Strikethrough");
	const btnAlignLeft = document.querySelector(".alignLeft");
	const btnAlignCenter = document.querySelector(".alignCenter");
	const btnAlignRight = document.querySelector(".alignRight");
	const btnAlignfull = document.querySelector(".alignJustify");
	const fontSizeSelector = document.querySelector(".fontSize");
	
	
	btnBold.addEventListener("click",function(){ // 글자 굵게 변경
		setStyle('bold');
	});
	
	btnItalic.addEventListener("click",function(){ // 이텔릭체로 변경
		setStyle('italic');
	});
	
	btnUnderline.addEventListener('click', function () { //밑줄적용 -> 적용이 왜 안되는지모르겠음
        setStyle('underline');
    });

    btnStrikethrough.addEventListener('click', function () {  //가운데줄적용 -> 적용이 왜 안되는지모르겠음
        setStyle('strikethrough');
    });
	
	btnAlignLeft.addEventListener('click', function () {  //왼쪽정렬
        setStyle('justifyleft');
    });
	
	btnAlignCenter.addEventListener('click', function () { //가운데정렬
        setStyle('justifycenter');
    });
    
    btnAlignRight.addEventListener('click', function () { //오른쪽정렬
        setStyle('justifyright');
    });
    
    btnAlignfull.addEventListener('click', function () { //양쪽정렬
        setStyle('justifyfull');
    });
    
    fontSizeSelector.addEventListener('change',function(){
    	
    	setFontSize(this.value);
    });
    
    function setFontSize(size){
    	document.execCommand('fontsize',false,size);
    	focusEditor();
    }
	
	function setStyle(style) {
        document.execCommand(style);
        focusEditor();
    }
    
    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }
    
    const img = document.querySelector(".chooseImg");
    
    img.addEventListener("change",function(e){
    
    	const files = e.target.files;
        if (files) {
            insertImageDate(files[0]);
        }
    	console.log("바뀜");
    });
    
     function insertImageDate(file) {
        const reader = new FileReader();
        reader.addEventListener('load', function () {
            document.getElementById("memo_cont").focus();
            document.execCommand('insertImage', false, `${reader.result}`);
        },false);
        reader.readAsDataURL(file);
    }
    
    
}

