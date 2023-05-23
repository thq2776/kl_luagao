<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Baocaogiamsatsaylua extends Model
{
    use HasFactory;
    protected $fillable =[
        'baocaogiamsatsaylua_id',
        'masolo_id',
        'ngay',
        'khoiluong',
        'losaylua',
        'doambandau',
        'dodaymelua',  
        'noibaoquansaukhisay',  
        'thoigianbatdau', 
        'thoigianketthuc',  
        'khoiluongluakho',  
        'masolosaukhisay',
    ];
    protected $primaryKey ='baocaogiamsatsaylua_id';
    protected $table = 'baocaogiamsatsaylua';

 
}
