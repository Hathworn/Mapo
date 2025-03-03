; ModuleID = '../data/hip_kernels/1239/2/main.cu'
source_filename = "../data/hip_kernels/1239/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15stencil_no_syncPiS_E4temp = internal unnamed_addr addrspace(3) global [1030 x i32] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15stencil_no_syncPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = add nuw nsw i32 %3, 3
  %13 = add nsw i32 %11, 3
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %12
  store i32 %16, i32 addrspace(3)* %17, align 4, !tbaa !7
  %18 = icmp ult i32 %3, 3
  br i1 %18, label %23, label %19

19:                                               ; preds = %2
  %20 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %3
  %21 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %22 = sext i32 %11 to i64
  br label %34

23:                                               ; preds = %2
  %24 = sext i32 %11 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %3
  store i32 %26, i32 addrspace(3)* %27, align 4, !tbaa !7
  %28 = add nsw i32 %11, 1027
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = add nuw nsw i32 %3, 1027
  %33 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %32
  store i32 %31, i32 addrspace(3)* %33, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %19, %23
  %35 = phi i64 [ %22, %19 ], [ %24, %23 ]
  %36 = phi i32 [ %21, %19 ], [ %26, %23 ]
  %37 = add nuw nsw i32 %3, 1
  %38 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !7
  %40 = add nsw i32 %39, %36
  %41 = add nuw nsw i32 %3, 2
  %42 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !7
  %44 = add nsw i32 %43, %40
  %45 = add nsw i32 %16, %44
  %46 = add nuw nsw i32 %3, 4
  %47 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %46
  %48 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !7
  %49 = add nsw i32 %48, %45
  %50 = add nuw nsw i32 %3, 5
  %51 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %50
  %52 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !7
  %53 = add nsw i32 %52, %49
  %54 = add nuw nsw i32 %3, 6
  %55 = getelementptr inbounds [1030 x i32], [1030 x i32] addrspace(3)* @_ZZ15stencil_no_syncPiS_E4temp, i32 0, i32 %54
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !7
  %57 = add nsw i32 %56, %53
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  store i32 %57, i32 addrspace(1)* %58, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
