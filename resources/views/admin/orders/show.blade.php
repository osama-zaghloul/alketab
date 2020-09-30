@extends('admin/include/master')
@section('title') لوحة التحكم | مشاهدة تفاصيل الطلب  @endsection
@section('content')

  <section class="content-header"></section>
    <section class="invoice">
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> رقم الطلب   {{$showorder->order_number}}#
            <small class="pull-left">تاريخ الطلب : {{ date('Y/m/d', strtotime($showorder->created_at)) }}</small>
          </h2>
         
        </div>
      </div>
     
      <div class="row invoice-info">
        <div class="col-sm-12 invoice-col">
            @if($showorder->status == 0)
                <span style="border-radius: 3px;border: 1px solid green;color: orange;float:left;padding: 3px;font-weight: bold;background: #fff;display: inline-block;margin-top: 4%;" class="ads__item__featured">قيد الانتظار</span>
            @elseif($showorder->status == 1) 
                  <span style="border-radius: 3px;border: 1px solid green;color: springgreen;float:left;padding: 3px;font-weight: bold;background: #fff;display: inline-block;margin-top: 4%;" class="ads__item__featured">جارى </span>
            @elseif($showorder->status == 2)   
                  <span style="border-radius: 3px;border: 1px solid #c22356;float:left;color:crimson;padding: 3px;font-weight: bold;background: #fff;display: inline-block;margin-top: 4%;" class="ads__item__featured">تم رفض الطلب</span>
            @elseif($showorder->status == 3)   
                  <span style="border-radius: 3px;border: 1px solid green;float:left;color:green;padding: 3px;font-weight: bold;background: #fff;display: inline-block;margin-top: 4%;" class="ads__item__featured">منتهي </span>
            @endif    
               
            @if($showorder->paid == 0)   
              {{ Form::open(array('method' => 'patch',"onclick"=>"return confirm('هل انت متاكد ؟!')",'files' => true,'url' =>'adminpanel/bills/'.$showorder->id )) }}
                      <input type="hidden" name="confirm" >الدفع عن طريق التحويل البنكي
                      <button type="submit" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i>تفعيل</button>
              {!! Form::close() !!}
            @elseif($showorder->paid == 1)   
                  {{ Form::open(array('method' => 'patch',"onclick"=>"return confirm('هل انت متاكد ؟!')",'files' => true,'url' =>'adminpanel/bills/'.$showorder->id )) }}
                      <input type="hidden" name="confirm" >الدفع عن طريق الدفع الالكتروني    
                      <button type="submit" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i>تفعيل</button>
              {!! Form::close() !!}
            @elseif($showorder->paid == 2)   
                  <span style="border-radius: 3px;border: 1px solid green;float:left;color:green;padding: 3px;font-weight: bold;background: #fff;display: inline-block;margin-top: 4%;margin-left: 5px;" class="ads__item__featured">تم الدفع</span>
            @endif 
          صاحب الطلب
          <address>
           <a href="{{asset('adminpanel/users/'.$ownerinfo->id)}}"> 
            <strong>{{$ownerinfo->name}}</strong> </a> <br>

            
             رقم الجوال : {{$ownerinfo->phone}}<br>
            {{-- العنوان     : {{$ownerinfo->address}}<br> --}}
          </address>

          بائع الكتاب
          <address>
           <a href="{{asset('adminpanel/users/'.$traderinfo->id)}}"> 
            <strong>{{$traderinfo->name}}</strong> </a> <br>
             {{-- الإيميل : {{$advisorinfo->email}}<br> --}}
             رقم الجوال : {{$traderinfo->phone}}<br>
          </address>
        </div>
        
      <div class="row">
        <div class="col-xs-12">
          <div class="table-responsive">
            
              <div class="col-md-8">
                <table class="table">
                    <tbody>

                      <tr>
                          <th style="width: 25%;">اسم الكتاب </th>
                          <td>
                           <a href="{{asset('adminpanel/books/'.$book->id)}}"> 
                           <strong>{{$book->name}}</strong> </a> <br>
                          </td>
                      </tr>
                      
                      <tr>
                          <th style="width: 25%;">تاريخ التوصيل </th>
                         
                          <td>
                            {{$showorder->date}}   
                          </td>
                          
                      </tr>
                      <tr>
                          <th style="width: 25%;">موعد التوصيل</th>
                         
                          <td>
                            {{$showorder->time}}
                          </td>
                          
                      </tr>
                      
                       
                      <tr>
                            <th style="width: 25%;">التفاصيل</th>
                            <td>{{$showorder->details}}</td>
                      </tr>
                     
                      

                      <tr>
                            <th style="width: 25%;">السعر</th>
                            <td>{{$showorder->total}} ريال</td>
                      </tr>
                     

                      

                    </tbody>
                </table>
              </div>
              
            
          </div>
          <div class="col-md-12">
              <h3>الاجمالى : <span style="color:#500253">{{$showorder->total}}</span> ريال</h3>
          </div>  
        </div>
      </div>

    </section>
@endsection