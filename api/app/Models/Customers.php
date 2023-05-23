<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customers extends Model
{
    use HasFactory;
    protected $fillable =[
        'customer_id',
        "customer_name",
        "customer_email",
        "customer_password",
        "customer_phone",
    ];
    //này dành cho post store
    protected $primaryKey ='customer_id';
    protected $table = 'customers';
}
