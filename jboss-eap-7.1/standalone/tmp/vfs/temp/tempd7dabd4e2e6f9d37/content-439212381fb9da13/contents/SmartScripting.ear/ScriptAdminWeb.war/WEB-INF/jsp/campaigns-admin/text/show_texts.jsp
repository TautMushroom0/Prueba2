<%@include file="/WEB-INF/jsp/common/init.jsp" %>
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.CreateCampaignForm"%>
<%@page import="com.avaya.pso.co.scriptAdmin.web.form.ScriptAdminForm"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TAtributoTextos"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TParrafos"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TTextos" %>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TTextosXparrafo"%>
<%@page import="com.avaya.pso.co.script.hibernate.beans.TAtributoParrafos"%>
<%@ page import="sun.security.provider.certpath.CollectionCertStore" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="actions" key="label.campaigns.actions" />
	<fmt:message var="position" key="label.paragraph.position" />
	<fmt:message var="text" key="label.text.text" />
	<fmt:message var="type" key="label.text.type" />
	<fmt:message var="name" key="label.campaign.name" />
	<fmt:message var="confirm" key="label.common.confirm_delete" />	
</fmt:bundle>

<script type="text/javascript" src="<%=request.getContextPath()%>/Styles/WYSIWYG/nicEdit.js"></script>


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
		</td>
	</tr>
</table>

<h1><bean:message key="label.text.paragraph_details" /></h1> 

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
	<bean:write name="scriptAdminForm" property="curPar.idParrafo"/>
	<br><br>
</div>

<%
	CreateCampaignForm ccfJsp = (CreateCampaignForm)request.getSession().getAttribute("createCampaignForm");
	ScriptAdminForm safJsp = (ScriptAdminForm)request.getSession().getAttribute("scriptAdminForm");
	
	List l = new ArrayList(safJsp.getCurPar().getTAtributoParrafoses());
	
	Collections.sort(l, new com.avaya.pso.co.scriptAdmin.web.utils.TAtributoParrafosComparator());
%>
<table>
	<tr><td>
	<bean:message key="label.paragraph.current"/>:&nbsp;&nbsp;
	<%for(int i=0;i<l.size();i++) {
		TAtributoParrafos at = (TAtributoParrafos)l.get(i);
	%>
	<%=at.getId().getTAtributos().getTagInicial()%>
	<%}%> 
	<bean:message key="label.text.position"/>
	<bean:write name="scriptAdminForm" property="curPar.posicion"/>
	<%for(int i=0;i<l.size();i++) {
		TAtributoParrafos at = (TAtributoParrafos)l.get(i);
	%>
	<%=at.getId().getTAtributos().getTagFinal()%>
	<%}%>
	</td></tr>
</table>
<html:form action="/camps/text">

	<%
	int tableSize1 =  safJsp.getCurPar().getTAtributoParrafoses().size();
	int tableSize2 =  safJsp.getCurPar().getTTextosXparrafos().size();

 	ccfJsp.setIds(new int[tableSize1]);
 	ccfJsp.setNewPos(new int[tableSize1]); 	

 	ccfJsp.setIds2(new int[tableSize2]);
 	ccfJsp.setNewPos2(new int[tableSize2]);
 	
 	ccfJsp.setChTexts(new String[tableSize2]);
 	
	int pos1=0, pos2=0;
	%>
	
	<p align="center">
		<html:errors/>
	</p>
	
	<H1><bean:message key="label.text.texts"/> </H1>
	<input type="hidden" value='<bean:write name="scriptAdminForm" property="curPar.idParrafo"/>' name="index">

	<input type='hidden' name='index' value="<bean:write name='scriptAdminForm' property='curPar.idParrafo'/>">
<div class="table-responsive">
<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.curPar.TTextosXparrafos" sort="list" defaultsort="2" id="row" pagesize="10" requestURI="/camps/text.do?method=show">
		<display:column title="ID" property="id.TTextos.idTexto" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
		<display:column title="${position}" sortable="true" sortProperty="posicion" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator">
				<% 
				TTextosXparrafo txpar=(TTextosXparrafo)row;
	
				(ccfJsp.getIds2())[pos2] = txpar.getId().getTTextos().getIdTexto().intValue();
				(ccfJsp.getNewPos2())[pos2] = txpar.getPosicion().intValue();
				
				pos2++;
				%>
				<html:text property="newPos2[${row_rowNum-1}]" size="1"/>
		</display:column>
		<display:column sortProperty="id.TTextos.texto" title="${text}" sortable="true">
				<% 
				TTextos t=((TTextosXparrafo)row).getId().getTTextos();
	
				(ccfJsp.getChTexts())[pos2-1] = t.getTexto();
				
				%>
				<div name="rowDiv" class="nicEdit-main"> </div>
				<div style="display:none;">	
				<html:textarea  style="width: 100%; height: 100%;" property="chTexts[${row_rowNum-1}]" rows="2"/>
				</div>		
		</display:column>
		<display:column title="${type}" sortable="true">
			<%
				// Extract object to determine type
				TTextos txt = (TTextos) ((TTextosXparrafo)row).getId().getTTextos();
				if(txt.getTUrls().size()>0) {
			%>
			<bean:message key ="label.text.url" />
			<html:link action="/camps/text_details?method=show&text_type=URL" paramId="index" paramName="row" paramProperty="id.TTextos.idTexto">
				<bean:message key='label.common.view_detail'/>
			</html:link>	
			<%
				}
				else if(txt.getTPreguntases().size()>0) {
			%>
			<bean:message key ="label.text.question" />
			<html:link action="/camps/text_details?method=show&text_type=question" paramId="index" paramName="row" paramProperty="id.TTextos.idTexto">
				<bean:message key='label.common.view_detail'/>
			</html:link>			
			<%
				}
				else {
			%>
			<bean:message key ="label.text.simple" />
			<html:link action="/camps/text_details?method=show&text_type=Simple" paramId="index" paramName="row" paramProperty="id.TTextos.idTexto">
				<bean:message key='label.common.view_detail'/>
			</html:link>							
			<%}%>
		</display:column> 							
		
		<logic:equal name ="scriptAdminForm" property = "currentCampaign.activo" value = "0">
			<display:column title="${actions}">
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_text" paramId="index" paramName="row" paramProperty="id.TTextos.idTexto">
					<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>">
				</html:link>
			</display:column>
		</logic:equal>			
	</display:table>	
	</div></div>
	<c:if test="<%= safJsp.getCurPar().getTTextosXparrafos()!=null && safJsp.getCurPar().getTTextosXparrafos().size()!=0%>">
		<br>
		<input type="button" class="btn btn-primary" value="<bean:message key='label.paragraph.save'/>" onclick="this.form.index;this.form.method.value='re_order_txt';this.form.submit();"/>
	</c:if>
	
	<br><br>
	<h2><bean:message key="label.text.attributes"/></h2>
	<div class="table-responsive">
	<div class="dataTable_wrapper">
	<display:table class='table table-striped table-bordered table-hover' name="sessionScope.scriptAdminForm.curPar.TAtributoParrafoses" sort="list" defaultsort="2" id="row_a" pagesize="10" requestURI="/camps/text.do?method=show">
		<display:column title="ID" property="id.TAtributos.idAtributo" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>			
		<display:column title="${position}" sortable="true" sortProperty="posicion" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator">
				<%
				TAtributoParrafos at = (TAtributoParrafos)row_a;

				(ccfJsp.getIds())[pos1] = at.getId().getTAtributos().getIdAtributo().intValue();
				(ccfJsp.getNewPos())[pos1]= at.getPosicion().intValue();
				pos1++;
				%>
				<html:text property="newPos[${row_a_rowNum-1}]" size="1"/>
		</display:column>
		<display:column title="${name}" sortable="true">
			<% 
			TAtributoParrafos at2 = (TAtributoParrafos)row_a;
			%>
			<%=at2.getId().getTAtributos().getTagInicial()%>
			<bean:write name='row_a' property="id.TAtributos.nombre"/>
			<%=at2.getId().getTAtributos().getTagFinal()%>
		</display:column>
		<logic:equal name="scriptAdminForm" property="currentCampaign.activo" value = "0">
			<display:column title="${actions}">
				<html:link onclick="return confirm('${confirm}');" action="/camps/delete_attribute?method=paragraph" paramId="index" paramName="row_a" paramProperty="id.TAtributos.idAtributo">
					<img src='/script-admin/imgs/delete.gif' title="<bean:message key='label.common.icons.delete'/>" alt="<bean:message key='label.common.icons.delete'/>"/>
				</html:link>
			</display:column>
		</logic:equal>				
	</display:table>
</div></div>
	<input type='hidden' name='method'>
	<c:if test="<%= safJsp.getCurPar().getTAtributoParrafoses()!=null && safJsp.getCurPar().getTAtributoParrafoses().size()!=0%>">
		<br>
		<input type="button" class="btn btn-primary" value="<bean:message key='label.paragraph.save_order'/>" onclick="this.form.method.value='re_order_atr';this.form.submit();"/>
	</c:if>

	<br>
	<br>

	<logic:equal name ="scriptAdminForm" property = "currentCampaign.activo" value = "0">
		<html:link action="/camps/paragraph_attribute_no_check?method=attributes_form">
			<bean:message key="label.text.attribute_create"/>
		</html:link>	
		&nbsp;|&nbsp;
		<html:link action="/camps/text?method=create" paramId="pageId" paramName="scriptAdminForm" paramProperty="curPar.TPaginas.idPagina">
			<bean:message key="label.text.add"/>	
		</html:link>	
	</logic:equal>	
  <script type="text/javascript">

		function startdiv() {for ( var ROWS = 0; ROWS < document.getElementsByName("rowDiv").length; ROWS++) {
 		document.getElementsByName("rowDiv")[ROWS].innerHTML=document.getElementsByName("chTexts["+ROWS+"]")[0].value; }};
 		startdiv();
  </script> 
</html:form>