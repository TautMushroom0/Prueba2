<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>


<form role="form" action="j_security_check" METHOD=POST>
	<fieldset>
		<p><bean:message key="label.login.help" arg0="mailto:@avaya.com?subject=ScriptAdmin Problems"/>.</p>
		<div class="form-group"><input class="form-control" type=text placeholder="<bean:message key='label.login.user'/>"  name=j_username>	</div>
		<div class="form-group"><input class="form-control" placeholder="<bean:message key='label.login.password'/>" type=password  name=j_password ></div>
		<input class="btn btn-lg btn-success btn-block" type=submit value="<bean:message key='label.login.submit'/>">
	</fieldset>

