<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addmessage.aspx.cs" Inherits="addmessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Add message to guestbook</title>

       <style type="text/css">

a{
text-decoration:none;
color:Orange;
}

a:visited 
{ text-decoration: none;
color:#B82424;}
a:active 
{text-decoration: none;
color:#004444; 
}


.butt{
border: 0px solid #000000;
background-image: url("btnAdd.png");
background-repeat: no-repeat;
background-position: center;
padding:0px;
} 


  </style>

<script type="text/javascript" language="javascript">
<!--

    var loc;
    function refreshIMG() {

        document.getElementById("cp").src = document.getElementById("cp").src + '?' + '23432';

    }
    function addEmotion(smile) {

            str = document.getElementById('txtMessage').value;
            GetCursorLocation();


            if (document.all) {
                document.getElementById('txtMessage').innerText = str.substring(0, loc) + smile + str.substring(loc, str.length);
            }
            else {

                document.getElementById('txtMessage').value = str.substring(0, loc) + smile + str.substring(loc, str.length);
            }

            showPreview();


            setCaretPosition(document.getElementById('txtMessage'), loc + smile.length);
  }


  function setCaretPosition(ctrl, pos) {
      if (ctrl.setSelectionRange) {
          ctrl.focus();
          ctrl.setSelectionRange(pos, pos);
      }
      else if (ctrl.createTextRange) {
          var range = ctrl.createTextRange();
          range.collapse(true);
          range.moveEnd('character', pos);
          range.moveStart('character', pos);
          range.select();
      }
  }


    function GetCursorLocation() {
        CurrentTextBox = document.getElementById('txtMessage');

        var CurrentSelection, FullRange, SelectedRange, LocationIndex = -1;
        if (typeof CurrentTextBox.selectionStart == "number") {
            loc=CurrentTextBox.selectionStart;
        }
        else if (document.selection && CurrentTextBox.createTextRange) {


            CurrentTextBox.focus();
            var Sel = document.selection.createRange();
            Sel.moveStart('character', -CurrentTextBox.value.length);
            loc = Sel.text.length;

        }

    }



    function validate(email) {


        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var address = document.forms["form1"].elements[email].value;
        if (reg.test(address) == false) {

            document.getElementById('lblWrongEmail').style.visibility = "visible";

            return false;
        }
        else {
            document.getElementById('lblWrongEmail').style.visibility = "hidden";
        }

    }


   function showPreview(){
  

        preview = document.getElementById('divPreview');
        texxt = "";
        if (document.all) {
            texxt = document.getElementById('txtMessage').innerText;
        }
        else {
            texxt = document.getElementById('txtMessage').value;
        }


            if (texxt.length > (500 - 1))  return false;

            texxt = texxt.replace(/&/g, '&amp;');
            texxt = texxt.replace(/</g, '&lt;');
            texxt = texxt.replace(/"/g, '&quot;');
            texxt = texxt.replace(/>/g, '&gt;');

        texxt = texxt.replace(/\:\)/g, "<img src='emotions/smile.gif'>");
        texxt = texxt.replace(/\;\)/g, "<img src='emotions/wink.gif'>");
        texxt = texxt.replace(/\:\(/g, "<img src='emotions/sad.gif'>");
        texxt = texxt.replace(/:robot:/g, "<img src='emotions/robot.gif'>");
        texxt = texxt.replace(/:oops:/g, "<img src='emotions/oops.gif'>");
        texxt = texxt.replace(/:inLove:/g, "<img src='emotions/inLove.gif'>");
        texxt = texxt.replace(/:fingerUp:/g, "<img src='emotions/fingerUp.gif'>");
        texxt = texxt.replace(/:fingerDown:/g, "<img src='emotions/fingerDown.gif'>");
        texxt = texxt.replace(/:angel:/g, "<img src='emotions/angel.gif'>");
        texxt = texxt.replace(/:angry:/g, "<img src='emotions/angry.gif'>");

        texxt = texxt.replace(/\n/g, "<br />");

        document.getElementById('divPreview').innerHTML = "<p>" + texxt + "</p>";

    }

//-->
</script> 

</head>
<body>
    <form id="form1" runat="server" onsubmit="javascript:return validate('txtEmail');">
    <div>
    <center>
    
    <div>
    <table><tr>
        <td><asp:Label ID="Label1" runat="server" Text="Your name"></asp:Label></td>
        <td>
        <asp:TextBox ID="txtName" runat="server" Width="200" MaxLength="40"></asp:TextBox>
        </td>
        <td></td>
        </tr><tr>
        <td><asp:Label ID="Label2" runat="server" Text="Your e-mail"></asp:Label></td>
        <td>
        <asp:TextBox ID="txtEmail" runat="server" Width="200" MaxLength="40"></asp:TextBox>
        </td>
         <td><p id="lblWrongEmail" style="color: #EE0000; visibility: hidden;">wrong e-mail</p></td>   
    </tr></table>
    </div>


<div style="width:770px;margin:auto">
     <asp:Label ID="Label3" runat="server" Text="Your message" Width="250"></asp:Label><br />
     

<div style="width:510px; float:left;">
        <asp:TextBox ID="txtMessage" runat="server" Width="500px" Height="300px" 
            TextMode="MultiLine" MaxLength="50" onkeyup="return showPreview(event)"></asp:TextBox>
 </div>

 <div style="width:255px; float:left;">
 <table>
 <tr>
 <td><img src="emotions/angel.gif" alt="Angel" style="border:none" onclick="addEmotion(':angel:')" /></td>
 <td><img src="emotions/angry.gif" alt="Angry" style="border:none" onclick="addEmotion(':angry:')" /></td>
 </tr>
 <tr>
 <td><img src="emotions/fingerUp.gif" alt="Cool" style="border:none" onclick="addEmotion(':fingerUp:')" /></td>
 <td><img src="emotions/fingerDown.gif" alt="Sucks" style="border:none" onclick="addEmotion(':fingerDown:')" /></td>
 </tr>
  <tr>
 <td><img src="emotions/inLove.gif" alt="Love" style="border:none" onclick="addEmotion(':inLove:')" /></td>
 <td><img src="emotions/oops.gif" alt="Oops" style="border:none" onclick="addEmotion(':oops:')" /></td>
 </tr>
   <tr>
 <td><img src="emotions/robot.gif" alt="Robot Smile" style="border:none" onclick="addEmotion(':robot:')" /></td>
 <td><img src="emotions/sad.gif" alt="Sad" style="border:none" onclick="addEmotion(':(')" /></td>
 </tr>
   <tr>
 <td><img src="emotions/smile.gif" alt="Smile" style="border:none" onclick="addEmotion(':)')" /></td>
 <td><img src="emotions/wink.gif" alt="Wink" style="border:none" onclick="addEmotion(';)')" /></td>
 </tr>
 </table>
    </div>

    </div>

    <div id="divPreview" style="clear:both;width:550px">
    
    </div>

    <table><tr><td>
    <img height="40" alt="5 latin letters" src="kartinkaCaptcha.aspx" width="150" style="margin:0;padding:0"
            id="cp" /></td><td>
    <img height="32" alt="Update image" src="refresh.png" width="32" id="IMG1" style="margin:0;padding:0" onclick="refreshIMG()" />
            </td><td>
       <asp:TextBox runat="Server" ID="txtCaptcha" Width="100px" Font-Size="X-Large" 
                style="margin:0" MaxLength="5"></asp:TextBox>
       </td>
       <td>
           <asp:Label ID="lblWrongCaptcha" runat="server" Text="" ForeColor="#EE0000"></asp:Label>
       </td>
       </tr>
       </table>

       <br />
        <asp:Button ID="btnAdd" runat="server" Width="175" Height="57"
            onclick="btnAdd_Click" CssClass="butt" />
    </center>
    </div>
    </form>


</body>
</html>
