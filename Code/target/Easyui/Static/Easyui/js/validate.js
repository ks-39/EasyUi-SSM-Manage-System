$.extend($.fn.validatebox.defaults.rules, {

    //验证两个值是否相同
    equals: {//param的值为[]中值
        validator: function (value, param) {
            return $(param[0]).val() === value;

        }, message: '两次密码不同.'
    },

    //密码规则
    password: {
        validator: function (value) {
            var reg = /^[a-zA-Z0-9]{6,16}$/;
            return reg.test(value);

        }, message: '密码6-16位的英文或数字'
    },

    //移动手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|7|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: '请输入正确的11位的手机号'
    },

    //id验证
    admin_no:{
        validator:function (value) {
            var reg = /^A[0-9]\d{1,5}$/;
            return reg.test(value);
        },
        message:'请输入以A开头的Id,总长度在3-7个字之间'
    },

    student_no:{
        validator:function (value) {
            var reg = /^S[0-9]\d{1,5}$/;
            return reg.test(value);
        },
        message:'请输入以S开头的Id,总长度在3-7个字之间'
    },

    teacher_no:{
        validator:function (value) {
            var reg = /^T[0-9]\d{1,5}$/;
            return reg.test(value);
        },
        message:'请输入以T开头的Id,总长度在3-7个字之间'
    },

    clazz_no:{
        validator:function (value) {
            var reg = /^C[0-9]\d{1,5}$/;
            return reg.test(value);
        },
        message:'请输入以C开头的Id,总长度在3-7个字之间'
    }

});