<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course</title>
        <link rel="stylesheet" href="styles/style.css" />
        <script type="text/javascript">
            window.onload = function () {
                a = <%=request.getSession().getAttribute("roleError")%>;
            <%request.getSession().removeAttribute("roleError");%>
                b = <%=request.getSession().getAttribute("authError")%>;
            <%request.getSession().removeAttribute("authError");%>
                c = <%=request.getSession().getAttribute("regError")%>;
            <%request.getSession().removeAttribute("regError");%>

                if (a === 0) {
                    alert("Ви не викладач. Оберіть параметр студента із випадаючого списку при авторизації");
                }
                if (a === 1) {
                    alert("Ви не студент. Оберіть параметр викладача із випадаючого списку при авторизації");
                }
                if (b === 1) {
                    alert("Введено невірні дані. Спробуйте ще раз!");
                }
                if (c === 1) {
                    alert("Такий користувач вже існує. Авторизуйтесь!");
                }
                if (c === 2) {
                    alert("Такої групи немає!");
                }
            }
        </script>
    </head>
    <body>
        <form action="login" method="post" id="auth_form">
            <p class="aut">Аутентифікація</p>
            &nbsp&nbspЛогін&nbsp
            <input type="text" name="login" size="30" autofocus required><br><br>
            Пароль
            <input type="password" name="password" size="30" required><br><br>
            <select name="lrole">
                <option value="0">Студент</option>
                <option value="1">Викладач</option>
            </select><br><br>
            <input id="btn1" type="submit" value="Увійти">
            <br><br><br>
            <a class="aut" href="registration">Зареєструватись</a>
        </form>
    </body>
</html>
