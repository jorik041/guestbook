using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;


public partial class kartinkaCaptcha : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {


        int posX;

        Bitmap objBMP = new Bitmap(150, 40);

        Graphics objGraphics = Graphics.FromImage(objBMP);

        objGraphics.Clear(Color.Black);

        objGraphics.TextRenderingHint = TextRenderingHint.AntiAlias;




        //' Configure font to use for text

        Font objFont = new Font("Arial", 18, FontStyle.Italic);

        string randomStr = "";

        char[] myArray = new char[5];

        int x;



        //That is to create the random # and add it to our string

        Random autoRand = new Random();

        for (x = 0; x < 5; x++)
        {

            myArray[x] = System.Convert.ToChar(autoRand.Next(65, 90));

            randomStr += (myArray[x].ToString());

        }



        //This is to add the string to session, to be compared later

        Session.Add("AlexCapStr", randomStr);


        //objGraphics.RotateTransform(-5);
        Random transRand = new Random();


        System.Drawing.Drawing2D.Matrix myMatrix = new System.Drawing.Drawing2D.Matrix();

        int randInt = System.Convert.ToInt32(transRand.Next(0, 2));

        if (randInt == 1)
        {
            myMatrix.Shear(0.9f, 0);
            objGraphics.MultiplyTransform(myMatrix);
            posX = 11;
        }
        else
        {
            myMatrix.Shear(-0.75f, 0);
            objGraphics.MultiplyTransform(myMatrix);
            posX = 42;
        }


        RectangleF canvas = new RectangleF(posX, 5, 150, 40);

        //' Write out the text

        objGraphics.DrawString(randomStr, objFont, Brushes.Orange, canvas);



        //' Set the content type and return the image

        Response.ContentType = "image/GIF";

        objBMP.Save(Response.OutputStream, ImageFormat.Bmp);

        objFont.Dispose();

        objGraphics.Dispose();

        objBMP.Dispose();



    }


}