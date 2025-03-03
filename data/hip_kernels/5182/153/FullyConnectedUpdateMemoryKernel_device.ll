; ModuleID = '../data/hip_kernels/5182/153/main.cu'
source_filename = "../data/hip_kernels/5182/153/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32FullyConnectedUpdateMemoryKernelPfS_S_S_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = udiv i32 %17, %14
  %21 = mul i32 %20, %14
  %22 = icmp ugt i32 %17, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %19
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %27 = add i32 %25, %18
  %28 = mul i32 %27, %14
  %29 = add i32 %28, %26
  %30 = icmp slt i32 %29, %8
  br i1 %30, label %31, label %102

31:                                               ; preds = %9
  %32 = sext i32 %29 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %6, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !16, !amdgpu.noclobber !5
  %35 = fcmp contract une float %34, 0.000000e+00
  br i1 %35, label %102, label %36

36:                                               ; preds = %31
  %37 = icmp sgt i32 %7, 0
  br i1 %37, label %38, label %90

38:                                               ; preds = %36
  %39 = and i32 %7, 1
  %40 = icmp eq i32 %7, 1
  br i1 %40, label %74, label %41

41:                                               ; preds = %38
  %42 = and i32 %7, -2
  br label %43

43:                                               ; preds = %43, %41
  %44 = phi i32 [ %29, %41 ], [ %71, %43 ]
  %45 = phi i32 [ 0, %41 ], [ %72, %43 ]
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = fmul contract float %48, %48
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fdiv contract float %49, %51
  %53 = fsub contract float 1.000000e+00, %52
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fmul contract float %55, %53
  %57 = fadd contract float %56, 1.000000e+00
  store float %57, float addrspace(1)* %54, align 4, !tbaa !16
  %58 = add nsw i32 %44, %8
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = fmul contract float %61, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16
  %65 = fdiv contract float %62, %64
  %66 = fsub contract float 1.000000e+00, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %4, i64 %59
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16
  %69 = fmul contract float %68, %66
  %70 = fadd contract float %69, 1.000000e+00
  store float %70, float addrspace(1)* %67, align 4, !tbaa !16
  %71 = add nsw i32 %58, %8
  %72 = add i32 %45, 2
  %73 = icmp eq i32 %72, %42
  br i1 %73, label %74, label %43, !llvm.loop !20

74:                                               ; preds = %43, %38
  %75 = phi i32 [ %29, %38 ], [ %71, %43 ]
  %76 = icmp eq i32 %39, 0
  br i1 %76, label %90, label %77

77:                                               ; preds = %74
  %78 = sext i32 %75 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = fmul contract float %80, %80
  %82 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16
  %84 = fdiv contract float %81, %83
  %85 = fsub contract float 1.000000e+00, %84
  %86 = getelementptr inbounds float, float addrspace(1)* %4, i64 %78
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fmul contract float %87, %85
  %89 = fadd contract float %88, 1.000000e+00
  store float %89, float addrspace(1)* %86, align 4, !tbaa !16
  br label %90

90:                                               ; preds = %77, %74, %36
  %91 = getelementptr inbounds float, float addrspace(1)* %1, i64 %32
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = fmul contract float %92, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %32
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = fdiv contract float %93, %95
  %97 = fsub contract float 1.000000e+00, %96
  %98 = getelementptr inbounds float, float addrspace(1)* %5, i64 %32
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16
  %100 = fmul contract float %99, %97
  %101 = fadd contract float %100, 1.000000e+00
  store float %101, float addrspace(1)* %98, align 4, !tbaa !16
  br label %102

102:                                              ; preds = %31, %90, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
