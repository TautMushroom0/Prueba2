<%@ page language="java"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- <style type="text/css" >
<!--
.Header {
		 font-weight: bold; 
		 font-size: 12px; 
		 font-family: Verdana, Arial, Helvetica, sans-serif;
		 color: #FFFFFF;
		 }
.Footer {
		 font-size: 8px; 
		 font-family: Verdana, Arial, Helvetica, sans-serif;
		 color: #FFFFFF;
		 }

</style>  -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap Core CSS -->
    <link href="/ScriptingTool/Styles/SmartScripting_files/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/ScriptingTool/Styles/SmartScripting_files/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/ScriptingTool/Styles/SmartScripting_files/sb-admin-2.css" rel="stylesheet">
	<!-- Avaya CSS -->
	<link href="/ScriptingTool/Styles/SmartScripting_files/avaya.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/ScriptingTool/Styles/SmartScripting_files/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link rel="stylesheet" href='<html:rewrite page="/styles.css"/>' type="text/css"/>
	<%-- Campaign Name and Description 
		<logic:present name="script">
						<p>
							<CENTER>
								<STRONG>
	    							<bean:write name="script" property="nombre" filter="true"/> 
	    						</STRONG>
	    						<BR>
	    						<bean:write name="script" property="descripcion" filter="true"/>						
    						</CENTER>
						</p>
		</logic:present>--%>
<html:html locale="true">

  <head>
    <html:base />
    
    <title>
	    <logic:present name="script">
	    	<bean:write name="script" property="nombre" filter="true" />
    	</logic:present>
    </title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="description" content="Smart Scripting tool main page">
  </head>

<body>
<div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
				<img class="navbar-brand" src="/ScriptingTool/Styles/SmartScripting_files/logAvaya.png" alt="avaya">
				<img src="/ScriptingTool/Styles/SmartScripting_files/SmartScripting.png" alt="SmartScripting" class="navbar-header_logo"><!--
            </div-->
            
        </div></nav>
        <div id="page-wrapper" style="min-height: 630px;">
        <h1 class="page-header ng-scope"><tiles:insert attribute="header" /></h1>
        <div class="well ng-scope">
        <tiles:insert attribute="navigation" />
        <tiles:insert attribute="body" />
        </div>
        <h1 class="page-footer ng-scope">WWW.AVAYA.COM | ©2006 AVAYA INC. | POWERED BY AVAYA</h1>
    
  
  </div>
  </div>
      <script src="/ScriptingTool/Styles/SmartScripting_files/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/ScriptingTool/Styles/SmartScripting_files/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/ScriptingTool/Styles/SmartScripting_files/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/ScriptingTool/Styles/SmartScripting_files/sb-admin-2.js"></script>
</body>
</html:html>
