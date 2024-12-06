<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use App\Models\Cupon;
use App\Models\Producto;
use App\Models\Categoria;
use App\Models\Producto_X_categoria;



class shoppingController extends Controller {

			
    /* mostrar todas las categorias  categorias/list  */
    public function index($categoria_id=0){

        /* Obtenemos las Categorias */
        $categorias = Categoria::select('id','desc_categoria')->get();

        /* Obtenemos los cupones */
        $cupones=Cupon::select('id')->get();

        /* Obtenemos los productos */
        $sql="select * from producto where id in 
                (select producto_id from producto_x_categoria 
                 where categoria_id=?)";
      
        $filas=DB::select($sql,[$categoria_id]);                     
        $productos= new Collection();
        foreach($filas as $producto){
            $productos->push($producto);
        }
       
       
       return view('front.shopping')
        ->with('categorias',$categorias)
        ->with('productos',$productos)
        ->with('cupones',$cupones);
    }

}