<%@ language='javascript'%>


<%
  var new_file;
  var data_file;

  function member_list(name,email,account,password)
  {
    var self=this;
    var base_info=new Array();
    self.base_info=[name,email,account,password];
  }

  var member=new Array();
  var array_temp=Array();

  new_file=new ActiveXObject("Scripting.FileSystemObject");
  data_file=new_file.OpenTextFile("D:\\ASP\\Data_file.txt",1);
  
  var i=0;

  // Response.Write(base_info_length);

  while(data_file.AtEndOfStream!=true){

      array_temp[0]=data_file.ReadLine();
      Response.Write('©m¦W: '+array_temp[0]+'<br/>');

      array_temp[1]=data_file.ReadLine();
      Response.Write('e-mail: '+array_temp[1]+'<br/>');

      array_temp[2]=data_file.ReadLine();
      Response.Write('±b¤á¦WºÙ: '+array_temp[2]+'<br/>');

      array_temp[3]=data_file.ReadLine();
      Response.Write('±K½X: '+array_temp[3]+'<br/>');

    member[i]=new member_list(array_temp[0],array_temp[1],array_temp[2],array_temp[3]);
    //Response.Write(member[i]);

    i++;
  }

  data_file.Close();
%>


<html>
  <head>
  </head>
  <body>
  </body>
</html>