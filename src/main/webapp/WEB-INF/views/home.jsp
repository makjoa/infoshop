<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p>${tableslist.seq}</p>
<p>${tableslist.id}</p>
<p>${tableslist.writer}</p>
<p>${tableslist.subject}</p>
<p>${tableslist.content}</p>
<p>${tableslist.when}</p>
</body>
</html>
