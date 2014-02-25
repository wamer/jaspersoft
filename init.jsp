<?xml version="1.0" encoding="UTF-8"?>
<jsp:root version="1.2" xmlns:f="http://java.sun.com/jsf/core"
	xmlns:h="http://java.sun.com/jsf/html"
	xmlns:jsp="http://java.sun.com/JSP/Page">
	<jsp:directive.page contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8" />
	<f:view>
		<html>
		<head>
		<title>Test iReport With JSF</title>
		</head>
		<body style="background-color: #fff4db">
		<h:form id="reportForm" target="report">
			<h:commandButton id="pdfButton" value="Visualiser PDF"
				styleClass="buttonStyle" action="#{InitPageBean.viewReportPDF}" />
			<h:commandButton id="excelButton" value="Visualiser EXCEL"
				styleClass="buttonStyle" action="#{InitPageBean.viewReportExcel}" />
		</h:form>
		</body>
		</html>
	</f:view>
</jsp:root>
