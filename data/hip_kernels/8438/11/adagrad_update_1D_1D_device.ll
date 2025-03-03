; ModuleID = '../data/hip_kernels/8438/11/main.cu'
source_filename = "../data/hip_kernels/8438/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20adagrad_update_1D_1DPfS_S_ffi(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float %3, float %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = udiv i32 %15, %12
  %20 = mul i32 %19, %12
  %21 = icmp ugt i32 %15, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %12
  %25 = icmp slt i32 %18, %5
  br i1 %25, label %26, label %79

26:                                               ; preds = %6
  %27 = fneg contract float %3
  br label %28

28:                                               ; preds = %26, %39
  %29 = phi i32 [ %18, %26 ], [ %77, %39 ]
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %33 = fcmp contract ogt float %32, %3
  %34 = select i1 %33, float %3, float %32
  %35 = fcmp contract olt float %34, %27
  %36 = select i1 %35, float %27, float %34
  %37 = or i1 %33, %35
  br i1 %37, label %38, label %39

38:                                               ; preds = %28
  store float %36, float addrspace(1)* %31, align 4, !tbaa !16
  br label %39

39:                                               ; preds = %28, %38
  %40 = fmul contract float %36, %36
  %41 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !16
  %43 = fadd contract float %42, %40
  store float %43, float addrspace(1)* %41, align 4, !tbaa !16
  %44 = load float, float addrspace(1)* %31, align 4, !tbaa !16
  %45 = fmul contract float %44, %4
  %46 = fpext float %45 to double
  %47 = fpext float %43 to double
  %48 = fadd contract double %47, 1.000000e-08
  %49 = fcmp olt double %48, 0x1000000000000000
  %50 = select i1 %49, double 0x4FF0000000000000, double 1.000000e+00
  %51 = fmul double %48, %50
  %52 = tail call double @llvm.amdgcn.rsq.f64(double %51)
  %53 = fmul double %51, %52
  %54 = fmul double %52, 5.000000e-01
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %55, double %53, double 5.000000e-01)
  %57 = tail call double @llvm.fma.f64(double %54, double %56, double %54)
  %58 = tail call double @llvm.fma.f64(double %53, double %56, double %53)
  %59 = fneg double %58
  %60 = tail call double @llvm.fma.f64(double %59, double %58, double %51)
  %61 = tail call double @llvm.fma.f64(double %60, double %57, double %58)
  %62 = fneg double %61
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double %51)
  %64 = tail call double @llvm.fma.f64(double %63, double %57, double %61)
  %65 = select i1 %49, double 0x37F0000000000000, double 1.000000e+00
  %66 = fmul double %65, %64
  %67 = fcmp oeq double %51, 0.000000e+00
  %68 = fcmp oeq double %51, 0x7FF0000000000000
  %69 = or i1 %67, %68
  %70 = select i1 %69, double %51, double %66
  %71 = fdiv contract double %46, %70
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = fpext float %73 to double
  %75 = fsub contract double %74, %71
  %76 = fptrunc double %75 to float
  store float %76, float addrspace(1)* %72, align 4, !tbaa !16
  store float 0.000000e+00, float addrspace(1)* %31, align 4, !tbaa !16
  %77 = add nsw i32 %29, %24
  %78 = icmp slt i32 %77, %5
  br i1 %78, label %28, label %79, !llvm.loop !20

79:                                               ; preds = %39, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
