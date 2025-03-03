; ModuleID = '../data/hip_kernels/12544/51/main.cu'
source_filename = "../data/hip_kernels/12544/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @exp_double(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = mul i32 %6, %11
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %26

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %27

26:                                               ; preds = %180, %5
  ret void

27:                                               ; preds = %19, %180
  %28 = phi i32 [ %17, %19 ], [ %181, %180 ]
  %29 = icmp slt i32 %28, %1
  br i1 %29, label %180, label %30

30:                                               ; preds = %27
  %31 = srem i32 %28, %3
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %180

33:                                               ; preds = %30
  %34 = sext i32 %28 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16
  %37 = tail call double @llvm.fabs.f64(double %36)
  %38 = fcmp olt double %37, 0x41D0000000000000
  br i1 %38, label %39, label %58

39:                                               ; preds = %33
  %40 = fmul double %37, 0x3FE45F306DC9C883
  %41 = tail call double @llvm.rint.f64(double %40)
  %42 = tail call double @llvm.fma.f64(double %41, double 0xBFF921FB54442D18, double %37)
  %43 = tail call double @llvm.fma.f64(double %41, double 0xBC91A62633145C00, double %42)
  %44 = fmul double %41, 0x3C91A62633145C00
  %45 = fneg double %44
  %46 = tail call double @llvm.fma.f64(double %41, double 0x3C91A62633145C00, double %45)
  %47 = fsub double %42, %44
  %48 = fsub double %42, %47
  %49 = fsub double %48, %44
  %50 = fsub double %47, %43
  %51 = fadd double %50, %49
  %52 = fsub double %51, %46
  %53 = tail call double @llvm.fma.f64(double %41, double 0xB97B839A252049C0, double %52)
  %54 = fadd double %43, %53
  %55 = fsub double %54, %43
  %56 = fsub double %53, %55
  %57 = fptosi double %41 to i32
  br label %134

58:                                               ; preds = %33
  %59 = tail call double @llvm.amdgcn.trig.preop.f64(double %37, i32 0)
  %60 = tail call double @llvm.amdgcn.trig.preop.f64(double %37, i32 1)
  %61 = tail call double @llvm.amdgcn.trig.preop.f64(double %37, i32 2)
  %62 = fcmp oge double %37, 0x7B00000000000000
  %63 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 -128)
  %64 = select i1 %62, double %63, double %37
  %65 = fmul double %61, %64
  %66 = fneg double %65
  %67 = tail call double @llvm.fma.f64(double %61, double %64, double %66)
  %68 = fmul double %60, %64
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %60, double %64, double %69)
  %71 = fmul double %59, %64
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %59, double %64, double %72)
  %74 = fadd double %68, %73
  %75 = fsub double %74, %68
  %76 = fsub double %74, %75
  %77 = fsub double %73, %75
  %78 = fsub double %68, %76
  %79 = fadd double %77, %78
  %80 = fadd double %65, %70
  %81 = fsub double %80, %65
  %82 = fsub double %80, %81
  %83 = fsub double %70, %81
  %84 = fsub double %65, %82
  %85 = fadd double %83, %84
  %86 = fadd double %80, %79
  %87 = fsub double %86, %80
  %88 = fsub double %86, %87
  %89 = fsub double %79, %87
  %90 = fsub double %80, %88
  %91 = fadd double %89, %90
  %92 = fadd double %85, %91
  %93 = fadd double %67, %92
  %94 = fadd double %71, %74
  %95 = fsub double %94, %71
  %96 = fsub double %74, %95
  %97 = fadd double %96, %86
  %98 = fsub double %97, %96
  %99 = fsub double %86, %98
  %100 = fadd double %99, %93
  %101 = tail call double @llvm.amdgcn.ldexp.f64(double %94, i32 -2)
  %102 = tail call double @llvm.amdgcn.fract.f64(double %101)
  %103 = tail call i1 @llvm.amdgcn.class.f64(double %101, i32 516)
  %104 = select i1 %103, double 0.000000e+00, double %102
  %105 = tail call double @llvm.amdgcn.ldexp.f64(double %104, i32 2)
  %106 = fadd double %105, %97
  %107 = fcmp olt double %106, 0.000000e+00
  %108 = select i1 %107, double 4.000000e+00, double 0.000000e+00
  %109 = fadd double %105, %108
  %110 = fadd double %97, %109
  %111 = fptosi double %110 to i32
  %112 = sitofp i32 %111 to double
  %113 = fsub double %109, %112
  %114 = fadd double %97, %113
  %115 = fsub double %114, %113
  %116 = fsub double %97, %115
  %117 = fadd double %100, %116
  %118 = fcmp oge double %114, 5.000000e-01
  %119 = zext i1 %118 to i32
  %120 = add nsw i32 %119, %111
  %121 = select i1 %118, double 1.000000e+00, double 0.000000e+00
  %122 = fsub double %114, %121
  %123 = fadd double %122, %117
  %124 = fsub double %123, %122
  %125 = fsub double %117, %124
  %126 = fmul double %123, 0x3FF921FB54442D18
  %127 = fneg double %126
  %128 = tail call double @llvm.fma.f64(double %123, double 0x3FF921FB54442D18, double %127)
  %129 = tail call double @llvm.fma.f64(double %123, double 0x3C91A62633145C07, double %128)
  %130 = tail call double @llvm.fma.f64(double %125, double 0x3FF921FB54442D18, double %129)
  %131 = fadd double %126, %130
  %132 = fsub double %131, %126
  %133 = fsub double %130, %132
  br label %134

134:                                              ; preds = %39, %58
  %135 = phi double [ %56, %39 ], [ %133, %58 ]
  %136 = phi double [ %54, %39 ], [ %131, %58 ]
  %137 = phi i32 [ %57, %39 ], [ %120, %58 ]
  %138 = fmul double %136, %136
  %139 = fmul double %138, 5.000000e-01
  %140 = fsub double 1.000000e+00, %139
  %141 = fsub double 1.000000e+00, %140
  %142 = fsub double %141, %139
  %143 = fmul double %138, %138
  %144 = tail call double @llvm.fma.f64(double %138, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %145 = tail call double @llvm.fma.f64(double %138, double %144, double 0xBE927E4FA17F65F6)
  %146 = tail call double @llvm.fma.f64(double %138, double %145, double 0x3EFA01A019F4EC90)
  %147 = tail call double @llvm.fma.f64(double %138, double %146, double 0xBF56C16C16C16967)
  %148 = tail call double @llvm.fma.f64(double %138, double %147, double 0x3FA5555555555555)
  %149 = fneg double %135
  %150 = tail call double @llvm.fma.f64(double %136, double %149, double %142)
  %151 = tail call double @llvm.fma.f64(double %143, double %148, double %150)
  %152 = fadd double %140, %151
  %153 = tail call double @llvm.fma.f64(double %138, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %154 = tail call double @llvm.fma.f64(double %138, double %153, double 0x3EC71DE3796CDE01)
  %155 = tail call double @llvm.fma.f64(double %138, double %154, double 0xBF2A01A019E83E5C)
  %156 = tail call double @llvm.fma.f64(double %138, double %155, double 0x3F81111111110BB3)
  %157 = fneg double %138
  %158 = fmul double %136, %157
  %159 = fmul double %135, 5.000000e-01
  %160 = tail call double @llvm.fma.f64(double %158, double %156, double %159)
  %161 = tail call double @llvm.fma.f64(double %138, double %160, double %149)
  %162 = tail call double @llvm.fma.f64(double %158, double 0xBFC5555555555555, double %161)
  %163 = fsub double %136, %162
  %164 = and i32 %137, 1
  %165 = icmp eq i32 %164, 0
  %166 = select i1 %165, double %163, double %152
  %167 = bitcast double %166 to <2 x i32>
  %168 = shl i32 %137, 30
  %169 = bitcast double %36 to <2 x i32>
  %170 = extractelement <2 x i32> %169, i64 1
  %171 = xor i32 %168, %170
  %172 = and i32 %171, -2147483648
  %173 = extractelement <2 x i32> %167, i64 1
  %174 = xor i32 %173, %172
  %175 = insertelement <2 x i32> %167, i32 %174, i64 1
  %176 = tail call i1 @llvm.amdgcn.class.f64(double %37, i32 504)
  %177 = select i1 %176, <2 x i32> %175, <2 x i32> <i32 0, i32 2146959360>
  %178 = getelementptr inbounds double, double addrspace(1)* %4, i64 %34
  %179 = bitcast double addrspace(1)* %178 to <2 x i32> addrspace(1)*
  store <2 x i32> %177, <2 x i32> addrspace(1)* %179, align 8, !tbaa !16
  br label %180

180:                                              ; preds = %27, %30, %134
  %181 = add i32 %25, %28
  %182 = icmp slt i32 %181, %0
  br i1 %182, label %27, label %26, !llvm.loop !20
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
