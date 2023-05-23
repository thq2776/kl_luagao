<?php

namespace App\Http\Controllers;

use App\Models\Chitietgiamsatbocvotachhat;
use App\Http\Requests\StoreChitietgiamsatbocvotachhatRequest;
use App\Http\Requests\UpdateChitietgiamsatbocvotachhatRequest;

class ChitietgiamsatbocvotachhatController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return chitietgiamsatbocvotachhat::all();
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
    public function store(StoreChitietgiamsatbocvotachhatRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Chitietgiamsatbocvotachhat $chitietgiamsatbocvotachhat)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Chitietgiamsatbocvotachhat $chitietgiamsatbocvotachhat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateChitietgiamsatbocvotachhatRequest $request, Chitietgiamsatbocvotachhat $chitietgiamsatbocvotachhat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Chitietgiamsatbocvotachhat $chitietgiamsatbocvotachhat)
    {
        //
    }
}
