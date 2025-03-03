; ModuleID = '../data/hip_kernels/16034/87/main.cu'
source_filename = "../data/hip_kernels/16034/87/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @vec_remainder(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = udiv i32 %14, %11
  %24 = mul i32 %23, %11
  %25 = icmp ugt i32 %14, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = add i32 %28, %6
  %30 = mul i32 %29, %11
  %31 = add i32 %30, %5
  %32 = icmp slt i32 %31, %0
  br i1 %32, label %33, label %126

33:                                               ; preds = %4
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16, !amdgpu.noclobber !6
  %39 = tail call double @llvm.fabs.f64(double %36)
  %40 = tail call double @llvm.fabs.f64(double %38)
  %41 = fcmp ogt double %39, %40
  br i1 %41, label %42, label %95

42:                                               ; preds = %33
  %43 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %39)
  %44 = tail call double @llvm.amdgcn.frexp.mant.f64(double %39)
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %44, i32 26)
  %46 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %40)
  %47 = add nsw i32 %46, -1
  %48 = tail call double @llvm.amdgcn.frexp.mant.f64(double %40)
  %49 = tail call double @llvm.amdgcn.ldexp.f64(double %48, i32 1)
  %50 = sub i32 %43, %46
  %51 = fdiv double 1.000000e+00, %49
  %52 = icmp sgt i32 %50, 26
  br i1 %52, label %53, label %66

53:                                               ; preds = %42, %53
  %54 = phi double [ %63, %53 ], [ %45, %42 ]
  %55 = phi i32 [ %64, %53 ], [ %50, %42 ]
  %56 = fmul double %51, %54
  %57 = tail call double @llvm.rint.f64(double %56)
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %58, double %49, double %54)
  %60 = fcmp olt double %59, 0.000000e+00
  %61 = select i1 %60, double %49, double -0.000000e+00
  %62 = fadd double %59, %61
  %63 = tail call double @llvm.amdgcn.ldexp.f64(double %62, i32 26)
  %64 = add nsw i32 %55, -26
  %65 = icmp ugt i32 %55, 52
  br i1 %65, label %53, label %66

66:                                               ; preds = %53, %42
  %67 = phi i32 [ %50, %42 ], [ %64, %53 ]
  %68 = phi double [ %45, %42 ], [ %63, %53 ]
  %69 = add nsw i32 %67, -25
  %70 = tail call double @llvm.amdgcn.ldexp.f64(double %68, i32 %69)
  %71 = fmul double %51, %70
  %72 = tail call double @llvm.rint.f64(double %71)
  %73 = fneg double %72
  %74 = tail call double @llvm.fma.f64(double %73, double %49, double %70)
  %75 = fcmp olt double %74, 0.000000e+00
  %76 = select i1 %75, double %49, double -0.000000e+00
  %77 = fadd double %74, %76
  %78 = fptosi double %72 to i32
  %79 = fmul double %77, 2.000000e+00
  %80 = fcmp ogt double %79, %49
  %81 = and i32 %78, 1
  %82 = icmp ne i32 %81, 0
  %83 = xor i1 %75, %82
  %84 = fcmp oeq double %79, %49
  %85 = and i1 %83, %84
  %86 = or i1 %80, %85
  %87 = select i1 %86, double %49, double 0.000000e+00
  %88 = fsub double %77, %87
  %89 = tail call double @llvm.amdgcn.ldexp.f64(double %88, i32 %47)
  %90 = bitcast double %36 to i64
  %91 = and i64 %90, -9223372036854775808
  %92 = bitcast double %89 to i64
  %93 = xor i64 %91, %92
  %94 = bitcast i64 %93 to double
  br label %117

95:                                               ; preds = %33
  %96 = fcmp olt double %40, 0x7FE0000000000000
  %97 = fmul double %39, 2.000000e+00
  %98 = fcmp ogt double %97, %40
  %99 = and i1 %96, %98
  %100 = fmul double %40, 5.000000e-01
  %101 = fcmp ogt double %39, %100
  %102 = or i1 %99, %101
  %103 = bitcast double %36 to <2 x i32>
  %104 = extractelement <2 x i32> %103, i64 1
  %105 = bitcast double %38 to <2 x i32>
  %106 = extractelement <2 x i32> %105, i64 1
  %107 = xor i32 %106, %104
  %108 = ashr i32 %107, 30
  %109 = or i32 %108, 1
  %110 = sitofp i32 %109 to double
  %111 = fneg double %110
  %112 = tail call double @llvm.fma.f64(double %38, double %111, double %36)
  %113 = select i1 %102, double %112, double %36
  %114 = fcmp oeq double %39, %40
  %115 = tail call double @llvm.copysign.f64(double 0.000000e+00, double %36)
  %116 = select i1 %114, double %115, double %113
  br label %117

117:                                              ; preds = %66, %95
  %118 = phi double [ %94, %66 ], [ %116, %95 ]
  %119 = fcmp oeq double %38, 0.000000e+00
  %120 = select i1 %119, double 0x7FF8000000000000, double %118
  %121 = fcmp ord double %38, 0.000000e+00
  %122 = tail call i1 @llvm.amdgcn.class.f64(double %36, i32 504)
  %123 = select i1 %121, i1 %122, i1 false
  %124 = select i1 %123, double %120, double 0x7FF8000000000000
  %125 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  store double %124, double addrspace(1)* %125, align 8, !tbaa !16
  br label %126

126:                                              ; preds = %117, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

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
