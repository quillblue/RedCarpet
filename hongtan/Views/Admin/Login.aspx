<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>管理后台登陆</title>
</head>
<body>
    <div>
        <%Html.BeginForm("LoginSubmit", "Admin", FormMethod.Post); %>
            <input type="password" name="Passwd" />
            <input type="submit" />
        <%Html.EndForm(); %>
    </div>
</body>
</html>
