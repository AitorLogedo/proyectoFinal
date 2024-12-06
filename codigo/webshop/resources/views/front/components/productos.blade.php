<div class="container-fluid">
	<div class="row">
		@foreach ($productos as $producto)
		<div class="col-md-3">
			<div class="card">
				<img src="/recursos/thumbnail/{{ $producto->id }}"  style="max-width:50% "alt="imagen producto" >
				<div class="card-body">
					<h5 class="card-title">{{ $producto->codigo }}</h5>
					<p class="card-text">{{ $producto->titulo }}</p>
				</div>
			</div>
		</div>
		@endforeach
	</div>
</div>
  