{{foreach $slides as $slide}}
	<li>
		<div class="image" style="background-image:url('{{$slide->get_image()|replace:'gallery/':'gallery/thumb_'}}');"></div>
		<div class="info-wrap">
			<div class="info">
				<div class="title">{{$slide->get_title()}}</div>
				{{if $slide->get_description()}}<div class="description">{{$slide->get_description()}}</div>{{/if}}
				{{if $slide->get_link()}}<a href="{{$slide->get_link()}}">Læs mere her</a>{{/if}}
			</div>
		</div>
	</li>
{{/foreach}}