using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Data;
using System.Web.Services;
using System.Web.Script.Services;
using System.Globalization;
using System.IO;
using System.Threading;
using System.Net;

namespace CBNLMS.Inputing._7
{
    public partial class picture_upload : System.Web.UI.Page
    {
        string emailz;
        SqlConnection sc = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Integrated Security=True;persist security info=True; User ID=sa;pwd=password1$; MultipleActiveResultSets=true");
        int maxFileSize = 500;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            else
            {

            }
            emailz = Session["Email"].ToString();
            if (!IsPostBack)
            {
                getstate();
                getactivity();
                getcommodity();
                alert.Visible = false;
                failed.Visible = false;
            }
            else { }
        }
        public void getstate()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select state from states", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList9.DataSource = ds;
            DropDownList9.DataBind();
            DropDownList9.DataTextField = "state";
            DropDownList9.DataValueField = "state";

            DropDownList9.DataBind();
            sc.Close();
        }
        public void getactivity()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select activity_name from farming_activities", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList2.DataSource = ds;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "activity_name";
            DropDownList2.DataValueField = "activity_name";

            DropDownList2.DataBind();
            sc.Close();
        }
        public void getcommodity()
        {
            sc.Open();
            SqlCommand com = new SqlCommand("select commodities from commodities", sc); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable ds = new DataTable();
            da.Fill(ds);  // fill dataset
            DropDownList3.DataSource = ds;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "commodities";
            DropDownList3.DataValueField = "commodities";

            DropDownList3.DataBind();
            sc.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string picturename = picturename1.Text;
            string ext2;
            if (!FileUpload1.HasFile)
            {

                Response.Write("<script>alert('Select at least 1 file');</script>");

            }


            else
            {
                int fileSize1 = FileUpload1.PostedFile.ContentLength;

                if (fileSize1 > (maxFileSize * 1024))
                {
                    string tempfn = Path.GetFileName(FileUpload1.FileName).ToString();
                    failed.Visible = true;
                    Span1.InnerHtml = "<b>" + tempfn + "</b>";
                    reason.InnerHtml = "<b> File is too Large. File limit is " + maxFileSize + "Kb</>";
                    return;
                }
                else
                {
                    sc.Open();
                    foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
                    {

                        // Label2.Text = "";
                        //Upload and save the file
                        string tempfn = Path.GetFileName(postedFile.FileName).ToString();
                        ext2 = System.IO.Path.GetExtension((postedFile.FileName).ToString());

                        //if (tempfn=WhiteSpaceTrimStringConverter.
                        // Console.WriteLine(File.Exists(csvPath) ? "File exists." : "");

                        if (ext2.ToLower() == ".jpg")
                        {
                            goto insert;
                        }

                        else if (ext2.ToLower() == ".jpeg")
                        {
                            goto insert;
                        }
                        else
                        {

                            string tempfn1 = Path.GetFileName(FileUpload1.FileName).ToString();
                            failed.Visible = true;
                            Span1.InnerHtml = "<b>" + tempfn + "</b>";
                            reason.InnerHtml = "<b> Only .jpeg and .jpg formats can be uploaded</>";
                            return;
                        }
                        insert:
                        string season = DropDownList1.SelectedItem.Value;
                        string state = DropDownList9.SelectedItem.Value;
                        string activity = DropDownList2.SelectedItem.Value;
                        string commodity = DropDownList3.SelectedItem.Value;
                        string picturetag = string.Empty;
                        if (activity == "Farm Mapping")
                        {
                            picturetag = "all mapping";

                        }
                        else if (activity == "Input Distribution")
                        {
                            picturetag = "all distribution";

                        }
                        else if (activity == "Farm Moniroring")
                        {
                            picturetag = "all monitoring";

                        }
                        else if (activity == "Harvest and Aggregation")
                        {
                            picturetag = "all harvest";

                        }
                        else
                        {
                            picturetag = "NULL";
                        }
                        string picturedescription = description1.Text;
                        string cvname = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        string cvcontenttype = FileUpload1.PostedFile.ContentType;
                        Stream cvfs = FileUpload1.PostedFile.InputStream;
                        BinaryReader cvbr = new BinaryReader(cvfs);
                        byte[] cvbytes = cvbr.ReadBytes((int)cvfs.Length);
                        //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                        // using (SqlConnection con = new SqlConnection(constr))
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/uploads/") + tempfn);
                        string imagepath = "../images/uploads/" + tempfn;
                        DateTime now = DateTime.Now;
                        SqlCommand cvquery = new SqlCommand("insert into pictures(picture_state,season,activity,commodity,picture_name,picture_description,picture_contenttype,picture_data,image_path,tag,uploader_email,date_uploaded) values(@state,@season,@activity,@commodity,@picname,@picdesc,@picctype,@picdata,@path,@tag,@uploaderemail,@datetime)", sc);
                        cvquery.Parameters.AddWithValue("@state", state);
                        cvquery.Parameters.AddWithValue("@season", season);
                        cvquery.Parameters.AddWithValue("@activity", activity);
                        cvquery.Parameters.AddWithValue("@commodity", commodity);
                        cvquery.Parameters.AddWithValue("@picname", picturename);
                        cvquery.Parameters.AddWithValue("@picdesc", picturedescription);
                        cvquery.Parameters.AddWithValue("@picctype", cvcontenttype);
                        cvquery.Parameters.AddWithValue("@picdata", cvbytes);
                        cvquery.Parameters.AddWithValue("@path", imagepath);
                        cvquery.Parameters.AddWithValue("@tag", picturetag);
                        cvquery.Parameters.AddWithValue("@uploaderemail", emailz);
                        cvquery.Parameters.AddWithValue("@datetime", now);
                        cvquery.ExecuteNonQuery();//postedFile.SaveAs(csvPath);//Save CV
                        sc.Close();
                        twohasfile:
                        if (!FileUpload2.HasFile)
                        {
                            sc.Open();
                            string useractivity = "Uploaded 1 Picture for: State - "+state+", Season - "+season+", Activity - "+activity+", Commodity - "+commodity+" ";
                            SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                            cmd3.Parameters.AddWithValue("@user", emailz);
                            cmd3.Parameters.AddWithValue("@activity", useractivity);
                            cmd3.Parameters.AddWithValue("@datetime", now);
                            cmd3.ExecuteNonQuery();
                            sc.Close();
                            picturename1.Text = "";
                            description1.Text = "";
                            alert.Visible = true;
                            uploaded.InnerHtml = "" + picturename + "" + ext2 + "</br> ";
                        }
                        else
                        {
                            int fileSize2 = FileUpload2.PostedFile.ContentLength;

                            string cvname2 = Path.GetFileName(FileUpload2.PostedFile.FileName);
                            if (fileSize2 > (maxFileSize * 1024))
                            {
                                picturename1.Text = "";
                                description1.Text = "";
                                alert.Visible = true;
                                uploaded.InnerHtml = "" + picturename + "" + ext2 + "</br> ";
                                failed.Visible = true;
                                Span1.InnerHtml = "<b>" + cvname + "</b>";
                                reason.InnerHtml = "<b> File is too Large. File limit is " + maxFileSize + "Kb</>";
                                // Label2.Text = "File size of CV Document is too large. Maximum file size permitted is " + maxFileSize + "KB";
                                return;
                            }
                            if (TextBox1.Text.ToString() == "")
                            {
                                picturename1.Text = "";
                                description1.Text = "";
                                alert.Visible = true;
                                uploaded.InnerHtml = "" + picturename + "" + ext2 + "</br> ";
                                failed.Visible = true;
                                Span1.InnerHtml = "<b>" + cvname + "</b>";
                                reason.InnerHtml = "<b> Picture Name is Required<b/>";
                                // Label2.Text = "File size of CV Document is too large. Maximum file size permitted is " + maxFileSize + "KB";
                                return;
                            }
                            else if (String.IsNullOrEmpty(description2.Value.ToString()))
                            {
                                picturename1.Text = "";
                                description1.Text = "";
                                alert.Visible = true;
                                uploaded.InnerHtml = "" + picturename + "" + ext2 + "</br> ";
                                failed.Visible = true;
                                Span1.InnerHtml = "<b>" + cvname + "</b>";
                                reason.InnerHtml = "<b> Picture Description is Required<b/>";
                                // Label2.Text = "File size of CV Document is too large. Maximum file size permitted is " + maxFileSize + "KB";
                                return;
                            }
                            else
                            {
                                sc.Open();
                                foreach (HttpPostedFile postedFile2 in FileUpload2.PostedFiles)
                                {

                                    // Label2.Text = "";
                                    //Upload and save the file
                                    string tempfn2 = Path.GetFileName(postedFile2.FileName).ToString();
                                    String ext = System.IO.Path.GetExtension((postedFile2.FileName).ToString());

                                    //if (tempfn=WhiteSpaceTrimStringConverter.
                                    // Console.WriteLine(File.Exists(csvPath) ? "File exists." : "");

                                    if (ext.ToLower() == ".jpg")
                                    {
                                        goto insert2;
                                    }

                                    else if (ext.ToLower() == ".jpeg")
                                    {
                                        goto insert2;
                                    }
                                    else
                                    {
                                        picturename1.Text = "";
                                        description1.Text = "";
                                        alert.Visible = true;
                                        uploaded.InnerHtml = "" + picturename + "" + ext2 + "</br> ";
                                        string tempfn1 = Path.GetFileName(FileUpload2.FileName).ToString();
                                        failed.Visible = true;
                                        Span1.InnerHtml = "<b>" + tempfn2 + "</b>";
                                        reason.InnerHtml = "<b> Only .jpeg and .jpg formats can be uploaded</>";
                                        return;
                                    }
                                    insert2:

                                    string picturename2 = TextBox1.Text;
                                    string picturedescription2 = description2.Value;
                                    string cvcontenttype2 = FileUpload2.PostedFile.ContentType;
                                    Stream cvfs2 = FileUpload2.PostedFile.InputStream;
                                    BinaryReader cvbr2 = new BinaryReader(cvfs2);
                                    byte[] cvbytes2 = cvbr2.ReadBytes((int)cvfs2.Length);

                                    FileUpload2.PostedFile.SaveAs(Server.MapPath("~/images/uploads/") + tempfn2);
                                    string imagepath2 = "../images/uploads/" + tempfn2;

                                    SqlCommand cvquery2 = new SqlCommand("insert into pictures(picture_state,season,activity,commodity,picture_name,picture_description,picture_contenttype,picture_data,image_path,tag,uploader_email,date_uploaded) values(@state,@season,@activity,@commodity,@picname,@picdesc,@picctype,@picdata,@path2,@tag2,@uploaderemail,@datetime)", sc);
                                    cvquery2.Parameters.AddWithValue("@state", state);
                                    cvquery2.Parameters.AddWithValue("@season", season);
                                    cvquery2.Parameters.AddWithValue("@activity", activity);
                                    cvquery2.Parameters.AddWithValue("@commodity", commodity);
                                    cvquery2.Parameters.AddWithValue("@picname", picturename2);
                                    cvquery2.Parameters.AddWithValue("@picdesc", picturedescription2);
                                    cvquery2.Parameters.AddWithValue("@picctype", cvcontenttype2);
                                    cvquery2.Parameters.AddWithValue("@picdata", cvbytes2);
                                    cvquery2.Parameters.AddWithValue("@path2", imagepath2);
                                    cvquery2.Parameters.AddWithValue("@tag2", picturetag);
                                    cvquery2.Parameters.AddWithValue("@uploaderemail", emailz);
                                    cvquery2.Parameters.AddWithValue("@datetime", now);
                                    cvquery2.ExecuteNonQuery();//postedFile.SaveAs(csvPath);//Save CV
                                    sc.Close();
                                    // Page.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:tester2();", true);
                                    //    Span1.InnerHtml = "" + picturename + "" + ext + "";
                                    sc.Open();
                                    string useractivity = "Uploaded 2 Pictures for: State - " + state + ", Season - " + season + ", Activity - " + activity + ", Commodity - " + commodity + "  Login";
                                    SqlCommand cmd3 = new SqlCommand("insert into user_activity (user_id,activity,date_time) values(@user,@activity,@datetime)", sc);
                                    cmd3.Parameters.AddWithValue("@user", emailz);
                                    cmd3.Parameters.AddWithValue("@activity", useractivity);
                                    cmd3.Parameters.AddWithValue("@datetime", now);
                                    cmd3.ExecuteNonQuery();
                                    TextBox1.Text = "";
                                    description2.Value = "";
                                    alert.Visible = true;
                                    uploaded.InnerHtml = "" + picturename + "" + ext2 + "</br> " + picturename2 + ext + "";
                                    picturename1.Text = "";
                                    description1.Text = "";
                                }

                            }


                        }

                    }

                }
            }
        }

    }
}