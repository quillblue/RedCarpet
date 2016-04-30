function deleteEditApply(id) {
    ajaxHelper('DeleteEditApply', 'post', { id: id }, function (data) {
        if (data.success) {
            alert('操作成功')
        }
        else {
            alert('操作失败，请重试['+data.message+']')
        }
    })
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