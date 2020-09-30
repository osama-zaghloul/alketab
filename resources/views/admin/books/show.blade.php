@extends('admin/include/master')
@section('title') لوحة التحكم | مشاهدة بيانات الكتاب @endsection
@section('content')  
<section class="content">
    <div class="row">
    
        <div class="col-md-12">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li style="margin-right: 0px; width:100%;text-align:center" class="active "><a href="#activity" data-toggle="tab"> بيانات الكتاب  </a></li>
                    
                </ul>
                <div class="tab-content">

                    <div class="active tab-pane" id="activity">
                                    <div class="box-body">
                                        <div style="margin-top: 7%;" class="col-md-6">
                                            
                                            <div class="form-group col-md-12">
                                                <label> اسم الكتاب</label>
                                                <input type="text" class="form-control" value="{{$showbook->name}}" readonly> 
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label> صاحب الكتاب</label>
                                                <a href="{{asset('adminpanel/users/'.$user->id)}}">
                                                <input type="text" class="form-control" value="{{$user->name}}" readonly> </a>
                                            </div>
                                            

                                            <div class="form-group col-md-12">
                                                <label> القسم</label>
                                                 <?php
                                            $category = DB::table('categories')->where('id',$showbook->category_id)->value('arname');
                                            ?>
                                                <input type="text" class="form-control" value="{{$category}}" readonly> 
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label>الحالة</label>
                                                <input type="text" class="form-control" @if($showbook->status==0) value="جديد" @else value="مستعمل" @endif readonly> 
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>وصف الكتاب</label>
                                                <input type="text" class="form-control" value="{{$showbook->details}}" readonly> 
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>السعر</label>
                                                <input type="text" class="form-control" value="{{$showbook->cost}}" readonly> 
                                            </div>
                                           
                                            
                                        </div>

                                        <div class="col-md-6">
                                        
                                        <h3 class="box-title" style="float:left;"> {{$showbook->name}}</h3>
                                        
                                            <h4 style="float:right;margin-top: 5%;">
                                                @if($showbook->suspensed == 0)
                                                غير معطل<span> <i class="fa fa-unlock text-success"></i> </span>
                                                @else 
                                                معطل<span> <i class="fa fa-lock text-danger"></i> </span>
                                                @endif 
                                            </h4>
                                            
                                            <div class="col-md-12">
                                                
                                                <img class="img-circle" style="width:100%; height:50%;" src="{{asset('users/images/'.$showbook->image)}}" alt="{{$showbook->name}}">
                                                
                                            </div>
                                        </div>
                                    </div>  
                    </div>
            
                   
            </div>
        </div>
    </div>
</section> 

@endsection