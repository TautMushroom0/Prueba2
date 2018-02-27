<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/init.jsp" %>

<html:form method="post" action="/report/actions.do">
	<br>
	<input type='hidden' name='method'/>
	<ul>
		<li>
		<html:link action="/report/actions.do?method=campaign_calls">
			<bean:message key='label.report.campaign_calls'/>
		</html:link><br><br>	
		</li>
		<li>
		<html:link action="/report/actions.do?method=user_calls">
			<bean:message key='label.report.user_calls'/>
		</html:link><br><br>	
		</li>
		<li>
		<html:link action="/report/CampaignByCategory.do?method=campaign_category_calls">
			<bean:message key='label.report.campaign_category_calls'/>
		</html:link><br><br>
		</li>
		<li>
		<html:link action="/report/TotalCalls.do?method=total_calls">
			<bean:message key='label.report.total_calls'/>
		</html:link><br><br>
		</li>
		<li>
		<html:link action="/report/HistoricCalls.do">
			<bean:message key='label.report.historic_calls'/>
		</html:link><br><br>
		</li>
		<li>
		<html:link action="/report/ResultQuestionFinal.do?method=result_question&var=one">
			<bean:message key='label.report.result_question'/>
		</html:link><br><br>
		</li>
		
		<li>
		<html:link action="/report/ResultQuestionFinal.do?method=result_question&var=todas">
			<bean:message key='label.report.result_question_all'/>
		</html:link><br><br>
		</li>
		
		<li>
		<html:link action="/report/HistoricAgents.do">
			<bean:message key='label.report.historic_agents'/>
		</html:link><br><br>
		</li>
	</ul>
	<br>
</html:form>