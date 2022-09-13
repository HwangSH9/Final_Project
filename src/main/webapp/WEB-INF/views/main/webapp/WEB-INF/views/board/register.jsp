<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<!-- Page555 업로드를 위한 uploadAjax.jsp의 CSS부분을 register.jsp내에 추가함 -->
<!-- Page555 style 태그 시작 -->
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<!-- Page555 style 태그 끝 -->

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/board/register" method="post">
          <div class="form-group">
            <label>Title</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control" rows="3" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>Writer</label> <input class="form-control" name='writer'>
          </div>
          <button type="submit" class="btn btn-default">Submit
            Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- Page554 기존 게시물의 제목이나 내용을 입력하는 부분 아래쪽에 새로운 div 태그를 추가함 -->
<!-- Page554 File Attach 소스 코딩 시작 -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">File Attach</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple>
        </div>
        
        <div class='uploadResult'> 
          <ul>
          
          </ul>
        </div>
        
        
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- Page554 File Attach 소스 코딩 끝 -->

<script>
// Page556 Javascript 처리 : 가장 먼저 'Submit Button'을 클릭했을 때 첨부파일 관련된
// 처리를 할 수 있도록 기본 동작을 막는 작업부터 시작합니다.
$(document).ready(function(e) {
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		
		// 아래 Page564 소스 코딩 추가 (시작)
		var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      // Page564 BoardVO에는 attachList라는 이름의 변수로 첨부파일의 정보를
	      // 수집하기 때문에 <input type='hidden'>의 name은
	      // 'attachList[인덱스번호]'와 같은 이름을 사용하도록 합니다.
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
		
	}); // 아래 Page564 소스 코딩 추가 (끝)

// Page556 ~ Page557 소스 코딩 : 첨부된 파일의 처리는 앞서 방식과 동일하지만,
// 섬네일이나 파일 아이콘을 보여주는 부분은 처리하지 않았습니다.
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize){
  
  if(fileSize >= maxSize){
    alert("파일 사이즈 초과");
    return false;
  }
  
  if(regex.test(fileName)){
    alert("해당 종류의 파일은 업로드할 수 없습니다.");
    return false;
  }
  return true;
}

$("input[type='file']").change(function(e){

  var formData = new FormData();
  
  var inputFile = $("input[name='uploadFile']");
  
  var files = inputFile[0].files;
  
  for(var i = 0; i < files.length; i++){

    if(!checkExtension(files[i].name, files[i].size) ){
      return false;
    }
    formData.append("uploadFile", files[i]);
    
  }
  
  $.ajax({
    url: '/uploadAjaxAction',
    processData: false, 
    contentType: false,data: 
    formData,type: 'POST',
    dataType:'json',
      success: function(result){
        console.log(result); 
		// Page557 소스 코딩 실행할 때 아래 1줄 소스는 주석 처리함  
        // showUploadResult(result); //업로드 결과 처리 함수
        
        // Page558 showUploadResult 제작 반영 후 아래 1줄 소스 추가
		showUploadResult(result); //업로드 결과 처리 함수
    	}
  	}); //$.ajax
  });

// Page558 showUploadResult 제작 반영 소스 코딩 시작
function showUploadResult(uploadResultArr){
    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    
        // image type
        // Page560 삭제를 위해 업로드된 파일의 경로와 UUID가 포함된 파일 이름이 필요하므로
        // Page561 button 태그에 'data-file'과 'data-type' 정보를 추가함
        if(obj.image){
          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
          // Page563 소스 코딩 할 때 아래 1줄 소스는 주석 처리함
          // str += "<li><div>";
          
          // Page563 아래 3줄 소스 코딩함 : 첨부파일 정보를 태그로 생성할 때 첨부파일과
          // 관련된 정보(data-uuid, data-filename, data-type)를 추가합니다.
          str += "<li data-path='"+obj.uploadPath+"'";
		  str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
		  str +" ><div>";
          
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/display?fileName="+fileCallPath+"'>";
          str += "</div>";
          str +"</li>";
        }else{
          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
              
          // Page563 소스 코딩 할 때 아래 1줄 소스는 주석 처리함
          // str += "<li><div>";
          
          // Page563 아래 2줄 소스 코딩함 : 첨부파일 정보를 태그로 생성할 때 첨부파일과
          // 관련된 정보(data-uuid, data-filename, data-type)를 추가합니다.
          str += "<li "
		  str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/resources/img/attach.png'></a>";
          str += "</div>";
          str +"</li>";
        }
    });
    uploadUL.append(str);
  }
  // Page558 showUploadResult 제작 반영 소스 코딩 끝

  // Page560 업로드된 파일의 삭제를 위해 x 모양의 아이콘을 클릭할 때 이루어지는 이벤트 등록
  // 업로드된 파일에 'x'아이콘을 클릭하면 브라우저 콘솔창에 'delete file'이 출력되는 것을
  // 확인해 봅니다.   
  $(".uploadResult").on("click", "button", function(e){
    
    console.log("delete file");
      
    // Page561 'x'아이콘을 클릭하면 서버에서 삭제하도록 이벤트를 처리합니다.
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");
    
    $.ajax({
      url: '/deleteFile',
      data: {fileName: targetFile, type:type},
      dataType:'text',
      type: 'POST',
        success: function(result){
           alert(result);
           
           targetLi.remove();
         }
    }); //$.ajax
   });

  
});


</script>


<%@include file="../includes/footer.jsp"%>
