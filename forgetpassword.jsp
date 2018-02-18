<html>
    <head><title>Change Password</title></head>
    <body background="body.jpg">
        <h2>Change Password</h2>
        <form method="POST" action="forget.jsp">
            <table>
                <tr>
                    <td>Enter Stuff-Id: </td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Enter New password :</td>
                    <td><input type="password" name="newpwd"/></td>
                </tr>
                <tr>
                    <td>Enter Conform Password:  </td>
                    <td><input type="password" name="conpwd" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="submit" />
                    <td><input type="reset" value="Cancel" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>