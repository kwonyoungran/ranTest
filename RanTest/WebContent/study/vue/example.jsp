<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<head>
<script src="/common/js/jquery-1.12.0.min.js"></script>
<script src="/common/js/vue.min.js"></script>
<script src="/common/js/lodash-4.17.4.js"></script>
<script src="/common/js/marked.js"></script>
<script>
$(document).ready(function() {
	new Vue({
		el : '#editor',
		data : {
			input : '# hello'
		},
		computed : {
			compiledMarkdown : function() {
				return marked(this.input, {sanitize:true})
			}
		},
		methods : {
			update: _.debounce(function (e) {
			      this.input = e.target.value
			}, 300)	
		}
	});
	
	var emailRE = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	
	//Setup Firebase
	var config = {
		apiKey: "AIzaSyAi_yuJciPXLFr_PYPeU3eTvtXf8jbJ8zw",
		authDomain: "vue-demo-537e6.firebaseapp.com",
		databaseURL: "https://vue-demo-537e6.firebaseio.com"
	}
	
	firebase.initializeApp(config)
	
	var usersRef = firebase.database().ref('users')
	
	//create Vue app
	var app = new Vue({
		el : '#app',
		//initial data
		data : {
			newUser : {
				name : '',
				email : ''
			}
		},
		
		
	})
	
	
});
</script>
<style type="text/css">
a {text-decoration: none;}
body {font-familt : Helvetica, Arial, sans-serif;}
ul {padding:0;}

</style>
</head>
<body>
	<div>
		<a href="/study/vue/component.jsp">
			<button type="button">GO Component</button>
		</a>
		<a href="/study/vue/advanced.jsp">
			<button type="button">GO Advanced</button>
		</a>
		<a href="/study/vue/example.jsp">
			<button type="button">GO Example</button>
		</a>
	</div>
	
	<div id="editor">
		<textarea :value="input" @input="update"></textarea>
		<div v-html="compiledMarkdown"></div>
	</div>
	
	<div id="app">
		<ul is="transition-group">
			<li v-for="user in users" class="user" :key="user['.key']">
				<span>{{user.name}} - {{user.email}}</span>
				<button v-on:click="removeUser(user)">X</button>
			</li>
		</ul>
		<form id="form" v-on:submit.prevent="addUser">
			<input type="text" v-model="newUser.name" placeholder="Username">
			<input type="email" v-model="newUser.email" placeholder="email@email.com">
			<input type="submit" value="Add User">
		</form>
		<ul class="errors">
			<li v-show="!validation.name">name cannot be empty.</li>
			<li v-show="!validation.email">Plase provide a valid email address.</li>
		</ul>
	</div>
	
	
</body>
</html>