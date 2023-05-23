<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class phuongtien extends Model
{
    use HasFactory;
    protected $fillable =[
        'phuongtien_id',
        'tenphuongtien',
        'tenphuongtien',
        'sophuongtien',
        'tinhtrangvesinh',
        'baoquansanpham',
        'taitrong',
        'created_at',
        'updated_at',
    ];
    
    protected $primaryKey ='phuongtien_id';
    protected $table = 'phuongtien';
}
