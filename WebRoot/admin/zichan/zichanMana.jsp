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
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script language="javascript">
           function zichanAdd()
           {
                 var url="<%=path %>/admin/zichan/zichanAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="30" background="<%=path %>/img/tbg.gif">资产信息查看</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td>资产类别</td>
					<td>资产编号</td>
					<td>资产名称</td>
					<td>资产价值（元）</td>
					<td>添加时间</td>
					<td>建议</td>
		        </tr>	
				<c:forEach items="${requestScope.zichanList}" var="zichan">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${zichan.lbmc}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${zichan.bianhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${zichan.mingcheng}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${zichan.jiazhi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${zichan.shijian}
					</td>					
					<td bgcolor="#FFFFFF" align="center">
						${zichan.strType}
					</td>					
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="zichanAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
