<?php
namespace App\Http\Controllers;
use Dotenv\Validator;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;
use Illuminate\Http\Redirect;
use App\Models\Categoria;
use Illuminate\Support\Facades\Log;
use Image;

class categoriaController extends Controller {


    /* mostrar todas las categorias  categorias/list  */
    public function index(){
       $categorias = Categoria::all();
       return view('back.categorias.index')->with('categorias',$categorias);
    }

    /* mostrar  formulario de alta de categoria  categorias/new */
    public function create(){
      return view('back.categorias.create');
    }

	/* muestra una categoria especifica categorias/show/{id} */
    public function show($id) {
		$categoria=Categoria::find($id);
		return view('back.categorias.show')->with('categoria',$categoria);
    }

    /* muestra una categoria especifica categorias/edit/{id} */
    public function edit($id){
        $categoria=Categoria::find($id);
		return view('back.categorias.edit')->with('categoria',$categoria);
    }


	/*creamos una nueva categoria    */
    public function store(Request $request)
    {


		//* validamos */
      /*  $validatedData = $request->validate([
            'desc_categoria' => 'required|unique:posts|max:128',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:4096',

        ], [
            'desc_categoria.required' => 'Categoria field is required.',
            'desc_categoria.unique' => 'Categoria field is not  unique.',
            'desc_categoria.max' => 'Categoria lengthfield is too long',
            'logo.required' => 'Logo field is required.',
        ]);



		/* instanciamos una nueva categoria */
		$categoria= new Categoria();

		/* actualizamos datos y persistimos */
		$categoria->desc_categoria= $request['desc_categoria'];
         $path = $request->file('logo')->getRealPath();
         $categoria->logo = file_get_contents($path);
	    $categoria->save();

		/* generamos mensage para Toast */
		    $notification = [
            'type' => 'success',
            'title' => 'crear Categoria',
            'message' => 'categoria creada correctamente' ,
        ];

       /* volvemos sobre el  formulario de edición */
       return redirect('categorias/edit/' . $categoria->id)->with('notification', $notification);;

    }

    /**
        * Update the specified resource in storage.
        *
        * @param  int  $id
        * @return Response
        */
    public function update($id, Request $request){
		/* validamos */
		/*$validated = $request->validate([
            'desc_categoria' => 'required|unique:posts|max:128',
            'logo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:4096',
            ]);

		/* localizamos la categoria */
        Log::info("id=" .$id. $request['desc_categoria'] );
		$categoria= Categoria::find($id);


		/* actualizamos datos y persistimos */
		$categoria->desc_categoria= $request['desc_categoria'];
        if (!is_null ($request['logo']) ){
            $path = $request->file('logo')->getRealPath();
         $categoria->logo = file_get_contents($path);
        }
	    $categoria->save();

		/* generamos mensage para Toast */
		    $notification = [
            'type' => 'success',
            'title' => 'editar Categoria',
            'message' => 'datos actualizados correctamente' ,
        ];

       /* volvemos sobre el mismo formulario */
       return redirect('categorias/edit/' . $categoria->id)->with('notification', $notification);
    }

    /*Eliminar una categoria categorias/delete/{id}  */
    public function delete($id)
    {
        /* obtenemos la categoria */
        $categoria = Categoria::find($id);

		/* eliminamos productos vinculados */
		//$categoria->productos()->delete();

		/* eliminamos categoria */
	     $categoria->delete();

		/* generamos mensage para Toast en la vista de listado */
		    $notification = [
            'type' => 'success',
            'title' => 'Eliminar Categoria',
            'message' => 'Categoria ' . $categoria->desc_categoria . ' eliminada correctamente' ,
        ];

       // Session::flash('message', 'Successfully deleted the shark!');
        return redirect('/categorias')->with('notification', $notification);
    }


	/*Obtener imagen de la categoria categorias/imagen/{id}  */
    public function getLogo($id){
        $categoria = Categoria::find($id);
        $response = Response::make($categoria->logo);
		$response->header('Content-Type', 'image/png');
		return $response;


	}
}
