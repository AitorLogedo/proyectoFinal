<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;


class Cupon extends Model{
    
	public $table = 'cupon';
	public $primaryKey='id';
	public $timestamps=false;
	

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
		'porcentaje',
		'importe',
		'compra_minima',
		'fecha_desde',
		'fecha_hasta',
		'codigo',
		'titulo',
		'imagen',
	];
      
    
	/**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'importe' => 'double',
        'compra_minima' => 'integer',
        'stock_minimo' => 'integer',
		'fecha_desde' => 'timestamp',
		'fecha_hasta' => 'timestamp',
    ];
}
