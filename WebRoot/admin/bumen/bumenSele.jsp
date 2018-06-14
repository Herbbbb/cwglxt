<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        		
	</head>
	<script>
	function closeWindow(){
		window.close();
	}
	</script>
	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>			
		<form action="<%=path %>/zhigong?type=zhigongAddMessage" name="formAdd" method="post">
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="7" background="<%=path %>/img/tbg.gif">&nbsp;部门选择&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">&nbsp;</td>
					<td>名称</td>
					<td>人数</td>
					<td>工资系数</td>
		        </tr>	
				<c:forEach items="${requestScope.bumenList}" var="bumen">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="bmxx" value="${bumen.id }_${bumen.mingcheng}"/>
					</td>					
					<td bgcolor="#FFFFFF" align="center">
						${bumen.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bumen.renshu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${bumen.xishu}
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			    <!-- onclick="closeWindow()" -->
			      <input type="submit" value="选择" style="width: 80px;" />
			    </td>
			  </tr>
		    </table>	
		    </form>		
	</body>
</html>
