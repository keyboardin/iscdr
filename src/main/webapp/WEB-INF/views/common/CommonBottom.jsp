<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>		
<script> 
	
	//페이지 이동
	$("[data-mnu]").click(function(){
	    var menu_par_id = $(this).attr("data-mnu");
		var menu_id = $(this).attr("data-smnu");
		var menu_url = $(this).attr("data-url");
		//alert(">> "+menu_par_id+", "+menu_id+", "+menu_url);
		//return false;
	
		var $form = $(document.createElement("form"));
   	 	$form.attr("method", "POST");
   	 	$form.attr("action", menu_url); 
   	 	
   	 	var $input1 = $(document.createElement("input"));
   	 	$input1.attr("name", "menu_par_id").attr('type','hidden').val(menu_par_id);   	 	 	

   	 	var $input2 = $(document.createElement("input"));
   	 	$input2.attr("name", "menu_id").attr('type','hidden').val(menu_id); 
   	 	
   	 	$form.append($input1).append($input2);
   	 	$("body").append($form);
   	 	$form.submit();
	});
	
</script>
</body>
</html>