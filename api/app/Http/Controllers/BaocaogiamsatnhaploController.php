<?php

namespace App\Http\Controllers;

use App\Models\Baocaogiamsatnhaplo;
use App\Models\masolo;
use App\Http\Requests\StoreBaocaogiamsatnhaploRequest;
use App\Http\Requests\UpdateBaocaogiamsatnhaploRequest;

class BaocaogiamsatnhaploController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return baocaogiamsatnhaplo::all();  
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
    public function store(StoreBaocaogiamsatnhaploRequest $request)
    {
        $baocaogiamsatnhaplo = baocaogiamsatnhaplo::create($request->all());

        return response()->json($baocaogiamsatnhaplo, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($baocaogiamsatnhaplo)
    {
        $bcgsnl = baocaogiamsatnhaplo::findOrFail($baocaogiamsatnhaplo);
        $masolo =    masolo::where('baocaogiamsatnhaplo_id' ,$baocaogiamsatnhaplo)->get();
        // return $masolo;
        return response()->json(['baocaogiamsatnhaplo' => $bcgsnl,'masolo' =>$masolo]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Baocaogiamsatnhaplo $baocaogiamsatnhaplo)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBaocaogiamsatnhaploRequest $request, Baocaogiamsatnhaplo $baocaogiamsatnhaplo)
    {
        $baocaogiamsatnhaplo->update($request->all());

        return response()->json($baocaogiamsatnhaplo, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(baocaogiamsatnhaplo $baocaogiamsatnhaplo)
    {
        $baocaogiamsatnhaplo->delete();

        return response()->json($baocaogiamsatnhaplo, 204);
    }
 
}
