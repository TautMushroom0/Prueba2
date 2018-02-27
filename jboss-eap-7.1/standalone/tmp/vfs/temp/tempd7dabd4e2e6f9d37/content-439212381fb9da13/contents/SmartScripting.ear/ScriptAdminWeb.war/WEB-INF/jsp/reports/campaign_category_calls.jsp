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

<%
	CampaignReportForm rf = (CampaignReportForm)request.getSession().getAttribute("report_campaign");
%>

<html:form action="/report/CampaignByCategory.do">
	<br>
	<input type='hidden' name='method'>
	<table width="100%">
		<%-- Query Controls --%>
		<tr>
			<td align="center" width="60%" valign="top">
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class="table table-striped table-bordered table-hover" name="sessionScope.report_campaign.campaigns" sort="list" defaultsort="1" defaultorder="descending" id="row" pagesize="7" requestURI="/report/CampaignByCategory.do">
					<display:column title="ID" property="idScript" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
					<display:column title="${name}" sortable="true" property="nombre"/>
					<display:column title="${select}">
						<%
						TScript c = (TScript)row;

						String pId = c.getIdScript().toString();
						%>
						<html:radio name="report_campaign" property="selCampaign" value="<%=pId%>"/>
					</display:column>
				</display:table>
				</div></div>
			</td>
			<td align="center" valign="top" width="40%">
				<bean:message key='label.report.date.start'/> (YYYY-MM-DD): <br>
				<html:text styleId="startDate" property="SDate" onfocus="return showCalendar('startDate', 'yyyy-mm-dd');"/><br>
				<br>
				<bean:message key='label.report.date.end'/> (YYYY-MM-DD): <br>
				<html:text styleId="endDate" property="EDate" onfocus="return showCalendar('endDate', 'yyyy-mm-dd');"/>
				<br><br>
				<bean:message key='label.campaign.id_cce'/>: <br>
				<html:text property="idExterno"/>
				<br><br>
				<input class="btn btn-primary" type="submit" value='${query}' onclick="this.form.method.value='query_cmp_calls';">
			</td>
		</tr>
		<tr>
			<td colspan="2"><br><br><br></td>
		</tr>			
		<%-- Results --%>
		<tr>
			<td colspan="2" align="center">
				
				<%
				if(rf.getResultColumns()!=null && rf.getResultRows()!=null && rf.getResultRows().size()>0) {
					List columns = rf.getResultColumns();				
				%>	
				<div class="table-responsive">
				<div class="dataTable_wrapper">			
				<display:table export="true" class="table table-striped table-bordered table-hover" name="sessionScope.report_campaign.resultRows" sort="list" defaultsort="1" defaultorder="descending" id="row_r" pagesize="7" requestURI="/report/CampaignByCategory.do">
					<%
						List rowInfo = (List)row_r;
						int size = rowInfo.size();
					%>
					<display:column title="${userId}" sortable="true">
						<%=(String)(rowInfo.get(0))%>
					</display:column>
					<display:column title="${user}" sortable="true">
						<%=(String)(rowInfo.get(1))%>
					</display:column>
					<%
					for(int i=2;i<size-2;i++) {
					%>
					<display:column title="<%=(String)columns.get(i)%>" sortable="true">
						<%=rowInfo.get(i)%>
					</display:column>
					<%}%>
					<display:column title="${calls_total}" sortable="true">
						<%=rowInfo.get(size-1)%>					
					</display:column>
					<display:setProperty name="export.types" value="excel"/>	
					<display:setProperty name ="export.excel" value ="true"/>
					<display:setProperty name ="export.csv" value ="true"/>
					<display:setProperty name ="export.xml" value ="false"/>
					<display:setProperty name="export.excel.filename" value="reportQuestion.xls"/>	
					<display:setProperty name="export.csv.filename" value="reportQuestion.csv"/>	
					<display:setProperty name="export.amount" value="list"/>										
				</display:table>
				</div></div>
				<%
				}
				%>

			</td>
		</tr>
		
	</table>
	<br>
	
</html:form>