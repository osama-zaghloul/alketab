<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class order extends Model
{
    protected $table = 'orders';
     public $timestamps = false;
     protected $fillable = ['id','order_number','trader_id','user_id','date','time','details','tatal','status','paid','created_at'];
}
