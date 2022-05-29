<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Foro.aspx.cs" Inherits="Mizhouse.Presentacion.Foro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Foro</title>
</head>
<body>
    
<script>
    function ShowPreview(input) {
        if (input.files && input.files[0]) {
            var extension = input.files[0].name.split('.').pop().toLowerCase();
            var ImageDir = new FileReader();
            ImageDir.onload = function (e) {
                if (extension == "pdf") {
                    $("img").attr('src', '');
                    $("iframe").attr('src', e.target.result);
                    $("iframe").attr('Width', '400px');
                    $("iframe").attr('height', '400px');
                }
                if (extension == 'png' || extension == 'jpg' || extension == 'jpeg') {

                    $("img").attr('src', e.target.result);
                    $("iframe").attr("src", "");
                }
            }

            ImageDir.readAsDataURL(input.files[0]);

        }

    }
</script>
    <form id="form1" runat="server">
        <style>
            .row {
                margin-bottom: 8px;
            }
        </style>
        <div class="row">
            <div class="col-lg-12">
                <h3>Avisos</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <asp:TextBox ID="txttitulo" runat="server" Text="" CssClass="form-control" placeholder="Titulo"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <asp:TextBox ID="txtmensaje" runat="server" Text="" CssClass="form-control" placeholder="Mensaje"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <asp:Label ID="Label1" runat="server">Puedes agregar un archivo si quieres</asp:Label>
                <asp:Image ID="img" runat="server"  Width="400px" />
            <iframe id="iframe" runat="server" width="0" height="0" style="border:none"></iframe>
            <asp:FileUpload ID="archivofile" runat="server"  onchange="ShowPreview(this)" CssClass="btn btn-morado" />
               

            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <asp:Label ID="Label" runat="server"></asp:Label>
                <asp:Button ID="btnguardar" runat="server" Text="Guardar" OnClick="btnguardar_Click" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <asp:GridView ID="gvAvisos" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
