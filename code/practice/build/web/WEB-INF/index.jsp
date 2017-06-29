<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" />
    </head>
    <body>
        <form id="auth_form" action="">
            <p class="aut">Аутентифікація</p>
            &nbsp&nbspЛогін&nbsp    
            <input type="text" name="login" size="30" autofocus /><br><br>
            Пароль
            <input type="password" name="password" value="" size="30" /><br><br>
            <input id="btn1" type="submit" value="Увійти" name="submit"/>
            
            <br><br><br>
            <a class="aut" href="registration.jsp">Зареєструватись</a>
        </form>

    </body>
</html>