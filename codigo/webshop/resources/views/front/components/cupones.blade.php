<div class="container-fluid">
	<div class="row">
		@foreach ($cupones as $cupon)
		<div class="col-md-6">
			<img src="/cupones/getImagen/{{ $cupon->id }}" class="img-fluid" />
		</div>
		@endforeach
	</div>
</div>
  