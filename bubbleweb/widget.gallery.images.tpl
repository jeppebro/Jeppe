<div class="gallery-widget">
	<hr/>
	<ul class="small-block-grid-2 medium-block-grid-2 large-block-grid-3">
		{{foreach $images as $image}}
			<li>
				<a title="{{$image->get_information()}}" href="{{$image->get_image_path()}}" class="fancybox" data-fancybox-group="gallery">
					<img src="{{$image->get_thumb_path()}}" alt="{{$image->get_title()}}">
				</a>
				<div class="title">{{$image->get_title()}}</div>
			</li>
		{{/foreach}}
	</ul>
</div>