<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use App\Models\Producto;

class Categoria extends Model{

	public $table = 'categoria';
	public $primaryKey='id';
	public $timestamps=false;


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
		'desc_categoria',
		'logo',
	];

    /* -------------------------------------------------------------------------------------------- */
    // Relationships
    /* -------------------------------------------------------------------------------------------- */
    public function productos(): BelongsToMany
    {
        return $this->belongsToMany(Producto::class,'producto_x_categoria','categoria_id','producto_id');
    }
}
