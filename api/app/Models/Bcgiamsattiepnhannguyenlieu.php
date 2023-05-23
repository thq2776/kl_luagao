<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bcgiamsattiepnhannguyenlieu extends Model
{
    use HasFactory;
    protected $fillable =[
        "bcgiamsattiepnhannguyenlieu_id",
        	"khachhang_id",
            	"loaisanpham_id",	
                "masolo_id",
                "ngay",	
                "diachi",
                "khoiluong",	
                "kiemtraphuongtien",
                "hosotrongtrot",
                "hosocamket",
                "chungnhan",
                "doam",
                "tam",
                "tapchat",
                "hatnguyen",
                "hathu"	,
                "hatvang",	
                "hatbacphan",	
                "ketluan",
                "thoigiantiepnhan",
    ];
    protected $primaryKey ='bcgiamsattiepnhannguyenlieu_id';
    protected $table = 'bcgiamsattiepnhannguyenlieu';
}
