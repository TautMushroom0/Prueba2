<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content='title.text.create'/>
	<tiles:put name='body'  content='/WEB-INF/jsp/campaigns-admin/text/create_text.jsp'/>
</tiles:insert>