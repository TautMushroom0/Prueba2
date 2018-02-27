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
	<fmt:message var="campaign" key="label.report.campaign.name" /> 
	<fmt:message var="campId" key="label.report.campaign.id" /> 
	<fmt:message var="call_start" key="label.common.query" /> 
	<fmt:message var="calls_total" key="label.report.calls_total" /> 
	<fmt:message var="without_code" key="label.end_code.without" />
</fmt:bundle> 

<%
	TotalCallsForm rf = (TotalCallsForm)request.getSession().getAttribute("report_total");
%>

<html:form action="/report/TotalCalls.do">
	<br>
	<input type='hidden' name='method'>
	<table width="100%">
		<%-- Query Controls --%>
		<tr>

			<td align="left" valign="top" width="50%">
				<bean:message key='label.report.date.start'/> (YYYY-MM-DD): <br>
				<html:text styleId="startDate" property="SDate" onfocus="return showCalendar('startDate', 'yyyy-mm-dd');"/><br>
				<br>
				<bean:message key='label.report.date.end'/> (YYYY-MM-DD): <br>
				<html:text styleId="endDate" property="EDate" onfocus="return showCalendar('endDate', 'yyyy-mm-dd');"/>
				<br><br>
				<bean:message key='label.campaign.id_cce'/>: <br>
				<html:text property="idExterno"/>
				<br><br>
				<input type="submit" class="btn btn-primary" value='${query}' onclick="this.form.method.value='query_cmp_calls';">
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
				<display:table export="true" class="table table-striped table-bordered table-hover" name="sessionScope.report_total.resultRows" sort="list" defaultsort="1" defaultorder="descending" id="row_r" pagesize="7" requestURI="/report/TotalCalls.do">
					<%
						List rowInfo = (List)row_r;
						int size = rowInfo.size();
					%>
					<display:column title="${campId}" sortable="true">
						<%=(String)(rowInfo.get(0))%>
					</display:column>
					<display:column title="${campaign}" sortable="true">
						<%=(String)(rowInfo.get(1))%>
					</display:column>
					<%
					for(int i=2;i<size-2;i++) {
					%>
					<display:column title="<%=(String)columns.get(i)%>" sortable="true">
						<%=rowInfo.get(i)%>
					</display:column>
					<%}%>
					<display:column title="${without_code}" sortable="true">
						<%=rowInfo.get(size-2)%>					
					</display:column>
					<display:column title="${calls_total}" sortable="true">
						<%=rowInfo.get(size-1)%>					
					</display:column>
					<display:setProperty name="export.types" value="excel"/>	
					<display:setProperty name ="export.excel" value ="true"/>
					<display:setProperty name ="export.csv" value ="true"/>
					<display:setProperty name ="export.xml" value ="false"/>
					<display:setProperty name="export.excel.filename" value="campaignTotalCalls.xls"/>	
					<display:setProperty name="export.csv.filename" value="campaignTotalCalls.csv"/>	
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