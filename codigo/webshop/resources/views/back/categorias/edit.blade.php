@extends('layouts.back')

@section('title')
    &vert; categorias
@endsection

@section('content')
    <form method="POST" action="/categorias/update/{{ $categoria->id }}" enctype="multipart/form-data">
        @csrf

        <div class="row">
            <div class="col-lg-7">
                <div class="card mb-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">Categoria.editar</div>

                            <div class="col fs-5 text-end">
                            <i class="bi bi-box-seam-fill"></i>
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                    <div class="row mb-2">
                            <label for="id" class="col-md-2 col-form-label">id</label>

                            <div class="col-md-10">
                                <input id="id" name="id" type="text"  disabled class="form-control @error('id') is-invalid @enderror js-identification"
                                    value="{{ $categoria->id }}" autofocus>

                                @error('customer_last_name')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-2">
                            <label for="desc_categoria" class="col-md-2 col-form-label">desc_categoria</label>

                            <div class="col-md-10">
                                <input id="desc_categoria" name="desc_categoria" type="text" class="form-control @error('desc_categoria') is-invalid @enderror js-identification"
                                    value="{{ $categoria->desc_categoria }}" autofocus>

                                @error('customer_last_name')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-1">
                            <label for="logo" class="col-md-2 col-form-label">logo</label>

                            <div class="col-md-10">
                                <input type="file" id="logo" name="logo" type="text" class="form-control @error('logo') is-invalid @enderror js-identification"
                                    value="{{ old('logo') }}">

                                @error('logo')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>





                    <div class="card-footer">
                        <a href="/categorias"><button type="button" class="btn btn-secondary"><i class="bi bi-arrow-left-circle-fill"></i></i> volver</button></a>
                        <button type="submit" class="btn btn-success"><i class="bi bi-check"></i></i> guardar</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
@endsection
