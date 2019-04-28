/**
 * 初始化订单详情对话框
 */
var OrderInfoDlg = {
    orderInfoData : {}
};

/**
 * 清除数据
 */
OrderInfoDlg.clearData = function() {
    this.orderInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OrderInfoDlg.set = function(key, val) {
    this.orderInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OrderInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
OrderInfoDlg.close = function() {
    parent.layer.close(window.parent.Order.layerIndex);
}

/**
 * 收集数据
 */
OrderInfoDlg.collectData = function() {
    this
    .set('id')
    .set('userid')
    .set('placeid')
        .set('placename')
    .set('getid')
    .set('mobile')
    .set('address')
    .set('score')
    .set('size')
    .set('name')
    .set('weight')
    .set('reputation')
    .set('createdate')
    .set('limitdate')
    .set('finishdate')
    .set('grade')
    .set('content')
    .set('status')
    .set('deleteflag');
}

/**
 * 提交添加
 */
OrderInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/order/add", function(data) {
        if (data.code == 500) {
            Feng.error(data.message);
        } else {
        Feng.success("添加成功!");
        window.parent.Order.table.refresh();
        OrderInfoDlg.close();
    }
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.orderInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
OrderInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/order/update", function(data){
        Feng.success("修改成功!");
        window.parent.Order.table.refresh();
        OrderInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.orderInfoData);
    ajax.start();
}

$(function() {

});
