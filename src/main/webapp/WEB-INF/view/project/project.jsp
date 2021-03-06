<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
		<link rel="stylesheet" href="<%=path %>/js/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=path %>/js/layui/css/layui.css">
		<script type="text/javascript" src="<%=path %>/js/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=path %>/js/layui/layui.js"></script>
	</head>
	<body>
		<div style="border: 1px solid #98919b;">
			<form class="layui-form" id="ProWhere" >
				<div class="layui-form-item" style="padding-top: 5px;margin-bottom: 5px" >
					<div class="layui-input-inline" >
						<input type="text" name="ps_name"  class="layui-input"  placeholder="项目名称" >
					</div>
					<div class="layui-input-inline" >
						<input type="text" name="ps_us_id" class="layui-input"  placeholder="项目发起人" >
					</div>
					<div class="layui-input-inline" >
						<select name="ps_pst_id">
							<option selected disabled value="">项目类型</option>
							<option value="1">支教助学</option>
							<option value="2">儿童关爱</option>
							<option value="3">扶老助孤</option>
						</select>
					</div>
					<div class="layui-input-inline" >
						<select name="ps_type">
							<option selected disabled value="">项目状态</option>
							<option value="0">待审核</option>
							<option value="1">待上架</option>
							<option value="2">众筹中</option>
							<option value="3">众筹成功</option>
							<option value="4">众筹失败</option>
							<option value="5">审核未通过</option>
						</select>
					</div>
					<button class="layui-btn layui-btn-normal" lay-submit  lay-filter="Prosub" >
					查询</button>
				</div>
			</form>
		</div >


		<table id="projectData"></table>

		
	</body>
	<script type="text/javascript">
		layui.use(['form','table'],function(){
			var form = layui.form,
				table = layui.table;
			table.render({
				elem:'#projectData',
				url:"<%=path%>/project/getPro.do",
				height:395,
                page: true,
				cols:[[           //formatter:function(value,row,index){
                                         //    return row.house.hxq; }
                    {field:'ps_id',  title: '项目ID', sort: true},
                    {field:'ps_pst_id',title: '项目类型',width:200,
						templet:function (data) {
                        if(data.pst!=null) {
                            return data.pst.pst_name;
						}
						return '';
                        }   },
                    {field:'ps_name',title: '项目名称',width:200},
                    {field:'ps_address',title: '项目地址',width:200},
                    {field:'ps_days',title: '项目天数',width:100},
                    {field:'ps_money',title: '筹集金额',width:100},
                    {field:'ps_starttime',title: '开始时间',width:100},
                    {field:'ps_endtime',title: '结束时间',width:150},
                    {field:'ps_us_id',title: '发起人',width:150,
						templet:function (data) {
                        if(data.user !=null){
                            return data.user.us_name;
						}
                       return '';
                    }   },
                    {fixed:'right',title: '操作',toolbar: '#barDemo',}
				]]
			});

            form.on('submit(Prosub)', function(data){  //点击查询,将数据传入后台,重新加载页面
//                layer.alert(JSON.stringify(data.field), {
//                    title: '最终的提交信息'
//                })
				table.reload('projectData',{
				    where:data.field,
					page:{
				        curr:1
					}
				});
                return false;
            });


        });



	</script>
<
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit" onclick="de()">详情</a>
     </script>

    <

</html>
