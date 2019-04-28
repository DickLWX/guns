/**
 * 接单数申请管理初始化
 */
var Applyordernum = {
    id: "ApplyordernumTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Applyordernum.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '申请人', field: 'username', visible: true, align: 'center', valign: 'middle'},
            {title: '手机号', field: 'mobile', visible: true, align: 'center', valign: 'middle'},
            {title: '申请接单数', field: 'applynum', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'statusname', visible: true, align: 'center', valign: 'middle'},
            {title: '申请时间', field: 'createdate', visible: true, align: 'center', valign: 'middle'},
            {title: '审核时间', field: 'reviewdate', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Applyordernum.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Applyordernum.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加接单数申请
 */
Applyordernum.openAddApplyordernum = function () {
    var index = layer.open({
        type: 2,
        title: '添加接单数申请',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/applyordernum/applyordernum_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看接单数申请详情
 */
Applyordernum.openApplyordernumDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '接单数申请详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/applyordernum/applyordernum_update/' + Applyordernum.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除接单数申请
 */
Applyordernum.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/applyordernum/delete", function (data) {
            Feng.success("删除成功!");
            Applyordernum.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("applyordernumId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 通过接单数申请
 */
Applyordernum.pass = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/applyordernum/update", function (data) {
            Feng.success("操作成功!");
            Applyordernum.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        });
        ajax.set("applyordernumId",this.seItem.id);
        ajax.set("status",2);
        ajax.start();
    }
};


/**
 * 拒绝接单数申请
 */
Applyordernum.refuse = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/applyordernum/update", function (data) {
            Feng.success("操作成功!");
            Applyordernum.table.refresh();
        }, function (data) {
            Feng.error("操作失败!" + data.responseJSON.message + "!");
        });
        ajax.set("applyordernumId",this.seItem.id);
        ajax.set("status",1);
        ajax.start();
    }
};

/**
 * 查询接单数申请列表
 */
Applyordernum.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Applyordernum.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Applyordernum.initColumn();
    var table = new BSTable(Applyordernum.id, "/applyordernum/list", defaultColunms);
    table.setPaginationType("client");
    Applyordernum.table = table.init();
});
