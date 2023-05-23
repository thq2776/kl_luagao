<?php

namespace App\Http\Controllers;

use App\Models\Bcgiamsattiepnhannguyenlieu;
use App\Http\Requests\StoreBcgiamsattiepnhannguyenlieuRequest;
use App\Http\Requests\UpdateBcgiamsattiepnhannguyenlieuRequest;

class BcgiamsattiepnhannguyenlieuController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Bcgiamsattiepnhannguyenlieu::all();
    }

    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreBcgiamsattiepnhannguyenlieuRequest $request)
    {
        $tokhaixuatxu_camket = Bcgiamsattiepnhannguyenlieu::create($request->all());

        return response()->json($tokhaixuatxu_camket, 201);
        // return Bcgiamsattiepnhannguyenlieu::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show($masolo_id)
    {
        $bcgiamsattiepnhannguyenlieu = Bcgiamsattiepnhannguyenlieu::where('masolo_id', $masolo_id)->first();
        
        if ($bcgiamsattiepnhannguyenlieu) {
            return response()->json($bcgiamsattiepnhannguyenlieu);
        } else {
            return response()->json(['error' => "$bcgiamsattiepnhannguyenlieu not found"], 404);
        }
    }
    
    public function edit(Bcgiamsattiepnhannguyenlieu $bcgiamsattiepnhannguyenlieu)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBcgiamsattiepnhannguyenlieuRequest $request, Bcgiamsattiepnhannguyenlieu $bcgiamsattiepnhannguyenlieu)
    {
        $bcgiamsattiepnhannguyenlieu->update($request->all());

        return response()->json($bcgiamsattiepnhannguyenlieu, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Bcgiamsattiepnhannguyenlieu $bcgiamsattiepnhannguyenlieu)
    {
        $bcgiamsattiepnhannguyenlieu->delete();

        return response()->json(null, 204);
    }
}
