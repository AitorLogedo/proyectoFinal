<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use App\Models\Categoria;

class Producto extends Model {
    	
	public $table = 'producto';
	public $primaryKey='id';
    public $timestamps=false;

   
    protected $fillable = [
        'codigo',
        'titulo',
        'desc_producto',
        'stock',
		'stock_minimo',
		'precio',
    ];

 /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'precio' => 'double',
        'stock' => 'integer',
        'stock_minimo' => 'integer',
    ];
  

    /* -------------------------------------------------------------------------------------------- */
    // Relationships
    /* -------------------------------------------------------------------------------------------- */
    public function categorias(): BelongsToMany
    {
        return $this->belongsToMany(Categoria::class,'producto_x_categoria','producto_id', 'categoria_id');
    
    }
}
