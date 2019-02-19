/**
 * 接单人申请管理初始化
 */
var Orderapply = {
    id: "OrderapplyTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Orderapply.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '申请人', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '申请说明', field: 'introduction', visible: true, align: 'center', valign: 'middle'},
            {title: '手机号', field: 'mobile', visible: true, align: 'center', valign: 'middle'},
            {title: '申请时间', field: 'createdate', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Orderapply.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Orderapply.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加接单人申请
 */
Orderapply.openAddOrderapply = function () {
    var index = layer.open({
        type: 2,
        title: '添加接单人申请',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/orderapply/orderapply_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看接单人申请详情
 */
Orderapply.openOrderapplyDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '接单人申请详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/orderapply/orderapply_update/' + Orderapply.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 通过快递点申请
 */
Orderapply.pass = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/orderapply/check", function (data) {
            Feng.success("审核成功");
            Placeapply.table.refresh();
        }, function (data) {
            Feng.error("审核失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderApplyId",this.seItem.id);
        ajax.set("status",1);
        ajax.start();
    }
};

/**
 * 拒绝快递点申请
 */
Orderapply.refuse = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/orderapply/check", function (data) {
            Feng.success("审核成功");
            Placeapply.table.refresh();
        }, function (data) {
            Feng.error("审核失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderApplyId",this.seItem.id);
        ajax.set("status",2);
        ajax.start();
    }
};

/**
 * 删除接单人申请
 */
Orderapply.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/orderapply/delete", function (data) {
            Feng.success("删除成功!");
            Orderapply.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderapplyId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询接单人申请列表
 */
Orderapply.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Orderapply.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Orderapply.initColumn();
    var table = new BSTable(Orderapply.id, "/orderapply/list", defaultColunms);
    table.setPaginationType("client");
    Orderapply.table = table.init();
});
