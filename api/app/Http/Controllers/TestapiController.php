<?php

namespace App\Http\Controllers;

use App\Models\Testapi;
use App\Http\Requests\StoreTestapiRequest;
use App\Http\Requests\UpdateTestapiRequest;


class TestapiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return testapi::all();
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
    public function store(StoreTestapiRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Testapi $testapi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Testapi $testapi)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTestapiRequest $request, Testapi $testapi)
    {
        $testapi->update($request->all());

        return response()->json($testapi, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Testapi $testapi)
    {
        //
    }
}
