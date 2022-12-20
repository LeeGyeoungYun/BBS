<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트3</title>
<style>
	.abc{
		width: 400px;
		height: 300px;
		margin: 150px auto;
		border: 3px solid;
	}
	
	#spana{
		width:30px;
		height: 30px;
		border: 1px solid;
		display: inline-block;
	}
</style>

</head>
<body>
	<input type="button" onclick="ab()">
	<input type="button" id="spana" value="ccc">
	<div class="abc" contenteditable="true"></div>
	<div class="aa"><p>aaa</p>
					<b>aaa</b>
					<i>aaa</i>
					<u>dddd</u>
					<s>sss</s>
		</div>
		
		<div class="actions" data-for="div">
  			<button data-el="b">Bold</button>
 			 <button data-el="i">Italic</button>
 			 <button data-el="u">underline</button>
		</div>

<div contenteditable="true" class="editarea">Some text.</div>
	
	<script>
	function ab(){
		document.execCommand('bold');
	}
	
	function cc(){
		document.execCommand('Italic');
	}
	
	const ss = document.getElementById("spana");
	ss.addEventListener('click',function(){
		
		console.log("찍힘");
		document.execCommand('Italic');
	});
	
	const buttonContainers = document.querySelectorAll(".actions");

	for (const buttonContainer of buttonContainers) {
	  const buttons = buttonContainer.querySelectorAll("button");
	  const pasteTarget = buttonContainer.getAttribute("data-for");

	  for (const button of buttons) {
	    const elementName = button.getAttribute("data-el");
	    button.addEventListener("click", () =>
	      insertText('<${elementName}>focus()</${elementName}>', pasteTarget)
	    );
	  }
	}

	// Inserts text at cursor, or replaces selected text
	function insertText(newText, selector) {
	  const textarea = document.querySelector(selector);
	  textarea.focus();

	  let pasted = true;
	  try {
	    if (!document.execCommand("insertText", false, newText)) {
	      pasted = false;
	    }
	  } catch (e) {
	    console.error("error caught:", e);
	    pasted = false;
	  }

	  if (!pasted) {
	    console.error("paste unsuccessful, execCommand not supported");
	  }
	}
	
</script>
</body>
</html>