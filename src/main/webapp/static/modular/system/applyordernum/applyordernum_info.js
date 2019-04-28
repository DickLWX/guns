/**
 * 初始化接单数申请详情对话框
 */
var ApplyordernumInfoDlg = {
    applyordernumInfoData : {}
};

/**
 * 清除数据
 */
ApplyordernumInfoDlg.clearData = function() {
    this.applyordernumInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ApplyordernumInfoDlg.set = function(key, val) {
    this.applyordernumInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ApplyordernumInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ApplyordernumInfoDlg.close = function() {
    parent.layer.close(window.parent.Applyordernum.layerIndex);
}

/**
 * 收集数据
 */
ApplyordernumInfoDlg.collectData = function() {
    this
    .set('id')
    .set('userid')
    .set('mobile')
    .set('applynum')
    .set('adminid')
    .set('status')
    .set('createdate')
    .set('reviewdate')
    .set('deleteflag');
}

/**
 * 提交添加
 */
ApplyordernumInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/applyordernum/add", function(data){
        if (date.code == 500){
            Feng.error(data.message);
        } else {
            Feng.success("申请成功!");
            window.parent.Applyordernum.table.refresh();
            ApplyordernumInfoDlg.close();
        }
    },function(data){
        Feng.error("申请失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.applyordernumInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ApplyordernumInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/applyordernum/update", function(data){
        Feng.success("修改成功!");
        window.parent.Applyordernum.table.refresh();
        ApplyordernumInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.applyordernumInfoData);
    ajax.start();
}

$(function() {

});
