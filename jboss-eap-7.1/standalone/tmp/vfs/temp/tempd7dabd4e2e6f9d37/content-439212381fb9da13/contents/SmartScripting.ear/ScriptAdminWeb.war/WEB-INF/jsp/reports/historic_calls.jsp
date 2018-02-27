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
<html:form action="/report/HistoricCalls.do" styleClass="form-inline" >

	<input type='hidden' name='action'>
	<br>
	<input type='hidden' name='method'>	
	<div class="col-md-3" align="center">
				<html:text styleClass="form-control" property="tel">
					<bean:message key="label.report.tel"/>
				</html:text>
				<br>
				<bean:message key="label.report.historic.tel" />
				<br>
		
	</div>
	<div class="col-md-4" align="center">
				<html:submit styleClass="btn btn-primary" onclick="this.form.action.value='add';">
					<bean:message key="label.report.lefttoright"/>
				</html:submit>
				<br>&nbsp<br>
				<html:submit styleClass="btn btn-primary" onclick="this.form.action.value='remove';">
					<bean:message key="label.report.righttoleft"/>
				</html:submit>
	</div>
	<div class="col-md-5" align="center">
				<html:select styleClass="htmlSelect" property="selectedItem" size="4" >
                <html:optionsCollection name="report_historic_calls" property="telList" />
            	</html:select>
            	<br>
				<bean:message key="label.report.historic.tels" />
	</div>
	<br>&nbsp<br>	
	<hr>
	<div class="col-md-12" align="center">
			<logic:present name="report_historic_calls" property="url">
					<bean:define id="urlParam" name="report_historic_calls" property="urlParameters"/>
					<bean:define id="urlText" name="report_historic_calls" property="url"/>
					<html:link name="urlParam" target="_blank" href="${urlText}">
						<bean:message key="label.report.historic.urlreport" />
					</html:link>			
				</logic:present>
				<logic:notPresent name="report_historic_calls" property="url">
					<bean:message key="label.report.historic.urlreportempty" />
				</logic:notPresent>
	</div>
	
	<br/>
	<hr>
	<br/>
	<div class="col-md-12" align="center">
		<div class="form-group">
			<div class="imput-group">
			<bean:message key="label.report.historic.idregext" />&nbsp;
			<html:text styleClass="form-control" property="idRegExt" maxlength="100"></html:text></td>
			<html:submit styleClass="btn btn-primary" onclick="this.form.action.value='idRegExt';">
			<bean:message key="label.report.historic.getlink" />
			</html:submit>
			</div>
		</div>
	</div>
	<br>&nbsp<br>
	<div class="col-md-12" align="center">
		<logic:present name="report_historic_calls" property="urlIdRegExt">
			<bean:define id="urlIdRegExt" name="report_historic_calls" property="urlIdRegExt"/>
			<html:link target="_blank" href="${urlIdRegExt}">
			<bean:message key="label.report.historic.urlreport" />
			</html:link>			
		</logic:present>
	</div>
<br>&nbsp<br>
</html:form>
