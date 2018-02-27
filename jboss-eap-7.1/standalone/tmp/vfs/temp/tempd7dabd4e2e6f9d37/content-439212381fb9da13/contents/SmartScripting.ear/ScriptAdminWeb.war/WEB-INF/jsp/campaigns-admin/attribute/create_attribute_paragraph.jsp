<%@ include file="/WEB-INF/jsp/common/init.jsp" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TAtributos" %>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="actions" key="label.campaigns.actions" />
	<fmt:message var="select" key="label.common.select" />
	<fmt:message var="name" key="label.campaign.name" />
	<fmt:message var="confirm" key="label.common.confirm_delete" />
</fmt:bundle>

<table>
	<tr>
		<td class="textCell">
		<a href="/script-admin/camps/show_campaigns.do"><bean:message key='label.campaigns'/></a>
		&nbsp;|&nbsp;
		<a href="/script-admin/camps/show_pages.do?index=<bean:write name='scriptAdminForm' property='currentCampaign.idScript'/>">
		<bean:message key='label.pages'/>
		</a>		
		&nbsp;|&nbsp;
		<a href="/script-admin/camps/paragraph.do?method=show&index=<bean:write name='scriptAdminForm' property='curPage.idPagina'/>">
		<bean:message key='label.paragraph.paragraphs'/>
		</a>		
		&nbsp;|&nbsp;
		<a href="/script-admin/camps/text.do?method=show&index=<bean:write name='scriptAdminForm' property='curPar.idParrafo'/>">
		<bean:message key='label.text.texts'/>
		</a>		
		</td>
	</tr>
</table>

<h1><bean:message key="label.attributes"/></h1>
<br>
<br>

<div>
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/show_pages.do?index=<bean:write name='scriptAdminForm' property='currentCampaign.idScript'/>">
		<bean:write name="scriptAdminForm" property="currentCampaign.nombre"/>
	</a>
	<br>
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/paragraph.do?method=show&index=<bean:write name='scriptAdminForm' property='curPage.idPagina'/>">
		<bean:write name="scriptAdminForm" property="curPage.nombre"/>
	</a>
	<br>
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/text.do?method=show&index=<bean:write name='scriptAdminForm' property='curPar.idParrafo'/>">
		<bean:write name="scriptAdminForm" property="curPar.idParrafo"/>
	</a>
	<br><br>
</div>

<html:form action = "/camps/paragraph_attribute">
	<input type='hidden' name='method'>
	<table cellspacing="0" cellpadding="0" border="0" width="805">
		<tr><td colspan="2">
			<p align="center">
				<html:errors/>
				<logic:notEqual name="createAttributeForm" property="attrProblem" value="0">
					<bean:write name="createAttributeForm" property="attrProblem"/> 
				</logic:notEqual>
			</p>
		</td></tr>		
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr>
		<td width="65%" align="center">
			<table>
			<tr>
				<td width="100%" align="right">
				<div class="table-responsive">
				<div class="dataTable_wrapper">
					<display:table class='table table-striped table-bordered table-hover' name="sessionScope.createAttributeForm.attributes" sort="list" defaultsort="2" id="row" pagesize="10" requestURI="/camps/paragraph_attribute_no_check.do?no_action=true">		
						<display:column title='ID' property="idAtributo" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
						<display:column title='${name}' sortProperty="nombre" sortable="true">
							<table><tr><td>
								<% 
								TAtributos at = (TAtributos)row;
								%>
								<%=at.getTagInicial()%>
								<bean:write name="row" property="nombre"/>
								<%=at.getTagFinal()%>						
							</td></tr></table>
						</display:column>
						<display:column title="${actions}">
							<html:link action="/camps/paragraph_attribute_no_check?method=edit" paramId="index" paramName="row" paramProperty="idAtributo">
								<img src='/script-admin/imgs/edit.gif'>
							</html:link>	
						</display:column>
						<display:column title='${select}'>
							<%								
								TAtributos a = (TAtributos)row;
								String aId = a.getIdAtributo().toString();
							%>
							<html:multibox name="createAttributeForm" property="selectedAttributes" value="<%=aId%>"/>
						</display:column>
					</display:table>
				</div></div>
				</td>
			</tr>
			<tr>
				<td/>
			</tr>
			<tr>
				<td width="100%" align="right">
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.add'/>" onclick="this.form.method.value='add_attribute';this.form.submit();"/>
					&nbsp;&nbsp;
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.delete'/>" onclick="this.form.method.value='delete';if(confirm('${confirm}')){this.form.submit();}"/>
				</td>
		    </tr>	
		    </table>		
		</td>
		<td width="35%" align="center" valign="top">
			<br>
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
				    <td class="editBoxContainer" valign="top"> 
			         <table cellspacing="0" cellpadding="0" border="0" class="editBox">
				        <tr>
					        <td class="textCell"><bean:message key='label.attribute.create.name'/>:&nbsp;</td>
					 		<td class="inputCell"><html:text styleClass="textImput" property="nombre"/></td>
					 	</tr>	
				        <tr>
					        <td class="textCell"><bean:message key='label.attribute.create.openingTag'/>:&nbsp;</td>
					 		<td class="inputCell"><html:text styleClass="textImput" property="openingTag"/></td>
					 	</tr>	
						<tr>
							<td class="textCell"><bean:message key='label.attribute.create.closingTag'/>:&nbsp;</td>
							<td class="inputCell"><html:text styleClass="textImput" property="closingTag"/></td>
						</tr>
					    <tr>
					        <td></td>
							<td align="right" class="inputCell"><input type='button' class="btn btn-primary" value="<bean:message key='label.attribute.create.create'/>" onclick="this.form.method.value='create_attribute';this.form.submit()"/></td>
				        </tr>				
			         </table>	         
				    </td>
				</tr>				
			</table>
		</td>
		</tr>
	</table>
</html:form>


	
