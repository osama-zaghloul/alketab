<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class specialization extends Model
{
    protected $table = 'specializations';
     public $timestamps = false;
     protected $fillable = ['id','category_id','arname','enname'];
}
