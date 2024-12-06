<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use app\Models\Categoria;

class Producto extends Model {
    	
	public $table = 'producto_x_categoria';
	public $primaryKey='id';
    public $timestamps=false;

   
    protected $fillable = [
        'producto_id',
        'categoria_id',
        
    ];

 /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'producto_id' => 'integer',
        'categoria_id' => 'integer',
    ];
  

    /* -------------------------------------------------------------------------------------------- */
    // Relationships
    /* -------------------------------------------------------------------------------------------- */
    public function categoria(): BelongsTo
    {
        return $this->belongsTo(Categoria::class);
    
    }

    public function producto(): BelongsTo
    {
        return $this->belongsTo(Producto::class);
    
    }
}
