<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Baocaogiamsatlaubong extends Model
{
    use HasFactory;
    protected $fillable = [
        'baocaogiamsatlaubong_id',
        'masolo_id',
'masolotam',
'masologaotrang',
'masolootammai',
'cam',
'nbq1',
'kl1',
'nbq2',
'kl2',
'nbq3',
'kl3',
'nbq4',
'nbq5',
'kl5',
'kl4',
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
        'mucxattrang',
        'mucdanhbong',
        'dothuan',
    ];
    protected $primaryKey ='baocaogiamsatlaubong_id';
    protected $table = 'baocaogiamsatlaubong';
}
