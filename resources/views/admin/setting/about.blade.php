@extends('admin.include.master')
@section('title') لوحة التحكم | حول التطبيق  @endsection
@section('content')
  
<section class="content">
        <div class="row">
                <div class="col-xs-12">
              {{ Form::open(array('method' => 'patch','url' => 'adminpanel/about/'.$policy->id )) }}
                <div class="box-body">
                    <!-- editor -->
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">
                                <h3 class="box-title" >
                                  حول التطبيق باللغة العربية  
                                </h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea id="editor1" name="arabout" rows="10" cols="80" required>{{$policy->arabout}}</textarea>
                                    @if ($errors->has('arabout'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('arabout') }}</div>
                                    @endif
                                </div>
                            </div>
                    </div>
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">
                                <h3 class="box-title" >
                                  حول التطبيق باللغة الانجليزية  
                                </h3>
                                </div> 
                                <div class="box-body pad">
                                    <textarea id="editor2" name="enabout" rows="10" cols="80" required>{{$policy->enabout}}</textarea>
                                    @if ($errors->has('enabout'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('enabout') }}</div>
                                    @endif
                                </div>
                            </div>
                    </div>

                    <!-- editor -->
                
                    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary col-md-offset-4 col-md-4">تعديل</button>
                    </div>
    {!! Form::close() !!}
    </div>
</div> 
</div>
</section>

@endsection 