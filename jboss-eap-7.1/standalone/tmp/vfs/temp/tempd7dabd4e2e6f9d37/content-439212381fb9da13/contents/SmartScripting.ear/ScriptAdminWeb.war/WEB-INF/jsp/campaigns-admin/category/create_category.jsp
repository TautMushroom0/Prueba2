<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:link action="/camps/show_pages" paramId="index" paramName="scriptAdminForm" paramProperty="currentCampaign.idScript"><bean:message key="label.page.back"/></html:link>
<br><br><br>
<html:form action = "/camps/category">
	<input type='hidden' name='method'>
	
	<table>
		<tr>
			<td><bean:message key="label.category.name"/>:&nbsp;&nbsp;</td>
			<td><html:text styleClass="textImput" property = "category.nombre"/></td>
			<td>&nbsp;<html:errors property="category.nombre"/></td>			
		</tr>
		<tr>
			<td><bean:message key="label.category.description"/>:&nbsp;&nbsp;</td>
			<td><html:text styleClass="textImput" property = "category.descripcion"/></td>
			<td>&nbsp;<html:errors property="category.descrip"/></td>
		</tr>
		<logic:empty name='createCampaignForm' property="category.idCategoria">
			<td/>
			<td>
			<input type='submit' value="<bean:message key='label.common.create'/>" onclick="this.form.method.value='save_category';"/>
			</td>
		</logic:empty>
		<logic:notEmpty name='createCampaignForm' property="category.idCategoria">
			<td/>
			<td>
			<input type='submit' value="<bean:message key='label.common.modify'/>" onClick="this.form.method.value='save_category';"/>
			</td>
		</logic:notEmpty>		
	</table>
</html:form>


	
