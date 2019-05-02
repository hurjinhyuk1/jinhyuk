<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>KPU Lecture</title>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- 부트스트랩 CSS 추가하기-->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/color.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">

<script>
function save(){
	var reportTitle=document.getElementById('reportTitle').value; 
	var reportContent=document.getElementById('reportContent').value; 
	
	if(reportTitle=="" || reportContent==""){
		alert('입력이 안된 사항이 있습니다.');
	}
	var f=document.reportForm;
	f.reportTitle.value=reportTitle;
	f.reportContent.value=reportContent;
	f.submit();
}

function checkSaveResult(){
	
	var saveResult='${saveResult}';
	
	if(saveResult=='true'){
		alert('관리자에게 전송을 완료하였습니다.');
		opener.parent.location.reload();
		self.close();
		
	}
	else if(saveResult=='false'){
		alert('저장 실패');
	}
	
}
</script>

</head>

<body onLoad="checkSaveResult();">
<div id="registerModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					 <h5 class="modal-title" id="modal">질문하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<form name="reportForm" method="post" action="/report">
					
	 				<div class="form-group">
	                <label>질문 제목</label>
	                <input type="text" id="reportTitle" name="reportTitle" class="form-control" maxlength="20">
	              	</div>
	              		
              <div class="form-group">
                <label>질문 내용</label>
                <textarea type="text" id="reportContent" name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-success"  onClick="save();">등록하기</button>
              </div>
            </form>
            
          </div>
        </div>
      </div>
    </div>
</body>
</html>