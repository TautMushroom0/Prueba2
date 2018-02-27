<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:link action="/camps/show_pages" paramId="index" paramName="scriptAdminForm" paramProperty="currentCampaign.idScript"><bean:message key="label.page.back"/></html:link>
<br><br><br>
<html:form action = "/camps/variable">
	<input type='hidden' name='method'>
	
	<table>
		<tr>
			<td><bean:message key="label.variable.name"/>:&nbsp;&nbsp;</td>
			<td><html:text styleClass="textImput" property = "var.nombre"/></td>
			<td>&nbsp;<html:errors property="var.nombre"/></td>			
		</tr>
		<tr>
			<td><bean:message key="label.variable.description"/>:&nbsp;&nbsp;</td>
			<td><html:text styleClass="textImput" property = "var.descripcion"/></td>
			<td>&nbsp;<html:errors property="var.descrip"/></td>
		</tr>
		<logic:empty name='createCampaignForm' property="var.idVariable">
			<td/>
			<td>
			<input type='submit' value="<bean:message key='label.common.create'/>" onclick="this.form.method.value='save_variable';"/>
			</td>
		</logic:empty>
		<logic:notEmpty name='createCampaignForm' property="var.idVariable">
			<td/>
			<td>
			<input type='submit' value="<bean:message key='label.common.modify'/>" onClick="this.form.method.value='save_variable';"/>
			</td>
		</logic:notEmpty>		
	</table>
</html:form>


	
