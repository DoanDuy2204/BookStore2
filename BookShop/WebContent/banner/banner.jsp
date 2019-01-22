
<div class="header container-fluid">
	<div class="row banner" id="banner">
		<button class="btn btn-secondary button-click1"
			onclick="checkMoveNext()">
			<i class="fas fa-angle-right"></i>
		</button>
		<button class="btn btn-secondary button-click2"
			onclick="checkMovePreview()">
			<i class="fas fa-angle-left"></i>
		</button>
	</div>
</div>
	<script type="text/javascript">
		var strbanner = ['banner1','banner2','banner3'];
		var banner = document.getElementById('banner');
		var i = 0;
		var url = 'url(\'image/banner/banner1.jpg\')';
		banner.style.backgroundImage = url;
		function checkMoveNext(){
			if(i<(strbanner.length-1))
				i++;
			else
				i=0;
			var src = 'url(\'image/banner/'+strbanner[i]+'.jpg\')';
			banner.style.backgroundImage = src;
		}
		function checkMovePreview(){
			if(i>0)
				i--;
			else
				i=2;
			var src = 'url(\'image/banner/'+strbanner[i]+'.jpg\')';
			banner.style.backgroundImage = src;
		}
	</script>