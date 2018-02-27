<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@ page import="com.avaya.pso.co.script.web.utils.ISConstants" %>

<script type="text/javascript">
     function seleccionar(Prod, numeroVariable, valorVariable)
     {
         var i=0;
         var variable; 
		 fragmentoValor = valorVariable.split('=');

		 document.getElementById("Prod").value = Prod;
         for (i=0; i<=numeroVariable; i++){
         	variable = "Var"+i;
            document.getElementById(variable).value = fragmentoValor[i];
         }
     }

</script>

<body>
<form action="/ScriptingTool/PricesViewer.do" method="post">

<%
    String prod, numVariable, valVariable;
    
    prod = request.getParameter("Prod");
	numVariable = "";
	valVariable = "";
%>
 
<table cellspacing="3" cellpadding="2" align="center">

	<tr>
	<td><b><bean:message key="label.prices.product"/></td>
		<td> 
		<select id="Prod" name="Prod">
		<logic:iterate id="products" name="<%= ISConstants.PRODUCTS %>">
			<bean:define id="idProd">
           		<bean:write name="products" property="idProd"/>
			</bean:define>
			<bean:define id="descrip">
           		<bean:write name="products" property="descrip"/>
			</bean:define>
			<option value="${idProd}">${descrip}</option>
		</logic:iterate>
		</select>
	</td>
	</tr>
	<logic:iterate id="parameters" name="<%= ISConstants.PARAMETERS %>" indexId="pid">
	<tr>
		<bean:define id="key">
         	<bean:write name="parameters" property="key"/>
		</bean:define>
		<td><b>${key}</td>
		<td> 
		<select id="Var${pid}" name="Var${pid}">
		<%numVariable = pid.toString();
		  valVariable += request.getParameter("Var"+pid);
		  valVariable += "=";
		%> 
			<logic:iterate id="params" name="parameters" property="value">
				<bean:define id="idParam">
         			<bean:write name="params" property="idParam"/>
				</bean:define>
				<bean:define id="descrip">
         			<bean:write name="params" property="descrip"/>
				</bean:define>
				<option value="${idParam}">${descrip}</option>
			</logic:iterate>
		</select>
		</td>
	</tr>
	</logic:iterate>
	<br>
	<tr>
	<td colspan="2" align="center">
	  <input type="submit" value="<bean:message key='label.prices.consult'/>">
	 </td>
	</tr>
</table>
	<br>
<table cellspacing="3" cellpadding="2" align="center">
	<logic:present name="<%= ISConstants.OUR_TARIFA %>" scope="request">
	<tr>
		<td align="center">
			<font size="4" color="red"><b><bean:message key="label.prices.ourPrice"/></b></font>
		</td>
		<td align="center">
			<font size="4" color="red"><b><bean:write name="ourTarifa" scope="request"/></b></font>
		</td>
	</tr>
	<logic:present name="<%= ISConstants.OUR_COMPETENCIA %>" scope="request">
		<logic:iterate id="ourCompetencia" name="<%= ISConstants.OUR_COMPETENCIA %>" >
		<tr><td colspan="2"><table border="1" align="center">
		<tr><td>
			<b><bean:message key="label.prices.otherPrice"/> <bean:write name="ourCompetencia" property="descrip"/></td>
		<td>
			<bean:write name="ourCompetencia" property="valor"/></td>
		</tr>
		<tr><td>
			<b><bean:message key="label.prices.ahMonth"/> </b></td>
		<td>
			<bean:write name="ourCompetencia" property="ahMonth"/></td>
		</tr>
		<tr><td>
			<b><bean:message key="label.prices.ahYear"/> </b></td>
		<td>
			<bean:write name="ourCompetencia" property="ahYear"/></td>
		</tr>
		</table></td></tr>
		</logic:iterate>
	</logic:present>
	</logic:present>
	
</table>
</form>
</body>

<script type="text/javascript">
     seleccionar(<%=prod%>,<%=numVariable%>,'<%=valVariable%>');
</script>	
	
