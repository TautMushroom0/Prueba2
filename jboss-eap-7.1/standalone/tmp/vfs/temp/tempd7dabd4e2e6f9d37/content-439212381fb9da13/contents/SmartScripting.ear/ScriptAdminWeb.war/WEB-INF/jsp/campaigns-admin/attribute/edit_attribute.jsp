<%@ page import="com.avaya.pso.co.scriptAdmin.web.form.CreateAttributeForm" %>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:link action="/camps/paragraph_attribute_no_check?method=attributes_form&no_action=true">
<bean:message key="label.paragraph.attribute.back"/>
</html:link>
<br><br>

<%
	CreateAttributeForm cafJsp = (CreateAttributeForm)request.getSession().getAttribute("createAttributeForm");
%>
<html:form action="/camps/modify_attribute">
	<input type='hidden' name='method'>
	<input type='hidden' name='index' value='<%=cafJsp.getAttributeId()%>'>
	<table cellspacing="0" cellpadding="0" border="0">
		<tr>
		    <td class="editBoxContainer" valign="top"> 
	         <table cellspacing="0" cellpadding="0" border="0" class="editBox">
	         	<tr>
	         		<td colspan="2" align="center"><html:errors/></td>
	         	</tr>
		        <tr>
			        <td class="textCell"><bean:message key='label.attribute.create.name'/>:&nbsp;</td>
			 		<td class="inputCell"><html:text styleClass="textImput" property="attribute.nombre"/></td>
			 	</tr>	
		        <tr>
			        <td class="textCell"><bean:message key='label.attribute.create.openingTag'/>:&nbsp;</td>
			 		<td class="inputCell"><html:text styleClass="textImput" property="attribute.tagInicial"/></td>
			 	</tr>	
				<tr>
					<td class="textCell"><bean:message key = 'label.attribute.create.closingTag'/>:&nbsp;</td>
					<td class="inputCell"><html:text styleClass="textImput" property="attribute.tagFinal"/></td>
				</tr>
			    <tr>
			        <td></td>
					<td align="right" class="inputCell"><input type='button' class="btn btn-primary" value="<bean:message key='label.common.modify'/>" onclick="this.form.method.value='update';this.form.submit();"/></td>
		        </tr>				
	         </table>	         
		    </td>
		</tr>				
	</table>
</html:form>


	
