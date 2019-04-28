/**
 * 快递点申请管理初始化
 */
var Placeapply = {
    id: "PlaceapplyListTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Placeapply.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '快递点地址', field: 'address', visible: true, align: 'center', valign: 'middle'},
            {title: '快递点描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '申请时间', field: 'createdate', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'statusname', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Placeapply.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Placeapply.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加快递点申请
 */
Placeapply.openAddPlaceapply = function () {
    var index = layer.open({
        type: 2,
        title: '添加快递点申请',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/placeapply/placeapply_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看快递点申请详情
 */
Placeapply.openPlaceapplyDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '快递点申请详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/placeapply/placeapply_update/' + Placeapply.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除快递点申请
 */
Placeapply.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/placeapply/delete", function (data) {
            Feng.success("删除成功!");
            Placeapply.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("placeapplyId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 通过快递点申请
 */
Placeapply.pass = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/placeapply/check", function (data) {
            Feng.success("审核成功");
            Placeapply.table.refresh();
        }, function (data) {
            Feng.error("审核失败!" + data.responseJSON.message + "!");
        });
        ajax.set("placeapplyId",this.seItem.id);
        ajax.set("status",2);
        ajax.start();
    }
};

/**
 * 拒绝快递点申请
 */
Placeapply.refuse = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/placeapply/check", function (data) {
            Feng.success("审核成功");
            Placeapply.table.refresh();
        }, function (data) {
            Feng.error("审核失败!" + data.responseJSON.message + "!");
        });
        ajax.set("placeapplyId",this.seItem.id);
        ajax.set("status",1);
        ajax.start();
    }
};

/**
 * 查询快递点申请列表
 */
Placeapply.search = function () {
    var queryData = {};
    queryData['address'] = $("#address").val();
    Placeapply.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Placeapply.initColumn();
    var table = new BSTable(Placeapply.id, "/placeapply/placeapplylistl", defaultColunms);
    table.setPaginationType("client");
    Placeapply.table = table.init();
});
