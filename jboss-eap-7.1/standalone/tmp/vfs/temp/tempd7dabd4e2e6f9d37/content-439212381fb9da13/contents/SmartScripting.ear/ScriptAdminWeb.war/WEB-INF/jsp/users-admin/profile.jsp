<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:form method="post" action="/admin/options.do">
<input type='hidden' name='method'/>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td align="center" class="gamma" valign="top">
	<center>
		<table border="0" cellpadding="2" cellspacing="0" >
		<tr>
			<td align="center"  style=" background-color: #ececec;">
				<font class="alpha " size="2">
				   <strong><bean:message key="button.admin.user.profile"/></strong>
			    </font>
			</td>
		</tr>
		<tr>
		<td class="displayTagBorder" style=" padding: 12px 0px 12px 18px;">
			<table border="0" cellpadding="0" cellspacing="0" width="100%>
				<tr>
					<td class="textCell">
						<font class="portlet-font">
						<b><bean:message key="label.admin.user.name"/></b>
						</font>
					</td>
				</tr>
				<tr>
					<td class="inputCell">				
						<bean:write name="admin_b" property="user.usuario"/>
					</td>
				</tr>
				<tr>
					<td class="textCell">
						<font class="portlet-font">
						<b><bean:message key="label.admin.user.password"/></b>
						</font>
					</td>
				</tr>
				<tr>
					<td class="inputCell">	
						<html:errors property="password1_empty_error"/><br>
						<html:password name="admin_b" property="user.contrasena" value='' size="16"/>
					</td>
				</tr>
				<tr>
					<td class="inputCell">
						<html:errors property="password_mismatch"/><br>	
						<html:password name="admin_b" property="contrasena2" size="16"/>
					</td>
				</tr>				
				<tr>
					<td class="textCell">
						<font class="portlet-font">
						<b><bean:message key="label.admin.user.login_id"/></b>
						</font>
					</td>
				</tr>
				<tr>
					<td class="inputCell">	
						<html:text name="admin_b" property="user.loginId" size="16"/>
					</td>
				</tr>
				<tr>
					<td align="center" style=" padding: 4px 0px 4px 0px;">
						<span class="inputCell"><input class="btn btn-primary" type="button" 
						value='<bean:message key="label.admin.save"/>' 
						onClick="this.form.method.value='modify_user';this.form.submit();"></span>
					</td>
				</tr>
			</table>
		</td>
		</tr>
		</table>
	</center>
	</td>
</tr>
</table>
</html:form>