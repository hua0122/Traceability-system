var reg = new RegExp("^[0-9]*$");

function closeresult(e) {
    if (e == 1) {
        $('#fw_result_span').hide();
        $('#table_fw').show();
    } else if (e == 2) {
        $('.wl_result_span').hide();
        $('#table_wl').show();
    } else if (e ==3) {
        $('.sy_result_span').hide();
        $('#table_sy').show();
    } else if (e == 5) {
        $('.sp_result_span').hide();
        $('#table_sp').show();
    }
}
function sumbitquery(e) {
    if (e == 1) {
        
        var fw_code = $('#txt_fw_code').val();
          
        if (fw_code.length <= 0) {
            alert("请输入需要查询的防伪编码!");
            return false;
        }
   
       else {
              var url = "http://china3-15.com/module/GetCode_getjson.ashx?action=add&callback=?";
              var data = { c: fw_code, key: "347ebf8d172e977ad09d583a6687cd4f" };
              $.getJSON(url, data, function (backdata) {
                  $('#fw_result').html(backdata.result);
				  
                    $('#fw_result_span').show();
                    $('#table_fw').hide();
              });

           
           }

    }
	
	  
      
    else if (e == 2) {
        var wl_code = $('#txt_wl_code').val();
        var wl_comid = $('#txt_wl_comid').val();
        var wl_pwd = $('#txt_wl_pwd').val();
        if (wl_code.length <= 0) {
            alert("请输入查询的物流编码!");
            return false;
        }
        if (!reg.test(wl_code)) {
            alert("您输入的物流编码无效,请重新输入!");
            return false;
        }
        if (wl_comid.length <= 0) {
            alert("请输入您的企业编号!");
            return false;
        }
        if (!reg.test(wl_comid)) {
            alert("输入的企业编号无效,请重新输入!");
            return false;
        }
        if (wl_pwd.length <= 0) {
            alert("请输入物流查询密码!");
            return false;
        }
        $.ajax({
            type: "POST",
            async: false,
            cache: false,
            url: "Pages/LocalQuery.ashx?type=wuliu",
            data: { code: wl_code, comid: wl_comid, pwd: wl_pwd },
            success: function (date) {
                if (date[0] == '0') {
                    date = date.substring(2, date.length);
                    alert(date);
                } else {
                    $('#wl_result').html(date);
                    $('.wl_result_span').show();
                    $('#table_wl').hide();
                }

            }
        });

    }
    else if (e == 3) {
        document.getElementById("sy_check").src = "Pages/CheckCode.aspx?id=" + Math.random();
        var sy_code = $('#txt_sy_code').val();
        var sy_yzm = $('#txt_sy_yzm').val();
        if (sy_code.length <= 0) {
            alert("请输入将要查询的溯源码!");
            return false;
        }
        if (!reg.test(sy_code)) {
            alert("您输入的溯源码无效,请重新输入!");
            return false;
        }
        if (sy_yzm.length <= 0) {
            alert("请输入溯源查询验证码!");
            return false;
        }
        $.ajax({
            type: "POST",
            async: false,
            cache: false,
            url: "Pages/LocalQuery.ashx?type=suyuan",
            data: { code: sy_code, yzm: sy_yzm },
            success: function (date) {
                if (date[0] == '0') {
                    alert(date.substring(2, date.length));
                } else {
                    clearvalue(3);
                    $('#sy_result').text(date);
                    $('.sy_result_span').show();
                    $('#table_sy').hide();
                }
            }
        });
    }
    else if (e == 5) {
        var sp_code = $('#txt_sp_code').val();
        var sp_yzm = $('#txt_sp_yzm').val();
        if (sp_code.length <= 0) {
            alert("请输入需要查询的商品条码!");
            return false;
        }
        if (!reg.test(sp_code)) {
            alert("您输入的商品条码无效,请重新输入!");
            return false;
        }
        if (sp_yzm.length <= 0) {
            alert("请输入验证码!");
            return false;
        }
        $('#sp_result').html("正在查询中...");
        $('.sp_result_span').show();
        $('#table_sp').hide();
        $.ajax({
            type: "POST",
            async: true,
            cache: false,
            url: "Pages/LocalQuery.ashx?type=tiaoma",
            data: { code: sp_code, yzm: sp_yzm },
            success: function (date) {
                if (date[0] == '0') {
                    $('.sp_result_span').hide();
                    $('#table_sp').show();
                    alert(date.substring(2, date.length));
                } else {
                    clearvalue(5);
                    var obj = jQuery.parseJSON(date)
                    $('#sp_result').html("<table><tr><td>商品名称:</td><td><img src='" + obj.titleSrc + "' /></td></tr><tr><td>参考价格:</td><td>" + obj.price + "元</td></tr><tr><td>厂商代码:</td><td>" + obj.faccode + "</td></tr><tr><td>商品国别:</td><td>" + obj.guobie + "</td></tr><tr><td>注册地点:</td><td>" + obj.place + "</td></tr><tr><td>厂商名称:</td><td>" + obj.fac_name + "</td></tr><tr><td>注册状态:</td><td>" + obj.fac_status + "</td></tr></table>");
                }
            }
        });
    }
}
function clearvalue(e) {
    if (e == 1) {
        
        
        $('#txt_code').val('');
    } else if (e == 2) {
        $('#txt_wl_code').val('');
        $('#txt_wl_comid').val('');
        $('#txt_wl_pwd').val('');
    } else if (e == 3) {
        document.getElementById("sy_check").src = "Pages/CheckCode.aspx?id=" + Math.random();
        $('#txt_sy_yzm').val('');
        $('#txt_sy_code').val('');
    } else if (e == 5) {
        document.getElementById("sp_check").src = "Pages/CheckCode.aspx?id=" + Math.random();
        $('#txt_sp_yzm').val('');
        $('#txt_sp_code').val('');
    }
}
function GetIndexData() {
    $.ajax({
        type: "GET",
        async: true,
        cache: false,
        url: "Pages/LocalQuery.ashx?type=IndexGetData",
        success: function (date) {
            if (date[0] == '0') {
                $('.newwelcome').text("");
            } else {
                var obj = jQuery.parseJSON(date)
                $('.newwelcome').text("" + obj.companycount + "家入网企业," + obj.agentcount + "家渠道商,合计" + obj.codecount + "万组数据量");
            }
        }
    });



}
