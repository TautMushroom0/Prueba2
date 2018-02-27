<%@ include file="/WEB-INF/jsp/common/init.jsp" %>
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.ScriptAdminForm"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TPaginas"%>
<%@ page import="org.apache.struts.util.MessageResources" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TCodFinalizacion" %>

<html:link action="/camps/text_details_no_check?method=view_no_reload" paramId="index" paramName="scriptAdminForm" paramProperty="curText.idTexto"><bean:message key="label.text_detail.back"/></html:link>
<br><br><br>

<html:form action="/camps/options">		
	<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
	<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
		<fmt:message var="name" key="label.page.name" />
		<fmt:message var="description" key="label.campaign.description" />
		<fmt:message var="select" key="label.common.select" />
	</fmt:bundle>
	<%
	ScriptAdminForm safJsp = (ScriptAdminForm)request.getSession().getAttribute("scriptAdminForm");
	%>
	<table>
		<tr><td colspan="2"><html:errors/></td></tr>
		<tr><td colspan="2"></td></tr>
		<tr>
			<td><bean:message key="label.option.option_string"/>:&nbsp;&nbsp;</td> 
			<td><html:text styleClass="textImput" name="scriptAdminForm" property="curOption.opcion"/></td>
		</tr>
		<c:if test="<%=safJsp.getPhase()==0%>">
		<tr><td colspan="2"></td></tr>
		<tr>	
			<td></td>
			<td>
				<input type='hidden' name='no_action' value="true">
				<input type='submit' value="<bean:message key='label.common.next'/>" />
			</td>
		</tr>		
		</c:if>
		<tr><td colspan="2"></td></tr>
		<c:if test="<%=safJsp.getPhase()==1%>">
		<tr>
			<td><bean:message key="label.option.next_page"/>:&nbsp;&nbsp;</td>
			<td><input type='hidden' name='sel_page'>
			<bean:define id="sel_page" name='scriptAdminForm' scope="session" property="selPage"/>
			<div class="table-responsive">
			<div class="dataTable_wrapper">
			<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.currentCampaign.TPaginases" sort="list" defaultsort="1" id="row" pagesize="5" requestURI="/camps/options.do?no_action=true">		
				<display:column title='ID' property="idPagina" sortable="true"/>
				<display:column title='${name}' property="nombre" sortable="true"/>
				<display:column title='${select}'>
					<%
						TPaginas p = (TPaginas)row;

						String pId = p.getIdPagina().toString();
					%>
					<c:set var="sel_page" value="<%=pId%>"/>
					<html:radio onclick="this.form.method.value='change_page';this.form.sel_page.value='${sel_page}';this.form.submit();"  
					property="selPage" value='<%=pId%>'/>
				</display:column>
			</display:table>
			</div></div>
			</td>
		</tr>
		<c:if test='<%=safJsp.getSelPage()!=0%>'> 
			<tr><td colspan="2"><br></td></tr>
			<tr>
				<td><bean:message key="label.option.selected_page"/>:</td>
				<td><bean:write name="scriptAdminForm" property="pageLabel"/></td>
			</tr>				
		</c:if>
		<tr><td colspan="2"><br></td></tr>
		<tr>
			<td><bean:message key="label.option.end_code"/>:&nbsp;&nbsp;</td>
			<td><input type='hidden' name='sel_code'>
			<bean:define id="sel_code" name='scriptAdminForm' scope="session" property="selEndCode"/>
			<div class="table-responsive">
			<div class="dataTable_wrapper">
			<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.currentCampaign.TCodFinalizacions" sort="list" defaultsort="1" id="row_c" pagesize="5" requestURI="/camps/options.do?no_action=true">		
				<display:column title='ID' property="idCodFinalizacion" sortable="true"/>
				<display:column title='${name}' property="nombre" sortable="true"/>
				<display:column title='${description}' property="descripcion" sortable="true"/>
				<display:column title='${select}'>
					<%
						TCodFinalizacion c = (TCodFinalizacion)row_c;
						
						String cId = c.getIdCodFinalizacion().toString();
					%>
					<c:set var="sel_code" value="<%=cId%>"/>
					<html:radio onclick="this.form.method.value='change_code';this.form.sel_code.value='${sel_code}';this.form.submit();" 
					property="selEndCode" value='<%=cId%>'/>
				</display:column>
			</display:table>
			</div>
			</div>
			</td>
		</tr>		
		<c:if test='<%=safJsp.getSelEndCode()!=0%>'> 
			<tr><td colspan="2"><br></td></tr>
			<tr>
				<td><bean:message key="label.option.selected_code"/>:</td>
				<td><bean:write name="scriptAdminForm" property="endCodeLabel"/></td>
			</tr>				
		</c:if>
		<tr><td colspan="2"><br></td></tr>
		<tr>	
			<td><bean:message key="label.option.position"/>:&nbsp;&nbsp;</td> 
			<td><html:text name="scriptAdminForm" property="curOption.posicion"/></td>
		</tr>
		<tr><td colspan="2"></td></tr>
		<tr>	
			<td><input type='hidden' name='method'></td> 
			<td>
				<logic:notEmpty name="scriptAdminForm" property="curOption.idOpcion">
				<input type='button'  class="btn btn-primary"
					value="<bean:message key='label.common.modify'/>"
					onClick="this.form.method.value='create';this.form.submit();"/>
				</logic:notEmpty>
				<logic:empty name="scriptAdminForm" property="curOption.idOpcion">
				<input type='button' class="btn btn-primary"
					value="<bean:message key='label.common.add'/>"
					onClick="this.form.method.value='create';this.form.submit();"/>
				</logic:empty>				
			</td>
		</tr>
		</c:if>
	</table>		
</html:form>


		
