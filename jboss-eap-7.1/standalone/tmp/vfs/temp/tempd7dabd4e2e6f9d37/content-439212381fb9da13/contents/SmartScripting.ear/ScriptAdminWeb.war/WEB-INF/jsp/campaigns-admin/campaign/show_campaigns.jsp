<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<%--Checking the performance--%> 
<%  
long startTime=0; 
System.out.println("displaytag begin..."); 
startTime = System.currentTimeMillis(); 

%> 
 
<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="name" key="label.campaign.name" /> 
	<fmt:message var="id_cce" key="label.campaign.id_cce" /> 
	<fmt:message var="initial_page" key="label.campaign.opening_page" /> 
	<fmt:message var="actions" key="label.common.edit.actions" />
	<fmt:message var="confirm" key="label.common.confirm_delete"/>
</fmt:bundle> 

<p><html:errors/></p>
<p>${scriptAdminForm.msgClonacion}</p>

<h1><bean:message key="label.campaign.show.active_campaigns"/></h1>
<div class="table-responsive">
<div class="dataTable_wrapper">
<display:table class="table table-striped table-bordered table-hover" name="sessionScope.scriptAdminForm.campanas" sort="list" defaultsort="1" id="row" pagesize="7" requestURI="/camps/show_campaigns.do?no_action=true">	
	<display:column title="ID" property="idScript" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
	<display:column title="${name}" sortable="true" property="nombre"/>
	<display:column title="${id_cce}" property="idExterno" sortable="true"/>
	<display:column title="${initial_page}" property = "paginaInicial" sortable="true"/>
	<display:column title="${actions}">
		<html:link action="/camps/show_pages" paramId="index" paramName="row" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.zoom'/>" alt="<bean:message key='label.common.icons.zoom'/>" src='/script-admin/imgs/zoom.gif'>
		</html:link>		
		<html:link action="/camps/show_campaigns?method=debug" paramId="index" paramName="row" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.debug'/>" alt="<bean:message key='label.common.icons.debug'/>" src='/script-admin/imgs/debug.gif'>
		</html:link>
		<html:link action="/camps/show_campaigns?method=clone" paramId="index" paramName="row" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.clone'/>" alt="<bean:message key='label.common.icons.clone'/>" src='/script-admin/imgs/clone.png'>
		</html:link>
	</display:column>
</display:table>
</div>
</div>

<h1><bean:message key="label.campaign.show.debug_campaigns"/></h1>
<div class="table-responsive">
<div class="dataTable_wrapper">
<display:table class="table table-striped table-bordered table-hover" name="sessionScope.scriptAdminForm.debugCampaigns" sort="list" defaultsort="1" id="row_d" pagesize="7" requestURI="/camps/show_campaigns.do?no_action=true">	
	<display:column title="ID" property="idScript" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
	<display:column title="${name}" sortable="true" property="nombre"/>
	<display:column title="${id_cce}" property="idExterno" sortable="true"/>
	<display:column title="${initial_page}" property = "paginaInicial" sortable="true"/>
	<display:column title="${actions}">
		<html:link action="/camps/show_pages" paramId="index" paramName="row_d" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.zoom'/>" alt="<bean:message key='label.common.icons.zoom'/>" src='/script-admin/imgs/zoom.gif'>
		</html:link>		
		<html:link action="/camps/show_campaigns?method=activate" paramId="index" paramName="row_d" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.activate'/>" alt="<bean:message key='label.common.icons.activate'/>" src='/script-admin/imgs/activate.gif'>
		</html:link>
		<html:link action="/camps/show_campaigns?method=deactivate" paramId="index" paramName="row_d" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.deactivate'/>" alt="<bean:message key='label.common.icons.deactivate'/>" src='/script-admin/imgs/deactivate.gif'>
		</html:link>
		<html:link action="/camps/show_campaigns?method=clone" paramId="index" paramName="row_d" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.clone'/>" alt="<bean:message key='label.common.icons.clone'/>" src='/script-admin/imgs/clone.png'>
		</html:link>
	</display:column>
</display:table>
</div></div>
<h1><bean:message key="label.campaign.show.inactive_campaigns"/></h1>
<div class="table-responsive">
<div class="dataTable_wrapper">
<display:table class="table table-striped table-bordered table-hover" name="sessionScope.scriptAdminForm.campanasInactivas" sort="list" defaultsort="1" id="row_i" pagesize="7" requestURI="/camps/show_campaigns.do?no_action=true">
	<display:column title="ID" sortable="true" property="idScript" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
	<display:column title="${name}" sortable="true" property="nombre"/>
	<display:column title="${id_cce}" property="idExterno" sortable="true"/>
	<display:column title="${initial_page}" property = "paginaInicial" sortable= "true"/>
	<display:column title="${actions}">
		<html:link action="/camps/show_pages" paramId="index" paramName="row_i" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.zoom'/>" alt="<bean:message key='label.common.icons.zoom'/>" src='/script-admin/imgs/zoom.gif'>
		</html:link>		
		<html:link action="/camps/create_campaign?method=edit_campaign" paramId="index" paramName="row_i" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.edit'/>" alt="<bean:message key='label.common.icons.edit'/>" src='/script-admin/imgs/edit.gif'>
		</html:link>		
		<html:link action="/camps/users?method=select_users" paramId="index" paramName="row_i" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.users'/>" alt="<bean:message key='label.common.icons.users'/>" src='/script-admin/imgs/users.gif'>
		</html:link>		
		<html:link action="/camps/show_campaigns?method=debug" paramId="index" paramName="row_i" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.debug'/>" alt="<bean:message key='label.common.icons.debug'/>" src='/script-admin/imgs/debug.gif'>
		</html:link>
		<html:link onclick="return confirm('${confirm}');" action="/camps/delete_campaign" paramId="index" paramName="row_i" paramProperty="idScript">
			<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
		</html:link>
		<html:link action="/camps/show_campaigns?method=clone" paramId="index" paramName="row_i" paramProperty="idScript">
			<img title="<bean:message key='label.common.icons.clone'/>" alt="<bean:message key='label.common.icons.clone'/>" src='/script-admin/imgs/clone.png'>
		</html:link>
	</display:column>	
</display:table>
</div></div>
<br><br>
<html:link action="/camps/create_campaign?method=create_campaign"><bean:message key="title.campaign.c_create"/></html:link>	

<% 
System.out.println("displaytag took..."); 
System.out.println(System.currentTimeMillis() - startTime +" ms."); 
%> 