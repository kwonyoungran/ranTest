<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
  	<div class="content text-center">
		<div class="main_search box box-solid box-default">
			<div class="box-header">
				<div class="">조회조건</div>
			</div>
			<div class="box-body">
				<div class="row">
					<label class="col-sm-2">기준일자</label>
					<div class="col-sm-10">
						<button type="button" class="btn btn-default pull-right" id="daterange-btn">
							<span>
								<i class="fa fa-calendar"></i> Date range picker
							</span>
							<i class="fa fa-caret-down"></i>
						</button>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2">채널사명</label>
					<div class="col-sm-10">
						<select>
							<option value="">PAYCO</option>
							<option value="">삼성페이</option>
						</select>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2">제휴사명</label>
					<div class="col-sm-10">
						<select>
							<option value="">CU</option>
							<option value="">대한항공</option>
						</select>
					</div>
				</div>
				<div class="row">
					<label class="col-sm-2">멤버십명</label>
					<div class="col-sm-10">
						<select>
							<option value="">CU</option>
							<option value="">대한항공 스카이패스</option>
						</select>
					</div>
				</div>
			</div>
			<div class="box-footer text-right" style="padding-right:15px; padding-bottom:15px;">
				<button class="btn btn-primary btn-sm active">조회</button>
			</div>
		</div>
		<div class="box box-solid box-default">
			<div class="box-header">누적가입자</div>
			<div class="box-body">
				<div class="col-md-4 col-sm-12 col-xs-12">
			     	<div class="info-box">
			       		<span class="info-box-icon bg-yellow"><i class="fa fa-star-o"></i></span>
				       	<div class="info-box-content">
				         	<span class="info-box-text">TOTAL</span>
				         	<span class="info-box-number">1,410</span>
				       	</div><!-- /.info-box-content -->
			     	</div><!-- /.info-box -->
			   	</div><!-- /.col -->
			   
				<div class="col-md-4 col-sm-6 col-xs-12">
			     	<div class="info-box">
			       		<span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
				       	<div class="info-box-content">
				         	<span class="info-box-text"><img src="/common/images/payco_logo.png"></span>
				         	<span class="info-box-number">1,410</span>
				       	</div><!-- /.info-box-content -->
			     	</div><!-- /.info-box -->
			   	</div><!-- /.col -->
			   
			   	<div class="col-md-4 col-sm-6 col-xs-12">
			      	<div class="info-box">
			        	<span class="info-box-icon bg-aqua"><i class="fa fa-star-o"></i></span>
			        	<div class="info-box-content">
			          		<span class="info-box-text"><img src="/common/images/samsumgPay_logo.png"></span>
			          		<span class="info-box-number">410</span>
			        	</div><!-- /.info-box-content -->
			      	</div><!-- /.info-box -->
			    </div><!-- /.col -->
		    </div>
		</div>
		
		<div class="box box-solid box-default">
			<div class="btn-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default">Left</button>
				<button type="button" class="btn btn-default">Middle</button>
				<button type="button" class="btn btn-default">Right</button>
			</div>		
		</div>
  	</div>
</body>




