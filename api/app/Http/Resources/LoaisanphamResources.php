<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class LoaisanphamResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'loaisanpham_id'=>$this ->loaisanpham_id,
            'tenloai' => $this->tenloai,
            'mota' => $this->mota,
          ];
    }
}
