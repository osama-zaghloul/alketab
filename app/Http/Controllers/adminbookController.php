<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;
use App\Mail\notificationmail;
use App\Mail\contactmail;
use Illuminate\Support\Facades\Mail;
use App\category;
use App\member;
use App\order;
use App\specialization;
use Carbon\Carbon;
use DB;
use App\advisorspec;
use App\book;
use App\member_book;

class adminbookController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mainactive = 'books';
        $subactive  = 'book';
        $logo       = DB::table('settings')->value('logo');
        $allbooks   = book::where('paid',0)->orderBy('id', 'desc')->get();
        return view('admin.books.index', compact('mainactive', 'subactive', 'logo', 'allbooks'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $mainactive = 'books';
        $subactive  = 'addbook';
        $logo       = DB::table('settings')->value('logo');
        $categories = category::all();
        $users = member::all();
        
        return view('admin.books.create', compact('mainactive', 'logo', 'subactive','categories','users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name'        => 'required',
            'category'       => 'required',
            'image'       => 'required',
            'cost'       => 'required',
            'details'       => 'required',
            'status'        => 'required',
            'user'        => 'required',
        ]);

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
        session()->flash('success', 'تم اضافة الكتاب بنجاح');
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $mainactive        = 'books';
        $subactive         = 'book';
        $logo              = DB::table('settings')->value('logo');
        $showbook          = book::find($id);
        $user_book          = member_book::where('book_id', $showbook->id)->first();
        $user              = member::where('id',$user_book->user_id)->first();
    
        return view('admin.books.show', compact('mainactive', 'subactive', 'logo', 'showbook','user_book','user' ));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $mainactive = 'books';
        $subactive  = 'editbook';
        $logo       = DB::table('settings')->value('logo');
        $edbook     = book::find($id);
        $users      = member::all();
        $user_book  = member_book::where('book_id', $edbook->id)->first();
        $userr      = member::where('id',$user_book->user_id)->first();
        $categories = category::all();
        return view('admin.books.edit', compact('mainactive', 'subactive', 'logo', 'edbook','categories','userr','users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $upbook = book::find($id);

        if (Input::has('suspensed')) {
            if ($upbook->suspensed == 0) {
                DB::table('books')->where('id', $id)->update(['suspensed' => 1]);
                session()->flash('success', 'تم تعطيل  الكتاب بنجاح');
                return back();
            } else {
                DB::table('books')->where('id', $id)->update(['suspensed' => 0]);
                session()->flash('success', 'تم تفعيل الكتاب بنجاح');
                return back();
            }
        } else {
           
            $this->validate($request, [
            'name'        => 'required',
            'category'       => 'required',
            'cost'       => 'required',
            'details'       => 'required',
            'status'        => 'required',
            'user'        => 'required',
        ]);

                
        
        $upbook->name      = $request['name'];
        $upbook->details      = $request['details'];
        $upbook->category_id      = $request['category'];
        $upbook->status      = $request['status'];
        $upbook->cost      = $request['cost'];
        
        
         if($request->hasFile('image'))
            {
                $image = $request['image'];
                $filename = rand(0,9999).'.'.$image->getClientOriginalExtension();
                $image->move(base_path('users/images/'),$filename);
                $upbook->image = $filename;
            }
         

        $upbook->save();
        
        $upmember_book =  member_book::where('book_id',$upbook->id)->first();
        $upmember_book->book_id      = $upbook->id ;
        $upmember_book->user_id      =$request['user'];  
        $upmember_book->save();
    
           
            session()->flash('success', 'تم تعديل بيانات الكتاب بنجاح');
            return back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // if (Input::has('delrate')) {
        //     rate::where('id', $id)->delete();
        //     return back();
        // } else {
            $delbook = book::find($id);
            if ($delbook) {
                $delbook->delete();
               
                $order= order::where('book_id',$delbook->id)->get();
                
                    $order->delete();
               
                 session()->flash('success', 'تم حذف الكتاب بنجاح');
            }
            return back();
        // }
    }

    public function deleteAll(Request $request)
    {
        $ids = $request->ids;
        DB::table("books")->whereIn('id', explode(",", $ids))->delete();
        return response()->json(['success' => "تم الحذف بنجاح"]);
    }
}
