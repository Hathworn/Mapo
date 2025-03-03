; ModuleID = '../data/hip_kernels/16034/70/main.cu'
source_filename = "../data/hip_kernels/16034/70/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_sinpi(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %80

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fmul double %36, 5.000000e-01
  %38 = tail call double @llvm.amdgcn.fract.f64(double %37)
  %39 = tail call i1 @llvm.amdgcn.class.f64(double %37, i32 516)
  %40 = fmul double %38, 2.000000e+00
  %41 = select i1 %39, double 0.000000e+00, double %40
  %42 = fcmp ogt double %36, 1.000000e+00
  %43 = select i1 %42, double %41, double %36
  %44 = fmul double %43, 2.000000e+00
  %45 = tail call double @llvm.rint.f64(double %44)
  %46 = tail call double @llvm.fma.f64(double %45, double -5.000000e-01, double %43)
  %47 = fptosi double %45 to i32
  %48 = fmul double %46, %46
  %49 = tail call double @llvm.fma.f64(double %48, double 0x3F3E357EF99EB0BB, double 0xBF7E2FE76FDFFD2B)
  %50 = tail call double @llvm.fma.f64(double %48, double %49, double 0x3FB50782D5F14825)
  %51 = tail call double @llvm.fma.f64(double %48, double %50, double 0xBFE32D2CCDFE9424)
  %52 = tail call double @llvm.fma.f64(double %48, double %51, double 0x400466BC67754FFF)
  %53 = tail call double @llvm.fma.f64(double %48, double %52, double 0xC014ABBCE625BE09)
  %54 = fmul double %46, %48
  %55 = fmul double %54, %53
  %56 = tail call double @llvm.fma.f64(double %46, double 0x400921FB54442D18, double %55)
  %57 = tail call double @llvm.fma.f64(double %48, double 0xBF1B167302E21C33, double 0x3F5F9C89CA1D4F33)
  %58 = tail call double @llvm.fma.f64(double %48, double %57, double 0xBF9A6D1E7294BFF9)
  %59 = tail call double @llvm.fma.f64(double %48, double %58, double 0x3FCE1F5067B90B37)
  %60 = tail call double @llvm.fma.f64(double %48, double %59, double 0xBFF55D3C7E3C325B)
  %61 = tail call double @llvm.fma.f64(double %48, double %60, double 0x40103C1F081B5A67)
  %62 = tail call double @llvm.fma.f64(double %48, double %61, double 0xC013BD3CC9BE45DE)
  %63 = tail call double @llvm.fma.f64(double %48, double %62, double 1.000000e+00)
  %64 = and i32 %47, 1
  %65 = icmp eq i32 %64, 0
  %66 = select i1 %65, double %56, double %63
  %67 = bitcast double %66 to <2 x i32>
  %68 = shl i32 %47, 30
  %69 = bitcast double %35 to <2 x i32>
  %70 = extractelement <2 x i32> %69, i64 1
  %71 = xor i32 %68, %70
  %72 = and i32 %71, -2147483648
  %73 = extractelement <2 x i32> %67, i64 1
  %74 = xor i32 %73, %72
  %75 = insertelement <2 x i32> %67, i32 %74, i64 1
  %76 = tail call i1 @llvm.amdgcn.class.f64(double %35, i32 519)
  %77 = select i1 %76, <2 x i32> <i32 0, i32 2146959360>, <2 x i32> %75
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %79 = bitcast double addrspace(1)* %78 to <2 x i32> addrspace(1)*
  store <2 x i32> %77, <2 x i32> addrspace(1)* %79, align 8, !tbaa !16
  br label %80

80:                                               ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
