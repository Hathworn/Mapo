; ModuleID = '../data/hip_kernels/16034/84/main.cu'
source_filename = "../data/hip_kernels/16034/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_hypot(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
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
  br i1 %32, label %33, label %68

33:                                               ; preds = %4
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16, !amdgpu.noclobber !6
  %39 = tail call double @llvm.fabs.f64(double %36)
  %40 = tail call double @llvm.fabs.f64(double %38)
  %41 = tail call double @llvm.maxnum.f64(double %39, double %40)
  %42 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %41)
  %43 = sub nsw i32 0, %42
  %44 = tail call double @llvm.amdgcn.ldexp.f64(double %39, i32 %43)
  %45 = tail call double @llvm.amdgcn.ldexp.f64(double %40, i32 %43)
  %46 = fmul double %45, %45
  %47 = tail call double @llvm.fma.f64(double %44, double %44, double %46)
  %48 = tail call double @llvm.amdgcn.rsq.f64(double %47)
  %49 = fmul double %47, %48
  %50 = fmul double %48, 5.000000e-01
  %51 = fneg double %50
  %52 = tail call double @llvm.fma.f64(double %51, double %49, double 5.000000e-01)
  %53 = tail call double @llvm.fma.f64(double %50, double %52, double %50)
  %54 = tail call double @llvm.fma.f64(double %49, double %52, double %49)
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %55, double %54, double %47)
  %57 = tail call double @llvm.fma.f64(double %56, double %53, double %54)
  %58 = fcmp oeq double %47, 0.000000e+00
  %59 = select i1 %58, double %47, double %57
  %60 = tail call double @llvm.amdgcn.ldexp.f64(double %59, i32 %42)
  %61 = fcmp uno double %36, %38
  %62 = select i1 %61, double 0x7FF8000000000000, double %60
  %63 = fcmp oeq double %39, 0x7FF0000000000000
  %64 = fcmp oeq double %40, 0x7FF0000000000000
  %65 = or i1 %63, %64
  %66 = select i1 %65, double 0x7FF0000000000000, double %62
  %67 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  store double %66, double addrspace(1)* %67, align 8, !tbaa !16
  br label %68

68:                                               ; preds = %33, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.maxnum.f64(double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #2

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
