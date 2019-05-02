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
	
	
	var lectureName=document.getElementById('lectureName').value; 
	if(lectureName==""){
		alert('강의명이 입력되지 않았습니다.');
		return;
	}
	
	var professorName=document.getElementById('professorName').value; 
	if(professorName==""){
		alert("교수명이 입력되지 않았습니다.");
		return;
	}
	var lectureYear=document.getElementById('lectureYear').value; 
	if(lectureYear==""){
		alert("수강 년도가 입력되지 않았습니다.")
	}
	var semesterDivide=document.getElementById('semesterDivide').value; 
	if(semesterDivide==""){
		alert("수강 학기가 입력되지 않았습니다.")
	}
	var lectureDivide=document.getElementById('lectureDivide').value; 
	if(lectureDivide==""){
		alert("강의 구분이 입력되지 않았습니다.")
	}
	var semesterDivide=document.getElementById('semesterDivide').value; 
	if(semesterDivide==""){
		alert("학기 구분이 입력되지 않았습니다.")
	}
	var evaluationTitle=document.getElementById('evaluationTitle').value; 
	if(evaluationTitle==""){
		alert("평가 제목이 입력되지 않았습니다.")
	}
	var evaluationContent=document.getElementById('evaluationContent').value; 
	if(evaluationContent==""){
		alert("평가 내용이 입력되지 않았습니다.")
	}
	var totalScore=document.getElementById('totalScore').value; 
	if(totalScore==""){
		alert("전체 점수가 입력되지 않았습니다.")
	}
	var creditScore=document.getElementById('creditScore').value; 
	if(creditScore==""){
		alert("수강 년도가 입력되지 않았습니다.")
	}
	var comfortableScore=document.getElementById('comfortableScore').value; 
	if(comfortableScore==""){
		alert("수강 년도가 입력되지 않았습니다.")
	}
	var lectureScore=document.getElementById('lectureScore').value; 
	if(lectureScore==""){
		alert("수강 년도가 입력되지 않았습니다.")
	}
	
	var f=document.evaluationForm; //폼 name
	   f.lectureName.value = lectureName; //POST방식으로 넘기고 싶은 값
	   f.professorName.value=professorName;
	   f.lectureYear.value=lectureYear;
	   f.semesterDivide.value=semesterDivide;
	   f.lectureDivide.value=lectureDivide;
	   f.semesterDivide.value=semesterDivide;
	   f.evaluationTitle.value=evaluationTitle;	   
	   f.evaluationContent.value=evaluationContent;
	   f.totalScore.value=totalScore;   
	   f.creditScore.value=creditScore;
	   f.comfortableScore.value=comfortableScore;   
	   f.lectureScore.value=lectureScore;
	   
	   f.submit();
	  
}

function checkSaveResult(){
	
	var saveResult='${saveResult}';
	
	if(saveResult=='true'){
		alert('저장 성공');
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

					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>

				<div class="modal-body">
					<form name="evaluationForm" method="post" action="/evaluationReg">

						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>강의명</label> 
								<input type="text" name="lectureName" id="lectureName" class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label> 
								<input type="text" name="professorName" id="professorName" class="form-control" maxlength="20">

							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>수강 연도</label> <select name="lectureYear" id="lectureYear"
									class="form-control">
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018" selected>2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
								</select>
							</div>

							<div class="form-group col-sm-4">
								<label>수강 학기</label> <select name="semesterDivide" id="semesterDivide"
									class="form-control">
									<option value="1학기" >1학기</option>
									<option value="여름학기">여름학기</option>
									<option value="2학기"selected>2학기</option>
									<option value="겨울학기">겨울학기</option>
								</select>
							</div>


							<div class="form-group col-sm-4">
								<label>강의 구분</label> 
								<select name="lectureDivide" id="lectureDivide"
									class="form-control">
									<option value="전공"selected>전공</option>
									<option value="교양">교양</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label>제목</label> <input type="text" name="evaluationTitle" id="evaluationTitle"
								class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control" id="evaluationContent"
								maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-row">

							<div class="form-group col-sm-3">
								<label>종합</label> <select name="totalScore" id="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>

							<div class="form-group col-sm-3">
								<label>성적</label> <select name="creditScore" id="creditScore"
									class="form-control">
									<option value="A" >A</option>
									<option value="B"selected>B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>


							<div class="form-group col-sm-3">
								<label>널널</label> <select name="comfortableScore" id="comfortableScore"
									class="form-control">
									<option value="A" >A</option>
									<option value="B">B</option>
									<option value="C"selected>C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>

							<div class="form-group col-sm-3">
								<label>강의</label> <select name="lectureScore" id="lectureScore"
								
									class="form-control">
									<option value="A" >A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D"selected>D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" onClick="save();">등록하기</button>
						</div>
						
					</form>

				</div>

			</div>


		</div>
	</div>


</body>
</html>