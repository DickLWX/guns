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
            {title: '申请人', field: 'name', visible: true, align: 'center', valign: 'middle'},
            {title: '通过人', field: 'passname', visible: true, align: 'center', valign: 'middle'},
            {title: '申请时间', field: 'passtime', visible: true, align: 'center', valign: 'middle'}
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

$(function () {
    var defaultColunms = Placeapply.initColumn();
    var table = new BSTable(Placeapply.id, "/placeapply/place/list", defaultColunms);
    table.setPaginationType("client");
    Placeapply.table = table.init();
});
