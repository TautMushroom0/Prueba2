<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:form action='/camps/users.do'>
<input type='hidden' name='method'>
<input type='hidden' name='users'>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
	<bean:message key='label.campaign.campaign_users.title'/>
	</td>
</tr>
<tr>
	<td align="center" class="gamma" valign="top" width="48%">
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<td align="center" class="alpha">
				<font class="alpha" size="2"><b><bean:message key='label.admin.roles.current'/></b></font>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table border="0" cellpadding="0" cellspacing="2" width="90%">
				<tr>
					<td>
						<html:select styleClass="htmlSelect" name="scriptAdminForm" property="selectedCUsers" size="20" multiple="true" >
							<html:optionsCollection name="scriptAdminForm" property="currentUsers" value="id.TUsuarios.idUsuario" label="id.TUsuarios.usuario"/>
						</html:select>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
	<td align="center" class="gamma" valign="middle" width="4%">
		<br>
		<input type="button" class="btn btn-primary" value=">>" onclick="this.form.users.value='c';this.form.method.value='change_users';this.form.submit();">
		<br><br>
		<input type="button" class="btn btn-primary" value="&lt;&lt;" onclick="this.form.users.value='a';this.form.method.value='change_users';this.form.submit();">
		<br>
	</td>
	<td align="center" class="bg" valign="top" width="48%">
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<td align="center" class="alpha">
				<font class="alpha" size="2"><b><bean:message key='label.admin.roles.available'/></b></font>
			</td>
		</tr>
		<tr>
			<td align="center">
				<table border="0" cellpadding="0" cellspacing="2" width="90%">
				<tr>
					<td>
						<html:select styleClass="htmlSelect" name="scriptAdminForm" property="selectedAUsers" size="20" multiple="true">
							<html:optionsCollection name="scriptAdminForm" property="availableUsers" value="id.TUsuarios.idUsuario" label="id.TUsuarios.usuario"/>
						</html:select>
					</td>
				</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</html:form>
