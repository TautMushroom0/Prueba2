<%@ page language="java"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

   
 <SCRIPT LANGUAGE="JAVASCRIPT"> 
	function list()
	{
		 document.getElementsByName('Category')[0].value = document.getElementsByName('selectedCategory')[0].value;
		 document.getElementsByName('Codfinally')[0].value = document.getElementsByName('selectedCodfin')[0].value;
		 document.getElementsByName('action')[0].value = "list";
	}
	
	function enviar(forma,action)
	{
		alert("david g"+action);
		forma.action = action;
 		forma.submit();
	}
	//0
</SCRIPT>


 
 <FORM action="/ScriptingTool/HistoricReportAgents.do">
  <input type='hidden' name='action' >
  	 <h1>
   		 <bean:message key="label.report.historicReportAgent.category"/>
         <html:select property="selectedCategory" name="Report" onchange="list();this.form.action.value='loadcategory';this.form.submit();">
			<html:option value="0"><bean:message key='label.text.choose'/></html:option>
			<html:optionsCollection property="quCategory" value="idCategoria" label="nombre" name="Report"/>
		 </html:select>
		 </h1>
		
		<h1>
	    <bean:message key="label.report.historicReportAgent.codfinal"/>
		<html:select property="selectedCodfin" name="Report" onchange="list()">
			<html:option value="0"><bean:message key='label.text.choose'/></html:option>
			<html:optionsCollection property="quCodFin" value="idCodFinalizacion" label="nombre" name="Report"/>
		 </html:select>
		</h1>
    
    <input type="submit" onclick="this.form.action.value='list'" value="<bean:message key='label.common.consult'/>">
  </FORM>


<logic:present name="Report" property="headerBody">
	<h1><bean:message key="laber.report.historic.preferences"/></h1> 
	<bean:write name="Report" property="headerBody"/>
</logic:present>
 

<input type='hidden' name='Category'>
<input type='hidden' name='Codfinally' >

<logic:iterate id="keys" name="Report" property="keySets">
	<h1>
	  <bean:message key="label.report.historic.user"/>:
		<bean:write name="keys"/>
	</h1>
		<display:table class="displayTagBorder" name="sessionScope.Report.tablePerLoguin.${keys}" sort="list" defaultsort="4" defaultorder="descending" id="${keys}" pagesize="10" requestURI="/HistoricReportAgents.do">	
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

