; ModuleID = '../data/hip_kernels/5586/13/main.cu'
source_filename = "../data/hip_kernels/5586/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@DSM = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z21prefixSum_UniqueBlockPfiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %1
  br i1 %13, label %14, label %58

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %11
  store float %17, float addrspace(3)* %18, align 4, !tbaa !7
  %19 = shl nuw nsw i32 %11, 1
  %20 = add nuw nsw i32 %19, 2
  br label %25

21:                                               ; preds = %37
  %22 = icmp ult i16 %8, 4
  br i1 %22, label %40, label %23

23:                                               ; preds = %21
  %24 = lshr i32 %9, 2
  br label %43

25:                                               ; preds = %14, %37
  %26 = phi i32 [ 1, %14 ], [ %38, %37 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = mul i32 %26, %20
  %28 = add i32 %27, -1
  %29 = icmp ult i32 %28, %9
  br i1 %29, label %30, label %37

30:                                               ; preds = %25
  %31 = sub nsw i32 %28, %26
  %32 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %31
  %33 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %34 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @DSM, i32 0, i32 %28
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %36 = fadd contract float %33, %35
  store float %36, float addrspace(3)* %34, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %30, %25
  %38 = shl nsw i32 %26, 1
  %39 = icmp ugt i32 %38, %9
  br i1 %39, label %21, label %25, !llvm.loop !11

40:                                               ; preds = %55, %21
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = load float, float addrspace(3)* %18, align 4, !tbaa !7
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  store float %41, float addrspace(1)* %42, align 4, !tbaa !7
  br label %58

43:                                               ; preds = %23, %55
  %44 = phi i32 [ %24, %23 ], [ %56, %55 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = mul nuw nsw i32 %44, %20
  %46 = add nsw i32 %45, -1
  %47 = add nsw i32 %46, %44
  %48 = icmp ult i32 %47, %9
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
  br i1 %57, label %40, label %43, !llvm.loop !13

58:                                               ; preds = %40, %3
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
