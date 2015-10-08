<div class="news-view">
	{{if $article->images}}
		<div class="flexslider">
			<ul class="slides">
				{{foreach $article->images as $image}}
					<lI><a href="{{$image->get_image_path(false)}}" class="fancybox" data-fancybox-group="news"><div class="image" style="background-image:url('{{$image->get_image_path(false)}}&amp;w=700&amp;h=380');"></div></a></lI>
				{{/foreach}}
			</ul>
		</div>
	{{/if}}

	<div class="date">D. {{$article->created_at|date_format:"%d %B %Y"}}</div>

	<h1>{{$article->title}}</h1>

	<div class="content">{{$article->content}}</div>

	<p><a href="p/nyheder">Tilbage til oversigt</a></p>

	{{assign "url_encoded" "http://"|cat:$smarty.server.SERVER_NAME|cat:$smarty.server.REQUEST_URI|escape:'url'}}
	<div class="social">
		<hr>

		<div class="row">
			<div class="medium-8 columns">
				<h3>Facebook comments</h3>
				<div class="fb-comments" data-href="{{"http://"|cat:$smarty.server.SERVER_NAME|cat:$smarty.server.REQUEST_URI}}" data-width="100%" data-numposts="5" data-colorscheme="light"></div>
			</div>

			<div class="medium-4 columns">
				<h3>Del denne nyhed</h3>
				<ul class="icons">
					<li><a href="http://www.facebook.com/sharer/sharer.php?u={{$url_encoded}}" title="Share on Facebook" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=700');return false;" class="facebook"><i class="fa fa-facebook-square"></i></a></li>
					<li><a href="http://www.linkedin.com/shareArticle?mini=true&amp;url={{$url_encoded}}" title="Share on Linkedin" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=700');return false;" class="linkedin"><i class="fa fa-linkedin-square"></i></a></li>
					<li><a href="http://twitter.com/share" title="Share on Twitter" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=700');return false;" class="twitter"><i class="fa fa-twitter-square"></i></a></li>
					<li><a href="http://plus.google.com/share?url={{$url_encoded}}" title="Share on Google+" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=700');return false;" class="google"><i class="fa fa-google-plus-square"></i></a></li>
					{{if $article->featured_image}}
						{{assign "image_url_encoded" "http://"|cat:$smarty.server.SERVER_NAME|cat:{{$article->featured_image->get_image_path(false)}}|escape:'url'}}
						<li><a href="http://www.pinterest.com/pin/create/button/?url={{$url_encoded}}&amp;media={{$image_url_encoded}}&amp;description={{$article->title|escape:'url'}}" title="Pin on Pinterest" onclick="javascript:window.open(this.href,'','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=700');return false;" class="pinterest"><i class="fa fa-pinterest-square"></i></a></li>
					{{/if}}
				</ul>
			</div>
		</div>
	</div>
</div>

{{if $blog->commentable}}
	<hr>

	<h1>Kommentarer</h1>
	{{foreach $article->comments as $comment}}
		{{include 'snippet/blog/comment.tpl'}}
		{{if !$comment@last}}<hr>{{/if}}
		{{foreachelse}}
		<p>Der er endnu ikke skrever nogle kommentarer...</p>
	{{/foreach}}

	<h1>Skriv en kommentar</h1>
	{{include 'snippet/blog/comment_create.tpl'}}
{{/if}}