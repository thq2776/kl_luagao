<?php

namespace App\Http\Controllers;

use App\Models\masolo;
use App\Http\Requests\StoremasoloRequest;
use App\Http\Requests\UpdatemasoloRequest;

class MasoloController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return masolo::all();
    }

    /**
     * Show the form for creating a new resource.
     */

     public function updateByMaSoLo(Request $request, $masolo)
    {
        $khoiluong = $request->input('khoiluong');

        try {
            $masolo = Masolo::where('masolo', $masolo)->firstOrFail();
            $masolo->khoiluong += $khoiluong;
            $masolo->save();

            return response()->json(['message' => 'Cập nhật khối lượng thành công'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Lỗi khi cập nhật khối lượng'], 500);
        }
    }

    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoremasoloRequest $request)
    {
        
        return masolo::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show($masolo)
    {
        $masolo = Masolo::where('masolo', $masolo) ->orwhere('masolo_id', $masolo)->firstOrFail();
    
        return response()->json($masolo);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function updateKhoiLuong(UpdateKhoiLuongRequest $request, masolo $masolo)
    {
        $masolo->update([
            'khoiluong' => $request->khoiluong,
            'khoiluongdadung' => $request->khoiluongdadung,
        ]);
    
        return response()->json($masolo, 200);
    }
    

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatemasoloRequest $request ,masolo  $masolo)
    {
       
        $masolo->update(
        [
            "loaisanpham_id"=>$request->loaisanpham_id,
            "trangthai"=>$request->trangthai,
            "ten"=>$request->ten,
            "masolo"=>$request->masolo,
            "khoiluong"=>$masolo->khoiluong+$request->khoiluong,
            'khoiluongdadung' => $masolo->khoiluongdadung+$request->khoiluongdadung,
            "mota"=>$request->mota,
        ]);
        return response()->json($masolo, 200);
        // return $masolo;
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(masolo $masolo)
    {
        $masolo->delete();
        $arr = [
            'status' => true,
            'message' =>'Sản phẩm đã được xóa',
            'data' => [],
         ];
         return response()->json($arr, 200);
    }
}
