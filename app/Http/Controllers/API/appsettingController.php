<?php

namespace App\Http\Controllers\API;

use App\advisor;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\notification;
use App\setting;
use App\contact;
use App\slider;
use App\category;
use App\City;
use App\District;
use App\Cutting;
use App\item;
use App\item_image;
use App\member;
use App\rate;
use App\order;
use App\transfer;
use App\weight;
use App\adv_notification;
use App\book;
use App\member_book;
use LaravelFCM\Facades\FCM;
// use LaravelFCM\Facades\FCM;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use Settings;
use App\specialization;

class appsettingController  extends BaseController
{
     public function settingindex(Request $request)
    {
                      
        $jsonarr              = array();
        $setting              = setting::select('arabout','arconditions','logo','text1','text2','text3')->get();
        $jsonarr['info']      = $setting;
        return $this->sendResponse('success', $jsonarr);
    }

    
    
    
    public function contactus(Request $request)
    {
        $newcontact          = new contact();
        $newcontact->name    = $request->name;
        $newcontact->phone   = $request->phone;
        $newcontact->email   = $request->email;
        $newcontact->message = $request->message;
        $newcontact->save();
        $errormessage =  'تم ارسال الرسالة بنجاح';
        return $this->sendResponse('success',$errormessage); 
    }

    public function books(Request $request)
    {
        $books = book::where('category_id',$request->category_id)->get();
        if(count($books)!=0)
        {
        foreach($books as $book)
        {
            $member_book = member_book::where('book_id',$book->id)->first();
            $user = member::where('id',$member_book->user_id)->first();
            $book['user']=$user;
        }
        return $this->sendResponse('success', $books);
    }else{
        return $this->sendError('success', 'لا توجد كتب في هذا القسم');
    }
    }

   public function categories(Request $request)
    {
        //main categories
        
       
        $categories= category::orderBy('id','asc')->get();
        
       
     
        if(count($categories)!=0)
        {
        
        return $this->sendResponse('success', $categories);
        }else
        {
            $error = 'لا يوجد أقسام  ';
           return $this->sendError('success',$error); 
        }
    }

    public function home(Request $request)
    {
        $topsliders      = array();
        $categories  = array();
       
        $lastitems       = array();
        $current         = array();
        
        
        //top sliders
        $sliders = slider::where('suspensed',0)->orderBy('id','desc')->get();
        foreach ($sliders as $slider) 
            {  
                array_push($topsliders, 
                array(
                      "id"      => $slider->id,
                      'image'   => $slider->image,
                      'title'   => $slider->artitle,
                      'url'    => $slider->url,
                      'text'    => $slider->text,
                    ));
            }
        
        //main categories
        $maincategories = category::all();
            foreach ($maincategories as $group) 
            {           
                array_push($categories, 
                array(
                     "id"      => $group->id,
                     "name"    => $group->arname,
                     'image'   => $group->image,
                    ));
            }

        
        
        //last items
        $items = book::where('suspensed',0)->orderBy('id','desc')->get();
       
       
        
        
       
            
            $current['topsliders']     = $topsliders;        
            $current['categories']         = $categories;
            $current['lastbooks']      = $items;
            
            
            return $this->sendResponse('success', $current);
    }

    public function addbook(Request $request)
    {
        $this->validate($request, [
            'name'        => 'required',
            'category'       => 'required',
            'image'       => 'required',
            'cost'       => 'required',
            'details'       => 'required',
            'status'        => 'required',
            'user_id'        => 'required',
        ],[
           'name.required'        => 'هذا الحقل مطلوب', 
           'category.required'        => 'هذا الحقل مطلوب', 
           'image.required'        => 'هذا الحقل مطلوب', 
           'cost.required'        => 'هذا الحقل مطلوب', 
           'details.required'        => 'هذا الحقل مطلوب', 
           'status.required'        => 'هذا الحقل مطلوب', 
           'user.required'        => 'هذا الحقل مطلوب', 
        ]);

        if($validator->fails())
        {
            return $this->sendError('success', $validator->errors());       
        }

        $newbook           = new book;
        $newbook->name      = $request['name'];
        $newbook->details      = $request['details'];
        $newbook->category_id      = $request['category'];
        $newbook->status      = $request['status'];
        $newbook->cost      = $request['cost'];
        
        
         if($request->hasFile('image'))
            {
                $image = $request['image'];
                $filename = rand(0,9999).'.'.$image->getClientOriginalExtension();
                $image->move(base_path('users/images/'),$filename);
                $newbook->image = $filename;
            }
         

        $newbook->save();
        
        $newmember_book = new member_book;
        $newmember_book->book_id      = $newbook->id ;
        $newmember_book->user_id      =$request['user'];  
        $newmember_book->save();
        
        return $this->sendResponse('success', 'تم إضافة الكتاب بنجاح'); 
    }


    public function newbooks(Request $request)
    {
        $items = book::where('suspensed',0)->orderBy('id','desc')->get();
        if(count($items)!=0)
        {
        return $this->sendResponse('success', $items);
        }else{
            return $this->sendError('success','لا توجد كتب'); 
        }
    }

    public function showbook(Request $request)
    {
        $current = array();
        $showbook = book::where('id',$request->book_id)->where('suspensed',0)->first();
        if($showbook)
        {
            $current['show_book'] = $showbook;
            
        
        $memberbook = member_book::where('book_id',$showbook->id)->first();
        $member_books = member_book::where('user_id',$memberbook->user_id)->get();
        if(count($member_books)!=0)
        {
            foreach($member_books as $member_book)
            {
                $book = book::where('id',$member_book->book_id)->where('id','!=',$showbook->id)->first();
                
                 $books = array();
                 array_push($books, 
                 array(
                      "id"           => $book->id,
                      "id"           => $book->image,
                      "id"           => $book->name,
                ));
            
            }
            $current['user_books'] = $books;
            return $this->sendResponse('success', $current);
        }
        else{
            return $this->sendError('success','لا توجد كتب اخرى لهذاالعضو'); 
        }
    }
        
        
         
        
        
    }
    
   public function addtransfer(Request $request)
    {
        
        $newtransfer                = new transfer();
        $newtransfer->name          = $request->name;
        $newtransfer->phone         = $request->phone;
         $newtransfer->user_id         = $request->user_id;
          $newtransfer->trader_id         = $request->trader_id;
        $info=  DB::table('orders')->where('order_number',$request->bill_number)->first();

        if($info){
        $newtransfer->bill_number   = $request->bill_number;
        }

        if($request->hasFile('image'))
        {
            $image    = $request['image'];
            $filename = rand(0,9999).'.'.$image->getClientOriginalExtension();
            $image->move(base_path('users/images/'),$filename);
            $newtransfer->image = $filename;
        }
        $newtransfer->save();
        
            $notification                = new notification();
            $notification->user_id       = $request->user_id;
            $notification->notification  = 'تم إنشاء طلب جديد';
            $notification->save();

        $user = DB::table('members')->where('id',$request->trader_id)->first();

            $notification                = new notification();
            $notification->user_id       = $request->trader_id;
            $notification->notification  = 'تم استلام طلب جديد من '. $user->name;
            $notification->save();

            
            
            $usertoken = member::where('id',$request->user_id)->where('firebase_token','!=',null)->where('firebase_token','!=',0)->value('firebase_token');
            if($usertoken)
            {
                $optionBuilder = new OptionsBuilder();
                $optionBuilder->setTimeToLive(60*20);
              
                $notificationBuilder = new PayloadNotificationBuilder('إنشاء طلب جديد');
                $notificationBuilder->setBody('تم إنشاء طلب جديد')
                                    ->setSound('default');
              
                $dataBuilder = new PayloadDataBuilder();
                $dataBuilder->addData(['a_type' => 'message']);
                $option       = $optionBuilder->build();
                $notification = $notificationBuilder->build();
                $data         = $dataBuilder->build();
                $token        = $usertoken ;
              
                $downstreamResponse = FCM::sendTo($token, $option, $notification, $data);
              
                $downstreamResponse->numberSuccess();
                $downstreamResponse->numberFailure();
                $downstreamResponse->numberModification();            
                $downstreamResponse->tokensToDelete();
                $downstreamResponse->tokensToModify();
                $downstreamResponse->tokensToRetry();
            }
             $usertoken1 = member::where('id',$request->trader_id)->where('firebase_token','!=',null)->where('firebase_token','!=',0)->value('firebase_token');
            if($usertoken1)
            {
                $optionBuilder = new OptionsBuilder();
                $optionBuilder->setTimeToLive(60*20);
              
                $notificationBuilder = new PayloadNotificationBuilder('إنشاء طلب جديد');
                $notificationBuilder->setBody('تم انشاء طلب جديد من'.$user->name)
                                    ->setSound('default');
              
                $dataBuilder = new PayloadDataBuilder();
                $dataBuilder->addData(['a_type' => 'message']);
                $option       = $optionBuilder->build();
                $notification = $notificationBuilder->build();
                $data         = $dataBuilder->build();
                $token        = $usertoken1 ;
              
                $downstreamResponse = FCM::sendTo($token, $option, $notification, $data);
              
                $downstreamResponse->numberSuccess();
                $downstreamResponse->numberFailure();
                $downstreamResponse->numberModification();            
                $downstreamResponse->tokensToDelete();
                $downstreamResponse->tokensToModify();
                $downstreamResponse->tokensToRetry();
            }
        $errormessage = 'تم ارسال التحويل بنجاح';
        return $this->sendResponse('success',$errormessage); 
    }
     public function mytransfers(Request $request)
    {
        
        $transfers = transfer::where('user_id',$request->user_id)->get();
        if(count($transfers)!=0)
        {
            foreach($transfers as $transfer)
            {
                $trader = member::where('id',$transfer->trader_id)->first();
                $transfer['trader']=$trader;
            }
            return $this->sendResponse('success', $transfers);
        }else
        {
            $error =  'لا يوجد تحويلات  ';
           return $this->sendError('success',$error); 
        }
    }


}
