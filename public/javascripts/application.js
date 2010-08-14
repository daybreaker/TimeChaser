$(document).ready(function() {
	
	$("#choose_company").change(function(){
		$("#project_list").load("/companies/" + $(this).val() + "/projects");
	})
	
})