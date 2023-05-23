<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class masolo extends Model
{
    use HasFactory;
    protected $fillable =[
        'masolo_id',
        'loaisanpham_id',
        'baocaogiamsatnhaplo_id',
        'trangthai',
        'ten',
        'masolo',
        'mota',
        'khoiluong',
        'khoiluongdadung'
      
    ];
    protected $primaryKey ='masolo_id';
    protected $table = 'masolo';

}
