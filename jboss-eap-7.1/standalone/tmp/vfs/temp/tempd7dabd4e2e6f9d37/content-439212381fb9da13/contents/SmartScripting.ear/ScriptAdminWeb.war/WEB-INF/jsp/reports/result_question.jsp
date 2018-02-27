<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TScript" %>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.*" %>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>
  

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="name" key="label.campaign.name" /> 
	<fmt:message var="select" key="label.common.select" /> 
	<fmt:message var="query" key="label.common.query" /> 
	<fmt:message var="end_code" key="label.end_code.id" /> 
	<fmt:message var="user" key="label.admin.user.name" /> 
	<fmt:message var="userId" key="label.admin.user.user_id" /> 
	<fmt:message var="call_start" key="label.common.query" /> 
	<fmt:message var="calls_total" key="label.report.calls_total" /> 
	<fmt:message var="without_code" key="label.end_code.without" />
</fmt:bundle> 

<html:form action="/report/ResultQuestionFinal.do">
	<br>
	<input type='hidden' name='method'>
	<table width="100%" border="0">
		<%-- Query Controls --%>
		<tr>
			<td align="center" width="60%" valign="top">
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class="table table-striped table-bordered table-hover" name="sessionScope.report_result_question.campaigns" sort="list" defaultsort="1" defaultorder="descending" id="row" pagesize="7" requestURI="/report/ResultQuestionFinal.do">
					<display:column title="ID" property="idScript" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
					<display:column title="${name}" sortable="true" property="nombre"/>
					<display:column title="${select}">
						<%
						TScript c = (TScript)row;

						String pId = c.getIdScript().toString();
						%>
						<html:radio name="report_result_question" property="selCampaign" value="<%=pId%>"/>
					</display:column>
				</display:table>
				</div></div>
			</td>			
			<td align="center" valign="top" width="40%">
				<bean:message key="label.text.question_type"/>:
					<br><br>
					<html:select styleClass="btn-xs" property="tipoPregunta">
								<html:option value="-- Choose --"><bean:message key='label.text.choose'/></html:option>
								<html:optionsCollection property="tipos" value="idTipo" label="descripcion"/>
					</html:select>
				<br><br>
				<bean:message key='label.report.date.start'/> (YYYY-MM-DD): <br>
				<html:text styleId="startDate" property="SDate" onfocus="return showCalendar('startDate', 'yyyy-mm-dd');"/><br>
				<br>
				<bean:message key='label.report.date.end'/> (YYYY-MM-DD): <br>
				<html:text styleId="endDate" property="EDate" onfocus="return showCalendar('endDate', 'yyyy-mm-dd');"/>
				<br><br><br>
			    <input type="submit" class="btn btn-primary" value="Consultar" onclick="this.form.method.value='resultreport_question';"/><br>
				</td>
		</tr>
		<tr>
			<td>
				<logic:present name="errorCampaign" scope="session"> 
				<bean:message key="label.report.date.errorCampaign"/>
				</logic:present>
			</td>
		</tr>			
		<%-- Results --%>
		
		
	</table>
	<br>
</html:form>