<%@ language='javascript'%>
<html>
  <head>
    <title>Table ver.2</title>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  </head>

  <body>
    �@�����<input id='NumOfRowInput' size='10' placeholder="type in number"></input>�����<br/><br/>
    

    <div>��<input id='PageSelect' type='text' size='10'  placeholder="type in number"/>��</div>

    <div style="opacity:0.5;position:absolute;left:50px;width:300px;height:150px;background-color:#40B3DF"></div>

    <div style="font-family:verdana;padding:20px;border-radius:10px;border:10px solid #EE872A;">

      <div style="opacity:0.3;position:absolute;left:120px;width:100px;height:200px;background-color:#8AC007"></div>

      <h3>���y�M��</h3>

      <div style="letter-spacing:12px;">Book List</div>

      <div style="color:#40B3DF;">Team
        <span style="background-color:#B4009E;color:#ffffff;">C</span>
      </div>

      <div style="color:#000000;">and more...</div>

    </div>

    <div id='ListDiv' >  <!--style='float:left'-->  <!--���Ҥ����V���a.��r��¶�b�k��-->
      <table id='ListTable' border='1'>
        <tr>
          <td>no.</td>
          <td>�ѦW</td>
          <td>����</td>
          <td>�w�s</td>
        </tr>
      </table>
    </div>

    <div id='ShowSingle' style='float:left'>  <!--style='float:left'-->

    <h3>���y�ԲӸ��</h3>    

      <table border='1'>
        <tr>
          <td>no.</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>�ѦW</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>����</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>�w�s</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>����</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>�X����</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>�X�����</td>
          <td><input size='3'/></td>
        </tr>
      </table>

      <div>
        <input id='PurchaseButton' type='button' value='�I���ʶR' onclick='PreparePurchase()' />
      </div>

    </div>

    <div id='CarDiv' style='float:left'> 
        <h3>�ʪ���</h3> 
        <table border='1' id='ShoppingCarList'>
          <tr>
            <td>no.</td>
            <td>�ѦW</td>
            <td>����</td>
            <td>�w�s</td>
            <td>�ʶR�ƶq</td>
          </tr>
        </table>

      <div>
        <input id='ShowCar' type='button' value='���/�����ʪ���' onclick='ShowCar()' />
        <input id='Buy' type='button' value='�T�{�ʶR' onclick='Purchase()' />
      </div>
      
    </div>

    <div id='ShowInfo' style='display:none'><p></p></div>
    
  </body>

</html>


<script>
  var NumOfRow;
  $('#NumOfRowInput').keyup(                                //��ƭ��ܰʮɡA�o�ͧ@��
                       function(){
                         Row0();
                         NumOfRow=$('#NumOfRowInput').val();
                       }
                     )

  var mouseX;
  var mouseY;
  $(document).mousemove( function(e) {
     mouseX = e.pageX; 
     mouseY = e.pageY;
  });

//********************************************************object********************************************************
  //#region �ifunction�jconstructor-book information
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //*****************************************************************************  

  function BaseInfoType(no,name,price,stock,Class,Publisher,PublishDate){
    var self=this;
    var BaseInfo=new Array();
    self.BaseInfo=[no,name,price,stock,Class,Publisher,PublishDate];
  }
  //#endregion


  var Info20=new Array();


</script>

<%    //ASP���o���y���
  var new_file;
  var data_file;


  var array_temp=Array();

  new_file=new ActiveXObject("Scripting.FileSystemObject");
  data_file=new_file.OpenTextFile("D:\\ProgramDesign\\BookData.txt",1);
  
  var i=0;

  while(data_file.AtEndOfStream!=true){

      array_temp[0]=data_file.ReadLine();
      //Response.Write('�s��: '+array_temp[0]+'<br/>');
      array_temp[1]=data_file.ReadLine();
      //Response.Write('�ѦW: '+array_temp[1]+'<br/>');
      array_temp[2]=data_file.ReadLine();
      //Response.Write('����: '+array_temp[2]+'<br/>');
      array_temp[3]=data_file.ReadLine();
      //Response.Write('�w�s: '+array_temp[3]+'<br/>');
      array_temp[4]=data_file.ReadLine();
      //Response.Write('����: '+array_temp[4]+'<br/>');
      array_temp[5]=data_file.ReadLine();
      //Response.Write('�X����: '+array_temp[5]+'<br/>');
      array_temp[6]=data_file.ReadLine();
      //Response.Write('�X�����: '+array_temp[6]+'<br/>');

    %>
    <script>
      
      Info20[<%=i%>]= new BaseInfoType('<%=array_temp[0]%>','<%=array_temp[1]%>','<%=array_temp[2]%>','<%=array_temp[3]%>','<%=array_temp[4]%>','<%=array_temp[5]%>','<%=array_temp[6]%>');
                      
    </script>
    <%
    i++;
  }

  data_file.Close();//ASP����
%>       
  

  <script>
  //#region �ifunction�jconstructor-shopping car
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : No�O�Ѫ��s��,Number�O�n�R���ƶq
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //*****************************************************************************  
  function ShoppingCarType(No,Number){
    var self=this;                                                                                              
    self.No=No;
    self.Number=Number;
  }
  var ShoppingCarItem=new Array();
 
  </script>
    <%    //ASP���o�ʪ������
    var car_data_file;

    car_data_file=new_file.OpenTextFile("D:\\ProgramDesign\\CarData.txt",1);
  
    var car_i=0;
    var Car_No_temp;
    var Car_Number_temp;

    while(car_data_file.AtEndOfStream!=true){
  
        Car_No_temp=car_data_file.ReadLine();
        Car_Number_temp=car_data_file.ReadLine();
    %>
  
    <script>

      //�NŪ�쪺��Ưd�bJS��
      ShoppingCarItem[<%=car_i%>]=new ShoppingCarType('<%=Car_No_temp%>','<%=Car_Number_temp%>');

    </script>

    <%
    car_i++;
    }

    car_data_file.Close();//ASP����
    %> 

    <script>

  //#endregion

  //********************************************************object over********************************************************/



  //#region �ifunction�jshow info by no
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function CreateTable(no){
    $('#ListTable').append(
                      '<tr>'+
                        '<td>'+Info20[no].BaseInfo[0]+'</td>'+
                        '<td>'+Info20[no].BaseInfo[1]+'</td>'+
                        '<td>'+Info20[no].BaseInfo[2]+'</td>'+
                        '<td>'+Info20[no].BaseInfo[3]+'</td>'+
                      '</tr>'
                    );

    var TrNo;
    TrNo=(no+1)%NumOfRow;
    if(TrNo==0){
      TrNo=NumOfRow;
    }
    PrepareDraggable(TrNo);
    colorful(TrNo);
  }
  //#endregion



  //#region �ifunction�jpage
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  $('#PageSelect').keypress(function(event){
    var keycode=(event.keyCode ? event.keyCode : event.which);
    if(keycode=='13'){                                               //13 means enter
      var page=WhatPage();
      Rows10(page);
    }
  });


  function WhatPage(){
    var page = $('#PageSelect').val();
    return page;
  }
  //#endregion

  //#region �ifunction�jcreate 10 rows  (NumOfRow=10 : 10 rows per one page)
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function Rows10(page){
    if($('#ListTable tr').length>1){
      Row0();
    }
    var no=(page-1)*NumOfRow;
    for(var i=0;i<NumOfRow;i++){
      CreateTable(no++);
    }
  }
  //#endregion

  //#region �ifunction�jdel row
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function DelRow(order){
    $('#ListTable tr:eq('+order+')').remove();
  }
  //#endregion

  //#region �ifunction�jdel 10 rows
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function Row0(){                                                     //notice!!!  List may not be fulled  //already ok
    var last=($('#ListTable tr').length)-1;
    for(var i=0;i<NumOfRow;i++){
      if(last>0){                                 //need a condition to decide all informations are deleted or not  //already OK
        DelRow(last--);
      }
    }
  }
  //#endregion

  //#region �ifunction�jon key down,prepare draggable
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  
  var draggabling=0;

  function PrepareDraggable(TrNo){

    $('#ListTable tr:eq('+TrNo+')').mouseenter(
                                      function(){
                                        $("#ShowInfo").parent().css({position: 'relative'});
                                        $('#ShowInfo').css({'top':mouseY-30,'left':mouseX-30 , position:'absolute'}).fadeIn();
                                        DraggableP(TrNo);
                                        DroppableValue(TrNo);
                                      }
                                    );  
  }
  $(document).mousedown(
                function(){
                  draggabling=1;
                }
              );

  //#endregion

  //#region �ifunction�jon key  up, draggable div disappear
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
/****
  $('#ListDiv').mouseleave(
                    function(){
                      if(draggabling!=1){
                        $('#ShowInfo').fadeOut();  
                        //alert('mouseleave');
                      }
                    }
                  );
/****/
  $(document).mouseup(
                function(){
                  $('#ShowInfo').fadeOut('slow');
                  draggabling=0;
                }
              );
  //#endregion
  //#region �ifunction�jprepare draggable value
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function DraggableP(TrNo){

    var page = WhatPage();
    var no =(page-1)*NumOfRow+(TrNo-1);    //array from 0 , TrNo from 1

    $('#ShowInfo p').html(
                       'no. :'       +Info20[no].BaseInfo[0] +'<br/>'+
                       '�ѦW :'      +Info20[no].BaseInfo[1] +'<br/>'+
                       '���� :'      +Info20[no].BaseInfo[2] +'<br/>'+
                       '�w�s :'      +Info20[no].BaseInfo[3] +'<br/>'+
                       '���� :'      +Info20[no].BaseInfo[4] +'<br/>'+
                       '�X���� :'    +Info20[no].BaseInfo[5] +'<br/>'+
                       '�X����� :'  +Info20[no].BaseInfo[6]  
                     );
  }
  //#endregion

  //#region �ifunction�jdraggable
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 

  $('#ShowInfo').draggable();
  
  //#endregion


  //#region �ifunction�jdroppable
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function DroppableValue(TrNo){

    var page = WhatPage();
    var no =(page-1)*NumOfRow+(TrNo-1);    //array from 0 , TrNo from 1

    $('#ShowSingle').droppable({
                       drop:function(event,ui){
                         $('#ShowSingle tr:eq(0) input').val(Info20[no].BaseInfo[0]);
                         $('#ShowSingle tr:eq(1) input').val(Info20[no].BaseInfo[1]);
                         $('#ShowSingle tr:eq(2) input').val(Info20[no].BaseInfo[2]);
                         $('#ShowSingle tr:eq(3) input').val(Info20[no].BaseInfo[3]);
                         $('#ShowSingle tr:eq(4) input').val(Info20[no].BaseInfo[4]);
                         $('#ShowSingle tr:eq(5) input').val(Info20[no].BaseInfo[5]);
                         $('#ShowSingle tr:eq(6) input').val(Info20[no].BaseInfo[6]);
                       }
                     });  
  }

  //#endregion

  //#region �ifunction�jcolorful
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function colorful(TrNo){
    var OldOrEven=TrNo%2;                        // OldOrEven=0 means Even ; else means Old.
    (OldOrEven==0)?
      $('#ListTable tr:eq('+TrNo+')').css('background-color','#5CB3FF') :
      $('#ListTable tr:eq('+TrNo+')').css('background-color','#8EEBEC')
    ;
  }
  //#endregion


  //#region �ifunction�jPreparePurchase
  //*****************************************************************************
  //*Comment    :�[�J�ʪ���
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 

  function PreparePurchase(){
    alert('�w�[�J�ʪ���');
    var No=$('#ShowSingle tr:eq(0) input').val();
    AddToCar(No,1);
    var NumberOfItem=ShoppingCarItem.length;
    var ListLast=ShoppingCarItem.length;

    //��s�ʪ����C��
    var NumberOfItem=ShoppingCarItem.length;
    var ListLast=ShoppingCarItem.length;
    for(var x=0;x<NumberOfItem;x++){
      $('#ShoppingCarList tr:eq('+ListLast+')').remove();
      ListLast--;
    }    
    //�����ʪ����C��
    var y=0;
    while(y<NumberOfItem){
        $('#ShoppingCarList').append(                             //no.�B�ѦW�B����B�w�s�B�ʶR�ƶq
                                '<tr>'+
                                  '<td>'+ShoppingCarItem[y].No+'</td>'+
                                  '<td>'+Info20[ShoppingCarItem[y].No-1].BaseInfo[1]+'</td>'+
                                  '<td>'+Info20[ShoppingCarItem[y].No-1].BaseInfo[2]+'</td>'+
                                  '<td>'+Info20[ShoppingCarItem[y].No-1].BaseInfo[3]+'</td>'+
                                  '<td><input id="BuyNumber'+y+'" size="3" value="'+ShoppingCarItem[y].Number+'"/></td>'+
                                '</tr>'
                              );
        y++;
    }
  }
  
  //#endregion

  //#region �ifunction�jshow shopping car
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function ShowCar(){
    var NumberOfItem=ShoppingCarItem.length;
    if(ShoppingCarList.rows.length<=1){
      var x=0;
      while(x<NumberOfItem){
        $('#ShoppingCarList').append(                             //no.�B�ѦW�B����B�w�s�B�ʶR�ƶq
                                '<tr>'+
                                  '<td>'+ShoppingCarItem[x].No+'</td>'+
                                  '<td>'+Info20[ShoppingCarItem[x].No-1].BaseInfo[1]+'</td>'+
                                  '<td>'+Info20[ShoppingCarItem[x].No-1].BaseInfo[2]+'</td>'+
                                  '<td>'+Info20[ShoppingCarItem[x].No-1].BaseInfo[3]+'</td>'+
                                  '<td><input id="BuyNumber'+x+'" size="3" value="'+ShoppingCarItem[x].Number+'"/></td>'+
                                '</tr>'
                              );   
        x++;
      }
    }
    else{
      var NumberOfItem=ShoppingCarItem.length;
      var ListLast=ShoppingCarItem.length;
      for(var x=0;x<NumberOfItem;x++){
        if(document.getElementById('BuyNumber'+x).value!=1){                                                      //�ˬd���L�ק��ʶR�ƶq
          ShoppingCarItem[x].Number=document.getElementById('BuyNumber'+x).value;
        }
      }
      for(var x=0;x<NumberOfItem;x++){
        $('#ShoppingCarList tr:eq('+ListLast+')').remove();
        ListLast--;
      }  
    }
  }
  //#endregion

  //#region �ifunction�jbuy
  //*****************************************************************************
  //*Comment    : �C�X�ʪ��M��A�òM���ʪ���
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : �L
  //***************************************************************************** 
  function Purchase(){
    var NumberOfItem=ShoppingCarItem.length;
    for(var x=0;x<NumberOfItem;x++){
      if(document.getElementById('BuyNumber'+x).value!=1){                                                      //�ˬd���L�ק��ʶR�ƶq
        ShoppingCarItem[x].Number=document.getElementById('BuyNumber'+x).value;
      }
    }
    var x=0;
    var PurchaseList="�Ы����M����d�i���b\n";
    while(x<NumberOfItem){         //no.�B�ѦW�B����B�ʶR�ƶq       
      PurchaseList+='no. : '+ShoppingCarItem[x].No+'  '+                           
                    '�ѦW: '+Info20[ShoppingCarItem[x].No-1].BaseInfo[1]+'  '+
                    '����: '+Info20[ShoppingCarItem[x].No-1].BaseInfo[2]+'  '+
                    '�ʶR�ƶq: '+ShoppingCarItem[x].Number+'\n';

      Info20[ShoppingCarItem[x].No-1].BaseInfo[3]-=ShoppingCarItem[x].Number;                  //�w�s�����
      delete ShoppingCarItem[x];                                                               //�M���ʪ���
      x++;

    }
    //��s���y�M��
    Row0();
    //��s�ʪ����C��
    var NumberOfItem=ShoppingCarItem.length;
    var ListLast=ShoppingCarItem.length;
    for(var x=0;x<NumberOfItem;x++){
      $('#ShoppingCarList tr:eq('+ListLast+')').remove();
      ListLast--;
    }  
    
    alert(PurchaseList);
    
    //window.location.reload();
  }
  //#endregion


  //#region �ifunction�jadd to shopping car
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //              
  //              
  //*Return     : 
  //***************************************************************************** 
  function AddToCar(No,Number){
    var NumberOfItem=ShoppingCarItem.length;                       
    ShoppingCarItem[NumberOfItem]=new ShoppingCarType(No,Number);
  }

  //#endregion  

 
</script>






