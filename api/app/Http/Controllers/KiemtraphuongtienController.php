<?php

namespace App\Http\Controllers;

use App\Models\Kiemtraphuongtien;
use App\Http\Requests\StoreKiemtraphuongtienRequest;
use App\Http\Requests\UpdateKiemtraphuongtienRequest;

class KiemtraphuongtienController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return kiemtraphuongtien::all();
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
    public function store(StoreKiemtraphuongtienRequest $request)
    {
        $kiemtraphuongtien = kiemtraphuongtien::create($request->all());

        return response()->json($kiemtraphuongtien, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($kiemtraphuongtien)
    {
        return kiemtraphuongtien::findOrFail($kiemtraphuongtien);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Kiemtraphuongtien $kiemtraphuongtien)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateKiemtraphuongtienRequest $request, Kiemtraphuongtien $kiemtraphuongtien)
    {
        $kiemtraphuongtien->update($request->all());

        return response()->json($kiemtraphuongtien, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Kiemtraphuongtien $kiemtraphuongtien)
    {
        $kiemtraphuongtien->delete();

        return response()->json(null, 204);
    }
}
