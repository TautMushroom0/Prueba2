<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.ScriptAdminForm" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TVariables" %>
<%@ page import="java.util.Iterator" %>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %> 

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="name" key="label.campaign.name" /> 
	<fmt:message var="select" key="label.common.select" /> 
	<fmt:message var="description" key="label.variable.description" /> 
</fmt:bundle> 

<html:link action="/camps/text_details_no_check?method=view_no_reload" paramId="index" paramName="scriptAdminForm" paramProperty="curText.idTexto"><bean:message key="label.text_detail.back"/></html:link>
<br><br><br>

<%
	ScriptAdminForm saf = (ScriptAdminForm)request.getSession().getAttribute("scriptAdminForm");
	
	Iterator it = saf.getCurrentCampaign().getTVariableses().iterator();
	
	while(it.hasNext()) {
		TVariables v = (TVariables)it.next();
		
		System.out.println(v.getNombre());
	}
%>

<html:form action="/camps/text_details?method=save_parameter">	
	<table>
		<tr>   
			<td><bean:message key="label.parameter.parameter"/>:</td>
			<td><html:text styleClass="textImput" name="scriptAdminForm" property="curPrm.parametro"/>
			&nbsp;<html:errors property="parameter.name"/></td>			
		</tr>				
		<tr>   
			<td><bean:message key="label.parameter.value"/>:</td>
			<td><html:text styleClass="textImput" name="scriptAdminForm" property="curPrm.value"/>
			&nbsp;<html:errors property="parameter.value"/></td>	
		</tr>				
		<tr><td><br></td></tr>
		<tr>   
			<td><bean:message key="label.parameter.map_variable"/>:</td>
			<td>
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class="table table-striped table-bordered table-hover" name="sessionScope.scriptAdminForm.currentCampaign.TVariableses" sort="list" defaultsort="1" defaultorder="descending" id="row" pagesize="7" requestURI="/camps/text_details?method=no_action">
					<display:column title="ID" property="idVariable" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
					<display:column title="${name}" sortable="true" property="nombre"/>
					<display:column title="${description}" sortable="true" property="descripcion"/>
					<display:column title="${select}">
						<%
							TVariables v = (TVariables)row;
	
							String pId = v.getIdVariable().toString();
						%>
						<html:radio name="scriptAdminForm" property="selVariable" value="<%=pId%>"/>
					</display:column>
				</display:table>
				</div></div>
			</td>
		</tr>				
		<tr><td/></tr>
		<tr>
			<td/>
			<td>
				<input type='hidden' name='index' value=<%=saf.getCurURL().getIdTexto().intValue()%>>
				<logic:empty name="scriptAdminForm" property="curPrm.idParametro">
					<input type='submit' value="<bean:message key='label.common.create'/>" onClick=""/>
				</logic:empty>
				<logic:notEmpty name="scriptAdminForm" property="curPrm.idParametro">
					<input type='submit' value="<bean:message key='label.common.modify'/>" onClick=""/>
				</logic:notEmpty>	
			</td>
		</tr>
	</table>
</html:form>
