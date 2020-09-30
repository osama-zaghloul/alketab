<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class book extends Model
{
    
    public $timestamps = false;
    protected $table = 'books';
    protected $fillable = [
        'name', 'image','details','views','price','category_id','status','paid'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
}
