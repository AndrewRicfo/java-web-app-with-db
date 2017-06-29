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
                            <div class="td">Ім'я студента</div>
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
                    1-й тиждень.<br>
                    Висновки:<br>


                    <% for (usersDiary usd : userslist) {
                            if (usd.getUserName() != null && usd.getUserName().contains(request.getSession().getAttribute("uname").toString())) {%>
                    <textarea name="1-week-results" rows="7" cols="50" style="margin-left: 10%;" readonly="readonly"><%=usd.getWeekOne()%></textarea>
                    <%if (usd.getMarkOne().equals("-1")) {
                            String markeOne = "";%>
                    <div style="font-size: 25px;">Оцінка за 1-й тиждень: <input type="text" name="1-week-teacher" size="4" value="<%=markeOne%>" pattern="\b(0*(?:[0-9]|[1][0]))\b" /></div>
                        <%} else {%>
                    <div style="font-size: 25px;">Оцінка за 1-й тиждень: <input type="text" name="1-week-teacher" size="4" value="<%=usd.getMarkOne()%>" pattern="\b(0*(?:[0-9]|[1][0]))\b" /></div>
                        <%}%>
                    <input type="submit" value="Зберегти" name="1-week-teacher-btn" style="margin-left: 120%"  />
                </div>

                <br><br><hr><br>
                <div class="box">
                    2-й тиждень.<br>
                    Висновки:<br>
                    <textarea name="2-week-results" rows="7" cols="50" style="margin-left: 10%;"  readonly="readonly"><%=usd.getWeekTwo()%></textarea>
                    <%if (usd.getMarkTwo().equals("-1")) {
                            String markeTwo = "";%>
                    <div style="font-size: 25px;">Оцінка за 2-й тиждень: <input type="text" name="2-week-teacher" size="4" value="<%=markeTwo%>" pattern="\b(0*(?:[0-9]|[1][0]))\b" /></div>
                        <%} else {%>
                    <div style="font-size: 25px;">Оцінка за 2-й тиждень: <input type="text" name="2-week-teacher" size="4" value="<%=usd.getMarkTwo()%>" pattern="\b(0*(?:[0-9]|[1][0]))\b" /></div>
                        <%}%>
                    <input type="submit" value="Зберегти" name="2-week-teacher-btn" style="margin-left: 120%" />
                </div>

                <br><br><hr><br>
                <div class="box">
                    3-й тиждень.<br>
                    Висновки:<br>
                    <textarea name="3-week-results" rows="7" cols="50" style="margin-left: 10%;"  readonly="readonly"><%=usd.getWeekThree()%></textarea> 
                    <%if (usd.getMarkThree().equals("-1")) {
                            String markeThree = "";%>
                    <div style="font-size: 25px;">Оцінка за 3-й тиждень: <input type="text" name="3-week-teacher" size="4" value="<%=markeThree%>" pattern="\b(0*(?:[0-9]|[1][0]))\b" /></div>
                        <%} else {%>
                    <div style="font-size: 25px;">Оцінка за 3-й тиждень: <input type="text" name="3-week-teacher" size="4" value="<%=usd.getMarkThree()%>" pattern="\b(0*(?:[0-9]|[1][0]))\b" /></div>
                        <%}%>
                    <input type="submit" value="Зберегти" name="3-week-teacher-btn" style="margin-left: 120%"  />
                </div>
                <%}
                    }%>
            </form>
        </div>

    </body>
</html>