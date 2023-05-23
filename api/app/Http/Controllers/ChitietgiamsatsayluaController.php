<?php

namespace App\Http\Controllers;

use App\Models\Chitietgiamsatsaylua;
use App\Http\Requests\StoreChitietgiamsatsayluaRequest;
use App\Http\Requests\UpdateChitietgiamsatsayluaRequest;

class ChitietgiamsatsayluaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return chitietgiamsatsaylua::all();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreChitietgiamsatsayluaRequest $request)
    {
        return chitietgiamsatsaylua::create($request->all());
        
    }

    /**
     * Display the specified resource.
     */
    public function show(Chitietgiamsatsaylua $chitietgiamsatsaylua)
    {
        $chitietgiamsatsaylua =chitietgiamsatsaylua::find($chitietgiamsatsaylua);
        
        return response()->json($chitietgiamsatsaylua);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Chitietgiamsatsaylua $chitietgiamsatsaylua)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateChitietgiamsatsayluaRequest $request, Chitietgiamsatsaylua $chitietgiamsatsaylua)
    {
        $chitietgiamsatsaylua->update($request->all());

        return response()->json($chitietgiamsatsaylua, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Chitietgiamsatsaylua $chitietgiamsatsaylua)
    {
        $chitietgiamsatsaylua->delete();
        $arr = [
            'status' => true,
            'message' =>'Đã được xóa',
            'data' => [$chitietgiamsatsaylua],
         ];
         return response()->json($arr, 200);
    }
}
