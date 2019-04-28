/**
 * 快递点申请管理初始化
 */
var Placeapply = {
    id: "GetOrderTable",	//表格id
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
            {title: '发单人', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '手机', field: 'mobile', visible: true, align: 'center', valign: 'middle'},
            {title: '快递点', field: 'placename', visible: true, align: 'center', valign: 'middle'},
            {title: '送达地址', field: 'address', visible: true, align: 'center', valign: 'middle'},
            {title: '积分', field: 'score', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'status', visible: true, align: 'center', valign: 'middle'},
            {title: '评论', field: 'content', visible: true, align: 'center', valign: 'middle'},
            {title: '完成时间', field: 'finishdate', visible: true, align: 'center', valign: 'middle'}
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
 * 查询快递点申请列表
 */
Placeapply.search = function () {
    var queryData = {};
    queryData['address'] = $("#address").val();
    Placeapply.table.refresh({query: queryData});
};

/**
 * 拒绝快递点申请
 */
Placeapply.refuse = function () {
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


$(function () {
    var defaultColunms = Placeapply.initColumn();
    var table = new BSTable(Placeapply.id, "/order/getOrderList", defaultColunms);
    table.setPaginationType("client");
    Placeapply.table = table.init();
});
