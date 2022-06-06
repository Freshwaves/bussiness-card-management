<%@page import="vo.CardBean"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>

<% CardBean article = (CardBean)request.getAttribute("card");
   String nowPage = (String)request.getAttribute("page"); %>


<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
  	<title>명함 관리 시스템 : 명함 수정</title>
  	<script type="text/javascript">
    function modifyCard(){
      modifyform.submit();
    }
    </script>
  	<style type="text/css">
  		@font-face {
  			src: url("../fonts/LeferiBaseRegular.ttf");
  			font-family: "Leferi";		}
  		* {  			font-family: "Leferi";  		}
      #modifyForm {  			margin: auto;			width: 600px;			height : 400px;		}
  		table {  			margin: 10px;			width: 600px;			border: 1px solid lightgray;}
  		input {  			width: 200px;  		}
      a {text-decoration: none;}
  		#commandCell {  			margin-top: 10px;  			text-align: center;  		}
  	</style>
  </head>
  	<body>
  		<section id="modifyForm">
  		<h2 style="text-align: center;">명함 수정</h2>
  			<form action="cardModifyPro.bo" method="post" name="modifyform">
  				<table border="1px" align="center" cellspacing="0">
            <tr>
  						<td class="td_left"><label for="emp_num">사번</label></td>
  						<td colspan="3" class="td_right"><input type="number" name="emp_num" id="emp_num" required="required" value="<%=card.getEMP_NUM() %>" /></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="name_kor">성명</label></td>
  						<td class="td_right"><input type="text" name="name_kor" id="name_kor" required="required" value="<%=card.getNAME_KOR() %>"/></td>
  						<td class="td_left"><label for="name_eng">영문자 성명</label></td>
  						<td class="td_right"><input type="text" name="name_eng" id="name_eng" required="required" value="<%=card.getNAME_KOR() %>"/></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="soc_num">주민번호</label></td>
  						<td class="td_right" colspan="3"><input type="text" name="soc_num" id="soc_num" required="required" value="<%=card.getSOC_NUM() %>"/></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="emp_passwd">비밀번호</label></td>
  						<td class="td_right"><input type="password" name="emp_passwd" id="emp_passwd" required="required" /></td>
  						<td class="td_left"><label for="emp_passwd_confirm">비밀번호 확인</label></td>
  						<td class="td_right"><input type="password" name="emp_passwd_confirm" id="emp_passwd_confirm" required="required" /></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="dep_num">부서명</label></td>
  						<td class="td_right"><input type="text" name="dep_num" id="dep_num" required="required" value="<%=card.getDEP_NUM() %>"/></td>
  						<td class="td_left"><label for="pos_num">직위</label></td>
  						<td class="td_right"><input type="text" name="pos_num" id="pos_num" required="required" value="<%=card.getPOS_NUM() %>"/></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="mobile">모바일</label></td>
  						<td class="td_right"><input type="text" name="mobile" id="mobile" required="required" value="<%=card.getMOBILE() %>"/></td>
  						<td class="td_left"><label for="email">이메일</label></td>
  						<td class="td_right"><input type="text" name="email" id="email" required="required" value="<%=card.getEMAIL() %>"/></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="phone">유선전화</label></td>
  						<td class="td_right"><input type="text" name="phone" id="phone" required="required"  value="<%=card.getPHONE() %>"/></td>
  						<td class="td_left"><label for="tel">팩스</label></td>
  						<td class="td_right"><input type="text" name="tel" id="tel" required="required"  value="<%=card.getFAX() %>"/></td>
  					</tr>
  					<tr>
  						<td class="td_left"><label for="d_entry">입사일</label></td>
  						<td class="td_right"><input type="date" name="d_entry" id="d_entry" required="required"  value="<%=card.getD_ENTRY() %>"/></td>
  						<td class="td_left"><label for="e_resign">퇴사일</label></td>
  						<td class="td_right"><input type="date" name="e_resign" id="e_resign" required="required"  value="<%=card.getD_RESIGN() %>"/></td>
  					</tr>
            <tr>
              <td colspan="4" align="center">권한 비밀번호를 입력하세요.<br>
              <input type="password" name="author_passwd" id="author_passwd" required="required" /></td>
            </tr>
  				</table>
  				<section id="commandCell">
  					<a href="javascript:modifyCard()">수정 </a>|
            <a href="javascript:history.go(-1)"> 뒤로</a>
  				</section>
  		</form>
  		</section>
  	</body>
  </html>
