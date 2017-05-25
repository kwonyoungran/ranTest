<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<head>
<script src="/common/js/jquery-1.12.0.min.js"></script>
<script src="/common/js/vue.min.js"></script>
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js"></script>
<script>
$(document).ready(function() {
	var app = new Vue({
		el : '#app',
		data : {
			message : '안녕하세요 Vue!'
		}
	});
	
	var app2 = new Vue({
		el : '#app-2',
		data : {
			message : '이 페이지는' + new Date() + '에 로드 되었습니다.'
		}
	});
	
	var app3 = new Vue({
		el : '#app-3',
		data : {
			seen : false
		}
	});
	
	var app4 = new Vue({
		el : '#app-4',
		data : {
			todos : [
				{text : 'Learn JavaScript'},
				{text : 'Learn Vue'},
				{text : 'Build something awesome'}
			]
		}
	})
	
	app4.todos.push({text : 'New item'});
	
	var app5 = new Vue({
		el : '#app-5',
		data : {
			message : '안녕하세요! Vie.js!'
		},
	 	methods : {
	 		reverseMessage:function() {
	 			this.message = this.message.split('').reverse().join('');
	 		}
	 	}
	});
	
	var app5_1 = new Vue({
		el : '#app-5_1',
		data : {
			message : '안녕하세요'
		},
		computed : {
			reverseMessage : function() {
				return this.message.split('').reverse().join();
			}
		}
	});
// 	console.log(app5_1.reverseMessage);
	app5_1.message = '잘가';
// 	console.log(app5_1.reverseMessage);
	
	var app5_2 = new Vue({
		el : '#app-5_2',
		data : {
			message : '안녕하세요'
		},
		methods : {
			reverseMessage : function() {
				return this.message.split('').reverse().join();
			}
		}
	});
	
	var app6 = new Vue({
		el : '#app-6',
		data : {
			message : 'Hello Vue!'
		}
	});
	
	Vue.component('todo-item', {
		props:['todo'],
		template : '<li>{{todo.text}}</li>'
	});
	
	var app7 = new Vue({
		el : '#app-7',
		data : {
			groceryList : [
				{text : 'Vegetables'},
				{text : 'Cheese'},
				{text : 'Whatever else humans are supposed to eat'}
			]
		}
	});
	
	var app8 = new Vue({
		el : '#demo',
		data : {
			firstName : 'Foo',
			lastName : 'Bar',
			fullName : 'Foo Bar'
		},
		watch : {
			firstName : function (val) {
				this.fullName = val + ' ' + this.lastName;
			},
			lastName : function (val) {
				this.fullName = this.firstName + ' ' + val;
			}
		}
	});
	
	var app8_1 = new Vue({
		el : '#demo_1',
		data : {
			firstName : 'Foo',
			lastName : 'Bar'
		},
		computed : {
			fullName : function() {
				return this.firstName + ' ' + this.lastName;
			}
		}
	});
	
	var app9 = new Vue({
		el : "#app-9",
		data : {
			firstName : 'Foo',
			lastName : 'Bar'
		},
		computed : {
			fullName : {
				get : function() {
					return this.firstName + ' ' + this.lastName;
				},
				set : function(newValue) {
					var names = newValue.split(' ');
					this.firstName = names[0];
					this.lastName = names[names.length-1];
				}
			}
		}
	});
	app9.fullName = 'John Doe';
	
	var vm = new Vue({
		data : {
			a : 1
		},
		created : function() {
// 			console.log("a is : " + this.a);
		}
	});
	
	var watchExampleVM = new Vue({
		el : '#watch-example',
		data : {
			question : '',
			answer : 'I cannot give you an answer until you ask a question!'
		},
		watch : {
			question : function(newQuestion) {
				this.answer = 'Waiting for you to stop typing...';
				this.getAnswer();
			}
		},
		methods : {
			getAnswer : _.debounce(
				function() {
					var vm = this;
					if(this.question.indexOf('?') === -1) {
						vm.answer = 'Questions usually contain a question mark. ;-)';
						return;
					}
					vm.answer = 'Thinking...',
					axios.get('https://yesno.wtf/api')
					.then(function(response) {
						vm.answer = _.capitalize(response.data.answer);
					})
					.catch(function(error) {
						vm.answer = 'Error! could not reach the API.' + error;
					})
				},
				500
			)
		}
	});
	
	var app10 = new Vue({
		el : "#app-10",
		data : {
			isActive : false,
			hasError : true
		}
	});
	
	var app11 = new Vue({
		el : "#app-11",
		data : {
			classObject: {
				active : true,
				'text-danger' : true
			}
		}
	});
	
	var app12 = new Vue({
		el : "#app-12"
	});
	
	var app13 = new Vue({
		el : "#app-13",
		data : {
			type : 'D'
		}
	});
	
	var app14 = new Vue({
		el : "#app-14",
		data : {
			loginType : 'username'
		},
		methods : {
			changeType : function() {
				return this.loginType = this.loginType === 'username' ? 'email' : 'username';
			}
		}
		
	});
	

	Vue.component('todo-item', {
		template: '\<li>\{{ title }}\<button v-on:click="$emit(\'remove\')">X</button>\</li>\
		',
		props: ['title']
	})

	new Vue({
	  		el: '#todo-list-example',
	  		data: {
	   			newTodoText: '',
	    		todos: [
					'Do the dishes',
					'Take out the trash',
					'Mow the lawn'
	    		]
	 	 	},
	 		methods: {
	    		addNewTodo: function () {
	      			this.todos.push(this.newTodoText);
	      			this.newTodoText = '';
	    		}
	  		}
	})

	
	
});

</script>
<style>
	.active{font-weight: bold;}
	.text-danger{color:red;}
	.static{background-color:lime; }
</style>
</head>
<body>
<a href="/study/vue/component.jsp">
	<button type="button">GO Component</button>
</a>
<a href="/study/vue/advanced.jsp">
	<button type="button">GO Advanced</button>
</a>
<a href="/study/vue/example.jsp">
	<button type="button">GO Example</button>
</a>

<div id="app">
  {{ message }}
</div>

<div id="app-2">
	<span v-bind:title="message">
		내 위에 마우스를 올리면 동적으로 바인딩 된 title을 볼 수 있습니다!
	</span>
</div>

<div id="app-3">
  	<p v-if="seen">이제 나를 볼 수 있어요</p>
</div>

<div id="app-4">
	<ol>
		<li v-for="list in todos">
			{{list.text}}
		</li>
	</ol>
</div>

<div id="app-5">
	<p>{{message}}</p>
	<button v-on:click="reverseMessage">메시지 뒤집기</button>
</div>

<div id="app-5_2">
	<p>{{reverseMessage()}}</p>
</div>

<div id="app-6">
	<p>{{message}}</p>
	<input v-model="message">
</div>

<div id="app-7">
	<ol>
		<todo-item v-for="item in groceryList" v-bind:todo="item"></todo-item>
	</ol>
</div>

<div id="example"></div>

<div id="demo">{{fullName}}</div>

<div id="demo_1">{{fullName}}</div>

<div id="app-9">
	{{fullName}}
</div>

<div id="watch-example">
	<p>
		Ask a yes/no questioin : 
		<input v-model="question"> 
	</p>
	<p>{{answer}}</p>
</div>

<hr></hr>
<h2>CLASS & STYLE Binding</h2>
<div id="app-10" class="static" v-bind:class="{'text-danger':hasError, active:isActive}">test1</div>
<div id="app-11" v-bind:class="classObject">test2</div>

<div id="app-12">
	<div v-if="Math.random() > 0.5">
		Now you see me
	</div>
	<div v-else>
		Now you don't
	</div>
</div>


<div id="app-13">
	<div v-if="type === 'A'">
	 	A
	</div>
	<div v-else-if="type === 'B'">
	 	B
	</div>
	<div v-else-if="type === 'C'">
	 	C
	</div>
	<div v-else>
	 	Not A/B/C
	</div>
</div>

<hr></hr>
<div id="app-14">
	<template v-if="loginType === 'username'">
		<lable>사용자이름</lable>
		<input placeholder="사용자 이름을 입력하세요" key="username-input">
	</template>
	<template v-else="">
		<label>이메일</label>
		<input placeholder="이메일 주소를 입력하세요" key="email-input">
	</template>
	<button v-on:click="changeType">로그인 유형 변경</button>
</div>

<hr></hr>
<div id="example-1">
	<li v-for="item in items">
		{{item.message}}
	</li>
</div>

<script>
var example1 = new Vue({
	el : '#example-1',
	data : {
		items : [
			{message : 'Foo'},
			{message : 'Bar'}
		]
	}
});
</script>

<div id="example-2">
<!-- 	<li v-for="(item, index) in items"> -->
	<li v-for="(item, index) of items">
		{{parentMessage}} - {{index}} - {{item.message}}
	</li>
</div>

<script>
var example2 = new Vue({
	el : '#example-2',
	data : {
		parentMessage : 'Parent',
		items: [
			{message : 'Foo'},
			{message : 'Bar'}
		]
	}
});
</script>

<ul id="repeat-object" class="demo">
	<li v-for="(value, key, index) in object">
		{{index}}. {{key}} : {{value}}
	</li>
</ul>

<script>
new Vue({
	el : '#repeat-object',
	data : {
		object : {
			firstName : 'John',
			lastName : 'Doe',
			age : 30
		}
	}
});

</script>

<div id="repeat-object2">
	<span v-for="n in 10">{{n}}</span>
</div>

<script>
new Vue({
	el : '#repeat-object2'
})
</script>

<div id="todo-list-example">
	<input v-model="newTodoText" v-on:keyup.enter="addNewTodo" placeholder="Add a todo">
	<ul>
		<li is="todo-item" v-for="(todo, index) in todos" v-bind:title="todo" v-on:remove="todos.splice(index,1)"></li>
	</ul>
</div>

<div id="app-15">
	<li v-for="n in evenNumbers">{{n}}</li>
</div>

<script>
	new Vue({
		el : '#app-15',
		data : {
			numbers : [1,2,3,4,5]
		},
		computed : {
			evenNumbers : function() {
				return this.numbers.filter(function (number) {
// 					console.log("number : " + number);
					return number % 2 === 0
				})
			}
		}
	})

</script>

<hr></hr>
<h2>Event Handling</h2>

<h3>1. Listening to Events</h3>
<div id="example11">
	<button v-on:click="counter += 1">Add 1</button>
	<p>The button above has been clicked {{counter}} times.</p>
</div>
<script>
	var example11 = new Vue({
		el : '#example11',
		data : {
			counter : 0
		}
	})
</script>

<h3>2. Method Event Handlers</h3>
<div id="example12">
	<button v-on:click="greet">Greet</button>
</div>
<script>
	var example12 = new Vue({
		el : '#example12',
		data : {
			name : 'ran'
		},
		methods : {
			greet : function(event) {
				alert("hello " + this.name + "!");
				alert(event.target.tagName);
			}
		}
	});
// 	example12.greet();
</script>

<h3>3. Methods in Inline Handlers</h3>
<div id="example13">
	<button v-on:click="say('hi')">Say hi</button>
	<button v-on:click="say('what')">Say what</button>
	<button v-on:click="warn('Form cannot be submitted yet.', $event)">Submit</button>
</div>

<script>
	new Vue({
		el : '#example13',
		methods : {
			say : function(message) {
				alert(message);
			},
			warn : function(message, event) {
				alert(event);
				if(event) event.preventDefault();
				alert(message);
			}
		}
	});
</script>


<h3>4. Form Input Bindings</h3>
<div id="example14">
	<input v-model="message" placeholder="여기를 수정해보세요" />
	<p>메시지 : {{message}}</p>
</div>
<script>
	new Vue({
		el : '#example14',
		data : {
			message : ''
		}
	});
</script>

<div id="example15">
	<span>여러줄을 가지는 메시지 : </span>
	<p style="white-space:pre">{{message}}</p>
	<br>
	<textarea v-model="message" placeholder="여러줄을 입력해보세요"></textarea>
</div>

<script>
	new Vue({
		el : '#example15',
		data : {
			message : ''
		}
	});
</script>

<h3>checkbox</h3>
<div id="example16">
	<input type="checkbox" id="checkbox" v-model="checked" />
	<label for="checkbox">{{checked}}</label>
</div>
<script>
	new Vue({
		el : '#example16',
		data : {
			checked : false
		}
	});
</script>

<div id="example17">
	<input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
	<label for="jack">Jack</label>
	<input type="checkbox" id="john" value="John" v-model="checkedNames">
	<label for="john">John</label>
	<input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
	<label for="mike">Mike</label>
	<br>
	<span>체크한 이름: {{ checkedNames }}</span>
</div>
<script>
	new Vue({
		el : '#example17',
		data : {
			checkedNames : []	
		}
	});
</script>

<h3>radio</h3>
<div id="example18">
	<input type="radio" id="one" value="One_1" v-model="picked">
	<label for="one">One</label>
	<br>
	<input type="radio" id="two" value="Two_2" v-model="picked">
	<label for="two">Two</label>
	<br>
	<span>선택 : {{picked}}</span>
</div>
<script>
 	new Vue({
 		el : '#example18',
 		data : {
 			picked : ''
 		}
 	})
</script>

<h3>select</h3>
<div id="example19">
	<select v-model="selected">
		<option>A</option>
		<option>B</option>
		<option>C</option>
	</select>
	<span>선택 : {{selected}}</span>
</div>
<script>
 	new Vue({
 		el : '#example19',
 		data : {
 			selected : ''
 		}
 	})
</script>

<h3>multiple select</h3>
<div id="example20">
	<select v-model="selected" multiple>
		<option>A</option>
		<option>B</option>
		<option>C</option>
	</select>
	<br>
	<span>selected : {{selected}}</span>
</div>
<script>
 	new Vue({
 		el : '#example20',
 		data : {
 			selected : []
 		}
 	})
</script>

<div id="example21">
	<select v-model="selected">
		<option v-for="option in options" v-bind:value="option.value">
			{{option.text}}
		</option>
	</select>
	<br>
	<span>Selected : {{selected}}</span>
</div>
<script>
 	new Vue({
 		el : '#example21',
 		data : {
 			selected : 'A',
 			options : [
 				{text : 'One', value : 'A'},
 				{text : 'Two', value : 'B'},
 				{text : 'Three', value : 'C'}
 			]
 	
 		}
 	})
</script>

































</body>
