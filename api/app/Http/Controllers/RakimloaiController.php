<?php

namespace App\Http\Controllers;

use App\Models\Rakimloai;
use App\Http\Requests\StoreRakimloaiRequest;
use App\Http\Requests\UpdateRakimloaiRequest;

class RakimloaiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return rakimloai::all();
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
    public function store(StoreRakimloaiRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Rakimloai $rakimloai)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Rakimloai $rakimloai)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateRakimloaiRequest $request, Rakimloai $rakimloai)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Rakimloai $rakimloai)
    {
        //
    }
}
