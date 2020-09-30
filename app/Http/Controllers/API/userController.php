<?php

namespace App\Http\Controllers\API;

use App\adv_notification;
use App\advisor;
use App\advisorspec;
use App\book;
use App\category;
use App\Http\Controllers\API\BaseController as BaseController;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use FCM;
use App\member;
use App\order;
use App\item;
use App\item_image;
use App\rate;
use App\notification;
use App\favorite_item;
use App\member_book;
use App\specialization;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Validator;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Crypt;
 
class userController extends BaseController
{
    //registeration process 
    public function register(Request $request)
    {
            $validator = Validator::make($request->all(), [
                'name'           => 'required',
                'username'         => 'required|unique:members', 
                'phone'          => 'required|unique:members',
                'password'       => 'required|min:6',  
            ]
            
        );
       
        if($validator->fails())
        {
            return $this->sendError('success', $validator->errors());       
        }

        $newmember                 = new member;
        $newmember->name           = $request['name'];
        $newmember->username          = $request['username'];
        $newmember->phone          = $request['phone'];
        $newmember->password       = Hash::make($request['password']);
        $newmember->firebase_token = $request['firebase_token'];    
        $newmember->save();
        $reguser = member::find($newmember->id);

        $notification                = new notification();
        $notification->user_id       = $newmember->id;
        $notification->notification  ='تم تسجيل حسابك بنجاح' ;
        $notification->save();

        return $this->sendResponse('success', $reguser); 
    }

    

    //Login process
    public function login(Request $request)
    {
        
            $validator = Validator::make($request->all(), [
            'phone'          => 'required',
            'password'       => 'required',
        ]
        );
       
        

        if($validator->fails())
        {
            return $this->sendError('success', $validator->errors());
        }

        if(Auth::attempt(['phone' => $request->phone , 'password' => $request->password , 'suspensed' => 0 ])) 
        {
            $user                 = Auth::user();
            $user->firebase_token = $request->firebase_token;
            $user->save();
            return $this->sendResponse('success', $user);
        }
        else
        {
            $errormessage = 'رقم الهاتف او كلمة المرور غير صحيحة';
            return $this->sendError('success', $errormessage);
        }
    }

    

    //forgetpassword process
    public function forgetpassword(Request $request)
    {
        $user = member::where('phone',$request->phone)->first();
        if(!$user)
        {
            $errormessage = ' رقم الهاتف غير صحيح';
            return $this->sendError('success', $errormessage);
        }
        else
        {
            $randomcode        = substr(str_shuffle("0123456789"), 0, 6);
            $user->forgetcode  = $randomcode;
            $user->save();
            return $this->sendResponse('success',$user->forgetcode);
        } 
    }



    public function activcode(Request $request)
    {
      $user = member::where('phone',$request->phone)->where('forgetcode',$request->forgetcode)->first();
      if($user)
      {
        return $this->sendResponse('success','true');
      }
      else 
      {
        $errormessage = ' الكود غير صحيح';
        return $this->sendError('success',$errormessage);
      }
    }

    
        //rechangepassword process
    public function rechangepass(Request $request)
    {
        $validator = Validator::make($request->all(), 
        [
          'new_password'    => 'required',
        ]);
           
      if($validator->fails())
        {
            return $this->sendError('success', $validator->errors());       
        }

        $user = member::where('phone',$request->phone)->first();
        if($user)
        {
            $user->password = Hash::make($request->new_password);
            $user->save();
            $errormessage = 'تم تغيير كلمة المرور بنجاح';
            return $this->sendResponse('success',$errormessage);
        }
        else 
        {
            $errormessage ='رقم الهاتف  غير صحيح';
            return $this->sendError('success', $errormessage);
        }
     
    }



    //profile process
    public function profile(Request $request)
    {
        $user = member::where('id',$request->user_id)->where('suspensed',0)->first();
        if(!$user)
        { 
            $errormessage = 'هذا المستخدم غير موجود';
            return $this->sendError('success', $errormessage);
        }
        else
        {
            $member_books = member_book::where('user_id',$request->user_id)->get();
            foreach($member_books as $member_book)
            {
                $book = book::where('id',$member_book->book_id)->first();
                 $books= array();
                array_push($books, 
                    array(
                        "books"           => $book,
                        
                        ));
            }
              $current['user']     = $user; 
              $current['books']     = $books; 
            return $this->sendResponse('success', $current);
        } 
    }

   

    //updating profile process
    public function update(Request $request)
    {
       $upuser = member::where('id',$request->user_id)->first();
        if($upuser)
        {
                $validator = Validator::make($request->all(), [
                'name'           => 'required',
                'username'          => 'required|unique:members,username,'.$upuser->id, 
                'phone'          => 'required|unique:members,phone,'.$upuser->id,
                'password'       => 'required|min:6',  
                    
                ]
            );
                
                if($validator->fails())
                {
                    return $this->sendError('success', $validator->errors());       
                }

                $upuser->name      = $request['name']    ;
                $upuser->username     = $request['username']   ;
                $upuser->phone     = $request['phone']   ;
                $upuser->password  = $request['password'] ? Hash::make($request['password']) : $upuser->password;
                $upuser->save();
                return $this->sendResponse('success', $upuser);
            }
          else
          {    
            $errormessage ='هذا المستخدم غير موجود';
            return $this->sendError('success', $errormessage);
          }
    }




    public function mynotification(Request $request)
    {
        DB::table('notifications')->where('user_id', $request->user_id)->update(['readed' => 1]);
        $mynotifs = notification::where('user_id',$request->user_id)->orderBy('id','desc')->get();
        if(count($mynotifs) != 0)
        {
            return $this->sendResponse('success', $mynotifs);
        }
        else 
        {
            $errormessage ='لا يوجد اشعارات';
            return $this->sendError('success', $errormessage);
        }
    }

    


     public function deletenotification(Request $request)
    {
        $notification= DB::table('notifications')->where('user_id', $request->user_id)->where('id', $request->notification_id);
        $notification->delete();
            $errormessage ='تم حذف الاشعار';
            return $this->sendResponse('success', $errormessage);
        
    }


    

    // public function myfavoriteitems(Request $request)
    // {
    //     $favitems  = favorite_item::where('user_id',$request->user_id)->orderBy('id','desc')->get(); 
    //         if(count($favitems) == 0)
    //         {  
    //           $errormessage = 'لا يوجد منتجات ف المفضلة';
    //           return $this->sendError('success', $errormessage);
    //         }
    //         else 
    //         {
    //           foreach($favitems as $item)
    //           {
    //             $allfavads[] = item::where('id',$item->item_id)->first();
    //           }
              
    //           $currentitems = array();
    //           foreach($allfavads as $item)
    //           {
    //             $image     = item_image::where('item_id',$item->id)->first();
    //             $favorited = 0;
    //             $sumrates  = 0;
    //             $adrates   = rate::where('item_id',$item->id)->get();
    //             foreach($adrates as $value)
    //             {
    //                $sumrates+= $value->rate;
    //             }
    //             $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
               
    //             $fav = DB::table('favorite_items')->where('user_id',$request->user_id)->where('item_id',$item->id)->get();
    //             $favorited = count($fav) != 0 ? 1 : 0;
                
    //             array_push($currentitems, 
    //             array(
    //                 "id"              => $item->id,
    //                 'image'           => $image,
    //                 'title'           => $item->artitle,
    //                 "price"           => $item->price,
    //                 "discountprice"   => $item->discountprice,
    //                 "details"         => $item->details,
    //                 'rate'            => $fullrate,
    //                 'favorited'       => $favorited,
    //                 ));
    //           }
    //           return $this->sendResponse('success', $currentitems);

    //         return $this->sendResponse('success', $allfavads);
    //         }
    // }
    
    public function updatefirebasebyid(Request $request)
    { 
       $user = member::where('id',$request->user_id)->first();
        if($user)
        {
            $user->firebase_token = Hash::make($request->firebase_token);
            $user->save();
            $errormessage ='تم التحديث';
            return $this->sendResponse('success',$errormessage);  
        }
        else
        {
            $errormessage = 'هذا المستخدم غير موجود';
            return $this->sendError('success', $errormessage);
        }
    }

    
    // public function logout(Request $request)
    // {
    //     $user = member::where('id',$request->user_id)->first();
    //     if($user)
    //     {
           
    //         $user->logout();
    //         $errormessage =$request->lang == 'ar' ?'تم الخروج':'loged out successfully';
    //         return $this->sendResponse('success',$errormessage);  
    //     }
    //     else
    //     {
    //         $errormessage =$request->lang == 'ar' ? 'هذا المستخدم غير موجود':'This user does not exist';
    //         return $this->sendError('success', $errormessage);
    //     }
    // }

    
}
