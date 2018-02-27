<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:form action='/admin/options.do' method="post">
<input type='hidden' name='method'>
<input type='hidden' name='roles'>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<div class="col-md-12">
<br>
<bean:message key='label.admin.roles.edit_text'/>
<br><br>
</div>
<div class="col-md-5" align="center">
	<div><font class="alpha" size="2"><b><bean:message key='label.admin.roles.current'/></b></font></div>
	<div>
		<html:select style="width:90%" styleClass="htmlSelect" name="admin_b" property="selectedCRoles" size="20" multiple="true" >
		<html:optionsCollection name="admin_b" property="currentRoles" value="rol" label="rol"/>
		</html:select>
	</div>
</div>
<div class="col-md-2" align="center">
	<br>
	<input type="button" class="btn btn-primary" value=">>" onclick="this.form.roles.value='c';this.form.method.value='change_roles';this.form.submit();">
	<br><br>
	<input type="button" class="btn btn-primary" value="&lt;&lt;" onclick="this.form.roles.value='a';this.form.method.value='change_roles';this.form.submit();">
	<br>
</div>
<div class="col-md-5" align="center">
<font class="alpha" size="2"><b><bean:message key='label.admin.roles.available'/></b></font>
	<html:select  style="width:90%" styleClass="htmlSelect" name="admin_b" property="selectedARoles" size="20" multiple="true">
	<html:optionsCollection name="admin_b" property="availableRoles" value="rol" label="rol"/>
	</html:select>
</div>
<div class="col-md-12" align="center">
<br><br>
	<a href='/script-admin/admin/show.do'>
	<bean:message key="label.admin.back.main"/>
	</a>
	<br><br>
</div>
</table>
</html:form>
