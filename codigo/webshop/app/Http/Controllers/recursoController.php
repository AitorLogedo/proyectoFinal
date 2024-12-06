<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Response;
use Illuminate\Http\Facades\Request;
use Illuminate\Http\Redirect;
use Illuminate\Support\Facades\Log;
use App\Models\Producto;
use App\Models\Opinion;
use App\Models\Recurso;

class recursoController extends Controller {

	private $reglasValidacion=[
	'tipo_objeto' => 'required|numeric',
	'objeto' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:4096',
	];


	/*creamos una nueva recurso    */
    public function store($request)
    {
		//* validamos */
		//$validated = $request->validate($reglasValidacion);

		/* instanciamos una nueva recurso */
		$recurso= new recurso();

		/* actualizamos datos y persistimos */
		/* actualizamos datos y persistimos */
		$recurso->tipo_objeto= $request['tipo_objeto'];
		$recurso->objeto= $request['objeto'];
	    $recurso->save();

    }

    /**
        * Update the specified resource in storage.
        *
        * @param  int  $id
        * @return Response
        */
    public function update($id,$request){
		/* validamos */
		//$validated = $request->validate($reglasValidacion);

		/* localizamos la recurso */
		$recurso= recurso::find($id);

		/* actualizamos datos y persistimos */
		$recurso->tipo_objeto= $request['tipo_objeto'];
		$recurso->objeto= $request['objeto'];
	    $recurso->save();

    }

    /*Eliminar una recurso recursos/delete/{id}  */
    public function destroy($id)
    {
        /* obtenemos la recurso */
        $recurso = recurso::find($id);

		/* eliminamos recurso */
	     $recurso->delete();

    }


	/*Obtener imagen de la recurso recursos/imagen/{id}  */
    public function getImagenRecurso($id){
	 	$recurso = recurso::find($id);
       $recurso = Recurso::find($id);
		$response = Response::make($recurso->objeto);
		$response->header('Content-Type', 'image/png');

		return $response;
	}

	/*Obtener imagen de la recurso recursos/imagen/{id}  */
    public function getUnicaImagen($producto_id){
		Log::info ($producto_id);
		$recurso = Recurso::where('producto_id',$producto_id)->first();
		$response = Response::make($recurso->objeto);
		$response->header('Content-Type', 'image/png');
		return $response;
   }
}
