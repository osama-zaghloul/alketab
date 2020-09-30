@extends('admin.include.master')
@section('title') لوحة التحكم | النصوص   @endsection
@section('content')
  
<section class="content">
        <div class="row">
                <div class="col-xs-12">
              {{ Form::open(array('method' => 'patch','url' => 'adminpanel/texts/'.$policy->id )) }}
                <div class="box-body">
                    <!-- editor -->
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">
                                <h3 class="box-title" >
                                  النص 1     
                                </h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea id="editor1" name="text1" rows="10" cols="80" required>{{$policy->text1}}</textarea>
                                    @if ($errors->has('text1'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('text1') }}</div>
                                    @endif
                                </div>
                            </div>
                    </div>
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">
                                <h3 class="box-title" >
                                  النص 2     
                                </h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea id="editor2" name="text2" rows="10" cols="80" required>{{$policy->text2}}</textarea>
                                    @if ($errors->has('text2'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('text2') }}</div>
                                    @endif
                                </div>
                            </div>
                    </div>
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">
                                <h3 class="box-title" >
                                  النص 3     
                                </h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea id="editor3" name="text3" rows="10" cols="80" required>{{$policy->text3}}</textarea>
                                    @if ($errors->has('text3'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('text3') }}</div>
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