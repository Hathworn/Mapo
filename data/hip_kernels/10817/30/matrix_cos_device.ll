; ModuleID = '../data/hip_kernels/10817/30/main.cu'
source_filename = "../data/hip_kernels/10817/30/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @matrix_cos(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %159

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, double addrspace(1)* %0, i64 %15
  %17 = load double, double addrspace(1)* %16, align 8, !tbaa !7, !amdgpu.noclobber !5
  %18 = tail call double @llvm.fabs.f64(double %17)
  %19 = fcmp olt double %18, 0x41D0000000000000
  br i1 %19, label %20, label %39

20:                                               ; preds = %14
  %21 = fmul double %18, 0x3FE45F306DC9C883
  %22 = tail call double @llvm.rint.f64(double %21)
  %23 = tail call double @llvm.fma.f64(double %22, double 0xBFF921FB54442D18, double %18)
  %24 = tail call double @llvm.fma.f64(double %22, double 0xBC91A62633145C00, double %23)
  %25 = fmul double %22, 0x3C91A62633145C00
  %26 = fneg double %25
  %27 = tail call double @llvm.fma.f64(double %22, double 0x3C91A62633145C00, double %26)
  %28 = fsub double %23, %25
  %29 = fsub double %23, %28
  %30 = fsub double %29, %25
  %31 = fsub double %28, %24
  %32 = fadd double %31, %30
  %33 = fsub double %32, %27
  %34 = tail call double @llvm.fma.f64(double %22, double 0xB97B839A252049C0, double %33)
  %35 = fadd double %24, %34
  %36 = fsub double %35, %24
  %37 = fsub double %34, %36
  %38 = fptosi double %22 to i32
  br label %115

39:                                               ; preds = %14
  %40 = tail call double @llvm.amdgcn.trig.preop.f64(double %18, i32 0)
  %41 = tail call double @llvm.amdgcn.trig.preop.f64(double %18, i32 1)
  %42 = tail call double @llvm.amdgcn.trig.preop.f64(double %18, i32 2)
  %43 = fcmp oge double %18, 0x7B00000000000000
  %44 = tail call double @llvm.amdgcn.ldexp.f64(double %18, i32 -128)
  %45 = select i1 %43, double %44, double %18
  %46 = fmul double %42, %45
  %47 = fneg double %46
  %48 = tail call double @llvm.fma.f64(double %42, double %45, double %47)
  %49 = fmul double %41, %45
  %50 = fneg double %49
  %51 = tail call double @llvm.fma.f64(double %41, double %45, double %50)
  %52 = fmul double %40, %45
  %53 = fneg double %52
  %54 = tail call double @llvm.fma.f64(double %40, double %45, double %53)
  %55 = fadd double %49, %54
  %56 = fsub double %55, %49
  %57 = fsub double %55, %56
  %58 = fsub double %54, %56
  %59 = fsub double %49, %57
  %60 = fadd double %58, %59
  %61 = fadd double %46, %51
  %62 = fsub double %61, %46
  %63 = fsub double %61, %62
  %64 = fsub double %51, %62
  %65 = fsub double %46, %63
  %66 = fadd double %64, %65
  %67 = fadd double %61, %60
  %68 = fsub double %67, %61
  %69 = fsub double %67, %68
  %70 = fsub double %60, %68
  %71 = fsub double %61, %69
  %72 = fadd double %70, %71
  %73 = fadd double %66, %72
  %74 = fadd double %48, %73
  %75 = fadd double %52, %55
  %76 = fsub double %75, %52
  %77 = fsub double %55, %76
  %78 = fadd double %77, %67
  %79 = fsub double %78, %77
  %80 = fsub double %67, %79
  %81 = fadd double %80, %74
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %75, i32 -2)
  %83 = tail call double @llvm.amdgcn.fract.f64(double %82)
  %84 = tail call i1 @llvm.amdgcn.class.f64(double %82, i32 516)
  %85 = select i1 %84, double 0.000000e+00, double %83
  %86 = tail call double @llvm.amdgcn.ldexp.f64(double %85, i32 2)
  %87 = fadd double %86, %78
  %88 = fcmp olt double %87, 0.000000e+00
  %89 = select i1 %88, double 4.000000e+00, double 0.000000e+00
  %90 = fadd double %86, %89
  %91 = fadd double %78, %90
  %92 = fptosi double %91 to i32
  %93 = sitofp i32 %92 to double
  %94 = fsub double %90, %93
  %95 = fadd double %78, %94
  %96 = fsub double %95, %94
  %97 = fsub double %78, %96
  %98 = fadd double %81, %97
  %99 = fcmp oge double %95, 5.000000e-01
  %100 = zext i1 %99 to i32
  %101 = add nsw i32 %100, %92
  %102 = select i1 %99, double 1.000000e+00, double 0.000000e+00
  %103 = fsub double %95, %102
  %104 = fadd double %103, %98
  %105 = fsub double %104, %103
  %106 = fsub double %98, %105
  %107 = fmul double %104, 0x3FF921FB54442D18
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %104, double 0x3FF921FB54442D18, double %108)
  %110 = tail call double @llvm.fma.f64(double %104, double 0x3C91A62633145C07, double %109)
  %111 = tail call double @llvm.fma.f64(double %106, double 0x3FF921FB54442D18, double %110)
  %112 = fadd double %107, %111
  %113 = fsub double %112, %107
  %114 = fsub double %111, %113
  br label %115

115:                                              ; preds = %20, %39
  %116 = phi double [ %37, %20 ], [ %114, %39 ]
  %117 = phi double [ %35, %20 ], [ %112, %39 ]
  %118 = phi i32 [ %38, %20 ], [ %101, %39 ]
  %119 = fmul double %117, %117
  %120 = fmul double %119, 5.000000e-01
  %121 = fsub double 1.000000e+00, %120
  %122 = fsub double 1.000000e+00, %121
  %123 = fsub double %122, %120
  %124 = fmul double %119, %119
  %125 = tail call double @llvm.fma.f64(double %119, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %126 = tail call double @llvm.fma.f64(double %119, double %125, double 0xBE927E4FA17F65F6)
  %127 = tail call double @llvm.fma.f64(double %119, double %126, double 0x3EFA01A019F4EC90)
  %128 = tail call double @llvm.fma.f64(double %119, double %127, double 0xBF56C16C16C16967)
  %129 = tail call double @llvm.fma.f64(double %119, double %128, double 0x3FA5555555555555)
  %130 = fneg double %116
  %131 = tail call double @llvm.fma.f64(double %117, double %130, double %123)
  %132 = tail call double @llvm.fma.f64(double %124, double %129, double %131)
  %133 = fadd double %121, %132
  %134 = tail call double @llvm.fma.f64(double %119, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %135 = tail call double @llvm.fma.f64(double %119, double %134, double 0x3EC71DE3796CDE01)
  %136 = tail call double @llvm.fma.f64(double %119, double %135, double 0xBF2A01A019E83E5C)
  %137 = tail call double @llvm.fma.f64(double %119, double %136, double 0x3F81111111110BB3)
  %138 = fneg double %119
  %139 = fmul double %117, %138
  %140 = fmul double %116, 5.000000e-01
  %141 = tail call double @llvm.fma.f64(double %139, double %137, double %140)
  %142 = tail call double @llvm.fma.f64(double %119, double %141, double %130)
  %143 = tail call double @llvm.fma.f64(double %139, double 0xBFC5555555555555, double %142)
  %144 = fsub double %117, %143
  %145 = fneg double %144
  %146 = and i32 %118, 1
  %147 = icmp eq i32 %146, 0
  %148 = select i1 %147, double %133, double %145
  %149 = bitcast double %148 to <2 x i32>
  %150 = shl i32 %118, 30
  %151 = and i32 %150, -2147483648
  %152 = extractelement <2 x i32> %149, i64 1
  %153 = xor i32 %152, %151
  %154 = insertelement <2 x i32> %149, i32 %153, i64 1
  %155 = tail call i1 @llvm.amdgcn.class.f64(double %18, i32 504)
  %156 = select i1 %155, <2 x i32> %154, <2 x i32> <i32 0, i32 2146959360>
  %157 = getelementptr inbounds double, double addrspace(1)* %1, i64 %15
  %158 = bitcast double addrspace(1)* %157 to <2 x i32> addrspace(1)*
  store <2 x i32> %156, <2 x i32> addrspace(1)* %158, align 8, !tbaa !7
  br label %159

159:                                              ; preds = %115, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
