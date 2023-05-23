<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chitietgiamsatbocvotachhat extends Model
{
    use HasFactory;
    protected $fillable =[
'chitietgiamsatbocvotachhat_id', 
'masolo_id', 
'ngay', 
'thoidiemkiemtra',
'apsuat', 
'masologaoxo', 
'khoiluonggaoxo',
'phantramhatbocvo',
'phantramgao',
'phantramtam',
'sangtapchat',
'gangbatthocphanly',
'khoiluongtrau',
'nguoivanhanh',
'noibaoquan'
    ];
    protected $primaryKey ='chitietgiamsatbocvotachhat_id';
    protected $table = 'chitietgiamsatbocvotachhat';
}
