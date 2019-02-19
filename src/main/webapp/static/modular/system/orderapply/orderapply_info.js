/**
 * 初始化接单人申请详情对话框
 */
var OrderapplyInfoDlg = {
    orderapplyInfoData : {}
};

/**
 * 清除数据
 */
OrderapplyInfoDlg.clearData = function() {
    this.orderapplyInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OrderapplyInfoDlg.set = function(key, val) {
    this.orderapplyInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OrderapplyInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
OrderapplyInfoDlg.close = function() {
    parent.layer.close(window.parent.Orderapply.layerIndex);
}

/**
 * 收集数据
 */
OrderapplyInfoDlg.collectData = function() {
    this
        .set('placeaddress')
    .set('id')
    .set('placeid')
    .set('userid')
    .set('introduction')
    .set('mobile')
    .set('status')
    .set('adminid')
    .set('createdate')
    .set('reviewdate')
    .set('deleteflag');
}

/**
 * 提交添加
 */
OrderapplyInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/orderapply/add", function(data){
        Feng.success("添加成功!");
        window.parent.Orderapply.table.refresh();
        OrderapplyInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.orderapplyInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
OrderapplyInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/orderapply/update", function(data){
        Feng.success("修改成功!");
        window.parent.Orderapply.table.refresh();
        OrderapplyInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.orderapplyInfoData);
    ajax.start();
}

$(function() {

});
