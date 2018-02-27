<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content="label.campaign.campaign_users.title"/>
	<tiles:put name='body' content='/WEB-INF/jsp/campaigns-admin/campaign/campaign_users.jsp'/>
</tiles:insert>