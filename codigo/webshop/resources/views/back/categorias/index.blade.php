@extends('layouts.back')

@section('title')
    &vert; Categorias
@endsection

@section('content')
    <div class="container">

        <p class=" text-bg-secondary p-3 fs-5"> <i class="bi bi-box-seam-fill"></i>Categorias</p>

    <div><a href="/categorias/create"> <button type="button" class="btn btn-primary"><i class="bi bi-plus"></i> Nuevo</button></a></div>
    <p>&nbsp;</p>
            <table id="tablaCategorias" class="table table-bordered table-striped table-sm table-hover dataTable">

                <thead class="table-primary">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Titulo</th>
                        <th scope="col">logo</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($categorias as $categoria)
                    <tr>
                        <td>{{$categoria->id}}</td>
                        <td>{{$categoria->desc_categoria}}</td>
                        <td><img src="/categorias/getLogo/{{ $categoria->id }}/"></td>
                        <td>
                        <a href="/categorias/show/{{$categoria->id}}"><button type="button" class="btn btn-primary"><i class="bi bi-eye"></i></button></a>
                        <a href="/categorias/edit/{{$categoria->id}}"><button type="button" class="btn btn-warning"><i class="bi bi-pencil"></i></button></a>
                        <a href="/categorias/delete/{{$categoria->id}}" onclick="return confirm('Estás seguro de querer borrar la categoría {{$categoria->id}} ?')" >
                            <button id="botonborrar" type="button" class="btn btn-danger" on_click="eliminar('{{$categoria->id}}')"><i class="bi bi-trash"></i></button>
                        </a>
                    </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

@push('scripts')

@endpush
