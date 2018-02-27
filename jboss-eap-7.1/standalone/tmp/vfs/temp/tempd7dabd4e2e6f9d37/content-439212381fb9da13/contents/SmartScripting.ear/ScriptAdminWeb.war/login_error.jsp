<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<html>
	<head>
		<meta charset="utf-8">
   		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="./Styles/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="./Styles/avaya/bootstrap/css/avaya.css"  rel="stylesheet">
		<link rel="stylesheet" href='<html:rewrite page="/styles.css"/>' type="text/css"/>
		<title><bean:message key="label.login.title"/></title>
	</head>
		<body>
	    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                	<div class="panel-heading text-center">
                        <img src="Styles/avaya/bootstrap/Images/SmartScripting.png" alt="SmartScripting" class="login_logo">
                    	<p><font color=red>
		    				<bean:message key="label.login.error"/>
		    			</font> 
	    					<bean:message key="label.login.please"/></p>
                    </div>
                    <div class="panel-body">
						
								<jsp:include page="auth_form.jsp"/>

					</div>
                </div>
            </div>
        </div>
    </div>
		    <!-- jQuery -->
    <script src="./Styles/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./Styles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./Styles/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./Styles/dist/js/sb-admin-2.js"></script>
	</body>
</html>