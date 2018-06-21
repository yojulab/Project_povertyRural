<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value='/resources/css/uzen.css' />" rel="stylesheet" type="text/css" />

<script type="text/javascript">
  /* $(function() {
    $( "#tabs" ).tabs();
  }); */
 
  function null_check(str,msg){
		 var nidV = str.value;
		 var new_nidv = "";
		 var len = nidV.length;
		
		 for(i=0;i<=len;i++){
			 id_str = nidV.substring(i, i+1);
			 new_nidv += id_str.replace(" ", "");
		}
		
		if (new_nidv==""){
			alert(msg); 
			str.focus();
			str.value= "";
			return false;
		}
		//str.value=new_nidv;
	}	
	//fileCheck for HTML
	function fileCheck(filename){  
		var temp = filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase();
		var flag = false;
		var ext = new Array("avi","mp4","flv");
		
		for(var i = 0; i < ext.length; i++){
			if(temp == ext[i]){
				flag = true;
				break;
			}
		}
		if(!flag){
			alert("You can enter only avi, flv, mp4 file.");
			return false;
		}else{
			return true;
		}
	}
  
  function pageNullCheck(form){
	  if(null_check(form.guidTitl, "Insert Title!")==false){return false;}
	  if(null_check(form.guidCntsUrl, "Choose your Multimedia." )==false){return false;}
	  if(fileCheck(form.guidCntsUrl.value)==false){return false;}
	  
	  return true;
  }
  
	function guideInsert(){
		var form = document.guideInsert;
		var flag = false;
		
		flag = pageNullCheck(form);
		
		if(flag == true){
			form.method="post";
			form.submit();
		}
	}
	
</script>
    <div>
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Commerce Service Management</h2>
          <h3>Register or cancel memberships here. You may also make changes to members' information.</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->
      <!-- 탭============================================ : str -->
      <div id="tabs">
          <!-- <ul>
            <li><a href="#tabs-1">Templet</a></li>
            <li><a href="#tabs-2">Guide</a></li>
            <li><a href="#tabs-3">PR Post</a></li>
          </ul> -->
        <div id="tabs-1">
      <!-- 게시판 목록 : str -->
      <section class="itemSection ">
       <form name="guideInsert" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/adm/guide/">
	     <input type="hidden" name="insertFlag" value="B" />
	     <input type="hidden" name="kindOfWork" value="commerceGuide" />
            <table class="boardView write asset" summary="Templet register">
              <colgroup>
                <col width="18%" />
                <col width="*" />
              </colgroup>
              <tr>
                <th>Title<em>*</em></th>
                <td>
                  <input type="text" name="guidTitl" value="" id="guidTitl" class="guidTitl" />
                </td>
              </tr>
              <tr>
                <th>Type<em>*</em></th>
                <td>
                  <select style="height:24px;" class="guidType" name="guidType" id="guidType">
                    <option value="E">E Commerce</option>
                    <option value="T">Tool</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th>Language<em>*</em></th>
                <td>
                  <select style="height:24px;" class="guidLang" name="guidLang" id="guidLang">
                    <option value="M">Malaysian</option>
                    <option value="E">English</option>
                  </select>
                </td>
              </tr>
              
              <tr>
                <th>Video<em>*</em></th>
                <td class="filesch">
                  <input type="text" id="fakeFileTxt1" name="guidCntsUrl" class="fakeFileTxt" readonly="" />
                  <div class="fileDiv">
                    <input type="button" class="buttonImg" />
                    <input type="file" class="realFile" name="tempHtmlReal" id="tempHtmlReal" onchange="javascript:document.getElementById('fakeFileTxt1').value = this.value" />
                  </div>
                </td>
              </tr>
              <tr>
                <th>Contents</th>
                <td>
                  <textarea rows="4" cols="70" name="guidSmmr" id="guidSmmr"></textarea>
                </td>
              </tr>
            </table>
         </form>
          </section>
     <!-- 게시판 목록 : end -->
     </div>
      </div>
      <!-- 탭=========================================== : end -->
    </div>


    <!-- 버튼그룹 : srt -->
    <div class="btnGroup write">
      <ul>
        <li>
          <div class="button1 type2 enter">
            <a href="javascript:guideInsert()"><img src="<c:url value='/resources/images/btn_icon_enter.gif' />" alt="icon" /><span>Register</span></a>
          </div>
        </li>
        <li>
          <div class="button1">
            <a href="${pageContext.request.contextPath }/adm/guide/list">Cancel</a>
          </div>
        </li>
      </ul>
    </div>
    <!-- 페이지 넘버 : end -->

    <!-- 팝업 : srt -->
    <section class="popup" style="display: none;">
      <header>
        <h1>
          <span>Recipt</span>
          <div class="button4">
            <a href="#">X</a>
          </div>
        </h1>
      </header>
      <div class="btnGroup popup">
        <p>CBC members from reciving?</p>
        <ol>
          <li>
            <div class="button5">
              <a href="#">Yes<br /><em>Now recipt</em></a>
            </div>
          </li>
          <li>
            <div class="button5">
              <a href="#">No<br /><em>Later recipt</em></a>
            </div>
          </li>
        </ol>
      </div>
    </section>
    <!-- 팝업 : end -->
