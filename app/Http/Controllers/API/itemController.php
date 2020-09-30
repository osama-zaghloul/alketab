<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\API\BaseController as BaseController;
use LaravelFCM\Message\OptionsBuilder;
use LaravelFCM\Message\PayloadDataBuilder;
use LaravelFCM\Message\PayloadNotificationBuilder;
use FCM;
use App\Mail\activationmail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\notification;
use App\item;
use App\item_image;
use App\rate;
use App\favorite_item;
use App\order;
use App\member;
use Illuminate\Support\Facades\Auth;
use Validator;
use DB;
use App\advisor;
use App\category;
use App\advisorspec;
use App\specialization;

class itemController extends BaseController
{
    // public function allitems(Request $request)
    // {
    //     $lastitems = array();
    //     $keyword   = $request->keyword;
    //     $price     = $request->price;
    //     $sort      = $request->sort;
    //     $allitems  = item::when($keyword, function ($query) use ($keyword) {
    //                 return $query->where('artitle','like','%' . $keyword . '%' );
    //             })->when($category, function ($query) use ($category) {
    //                 return $query->where('category_id',$category);
    //             })->when($offer, function ($query) use ($offer) {
    //                 return $offer == 1 ? $query->where('offer',$offer) : $query->where('offer',0) ;
    //             })->when($sort, function ($query) use ($sort,$offer) {
    //                 return  $offer == 1 ? $query->orderBy('discountprice',$sort) : $query->orderBy('price',$sort);
    //             })->where('suspensed',0)->orderBy('offer','desc')->orderBy('id','desc')->get(); 
    //     if(count($allitems) != 0)
    //     {
    //         foreach ($allitems as $item) 
    //             {  
    //                 $image     = item_image::where('item_id',$item->id)->first();
    //                 $favorited = 0;
    //                 $sumrates  = 0;
    //                 $adrates   = rate::where('item_id',$item->id)->get();
    //                 foreach($adrates as $value)
    //                 {
    //                    $sumrates+= $value->rate;
    //                 }
    //                 $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
                   
    //                 if($request->user_id)
    //                 {
    //                     $fav = DB::table('favorite_items')->where('user_id',$request->user_id)->where('item_id',$item->id)->get();
    //                     $favorited = count($fav) != 0 ? 1 : 0;
    //                 }
    //                 array_push($lastitems, 
    //                 array(
    //                       "id"              => $item->id,
    //                       'image'           => $image,
    //                       'title'           => $item[$lang.'title'],
    //                       "price"           => $item->price,
    //                       "offer"           => $item->offer,
    //                       "discountprice"   => $item->discountprice,
    //                       'rate'            => $fullrate,
    //                       'favorited'       => $favorited,
    //                     ));
    //             }
    //         return $this->sendResponse('success', $lastitems); 
    //     }
    //     else 
    //     {
    //         $errormessage = $request->lang == 'ar' ? 'لا يوجد منتجات' : 'No Prouducts Found';
    //         return $this->sendError('success',$errormessage);
    //     }            
    // }

    // public function showitem(Request $request)
    // {
    //      $showitem = item::find($request->item_id);
    //      if($showitem)
    //      {
    //         $iteminfo     = array();
    //         $similaritems = array();
    //         $current      = array();

            
    //         $images    = item_image::where('item_id',$showitem->id)->get();
    //         $favorited = 0;
    //         $sumrates  = 0;
    //         $adrates   = rate::where('item_id',$showitem->id)->get();
    //         foreach($adrates as $value)
    //         {
    //            $sumrates+= $value->rate;
    //         }
    //         $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
           
    //         if($request->user_id)
    //         {
    //             $fav = DB::table('favorite_items')->where('user_id',$request->user_id)->where('item_id',$showitem->id)->get();
    //             $favorited = count($fav) != 0 ? 1 : 0;
    //         }
    //         array_push($iteminfo, 
    //         array(
    //               "id"              => $showitem->id,
    //               'title'           => $showitem[$lang.'title'],
    //               "price"           => $showitem->price,
    //               "offer"           => $showitem->offer,
    //               "discountprice"   => $showitem->discountprice,
    //               "desc"            => strip_tags($showitem[$lang.'desc']),
    //               "whatsapp"        => $showitem->whatsapp,
    //               'rate'            => $fullrate,
    //               'favorited'       => $favorited,
    //               'images'          => $images,
    //             ));

    //             // similar items 
    //             $items = item::where('category_id',$showitem->category_id)->where('suspensed',0)->orderBy('id','desc')->get();
    //             foreach ($items as $item) 
    //             {  
    //                 $image     = item_image::where('item_id',$item->id)->first();
    //                 $favorited = 0;
    //                 $sumrates  = 0;
    //                 $adrates   = rate::where('item_id',$item->id)->get();
    //                 foreach($adrates as $value)
    //                 {
    //                     $sumrates+= $value->rate;
    //                 }
    //                 $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
                    
    //                 if($request->user_id)
    //                 {
    //                     $fav = DB::table('favorite_items')->where('user_id',$request->user_id)->where('item_id',$item->id)->get();
    //                     $favorited = count($fav) != 0 ? 1 : 0;
    //                 }
    //                 array_push($similaritems, 
    //                 array(
    //                         "id"           => $item->id,
    //                         'image'        => $image,
    //                         'title'        => $item[$lang.'title'],
    //                         'rate'         => $fullrate,
    //                         'favorited'    => $favorited,
    //                     ));
    //             }

    //             $current['iteminfo']     = $iteminfo;
    //             $current['similaritems'] = $similaritems;
    //         return $this->sendResponse('success', $current); 
    //      }
    //      else 
    //      {
    //         $errormessage = $request->lang == 'ar' ? 'المنتج غير موجود' : 'Item Not Found';
    //         return $this->sendError('success', $errormessage);   
    //      }
    // }
    
     public function alladvisors(Request $request)
    {
        $lastitems = array();
        $keyword   = $request->keyword;
        // $price     = $request->price;
        // $sort      = $request->category_id;
        
      if($keyword)
      {
          $alladvisors  = advisor::when($keyword, function ($query) use ($keyword) {
                     return $query->where('name','like','%' . $keyword . '%' );})->where('category_id',$request->category_id)->get();
            //  $alladvisors  = advisor::when($keyword, function ($query) use ($keyword) {
            //          return $query->where('name','like','%' . $keyword . '%' ); 

        if(count($alladvisors) != 0)
        {
            foreach ($alladvisors as $advisor) 
                {  
                    // $image     = advi::where('item_id',$item->id)->first();
                    $category = category::where('id',$advisor->category_id)->first();
                    // $favorited = 0;
                    $sumrates  = 0;
                    $adrates   = rate::where('advisor_id',$advisor->id)->get();
                    if($adrates)
                    {
                    foreach($adrates as $value)
                    {
                       $sumrates+= $value->rate;
                    }
                    $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
                   
                    }
                    array_push($lastitems, 
                    array(
                          "id"              => $advisor->id,
                          'image'           => $advisor->img,
                          'name'           => $advisor->name,
                          "cost"           => $advisor->cost,
                          'arcategory'       => $category->arname,
                          'encategory'       => $category->enname,
                          'rate'            => $fullrate,
                          
                        ));
                }
            return $this->sendResponse('success', $lastitems); 
        }
        else 
        {
            $errormessage = $request->lang == 'ar' ? 'لا يوجد مستشارين' : 'No advisors Found';
            return $this->sendError('success',$errormessage);
        }     
    }
      else
    {
        $alladvisors  = advisor::where('category_id', $request->category_id)->get();
                
        if(count($alladvisors) != 0)
        {
            foreach ($alladvisors as $advisor) 
                {  
                    // $image     = advi::where('item_id',$item->id)->first();
                    $category = category::where('id',$advisor->category_id)->first();
                    // $favorited = 0;
                    $sumrates  = 0;
                    $adrates   = rate::where('advisor_id',$advisor->id)->get();
                    if($adrates)
                    {
                    foreach($adrates as $value)
                    {
                       $sumrates+= $value->rate;
                    }
                    $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
                   
                }
                    array_push($lastitems, 
                    array(
                          "id"              => $advisor->id,
                          'image'           => $advisor->img,
                          'name'           => $advisor->name,
                          "cost"           => $advisor->cost,
                          'arcategory'       => $category->arname,
                          'encategory'       => $category->enname,
                          'rate'            => $fullrate,
                          
                        ));
                }
            return $this->sendResponse('success', $lastitems); 
        }
        else 
        {
            $errormessage = $request->lang == 'ar' ? 'لا يوجد مستشارين' : 'No advisors Found';
            return $this->sendError('success',$errormessage);
        }            
    }
}


public function showadvisor(Request $request)
    {
        $advisors= array();
        $user = advisor::where('id',$request->advisor_id)->where('suspensed',0)->first();
        if(!$user)
        { 
            $errormessage = $request->lang == 'ar' ?'هذا المستشار غير موجود':'This advisor does not exist';
            return $this->sendError('success', $errormessage);
        }
        else
        {
             $category = category::where('id',$user->category_id)->first();
                    // $favorited = 0;
             $rate = array();      
             $sumrates  = 0;
            $adrates   = rate::where('advisor_id',$user->id)->get();
            if($adrates)
            {
            foreach($adrates as $value)
            {
                       $sumrates+= $value->rate;
                        
                       array_push($rate, 
                array(
                    "id"          => $value->id,
                    'name'      => $value->name,
                    'rate'      => $value->rate,
                    'text'      => $value->text,
                    'created_date'      => $value->created_date,
                    'created_time'      => $value->created_time,
                   
                    ));
            }
            $fullrate = $sumrates != 0 ? $sumrates/count($adrates) : 0; 
                   
            array_push($advisors, 
                array(
                    "id"          => $user->id,
                    'name'      => $user->name,
                    'email'      => $user->email,
                    'phone'      => $user->phone,
                    'age'      => $user->age,
                    'qualification'      => $user->qualification,
                    'experience'      => $user->experience,
                    'arcategory'      => $category->arname,
                    'encategory'      => $category->enname,
                    'qualification_img'      => $user->qualification_img,
                    'license_img'      => $user->license_img,
                    'artext'      => $user->artext,
                    'entext'      => $user->entext,
                    'cost'      => $user->cost,
                    'bank'      => $user->bank,
                    'img'      => $user->img,
                    'rate'      => $fullrate,
                    ));
            $all = array();
            $specializations=array();
            $specs = advisorspec::where('advisor_id',$user->id)->get();
            foreach($specs as $spec)
            {
            $special = specialization::where('id',$spec->specialization_id)->first();
             array_push($specializations, 
                array(
                    "id"          => $special->id,
                    'arname'      => $special->arname,
                    'enname'      => $special->enname,
                    
                    ));
            }
            $all['advisor']=$advisors;
            $all['rates']=$rate;
            $all['specializations']=$specializations;
            return $this->sendResponse('success', $all);
        } 
    }
}

    public function addrate(Request $request)
    {
        $userrating = rate::where('user_id',$request->user_id)->where('advisor_id',$request->advisor_id)->first();
        if($userrating)
        {
            $errormessage ='تم تقييم هذا المستشار سابقا' ;
            return $this->sendError('success', $errormessage);
        }
        else 
        {
            $user = member::where('id',$request->user_id)->first();
            $newrate                = new rate();
            $newrate->user_id       = $request->user_id;
            $newrate->advisor_id    = $request->advisor_id;
            $newrate->rate          = $request->rate;
            $newrate->text          = $request->text;
            $newrate->name          = $user->name;
            $newrate->created_date  = date("Y-m-d");
            $newrate->created_time  = date("H:i:s");
            $newrate->save();
            $errormessage =$request->lang == 'ar' ?'تم التقييم بنجاح':'Rate has been added successfully';
            return $this->sendResponse('success', $errormessage);
        }
    }

    // public function makefavoriteitem(Request $request)
    // {
    //     $favorited = favorite_item::where('item_id',$request->item_id)->where('user_id',$request->user_id)->first();
    //     if($favorited)
    //     {
    //         $errormessage ='هذا المنتج موجود ف المفضلة';
    //         return $this->sendError('success', $errormessage); 
    //     }
    //     else 
    //     {
    //         $newfavad = new favorite_item;
    //         $newfavad->user_id = $request->user_id;
    //         $newfavad->item_id   = $request->item_id;
    //         $newfavad->save();
    //         $errormessage ='تم اضافة المنتج ف المفضلة بنجاح';
    //         return $this->sendResponse('success', $errormessage);
    //     }
    // }

    // public function cancelfavoriteitem(Request $request)
    // {
    //     favorite_item::where('user_id',$request->user_id)->where('item_id',$request->item_id)->delete();
    //     $errormessage ='تم حذف المنتج من المفضلة';
    //     return $this->sendResponse('success', $errormessage);
    // }
    
}
