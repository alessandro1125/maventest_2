<%@ page import="org.json.JSONObject"%>
<%@ page import="com.assetx.libraries.utils.HttpHelperConnection" %>
<%@ page import="com.assetx.libraries.beacon.AccesToken" %>
<%@ page import="java.io.FileInputStream" %>
<html>
    <body>

        <%
            JSONObject jsonObject;
            String accestoken = AccesToken.GetAccesToken(new FileInputStream("C://Users/aless/Desktop/BeaconGeisoft2018-5735f3dcc644.json"));
            HttpHelperConnection httpHelperConnection;
            httpHelperConnection = new HttpHelperConnection();
            String string = httpHelperConnection.getResponse("https://www.google.com", "GET", "", 5000, 5000);
        %>
        <p>
            <%= accestoken %> <br> Hello World from Servlet!!
        </p>
    </body>
</html>