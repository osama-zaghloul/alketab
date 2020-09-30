@extends('admin/include/master')
@section('title') لوحة التحكم | إضافة كتاب جديد @endsection
@section('content')

<section class="content">
        <div class="row">
            <div class="col-xs-12">  
                <div class="box box-primary">
  
              <div class="box-header with-border">
                <h3 class="box-title">إضافة كتاب جديد</h3>
              </div>
              
              {!! Form::open(array('method' => 'POST','files' => true,'url' =>'adminpanel/books')) !!}
                <div class="box-body">
                    
                <div class="form-group col-md-6">
                    <label> اسم الكتاب </label>
                    <input type="text" class="form-control" name="name" placeholder="ادخل الاسم بالكامل " value="{{ old('name') }}" required>
                    @if ($errors->has('name'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('name') }}</div>
                    @endif  
                </div>
               
                <div class="form-group col-md-6">
                    <label>وصف الكتاب  </label>
                    <input type="text" class="form-control" name="details" placeholder="ادخل الوصف  " value="{{ old('details') }}" required>
                    @if ($errors->has('details'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('details') }}</div>
                    @endif  
                </div>
                 <div class="form-group col-md-6">
                    <label>   صورة الكتاب</label>
                    <input type="file" class="form-control" name="image" required>
                    @if ($errors->has('image'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('image') }}</div>
                    @endif    
                </div>
                 <div class="form-group col-md-6">
                    <label>التكلفة</label>
                    <input type="text" class="form-control" name="cost" placeholder="ادخل التكلفة" value="{{ old('cost') }}" required>
                    @if ($errors->has('cost'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('cost') }}</div>
                    @endif    
                </div>


                <div class="form-group col-md-4">
                    <label>القسم</label>
                    <select name="category" required>
                        @foreach ($categories as $category)
                            <option value="{{$category->id}}">{{$category->arname}}</option>
                        @endforeach

                    </select>
                    @if ($errors->has('category'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('category') }}</div>
                    @endif    
                </div>

                
                
                
               
                <div class="form-group col-md-4">
                    <label>صاحب الكتاب</label>
                    <select name="user" required>
                        @foreach ($users as $user)
                            <option value="{{$user->id}}">{{$user->name}}</option>
                        @endforeach

                    </select>
                    @if ($errors->has('user'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('user') }}</div>
                    @endif    
                </div>

               <div class="form-group col-md-4">
                    <label>الحالة</label>
                    <select name="status" required>
                       
                            <option value="0">جديد</option>
                            <option value="1">مستعمل</option>
                    </select>
                    @if ($errors->has('status'))
                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('status') }}</div>
                    @endif    
                </div>

                </div>

                <div class="box-footer">
                  <button style="width: 20%;margin-right: 40%;" type="submit"  class="btn btn-primary">إضافة</button>
                </div>
                {!! Form::close() !!}
          </div>
        </div>
</section>
@endsection 
