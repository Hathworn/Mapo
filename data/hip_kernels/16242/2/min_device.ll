; ModuleID = '../data/hip_kernels/16242/2/main.cu'
source_filename = "../data/hip_kernels/16242/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3minPiS_S_S_mi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i64 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = shl nsw i32 %15, 1
  %17 = add nuw nsw i32 %16, 1
  %18 = sext i32 %16 to i64
  %19 = icmp ult i64 %18, %4
  br i1 %19, label %20, label %76

20:                                               ; preds = %6
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %18
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = icmp eq i32 %5, 0
  br i1 %23, label %27, label %24

24:                                               ; preds = %20
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %27

27:                                               ; preds = %20, %24
  %28 = phi i32 [ %26, %24 ], [ 0, %20 ]
  %29 = add nsw i32 %28, %22
  %30 = sext i32 %17 to i64
  %31 = icmp ult i64 %30, %4
  br i1 %31, label %32, label %64

32:                                               ; preds = %27
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %30
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  br i1 %23, label %51, label %35

35:                                               ; preds = %32
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = add nsw i32 %37, %34
  %39 = icmp slt i32 %29, 1
  %40 = icmp slt i32 %38, 1
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, i1 true, i1 %39
  %45 = select i1 %44, i32 2147483647, i32 %29
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = icmp eq i32 %47, 0
  %49 = select i1 %48, i1 true, i1 %40
  %50 = select i1 %49, i32 2147483647, i32 %38
  br label %56

51:                                               ; preds = %32
  %52 = icmp slt i32 %29, 1
  %53 = select i1 %52, i32 2147483647, i32 %29
  %54 = icmp slt i32 %34, 1
  %55 = select i1 %54, i32 2147483647, i32 %34
  br label %56

56:                                               ; preds = %51, %35
  %57 = phi i32 [ %45, %35 ], [ %53, %51 ]
  %58 = phi i32 [ %50, %35 ], [ %55, %51 ]
  %59 = icmp ugt i32 %57, %58
  %60 = sext i32 %15 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  br i1 %59, label %62, label %63

62:                                               ; preds = %56
  store i32 %58, i32 addrspace(1)* %61, align 4, !tbaa !7
  br label %76

63:                                               ; preds = %56
  store i32 %57, i32 addrspace(1)* %61, align 4, !tbaa !7
  br label %76

64:                                               ; preds = %27
  %65 = icmp slt i32 %29, 1
  %66 = select i1 %65, i32 2147483647, i32 %29
  br i1 %23, label %72, label %67

67:                                               ; preds = %64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = icmp eq i32 %69, 0
  %71 = select i1 %70, i32 2147483647, i32 %66
  br label %72

72:                                               ; preds = %67, %64
  %73 = phi i32 [ %71, %67 ], [ %66, %64 ]
  %74 = sext i32 %15 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %74
  store i32 %73, i32 addrspace(1)* %75, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %72, %63, %62, %6
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
