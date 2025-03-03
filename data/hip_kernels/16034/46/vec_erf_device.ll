; ModuleID = '../data/hip_kernels/16034/46/main.cu'
source_filename = "../data/hip_kernels/16034/46/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_erf(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %104

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fcmp olt double %36, 1.000000e+00
  br i1 %37, label %38, label %52

38:                                               ; preds = %32
  %39 = fmul double %35, %35
  %40 = tail call double @llvm.fma.f64(double %39, double 0xBE0AB15C51D2EBEB, double 0x3E4D6E3DDFEB1F49)
  %41 = tail call double @llvm.fma.f64(double %39, double %40, double 0xBE85BFE763844720)
  %42 = tail call double @llvm.fma.f64(double %39, double %41, double 0x3EBB97E44280CFB9)
  %43 = tail call double @llvm.fma.f64(double %39, double %42, double 0xBEEF4CA204C771C5)
  %44 = tail call double @llvm.fma.f64(double %39, double %43, double 0x3F1F9A2B75531772)
  %45 = tail call double @llvm.fma.f64(double %39, double %44, double 0xBF4C02DB0149D904)
  %46 = tail call double @llvm.fma.f64(double %39, double %45, double 0x3F7565BCCF7E2856)
  %47 = tail call double @llvm.fma.f64(double %39, double %46, double 0xBF9B82CE311EE09B)
  %48 = tail call double @llvm.fma.f64(double %39, double %47, double 0x3FBCE2F21A0408D1)
  %49 = tail call double @llvm.fma.f64(double %39, double %48, double 0xBFD812746B0379B2)
  %50 = tail call double @llvm.fma.f64(double %39, double %49, double 0x3FC06EBA8214DB68)
  %51 = tail call double @llvm.fma.f64(double %36, double %50, double %36)
  br label %100

52:                                               ; preds = %32
  %53 = tail call double @llvm.fma.f64(double %36, double 0x3C598D37C14B24BE, double 0xBCC145A3502A41CD)
  %54 = tail call double @llvm.fma.f64(double %36, double %53, double 0x3D162DEED735F9EC)
  %55 = tail call double @llvm.fma.f64(double %36, double %54, double 0xBD61FFE55552CA22)
  %56 = tail call double @llvm.fma.f64(double %36, double %55, double 0x3DA4B9BA7074B644)
  %57 = tail call double @llvm.fma.f64(double %36, double %56, double 0xBDE20345A78CE240)
  %58 = tail call double @llvm.fma.f64(double %36, double %57, double 0x3E188B7A0CEFDDD8)
  %59 = tail call double @llvm.fma.f64(double %36, double %58, double 0xBE4ADED48C94B617)
  %60 = tail call double @llvm.fma.f64(double %36, double %59, double 0x3E7803AA312306D0)
  %61 = tail call double @llvm.fma.f64(double %36, double %60, double 0xBEA1B0106F4C5A9B)
  %62 = tail call double @llvm.fma.f64(double %36, double %61, double 0x3EC58C0E7CFD79AE)
  %63 = tail call double @llvm.fma.f64(double %36, double %62, double 0xBEE59E386410FDF7)
  %64 = tail call double @llvm.fma.f64(double %36, double %63, double 0x3F0192FC1F9B1786)
  %65 = tail call double @llvm.fma.f64(double %36, double %64, double 0xBF162CF3F4634B2E)
  %66 = tail call double @llvm.fma.f64(double %36, double %65, double 0x3F2314DFB42F7E4B)
  %67 = tail call double @llvm.fma.f64(double %36, double %66, double 0xBF12CB68C047288A)
  %68 = tail call double @llvm.fma.f64(double %36, double %67, double 0xBF4038FF7BBCCE25)
  %69 = tail call double @llvm.fma.f64(double %36, double %68, double 0x3F5A9466AE1BABAE)
  %70 = tail call double @llvm.fma.f64(double %36, double %69, double 0xBF258BE1E65A6063)
  %71 = tail call double @llvm.fma.f64(double %36, double %70, double 0xBF939BC16738EE3A)
  %72 = tail call double @llvm.fma.f64(double %36, double %71, double 0x3FBA4FBC28146B69)
  %73 = tail call double @llvm.fma.f64(double %36, double %72, double 0x3FE45F2DA69750C4)
  %74 = tail call double @llvm.fma.f64(double %36, double %73, double 0x3FC06EBB919FCCA8)
  %75 = tail call double @llvm.fma.f64(double %36, double %74, double %36)
  %76 = fneg double %75
  %77 = fmul double %75, 0xBFF71547652B82FE
  %78 = tail call double @llvm.rint.f64(double %77)
  %79 = fneg double %78
  %80 = tail call double @llvm.fma.f64(double %79, double 0x3FE62E42FEFA39EF, double %76)
  %81 = tail call double @llvm.fma.f64(double %79, double 0x3C7ABC9E3B39803F, double %80)
  %82 = tail call double @llvm.fma.f64(double %81, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %83 = tail call double @llvm.fma.f64(double %81, double %82, double 0x3EC71DEE623FDE64)
  %84 = tail call double @llvm.fma.f64(double %81, double %83, double 0x3EFA01997C89E6B0)
  %85 = tail call double @llvm.fma.f64(double %81, double %84, double 0x3F2A01A014761F6E)
  %86 = tail call double @llvm.fma.f64(double %81, double %85, double 0x3F56C16C1852B7B0)
  %87 = tail call double @llvm.fma.f64(double %81, double %86, double 0x3F81111111122322)
  %88 = tail call double @llvm.fma.f64(double %81, double %87, double 0x3FA55555555502A1)
  %89 = tail call double @llvm.fma.f64(double %81, double %88, double 0x3FC5555555555511)
  %90 = tail call double @llvm.fma.f64(double %81, double %89, double 0x3FE000000000000B)
  %91 = tail call double @llvm.fma.f64(double %81, double %90, double 1.000000e+00)
  %92 = tail call double @llvm.fma.f64(double %81, double %91, double 1.000000e+00)
  %93 = fptosi double %78 to i32
  %94 = tail call double @llvm.amdgcn.ldexp.f64(double %92, i32 %93)
  %95 = fcmp olt double %75, -1.024000e+03
  %96 = fcmp ogt double %75, 1.075000e+03
  %97 = fsub double 1.000000e+00, %94
  %98 = select i1 %95, double 0xFFF0000000000000, double %97
  %99 = select i1 %96, double 1.000000e+00, double %98
  br label %100

100:                                              ; preds = %38, %52
  %101 = phi double [ %51, %38 ], [ %99, %52 ]
  %102 = tail call double @llvm.copysign.f64(double %101, double %35)
  %103 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %102, double addrspace(1)* %103, align 8, !tbaa !16
  br label %104

104:                                              ; preds = %100, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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
