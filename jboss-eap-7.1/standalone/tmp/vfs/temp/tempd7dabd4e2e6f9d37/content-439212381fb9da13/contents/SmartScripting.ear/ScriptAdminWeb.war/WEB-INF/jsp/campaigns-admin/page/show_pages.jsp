<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="name" key="label.page.name" /> 
	<fmt:message var="actions" key="label.campaigns.actions" />
	<fmt:message var="description" key="label.variable.description" />
	<fmt:message var="confirm" key="label.common.confirm_delete" />
	<fmt:message var="category" key="label.end_code.category" />
</fmt:bundle>

<table border="0">
	<tr>
		<td class="textCell">
		<a href="/script-admin/camps/show_campaigns.do"><bean:message key='label.campaigns'/></a>
		</td>
	</tr>
</table>
<p><html:errors/></p>
<H1><bean:message key="label.page.pages"/></H1>

<div>
	<img src="/script-admin/imgs/elbow.gif">
	<bean:write name="scriptAdminForm" property="currentCampaign.nombre"/>
	<br><br>
</div>
<div class="table-responsive">
<div class="dataTable_wrapper">
<display:table class="table table-striped table-bordered table-hover" name="sessionScope.scriptAdminForm.currentCampaign.TPaginases" sort="list" defaultsort="1" id="row" pagesize="5" requestURI="/camps/show_pages.do?no_action=true">	
	<display:column title="ID" sortable="true" property="idPagina" sortProperty="idPagina" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
	<display:column title="${name}" sortable="true" property="nombre"/>
	<logic:equal name ="scriptAdminForm" property = "currentCampaign.activo" value = "0">	
		<display:column title="${actions}">
			<html:link action="/camps/paragraph?method=show" paramId="index" paramName="row" paramProperty="idPagina">
				<img src='/script-admin/imgs/zoom.gif' title="<bean:message key='label.common.icons.zoom'/>" alt="<bean:message key='label.common.icons.zoom'/>">
			</html:link>			
			<html:link action="/camps/create_page?method=edit_page" paramId="index" paramName="row" paramProperty="idPagina">
				<img src='/script-admin/imgs/edit.gif' title="<bean:message key='label.common.icons.edit'/>" alt="<bean:message key='label.common.icons.edit'/>">
			</html:link>			
			<html:link onclick="return confirm('${confirm}');" action="/camps/delete_page" paramId="index" paramName="row" paramProperty="idPagina">
				<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
			</html:link>
		</display:column>		
	</logic:equal>				
</display:table>
</div></div>		

<h1><bean:message key="label.page.variables"/></h1>
<logic:notEmpty name="scriptAdminForm" property="currentCampaign.TVariableses">		
	<div class="table-responsive">
	<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.currentCampaign.TVariableses" sort="list" defaultsort="1" id="row_v" pagesize="5" requestURI="/camps/show_pages.do?no_action=true">
		<display:column title='ID' property="idVariable" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
		<display:column title='${name}' property="nombre" sortable="true"/>
		<display:column title='${description}' property="descripcion" sortable="true"/>
		<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">	
			<display:column title='${actions}'>
				<html:link action="/camps/variable_no_check?method=edit_variable" paramId="index" paramName="row_v" paramProperty="idVariable">
					<img src='/script-admin/imgs/edit.gif' title="<bean:message key='label.common.icons.edit'/>" alt="<bean:message key='label.common.icons.edit'/>">
				</html:link>					
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_variable" paramId="index" paramName="row_v" paramProperty="idVariable">
					<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
				</html:link>
			</display:column>
		</logic:equal>					
	</display:table>	
	</div></div>	
</logic:notEmpty>

<logic:empty name="scriptAdminForm" property="currentCampaign.TVariableses">
	<p><h2><bean:message key="label.page.no_vars_set" /></h2></p>
</logic:empty>	

<h1><bean:message key="label.page.ending_codes"/></h1>
<logic:notEmpty name="scriptAdminForm" property="currentCampaign.TCodFinalizacions">
	<div class="table-responsive">
	<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.currentCampaign.TCodFinalizacions" sort="list" defaultsort="1" id="row_c" pagesize="5" requestURI="/camps/show_pages.do?no_action=true">
		<display:column title='ID' property="idCodFinalizacion" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
		<display:column title='${name}' property="nombre" sortable="true"/>
		<display:column title='${description}' property="descripcion" sortable="true"/>
		<display:column title='${category}' property="TCategoria.nombre"/>
		<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">	
			<display:column title='${actions}'>
				<html:link action="/camps/end_cod_no_check?method=edit_end_cod" paramId="index" paramName="row_c" paramProperty="idCodFinalizacion">
					<img src='/script-admin/imgs/edit.gif' title="<bean:message key='label.common.icons.edit'/>" alt="<bean:message key='label.common.icons.edit'/>">
				</html:link>					
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_end_cod?method=delete" paramId="index" paramName="row_c" paramProperty="idCodFinalizacion">
					<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
				</html:link>
			</display:column>
		</logic:equal>					
	</display:table>	
	</div></div>	
</logic:notEmpty>

<logic:empty name="scriptAdminForm" property="currentCampaign.TCodFinalizacions">
	<p><h2><bean:message key="label.page.no_end_cod" /></h2></p>
</logic:empty>	

<!-- New for categories -->
<h1><bean:message key="label.page.categories"/></h1>
<logic:notEmpty name="scriptAdminForm" property="currentCampaign.TCategorias">
	<div class="table-responsive">
	<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.currentCampaign.TCategorias" sort="list" defaultsort="1" id="row_cat" pagesize="5" requestURI="/camps/show_pages.do?no_action=true">
		<display:column title='ID' property="idCategoria" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
		<display:column title='${name}' property="nombre" sortable="true"/>
		<display:column title='${description}' property="descripcion" sortable="true"/>
		<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">	
			<display:column title='${actions}'>
				<html:link action="/camps/category?method=edit_category" paramId="index" paramName="row_cat" paramProperty="idCategoria">
					<img src='/script-admin/imgs/edit.gif' title="<bean:message key='label.common.icons.edit'/>" alt="<bean:message key='label.common.icons.edit'/>">
				</html:link>					
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_category?method=delete" paramId="index" paramName="row_cat" paramProperty="idCategoria">
					<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
				</html:link>
			</display:column>
		</logic:equal>					
	</display:table>
	</div>
	</div>		
</logic:notEmpty>

<logic:empty name="scriptAdminForm" property="currentCampaign.TCategorias">
	<p><h2><bean:message key="label.page.no_categories" /></h2></p>
</logic:empty>	



<br>
<logic:equal name ="scriptAdminForm" property="currentCampaign.activo" value="0">
	<!--  Create new page -->
	<html:link action="/camps/create_page?method=create_page" paramId="campId" paramName="scriptAdminForm" paramProperty="currentCampaign.idScript">
		<bean:message key="label.page.create_new"/>
	</html:link>		
	&nbsp;|&nbsp;
	<!--  Create new variable -->	
	<html:link action="/camps/variable_no_check?method=create_variable" >
		<bean:message key ="label.page.create_new_var"/>
	</html:link>		
	&nbsp;|&nbsp;
	<!--  Create new ending code -->	
	<html:link action="/camps/end_cod_no_check?method=create_ending_code" >
		<bean:message key ="label.page.create_new_end_cod"/>
	</html:link>
	&nbsp;|&nbsp;
	<!--  Create new category -->	
	<html:link action="/camps/create_category?method=create_category" >
		<bean:message key ="label.page.create_category"/>
	</html:link>		
</logic:equal>