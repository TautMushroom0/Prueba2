<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:link action="/camps/show_pages" paramId="index" paramName="scriptAdminForm" paramProperty="currentCampaign.idScript"><bean:message key="label.page.back"/></html:link>
<br><br><br>
<html:form action = "/camps/create_page_result">	
	<input type='hidden' name='method'>	

	<table cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td><bean:message key = "label.page.name"/>:&nbsp;&nbsp;</td> 
			<td><html:text styleClass="textImput" property = "page.nombre"/></td>
			<td>&nbsp;<html:errors property="page.nombre"/></td>
		</tr>				
		<tr>				
			<td>&nbsp;</td>
		</tr>
		<logic:empty name='createCampaignForm' property="page.idPagina">
			<td/>
			<td>
			<input type='submit' value="<bean:message key='label.common.create'/>" onClick="this.form.method.value='save_page';"/>
			</td>
		</logic:empty>
		<logic:notEmpty name='createCampaignForm' property="page.idPagina">
			<td/>
			<td>
			<input type='submit' value="<bean:message key='label.common.modify'/>" onClick="this.form.method.value='save_page';"/>
			</td>
		</logic:notEmpty>		
	</table>
</html:form>


	
