<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Request;
use App\Models\Cupon;


class cuponController extends Controller {

	private $reglasValidacion=[
	'porcentaje' => 'numeric',
	'importe' => 'numeric',
	'compra_minima' => 'numeric',
	'fecha_desde' => 'date_format:d/m/Y',
	'fecha_hasta' => 'date_format:d/m/Y',
	'codigo'  => 'required|max:32',
	'titulo'  => 'required|max:64',
	'imagen' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:4096',
	];

    /* mostrar todas las cupones  cupones/list  */
    public function index(){
       $cupones = cupon::all();
       return view('back.cupon.listado')->with('cupones',$cupones);
    }

    /* mostrar  formulario de alta de cupon  cupones/new */
    public function create(){
      return view('back.cupon.new');
    }

	/* muestra una cupon especifica cupones/show/{id} */
    public function show($id) {
		$cupon=cupon::find($id);
		return view('back.cupon.show')->with('cupon',$cupon);
    }

    /* muestra una cupon especifica cupones/edit/{id} */
    public function edit($id){
        $cupon=cupon::find($id);
		return view('back.cupon.edit')->with('cupon',$cupon);
    }


	/*creamos una nueva cupon    */
    public function store($request)
    {
		//* validamos */
		//$validated = $request->validate($reglasValidacion);

		/* instanciamos una nueva cupon */
		$cupon= new cupon();

		/* actualizamos datos y persistimos */
		$cupon->porcentaje= $request['porcentaje'];
		$cupon->importe= $request['importe'];
		$cupon->compra_minima= $request['compra_minima'];
		$cupon->fecha_desde= $request['fecha_desde'];
		$cupon->fecha_hasta= $request['fecha_hasta'];
		$cupon->codigo= $request['codigo'];
		$cupon->titulo= $request['titulo'];
		$cupon->imagen= $request['imagen'];
	    $cupon->save();

		/* generamos mensage para Toast */
		    $notification = [
            'type' => 'success',
            'title' => 'crear cupon',
            'message' => 'cupon creado correctamente' ,
        ];

       /* volvemos sobre el  formulario de edición */
       return redirect('cupones/edit/' . $cupon->id)->with('notification', $notification);;

    }

    /**
        * Update the specified resource in storage.
        *
        * @param  int  $id
        * @return Response
        */
    public function update($id, $request){
		/* validamos */
		//$validated = $request->validate($reglasValidacion);

		/* localizamos la cupon */
		$cupon= cupon::find($id);

		/* actualizamos datos y persistimos */
		$cupon->porcentaje= $request['porcentaje'];
		$cupon->importe= $request['importe'];
		$cupon->compra_minima= $request['compra_minima'];
		$cupon->fecha_desde= $request['fecha_desde'];
		$cupon->fecha_hasta= $request['fecha_hasta'];
		$cupon->codigo= $request['codigo'];
		$cupon->titulo= $request['titulo'];
		$cupon->imagen= $request['imagen'];
	    $cupon->save();

		/* generamos mensage para Toast */
		    $notification = [
            'type' => 'success',
            'title' => 'editar cupon',
            'message' => 'datos actualizados correctamente' ,
        ];

       /* volvemos sobre el mismo formulario */
       return redirect('cupones/edit/' . $cupon->id)->with('notification', $notification);
    }

    /*Eliminar una cupon cupones/delete/{id}  */
    public function destroy($id)
    {
        /* obtenemos la cupon */
        $cupon = cupon::find($id);

		/* eliminamos productos vinculados */
		$cupon->productos()->delete();

		/* eliminamos cupon */
	     $cupon->delete();

		/* generamos mensage para Toast en la vista de listado */
		    $notification = [
            'type' => 'success',
            'title' => 'Eliminar cupon',
            'message' => 'cupon ' . $cupon->desc_cupon . ' eliminado correctamente' ,
        ];

       // Session::flash('message', 'Successfully deleted the shark!');
        return redirect('cupones/list')->with('notification', $notification);
    }


	/*Obtener imagen de la cupon cupones/imagen/{id}  */
    public function getImagen($id){
        $cupon = Cupon::find($id);
        $response = Response::make($cupon->imagen);
		$response->header('Content-Type', 'image/png');
		return $response;
	}
}
