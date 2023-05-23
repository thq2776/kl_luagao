<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kiemtraphuongtien extends Model
{
    use HasFactory;
    protected $fillable =[
        'kiemtraphuongtien_id',
        'batche',
        'vesinh',
        'baobi',
    ];
    protected $primaryKey ='kiemtraphuongtien_id';
    protected $table = 'kiemtraphuongtien';
}
