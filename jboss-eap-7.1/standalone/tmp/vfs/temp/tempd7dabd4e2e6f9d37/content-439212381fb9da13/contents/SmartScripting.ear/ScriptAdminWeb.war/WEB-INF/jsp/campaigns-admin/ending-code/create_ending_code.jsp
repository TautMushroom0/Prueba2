<%@ page import="com.avaya.pso.co.script.hibernate.beans.TPaginas"%>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TCategoria"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp"%>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%>
<fmt:bundle
	basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources">
	<fmt:message var="name" key="label.page.name" />
	<fmt:message var="select" key="label.common.select" />
</fmt:bundle>

<html:link action="/camps/show_pages" paramId="index"
	paramName="scriptAdminForm" paramProperty="currentCampaign.idScript">
	<bean:message key="label.page.back" />.</html:link>
<br>
<br>
<br>
<html:form action="/camps/end_cod">
	<input type='hidden' name='method'>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align='right'>
				<bean:message key="label.campaign.name" />
				*:&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<html:text styleClass="textImput" name='createCampaignForm'
					property="endCode.nombre" />
			</td>
			<td>
				&nbsp;
				<html:errors property="endCode.nombre" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<br>
			</td>
		</tr>
		<tr>
			<td align='right'>
				<bean:message key="label.campaign.description" />
				:&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<html:text styleClass="textImput" name='createCampaignForm'
					property="endCode.descripcion" />
			</td>
			<td>
				&nbsp;
				<html:errors property="endCode.descrip" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<br>
			</td>
		</tr>
		<tr>
			<td align='right'>
				<bean:message key="label.campaign.end_ext_cod" />
				:&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				<html:text styleClass="textImput" name='createCampaignForm'
					property="endCode.idCodFinalizacionExterno" />
			</td>
			<td>
				&nbsp;
				<html:errors property="endCode.idCodFinalizacionExterno" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<br>
			</td>
		</tr>
		<tr>
			<td align='right' valign="top">
				<bean:message key="label.end_code.category" />
				:&nbsp;&nbsp;&nbsp;
			</td>
			<td>
			<div class="table-responsive">
			<div class="dataTable_wrapper">
				<display:table class='table table-striped table-bordered table-hover' name="sessionScope.createCampaignForm.categories"
					sort="list" defaultsort="1" id="row" pagesize="5"
					requestURI="/camps/end_cod.do">
					<display:column title='ID' property="idCategoria" sortable="true" />
					<display:column title='${name}' property="nombre" sortable="true" />
					<display:column title='${select}'>
						<%
							TCategoria c = (TCategoria) row;

									String cId = c.getIdCategoria().toString();
						%>
						<html:radio name="createCampaignForm"
							property="endCode.TCategoria.idCategoria" value='<%=cId%>' />
					</display:column>
				</display:table>
				</div></div>
			</td>
			<td>
				&nbsp;
				<html:errors property="endCode.TCategoria" />
			</td>
		</tr>
		<tr>
			<td>
				<br>
			</td>
		</tr>
		<logic:empty name='createCampaignForm'
			property="endCode.idCodFinalizacion">
			<tr>
				<td></td>
				<td>
					<input type='button' class="btn btn-primary"
						value="<bean:message key='label.common.create'/>"
						onClick="this.form.method.value='save_end_code';this.form.submit();" />
				</td>
			</tr>
		</logic:empty>
		<logic:notEmpty name='createCampaignForm' property="endCode.idCodFinalizacion">
			<tr>
				<td></td>
				<td>
					<input type='button' class="btn btn-primary"
						value="<bean:message key='label.common.modify'/>"
						onClick="this.form.method.value='save_end_code';this.form.submit();" />
				</td>
			</tr>
		</logic:notEmpty>
	</table>
</html:form>


