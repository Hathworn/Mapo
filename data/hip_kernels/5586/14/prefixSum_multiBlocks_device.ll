; ModuleID = '../data/hip_kernels/5586/14/main.cu'
source_filename = "../data/hip_kernels/5586/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@DSM = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21prefixSum_multiBlocksPfiS_S_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %1
  br i1 %14, label %15, label %67

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %12
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  %20 = shl nuw nsw i32 %12, 1
  %21 = add nuw nsw i32 %20, 2
  br label %26

22:                                               ; preds = %38
  %23 = icmp ult i16 %9, 4
  br i1 %23, label %41, label %24

24:                                               ; preds = %22
  %25 = lshr i32 %10, 2
  br label %43

26:                                               ; preds = %15, %38
  %27 = phi i32 [ 1, %15 ], [ %39, %38 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = mul i32 %27, %21
  %29 = add i32 %28, -1
  %30 = icmp ult i32 %29, %10
  br i1 %30, label %31, label %38

31:                                               ; preds = %26
  %32 = sub nsw i32 %29, %27
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %32
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !7
  %35 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %29
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %37 = fadd contract float %34, %36
  store float %37, float addrspace(3)* %35, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %31, %26
  %39 = shl nsw i32 %27, 1
  %40 = icmp ugt i32 %39, %10
  br i1 %40, label %22, label %26, !llvm.loop !11

41:                                               ; preds = %55, %22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp eq i32 %12, 0
  br i1 %42, label %58, label %64

43:                                               ; preds = %24, %55
  %44 = phi i32 [ %25, %24 ], [ %56, %55 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = mul nuw nsw i32 %44, %21
  %46 = add nsw i32 %45, -1
  %47 = add nsw i32 %46, %44
  %48 = icmp ult i32 %47, %10
  br i1 %48, label %49, label %55

49:                                               ; preds = %43
  %50 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %46
  %51 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %52 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %47
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %54 = fadd contract float %51, %53
  store float %54, float addrspace(3)* %52, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %49, %43
  %56 = lshr i32 %44, 1
  %57 = icmp ult i32 %44, 2
  br i1 %57, label %41, label %43, !llvm.loop !13

58:                                               ; preds = %41
  %59 = add nsw i32 %10, -1
  %60 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %59
  %61 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %62 = zext i32 %5 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  store float %61, float addrspace(1)* %63, align 4, !tbaa !7
  br label %64

64:                                               ; preds = %58, %41
  %65 = load float, float addrspace(3)* %19, align 4, !tbaa !7
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  store float %65, float addrspace(1)* %66, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %64, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
