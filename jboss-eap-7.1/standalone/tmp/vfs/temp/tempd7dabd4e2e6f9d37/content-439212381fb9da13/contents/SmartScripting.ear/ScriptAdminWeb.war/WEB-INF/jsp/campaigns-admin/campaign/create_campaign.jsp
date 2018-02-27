<%@ page import="com.avaya.pso.co.script.hibernate.beans.TVariables" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TPaginas" %>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.ScriptAdminForm" %>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.CreateCampaignForm" %>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="name" key="label.page.name" /> 
	<fmt:message var="select" key="label.common.select" /> 
	<fmt:message var="yes" key="label.common.yes" /> 
	<fmt:message var="no" key="label.common.no" />
	<fmt:message var="actions" key="label.campaigns.actions" />
	<fmt:message var="description" key="label.variable.description" />
</fmt:bundle> 

<%
CreateCampaignForm ccfJsp = (CreateCampaignForm)request.getSession().getAttribute("createCampaignForm");
%>

<html:link action="/camps/show_campaigns"><bean:message key="label.campaign.back"/>.</html:link>
<br><br><br>
<html:form action="/camps/create_campaign_result">	

	<input type='hidden' name='method'>
	<table cellpadding="0" cellspacing="0" border="0" > 	
		<tr>
			<td align='right'><bean:message key="label.campaign.name"/>*:&nbsp;&nbsp;&nbsp;</td> 
			<td><html:text styleClass="textImput" name='createCampaignForm' property="campaign.nombre"/></td>
			<td>&nbsp;<html:errors property="campaign.nombre"/></td>
		</tr>
		<tr>					
			<td colspan="2"><br></td>
		</tr>			
		<tr>
			<td align='right'><bean:message key="label.campaign.description"/>:&nbsp;&nbsp;&nbsp;</td> 
			<td><html:text styleClass="textImput" name='createCampaignForm' property="campaign.descripcion"/></td>
			<td>&nbsp;<html:errors property="campaign.descrip"/></td>
		</tr>		
		<tr>					
			<td colspan="2"><br></td>
		</tr>			
		<tr>
			<td align='right'><bean:message key="label.campaign.title"/>:&nbsp;&nbsp;&nbsp;</td>
			<td><html:text styleClass="textImput" name='createCampaignForm' property="campaign.titulo"/></td>
			<td>&nbsp;<html:errors property="campaign.titulo"/></td>		
		</tr>
		<tr>					
			<td colspan="2"><br></td>
		</tr>			
		<tr>
			<td align='right'><bean:message key="label.campaign.id_cce"/>:&nbsp;&nbsp;&nbsp;</td>
			<td><html:text styleClass="textImput" name='createCampaignForm' property="campaign.idExterno"/></td>
			<td>&nbsp;<html:errors property="campaign.idext"/></td>		
		</tr>
		<tr>					
			<td colspan="2"><br></td>
		</tr>			
		<tr>
			<td align='right'><bean:message key="label.campaign.observations"/>:&nbsp;&nbsp;&nbsp;</td>
			<td>
				<html:select styleClass="btn-xs" property="obs">	
					<html:option value="0"><bean:message key='label.common.yes'/></html:option>   
					<html:option value="1"><bean:message key='label.common.no'/></html:option>   
				</html:select>
			</td>		
		</tr>
		<tr>					
			<td colspan="2"><br></td>
		</tr>
		<tr style="display: block">
			<td align='right'><bean:message key="label.campaign.sockets_integrations"/>:&nbsp;&nbsp;&nbsp;</td>
			<td>
				<html:select styleClass="btn-xs" property="intsocket" onchange="Block(this,'tablavariables')">	
					<html:option value="0"><bean:message key='label.common.yes'/></html:option>   
					<html:option value="1"><bean:message key='label.common.no'/></html:option>   
				</html:select>
			</td>		
		</tr>
		<tr>					
			<td colspan="2"><br></td>
	    </tr>
		<tr>
			<td colspan="2"><br></td>
		</tr>			
		<logic:empty name='createCampaignForm' property="campaign.idScript">
		<tr>
			<td></td>
			<td>
				<input type="submit" class="btn btn-primary"  value="<bean:message key='label.common.create'/>" onClick="this.form.method.value='save_campaign';"/>
			</td>
		</tr>		
		</logic:empty>
		<logic:notEmpty name='createCampaignForm' property="campaign.idScript">
		<tr>
			<td align='right'><bean:message key="label.campaign.start_page"/>:&nbsp;&nbsp;&nbsp;</td>
			<td colspan="2" align="left">
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class='table table-striped table-bordered table-hover' name="sessionScope.createCampaignForm.campaign.TPaginases" sort="list" defaultsort="1" id="row" pagesize="10" requestURI="/camps/create_campaign_result.do">		
					<display:column title='ID' property="idPagina" sortable="true"/>
					<display:column title='${name}' property="nombre" sortable="true"/>
					<display:column title='${select}'>
						<%
							TPaginas p = (TPaginas)row;
							String pId = p.getIdPagina().toString();
						%>
						<html:radio name="createCampaignForm" property="campaign.paginaInicial" value='<%=pId%>'/>
					</display:column>
				</display:table>	
				</div></div>			
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		 <tr>
		    <td colspan="2">
		    <logic:equal name='createCampaignForm' property="intsocket" value="0">
		    	<div id='tablavariables' style="display:block">
		    </logic:equal>
		    
		    <logic:equal name='createCampaignForm' property="intsocket" value="1">
		    	<div id='tablavariables' style="display:none;">
		    </logic:equal>
			<table border="0">
				<tr>
					<td colspan = "2">
						<h1><bean:message key="label.page.variables"/></h1>
						<logic:notEmpty name="createCampaignForm" property="campaign.TVariableses">		
							<div class="table-responsive">
							<div class="dataTable_wrapper">
							<display:table class='table table-striped table-bordered table-hover' name="sessionScope.createCampaignForm.campaign.TVariableses" sort="list" defaultsort="1" id="row_v" pagesize="5" requestURI="/camps/create_campaign_result.do">
								<display:column title='ID' property="idVariable" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
								<display:column title='${name}' property="nombre" sortable="true"/>
								<display:column title='${select}' >
									<%
										TVariables v = (TVariables)row_v;
										String vId = v.getIdVariable().toString();
										boolean checked = false;
										if(v.getSendSocket().booleanValue())checked=true;
									%>
									<input type="checkbox" name="check<%=vId%>" id="check<%=vId%>" <%=checked?"checked":"" %>>
								</display:column>
							</display:table>
							</div></div>	
						</logic:notEmpty>
						<logic:empty name="createCampaignForm" property="campaign.TVariableses">
							<p><h2><bean:message key="label.page.no_vars_socket" /></h2></p>
						</logic:empty>
					</td>
				</tr>
				<tr>					
					<td colspan="2"><br></td>
				</tr>
				<tr>
					<td align='right'><bean:message key="label.campaign.sockets_port"/>:&nbsp;&nbsp;&nbsp;</td>
					<td><html:text styleClass="textImput" name='createCampaignForm' property="campaign.portSocket"/></td>
					<td>&nbsp;<html:errors property="campaign.titulo"/></td>		
				</tr>
				<tr>				
					<td colspan="2"><br></td>
				</tr>
				<tr>
					<td align='right'><bean:message key="label.campaign.sockets_host"/>:&nbsp;&nbsp;&nbsp;</td>
					<td><html:text styleClass="textImput" name='createCampaignForm' property="campaign.hostSocket"/></td>
					<td>&nbsp;<html:errors property="campaign.titulo"/></td>		
				</tr>
			</table>
			</div>
			
			</td>
		</tr>
		<tr>
		    <td></td>
			<td>
				<input type="submit" class="btn btn-primary" value="<bean:message key='label.common.modify'/>" onClick="this.form.method.value='save_campaign';"/>
			</td>
		</tr>					
		</logic:notEmpty>
	</table>
</html:form>