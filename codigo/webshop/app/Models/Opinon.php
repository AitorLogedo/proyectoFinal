<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;


class Opinion extends Model{
    
	protected $table = 'opinion';
	protected $primaryKey='id';
	protected $timestamps=false;
	

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
		'comentario',
		'puntuacion',
		'validado',
	];
      
    
	/**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'puntuacion' => 'integer',
        'validado' => 'integer',
    ];
}
