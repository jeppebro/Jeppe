<div class="news-list">
	{{if $articles}}
		<ul class="small-block-grid-1 large-block-grid-2">
			{{foreach $articles as $article}}
				<li>
					<div class="post">
						<p class="image">
							<a href="{{$article->url}}">
								{{if $article->featured_image}}
									<img src="{{$article->featured_image}}" alt="{{$artile->title}}">
								{{else}}
									<img src="f/design/no-image.png" alt="{{$artile->title}}">
								{{/if}}
							</a>
						</p>
						<h3>{{$article->title}}</h3>
						<div class="description">{{$article->excerpt_or_content|truncate_html:200}}</div>
						<div class="clearfix">
							<div class="date">D. {{$article->created_at|date_format:"%d. %B %Y"}}</div>
							<div class="goto"><a href="{{$article->url}}">Læs nyhed</a></div>
						</div>
					</div>
				</li>
			{{/foreach}}
		</ul>
	{{else}}
		<p>Der kunne ikke findes nogle nyheder...</p>
	{{/if}}
</div>