<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chitietgiamsatlaubongtachda extends Model
{
    use HasFactory;
    protected $fillable =[
'chitietgiamsatlaubongtachda_id',
'masolo_id',
'tgkiemtra',
'doam',
'tam',
'hatphan',
'hathu',
'hatvang',
'hatxanhnon',
'hatdo',
'tapchat',
'hatnep',
'thoc',
'hatlanloai',
'nguoivanhanh',
'tapchatkhac',
'catda',
'xaccontrung'
    ];
    //này dành cho post store
    protected $primaryKey ='chitietgiamsatlaubongtachda_id';
    protected $table = 'chitietgiamsatlaubongtachda';
}
