<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script>
$(document).ready(function(){
	
	$('#testTable').DataTable({
		paging: true
// 		scrollY: 400
		
	});
	
});
</script>
</head>
<body>
	<div class="content">
<!-- 		<table id="testTable" class="table"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<!-- 				<tr> -->
<!-- 					<td>a</td><td>b</td><td>c</td><td>d</td><td>e</td><td>f</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>a</td><td>b</td><td>c</td><td>d</td><td>e</td><td>f</td> -->
<!-- 				</tr> -->
<!-- 			</tbody> -->
<!-- 		</table> -->
		<table class="table" id="testTable" data-order='[[ 6, "desc" ]]' data-page-length='25'>
			<thead>
				<tr>
					<th>멤버십 이름</th>
					<th>멤버십 코드</th>
					<th>총 요청 건수(A)</th>
					<th>총 발급실패 건수(B)</th>
					<th>타임아웃 건수(C)</th>
					<th>타임아웃률(C/B) %</th>
					<th>발급실패율(B/A) %</th>
				</tr>
			</thead>
			<tbody>

				<tr class="tr_1"
					onclick="getDetail('303', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>초록 멤버십</td>
					<td>303</td>
					<td>4</td>
					<td>4</td>
					<td>4</td>
					<td>100.00</td>
					<td>100.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('651', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>형지리테일</td>
					<td>651</td>
					<td>4</td>
					<td>3</td>
					<td>3</td>
					<td>100.00</td>
					<td>75.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('201', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>현대자동차 블루멤버십</td>
					<td>201</td>
					<td>69</td>
					<td>31</td>
					<td>0</td>
					<td>0.00</td>
					<td>44.93</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('502', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>경기문화재단</td>
					<td>502</td>
					<td>3</td>
					<td>1</td>
					<td>1</td>
					<td>100.00</td>
					<td>33.33</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('810', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>현대백화점 U-CARD</td>
					<td>810</td>
					<td>81</td>
					<td>17</td>
					<td>0</td>
					<td>0.00</td>
					<td>20.99</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('112', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>아디다스</td>
					<td>112</td>
					<td>341</td>
					<td>59</td>
					<td>8</td>
					<td>13.56</td>
					<td>17.30</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('121', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>FOLDER</td>
					<td>121</td>
					<td>13</td>
					<td>2</td>
					<td>2</td>
					<td>100.00</td>
					<td>15.38</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('821', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>야우리 멤버스</td>
					<td>821</td>
					<td>8</td>
					<td>1</td>
					<td>1</td>
					<td>100.00</td>
					<td>12.50</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('658', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>블랙야크</td>
					<td>658</td>
					<td>25</td>
					<td>3</td>
					<td>3</td>
					<td>100.00</td>
					<td>12.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('120', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>뉴발란스</td>
					<td>120</td>
					<td>25</td>
					<td>1</td>
					<td>0</td>
					<td>0.00</td>
					<td>4.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('302', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>뷰티포인트</td>
					<td>302</td>
					<td>220</td>
					<td>5</td>
					<td>5</td>
					<td>100.00</td>
					<td>2.27</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('811', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>현대아울렛 멤버십</td>
					<td>811</td>
					<td>90</td>
					<td>2</td>
					<td>2</td>
					<td>100.00</td>
					<td>2.22</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('400', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>스카이패스</td>
					<td>400</td>
					<td>273</td>
					<td>6</td>
					<td>0</td>
					<td>0.00</td>
					<td>2.20</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('210', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>한샘 멤버십</td>
					<td>210</td>
					<td>159</td>
					<td>3</td>
					<td>0</td>
					<td>0.00</td>
					<td>1.89</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('660', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>에쓰오일멤버십</td>
					<td>660</td>
					<td>179</td>
					<td>3</td>
					<td>3</td>
					<td>100.00</td>
					<td>1.68</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('930', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>교보북클럽</td>
					<td>930</td>
					<td>351</td>
					<td>2</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.57</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('956', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>로미스토리 멤버십</td>
					<td>956</td>
					<td>424</td>
					<td>2</td>
					<td>2</td>
					<td>100.00</td>
					<td>0.47</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('920', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>하나투어마일리지클럽</td>
					<td>920</td>
					<td>590</td>
					<td>2</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.34</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('921', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>모두투어</td>
					<td>921</td>
					<td>336</td>
					<td>1</td>
					<td>1</td>
					<td>100.00</td>
					<td>0.30</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('630', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>GS&POINT(칼텍스)</td>
					<td>630</td>
					<td>613</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('805', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>CU멤버십</td>
					<td>805</td>
					<td>499</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('211', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>L-Care</td>
					<td>211</td>
					<td>347</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('606', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>전자랜드 멤버십</td>
					<td>606</td>
					<td>230</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('709', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>S membership</td>
					<td>709</td>
					<td>159</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('304', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>미샤(뷰티마일리지)</td>
					<td>304</td>
					<td>109</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('655', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>LF Members</td>
					<td>655</td>
					<td>86</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('322', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>스킨푸드 멤버십</td>
					<td>322</td>
					<td>78</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('953', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>삼성물산 패션 멤버십</td>
					<td>953</td>
					<td>77</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('800', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>신라면세점</td>
					<td>800</td>
					<td>75</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('910', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>휘닉스파크스마트클럽</td>
					<td>910</td>
					<td>67</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('925', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>ONEMOUNT 멤버십</td>
					<td>925</td>
					<td>61</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('679', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>쑥쑥포인트</td>
					<td>679</td>
					<td>53</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('681', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>더 드림 멤버십</td>
					<td>681</td>
					<td>47</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('931', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>반디앤루니스</td>
					<td>931</td>
					<td>41</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('607', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>LG bestshop 멤버십</td>
					<td>607</td>
					<td>40</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('954', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>에잇세컨즈 멤버십</td>
					<td>954</td>
					<td>36</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('305', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>어퓨(뷰티마일리지)</td>
					<td>305</td>
					<td>28</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('450', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>엠배텔 멤버십</td>
					<td>450</td>
					<td>20</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('971', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>텐바이텐 멤버십</td>
					<td>971</td>
					<td>19</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('707', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>아워홈 A1 Card</td>
					<td>707</td>
					<td>17</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('101', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>e-KOLON</td>
					<td>101</td>
					<td>16</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('716', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>커피명가 멤버십</td>
					<td>716</td>
					<td>14</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('223', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>올가멤버십</td>
					<td>223</td>
					<td>11</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('130', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>휠라 패밀리카드</td>
					<td>130</td>
					<td>11</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('680', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>THE MORE M포인트카드</td>
					<td>680</td>
					<td>8</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('686', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>마인드브릿지&더클래스</td>
					<td>686</td>
					<td>8</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('687', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>닥터마틴 멤버십</td>
					<td>687</td>
					<td>6</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('650', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>패션그룹형지</td>
					<td>650</td>
					<td>6</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('699', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>STCO 멤버십</td>
					<td>699</td>
					<td>6</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('673', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>올리비아로렌</td>
					<td>673</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('802', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>동화면세점</td>
					<td>802</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('973', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>SK패션몰 멤버십</td>
					<td>973</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('714', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>커핀그루나루 멤버십</td>
					<td>714</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('111', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>리복</td>
					<td>111</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('645', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>오야니 멤버십</td>
					<td>645</td>
					<td>5</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('803', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>신라아이파크면세점</td>
					<td>803</td>
					<td>4</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('113', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>KAM(Kappa)</td>
					<td>113</td>
					<td>4</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('685', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>MEWE 멤버십</td>
					<td>685</td>
					<td>4</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('221', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>Solgar membership</td>
					<td>221</td>
					<td>4</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('689', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>발렌시아</td>
					<td>689</td>
					<td>3</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('648', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>까스텔바쟉</td>
					<td>648</td>
					<td>2</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('141', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>슈퍼콤마비</td>
					<td>141</td>
					<td>2</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('923', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>자유투어</td>
					<td>923</td>
					<td>2</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('106', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>커스텀멜로우</td>
					<td>106</td>
					<td>2</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('641', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>암웨이 미술관</td>
					<td>641</td>
					<td>1</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('955', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>FRJ</td>
					<td>955</td>
					<td>1</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('672', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>웰메이드</td>
					<td>672</td>
					<td>1</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('666', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>마운티아</td>
					<td>666</td>
					<td>1</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>

				<tr class="tr_1"
					onclick="getDetail('610', '2016-12-26', '2016-12-26')"
					style="cursor: pointer;">
					<td>LS네트웍스 멤버십</td>
					<td>610</td>
					<td>1</td>
					<td>0</td>
					<td>0</td>
					<td>0.00</td>
					<td>0.00</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>




