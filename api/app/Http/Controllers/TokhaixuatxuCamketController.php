<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;  
use App\Http\Resources\SanphamResources as SanphamResource; 
use App\Models\Tokhaixuatxu_camket;
use App\Http\Requests\StoreTokhaixuatxu_camketRequest;
use App\Http\Requests\UpdateTokhaixuatxu_camketRequest;

class TokhaixuatxuCamketController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Tokhaixuatxu_camket::all();
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
    public function store(StoreTokhaixuatxu_camketRequest $request)
    {
        // $input = $request->all(); 
       
        // $sanpham = Tokhaixuatxu_camket::create($input);
        // $arr = ['status' => true,
        //    'message'=>"Sản phẩm đã tạo thành công", 
        // ];
        // return response()->json($arr, 201);


        // return Tokhaixuatxu_camket::create($request->all());
        $tokhaixuatxu_camket = Tokhaixuatxu_camket::create($request->all());

        return response()->json($tokhaixuatxu_camket, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($tokhaixuatxu_camket)
    {
         return Tokhaixuatxu_camket::findOrFail($tokhaixuatxu_camket);
        // return $tokhaixuatxu_camket;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Tokhaixuatxu_camket $tokhaixuatxu_camket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updatetokhaixuatxu_camketRequest $request ,Tokhaixuatxu_camket  $tokhaixuatxu_camket)
    {
        // return Tokhaixuatxu_camket::where('tokhaixuatxucamket_id',$tokhaixuatxu_camket)->update($request->all());
        $tokhaixuatxu_camket->update($request->all());

        return response()->json($tokhaixuatxu_camket, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Tokhaixuatxu_camket $tokhaixuatxu_camket)
    {
        // return Tokhaixuatxu_camket::where('tokhaixuatxucamket_id',$tokhaixuatxu_camket)->delete();
        $tokhaixuatxu_camket->delete();
        $arr = [
            'status' => true,
            'message' =>'Sản phẩm đã được xóa',
            'data' => [$tokhaixuatxu_camket],
         ];
         return response()->json($arr, 200);
  
    }
}
