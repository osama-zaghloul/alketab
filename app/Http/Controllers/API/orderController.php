<?php

namespace App\Http\Controllers\API;

use App\adv_notification;
use App\advisor;
use App\Cutting;
use App\Http\Controllers\API\BaseController as BaseController;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use FCM;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Http\Request;
use App\member;
use App\notification;
use App\item;
use App\item_image;
use App\order_item;
use App\order;
use App\weight;
use Carbon\Carbon;
use DB;
use App\advisorspec;
use App\book;
use App\member_book;

class orderController extends BaseController 
{

    public function makeorder(Request $request)
    {
        $user = member::where('id',$request->user_id)->first();
        if($user)
        {
            $neworder                = new order();
            $neworder->order_number  = date('dmY').rand(0,999);
            $neworder->user_id       = $request->user_id;
            $neworder->trader_id    = $request->trader_id;
            $neworder->total         = $request->total;
            $neworder->paid          = $request->paid;
            $neworder->date          = $request->date;
            $neworder->time          = $request->time;
            $neworder->book_id = $request->book_id;
            $neworder->details       = $request->details;
           
            
            $neworder->save();
             $user = member::where('id',$request->user_id)->first();
             $trader = member::where('id',$request->trader_id)->first();
           
           
            $notification                = new notification();
            $notification->user_id       = $request->user_id;
            $notification->notification  =' تم إنشاء طلب  جديد';
            $notification->save();

            $notification                = new notification();
            $notification->user_id    = $request->trader_id;
            $notification->notification  = 'تم استلام طلب جديد من قبل '.$user->name;
            $notification->save();
            
            $usertoken = member::where('id',$request->user_id)->where('firebase_token','!=',null)->where('firebase_token','!=',0)->value('firebase_token');
            // $usertoken1 = advisor::where('id',$request->advisor_id)->where('firebase_token','!=',null)->where('firebase_token','!=',0)->value('firebase_token');
            if($usertoken)
            {
                $optionBuilder = new OptionsBuilder();
                $optionBuilder->setTimeToLive(60*20);
              
                $notificationBuilder = new PayloadNotificationBuilder('إنشاء طلب  جديد');
                $notificationBuilder->setBody('تم انشاء طلب جديد ')
                                    ->setSound('default');
              
                $dataBuilder = new PayloadDataBuilder();
                $dataBuilder->addData(['a_type' => 'order']);
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
                $notificationBuilder->setBody('تم استلام طلب جديد من  :'.$user->name)
                                    ->setSound('default');
              
                $dataBuilder = new PayloadDataBuilder();
                $dataBuilder->addData(['a_type' => 'order']);
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
            $errormessage ='تم ارسال الطلب بنجاح';
            $msg = array();
            $msg['bill_number'] = $neworder->order_number;
            $msg['message']=$errormessage;
            
            return $this->sendResponse('success',$msg );
        }
        else 
        {
            $errormessage ='المستخدم غير موجود';
            return $this->sendError('success', $errormessage);
        }
    }

    public function myorders(Request $request)
    {
        $user = member::where('id',$request->user_id)->first();
        if($user)
        {
            $myorders['orders'] = order::where('user_id',$request->user_id)->get();
            
            if(count($myorders) != 0)
            {
               foreach($myorders['orders'] as $order)
               {
                $book= book::where('id',$order->book_id)->first();
                $order['book']=$book;

                // $orders=array();
                // array_push($orders, 
                //     array(
                //           "oreer"          => $order,
                //           'book'           => $book,
                //     ));
                
               }
                return $this->sendResponse('success', $myorders); 
            }
            else 
            {
                $errormessage ='لا يوجد طلبات' ;
                return $this->sendError('success', $errormessage);
            }
        }
        else 
        {
            $errormessage ='هذا المستخدم غير موجود';
            return $this->sendError('success', $errormessage); 
        }
    }
    
    public function showorder(Request $request)
    {
        $showorder = order::where('id',$request->order_id)->first();
        if($showorder)
        {
            //  foreach($showorder['orders'] as $myorder)
                // {
                $current= array();
                 $trader = member::where('id',$showorder->trader_id)->first();
                 $book = book::where('id',$showorder->book_id)->first();
                $current['order'] = $showorder;
                $current['trader']=$trader;
                $current['book']=$book;
                // array_push($itemarr, 
                //     array(
                //         "id"           => $orderitem->id,
                //         'image'        => $image,
                //         'title'        => $orderitem->artitle,
                       
                //         ));
                // } 
                
                return $this->sendResponse('success', $current); 
            
           
        }
        else 
        {
            $errormessage ='الطلب غير موجود';
            return $this->sendError('success', $errormessage); 
        }
    }


    
    
}
