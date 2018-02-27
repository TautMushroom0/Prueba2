<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>


<html:form method="post" action="/admin/options.do">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<div class="col-md-7" align="center" >
	<div align="center"  style=" background-color: #ececec;">
	<font class="alpha" size="2">
		<strong><bean:message key='label.admin.edit.users'/></strong>
	</font>
	</div>
	<div>
	<font class="portlet-font" style="font-size: x-small;"></font><br>
	<%--<input class="form-text" name="user_sel_name" size="30" type="text" onKeyUp="autoComplete(document.fm1.p_u_e_a, this.value); if (isSelected(document.fm1.p_u_e_a)) { enableFields(adminButtons); } else { disableFields(adminButtons); }">--%><br>
	</div>
	<div>
		<html:errors property="empty_selection"/>
		<br>
		<html:select style="width:70%"styleClass="htmlSelect" name="admin_b" property="selectedUser" size="20">
		<html:optionsCollection name="admin_b" property="users" label="usuario" value='idUsuario'/>
	    </html:select>
		<br>
		<br>
		<input type='hidden' name='method'/>
	</div>
	<div>
		<input class="btn btn-primary " name="edit_profile_btn" type="button" 
		value='<bean:message key="button.admin.user.profile"/>' 
		onClick="this.form.method.value='edit_profile';this.form.submit();">
		<input class="btn btn-primary ""portlet-form-button" name="edit_roles_btn" type="button" 
		value='<bean:message key="button.admin.user.roles"/>' 
		onClick="this.form.method.value='edit_roles';this.form.submit();">
	</div>
	<br>
	<div>
		<input class="btn btn-primary " name="delete_btn" type="button" 
		value='<bean:message key="button.admin.user.delete"/>' 
		onClick="this.form.method.value='remove_user';if(confirm('<bean:message key='message.admin.remove_user'/>')){this.form.submit();}">
	</div>
	<br><br>
</div>

<div class="col-md-5" align="center" >
	<div   style=" background-color: #ececec;">
	<font class="alpha" size="2">					
		<strong><bean:message key="label.admin.user.new"/></strong>
	</font>
	</div>
	<div>
	<br>
		<br>
		<font class="portlet-font">
		<b><bean:message key="label.admin.user.name"/></b>
		</font><br><html:errors property="user_empty_error"/><br>
		<html:text name="admin_b" property="user.usuario" size="16"/>
		<br><br>
	</div>
		<font class="portlet-font">
		<b><bean:message key="label.admin.user.password"/></b>
		</font><br><html:errors property="password_mismatch"/>
		<html:errors property="password1_empty_error"/><br>
		<html:password name="admin_b" property="user.contrasena" size="16"/>
		<br><br>
		<html:password name="admin_b" property="contrasena2" size="16"/>
		<br><br>
	<div>
		<font class="portlet-font">
		<b><bean:message key="label.admin.user.login_id"/></b>
		</font><br>
		<html:text name="admin_b" property="user.loginId" size="16"/>
		<br><br>
	</div>
	<div>
		<br>
		<input class="btn btn-primary" type="button" 
		value='<bean:message key="label.admin.user.new"/>' 
		onClick="this.form.method.value='add_user';this.form.submit();">
	</div>
	<div>
	</div>
	<br><br>
</div>


</table>
</html:form>
