<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class setting extends Model
{
    protected $table = 'settings';
     public $timestamps = false;
     protected $fillable = ['id','arabout','arconditions','logo','text1'];
}
