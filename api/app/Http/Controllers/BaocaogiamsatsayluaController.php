<?php

namespace App\Http\Controllers;

use App\Models\Baocaogiamsatsaylua;
use App\Http\Requests\StoreBaocaogiamsatsayluaRequest;
use App\Http\Requests\UpdateBaocaogiamsatsayluaRequest;

class BaocaogiamsatsayluaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return baocaogiamsatsaylua::all();
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
    public function store(StoreBaocaogiamsatsayluaRequest $request)
    {
        $baocaogiamsatsaylua = baocaogiamsatsaylua::create($request->all());

        return response()->json($baocaogiamsatsaylua, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($baocaogiamsatsaylua)
    {
        return baocaogiamsatsaylua::findOrFail($baocaogiamsatsaylua);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Baocaogiamsatsaylua $baocaogiamsatsaylua)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBaocaogiamsatsayluaRequest $request, Baocaogiamsatsaylua $baocaogiamsatsaylua)
    {
        $baocaogiamsatsaylua->update($request->all());

        return response()->json($baocaogiamsatsaylua, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Baocaogiamsatsaylua $baocaogiamsatsaylua)
    {
        $baocaogiamsatsaylua->delete();

        return response()->json($baocaogiamsatsaylua, 204);
    }
}
