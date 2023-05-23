<?php

namespace App\Http\Controllers;

use App\Models\phuongtien;
use App\Http\Requests\StorephuongtienRequest;
use App\Http\Requests\UpdatephuongtienRequest;
use App\Http\Resources\PhuongtienResources as PhuongtienResources; 

class PhuongtienController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return phuongtien::all();
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
    public function store(StorephuongtienRequest $request)
    {
        return phuongtien::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(phuongtien $phuongtien)
    {
        $phuongtien =phuongtien::find($phuongtien);
        
        return response()->json($phuongtien);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(phuongtien $phuongtien)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatephuongtienRequest $request, phuongtien $phuongtien)
    {
        $phuongtien->update($request->all());

        return response()->json($phuongtien, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(phuongtien $phuongtien)
    {
        $phuongtien->delete();
        $arr = [
            'status' => true,
            'message' =>'Đã được xóa',
            'data' => [$phuongtien],
         ];
         return response()->json($arr, 200);
    }
}
