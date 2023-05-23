<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Rakimloai extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'rakimloai_id',
        'masolo_id',
        'sanpham_id',
        'noibaoquan',
        'hopdong',
        'tgkiemtra',
        'khoiluong',
        'khoiluongcokimloai',
        'mauthufe',
        'mauthunfe',
        'mauthuS316',
        'nhanxet',
    ];
    protected $primaryKey ='rakimloai_id';
    protected $table = 'rakimloai';
}
