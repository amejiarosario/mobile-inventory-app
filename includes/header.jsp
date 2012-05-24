<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
<%
Log activity_log = LogFactory.getLog("activity.tracking");
Log error_log = LogFactory.getLog("errorlog.tracking");
String err_msg = (String) request.getAttribute("err_msg");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Inventory App</title>
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
        <link rel="stylesheet" href="my.css" />
        <style>
            /* App custom styles */
        </style>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js">
        </script>
        <script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js">
        </script>
    </head>
    <body>
        <div data-role="page" data-theme="b" id="page1" style="background: url('http://t1.gstatic.com/images?q=tbn:ANd9GcTNV8CYXH4P5tW5tGMGhrxdTo-8UqFYQrs4FLjJ1s4Mkre6jHhNbNdlPOiL') repeat">
            <div data-theme="a" data-role="header">
                <h3>
                    Vicor Inventory App
                </h3>
            </div>