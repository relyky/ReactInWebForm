<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyPage02.aspx.cs" Inherits="ReactInWebForm.MyPage.MyPage02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>My Page 02</title>

  <asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/modernizr") %>
  </asp:PlaceHolder>

  <webopt:BundleReference runat="server" Path="~/Content/css" />
  <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
  <script src="/Scripts/RxCom/index.bundle.js"></script>
  <script>
    <%-- init --%>
    function handleCounter(newCount) {
      console.log('handleCounter', newCount);

       <%-- To response event --%>
      const myEventList = document.getElementById('myEventList');
      const item = document.createElement('li');
      item.innerText = `handleCounter → ${newCount}`;
      myEventList.appendChild(item);
    }
  </script>
</head>
<body>
  <h1>My Page 02</h1>

  <asp:Panel ID="MyCounter" runat="server">MyCounter first rendered.</asp:Panel>

  <web-counter init-count="31" on-change="handleCounter"></web-counter>

  <h6>Event List</h6>
  <ul id="myEventList">
  </ul>

  <script>
    <%-- init --%>
    const myTarget = new EventTarget()
    myTarget.addEventListener("my-counter-up", function (event) {
      console.log('my-counter-up', { event });

       <%-- To response event --%>
      const myEventList = document.getElementById('myEventList');
      const item = document.createElement('li');
      item.innerText = `type:${event.type}, detail:${event.detail}`;
      myEventList.appendChild(item);
    });

    renderMyCounter(<%= $"'{MyCounter.ClientID}'" %>, 17, myTarget);
  </script>

</body>
</html>
