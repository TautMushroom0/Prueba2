<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.*" %>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TTextos"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TLlamadas"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TScript"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TOpciones"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TTipos"%>
<%@page import="java.sql.Timestamp"%>
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

<script type="text/javascript">
function mostrar(aux){
	if(document.getElementById('todos').checked == true){
		for(h=1;h<aux;h++){	
			document.getElementById(h).checked= true;
		}	
	}else{
		for(h=1;h<aux;h++){	
			document.getElementById(h).checked= false;
		}
	}	
}
</script>

<html:form action="/report/ResultQuestionFinal.do">
	<br>
	<input type='hidden' name='method'>
	<table width="100%">
		<%-- Query Controls --%>
		<%int i=1; %>
		<tr>
			<td align="center" width="70%" valign="top">
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class="table table-striped table-bordered table-hover" name="sessionScope.report_result_question.textosMostrar" sort="list" defaultsort="1" defaultorder="descending" id="row" pagesize="7" requestURI="/report/ResultQuestionFinal.do">
					<display:column title="ID" property="idTexto" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
					<display:column title="TEXTO" sortable="true" property="texto"/>
					<display:column title="AGREGAR">
						<%
						TTextos c = (TTextos)row;

						String pId = c.getIdTexto().toString();
						%>
						<%String iaux = ""+i; %>
						<input type="checkbox" id="<%=iaux%>"  name="<%="opc"+iaux%>" value="<%=pId%>">
						<input type="hidden" name="iaux" value="<%=iaux%>">
						<%i++; %>
						
					</display:column>
				</display:table>
				</div></div>
			</td>
			<%ResultQuestionForm form = (ResultQuestionForm)request.getSession().getAttribute("report_result_question");
			if(form.getTextosMostrar().size() > 0){ %>
				<td align="center" width="30%">
					<bean:message key="label.report.date.SeleccionaTodos"/>:
					<input type="checkbox" onclick="mostrar('<%=i%>');" id="todos">		
					
					<br><br><br>			   
				    	<input type="submit" class="btn btn-primary" value="Consultar" onclick="this.form.method.value='resultfinal';"/><br>
				    
		       </td>
		   <%} %>    
			
		</tr>
					
		<%-- Results --%>
		<tr>
			<td colspan="2" align="center">
				<logic:present name="errorCheck" scope="session">
					<bean:message key="label.report.date.errorSeleccionaTodos"/>
				</logic:present>	
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
					<%
					
					List datos2 = (List)request.getSession().getAttribute("resList"); 
					if(datos2.size() > 0){
					%>
					<div class="table-responsive">
					<div class="dataTable_wrapper">
							<display:table export="true" class="table table-striped table-bordered table-hover" name="sessionScope.resList" defaultsort="1" defaultorder="descending" id="row_r2" pagesize="7" requestURI="/report/ResultQuestionFinal.do?report_next=true">
								<%if(row_r2 != null){
									Object obj[] = (Object[])row_r2;									
								%>
								<display:column title="id Llamada" sortable="true">
										<%=(Long)obj[0] %>
									</display:column>
									<display:column title="Nombre Script" sortable="true">
										<%=(String)obj[1] %>
									</display:column>
									<display:column title="id Pregunta" sortable="true">
										<%=(Integer)obj[2] %>
									</display:column>
									<display:column title="Pregunta" sortable="true">
										<%=(String)obj[3] %>
									</display:column>
									<display:column title="Respuesta" sortable="true">
										<%=(String)obj[4] %>
									</display:column>
									<display:column title="Tipo Preg" sortable="true">
										<%=(String)obj[5] %>
									</display:column>
									<display:column title="Agente" sortable="true">
										<%if(obj[6] != null){%>
											<%=(String)obj[6]%>
										<%}%>										
									</display:column>
									<display:column title="Observacion" sortable="true">
										<%if(obj[7] == null || obj[7].equals("null")){ %>
											Ninguna
										<%}else{ %>	
										<%=(String)obj[7] %>
										<%} %>
									</display:column>
									<display:column title="Hora Inicio" sortable="true">
										<%=(Timestamp)obj[8]%>
									</display:column>
									<display:column title="Hora Fin" sortable="true">
										<%=""+(Timestamp)obj[9] %>
									</display:column>
							
								<display:setProperty name="export.types" value="excel"/>	
								<display:setProperty name ="export.excel" value ="true"/>
								<display:setProperty name ="export.csv" value ="true"/>
								<display:setProperty name ="export.xml" value ="false"/>
								<display:setProperty name="export.excel.filename" value="resultQuestion.xls"/>	
								<display:setProperty name="export.csv.filename" value="resultQuestion.csv"/>	
								<display:setProperty name="export.amount" value="list"/>	
							<%} %>
							</display:table>
							<div class="table-responsive">
							<div class="dataTable_wrapper">						
							<%} %>
			</td>
		</tr>
	</table>
	<br>
</html:form>