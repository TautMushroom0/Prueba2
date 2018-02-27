<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content="title.page.list"/>
	<tiles:put name='body' content='/WEB-INF/jsp/campaigns-admin/page/show_pages.jsp'/>
</tiles:insert>