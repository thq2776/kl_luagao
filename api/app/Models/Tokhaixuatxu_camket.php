<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tokhaixuatxu_camket extends Model
{
    use HasFactory;
    protected $fillable =[
        'tokhaixuatxucamket_id',
        'phuongtien_id',
        'loaisanpham_id',
        'khachhang_id',
     
        'soluong',
        'vungnguyenlieu',
        'chatluongnguyenlieu',
        'ngay',
    ];
    
    protected $primaryKey ='tokhaixuatxucamket_id';
    protected $table = 'tokhaixuatxu_camket';
}
