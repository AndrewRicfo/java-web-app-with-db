<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" />
    </head>
    <body>
        <form  action="registration" method="post" id="reg_form">
            <p style='font-size: 25px;'>Реєстрація</p>
            <br><br>
            Прізвище&nbsp
            <input type="text" name="name1" value="" size="50" 
                   onkeyup="return proverka(this);"
                   onchange="return proverka(this);" /><br><br>
            
            &nbspІм'я&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="text" name="name2" value="" size="50" 
                   onkeyup="return proverka(this);"
                   onchange="return proverka(this);" /><br><br>
            По-батькові&nbsp
            <input type="text" name="name3" value="" size="50" 
                   onkeyup="return proverka(this);"
                   onchange="return proverka(this);" /><br><br>
            Логін&nbsp&nbsp&nbsp
            <input type="text" name="logn" value="" size="50" /><br><br>
            Пароль
            <input type="password" name="pwd" value="" size="50" /><br><br>
            Факультет
            <select name="fac">
                <option value="ФПМ">ФПМ</option>
                <option value="ІПСА">ІПСА</option>
                <option value="ФМФ">ФМФ</option>
            </select><br><br>
            Група&nbsp&nbsp&nbsp
            <input type="text" name="group" size="50" placeholder="KM-31"
                   pattern="[А-Я]{2}-[0-9]{2}"/><br><br><br><br>
            
            <input type="submit" value="Зареєструватись" name="registr" />
            <input type="reset" value="Очистити" name="clear" />
            <a href="index"><input type="button" value="Назад" name="back" /></a>
            
        </form>
        <script>
            function proverka(input) {
            input.value = input.value.replace(/[\d-=+./\\)(!@#$%^&*_<>]/g, '');
            };
        </script>   
    </body>
</html>