<%@page import="entities.usersDiary"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" />
        <script src="js/sort.js"></script>
    </head>
    <body>
        <button onclick="location.href = 'logout'" type="submit" class="btn btn-primary">Log out</button>
        <div id="user">
            <p style="font-size: 26px">Ласкаво просимо до персонального кабінету, <%=request.getSession().getAttribute("tname")%></p>
            <hr><br>
            <div  class="box" style="float: left">
                <% ArrayList<String> faclist = (ArrayList<String>) (request.getSession().getAttribute("faclist"));%>
                <form action="group" method="post">
                    Оберіть групу, яку потрібно перевірити:
                    <select name="teacher_group_choice">
                        <%int i = 0;%>
                        <%for (String fl : faclist) {%>
                        <option value="<%=fl%>"><%=fl%></option>
                        <%i++;
                            }%>
                    </select>   
                    <input type="submit" action="choosegroup" method="post" value="Обрати">
                </form><br><br>
                <form action="teacher" method="post">
                    <table class="sortable" style="font-size: 15px;">
                        <thead>
                            <tr>
                                <th>Ім'я студента</th>
                                <th>Тема практики</th>
                                <th>Останнє оновлення</th>
                                <th>Показати щоденник</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>

                            </tr>
                        </tbody>
                    </table>
                </form><br>
            </div>
            <form action="mark" method="post" class="box">

                <div class="box">

                </div>

                <br><br><br>
                <div class="box">

                </div>

                <br><br><br>
                <div class="box">

                </div>
            </form>
        </div>
    </div>

</body>
</html>