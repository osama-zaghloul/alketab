@extends('admin/include/master')
@section('title') لوحة التحكم |  التخصصات  @endsection
@section('content')

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">   
                <div class="box-header with-border">
                    <h3 class="box-title"> التخصصات  </h3>
                    <button style="float:left" type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-addclass"><i class="fa fa-plus" aria-hidden="true"></i> إضافة تخصص جديد</button>
                </div>  
                
                <div class="modal fade" id="modal-addclass" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                            <h4 class="modal-title">إضافة تخصص جديد  </h4>
                        </div>
                        <div class="modal-body">
                            {{ Form::open(array('method' => 'POST','files'=>true,'url' => 'adminpanel/wcategories')) }}

                                <div class="form-group col-md-12">
                                    <label>اسم التخصص باللغة العربية </label>
                                    <div class="form-group col-md-12">
                                        <input style="width:100%;" type="text" class="form-control" name="arname" placeholder="اسم التخصص باللغة العربية"  required>
                                        @if ($errors->has('arname'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('arname') }}</div>
                                        @endif
                                    </div> 
                                </div>
                                <div class="form-group col-md-12"> 
                                    <label>اسم التخصص باللغة الانجليزية </label>
                                    <div class="form-group col-md-12">
                                        <input style="width:100%;" type="text" class="form-control" name="enname" placeholder="اسم القسم باللغة الانجليزية "  required>
                                        @if ($errors->has('enname'))
                                        <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('enname') }}</div>
                                        @endif
                                    </div>  
                                </div> 
                            <div class="form-group col-md-12">
                                    <label>اختر القسم</label>
                                    <div class="form-group col-md-12">
                                        <select name="category" id="">
<!--                                            <option value="">اختر المدينة</option>-->
                                            @foreach ($allcategories as $cat)
                    
                                        <option value="{{$cat->id}}">{{$cat->arname}}</option>

                                            @endforeach
                                        </select>
                                    </div>  
                                </div>

                               

                                <button type="submit" class="btn btn-primary col-md-offset-4 col-md-4">اضافة</button>
                            {!! Form::close() !!}    
                        </div>
                        <div class="modal-footer">
                            
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">اغلاق</button>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="active tab-pane" id="activity">
                    <div class="table-responsive box-body">
                        {{-- <button style="margin-bottom: 10px;float:left;" class="btn btn-danger delete_all" data-url="{{ url('mywcategoriesDeleteAll') }}"><i class="fa fa-trash-o" aria-hidden="true"></i> حذف المحدد</button> --}}
                        <table id="example3" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        
                                        <th style="text-align:center;">التخصص باللغة العربية</th>
                                        <th style="text-align:center;">التخصص باللغة الانجليزية</th>
                                        <th style="text-align:center;"> القسم </th>
                                        <th style="text-align:center;"> تعديل </th>
                                        <th style="text-align:center;"> حذف</th> 
                                        {{-- <th width="50px"><input type="checkbox" id="master"></th> --}}
                                    </tr>
                                </thead>
                        
                                <tbody> 
                                    @foreach($specializations as $spec)
                                        <tr>
                                            <td>
                                                {{ $spec->arname}}
                                            </td>
                                            <td>
                                                {{ $spec->enname}}
                                            </td>
                                            <?php
                                           $category = DB::table('categories')->where('id',$spec->category_id)->first();
                                            ?>
                                            <td>
                                                {{ $category->arname}}
                                            </td>
                                            
                                            <td>
                                                <button type="button" class="btn btn-success"  data-toggle="modal" data-target="#modal-upclass{{$spec->id}}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                            </td>

                                            <td>
                                                {{ Form::open(array('method' => 'DELETE',"onclick"=>"return confirm('هل انت متأكد ؟!')",'files' => true,'url' => array('adminpanel/wcategories/'.$spec->id))) }}
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                                {!! Form::close() !!}
                                            </td>
                                            {{-- <td><input type="checkbox" class="sub_chk"      data-id="{{$cutting->id}}"></td> --}}
                                        </tr>

                                    <div class="modal fade" id="modal-upclass{{$spec->id}}" style="display: none;">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span></button>
                                                <h4 class="modal-title">تعديل التخصص</h4>
                                            </div>
                                            <div class="modal-body">
                                                {{ Form::open(array('method' => 'patch','files'=>true,'url' => 'adminpanel/wcategories/'.$spec->id )) }}
                                                    
                                                    <div class="form-group col-md-12">
                                                        <label>اسم التخصص باللغة العربية</label>
                                                        <div class="form-group col-md-12">
                                                            <input style="width:100%;" type="text" class="form-control" name="arname" placeholder="اسم التخصص" value="{{$spec->arname}}" required>
                                                            @if ($errors->has('arname'))
                                                            <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('arname') }}</div>
                                                            @endif
                                                        </div>  
                                                    </div>  
                                                    <div class="form-group col-md-12">
                                                        <label>اسم التخصص باللغة الانجليزية</label>
                                                        <div class="form-group col-md-12">
                                                            <input style="width:100%;" type="text" class="form-control" name="enname" placeholder="اسم التخصص" value="{{$spec->enname}}" required>
                                                            @if ($errors->has('enname'))
                                                            <div style="color: crimson;font-size: 18px;" class="error">{{ $errors->first('enname') }}</div>
                                                            @endif
                                                        </div>  
                                                    </div>  
                                                    <div class="form-group col-md-12">
                                                   <label>اختر القسم</label>
                                                     <div class="form-group col-md-12">
                                                         <select name="category" id="">
<!--                                                                <option value="">اختر المدينة</option>-->
                                                                @foreach ($allcategories as $cat)
                    
                                                            <option @if($spec->category_id == $cat->id)  selected @endif  value="{{$cat->id}}">{{$cat->arname}}</option>

                                                                @endforeach
                                                            </select>
                                                     </div>  
                                                 </div>
                                                      

                                                    <button type="submit" class="btn btn-primary col-md-offset-4 col-md-4">تعديل</button>
                                                {!! Form::close() !!}    
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">اغلاق</button>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                                </tbody> 
                            </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $(document).ready(function () {

        $('#master').on('click', function(e) {
         if($(this).is(':checked',true))  
         {
            $(".sub_chk").prop('checked', true);  
         } else {  
            $(".sub_chk").prop('checked',false);  
         }  
        });


        $('.delete_all').on('click', function(e) {
            var allVals = [];  
            $(".sub_chk:checked").each(function() {  
                allVals.push($(this).attr('data-id'));
            });  


            if(allVals.length <=0)  
            {  
                alert("حدد عنصر واحد ع الاقل ");  
            }  else {  


                var check = confirm("هل انت متاكد؟");  
                if(check == true){  
                    var join_selected_values = allVals.join(","); 
                    $.ajax({
                        url: $(this).data('url'),
                        type: 'DELETE',
                        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                        data: 'ids='+join_selected_values,
                        success: function (data) {
                            if (data['success']) {
                                $(".sub_chk:checked").each(function() {  
                                    $(this).parents("tr").remove();
                                });
                                alert(data['success']);
                            } else if (data['error']) {
                                alert(data['error']);
                            } else {
                                alert('Whoops Something went wrong!!');
                            }
                        },
                        error: function (data) {
                            alert(data.responseText);
                        }
                    });


                  $.each(allVals, function( index, value ) {
                      $('table tr').filter("[data-row-id='" + value + "']").remove();
                  });
                }  
            }  
        });


        $('[data-toggle=confirmation]').confirmation({
            rootSelector: '[data-toggle=confirmation]',
            onConfirm: function (event, element) {
                element.trigger('confirm');
            }
        });


        $(document).on('confirm', function (e) {
            var ele = e.target;
            e.preventDefault();

            $.ajax({
                url: ele.href,
                type: 'DELETE',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                success: function (data) {
                    if (data['success']) {
                        $("#" + data['tr']).slideUp("slow");
                        alert(data['success']);
                    } else if (data['error']) {
                        alert(data['error']);
                    } else {
                        alert('Whoops Something went wrong!!');
                    }
                },
                error: function (data) {
                    alert(data.responseText);
                }
            });
            return false;
        });
    });
</script>

@endsection
