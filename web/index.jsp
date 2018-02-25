<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.assetx.libraries.utils.HttpHelperConnection" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.assetx.libraries.beacon.AccesToken" %>
<html>
    <body>

        <%

            JSONObject jsonObject;
            String accestoken = AccesToken.GetAccesToken(new FileInputStream("key.json"));
            HttpHelperConnection httpHelperConnection;
            httpHelperConnection = new HttpHelperConnection();
            String string = httpHelperConnection.getResponse("https://www.google.com", "GET", "", 5000, 5000);

        %>
        <p>
            <%= accestoken %> <br> Hello World from Servlet2!!!
        </p>
    </body>
</html>