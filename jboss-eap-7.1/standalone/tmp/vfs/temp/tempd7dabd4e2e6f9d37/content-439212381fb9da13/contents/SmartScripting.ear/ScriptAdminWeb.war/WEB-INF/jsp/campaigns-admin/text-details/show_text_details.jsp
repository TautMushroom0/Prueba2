<%@ include file="/WEB-INF/jsp/common/init.jsp" %> 
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.CreateCampaignForm"%>
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.ScriptAdminForm"%>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TAtributoTextos" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TOpciones" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TParrXopcion" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TParametros" %>
<%@ page import="com.avaya.pso.co.script.hibernate.beans.TParametroXvariable" %>

<script language="javascript">
	function addOption() {
		form = document.getElementById('newOption');	
		form.optionText.value = document.getElementById('option_text').value;	
		form.submit();
	}
</script>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="position" key="label.text.position" />
	<fmt:message var="o_tag" key="label.text.openingTag" />
	<fmt:message var="c_tag" key="label.text.closingTag" />
	<fmt:message var="actions" key="label.campaigns.actions" />
	<fmt:message var="p_name" key="label.parameter.parameter" />
	<fmt:message var="p_value" key="label.parameter.value" />
	<fmt:message var="o_name" key="label.text_detail.option" />
	<fmt:message var="o_next_page" key="label.text_detail.next_page" />
	<fmt:message var="confirm" key="label.common.confirm_delete" />
	<fmt:message var="variable" key="label.parameter.map_variable" />
</fmt:bundle>

<table>
	<tr>
		<td class="textCell">
		<a href="/script-admin/camps/show_campaigns.do"><bean:message key='label.campaigns'/></a>
		&nbsp;|&nbsp;
		<a href="/script-admin/camps/show_pages.do?index=<bean:write name='scriptAdminForm' property='currentCampaign.idScript'/>">
		<bean:message key='label.pages'/>
		</a>		
		&nbsp;|&nbsp;
		<a href="/script-admin/camps/paragraph.do?method=show&index=<bean:write name='scriptAdminForm' property='curPage.idPagina'/>">
		<bean:message key='label.paragraph.paragraphs'/>
		</a>		
		&nbsp;|&nbsp;
		<a href="/script-admin/camps/text.do?method=show&index=<bean:write name='scriptAdminForm' property='curPar.idParrafo'/>">
		<bean:message key='label.text.texts'/>
		</a>		
		</td>
	</tr>
</table>

<h1><bean:message key='label.text_detail.list'/></h1>
<bean:write name='scriptAdminForm' property="curText.texto"/>
<br>
<br>

<div>
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/show_pages.do?index=<bean:write name='scriptAdminForm' property='currentCampaign.idScript'/>">
		<bean:write name="scriptAdminForm" property="currentCampaign.nombre"/>
	</a>
	<br>
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/paragraph.do?method=show&index=<bean:write name='scriptAdminForm' property='curPage.idPagina'/>">
		<bean:write name="scriptAdminForm" property="curPage.nombre"/>
	</a>
	<br>
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/elbow.gif">
	<a href="/script-admin/camps/text.do?method=show&index=<bean:write name='scriptAdminForm' property='curPar.idParrafo'/>">
		<bean:write name="scriptAdminForm" property="curPar.idParrafo"/>
	</a>
	<br>
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/spacer.gif">
	<img src="/script-admin/imgs/elbow.gif">
	<bean:write name="scriptAdminForm" property="curText.idTexto"/>	
	<br><br>
</div>

<%
	ScriptAdminForm safJsp=(ScriptAdminForm)request.getSession().getAttribute("scriptAdminForm");
	
	safJsp.setNewPos(new int[safJsp.getCurText().getTAtributoTextoses().size()]);
	safJsp.setIds(new int[safJsp.getCurText().getTAtributoTextoses().size()]);
		
	int pos=0;
%>

<logic:notEmpty name="scriptAdminForm" property="curText.TPreguntases"> 
	<html:form styleId="newOption" action="/camps/create_option?method=show_create_form">
		<input type='hidden' name="questionId" value="<%=safJsp.getCurQuest().getIdTexto().intValue()%>">
		<html:hidden property="optionText"/>
	</html:form>
</logic:notEmpty>

<html:form action="/camps/text_details">
	<H1><bean:message key="label.attributes"/></H1>
	<div class="table-responsive">
	<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.curText.TAtributoTextoses" sort="list" defaultsort="1" id="row" pagesize="10" requestURI="/camps/text_details.do">		
		<display:column title='${position}' sortProperty="posicion" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator">
			<%
				TAtributoTextos at=(TAtributoTextos)row;
	
				(safJsp.getIds())[pos]=at.getId().getTAtributos().getIdAtributo().intValue();
				(safJsp.getNewPos())[pos]=at.getPosicion().intValue();
				pos++;
			%>
			<html:text property="newPos[${row_rowNum-1}]" size="1"/>		
		</display:column>
		<display:column title='${o_tag}'>
			<bean:write name='row' property="id.TAtributos.tagInicial"/>
		</display:column>
		<display:column title='${c_tag}'>
			<bean:write name='row' property="id.TAtributos.tagFinal"/>
		</display:column>	
		<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">
			<display:column title="${actions}">
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_attribute?method=text" paramId="index" paramName="row" paramProperty="id.TAtributos.idAtributo">
					<img src='/script-admin/imgs/delete.gif'>
				</html:link>
			</display:column>
		</logic:equal>		
	</display:table>
	</div></div>
	<br>
	<input type='hidden' name='method'>
	<logic:notEmpty name="scriptAdminForm" property="curText.TAtributoTextoses">
		<input type='button' class="btn btn-primary" value="<bean:message key='label.paragraph.save_order'/>" onclick="this.form.method.value='re_order_attributes';this.form.submit()">
	</logic:notEmpty>	
	<!-- If the text is a URL shows its additional properties -->
	<logic:notEmpty name="scriptAdminForm" property="curText.TUrls"> 
		<h1><bean:message key="label.text.url"/></h1>
		<html:text name='scriptAdminForm' property="curURL.url" size="30"/>&nbsp;&nbsp;
		<input type='button' class="btn btn-primary" value="<bean:message key='label.common.modify'/>" onclick="this.form.method.value='save_url';this.form.submit();">&nbsp;<html:errors property="url.invalid_size"/>
		
		<H1><bean:message key="label.text_detail.parameters"/></H1>
		<div class="table-responsive">
		<div class="dataTable_wrapper">
		<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.curURL.TParametroses" sort="list" defaultsort="1" id="row_p" pagesize="10" requestURI="/camps/text_details.do">
			<display:column title='ID' property="idParametro" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
			<display:column title='${p_name}' property="parametro" sortable="true"/>
			<display:column title='${p_value}' property="value" sortable="true"/>
			<display:column title='${variable}' sortable="true">
				<%
					TParametros prm = (TParametros)row_p;
					String vName = "";
					
					if(prm.getTParametroXvariables()!=null && prm.getTParametroXvariables().size()>0)
						vName = ((TParametroXvariable)prm.getTParametroXvariables().iterator().next()).getId().getTVariables().getNombre();
				%>
				<%=vName%>
			</display:column>
			<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">
				<display:column title="${actions}">				
					<html:link action="/camps/text_details_no_check?method=edit_parameter" paramId="index" paramName="row_p" paramProperty="idParametro">
						<img src='/script-admin/imgs/edit.gif'>
					</html:link>	
					<html:link onclick="return confirm('${confirm}');" action="/camps/delete_parameter" paramId="index" paramName="row_p" paramProperty="idParametro">
						<img src='/script-admin/imgs/delete.gif'>
					</html:link>
				</display:column>
			</logic:equal>			
		</display:table>
		</div></div>
		<br><br>
	</logic:notEmpty>
	
	<!-- If the text is a question shows its additional properties -->
	<logic:notEmpty name="scriptAdminForm" property="curText.TPreguntases"> 
		<%
			safJsp.setNewPos2(new int[safJsp.getCurQuest().getTOpcioneses().size()]);
			safJsp.setIds2(new int[safJsp.getCurQuest().getTOpcioneses().size()]);
		
			int pos2=0;
		%>
		<h1><bean:message key="label.text.question_type"/></h1>
		<bean:write name='scriptAdminForm' property="curQuest.TTipos.descripcion"/>	
		
		<h1><bean:message key="label.text_detail.options"/></h1>
		<logic:notEmpty name="scriptAdminForm" property="curQuest.TOpcioneses">		
			<div class="table-responsive">
			<div class="dataTable_wrapper">
			<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.curQuest.TOpcioneses" sort="list" defaultsort="3" id="row_o" pagesize="10" requestURI="/camps/text_details_no_check.do?no_action=true">			
				<%
						TOpciones o2=(TOpciones)row_o;
						TParrXopcion pXO = null;
						int parId = safJsp.getCurPar().getIdParrafo().intValue();
						
						Iterator it = o2.getTParrXopcions().iterator();
						while(it.hasNext()) {
							pXO = (TParrXopcion)it.next();
							if(pXO.getId().getTParrafos().getIdParrafo().intValue()==parId)
								break;
							pXO = null;
						}
				%>
				<display:column title='ID' property="idOpcion" sortable="true"/>
				<display:column title='${o_name}' property="opcion" sortable="true"/>
				<display:column title='${position}' sortable="true" sortProperty="posicion">
					<%
						TOpciones o=(TOpciones)row_o;
			 
						(safJsp.getIds2())[pos2]=o.getIdOpcion().intValue();
						(safJsp.getNewPos2())[pos2]=o.getPosicion().intValue();
						pos2++;
					%>
					<html:text property="newPos2[${row_o_rowNum-1}]" size="1"/>		
				</display:column>
				<display:column title='${o_next_page}'> 
					<%						
						if(pXO!=null && pXO.getTPaginas()!=null) {
							String action = "/camps/paragraph.do?method=show&index="+pXO.getTPaginas().getIdPagina().intValue();
							
					%>
					<html:link action='<%=action%>'>
						<%=pXO.getTPaginas().getIdPagina().intValue()%>
					</html:link> 
					<%
						} else if(pXO!=null) {							
					%>
							<%=pXO.getTPaginas()%>
					<%
						}
					%>
				</display:column>
				<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">
					<display:column title="${actions}">
						<html:link action="/camps/options?method=edit" paramId="index" paramName="row_o" paramProperty="idOpcion">
							<img src='/script-admin/imgs/edit.gif'>
						</html:link>
						<html:link onclick="return confirm('${confirm}');" action="/camps/delete_option" paramId="index" paramName="row_o" paramProperty="idOpcion">
							<img src='/script-admin/imgs/delete.gif'>
						</html:link>
					</display:column>
				</logic:equal>
			</display:table>
			</div></div>		
			<br>
			<input type='button' class="btn btn-primary" value="<bean:message key='label.paragraph.save_order'/>" onclick="this.form.method.value='re_order_options';this.form.submit()">
			<br><br>
		</logic:notEmpty>
		<logic:empty name="scriptAdminForm" property="curQuest.TOpcioneses">
			<h2><bean:message key="label.text_detail.no_options_set"/></h2>
		</logic:empty>	
		<br><br>
		<logic:equal name="scriptAdminForm" property="curQuest.TTipos.idTipo" value="1" >
		<h1>Propiedades</h1>
		<bean:message key="label.text.mandatory"/>
		<html:select styleClass="btn-xs" name='scriptAdminForm' property="curQuest.obligatorio">	
			<html:option value="0"><bean:message key='label.common.no'/></html:option>
			<html:option value="1"><bean:message key='label.common.yes'/></html:option>
		</html:select>		
		<br><br>
		<bean:message key="label.text.format"/>
		<html:select styleClass="btn-xs" name='scriptAdminForm' property="curQuest.formato" onchange="this.form.method.value='show_text_details';this.form.submit();">
			<html:option value="0"><bean:message key='label.text.choose'/></html:option>	
			<html:option value="1"><bean:message key='label.text.numeric'/></html:option>
			<html:option value="2"><bean:message key='label.text.alphanumeric'/></html:option>
			<html:option value="3"><bean:message key='label.text.alpha'/></html:option>
			<html:option value="4"><bean:message key='label.text.date'/></html:option>
		</html:select>
		<br><br>
		
		<div id='Longs'>
		<logic:notEqual name='scriptAdminForm' property="curQuest.formato" value="4">
		<bean:message key="label.text.lengthmin"/>
		<html:text name='scriptAdminForm' property="curQuest.longMin" size="2" maxlength="4"/>	
		<br><br>
		<bean:message key="label.text.lengthmax"/>
		<html:text name='scriptAdminForm' property="curQuest.longMax" size="2" maxlength="4"/>
		<br><br>
		</logic:notEqual>
		</div>
		
		<input type='button' class="btn btn-primary" value="<bean:message key='label.common.modify'/>" onclick="this.form.method.value='save_params';this.form.submit();">&nbsp;<html:errors property="text.params"/>
		<br><br>
		</logic:equal>
		
		<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">
				<bean:message key="label.option.option_string"/>:&nbsp;<input type='text' name='option_text' id='option_text'/><br><br>
				<a href="javascript:addOption()">
					<bean:message key="label.text_detail.add_option"/>
				</a> 
			&nbsp;|&nbsp;
		</logic:equal>
	</logic:notEmpty>
	
	<logic:empty name="scriptAdminForm" property="curText.TPreguntases"> 
		<br><br>
	</logic:empty>
	
	<logic:notEmpty name="scriptAdminForm" property="curText.TUrls"> 
		<html:link action="/camps/text_details_no_check?method=create_parameter">
			<bean:message key="label.parameter.add"/>
		</html:link>	
		&nbsp;|&nbsp;
	</logic:notEmpty>	
	<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value="0">
		<html:link action="/camps/text_attributes?method=attributes_form">
			<bean:message key="label.text.attribute_create"/>
		</html:link>
	</logic:equal>
</html:form>