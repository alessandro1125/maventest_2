<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="com.google.api.client.googleapis.auth.oauth2.GoogleCredential" %>
<%@ page import="java.io.IOException" %>
<html>
    <body>

        <%

            String token = null;

            try{
                GoogleCredential credential = GoogleCredential.fromStream(new FileInputStream("key.json")).createScoped
                        (Collections.singleton("https://www.googleapis.com/auth/userlocation.beacon.registry"));


                credential.refreshToken();

                token = credential.getAccessToken();


            } catch (FileNotFoundException ex) {
                ex.printStackTrace();
            } catch (IOException ex) {
                ex.printStackTrace();
            }

            /*
            JSONObject jsonObject;
            String accestoken = AccesToken.GetAccesToken(new FileInputStream("key.json"));
            HttpHelperConnection httpHelperConnection;
            httpHelperConnection = new HttpHelperConnection();
            String string = httpHelperConnection.getResponse("https://www.google.com", "GET", "", 5000, 5000);
            */
        %>
        <p>
            <%= token %> <br> Hello World from Servlet!!
        </p>
    </body>
</html>