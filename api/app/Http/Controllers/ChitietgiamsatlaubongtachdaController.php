<?php

namespace App\Http\Controllers;

use App\Models\Chitietgiamsatlaubongtachda;
use App\Http\Requests\StoreChitietgiamsatlaubongtachdaRequest;
use App\Http\Requests\UpdateChitietgiamsatlaubongtachdaRequest;

class ChitietgiamsatlaubongtachdaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return chitietgiamsatlaubongtachda::all();
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
    public function store(StoreChitietgiamsatlaubongtachdaRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Chitietgiamsatlaubongtachda $chitietgiamsatlaubongtachda)
    {
        return chitietgiamsatlaubongtachda::findOrFail($chitietgiamsatlaubongtachda);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Chitietgiamsatlaubongtachda $chitietgiamsatlaubongtachda)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateChitietgiamsatlaubongtachdaRequest $request, Chitietgiamsatlaubongtachda $chitietgiamsatlaubongtachda)
    {
        $chitietgiamsatlaubongtachda->update($request->all());
        
        return response()->json($chitietgiamsatlaubongtachda, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Chitietgiamsatlaubongtachda $chitietgiamsatlaubongtachda)
    {
        $chitietgiamsatlaubongtachda->delete();

        $arr = [
            'status' => true,
            'message' =>'Đã được xóa',
            'data' => [$chitietgiamsatlaubongtachda],
         ];
         return response()->json($arr, 200);
    }
}
