function getDuplicatedInfo(id) {
    if (id > 1) {
        ajaxHelper('admin/GetInfoById', 'post', { id: parseInt(id/10) }, function (data) {
            if (data.success) {
                var result = '姓名:' + data.result.Name + '\n'
                result += ('简介:' + data.result.Introduction + '\n')
                result += ('故事:' + data.result.Story + '\n')
                return result
            }
        })
    }
}

function ajaxHelper(url, type, data, callback) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        success: callback,
        error: function () {
            alert('操作失败，请稍后重试')
        }
    })
}