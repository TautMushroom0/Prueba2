<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content='label.report.historic_agents'/>
	<tiles:put name='body' content='/WEB-INF/jsp/reports/historic_Agents.jsp'/>
</tiles:insert>