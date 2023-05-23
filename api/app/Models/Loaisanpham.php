<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Loaisanpham extends Model
{
    use HasFactory;
    protected $fillable =[
        'loaisanpham_id',
        'tenloai',
        'mota',
      
    ];
    protected $primaryKey ='loaisanpham_id';
    protected $table = 'loaisanpham';
}
