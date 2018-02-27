
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.avaya.pso.co.script.web.utils.ISConstants"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!-- Check if user tries to go back -->

<%
String cod=(String) request.getSession().getAttribute("codAni");
%>

<body background="/Images/FONDO.gif">
	<html:form action="/OpenScript" method="GET">
	<input type="hidden" name="ani" value=<%= cod %> >
		<table border=0 width="100%">
			<tr align="left">
				<td>
					<br>
					<logic:present
						name="<%=ISConstants.SESSION_IS_OBSERVATIONS_ENABLE%>">
						<logic:equal
							name="<%=ISConstants.SESSION_IS_OBSERVATIONS_ENABLE%>"
							value="true">
							<html:image property="observationsButton" page="/Images/hide.gif"
								border="0" align="left" altKey="label.alternative.observations" />
						</logic:equal>
					</logic:present>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<%-- Paragraph Iteration --%>
					<logic:present name="<%=ISConstants.SESSION_PARAGRAPHS_LIST%>">
						<logic:iterate id="paragraph"
							name="<%=ISConstants.SESSION_PARAGRAPHS_LIST%>">
							<%-- Extract Initial variables <bean:write name="<%= ISConstants.PAGE_ID %>"/> --%>
							<bean:define id="idPage" name="<%=ISConstants.PAGE_ID%>" />


							<bean:define id="idParagraph" name="paragraph"
								property="idParrafo" />
							<P>
								<%-- Initial Attributes of paragraph --%>
								<logic:iterate id="attrInitial" name="paragraph"
									property="<%=ISConstants.GET_ATTRIBUTES_INIT%>">
									<bean:write name="attrInitial"
										property="<%=ISConstants.GET_TAG_INITIAL%>" filter="false" />
									<%-- END of Initial Attributes of paragraph --%>
								</logic:iterate>
								<%-- Text Iteration --%>
								<logic:iterate id="text" name="paragraph"
									property="<%=ISConstants.GET_PARAGRAPH_TEXTS%>">
									<%-- Initial Text Attributes --%>
									<logic:iterate id="attrInitial" name="text"
										property="<%=ISConstants.GET_ATTRIBUTES_INIT%>">
										<bean:write name="attrInitial"
											property="<%=ISConstants.GET_TAG_INITIAL%>" filter="false" />
										<%-- END of Initial Text Attributes --%>
									</logic:iterate>
									<%-- Write Simple Text --%>
									<logic:equal name="text" property="tipo"
										value="<%=ISConstants.TEXT_TYPE_TEXT%>">

										<bean:write name="text" property="<%=ISConstants.GET_TEXT%>"
											filter="false" />

									</logic:equal>
									<%-- Write Question Text --%>
									<logic:equal name="text" property="tipo"
										value="<%=ISConstants.TEXT_TYPE_QUESTION%>">
										<bean:write name="text" property="<%=ISConstants.GET_TEXT%>"
											filter="false" />
										<%-- A break line is not used when the question does not have text because put an extra line --%>
										<logic:notEqual name="text"
											property="<%=ISConstants.GET_TEXT%>" value="">
											<BR>
										</logic:notEqual>

										<bean:define id="question" name="text" property="SPregunta" />

										<%-- Write Question Options if is a close question (Unique Answer)--%>
										<logic:equal name="question" property="nombreTipo"
											value="<%=ISConstants.TEXT_TYPE_QUESTION_RADIUS%>">
											<logic:iterate id="option" name="question"
												property="<%=ISConstants.GET_QUESTION_OPTIONS%>">
												<%-- Extract the option ID --%>
												<bean:define id="idOption">
													<bean:write name="option" property="idOpcion" />
												</bean:define>
												<%-- Extract the option Text --%>
												<bean:define id="optionText">
													<bean:write name="option" property="opcion" />
												</bean:define>
												<%-- Write Question Option --%>
												<html:radio value="${idPage}-${idParagraph}-${idOption}"
													property="<%=ISConstants.REQUEST_PAGE_AND_OPTION%>">${optionText}</html:radio>
												<BR>
											</logic:iterate>
										</logic:equal>

										<%-- Write Open Question (Text Box)--%>
										<logic:equal name="question" property="nombreTipo"
											value="<%=ISConstants.TEXT_TYPE_QUESTION_TEXT_BOX%>">
											<bean:define id="idPregunta" name="question"
												property="idTexto" />
											<bean:define id="idLongMax" name="question"
												property="longMax" />
											<bean:define id="idLongMin" name="question"
												property="longMin" />
											<bean:define id="idObligatorio" name="question"
												property="obligatorio" />
											<bean:define id="idFormato" name="question"
												property="formato" />
											<%-- String name = "respuesta("+idPage+"-"+idParagraph+"-"+idPregunta+")"; --%>
											<html:text
												property="respuesta(${idPage}-${idParagraph}-${idPregunta}-${idObligatorio}-${idLongMin}-${idLongMax}-${idFormato})"
												size="50" maxlength="${idLongitud}"></html:text>
											<font color="red" size="2"><bean:write name="question"
													property="obligatorio" />&nbsp; <logic:equal value="4"
													name="question" property="formato">dd/mm/aaaa</logic:equal>
											</font>
											<font color="red" size="2"><html:errors
													property="${idPage}-${idParagraph}-${idPregunta}-${idObligatorio}-${idLongMin}-${idLongMax}-${idFormato}" />
											</font>
										</logic:equal>

										<%-- Write ComboBox answer --%>
										<logic:equal name="question" property="nombreTipo"
											value="<%=ISConstants.TEXT_TYPE_QUESTION_COMBO_BOX%>">
											<html:select property="<%=ISConstants.GET_COMBO_LIST%>">
												<logic:iterate id="option" name="question"
													property="<%=ISConstants.GET_QUESTION_OPTIONS%>">
													<%-- Extract the option ID --%>
													<bean:define id="idOption">
														<bean:write name="option" property="idOpcion" />
													</bean:define>
													<%-- Extract the option Text --%>
													<bean:define id="optionText">
														<bean:write name="option" property="opcion" />
													</bean:define>
													<%-- Write Question Option --%>
													<html:option value="${idPage}-${idParagraph}-${idOption}">${optionText}</html:option>
												</logic:iterate>
											</html:select>
										</logic:equal>

										<%-- Write Multiple Answer Checkbox --%>
										<logic:equal name="question" property="nombreTipo"
											value="<%=ISConstants.TEXT_TYPE_QUESTION_CHECK_BOX%>">

											<logic:iterate id="option" name="question"
												property="<%=ISConstants.GET_QUESTION_OPTIONS%>">
												<%-- Extract the option ID --%>
												<bean:define id="idOption">
													<bean:write name="option" property="idOpcion" />
												</bean:define>
												<%-- Extract the option Text --%>
												<bean:define id="optionText">
													<bean:write name="option" property="opcion" />
												</bean:define>
												<%-- Write Question Option --%>
												<%-- String name = "respuesta("+idPage+"-"+idParagraph+"-"+idOption+")"; --%>
												<html:checkbox
													property="checkbox(${idPage}-${idParagraph}-${idOption})">${optionText}</html:checkbox>
												<BR>
											</logic:iterate>

										</logic:equal>

										<%-- END Of Write Question --%>
									</logic:equal>

									<%-- Write URL Text --%>
									<logic:equal name="text" property="tipo"
										value="<%=ISConstants.TEXT_TYPE_URL%>">
										<bean:define id="urlObj" name="text" property="SUrls" />
										<bean:define id="url" name="urlObj" property="url" />
										<bean:define id="urlParam" name="urlObj"
											property="SParamReplaced" />
										<%-- <%url = url+"?codAni="+cod;
											System.out.print("url "+url);
										%> --%>	
										<html:link name="urlParam" target="_blank" href="${url}">
											<bean:write name="text" property="<%=ISConstants.GET_TEXT%>"
												filter="false" />
										</html:link>
									</logic:equal>
									<%-- Insert a separator between texts. Actually an space. --%>
									<bean:message key="show.separator" />
									<%-- Final Text Attributes --%>
									<logic:iterate id="attrFinal" name="text"
										property="<%=ISConstants.GET_ATTRIBUTES_FINAL%>">
										<bean:write name="attrFinal"
											property="<%=ISConstants.GET_TAG_FINAL%>" filter="false" />
										<%-- END of Final Text Attributes --%>
									</logic:iterate>
									<%-- END of Text Iteration --%>
								</logic:iterate>

								<%-- Write Special Text --%>
								<%-- Final Attributes of paragraph --%>
								<logic:iterate id="attrFinal" name="paragraph"
									property="<%=ISConstants.GET_ATTRIBUTES_FINAL%>">
									<bean:write name="attrFinal"
										property="<%=ISConstants.GET_TAG_FINAL%>" filter="false" />
									<%-- END of Final Attributes of paragraph --%>
								</logic:iterate>
							</P>

							<%-- END of Paragraph Iteration --%>
						</logic:iterate>
					</logic:present>

					<%-- Logic to show or not the Observations button --%>
					<logic:equal name="showObservations" value="true">
						<P align="center">
							<html:textarea property="observations" cols="50" rows="3" />
						</P>

					</logic:equal>
					<logic:equal name="saveObservations" value="true">
						<html:image property="saveObservationsButton"
							page="/Images/send_info.gif" border="0" align="left"
							altKey="label.alternative.sendObs" />
					</logic:equal>
					<%-- Update of observations Success!!!--%>
					<logic:present name="updateObsSuccess">
						<logic:equal name="updateObsSuccess" value="true">
							<strong> <bean:message key="message.updateObj.sucess" />
							</strong>
						</logic:equal>
					</logic:present>
					<%-- Logic to show or not the submit button --%>
					<logic:equal name="showNextButton" value="true">
						<P>
							<html:image property="nextButton" pageKey="name.button.next"
								border="0" align="right" altKey="label.alternative.next" />
						</P>
					</logic:equal>
				</td>
			</tr>
		</table>
	</html:form>
</body>