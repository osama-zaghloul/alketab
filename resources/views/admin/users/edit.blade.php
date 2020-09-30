@extends('admin/include/master')
@section('title') لوحة التحكم | تعديل بيانات العضو @endsection
@section('content')
   
<section class="content">
    <div class="row">
      <div class="col-xs-12">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">تعديل بيانات العضو </h3>
          <p> {{ $eduser->name }} </p>
        </div>
        
        {!! Form::open(array('method' => 'patch','files' => true,'url' =>'adminpanel/users/'.$eduser->id)) !!}
        <div class="box-body">

                <div class="form-group col-md-6">
                    <label>الاسم بالكامل </label>
                    <input type="text" class="form-control" name="name" placeholder="ادخل الاسم بالكامل " value="{{$eduser->name}}" required>
                    @if ($errors->has('name'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('name') }}</div>
                    @endif  
                </div>

                 <div class="form-group col-md-6">
                    <label>اسم المستخدم </label>
                    <input type="text" class="form-control" name="username" placeholder="ادخل اسم المستخدم " value="{{ $eduser->username }}" required>
                    @if ($errors->has('username'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('username') }}</div>
                    @endif  
                </div>

                <div class="form-group col-md-6">
                    <label>رقم الجوال</label>
                    <input type="text" class="form-control" name="phone" placeholder="ادخل رقم الجوال" value="{{ $eduser->phone }}" required>
                    @if ($errors->has('phone'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('phone') }}</div>
                    @endif  
                </div>

              
                <div class="form-group col-md-12">
                    <label> كلمة المرور الجديدة</label>
                    <input type="password" class="form-control" id="adminpass1" name="pass" placeholder="كلمة المرور الجديدة">
                    <div style="padding:1%;" id="errorpass"></div>
                    <div class="figure" id="strength_human2"></div>
                    @if ($errors->has('pass'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('pass') }}</div>
                    @endif  
                </div>

          </div>

          <div class="box-footer">
            <button style="width: 20%;margin-right: 40%;" type="submit" class="btn btn-success">تعديل</button>
          </div>
          {!! Form::close() !!}
        </div> 
      </div>  
    </div> 
</section>                          
@endsection 
