<?php

namespace App\Http\Controllers;

use App\Models\phieudieuphuongtien;
use App\Http\Requests\StorephieudieuphuongtienRequest;
use App\Http\Requests\UpdatePhieudieuphuongtienRequest;
use App\Http\Resources\PhieudieuphuongtienResources as PhieudieuphuongtienResources; 

class PhieudieuphuongtienController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return phieudieuphuongtien::all();
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
    public function store(StorephieudieuphuongtienRequest $request)
    {
        $phieudieuphuongtien = phieudieuphuongtien::create($request->all());

        return response()->json($phieudieuphuongtien, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($phieudieuphuongtien)
    {
        return phieudieuphuongtien::findOrFail($phieudieuphuongtien);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(phieudieuphuongtien $phieudieuphuongtien)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatephieudieuphuongtienRequest $request, phieudieuphuongtien $phieudieuphuongtien)
    {
        $phieudieuphuongtien->update($request->all());
        
        return response()->json($phieudieuphuongtien, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(phieudieuphuongtien $phieudieuphuongtien)
    {
        $phieudieuphuongtien->delete();

        $arr = [
            'status' => true,
            'message' =>'Đã được xóa',
            'data' => [$phieudieuphuongtien],
         ];
         return response()->json($arr, 200);
    }
}
