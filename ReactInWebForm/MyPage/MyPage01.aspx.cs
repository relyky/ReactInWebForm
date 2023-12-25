using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReactInWebForm.MyPage01
{
  public partial class MyPage01 : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      if(!this.IsPostBack)
      {
      }

      // will render react component
      string renderScript =$"renderMyQRCode('{MyQRCode.ClientID}', '{TextBox1.Text}'); ";
      ScriptManager.RegisterStartupScript(this, this.GetType(), "", renderScript, true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      
    }
  }
}