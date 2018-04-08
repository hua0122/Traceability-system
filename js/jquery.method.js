function isIE_CN() {
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    //以下进行测试  
    if (Sys.ie) {
            window.location.href = "Default.aspx"; 
    }
}
function isIE_EN() {
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    //以下进行测试  
    if (Sys.ie) {
        var ieversion = parseInt(Sys.ie);
        if (ieversion <= 8) {
            window.location.href = "EnDefault.aspx";
        }
    }
}
function cn_querycode() {
    var code = $('#txt_code').val();
    // $('#result_info').text("正在查询中,请稍等...");
    // $('#result_ico').attr("src", "css/images/icons/code_wait.png");
    if (code.length <= 0) {
         $("#txt_code").focus();
		 alert("请输入需要查询的防伪编码!");
            return false;
    }
    if (code.length < 10) {
        $('#result_info').text("您所输入的防伪编码(" + code + ")无效,请核实.");
		alert("您所输入的防伪编码(" + code + ")无效,请核实.");
        // $('#result_ico').attr("src", "css/images/icons/code_warring.png");
        // $('#resultModal').modal({
            // backdrop: true,
            // keyboard: true,
            // show: true
        // })
        return false;
    }
    var reg = new RegExp("^[0-9]*$");
    if (!reg.test(code)) {
        $('#result_info').text("您所输入的防伪编码(" + code + ")无效,请核实.");
		
        // $('#result_ico').attr("src", "css/images/icons/code_warring.png");
        // $('#resultModal').modal({
            // backdrop: true,
            // keyboard: true,
            // show: true
        // })
        return false;
    }
    $.ajax({
        type: 'GET',
        url: 'Module/QueryCode.ashx?type=cn_query&code=' + code,
        dataType: 'json',
        timeout: 3000,
        cache: false,
        async: true,
        success: function (data) {
            $('#fw_result').text(data.ResultInfo);
		    $('#fw_result_span').show();
            $('#table_fw').hide();
            // $('#result_ico').attr("src", "css/images/icons/" + data.ImageType);
            // $('#resultModal').modal({
                // backdrop: "static",
                // keyboard: false,
                // show: true
            // })
        },
        error: function (error) {
            $('#result_info').text("系统查询超时,请稍后再试!");
            // $('#result_ico').attr("src", "css/images/icons/code_warring.png");
            // $('#resultModal').modal({
                // backdrop: "static",
                // keyboard: false,
                // show: true
            // })
        }
    });
}
function close_cn_model() {
    $('#resultModal').modal({
        show: false
    })
}
function en_querycode() {
    var code = $('#txt_code').val();
    $('#result_info').text("please wait ...");
    $('#result_ico').attr("src", "css/images/icons/code_wait.png");
    if (code.length <= 0) {
        $("#txt_code").focus();
        return false;
    }
    if (code.length < 10) {
        $('#result_info').text("Security code you entered (" + code + ") is invalid, please verify.");
        $('#result_ico').attr("src", "css/images/icons/code_warring.png");
        $('#resultModal').modal({
            backdrop: true,
            keyboard: true,
            show: true
        })
        return false;
    }
    var reg = new RegExp("^[0-9]*$");
    if (!reg.test(code)) {
        $('#result_info').text("Security code you entered (" + code + ") is invalid, please verify.");
        $('#result_ico').attr("src", "css/images/icons/code_warring.png");
        $('#resultModal').modal({
            backdrop: true,
            keyboard: true,
            show: true
        })
        return false;
    }
    $.ajax({
        type: 'GET',
        url: 'Module/QueryCode.ashx?type=en_query&code=' + code,
        dataType: 'json',
        timeout: 3000,
        cache: false,
        async: true,
        success: function (data) {
            $('#result_info').text(data.ResultInfo);
            $('#result_ico').attr("src", "css/images/icons/" + data.ImageType);
            $('#resultModal').modal({
                backdrop: "static",
                keyboard: false,
                show: true
            })
        },
        error: function (error) {
            $('#result_info').text("System query timeout, please try again later!");
            $('#result_ico').attr("src", "css/images/icons/code_warring.png");
            $('#resultModal').modal({
                backdrop: "static",
                keyboard: false,
                show: true
            })
        }
    });
}
function close_en_model() {
    $('#resultModal').modal({
        show: false
    })
}