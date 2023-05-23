<?php

namespace App\Http\Controllers;

use App\Models\Kiemtranguongoclonguyenlieu;
use App\Http\Requests\StoreKiemtranguongoclonguyenlieuRequest;
use App\Http\Requests\UpdateKiemtranguongoclonguyenlieuRequest;

class KiemtranguongoclonguyenlieuController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return kiemtranguongoclonguyenlieu::all();
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
    public function store(StoreKiemtranguongoclonguyenlieuRequest $request)
    {
        $kiemtranguongoclonguyenlieu = kiemtranguongoclonguyenlieu::create($request->all());

        return response()->json($kiemtranguongoclonguyenlieu, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($kiemtranguongoclonguyenlieu)
    {
        return kiemtranguongoclonguyenlieu::findOrFail($kiemtranguongoclonguyenlieu);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Kiemtranguongoclonguyenlieu $kiemtranguongoclonguyenlieu)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateKiemtranguongoclonguyenlieuRequest $request, Kiemtranguongoclonguyenlieu $kiemtranguongoclonguyenlieu)
    {
        $kiemtranguongoclonguyenlieu->update($request->all());

        return response()->json($kiemtranguongoclonguyenlieu, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Kiemtranguongoclonguyenlieu $kiemtranguongoclonguyenlieu)
    {
        $kiemtranguongoclonguyenlieu->delete();

        return response()->json(null, 204);
    }
}
