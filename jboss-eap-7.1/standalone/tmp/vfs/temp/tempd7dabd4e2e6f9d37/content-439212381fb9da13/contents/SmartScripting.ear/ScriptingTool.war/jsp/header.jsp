<%@ page language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<logic:present name="script">
			<STRONG>
	    		<bean:write name="script" property="nombre" filter="true"/>
	    		<br/> 
	    		&nbsp;
	    	</STRONG>
</logic:present>
