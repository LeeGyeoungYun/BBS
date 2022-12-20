


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
	saveData();
});

function saveData(){

	$.ajax({
		type:"post",
		url:"update_memo_ok",
		data:{title:$("#memo_title").val(), content:$("#memo_cont").html()},
		dataType:"json",
		success:function(data){
			let msg = data.code;
			console.log(msg);
			if(msg.includes("성공")){
				console.log("여기까지 들어옴");
			}
			
		},error : function(){
			console.log("실패");
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

