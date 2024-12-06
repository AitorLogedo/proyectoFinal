<nav class="navbar navbar-light bg-light">
  <form class="container-fluid justify-content-start">
	@foreach ($categorias as $categoria)
		<a href="/shopping/{{ $categoria->id }}">
			<button class="btn btn-outline-primary me-2" type="button">
				<img height=32 src="/categorias/getLogo/{{ $categoria->id }}" alt="imagen de {{ $categoria->desc_categoria }}"  class="d-inline-block align-text-middle">
				{{ $categoria->desc_categoria }}
			</button>
		</a>
	@endforeach
  </form>
</nav>