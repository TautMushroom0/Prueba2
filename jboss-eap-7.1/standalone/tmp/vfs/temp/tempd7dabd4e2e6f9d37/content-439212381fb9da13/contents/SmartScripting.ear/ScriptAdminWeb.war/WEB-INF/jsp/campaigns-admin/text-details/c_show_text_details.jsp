<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insert template='/WEB-INF/jsp/templates/campaigns_template.jsp'>
	<tiles:put name='title' content='label.text_detail.list'/>
	<tiles:put name='body'  content='/WEB-INF/jsp/campaigns-admin/text-details/show_text_details.jsp'/>
</tiles:insert>