<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Baocaogiamsatnhaplo extends Model
{
    use HasFactory;
    protected $fillable =[
    'baocaogiamsatnhaplo_id',
    'masolo_id',
    'ngay',
    'thoidiemkiemtra',
    'phantramtamnl',
    'khoiluongnl',
    'noibaoquannl',
    'masolotp',
    'phantramtamtp',
    'khoiluongtp',
    'noibaoquantp',
    ];
    protected $primaryKey ='baocaogiamsatnhaplo_id';
    protected $table = 'baocaogiamsatnhaplo';

}
