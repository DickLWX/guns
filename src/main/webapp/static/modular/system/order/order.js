/**
 * 订单管理初始化
 */
var Order = {
    id: "OrderTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Order.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '发单人', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '快递点', field: 'placeName', visible: true, align: 'center', valign: 'middle'},
            {title: '送达地址', field: 'address', visible: true, align: 'center', valign: 'middle'},
            {title: '悬赏积分', field: 'score', visible: true, align: 'center', valign: 'middle'},
            {title: '货物尺寸', field: 'size', visible: true, align: 'center', valign: 'middle'},
            {title: '货物重量', field: 'weight', visible: true, align: 'center', valign: 'middle'},
            {title: '信誉积分', field: 'reputation', visible: true, align: 'center', valign: 'middle'},
            {title: '发布时间', field: 'createdate', visible: true, align: 'center', valign: 'middle'},
            {title: '最迟期限', field: 'limitdate', visible: true, align: 'center', valign: 'middle'},
            {title: '信誉分', field: 'grade', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Order.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Order.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加订单
 */
Order.openAddOrder = function () {
    var index = layer.open({
        type: 2,
        title: '添加订单',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/order/order_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看订单详情
 */
Order.openOrderDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '订单详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/order/order_update/' + Order.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除订单
 */
Order.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/order/delete", function (data) {
            Feng.success("删除成功!");
            Order.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 接单
 */
Order.getOrder = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/order/getOrder", function (data) {
            if (data.code == 500) {
                Feng.error(data.message);
            } else {
            Feng.success("接单成功!");
            Order.table.refresh();
        }
        }, function (data) {
            Feng.error("接单失败!" + data.responseJSON.message + "!");
        });
        ajax.set("orderId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询订单列表
 */
Order.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Order.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Order.initColumn();
    var table = new BSTable(Order.id, "/order/list", defaultColunms);
    table.setPaginationType("client");
    Order.table = table.init();
});
