<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class phieudieuphuongtien extends Model
{
    use HasFactory;
    protected $fillable =[
        'phieudieuphuongtien_id',
        'phuongtien_id',
        'sanpham_id',
        'masolo_id',
        'khachhang_id',
        'ngayxuatben',
        'diachivung',
        'daidienphuongtien',
        'soluong',
        'tinhtrang',
        'baoquan'
    ];
    
    protected $primaryKey ='phieudieuphuongtien_id';
    protected $table = 'phieudieuphuongtien';
}
