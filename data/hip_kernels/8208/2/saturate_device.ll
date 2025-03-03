; ModuleID = '../data/hip_kernels/8208/2/main.cu'
source_filename = "../data/hip_kernels/8208/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8saturatePjj(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = zext i32 %3 to i64
  %10 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %9
  %11 = load i32, i32 addrspace(1)* %10, align 4, !tbaa !7
  %12 = icmp ugt i32 %11, 127
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  store i32 127, i32 addrspace(1)* %10, align 4, !tbaa !7
  br label %14

14:                                               ; preds = %2, %13
  %15 = add nuw nsw i32 %3, %8
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7
  %19 = icmp ugt i32 %18, 127
  br i1 %19, label %20, label %21

20:                                               ; preds = %14
  store i32 127, i32 addrspace(1)* %17, align 4, !tbaa !7
  br label %21

21:                                               ; preds = %20, %14
  %22 = shl nuw nsw i32 %8, 1
  %23 = add nuw nsw i32 %22, %3
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7
  %27 = icmp ugt i32 %26, 127
  br i1 %27, label %28, label %29

28:                                               ; preds = %21
  store i32 127, i32 addrspace(1)* %25, align 4, !tbaa !7
  br label %29

29:                                               ; preds = %28, %21
  %30 = mul nuw nsw i32 %8, 3
  %31 = add nuw nsw i32 %30, %3
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7
  %35 = icmp ugt i32 %34, 127
  br i1 %35, label %36, label %37

36:                                               ; preds = %29
  store i32 127, i32 addrspace(1)* %33, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %36, %29
  %38 = shl nuw nsw i32 %8, 2
  %39 = add nuw nsw i32 %38, %3
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7
  %43 = icmp ugt i32 %42, 127
  br i1 %43, label %44, label %45

44:                                               ; preds = %37
  store i32 127, i32 addrspace(1)* %41, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %44, %37
  %46 = mul nuw nsw i32 %8, 5
  %47 = add nuw nsw i32 %46, %3
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7
  %51 = icmp ugt i32 %50, 127
  br i1 %51, label %52, label %53

52:                                               ; preds = %45
  store i32 127, i32 addrspace(1)* %49, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %52, %45
  %54 = mul nuw nsw i32 %8, 6
  %55 = add nuw nsw i32 %54, %3
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = icmp ugt i32 %58, 127
  br i1 %59, label %60, label %61

60:                                               ; preds = %53
  store i32 127, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %61

61:                                               ; preds = %60, %53
  %62 = mul nuw nsw i32 %8, 7
  %63 = add nuw nsw i32 %62, %3
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %64
  %66 = load i32, i32 addrspace(1)* %65, align 4, !tbaa !7
  %67 = icmp ugt i32 %66, 127
  br i1 %67, label %68, label %69

68:                                               ; preds = %61
  store i32 127, i32 addrspace(1)* %65, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %68, %61
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
