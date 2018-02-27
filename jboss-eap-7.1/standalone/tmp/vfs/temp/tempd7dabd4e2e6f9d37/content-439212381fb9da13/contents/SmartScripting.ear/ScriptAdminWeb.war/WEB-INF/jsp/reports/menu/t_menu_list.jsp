<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content='title.report.menu'/>
	<tiles:put name='body' content='/WEB-INF/jsp/reports/menu/menu_list.jsp'/>
</tiles:insert>