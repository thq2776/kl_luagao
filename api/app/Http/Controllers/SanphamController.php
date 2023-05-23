<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;  
use App\Http\Resources\SanphamResources as SanphamResource; 
use App\Models\Sanpham;
use App\Http\Requests\StoreSanphamRequest;
use App\Http\Requests\UpdateSanphamRequest;

use App\Http\Resources\SanphamResources;
use Illuminate\Database\Eloquent\Collection;


class SanphamController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return sanpham::all();
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
    public function store(StoreSanphamRequest $request)
    {
        // $input = $request->all(); 
       
        // $sanpham = Sanpham::create($input);
        // $arr = ['status' => true,
        //    'message'=>"Sản phẩm đã lưu thành công",
        //    'data'=> new SanphamResource($sanpham) 
           
        // ];
        // return response()->json($arr, 201);
        return Sanpham::create($request->all());
    }

    

    /**
     * Display the specified resource.
     */
    public function show($sanpham)
    {
        // $sanpham =Sanpham::find($sanpham);
        
        // return response()->json($sanpham); 
        return Sanpham::findOrFail($sanpham);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Sanpham $sanpham)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSanphamRequest $request,$sanpham)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
           'tensanpham' => 'required', 
        ]);
        if($validator->fails()){
           $arr = [
             'success' => false,
             'message' => 'Lỗi kiểm tra dữ liệu',
             'data' => $validator->errors()
           ];
           return response()->json($arr, 200);
        }
        $sanpham = Sanpham::find($sanpham);
        // $sanpham->sanpham_id = $input['sanpham_id'];
        $sanpham->tensanpham = $input['tensanpham'];
        $sanpham->loaisanpham_id = $input['loaisanpham_id'];
        

        $sanpham->save();
        $arr = [
           'status' => true,
           'message' => 'Sản phẩm cập nhật thành công',
           
        ];
        return response()->json($arr, 200);
        // $sanpham->update($request->all());

        // return response()->json($sanpham, 200);
    }


    public function destroy(Sanpham $sanpham)
    {
        $sanpham->delete();
        $arr = [
            'status' => true,
            'message' =>'Sản phẩm đã được xóa',
            'data' => [],
         ];
         return response()->json($arr, 200);
      
    }
}
