function check() {
	var titleStr = $(".content_title").val()
	var seconStr = $(".secon_text").val()
	var content = $(".txt").val();
	
	if(titleStr ==  "" || seconStr == "" || content == "") {
		alert("모든 항목에 내용을 입력해주세요");
		return false;
	}
	
	if($("input:radio[name=reviewStar]").is(":checked")) {
			
	} else {
		alert("평점을 체크해주세요")
		return false;
	}
}
$(function(){
	$("#file").on('change',function(){
		var fileInput = document.getElementById("file");
		var files = fileInput.files;
		var str;
		for(var i=0; i<files.length; i++) {
			str += files[i].name
			var txt = $(".upload-name").val(str.replace(/undefined/g, ""))
		}
	});
 });