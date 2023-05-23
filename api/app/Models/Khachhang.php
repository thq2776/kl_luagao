<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Khachhang extends Model
{
    use HasFactory;
    protected $fillable =[
        'khachhang_id',
        'ten',
        'diachi',
        'sdt',
        'ghichu',
    ];
    protected $primaryKey ='khachhang_id';
    protected $table = 'khachhang';
}
