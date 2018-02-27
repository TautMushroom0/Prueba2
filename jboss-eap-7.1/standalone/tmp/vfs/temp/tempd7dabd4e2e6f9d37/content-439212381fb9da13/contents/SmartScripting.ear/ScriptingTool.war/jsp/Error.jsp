
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base />
    
    <title><bean:message key="error.tittle" /></title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="screenpop,buscar">
    <meta http-equiv="description" content="This is my page">
  </head>
  
  <body>

	<TABLE border="0" width="100%" align="center">	
			<TR>
				<TD style="">
					<P align="center">
					<html:img align="middle" border="0" page="/Images/AVAYA.jpg" />
					<!--comment
					<img border="0" align="middle" src="../Images/AVAYA.jpg">
					comment-->
				</P></TD>
			</TR>
			<TR>
				<TD align="center"><B><bean:message key="error.message" /></B> </TD>
			</TR>
			<TR>
				<TD align="center"><html:errors/> </TD>
			</TR>
			 <TR>
			 	<TD><FONT FACE="Arial, Helvetica">&nbsp;</FONT></TD>
			 </TR>
	</TABLE>

  </body>
</html:html>
