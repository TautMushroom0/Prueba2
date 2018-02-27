<%@ page import="com.avaya.pso.co.script.hibernate.beans.TTextos" %>
<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.CreateCampaignForm" %>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<%--give the exact name of your resourcefile by replacing the name MyProjectResources--%> 
<fmt:bundle basename="com.avaya.pso.co.scriptAdmin.web.ApplicationResources"> 
	<fmt:message var="text" key="label.text.text" />
	<fmt:message var="add" key="label.common.add" />
	<fmt:message var="type" key="label.text.type" />
	<fmt:message var="confirm" key="label.common.confirm_delete" />
</fmt:bundle>

<%
	CreateCampaignForm ccfJsp=(CreateCampaignForm)request.getSession().getAttribute("createCampaignForm");
%>

<script language="javascript">
  function limpiar(){
	document.getElementsByName('selectedType')[0].value = "-- Choose --";
	document.getElementById('editor').value = "";
	 document.getElementsByClassName('nicEdit-main')[0].innerHTML ="";
  }

  function limpiarFormato(){	
	document.getElementsByName('quest.formato')[0].value = "-- Choose --";
  }
  
  function enviar(){
	 try{ document.getElementById('editor').value = document.getElementsByClassName('nicEdit-main')[0].innerHTML; 
	 }catch(e){	 
	 }
  }
  </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Styles/WYSIWYG/nicEdit.js"></script>
  <script type="text/javascript">
	var area1,area2,i,j;
	
 	function toggleArea1() {

 		if(!area1) {
		
			area1 = new nicEditor({fullPanel : true}).panelInstance('editor',{hasPanel : true});
			document.getElementById("edit").value="<bean:message key='label.text.nohtml'/>";
		} else {
			area1.removeInstance('editor');
			document.getElementById("edit").value="<bean:message key='label.text.html'/>";
			area1 = null;
			document.getElementsByName("rowDiv")[1].innerHTML=document.getElementsByName("texto")[1].innerHTML;
			}
	
}
 	bkLib.onDomLoaded(function() {  toggleArea1();for ( var ROWS = 0; ROWS < document.getElementsByName("texto").length; ROWS++) {
 		document.getElementsByName("rowDiv")[ROWS].innerHTML=document.getElementsByName("texto")[ROWS].value;	
	};
 	  });

 	RegExp.escape = function(str) {
 	  var specials = /[.*+?|()\[\]{}\\$^]/g; // .*+?|()[]{}\$^
 	  return str.replace(specials, "\\$&");
 	}
 	
 	var resaltado;
 	function resaltar() {
 		if (resaltado === true) {
 			return;
 		}
 		
 		var filtroTexto = $('[name=filtroTexto]')[0].value;
 		var divs = $(".nicEdit-main");
 		var regex = new RegExp("(" + RegExp.escape(filtroTexto) + ")", "gi");
 		for (var index = 0; index < divs.length; index++) {
 			var div = divs[index];
 			div.innerHTML = div.innerHTML.replace(regex, "<span style='color: #F3AA04; background-color: #FFFF96;'>$1</span >");
 		}
 		resaltado = true;
 	}
 	
  </script> 

<html:link action="/camps/text?method=show" paramId="index" paramName="scriptAdminForm" paramProperty="curPar.idParrafo"><bean:message key="label.text.back"/></html:link>
<br><br><br>
	<html:form action="/camps/text" styleClass="form-inline" >	
	<table width="100%">
	<tr>
		<div class="form-group">
			<div class="imput-group">
			<label class="sr-only">Filtro:</label> <input placeholder='Filtro:'
						<html:text styleClass="form-control" property="filtroTexto"   />
						<input type='button' class="btn btn-primary" value="<bean:message key='label.common.query'/>" onclick="this.form.method.value='search';this.form.submit()"/>
			<br>
			</div>
		</div>	
	</tr>
	<tr>
			<div>
				${createCampaignForm.errorFiltro}
			</div>
			<br>
	</tr>
		<tr>
	<tr><td colspan="2">
			<p align="center">
				<html:errors/>
			</p>
		</td>
	</tr>	
	<tr>
		<br>
			<table width="100%">
			<tr>
				<html:select  property="typeStr" styleClass="btn-xs" onchange="hideShowTextFields(typeStr);BlockLongsDefault(1,'Longs');limpiar()" >	
					<html:option value="-- Choose --"><bean:message key='label.text.choose'/></html:option>
					<html:option value="Simple"><bean:message key='label.text.simple'/></html:option>
					<html:option value="URL"><bean:message key='label.text.url'/></html:option>
					<html:option value="Question"><bean:message key='label.text.question'/></html:option>
				</html:select>
			</tr>
			</table>
			<div id='Simple' style="display:none;">
				<br>
				<table width="100%">
					<tr>
						<tr>
						<bean:message key="label.text.text"/>:
						</tr>
						<tr>
						<html:textarea styleClass="textImput" style="height: 100px;width: 100%;" styleId="editor" cols="50" property="text.texto" rows="4"/>
						<br>
						<input type='button' Id="edit" onclick="toggleArea1();" value="" />	
						</tr>
					</tr>
				</table>
			</div>
			 
			<div id='URL' style="display:none;">
				<br>
				<table width="100%">
					<tr>
						<tr>
						<bean:message key="label.text.url"/>:
						</tr>
						<tr>
						<html:text styleClass="textImput" property="url.url" size="30"/>
						</tr>
					</tr>
				</table>
			</div>
		
			<div id='Question' style="display:none;">
				<br>
				<table width="100%">
					<tr>
						<tr>
						<bean:message key="label.text.question_type"/>:
						</tr>
						<tr>
						<html:select styleClass="btn-xs" property="selectedType" onchange="hideShowOpenQuest(selectedType);BlockLongsDefault(1,'Longs');limpiarFormato();">
							<html:option value="-- Choose --"><bean:message key='label.text.choose'/></html:option>
							<html:optionsCollection property="quTypes" value="idTipo" label="descripcion"/>
						</html:select>
						</tr>
					</tr>
				</table>
			</div>
			
			<div id='QuestOpen' style="display:none;">
				<br>
				<table width="100%">
					<tr>
						<tr>
						<bean:message key="label.text.mandatory"/>:</tr>
						<tr>
						<html:checkbox property="quest.obligatorio" value="1"></html:checkbox>
						</tr>
					</tr>
					<tr>
						<tr>
						<bean:message key="label.text.format"/>:</tr>
						<tr>
						<html:select styleClass="btn-xs" property="quest.formato" onchange="BlockLongs(this,'Longs');">	
							<html:option value="-- Choose --"><bean:message key='label.text.choose'/></html:option>
							<html:option value="1"><bean:message key='label.text.numeric'/></html:option>
							<html:option value="2"><bean:message key='label.text.alphanumeric'/></html:option>
							<html:option value="3"><bean:message key='label.text.alpha'/></html:option>
							<html:option value="4"><bean:message key='label.text.date'/></html:option>
						</html:select>
						</tr>
					</tr>
					</table>
				</div>
			
			<div id='Longs' style="display:none;">
				<table width="100%">
					<tr>
						<tr>
						<bean:message key="label.text.lengthmin"/>:</tr>
						<tr>
						<html:text property="quest.longMin" size="2" maxlength="4"/>
						</tr>
					</tr>
					<tr>
						<tr>
						<bean:message key="label.text.lengthmax"/>:</tr>
						<tr>
						<html:text property="quest.longMax" size="2" maxlength="4"/>
						</tr>
					</tr>
				</table>
			</div>
		
			<input type='hidden' name='method' value="create">
			<div id='Submit' style="display:none;">
				<br>
				<input type='button' class="btn btn-primary" onclick="enviar();this.form.method.value='save';this.form.submit();" value="<bean:message key='label.text.create'/>"/>	
			</div>
	</tr>
	<tr>	
			<div class="table-responsive">
			<div class="dataTable_wrapper">
			<table>
			<tr>  

					<display:table class='table table-striped table-bordered table-hover' name="sessionScope.createCampaignForm.texts" sort="list" defaultsort="1" id="row" defaultorder="descending" pagesize="15" requestURI="/camps/text_no_check.do?noAction=true">		
						<display:column title='ID' property="idTexto" sortable="true" comparator="com.avaya.pso.co.scriptAdmin.web.utils.IntegerComparator"/>
						<display:column title='${text}' sortProperty="texto" sortable="true">
							<div name="rowDiv" class="nicEdit-main" onmouseover="resaltar()"> </div>
							<div style="display:none;">
							<html:textarea  name="row" styleId="show"  property="texto" rows="2" readonly="true"/>
							</div>
						</display:column>
						<display:column title='${type}' sortable="true">
							<%
								TTextos t=(TTextos)row;
								
								String type=ccfJsp.getTextType(t);
								if(type.compareTo("simple")==0) {
							%>
							<bean:message key='label.text.simple'/>
							<%
								} else if(type.compareTo("question")==0) {
							%>
							<bean:message key='label.text.question'/>
							<%
								} else if(type.compareTo("url")==0) {
							%>
							<bean:message key='label.text.url'/>
							<%
								}
							%>
						</display:column>
						<display:column title='${add}'>
							<%								
								TTextos t2=(TTextos)row;

								String pId=t2.getIdTexto().toString();
							%>
							<html:multibox property="selectedTexts" value="<%=pId%>"/>
						</display:column>
					</display:table>
									
			</tr>
			<tr>
				<td align="right">
					<bean:message key='label.text.checkbox.select_all'/>&nbsp;
					<input type="checkbox" onclick="checkUncheckAll(this);" name="checkall">
				</td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td width="100%" align="right">
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.add'/>" onclick="this.form.method.value='add';this.form.submit()"/>
					&nbsp;&nbsp;
					<input type='button' class="btn btn-primary" value="<bean:message key='label.common.delete'/>" onclick="this.form.method.value='delete';if(confirm('${confirm}')){this.form.submit();}"/>
				</td>
		    </tr>	
		    </table>
		    </div></div>					
		</tr>
	</table>
</html:form>
