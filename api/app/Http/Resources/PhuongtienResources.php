<?php

namespace App\Http\Resources;
use App\Http\Controllers\PhuongtienController;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PhuongtienResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return parent::toArray($request);
        // return [
        //     'sanpham_id'=>$this ->sanpham_id,
        //     'loaisanpham_id' => $this->loaisanpham_id,
        //     'tensanpham' => $this->tensanpham,
        //   ];
        // để khi post lên nó thông báo cho chính xác dễ đọc.. không cần làm 
    }
}

