<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator; 
use App\Models\Loaisanpham;
use App\Http\Requests\StoreLoaisanphamRequest;
use App\Http\Requests\UpdateLoaisanphamRequest;
use App\Http\Resources\LoaisanphamResources as sanphamResource;
use App\Http\Resources\LoaisanphamResources;
class LoaisanphamController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return loaisanpham::all();
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
    public function store(StoreLoaisanphamRequest $request)
    {
        $input = $request->all(); 
       
        $loaisanpham = Loaisanpham::create($input);
        $arr = ['status' => true,
           'message'=>"Sản phẩm đã lưu thành công",
           'data'=> new LoaisanphamResources($loaisanpham)
           
        ];
        return response()->json($arr, 201);
    }

    /**
     * Display the specified resource.
     */
    // public function show(Loaisanpham $loaisanpham)
    // {
    //     $loaisanpham =Loaisanpham::find($loaisanpham);
        
    //     return response()->json($loaisanpham);
    // }
    public function show($tenloai)
    {
        $loaisanpham = Loaisanpham::where('tenloai', $tenloai)->first();
        
        if ($loaisanpham) {
            return response()->json($loaisanpham);
            
        } else {
            return response()->json(['error' => 'Loaisanpham not found'], 404);
        }
    }
    
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Loaisanpham $loaisanpham)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateLoaisanphamRequest $request,$loaisanpham)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
           'tenloai' => 'required', 
        ]);
        if($validator->fails()){
           $arr = [
             'success' => false,
             'message' => 'Lỗi kiểm tra dữ liệu',
             'data' => $validator->errors()
           ];
           return response()->json($arr, 200);
        }
        $loaisanpham = Loaisanpham::find($loaisanpham);
        // $loaisanpham->loaisanpham_id = $input['loaisanpham_id'];
        $loaisanpham->tenloai = $input['tenloai'];
        $loaisanpham->mota = $input['mota'];
        

        $loaisanpham->save();
        $arr = [
           'status' => true,
           'message' => 'Sản phẩm cập nhật thành công',
           'data'=> new LoaisanphamResources($loaisanpham)
        ];
        return response()->json($arr, 200);
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Loaisanpham $loaisanpham)
    {
        $loaisanpham->delete();
        $arr = [
            'status' => true,
            'message' =>'Sản phẩm đã được xóa',
            'data' => [$loaisanpham],
         ];
         return response()->json($arr, 200);
      
    }
}
