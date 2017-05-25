<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<head>
<script src="/common/js/jquery-1.12.0.min.js"></script>
<script src="/common/js/vue.min.js"></script>
<script src="https://cdn.rawgit.com/chrisvfritz/5f0a639590d6e648933416f90ba7ae4e/raw/98739fb8ac6779cb2da11aaa9ab6032e52f3be00/currency-validator.js"></script>
<script>
$(document).ready(function() {
	
	Vue.component('my-component1', {
	  	template: '<div>사용자 정의 컴포넌트1 입니다!</div>'
	})
	
	var child = {
		template : '<div>사용자 정의 컴포넌트2 입니다!</div>'
	}
	
	Vue.component('my-component3', {
	  	template: '<span>{{message}}</span>',
	  	data : function() {
	  		return  {
	  			message : 'hello'
	  		}
	  	}
	})
	
	Vue.component('simple-counter', {
		template : '<button v-on:click="counter += 1">{{counter}}</button>',
		data : function() {
			return {
				counter : 0
			}
		}
	})
	
	Vue.component('child', {
		props : ['message'],
		template : '<span>{{message}}</span>'
	})
	
	Vue.component('child01', {
		props: ['myMessage'],
		template: '<span>{{myMessage}}</span>'
	})
	
	Vue.component('button-counter', {
		template : '<button v-on:click="increment">{{counter}}</button>',
		data : function() {
			return {
				counter : 0
			}
		},
		methods : {
			increment : function() {
				this.counter += 1
				this.$emit('increment')
			}	
		}
	})
	
	Vue.component('currency-input', {
		template: '<span>$<input ref="input"v-bind:value="value"v-on:input="updateValue($event.target.value)"></span>',
		props : ['value'],
		methods : {
			updateValue : function(value) {
				var formattedValue = value
				.trim()
				.slice(0, value.indexOf('.') + 3)
				
				if(formattedValue !== value) {
					this.$refs.input.value = formattedValue
				}
				this.$emit('input', Number(formattedValue))
			}
		}
	})
	
	Vue.component('currency-input2', {
		template : '<div><label v-if="label">{{label}}</label><input ref="input" v-bind:value="value" v-on:input="updateValue($event.target.value)" v-on:focus="selectAll" v-on:blur="formatValue"></div>',
		props : {
			value : {
				type : Number,
				default : 0
			},
			label : {
				type : String,
				default : ''
			}
		},
		mounted : function() {
			this.formatValue()
		},
		methods : {
			updateValue : function(value) {
				var result = currencyValidator.parse(value, this.value)
				if(result.warning) {
					this.$refs.input.value = result.value
				}
				this.$emit('input', result.value)
			},
			formatValue : function() {
				this.$refs.input.value = currencyValidator.format(this.value)
			},
			selectAll : function(event) {
				setTimeout(function() {
					event.target.select()
				}, 0)
			}
		}	
	}) 
	
	// 루트 인스턴스 생성
	new Vue({
	  	el: '#ex01',
	  	data : {
	  		parentMsg : '부모로부터 전달 받은 메시지',
	  		total : 0,
	  		total2 : 0,
	  	    price : 0,
	  	    price2 : 0,
	  	    shipping : 0,
	  	    handling : 0,
	  	    discount : 0
	  	},
	  	computed : {
	  		total2 : function() {
	  	      return ((
	  	            this.price2 * 100 + 
	  	            this.shipping * 100 + 
	  	            this.handling * 100 - 
	  	            this.discount * 100
	  	          ) / 100).toFixed(2)
	  		}
	  	},
	  	methods : {
	  		incrementTotal : function() {
	  			this.total += 1
	  		}
	  	},
	  	components : {
			'my-component2' : child
		}
	})
	
});

</script>
<style type="text/css">
div > .demo{padding:5px 10px; border-bottom: 1px dotted black;}
</style>
</head>
<body>
<div id="ex01">
	<div class="demo">
	  	<my-component1></my-component1>
	  	<my-component2></my-component2>
	  	<my-component3></my-component3>
  	</div>
  	<div class="demo">
	  	<simple-counter></simple-counter>
	  	<simple-counter></simple-counter>
	  	<simple-counter></simple-counter>
  	</div>
  	<div class="demo">
  		<child message="안녕하세요"></child>
  	</div>
  	<div class="demo">
  		<input v-model="parentMsg">
  		<br>
  		<child01 :my-message="parentMsg"></child01>
  	</div>
  	<div class="demo">
  		<p>{{total}}</p>
  		<button-counter v-on:increment="incrementTotal"></button-counter>
  		<button-counter v-on:increment="incrementTotal"></button-counter>
  	</div>
  	<div class="demo">
		<currency-input v-model="price"></currency-input>  	
  	</div>
  	<div class="demo">
  		<currency-input2 label="Price" v-model="price2"></currency-input2>
  		<currency-input2 label="Shipping" v-model="shipping"></currency-input2>
  		<currency-input2 label="Handling" v-model="handling"></currency-input2>
  		<currency-input2 label="Discount" v-model="discount"></currency-input2>
  		<p>Total: {{ total2 }}</p>
  	</div>
</div>
</body>
