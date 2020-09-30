@extends('admin.include.master')
@section('title') لوحة التحكم | الأسئلة الشائعة   @endsection
@section('content')

<section class="content">
        <div class="row">
                <div class="col-xs-12">
              {{ Form::open(array('method' => 'patch','url' => 'adminpanel/privacy/'.$privacy->id )) }}
                <div class="box-body">

                    <!-- editor -->
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">  
                                <h3 class="box-title" >
                                   الأسئلة الشائعة باللغة العربية    
                                </h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea id="editor1" name="arques" rows="10" cols="80" required>{{$privacy->arquestions}}</textarea>
                                    @if ($errors->has('arques'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('arques') }}</div>
                                    @endif
                                </div>
                            </div>
                    </div>
                    <div class="col-md-12">
                            <div class="box box-info">
                                <div class="box-header">  
                                <h3 class="box-title" >
                                   الأسئلة الشائعة باللغة الإنجليزية    
                                </h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea id="editor2" name="enques" rows="10" cols="80" required>{{$privacy->enquestions}}</textarea>
                                    @if ($errors->has('enques'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('enques') }}</div>
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