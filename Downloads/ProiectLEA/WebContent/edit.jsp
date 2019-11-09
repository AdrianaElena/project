<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
  <br>
    <br>
    <br>
    <br>
    <br>
    <div class=container style="left: 60px; position: relative;">
        <div class=col-md-9>
            <div class=card>
                <div class=card-body>
 
                    <div class=row>
                        <div class=col-md-12>
 
                            <form action="EditProductServlet" method="post" name="editForm"
                                style="font-size: 130%; text-align: left; color: #000; font-weight: bold;">
                               
                                Product Name: <input type="text" name="nume" id="nume"
                                    value="<c:out value="${pbean.nume}" />"  <br> Price:
                                <input type="text" name="pret" id="pret"
                                    value="<c:out value="${pbean.pret}" /> "  <br>
                                Quantity: <input type="text" name="cantitate" id="cantitate"
                                    value="<c:out value="${pbean.cantitate}" />"  <br> <br>
 
                                <input type="submit" value="Submit">
 
 
 
                            </form>
 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</body>
</html>