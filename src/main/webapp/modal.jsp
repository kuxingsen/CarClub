<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 联系我们模态框 -->
<div class="modal fade in" id="contact">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">联系我们</h3>
			</div>
			<div class="modal-body">
				咨询热线：854854854、99999999<br />
				总部地址：肇庆市端州区肇庆学院主校区5区101<br />
				官方网站：www.xxx.com
			</div>
		</div>
	</div>
</div>

<!-- 投书建议模态框 -->
<div class="modal fade in" id="suggest">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">投诉建议</h3>
			</div>
			<div class="modal-body">
				<form action="">
					<div class="form-group">
						<label for="name" class="control-label">姓名:</label>
						<input type="text" class="form-control" name="name" id="name">
					</div>
					<div class="form-group">
						<label for="tel" class="control-label">电话:</label>
						<input type="text" class="form-control" name="tel" id="tel">
					</div>
					<div class="form-group">
						<label for="message" class="control-label">留言:</label>
						<textarea class="form-control" name="message"  id="message" style="height:80px"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-lg btn-primary">发送</button>
			</div>
		</div>
	</div>
</div>

<!-- 人才招聘模态框 -->
<div class="modal fade in" id="wanted">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="close" data-dismiss="modal">×</div>
				<h3 class="modal-title">人才招聘</h3>
			</div>
			<div class="modal-body">
				<strong>所在部门</strong><br /><br/>
				服务部<br/><br/>
				<strong>职位要求</strong><br /><br/>
				<pre>
1、专本科以上学历
2、热情好客，良好的沟通和表达能力
3、独立工作能力和管理能力，具备领导和管理一个或者多个小组的能力
</pre><br/>
				<strong>待遇</strong><br /><br/>
				月薪：4000-8000元<br/>
				带薪休假<br/><br/>

				<strong>特别提示</strong><br /><br/>
				投递简历Email地址：jws@CarManger.com，主题请按下列格式：姓名+应聘职位+学历。<br/><br/>
			</div>
		</div>
	</div>
</div>
