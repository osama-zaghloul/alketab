<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


//user Controller routes
Route::post('register','API\userController@register');
Route::post('login','API\userController@login');
Route::post('profile','API\userController@profile');
Route::post('rechangepass','API\userController@rechangepass');
Route::post('updateprofile','API\userController@update');
Route::post('forgetpassword','API\userController@forgetpassword');
Route::post('activcode','API\userController@activcode');
Route::post('mynotification','API\userController@mynotification');
Route::post('myfavoriteitems','API\userController@myfavoriteitems');
Route::post('updatefirebasebyid','API\userController@updatefirebasebyid');
Route::post('deletenotification','API\userController@deletenotification');
Route::post('logout','API\userController@logout');


//advisor Controller routes
Route::post('register1','API\userController@register1');
Route::post('login1','API\userController@login1');
Route::post('profile1','API\userController@profile1');
Route::post('rechangepass1','API\userController@rechangepass1');
Route::post('updateprofile1','API\userController@update1');
Route::post('forgetpassword1','API\userController@forgetpassword1');
Route::post('activcode1','API\userController@activcode1');
Route::post('mynotification1','API\userController@mynotification1');
Route::post('myfavoriteitems1','API\userController@myfavoriteitems1');
Route::post('updatefirebasebyid1','API\userController@updatefirebasebyid1');
Route::post('deletenotification1','API\userController@deletenotification1');
Route::post('logout1','API\userController@logout1');

//App Setting Controller 
Route::post('settinginfo','API\appsettingController@settingindex');
Route::post('contactus','API\appsettingController@contactus');
Route::post('categories','API\appsettingController@categories');
Route::post('home','API\appsettingController@home');
Route::post('addtransfer','API\appsettingController@addtransfer');
Route::post('copouncheck','API\appsettingController@copouncheck');
Route::post('mytransfers','API\appsettingController@mytransfers');
Route::post('newbooks','API\appsettingController@newbooks');
Route::post('showbook','API\appsettingController@showbook');
Route::post('books','API\appsettingController@books');

//Item Controller 
// Route::post('allitems','API\itemController@allitems');
// Route::post('showitem','API\itemController@showitem');
Route::post('alladvisors','API\itemController@alladvisors');
Route::post('showadvisor','API\itemController@showadvisor');
Route::post('addrate','API\itemController@addrate');
Route::post('makefavoriteitem','API\itemController@makefavoriteitem');
Route::post('cancelfavoriteitem','API\itemController@cancelfavoriteitem');


//Order Controller 
Route::post('makeorder','API\orderController@makeorder');
Route::post('myorders','API\orderController@myorders');
Route::post('showorder','API\orderController@showorder');

//advisor order
Route::post('myorders1','API\orderController@myorders1');
Route::post('showorder1','API\orderController@showorder1');

//chat Controller 
Route::post('makechat','API\chatController@makechat');
Route::post('getchat','API\chatController@getchat');
Route::post('getchaters','API\chatController@getchaters');
Route::post('getchaters1','API\chatController@getchaters1');
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
