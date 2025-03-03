; ModuleID = '../data/hip_kernels/5182/318/main.cu'
source_filename = "../data/hip_kernels/5182/318/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36DrawMaskedColorKernelNearestNeighborPfiiiiS_iiiifff(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, float %10, float %11, float %12) local_unnamed_addr #0 {
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !6
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = udiv i32 %21, %18
  %25 = mul i32 %24, %18
  %26 = icmp ugt i32 %21, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %23
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %31 = add i32 %29, %22
  %32 = mul i32 %31, %18
  %33 = add i32 %32, %30
  %34 = mul nsw i32 %9, %8
  %35 = sdiv i32 %33, %34
  %36 = mul nsw i32 %35, %34
  %37 = sub nsw i32 %33, %36
  %38 = sdiv i32 %37, %8
  %39 = mul nsw i32 %38, %8
  %40 = sub nsw i32 %37, %39
  %41 = icmp slt i32 %35, 3
  br i1 %41, label %42, label %85

42:                                               ; preds = %13
  switch i32 %35, label %45 [
    i32 0, label %43
    i32 2, label %44
  ]

43:                                               ; preds = %42
  br label %45

44:                                               ; preds = %42
  br label %45

45:                                               ; preds = %42, %44, %43
  %46 = phi i32 [ %35, %42 ], [ 0, %44 ], [ 2, %43 ]
  %47 = add nsw i32 %40, %3
  %48 = icmp slt i32 %47, %1
  %49 = icmp sgt i32 %47, -1
  %50 = and i1 %48, %49
  br i1 %50, label %51, label %85

51:                                               ; preds = %45
  %52 = add nsw i32 %38, %4
  %53 = icmp slt i32 %52, %2
  %54 = icmp sgt i32 %52, -1
  %55 = and i1 %53, %54
  br i1 %55, label %56, label %85

56:                                               ; preds = %51
  %57 = mul nsw i32 %40, %6
  %58 = sdiv i32 %57, %8
  %59 = mul nsw i32 %38, %7
  %60 = sdiv i32 %59, %9
  %61 = mul i32 %7, 3
  %62 = add i32 %60, %61
  %63 = mul i32 %62, %6
  %64 = add i32 %63, %58
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !5
  %68 = fcmp contract ogt float %67, 0.000000e+00
  br i1 %68, label %69, label %85

69:                                               ; preds = %56
  %70 = mul i32 %46, %2
  %71 = add i32 %70, %52
  %72 = mul i32 %71, %1
  %73 = add i32 %72, %47
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !5
  %77 = fsub contract float 1.000000e+00, %67
  %78 = fmul contract float %77, %76
  store float %78, float addrspace(1)* %75, align 4, !tbaa !16
  switch i32 %35, label %80 [
    i32 0, label %81
    i32 1, label %79
  ]

79:                                               ; preds = %69
  br label %81

80:                                               ; preds = %69
  br label %81

81:                                               ; preds = %69, %80, %79
  %82 = phi float [ %11, %79 ], [ %12, %80 ], [ %10, %69 ]
  %83 = fmul contract float %67, %82
  %84 = fadd contract float %83, %78
  store float %84, float addrspace(1)* %75, align 4, !tbaa !16
  br label %85

85:                                               ; preds = %81, %45, %51, %56, %13
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
