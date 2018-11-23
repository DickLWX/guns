/**
 * 初始化快递点申请详情对话框
 */
var PlaceapplyInfoDlg = {
    placeapplyInfoData : {}
};

/**
 * 清除数据
 */
PlaceapplyInfoDlg.clearData = function() {
    this.placeapplyInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PlaceapplyInfoDlg.set = function(key, val) {
    this.placeapplyInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
PlaceapplyInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
PlaceapplyInfoDlg.close = function() {
    parent.layer.close(window.parent.Placeapply.layerIndex);
}

/**
 * 收集数据
 */
PlaceapplyInfoDlg.collectData = function() {
    this
    .set('id')
    .set('userid')
    .set('address')
    .set('description')
    .set('mobile')
    .set('introduction')
    .set('createdate')
    .set('adminid')
    .set('reviewdate')
    .set('status')
    .set('deleteflag');
}

/**
 * 提交添加
 */
PlaceapplyInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/placeapply/add", function(data){
        Feng.success("添加成功!");
        window.parent.Placeapply.table.refresh();
        PlaceapplyInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.placeapplyInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
PlaceapplyInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/placeapply/update", function(data){
        Feng.success("修改成功!");
        window.parent.Placeapply.table.refresh();
        PlaceapplyInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.placeapplyInfoData);
    ajax.start();
}

$(function() {

});
