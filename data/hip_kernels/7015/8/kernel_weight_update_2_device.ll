; ModuleID = '../data/hip_kernels/7015/8/main.cu'
source_filename = "../data/hip_kernels/7015/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22kernel_weight_update_2iPiS_S_PfS0_S0_S0_S0_S0_ff(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readnone %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture %9, float %10, float %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %13
  %22 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %27 = sext i32 %0 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = add nsw i32 %0, 1
  %31 = sext i32 %30 to i64
  %32 = icmp slt i32 %21, %29
  br i1 %32, label %33, label %74

33:                                               ; preds = %12
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !6
  %38 = add nsw i32 %37, %21
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %5, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11, !amdgpu.noclobber !6
  %42 = add nsw i32 %35, -1
  %43 = icmp slt i32 %26, %42
  br i1 %43, label %44, label %74

44:                                               ; preds = %33
  %45 = mul nsw i32 %42, %21
  %46 = add i32 %45, %26
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %27
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = add i32 %46, %48
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = add nsw i32 %51, %26
  br label %53

53:                                               ; preds = %44, %53
  %54 = phi i32 [ %61, %53 ], [ %52, %44 ]
  %55 = phi i32 [ %72, %53 ], [ %26, %44 ]
  %56 = phi i32 [ %71, %53 ], [ %49, %44 ]
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11
  %60 = fmul contract float %41, %59
  %61 = add nsw i32 %54, %25
  %62 = sext i32 %56 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %9, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !11
  %65 = fmul contract float %64, %11
  %66 = fmul contract float %60, %10
  %67 = fsub contract float %65, %66
  store float %67, float addrspace(1)* %63, align 4, !tbaa !11
  %68 = getelementptr inbounds float, float addrspace(1)* %8, i64 %62
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !11
  %70 = fadd contract float %69, %67
  store float %70, float addrspace(1)* %68, align 4, !tbaa !11
  %71 = add nsw i32 %56, %25
  %72 = add nuw nsw i32 %55, %25
  %73 = icmp slt i32 %72, %42
  br i1 %73, label %53, label %74, !llvm.loop !13

74:                                               ; preds = %53, %33, %12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
