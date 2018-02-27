<%@ page language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<logic:present name="Report">
			<STRONG>
	    		<bean:message name="Report" property="reportName"/>
	    		<br/> 
	    		&nbsp;
	    	</STRONG>
</logic:present>
