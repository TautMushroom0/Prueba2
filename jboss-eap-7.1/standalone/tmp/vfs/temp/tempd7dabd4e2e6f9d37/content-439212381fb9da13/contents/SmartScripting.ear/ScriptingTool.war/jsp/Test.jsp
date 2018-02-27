 
<!--

http://www.roseindia.net/jsp

-->

<html>

<body>

<p><font size="5" color="#800000">Request Information:</font></p>

<div align="left">

<table border="0" cellpadding="0" cellspacing="0" width="70%" bgcolor="#EEFFCA">

<tr>

<td width="33%"><b><font color="#800000">Request Method:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getMethod()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Request URI:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getRequestURI()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Request Protocol:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getProtocol()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Path Info:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getPathInfo()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Path translated:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getPathTranslated()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Query String:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getQueryString()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Content length:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getContentLength()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Content type:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getContentType()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Server name:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getServerName()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Server port:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getServerPort()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Remote user:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getRemoteUser()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Remote address:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getRemoteAddr()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Remote host:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getRemoteHost()%></font></td>

</tr>

<tr>

<td width="33%"><b><font color="#800000">Authorization scheme:</font></b></td>

<td width="67%"><font color="#FF0000"><%=request.getAuthType()%></font></td>

</tr>

</table>

</div>

</body>

</html>
