<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\setting;
use DB;
class admintextController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $mainactive = "setting";
        $subactive  = "text";
        $logo       = DB::table('settings')->value('logo');
        $policy     = setting::first();
        return view('admin.setting.texts', compact('policy', 'mainactive', 'logo', 'subactive'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $this->validate($request, [
            'text1' => 'required',
            'text2' => 'required',
            'text3' => 'required',
        ]);
        $upinfo            = setting::find($id);
        $upinfo->text1   = $request['text1'];
        $upinfo->text2   = $request['text2'];
        $upinfo->text3   = $request['text3'];
        $upinfo->save();
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
