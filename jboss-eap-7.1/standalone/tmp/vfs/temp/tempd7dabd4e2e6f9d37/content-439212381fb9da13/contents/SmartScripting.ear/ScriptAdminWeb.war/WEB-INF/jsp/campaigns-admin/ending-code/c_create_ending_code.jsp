<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content='title.end_code.create'/>
	<tiles:put name='body' content='/WEB-INF/jsp/campaigns-admin/ending-code/create_ending_code.jsp'/>
</tiles:insert>