; ModuleID = '../data/hip_kernels/121/127/main.cu'
source_filename = "../data/hip_kernels/121/127/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11kSelectRowsPfS_S_iiiE16sourceRowIndices = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11kSelectRowsPfS_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = sub nsw i32 %3, %8
  %11 = tail call i32 @llvm.smin.i32(i32 %10, i32 32)
  %12 = icmp slt i32 %9, %11
  br i1 %12, label %13, label %27

13:                                               ; preds = %6
  %14 = add nsw i32 %8, %9
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = fptosi float %17 to i32
  %19 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11kSelectRowsPfS_S_iiiE16sourceRowIndices, i32 0, i32 %9
  %20 = icmp slt i32 %18, 0
  %21 = select i1 %20, i32 %5, i32 0
  %22 = add nsw i32 %21, %18
  %23 = icmp sgt i32 %22, -1
  %24 = icmp slt i32 %22, %5
  %25 = select i1 %23, i1 %24, i1 false
  %26 = select i1 %25, i32 %22, i32 -1
  store i32 %26, i32 addrspace(3)* %19, align 4
  br label %27

27:                                               ; preds = %13, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp sgt i32 %10, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %27
  %30 = icmp slt i32 %9, %4
  %31 = tail call i32 @llvm.smax.i32(i32 %11, i32 1)
  br label %33

32:                                               ; preds = %42, %27
  ret void

33:                                               ; preds = %29, %42
  %34 = phi i32 [ 0, %29 ], [ %43, %42 ]
  %35 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ11kSelectRowsPfS_S_iiiE16sourceRowIndices, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !10
  br i1 %30, label %37, label %42

37:                                               ; preds = %33
  %38 = add nuw nsw i32 %34, %8
  %39 = icmp eq i32 %36, -1
  %40 = mul nsw i32 %36, %4
  %41 = mul nsw i32 %38, %4
  br i1 %39, label %45, label %52

42:                                               ; preds = %45, %52, %33
  %43 = add nuw nsw i32 %34, 1
  %44 = icmp eq i32 %43, %31
  br i1 %44, label %32, label %33, !llvm.loop !12

45:                                               ; preds = %37, %45
  %46 = phi i32 [ %50, %45 ], [ %9, %37 ]
  %47 = add nsw i32 %46, %41
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float 0x7FF8000000000000, float addrspace(1)* %49, align 4, !tbaa !5
  %50 = add nuw nsw i32 %46, 32
  %51 = icmp slt i32 %50, %4
  br i1 %51, label %45, label %42, !llvm.loop !14

52:                                               ; preds = %37, %52
  %53 = phi i32 [ %61, %52 ], [ %9, %37 ]
  %54 = add nsw i32 %53, %40
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !5
  %58 = add nsw i32 %53, %41
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  store float %57, float addrspace(1)* %60, align 4, !tbaa !5
  %61 = add nuw nsw i32 %53, 32
  %62 = icmp slt i32 %61, %4
  br i1 %62, label %52, label %42, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
