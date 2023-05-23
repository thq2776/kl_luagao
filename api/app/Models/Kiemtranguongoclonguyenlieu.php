<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kiemtranguongoclonguyenlieu extends Model
{
    use HasFactory;
    protected $fillable =[
        'kiemtranguongoclonguyenlieu_id',
        'chitieuchatluong_id',
        'masolo_id',
        'hosotrongtrot',
        'hosoxuatxu_camket',
        'hosochungnhan_CoA',
        'ketluan',
        'thoigiantiepnhan',
        'noibaoquan',
        'ngay',  
    ];
    protected $primaryKey ='kiemtranguongoclonguyenlieu_id';
    protected $table = 'kiemtranguongoclonguyenlieu';
}
