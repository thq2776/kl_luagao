<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chitietgiamsatsaylua extends Model
{
    use HasFactory;
    protected $fillable =[
        'chitietgiamsatsaylua_id',
        'thoidiemkiemtra',
        'nhietdo',
        'doammau1',
        'doammau2',
        'doammau3',
        'doammau4',
        'doammau5',
        'doammau6',  
        'doammau7',
        'doammau8',
        'thongsovanhanh',
        'tinhtranglosay',
        'nguoivanhanh',
    ];
    protected $primaryKey ='chitietgiamsatsaylua_id';
    protected $table = 'chitietgiamsatsaylua';
}
