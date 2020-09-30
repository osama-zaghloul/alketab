<?php

namespace App;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;

class book extends Model
{
   
    public $timestamps = false;
    protected $table = 'books';
    protected $fillable = [
        'name', 'details','status','image','suspensed','paid','category_id','cost'
    ];

   
}
