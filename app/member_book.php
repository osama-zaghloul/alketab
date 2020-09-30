<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class member_book extends Model
{
    protected $table = 'member_books';
     public $timestamps = false;
     protected $fillable = ['id','user_id','book_id'];
}
