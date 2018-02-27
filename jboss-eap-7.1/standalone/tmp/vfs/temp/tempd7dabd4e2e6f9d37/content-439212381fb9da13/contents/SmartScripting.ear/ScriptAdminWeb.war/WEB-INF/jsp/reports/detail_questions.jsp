<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TScript" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TLlamadas" %>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.DetailQuestionsForm" %>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.CreateCampaignForm" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TTextos" %>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="name" key="label.campaign.name" /> 
	<fmt:message var="select" key="label.common.select" /> 
	<fmt:message var="query" key="label.common.query" /> 
	<fmt:message var="end_code" key="label.end_code.id" /> 
	<fmt:message var="user" key="label.admin.user.name" /> 
	<fmt:message var="call_start" key="label.common.query" /> 
	<fmt:message var="calls_total" key="label.report.calls_total" /> 
	<fmt:message var="extern_id" key="label.campaign.id_cce" /> 	
	<fmt:message var="extern_id" key="label.campaign.id_cce" /> 	
	<fmt:message var="without_code" key="label.end_code.without" /> 
	<fmt:message var="text" key="label.text.text" />
	<fmt:message var="add" key="label.common.add" />
	<fmt:message var="type" key="label.text.type" />
	<fmt:message var="confirm" key="label.common.confirm_delete" />	
</fmt:bundle> 

<%
	DetailQuestionsForm rf = (DetailQuestionsForm)request.getSession().getAttribute("report_detail_questions");
%>

<html:form action="/report/DetailQuestions.do">
	<br>
	<input type='hidden' name='method'>
	<table width="100%">
		<%-- Query Controls --%>
		<tr>
			<td align="center" width="65%" valign="top">
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class="table table-striped table-bordered table-hover" name="sessionScope.report_detail_questions.campaigns" sort="list" defaultsort="1" defaultorder="descending" id="row" pagesize="7" requestURI="/report/DetailQuestions.do?campaign_next=true">
					<display:column title="ID" property="idScript" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
					<display:column title="${name}" sortable="true" property="nombre"/>
					<display:column title="${select}">
						<%
						TScript c = (TScript)row;

						String pId = c.getIdScript().toString();
						%>
						<html:radio name="report_detail_questions" property="selCampaign" value="<%=pId%>"/>
					</display:column>
				</display:table>
				</div></div>
			</td>
			<td align="center" valign="top" width="35%">
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
				<display:table export="true" class="table table-striped table-bordered table-hover" name="sessionScope.report_detail_questions.resultRows" sort="list" defaultsort="1" defaultorder="descending" id="row_r" pagesize="7" requestURI="/report/DetailQuestion.do?next=true">

					<%
						List rowInfo = (List)row_r;
						int size = rowInfo.size();
						
						Object[] user = (Object[])rowInfo.get(0);
						
						String uLabel = user[0]+" - "+user[1];
					%>
					<display:column title="${user}" sortable="true">
						<%=uLabel%>
					</display:column>
					<%
					for(int i=1;i<size-2;i++) {
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
					<display:setProperty name="export.excel.filename" value="detail_questions.xls"/>
					<display:setProperty name="export.csv.filename" value="detail_questions.csv"/>	
					<display:setProperty name="export.amount" value="list"/>	
				</display:table>
				</div></div>
				<%
				}
				%>
			</td>
		</tr>
		<tr>
		<td>
		<table>
			<tr>  
				<td align="center" width="100%">
					<div class="table-responsive">
					<div class="dataTable_wrapper">
					<display:table class='table table-striped table-bordered table-hover' name="sessionScope.report_detail_questions.texts" sort="list" defaultsort="1" id="row" defaultorder="descending" pagesize="15" requestURI="/camps/text_no_check.do?noAction=true">		
						<display:column title='ID' property="idTexto" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
						<display:column title='${text}' sortProperty="texto" sortable="true">
							<html:textarea name="row" style="width: 100%; height:100%;" property="texto" rows="2" readonly="true"/>
						</display:column>
						<display:column title='${type}' sortable="true">
							<%
								TTextos t=(TTextos)row;
								
								String type=rf.getTextType(t);
								if(type.compareTo("simple")==0) {
							%>
							<bean:message key='label.text.simple'/>
							<%
								} else if(type.compareTo("question")==0) {
							%>
							<bean:message key='label.text.question'/>
							<%
								} else if(type.compareTo("url")==0) {
							%>
							<bean:message key='label.text.url'/>
							<%
								}
							%>
						</display:column>
						<display:column title='${add}'>
							<%								
								TTextos t2=(TTextos)row;

								String pId=t2.getIdTexto().toString();
							%>
							<html:multibox property="selectedTexts" value="<%=pId%>"/>
						</display:column>
					</display:table>
					</div></div>					
				</td>
			</tr>
			<tr>
				<td align="right">
					<bean:message key='label.text.checkbox.select_all'/>&nbsp;
					<input type="checkbox" onclick="checkUncheckAll(this);" name="checkall">
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td width="100%" align="right">
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.add'/>" onclick="this.form.method.value='add';this.form.submit()"/>
					&nbsp;&nbsp;
					<input type='button' class="btn btn-primary" class="btn btn-primary" value="<bean:message key='label.common.delete'/>" onclick="this.form.method.value='delete';if(confirm('${confirm}')){this.form.submit();}"/>
				</td>
		    </tr>	
		    </table>				
		</td>
		</tr>

	</table>
	<br>
	
</html:form>