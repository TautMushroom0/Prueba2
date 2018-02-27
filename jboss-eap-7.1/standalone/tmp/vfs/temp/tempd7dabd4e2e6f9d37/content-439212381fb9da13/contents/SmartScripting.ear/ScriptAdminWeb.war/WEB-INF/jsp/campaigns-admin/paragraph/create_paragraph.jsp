<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:link action="/camps/paragraph?method=show" paramId="index" paramName="scriptAdminForm" paramProperty="curPage.idPagina"><bean:message key="label.paragraph.back"/></html:link>
<br><br><br>
<html:form action="/camps/paragraph">	
	<input type='hidden' name='method' value="save">	
	<input type='hidden' name='index' value="<bean:write name='scriptAdminForm' property='curPage.idPagina'/>">
	<table>
		<tr>   
			<td><bean:message key="label.paragraph.position"/>:</td> 
			<td><html:text styleClass="textImput" name="createCampaignForm" property="par.posicion"/> </td>
		</tr>				
		<tr><td/></tr>
		<tr>
			<td/>
			<td>
				<logic:empty name="createCampaignForm" property="par.idParrafo">
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.create'/>" onClick="this.form.submit();"/>
				</logic:empty>
				<logic:notEmpty name="createCampaignForm" property="par.idParrafo">
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.modify'/>" onClick="this.form.submit();"/>
				</logic:notEmpty>	
			</td>
		</tr>
	</table>
</html:form>
