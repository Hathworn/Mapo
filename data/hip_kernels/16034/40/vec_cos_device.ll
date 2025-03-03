; ModuleID = '../data/hip_kernels/16034/40/main.cu'
source_filename = "../data/hip_kernels/16034/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_cos(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %177

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp olt double %36, 0x41D0000000000000
  br i1 %37, label %38, label %57

38:                                               ; preds = %32
  %39 = fmul double %36, 0x3FE45F306DC9C883
  %40 = tail call double @llvm.rint.f64(double %39)
  %41 = tail call double @llvm.fma.f64(double %40, double 0xBFF921FB54442D18, double %36)
  %42 = tail call double @llvm.fma.f64(double %40, double 0xBC91A62633145C00, double %41)
  %43 = fmul double %40, 0x3C91A62633145C00
  %44 = fneg double %43
  %45 = tail call double @llvm.fma.f64(double %40, double 0x3C91A62633145C00, double %44)
  %46 = fsub double %41, %43
  %47 = fsub double %41, %46
  %48 = fsub double %47, %43
  %49 = fsub double %46, %42
  %50 = fadd double %49, %48
  %51 = fsub double %50, %45
  %52 = tail call double @llvm.fma.f64(double %40, double 0xB97B839A252049C0, double %51)
  %53 = fadd double %42, %52
  %54 = fsub double %53, %42
  %55 = fsub double %52, %54
  %56 = fptosi double %40 to i32
  br label %133

57:                                               ; preds = %32
  %58 = tail call double @llvm.amdgcn.trig.preop.f64(double %36, i32 0)
  %59 = tail call double @llvm.amdgcn.trig.preop.f64(double %36, i32 1)
  %60 = tail call double @llvm.amdgcn.trig.preop.f64(double %36, i32 2)
  %61 = fcmp oge double %36, 0x7B00000000000000
  %62 = tail call double @llvm.amdgcn.ldexp.f64(double %36, i32 -128)
  %63 = select i1 %61, double %62, double %36
  %64 = fmul double %60, %63
  %65 = fneg double %64
  %66 = tail call double @llvm.fma.f64(double %60, double %63, double %65)
  %67 = fmul double %59, %63
  %68 = fneg double %67
  %69 = tail call double @llvm.fma.f64(double %59, double %63, double %68)
  %70 = fmul double %58, %63
  %71 = fneg double %70
  %72 = tail call double @llvm.fma.f64(double %58, double %63, double %71)
  %73 = fadd double %67, %72
  %74 = fsub double %73, %67
  %75 = fsub double %73, %74
  %76 = fsub double %72, %74
  %77 = fsub double %67, %75
  %78 = fadd double %76, %77
  %79 = fadd double %64, %69
  %80 = fsub double %79, %64
  %81 = fsub double %79, %80
  %82 = fsub double %69, %80
  %83 = fsub double %64, %81
  %84 = fadd double %82, %83
  %85 = fadd double %79, %78
  %86 = fsub double %85, %79
  %87 = fsub double %85, %86
  %88 = fsub double %78, %86
  %89 = fsub double %79, %87
  %90 = fadd double %88, %89
  %91 = fadd double %84, %90
  %92 = fadd double %66, %91
  %93 = fadd double %70, %73
  %94 = fsub double %93, %70
  %95 = fsub double %73, %94
  %96 = fadd double %95, %85
  %97 = fsub double %96, %95
  %98 = fsub double %85, %97
  %99 = fadd double %98, %92
  %100 = tail call double @llvm.amdgcn.ldexp.f64(double %93, i32 -2)
  %101 = tail call double @llvm.amdgcn.fract.f64(double %100)
  %102 = tail call i1 @llvm.amdgcn.class.f64(double %100, i32 516)
  %103 = select i1 %102, double 0.000000e+00, double %101
  %104 = tail call double @llvm.amdgcn.ldexp.f64(double %103, i32 2)
  %105 = fadd double %104, %96
  %106 = fcmp olt double %105, 0.000000e+00
  %107 = select i1 %106, double 4.000000e+00, double 0.000000e+00
  %108 = fadd double %104, %107
  %109 = fadd double %96, %108
  %110 = fptosi double %109 to i32
  %111 = sitofp i32 %110 to double
  %112 = fsub double %108, %111
  %113 = fadd double %96, %112
  %114 = fsub double %113, %112
  %115 = fsub double %96, %114
  %116 = fadd double %99, %115
  %117 = fcmp oge double %113, 5.000000e-01
  %118 = zext i1 %117 to i32
  %119 = add nsw i32 %118, %110
  %120 = select i1 %117, double 1.000000e+00, double 0.000000e+00
  %121 = fsub double %113, %120
  %122 = fadd double %121, %116
  %123 = fsub double %122, %121
  %124 = fsub double %116, %123
  %125 = fmul double %122, 0x3FF921FB54442D18
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %122, double 0x3FF921FB54442D18, double %126)
  %128 = tail call double @llvm.fma.f64(double %122, double 0x3C91A62633145C07, double %127)
  %129 = tail call double @llvm.fma.f64(double %124, double 0x3FF921FB54442D18, double %128)
  %130 = fadd double %125, %129
  %131 = fsub double %130, %125
  %132 = fsub double %129, %131
  br label %133

133:                                              ; preds = %38, %57
  %134 = phi double [ %55, %38 ], [ %132, %57 ]
  %135 = phi double [ %53, %38 ], [ %130, %57 ]
  %136 = phi i32 [ %56, %38 ], [ %119, %57 ]
  %137 = fmul double %135, %135
  %138 = fmul double %137, 5.000000e-01
  %139 = fsub double 1.000000e+00, %138
  %140 = fsub double 1.000000e+00, %139
  %141 = fsub double %140, %138
  %142 = fmul double %137, %137
  %143 = tail call double @llvm.fma.f64(double %137, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %144 = tail call double @llvm.fma.f64(double %137, double %143, double 0xBE927E4FA17F65F6)
  %145 = tail call double @llvm.fma.f64(double %137, double %144, double 0x3EFA01A019F4EC90)
  %146 = tail call double @llvm.fma.f64(double %137, double %145, double 0xBF56C16C16C16967)
  %147 = tail call double @llvm.fma.f64(double %137, double %146, double 0x3FA5555555555555)
  %148 = fneg double %134
  %149 = tail call double @llvm.fma.f64(double %135, double %148, double %141)
  %150 = tail call double @llvm.fma.f64(double %142, double %147, double %149)
  %151 = fadd double %139, %150
  %152 = tail call double @llvm.fma.f64(double %137, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %153 = tail call double @llvm.fma.f64(double %137, double %152, double 0x3EC71DE3796CDE01)
  %154 = tail call double @llvm.fma.f64(double %137, double %153, double 0xBF2A01A019E83E5C)
  %155 = tail call double @llvm.fma.f64(double %137, double %154, double 0x3F81111111110BB3)
  %156 = fneg double %137
  %157 = fmul double %135, %156
  %158 = fmul double %134, 5.000000e-01
  %159 = tail call double @llvm.fma.f64(double %157, double %155, double %158)
  %160 = tail call double @llvm.fma.f64(double %137, double %159, double %148)
  %161 = tail call double @llvm.fma.f64(double %157, double 0xBFC5555555555555, double %160)
  %162 = fsub double %135, %161
  %163 = fneg double %162
  %164 = and i32 %136, 1
  %165 = icmp eq i32 %164, 0
  %166 = select i1 %165, double %151, double %163
  %167 = bitcast double %166 to <2 x i32>
  %168 = shl i32 %136, 30
  %169 = and i32 %168, -2147483648
  %170 = extractelement <2 x i32> %167, i64 1
  %171 = xor i32 %170, %169
  %172 = insertelement <2 x i32> %167, i32 %171, i64 1
  %173 = tail call i1 @llvm.amdgcn.class.f64(double %36, i32 504)
  %174 = select i1 %173, <2 x i32> %172, <2 x i32> <i32 0, i32 2146959360>
  %175 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %176 = bitcast double addrspace(1)* %175 to <2 x i32> addrspace(1)*
  store <2 x i32> %174, <2 x i32> addrspace(1)* %176, align 8, !tbaa !16
  br label %177

177:                                              ; preds = %133, %3
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
