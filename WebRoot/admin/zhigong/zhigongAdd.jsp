<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 

<%
	String path = request.getContextPath();
	String bmName = (String)request.getAttribute("bmName");
	String bmID = (String)request.getAttribute("bmID");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
        <script language="javascript">
			function check(){
				if(document.formAdd.mingcheng.value == "")
				{
					alert("名称不能为空!");
					return false;
				}
				return true;
			}
			
            function openBumen()
            {
				var url="<%=path %>/bumen?type=bumenSele";
       	   		var ret = window.open(url,"部门信息选择","dialogWidth=200px;dialogHeight=200px;status=yes;help=no;scroll=yes");
            	if(ret != null)
            	{
            		console.log("THIS IS NOT NULL");
            		document.getElementById("bumen_id").value = <%=bmID%>;
            		document.getElementById("bmmc").value = <%=bmName%>;
            		
            	}else{
            		console.log("THIS IS  NULL");
            	}
            	
            }								
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/zhigong?type=zhigongAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>职工信息添加</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         职工编号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="bianhao" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         登录密码：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="password" name="loginpw" size="20"/>
						    </td>
						</tr>						
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         部门信息：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
								<%-- <input type="text" id="bmmc" readonly="readonly" onclick="openBumen()" />点击选择部门<!-- value="<%= bmName%>?'':<%= bmName%>" -->
								<input type="hidden" id="bumen_id" name="bumen_id"/> --%>
								<select>
									<option >财务部</option>
									<option >销售部</option>
								</select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         姓名：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="xingming" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         性别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <select name="xingbie">
						       	<option value="男">男</option>
						       	<option value="女">女</option>
						       </select>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         入职时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
								<input name="ruzhi" readonly="readonly" class="Wdate"  
						    		   type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交" onclick="return check();"/> 
						       <input type="reset" value="返回" onclick="javascript:history.back()"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
