<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class rate extends Model
{
    protected $table = 'rates';
     public $timestamps = false;
     protected $fillable = ['id','user_id','advisor_id','rate','text','name'];
}
