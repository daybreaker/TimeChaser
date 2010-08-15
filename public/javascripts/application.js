$(function() {	
	$('#select_company').find('.m_itemMain').toggle(
		function(){
			var $this = $(this);
			$this.addClass('m_down').removeClass('m_up');
			var $menu = $this.prev();
			$($menu.find('li').get().reverse()).each(function(){
				$(this).show();
			});
			$menu.show('600');
		},
		function(){
			var $this 	= $(this);
			$this.addClass('m_up').removeClass('m_down');
			var $menu	= $this.prev();
			$menu.hide('1000', function() {
				$($menu.find('li').get().reverse()).each(function(){
					var $li = $(this);
					$li.hide();
				});
			});
		}
	);
	
	$(".available_company").click(function(){
		$('.m_itemMain').click();
		comp_id = $(this).attr('id');
		$("#selected_company").html($(this).html());
		if (comp_id == "new"){
			
		} else{
			temp = comp_id.split('_');
			$("#project_list").load("/companies/" + temp[2] + "/projects");
		}
	});
});