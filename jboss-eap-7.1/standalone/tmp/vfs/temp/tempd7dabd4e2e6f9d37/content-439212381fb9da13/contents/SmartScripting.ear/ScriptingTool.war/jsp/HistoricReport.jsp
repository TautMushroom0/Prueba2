<%@ page language="java"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<logic:present name="Report" property="headerBody">
	<h1><bean:message key="laber.report.historic.preferences"/></h1> 
	<bean:write name="Report" property="headerBody"/>
</logic:present>
<logic:iterate id="keys" name="Report" property="keySet">
	<h1><bean:write name="keys"/></h1>
		<display:table class="displayTagBorder" name="sessionScope.Report.tablePerAni.${keys}" sort="list" defaultsort="4" defaultorder="descending" id="${keys}" pagesize="10" requestURI="/HistoricReport.do">	
			<bean:define id="idCampaign">
				<bean:message key="label.report.historic.idScript"/>
			</bean:define>
			<display:column title="${idCampaign}" property="idScript" sortable="true" comparator="com.avaya.pso.co.script.web.utils.IntegerComparator"/>
			<bean:define id="campaign">
				<bean:message key="label.report.historic.script"/>
			</bean:define>
			<display:column title="${campaign}"  property = "nombreScript" sortable="true" />
			<bean:define id="finCodeName">
				<bean:message key="label.report.historic.code"/>
			</bean:define>
			<display:column title="${finCodeName}" property = "nombreCodigoFinalizacion" sortable="true" />
			<bean:define id="callStart">
				<bean:message key="label.report.historic.initDate"/>
			</bean:define>
			<display:column title="${callStart}" property = "inicio" sortable="true" />			
			<bean:define id="idAgent">
				<bean:message key="label.report.historic.idUser"/>
			</bean:define>
			<display:column title="${idAgent}" property = "idUsuario" sortable="true" />		
			<bean:define id="agentName">
				<bean:message key="label.report.historic.user"/>
			</bean:define>
			<display:column title="${agentName}" property = "usuario" sortable="false" />	
			<bean:define id="obs">
				<bean:message key="label.report.historic.observations"/>
			</bean:define>
			<display:column title="${obs}" property = "observaciones" sortable="false" />						
		</display:table>
</logic:iterate>
