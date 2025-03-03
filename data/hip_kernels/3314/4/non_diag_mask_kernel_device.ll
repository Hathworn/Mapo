; ModuleID = '../data/hip_kernels/3314/4/main.cu'
source_filename = "../data/hip_kernels/3314/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20non_diag_mask_kernelPKlS0_Pbllll(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2, i64 %3, i64 %4, i64 %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = zext i32 %16 to i64
  %18 = icmp slt i64 %17, %6
  br i1 %18, label %19, label %59

19:                                               ; preds = %7
  %20 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %17
  %21 = load i64, i64 addrspace(1)* %20, align 8, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %17
  %23 = load i64, i64 addrspace(1)* %22, align 8, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp slt i64 %4, 0
  %25 = add nsw i64 %21, %4
  br i1 %24, label %26, label %43

26:                                               ; preds = %19
  %27 = icmp slt i64 %25, 0
  br i1 %27, label %56, label %28

28:                                               ; preds = %26
  %29 = icmp slt i64 %25, %3
  br i1 %29, label %32, label %30

30:                                               ; preds = %28
  %31 = add nsw i64 %17, %5
  br label %56

32:                                               ; preds = %28
  %33 = icmp sgt i64 %25, %23
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  %35 = add nsw i64 %21, %17
  %36 = add nsw i64 %35, %4
  br label %56

37:                                               ; preds = %32
  %38 = icmp slt i64 %25, %23
  br i1 %38, label %39, label %59

39:                                               ; preds = %37
  %40 = add nsw i64 %21, %17
  %41 = add i64 %40, 1
  %42 = add i64 %41, %4
  br label %56

43:                                               ; preds = %19
  %44 = icmp slt i64 %25, %3
  br i1 %44, label %47, label %45

45:                                               ; preds = %43
  %46 = add nsw i64 %17, %5
  br label %56

47:                                               ; preds = %43
  %48 = icmp sgt i64 %25, %23
  br i1 %48, label %49, label %51

49:                                               ; preds = %47
  %50 = add nsw i64 %21, %17
  br label %56

51:                                               ; preds = %47
  %52 = icmp slt i64 %25, %23
  br i1 %52, label %53, label %59

53:                                               ; preds = %51
  %54 = add nsw i64 %21, %17
  %55 = add nsw i64 %54, 1
  br label %56

56:                                               ; preds = %26, %45, %53, %49, %34, %39, %30
  %57 = phi i64 [ %31, %30 ], [ %42, %39 ], [ %36, %34 ], [ %50, %49 ], [ %55, %53 ], [ %46, %45 ], [ %17, %26 ]
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %57
  store i8 1, i8 addrspace(1)* %58, align 1, !tbaa !11
  br label %59

59:                                               ; preds = %56, %37, %51, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"bool", !9, i64 0}
