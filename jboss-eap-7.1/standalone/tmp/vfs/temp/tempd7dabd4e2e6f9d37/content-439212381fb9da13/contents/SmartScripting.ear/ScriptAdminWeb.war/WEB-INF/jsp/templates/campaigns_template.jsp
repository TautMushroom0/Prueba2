<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<html>
	<head>
	 	<meta charset="utf-8">
   		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- MetisMenu CSS -->
    	<link href="<%=request.getContextPath()%>/Styles/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/Styles/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"> 
		<link href="<%=request.getContextPath()%>/Styles/avaya/bootstrap/css/avaya.css"  rel="stylesheet">
		 <link href="<%=request.getContextPath()%>/Styles/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/Styles/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/Styles/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
		<!--  <link rel="stylesheet" href='<html:rewrite page="/styles.css"/>' type="text/css"/>  -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/calendar/calendar-win2k-cold-1.css">
		<title><bean:message key="label.common.welcome"/></title>
		<script language="Javascript" src="<%=request.getContextPath()%>/jscr/util.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/calendar/calendar.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath()%>/calendar/calendarHelper.js"></script>
    	<script type="text/javascript" src="<%=request.getContextPath()%>/calendar/calendar-i18n.jsp"></script>
    	
	</head>

	<body>
	 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
            
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
             
                <!-- /.sidebar-collapse -->
			
				<img class="navbar-brand" src="<%=request.getContextPath()%>/Styles/avaya/bootstrap/Images/logAvaya.png" alt="avaya">
				<img src="<%=request.getContextPath()%>/Styles/avaya/bootstrap/Images/SmartScripting.png" alt="SmartScripting" class="navbar-header_logo">
				
				<!--
            </div-->
            
        </div><img class="navbar-brand navbar-right" src="<%=request.getContextPath()%>/Styles/avaya/bootstrap/Images/logAvaya_right.png" alt="avaya"></nav> 
        <nav class="navbar-default navbar-static-side" role="navigation">
        	<div class="sidebar-nav navbar-collapse" aria-expanded="true">
            	<!-- ngInclude:  -->
            	<div ng-include="" src="'pages/comun/menu.html'" class="ng-scope"><ul class="nav ng-scope" id="side-menu" ng-controller="menuCtrl">
    				<!-- ngRepeat: menu in menus -->
    				<li ng-repeat="menu in menus" class="ng-scope">
      					<html:link styleClass="footer" action="/logout">
      						<i class="glyphicon glyphicon-log-out"></i>
      					
                			<bean:message key='label.templates.logout'/>
						</html:link>
    				</li>
    				<!-- end ngRepeat: menu in menus -->
    				<c:if test="<%=request.isUserInRole(\"report\") || request.isUserInRole(\"admin\")%>">
    					<li ng-repeat="menu in menus" class="ng-scope">
    		    		<a class="ng-binding">
    		    		<i class="fa fa-file-text"></i>
    		    		<bean:message key='label.templates.report'/>
    		    		<span class="fa arrow"></span>
    		    		</a>
    		    		
        				<ul class="nav nav-second-level collapse">
            				<!-- ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                						<html:link action="/report/actions.do?method=campaign_calls">
											<bean:message key='label.report.campaign_calls'/>
										</html:link>
                				<!-- ngRepeat: opcion in submenu.hijos -->
            				</li><!-- end ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                					<html:link action="/report/actions.do?method=user_calls">
										<bean:message key='label.report.user_calls'/>
									</html:link>
								<!-- ngRepeat: opcion in submenu.hijos -->
            				</li><!-- end ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                				<html:link action="/report/CampaignByCategory.do?method=campaign_category_calls">
									<bean:message key='label.report.campaign_category_calls'/>
								</html:link>
									<!-- ngRepeat: opcion in submenu.hijos -->
            				</li>
            				<!-- end ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                				<html:link action="/report/HistoricCalls.do">
									<bean:message key='label.report.historic_calls'/>
								</html:link>
							<!-- ngRepeat: opcion in submenu.hijos -->
            				</li>
            				<!-- end ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                				<html:link action="/report/ResultQuestionFinal.do?method=result_question&var=one">
									<bean:message key='label.report.result_question'/>
								</html:link>
								<!-- ngRepeat: opcion in submenu.hijos -->
            				</li>
            				<!-- end ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                					<html:link action="/report/ResultQuestionFinal.do?method=result_question&var=todas">
										<bean:message key='label.report.result_question_all'/>
									</html:link>
									<!-- ngRepeat: opcion in submenu.hijos -->
            				</li>
            				<!-- end ngRepeat: submenu in menu.hijos --><li ng-repeat="submenu in menu.hijos" class="ng-scope">
                					<html:link action="/report/HistoricAgents.do">
										<bean:message key='label.report.historic_agents'/>
									</html:link>
									<!-- ngRepeat: opcion in submenu.hijos -->
            				</li>
        				</ul>
   				</li>
   				</c:if>
   				<!-- end ngRepeat: menu in menus -->
   				<c:if test="<%=request.isUserInRole(\"campaign\") || request.isUserInRole(\"admin\")%>">
   				<li ng-repeat="menu in menus" class="ng-scope">
        			<html:link styleClass="footer" action="/camps/show_campaigns">
    	            	<i class="watch-menu fa fa-gears fa-fw"></i> 
						<bean:message key='label.templates.campaign'/>
					</html:link>
    			</li>
    			</c:if>
    			<!-- end ngRepeat: menu in menus -->
    			<c:if test="<%=request.isUserInRole(\"admin\")%>">
    			<li ng-repeat="menu in menus" class="ng-scope">
    				<html:link styleClass="footer" action="/admin/show">
    					<i class="watch-menu fa fa-users fa-fw"></i>
    	            	<bean:message key='label.templates.admin'/>
					</html:link>  
        			</li>
        			</c:if>
				<!-- /#side-menu -->
				<!--ng-click="{{submenu.metodo}}"-->
				</div>
             </div>
                <!-- /.sidebar-collapse -->
                
         </nav>
    	<div id="page-wrapper">
    		<div class="well ng-scope">
				    		<tiles:get name='body'/>
			</div>
    	</div>
        
		 </div>
		     <script src="<%=request.getContextPath()%>/Styles/bower_components/jquery/dist/jquery.min.js"></script>

   			 <script src="<%=request.getContextPath()%>/Styles/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

			 <script src="<%=request.getContextPath()%>/Styles/bower_components/metisMenu/dist/metisMenu.min.js"></script>

   			 <script src="<%=request.getContextPath()%>/Styles/dist/js/sb-admin-2.js"></script>
		    
	</body>
</html>
	