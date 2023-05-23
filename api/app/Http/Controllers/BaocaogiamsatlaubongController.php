<?php

namespace App\Http\Controllers;

use App\Models\Baocaogiamsatlaubong;
use App\Http\Requests\StoreBaocaogiamsatlaubongRequest;
use App\Http\Requests\UpdateBaocaogiamsatlaubongRequest;

class BaocaogiamsatlaubongController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return baocaogiamsatlaubong::all();
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
    public function store(StoreBaocaogiamsatlaubongRequest $request)
    {
        return baocaogiamsatlaubong::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(Baocaogiamsatlaubong $baocaogiamsatlaubong)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Baocaogiamsatlaubong $baocaogiamsatlaubong)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBaocaogiamsatlaubongRequest $request, Baocaogiamsatlaubong $baocaogiamsatlaubong)
    {
        $baocaogiamsatlaubong->update($request->all());
        
        return response()->json($baocaogiamsatlaubong, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Baocaogiamsatlaubong $baocaogiamsatlaubong)
    {
        $baocaogiamsatlaubong->delete();

        $arr = [
            'status' => true,
            'message' =>'Đã được xóa',
            'data' => [$baocaogiamsatlaubong],
         ];
         return response()->json($arr, 200);
    }
}
