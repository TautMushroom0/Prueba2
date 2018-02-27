<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.*"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TTextos"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TOpciones"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp"%>


<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%>
<fmt:bundle
	basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources">
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
	<table width="100%">
		<%-- Query Controls --%>
		<tr>
			<td align="center" width="70%" valign="top">

				<logic:iterate id="opcion" name="opcionesList" indexId="idOpc">
				<div class="table-responsive">
				<div class="dataTable_wrapper">
					<display:table class="table table-striped table-bordered table-hover"
						name="pageScope.opcion" defaultsort="1" id="row2"
						requestURI="/report/ResultQuestionFinal.do">
						<display:column title="Pregunta" property="texto" />
					</display:table>
					</div></div>
					<div class="table-responsive">
					<div class="dataTable_wrapper">
					<display:table class="table table-striped table-bordered table-hover"
						name="pageScope.opcion" id="row"
						requestURI="/report/ResultQuestionFinal.do">
						<display:column title="ID" property="idOpcion" sortable="true"
							comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator" />
						<display:column title="Posicion" sortable="true"
							property="posicion" />
						<display:column title="Opcion" sortable="true" property="opcion" />
						<display:column title="TOTAL" sortable="true"
							property="countRespuestas" />
					</display:table>
					</div></div>
					<br>
					<br>
				</logic:iterate>
			</td>



		</tr>

		<%-- Results --%>
		<tr>
			<td colspan="2" align="center">

			</td>
		</tr>

	</table>
	<br>
</html:form>