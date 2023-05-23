<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Testapi extends Model
{
    
    use HasFactory;
    protected $fillable =[
        'id',
        'kieuInt',
    
    ];
    //này dành cho post store
    protected $primaryKey ='id';
    protected $table = 'testapi';
}
