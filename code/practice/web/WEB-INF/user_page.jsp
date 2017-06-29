<%@page import="entities.usersDiary"%>
<%@page import="entities.Places"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>course</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css" />
        <style type="text/css">
            div#map_container{
                width:100%;
                height:200px;
            }
        </style>
        <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6dcxvKX6xqN-AC9_ElsHmdYMVRv0s324&callback=loadMap"></script>

        <script type="text/javascript">
            function loadMap() {

            <%if (!request.getSession().getAttribute("latitude").equals("") && !request.getSession().getAttribute("longtitude").equals("") && request.getSession().getAttribute("longtitude") != null && request.getSession().getAttribute("latitude") != null) {

            %>
                var latlng = new google.maps.LatLng(<%=Float.parseFloat(request.getSession().getAttribute("latitude").toString())%>, <%=Float.parseFloat(request.getSession().getAttribute("longtitude").toString())%>);
            <%} else {%>
                var latlng = new google.maps.LatLng(1.1, 7.7);
            <%}%>
                var myOptions = {
                    zoom: 15,
                    center: latlng,
                    scrollwheel: false,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("map_container"), myOptions);

                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "practice place"
                });

            }
        </script>

    </head>
    <body onload="loadMap()">

        <button onclick="location.href = 'logout'" type="submit" class="btn btn-primary">Log out</button>
        <div id="user">
            <% if (!(request.getSession().getAttribute("utheme").equals(""))) {%>
            <div class="box">
                Місце проходження практики: <%=request.getSession().getAttribute("prplace")%><br>
                За адресою: <%=request.getSession().getAttribute("pladress")%><br>
                Ваша тема: <%=request.getSession().getAttribute("utheme")%>
            </div>
            <div class="box"><div id="map_container"></div></div>

            <%} else{%>
            <form action="placetheme" method="post">
                <div class="box">
                    <% if (request.getSession().getAttribute("prplace").equals("")) {%>
                    Оберіть місце проходження практики<br>
                    <select name="practice-place">
                        <%ArrayList<Places> placelist = (ArrayList<Places>) request.getSession().getAttribute("placelist");%>
                        <%for (Places s : placelist) {%>
                        <option><%=s.getPlace()%></option>
                        <%}%>
                    </select>&nbsp;&nbsp;&nbsp;
                    <%} else {%>
                    Місце проходження практики: <%=request.getSession().getAttribute("prplace")%><br>
                    За адресою: <%=request.getSession().getAttribute("pladress")%><br>
                    <%}%>
                    Введіть тему навчальної практики<br>
                    <input type="text" size="50" name="theme" >
                    <input type="submit" value="Підтвердити" name="submit-practice-place" />
                </div>
                <div class="box" style="height: 200px"></div>
            </form>
            <%}%>
            <div class="clear">
                <br><hr><br>
                <%ArrayList<usersDiary> userslist = (ArrayList<usersDiary>) request.getSession().getAttribute("usersdiary");%>
                <%for (usersDiary ud : userslist) {%>
                <form action="diary" method="post">
                    <div class="box">
                        1-й тиждень.<br>
                        Висновки:<br>

                        <textarea name="1-week-results" rows="7" cols="50" style="margin-left: 10%;"><%=ud.getWeekOne()%></textarea>
                        <input type="submit" value="Зберегти" name="1-week-results-submit"   />
                    </div>
                    <div class="box">
                        <% if (ud.getMarkOne().equals("-1")) {%>
                        <div style="font-size: 25px;">Оцінка викладача за 1-й тиждень: -/10</div>
                        <%} else {%>
                        <div style="font-size: 25px;">Оцінка викладача за 1-й тиждень: <%=ud.getMarkOne()%>/10</div>
                        <%}%>                    
                    </div>

                    <br><br><hr><br>
                    <div class="box">
                        2-й тиждень.<br>
                        Висновки:<br>
                        <textarea name="2-week-results" rows="7" cols="50" style="margin-left: 10%;"><%=ud.getWeekTwo()%></textarea>
                        <input type="submit" value="Зберегти" name="2-week-results-submit"  />
                    </div>
                    <div class="box">
                        <% if (ud.getMarkTwo().equals("-1")) {%>
                        <div style="font-size: 25px;">Оцінка викладача за 2-й тиждень: -/10</div>
                        <%} else {%>
                        <div style="font-size: 25px;">Оцінка викладача за 2-й тиждень: <%=ud.getMarkTwo()%>/10</div>
                        <%}%>
                    </div>

                    <br><br><hr><br>
                    <div class="box">
                        3-й тиждень.<br>
                        Висновки:<br>
                        <textarea name="3-week-results" rows="7" cols="50" style="margin-left: 10%;"><%=ud.getWeekThree()%></textarea>
                        <input type="submit" value="Зберегти" name="3-week-results-submit"  />
                    </div>
                    <div class="box">
                        <% if (ud.getMarkThree().equals("-1")) {%>
                        <div style="font-size: 25px;">Оцінка викладача за 3-й тиждень: -/10</div>
                        <%} else {%>
                        <div style="font-size: 25px;">Оцінка викладача за 3-й тиждень: <%=ud.getMarkThree()%>/10</div>
                        <%}%>                    
                    </div>
                </form>
                <br><br><hr><br>
                <%  int res = 0;
                    String mark_three = ud.getMarkThree().toString();
                    String mark_two = ud.getMarkTwo().toString();
                    String mark_one = ud.getMarkOne().toString();
                    if (mark_three.equals("-1")) {
                        res++;
                    }
                    if (mark_two.equals("-1")) {
                        res++;
                    }
                    if (mark_one.equals("-1")) {
                        res++;
                    }
                    res = res + Integer.parseInt(mark_one) + Integer.parseInt(mark_two) + Integer.parseInt(mark_three);
                    if (res == 0) {
                %>
                <p style="text-align: center; font-size: 28px; color: green">Результат: -/30</p>
                <%} else {%>
                <p style="text-align: center; font-size: 28px; color: green">Результат: <%=res%>/30</p>
                <%}%>
            </div>

        </div>
        <%}%>
    </body>
</html>