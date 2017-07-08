<%@ language='javascript'%>
<html>
  <head>
    <title>Table ver.2</title>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  </head>

  <body>
    一頁顯示<input id='NumOfRowInput' size='10' placeholder="type in number"></input>筆資料<br/><br/>
    

    <div>第<input id='PageSelect' type='text' size='10'  placeholder="type in number"/>頁</div>

    <div style="opacity:0.5;position:absolute;left:50px;width:300px;height:150px;background-color:#40B3DF"></div>

    <div style="font-family:verdana;padding:20px;border-radius:10px;border:10px solid #EE872A;">

      <div style="opacity:0.3;position:absolute;left:120px;width:100px;height:200px;background-color:#8AC007"></div>

      <h3>書籍清單</h3>

      <div style="letter-spacing:12px;">Book List</div>

      <div style="color:#40B3DF;">Team
        <span style="background-color:#B4009E;color:#ffffff;">C</span>
      </div>

      <div style="color:#000000;">and more...</div>

    </div>

    <div id='ListDiv' >  <!--style='float:left'-->  <!--標籤元素向左靠.文字圍繞在右邊-->
      <table id='ListTable' border='1'>
        <tr>
          <td>no.</td>
          <td>書名</td>
          <td>價格</td>
          <td>庫存</td>
        </tr>
      </table>
    </div>

    <div id='ShowSingle' style='float:left'>  <!--style='float:left'-->

    <h3>書籍詳細資料</h3>    

      <table border='1'>
        <tr>
          <td>no.</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>書名</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>價格</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>庫存</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>分類</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>出版社</td>
          <td><input size='3'/></td>
        </tr>
        <tr>
          <td>出版日期</td>
          <td><input size='3'/></td>
        </tr>
      </table>

      <div>
        <input id='PurchaseButton' type='button' value='點此購買' onclick='PreparePurchase()' />
      </div>

    </div>

    <div id='CarDiv' style='float:left'> 
        <h3>購物車</h3> 
        <table border='1' id='ShoppingCarList'>
          <tr>
            <td>no.</td>
            <td>書名</td>
            <td>價格</td>
            <td>庫存</td>
            <td>購買數量</td>
          </tr>
        </table>

      <div>
        <input id='ShowCar' type='button' value='顯示/隱藏購物車' onclick='ShowCar()' />
        <input id='Buy' type='button' value='確認購買' onclick='Purchase()' />
      </div>
      
    </div>

    <div id='ShowInfo' style='display:none'><p></p></div>
    
  </body>

</html>


<script>
  var NumOfRow;
  $('#NumOfRowInput').keyup(                                //當數值變動時，發生作用
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
  //#region 【function】constructor-book information
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //*****************************************************************************  

  function BaseInfoType(no,name,price,stock,Class,Publisher,PublishDate){
    var self=this;
    var BaseInfo=new Array();
    self.BaseInfo=[no,name,price,stock,Class,Publisher,PublishDate];
  }
  //#endregion


  var Info20=new Array();


</script>

<%    //ASP取得書籍資料
  var new_file;
  var data_file;


  var array_temp=Array();

  new_file=new ActiveXObject("Scripting.FileSystemObject");
  data_file=new_file.OpenTextFile("D:\\ProgramDesign\\BookData.txt",1);
  
  var i=0;

  while(data_file.AtEndOfStream!=true){

      array_temp[0]=data_file.ReadLine();
      //Response.Write('編號: '+array_temp[0]+'<br/>');
      array_temp[1]=data_file.ReadLine();
      //Response.Write('書名: '+array_temp[1]+'<br/>');
      array_temp[2]=data_file.ReadLine();
      //Response.Write('價格: '+array_temp[2]+'<br/>');
      array_temp[3]=data_file.ReadLine();
      //Response.Write('庫存: '+array_temp[3]+'<br/>');
      array_temp[4]=data_file.ReadLine();
      //Response.Write('分類: '+array_temp[4]+'<br/>');
      array_temp[5]=data_file.ReadLine();
      //Response.Write('出版社: '+array_temp[5]+'<br/>');
      array_temp[6]=data_file.ReadLine();
      //Response.Write('出版日期: '+array_temp[6]+'<br/>');

    %>
    <script>
      
      Info20[<%=i%>]= new BaseInfoType('<%=array_temp[0]%>','<%=array_temp[1]%>','<%=array_temp[2]%>','<%=array_temp[3]%>','<%=array_temp[4]%>','<%=array_temp[5]%>','<%=array_temp[6]%>');
                      
    </script>
    <%
    i++;
  }

  data_file.Close();//ASP結束
%>       
  

  <script>
  //#region 【function】constructor-shopping car
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : No是書的編號,Number是要買的數量
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //*****************************************************************************  
  function ShoppingCarType(No,Number){
    var self=this;                                                                                              
    self.No=No;
    self.Number=Number;
  }
  var ShoppingCarItem=new Array();
 
  </script>
    <%    //ASP取得購物車資料
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

      //將讀到的資料留在JS內
      ShoppingCarItem[<%=car_i%>]=new ShoppingCarType('<%=Car_No_temp%>','<%=Car_Number_temp%>');

    </script>

    <%
    car_i++;
    }

    car_data_file.Close();//ASP結束
    %> 

    <script>

  //#endregion

  //********************************************************object over********************************************************/



  //#region 【function】show info by no
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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



  //#region 【function】page
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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

  //#region 【function】create 10 rows  (NumOfRow=10 : 10 rows per one page)
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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

  //#region 【function】del row
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 
  function DelRow(order){
    $('#ListTable tr:eq('+order+')').remove();
  }
  //#endregion

  //#region 【function】del 10 rows
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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

  //#region 【function】on key down,prepare draggable
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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

  //#region 【function】on key  up, draggable div disappear
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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
  //#region 【function】prepare draggable value
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 
  function DraggableP(TrNo){

    var page = WhatPage();
    var no =(page-1)*NumOfRow+(TrNo-1);    //array from 0 , TrNo from 1

    $('#ShowInfo p').html(
                       'no. :'       +Info20[no].BaseInfo[0] +'<br/>'+
                       '書名 :'      +Info20[no].BaseInfo[1] +'<br/>'+
                       '價格 :'      +Info20[no].BaseInfo[2] +'<br/>'+
                       '庫存 :'      +Info20[no].BaseInfo[3] +'<br/>'+
                       '分類 :'      +Info20[no].BaseInfo[4] +'<br/>'+
                       '出版社 :'    +Info20[no].BaseInfo[5] +'<br/>'+
                       '出版日期 :'  +Info20[no].BaseInfo[6]  
                     );
  }
  //#endregion

  //#region 【function】draggable
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 

  $('#ShowInfo').draggable();
  
  //#endregion


  //#region 【function】droppable
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
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

  //#region 【function】colorful
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 
  function colorful(TrNo){
    var OldOrEven=TrNo%2;                        // OldOrEven=0 means Even ; else means Old.
    (OldOrEven==0)?
      $('#ListTable tr:eq('+TrNo+')').css('background-color','#5CB3FF') :
      $('#ListTable tr:eq('+TrNo+')').css('background-color','#8EEBEC')
    ;
  }
  //#endregion


  //#region 【function】PreparePurchase
  //*****************************************************************************
  //*Comment    :加入購物車
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 

  function PreparePurchase(){
    alert('已加入購物車');
    var No=$('#ShowSingle tr:eq(0) input').val();
    AddToCar(No,1);
    var NumberOfItem=ShoppingCarItem.length;
    var ListLast=ShoppingCarItem.length;

    //刷新購物車列表
    var NumberOfItem=ShoppingCarItem.length;
    var ListLast=ShoppingCarItem.length;
    for(var x=0;x<NumberOfItem;x++){
      $('#ShoppingCarList tr:eq('+ListLast+')').remove();
      ListLast--;
    }    
    //重建購物車列表
    var y=0;
    while(y<NumberOfItem){
        $('#ShoppingCarList').append(                             //no.、書名、價格、庫存、購買數量
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

  //#region 【function】show shopping car
  //*****************************************************************************
  //*Comment    : 
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 
  function ShowCar(){
    var NumberOfItem=ShoppingCarItem.length;
    if(ShoppingCarList.rows.length<=1){
      var x=0;
      while(x<NumberOfItem){
        $('#ShoppingCarList').append(                             //no.、書名、價格、庫存、購買數量
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
        if(document.getElementById('BuyNumber'+x).value!=1){                                                      //檢查有無修改購買數量
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

  //#region 【function】buy
  //*****************************************************************************
  //*Comment    : 列出購物清單，並清空購物車
  //              
  //*Parameter  : 
  //                      
  //              
  //              
  //              
  //*Return     : 無
  //***************************************************************************** 
  function Purchase(){
    var NumberOfItem=ShoppingCarItem.length;
    for(var x=0;x<NumberOfItem;x++){
      if(document.getElementById('BuyNumber'+x).value!=1){                                                      //檢查有無修改購買數量
        ShoppingCarItem[x].Number=document.getElementById('BuyNumber'+x).value;
      }
    }
    var x=0;
    var PurchaseList="請持本清單至櫃檯結帳\n";
    while(x<NumberOfItem){         //no.、書名、價格、購買數量       
      PurchaseList+='no. : '+ShoppingCarItem[x].No+'  '+                           
                    '書名: '+Info20[ShoppingCarItem[x].No-1].BaseInfo[1]+'  '+
                    '價格: '+Info20[ShoppingCarItem[x].No-1].BaseInfo[2]+'  '+
                    '購買數量: '+ShoppingCarItem[x].Number+'\n';

      Info20[ShoppingCarItem[x].No-1].BaseInfo[3]-=ShoppingCarItem[x].Number;                  //庫存應減少
      delete ShoppingCarItem[x];                                                               //清除購物車
      x++;

    }
    //刷新書籍清單
    Row0();
    //刷新購物車列表
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


  //#region 【function】add to shopping car
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






