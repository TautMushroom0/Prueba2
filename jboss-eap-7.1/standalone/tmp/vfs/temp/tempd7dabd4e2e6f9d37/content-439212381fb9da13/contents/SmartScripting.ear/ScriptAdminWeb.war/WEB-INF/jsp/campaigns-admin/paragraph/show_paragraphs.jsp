<%@ include file="/WEB-INF/jsp/common/init.jsp" %>
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.CreateCampaignForm"%>
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.ScriptAdminForm"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TParrafos"%>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="actions" key="label.campaigns.actions" />
	<fmt:message var="position" key="label.paragraph.position" />
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
		</td>
	</tr>
</table>
<p><html:errors/></p>
<H1><bean:message key="label.paragraph.paragraphs"/></H1>
<%
	CreateCampaignForm ccfJsp = (CreateCampaignForm)request.getSession().getAttribute("createCampaignForm");
	ScriptAdminForm safJsp = (ScriptAdminForm)request.getSession().getAttribute("scriptAdminForm");
%>

<div>
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/show_pages.do?index=<bean:write name='scriptAdminForm' property='currentCampaign.idScript'/>">
		<bean:write name="scriptAdminForm" property="currentCampaign.nombre"/>
	</a>
	<br>
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/elbow.gif">
	<bean:write name="scriptAdminForm" property="curPage.nombre"/>
	<br><br>
</div>

<html:form action="/camps/paragraph">		
	<%int pos=0;%>	
	<div class="table-responsive">
	<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.curPage.TParrafoses" sort="list" defaultsort="2" id="row" pagesize="10" requestURI="/camps/paragraph.do?method=show">
		<display:column title='ID' sortable="true" property="idParrafo" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
		<display:column title="${position}" sortable="true" sortProperty="posicion" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator">
			<%	
				TParrafos par=(TParrafos)row;
				(ccfJsp.getIds())[pos] = par.getIdParrafo().intValue();
				(ccfJsp.getNewPos())[pos] = par.getPosicion().intValue();
				pos++;				
			%>
			<div style="display:none"><bean:write name="row" property="posicion"/></div>
			<html:text styleClass="textImput" property="newPos[${row_rowNum-1}]" size="1"/>
 		</display:column>
		<display:column title="${actions}"> 		
			<logic:equal name ="scriptAdminForm" property = "currentCampaign.activo" value = "0">
				<html:link action="/camps/text?method=show" paramId="index" paramName="row" paramProperty="idParrafo">
					<img src="/script-admin/imgs/zoom.gif" title="<bean:message key='label.common.icons.show_texts'/>" alt="<bean:message key='label.common.icons.show_texts'/>">
				</html:link>				
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_paragraph" paramId="index" paramName="row" paramProperty="idParrafo">
					<img src="/script-admin/imgs/delete.gif" title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
				</html:link>				
			</logic:equal> 		
		</display:column>
	</display:table>
	</div></div>
	<input type='hidden' name='method'>
	<c:if test="<%= safJsp.getCurPage().getTParrafoses()!=null && safJsp.getCurPage().getTParrafoses().size()!=0%>">
		<br>
		<input type="button" class="btn btn-primary" value="<bean:message key='label.paragraph.save_order'/>" onclick="this.form.method.value='re_order';this.form.submit();"/>
	</c:if>	
	<br><br>
	<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value = "0">
		<html:link action="/camps/paragraph?method=create&index=1">  
			<bean:message key="label.paragraph.create" />
		</html:link>	
	</logic:equal>
</html:form>	
