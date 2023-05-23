<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sanpham extends Model
{
    use HasFactory;
    protected $fillable =[
        'sanpham_id',
        'loaisanpham_id',
        'tensanpham',
    ];
    //này dành cho post store
    protected $primaryKey ='sanpham_id';
    protected $table = 'sanpham';
}
