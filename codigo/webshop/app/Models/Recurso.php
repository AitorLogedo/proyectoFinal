<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\HasMany;


class Recurso extends Model{
    
	public $table = 'recurso';
	public $primaryKey='id';
	public $timestamps=false;
	

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
		'tipo_objeto',
		'objeto',
	];
      
    
	/**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'tipo_objeto' => 'integer',
    ];
	
	
    /* -------------------------------------------------------------------------------------------- */
    // Relationships
    /* -------------------------------------------------------------------------------------------- */
     public function producto(): BelongsTo
    {
        return $this->belongsTo(Producto::class);
    }
	
	 public function opinion(): BelongsTo
    {
        return $this->belongsTo(Opinion::class);
    }
	
}
