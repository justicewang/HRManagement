var oldname;
var oldpassword;
$(document).ready(function(){
	
});

// add function
$(document).on("click","#addbutton",function(){
	console.log("addfunction");
	var username = $("#newname").val();
	var password = $("#newpassword").val();
	if(username=="" || password ==""){
		alert("please fillt the username or password");
	}
	else{
		window.location.href = "AddUser.jsp?name="+username+"&password="+password;
	}
});

// edit function
$(document).on("click",".edit",function(){
	var id = $(this).parents('tr').attr('id');
	oldname = $('#'+id+" .username").html();
	$('#'+id+" .inputname").val(oldname);
	oldpassword = $('#'+id+" .password").html();
	$('#'+id+" .inputpassword").val(oldpassword);
	$("#"+id+" td:odd").removeClass('hideCls');
	$("#"+id+" td:even").addClass('hideCls');
});

//save function
$(document).on("click",".save",function(){
	var id = $(this).parents('tr').attr('id');
	var username = $('#'+id+" .inputname").val();
	var password = $('#'+id+" .inputpassword").val();
	$("#"+id+" td:even").removeClass('hideCls');
	$("#"+id+" td:odd").addClass('hideCls');
	window.location.href = "UpdateUser.jsp?name="+username
							+"&password="+password
							+"&oldname="+oldname
							+"&oldpassword="+oldpassword;
});
//cancel function
$(document).on("click",".cancel",function(){
	var id = $(this).parents('tr').attr('id');
	$("#"+id+" td:even").removeClass('hideCls');
	$("#"+id+" td:odd").addClass('hideCls');
});
//delete function
$(document).on("click",".delete",function(){
	var id = $(this).parents('tr').attr('id');
	var username = $('#'+id+" .username").html();
	var password = $('#'+id+" .password").html();
	window.location.href = "DeleteUser.jsp?name="+username+"&password="+password;
});