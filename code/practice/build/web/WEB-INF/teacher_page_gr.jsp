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
        <style>
            .table
            {
                display:table;
            }
            .thead
            {
                display:table-header-group;
                background-color:#eee;
                color:#000000;
            }
            .tbody
            {
                display:table-row-group;
            }
            .tr
            {
                display:table-row;
            }
            .td
            {
                display:table-cell;
            }
        </style>
    </head>
    <body>
        <button onclick="location.href = 'logout'" type="submit" class="btn btn-primary">Log out</button>
        <div id="user">
            <p style="font-size: 26px">Ласкаво просимо до персонального кабінету, <%=request.getSession().getAttribute("tname")%></p>
            <hr><br>
            <div  class="box" style="float:left">
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
                    <input type="submit" value="Обрати">
                </form><br><br>
                <div class="table sortable" style="font-size: 15px;">
                    <div class="thead">
                        <div class="tr">
                            <div class="td" >Ім'я студента</div>
                            <div class="td">Тема практики</div>
                            <div class="td">Останнє оновлення</div>
                            <div class="td">Показати щоденник</div>
                        </div>
                    </div>
                    <div class="tbody">
                        <%ArrayList<usersDiary> userslist = (ArrayList<usersDiary>) request.getSession().getAttribute("usersdiary");%>
                        <% if (!userslist.isEmpty()) {%>
                        <%for (usersDiary ud : userslist) {%>
                        <form action="teacher" method="post" class="tr">
                            <div class="td"><%=ud.getUserName()%></div>
                            <input hidden name="uname" value="<%=ud.getUserName()%>"/>
                            <div class="td"><%=ud.getUserTheme()%></div>
                            <div class="td"><%=ud.getLastUpdate()%></div>
                            <div class="td action"><input type="submit" value="Показати"/></div>
                        </form>
                        <%}%>
                        <%}%>
                    </div>
                </div>
            </div>
            <br>
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

    </body>
</html>