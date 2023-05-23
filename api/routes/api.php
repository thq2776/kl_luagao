<?php

use App\Http\Controllers\BcgiamsattiepnhannguyenlieuController;
use App\Http\Controllers\BaocaogiamsatnhaploController;
use App\Http\Controllers\KhachhangController;
use App\Http\Controllers\PhieudieuphuongtienController;
use App\Http\Controllers\SanphamController;
use App\Http\Controllers\LoaisanphamController;
use App\Http\Controllers\TokhaixuatxuCamketController;
use App\Http\Controllers\PhuongtienController;
use App\Http\Controllers\KiemtraphuongtienController;
use App\Http\Controllers\BaocaogiamsattachdaController;
use App\Http\Controllers\ChitietgiamsatlaubongtachdaController;
use App\Http\Controllers\BaocaogiamsatlaubongController;
use App\Http\Controllers\BaocaogiamsatsayluaController;
use App\Http\Controllers\ChitietgiamsatbocvotachhatController;
use App\Http\Controllers\MasoloController;
use App\Http\Controllers\KiemtranguongoclonguyenlieuController;
use App\Http\Controllers\BaocaogiamsatbocvotachhatController;
use App\Http\Controllers\ChitietgiamsatsayluaController;
use App\Http\Controllers\TestapiController;
use App\Http\Controllers\RakimloaiController;
use App\Models\Bcgiamsattiepnhannguyenlieu;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Resources\KhachhangResources; 
use App\Models\Khachhang;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::resource('khachhang', KhachhangController::class);
Route::resource('testapi', TestapiController::class);
// Route::resource('sanpham', SanPhamController::class);
Route::resource('loaisanpham', LoaisanphamController::class);
Route::resource('tokhaixuatxu_camket', TokhaixuatxuCamketController::class);
Route::resource('phieudieuphuongtien', PhieudieuphuongtienController::class);
Route::resource('bcgiamsattiepnhannguyenlieu', BcgiamsattiepnhannguyenlieuController::class);
Route::resource('bcgsnhaplo', BaocaogiamsatnhaploController::class);
Route::resource('phuongtien', PhuongtienController::class);
Route::resource('kiemtraphuongtien', KiemtraphuongtienController::class);
Route::resource('kiemtranguongoclonguyenlieu', KiemtranguongoclonguyenlieuController::class);
Route::resource('baocaogiamsatbocvotachhat', BaocaogiamsatbocvotachhatController::class);
Route::resource('chitietbaocaogiamsatbocvotachhat', ChitietgiamsatbocvotachhatController::class);
// Route::resource('chitietbaocaogiamsattachda', BaocaogiamsattachdaController::class);
Route::resource('chitietbaocaogiamsattachda', ChitietgiamsatlaubongtachdaController::class);
Route::resource('baocaogiamsatsaylua', BaocaogiamsatsayluaController::class);
Route::resource('baocaogiamsatlaubong', BaocaogiamsatlaubongController::class);

Route::resource('baocaogiamsatsaylua', BaocaogiamsatsayluaController::class);
Route::resource('chitietgiamsatsaylua', ChitietgiamsatsayluaController::class);
Route::resource('baocaogiamsatsaylua', BaocaogiamsatsayluaController::class);
Route::resource('sanpham', SanPhamController::class);
Route::resource('rakimloai', RakimloaiController::class);


Route::resource('masolo',MasoloController::class);






use App\Http\Controllers\API\AuthController;

//API route để đăng ký
Route::post('/dangky', [AuthController::class, 'register']);
//API route để đăng nhập
Route::post('/dangnhap', [AuthController::class, 'login']);
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function(Request $request) { 
        return auth()->user();
    });
    // API route thoát
    Route::post('/logout', [AuthController::class, 'logout']);
    
});