<?php

namespace App\Http\Controllers;

use App\Models\Khachhang;
use App\Http\Requests\StoreKhachhangRequest;
use App\Http\Requests\UpdateKhachhangRequest;

class KhachhangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return khachhang::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreKhachhangRequest $request)
    {
        return khachhang::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show($ten)
    {
        $khachhang = Khachhang::where('ten', $ten)->first();
        
        if ($khachhang) {
            return response()->json($khachhang);
            
        } else {
            return response()->json(['error' => '$khachhang not found'], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Khachhang $khachhang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateKhachhangRequest $request, Khachhang $khachhang)
    {
        $khachhang->update($request->all());

        return response()->json($khachhang, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Khachhang $khachhang)
    {
        $khachhang->delete();
        $arr = [
            'status' => true,
            'message' =>'Đã được xóa',
            'data' => [$khachhang],
         ];
         return response()->json($arr, 200);
    }
}
