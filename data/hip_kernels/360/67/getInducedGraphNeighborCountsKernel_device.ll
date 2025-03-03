; ModuleID = '../data/hip_kernels/360/67/main.cu'
source_filename = "../data/hip_kernels/360/67/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z35getInducedGraphNeighborCountsKerneliPiS_S_S_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %0
  br i1 %15, label %16, label %85

16:                                               ; preds = %5
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = add nsw i32 %14, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = add nsw i32 %29, -1
  %31 = icmp slt i32 %22, %30
  br i1 %31, label %42, label %34

32:                                               ; preds = %57, %42
  %33 = icmp slt i32 %44, %30
  br i1 %33, label %42, label %34, !llvm.loop !11

34:                                               ; preds = %32, %16
  %35 = sext i32 %22 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = icmp ne i32 %37, %14
  %39 = zext i1 %38 to i32
  %40 = add nsw i32 %22, 1
  %41 = icmp slt i32 %40, %29
  br i1 %41, label %63, label %60

42:                                               ; preds = %16, %32
  %43 = phi i32 [ %44, %32 ], [ %22, %16 ]
  %44 = add nsw i32 %43, 1
  %45 = icmp slt i32 %44, %29
  br i1 %45, label %46, label %32

46:                                               ; preds = %42
  %47 = sext i32 %43 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  br label %49

49:                                               ; preds = %46, %57
  %50 = phi i32 [ %44, %46 ], [ %58, %57 ]
  %51 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7
  %52 = sext i32 %50 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7
  %55 = icmp slt i32 %51, %54
  br i1 %55, label %56, label %57

56:                                               ; preds = %49
  store i32 %54, i32 addrspace(1)* %48, align 4, !tbaa !7
  store i32 %51, i32 addrspace(1)* %53, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %49, %56
  %58 = add nsw i32 %50, 1
  %59 = icmp slt i32 %58, %29
  br i1 %59, label %49, label %32, !llvm.loop !13

60:                                               ; preds = %81, %34
  %61 = phi i32 [ %39, %34 ], [ %82, %81 ]
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  store i32 %61, i32 addrspace(1)* %62, align 4, !tbaa !7
  br label %85

63:                                               ; preds = %34, %81
  %64 = phi i32 [ %83, %81 ], [ %40, %34 ]
  %65 = phi i32 [ %64, %81 ], [ %22, %34 ]
  %66 = phi i32 [ %82, %81 ], [ %39, %34 ]
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = sext i32 %65 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7
  %73 = icmp eq i32 %69, %72
  %74 = icmp eq i32 %69, %14
  %75 = select i1 %73, i1 true, i1 %74
  br i1 %75, label %81, label %76

76:                                               ; preds = %63
  %77 = add nsw i32 %66, %22
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %78
  store i32 %69, i32 addrspace(1)* %79, align 4, !tbaa !7
  %80 = add nsw i32 %66, 1
  br label %81

81:                                               ; preds = %63, %76
  %82 = phi i32 [ %80, %76 ], [ %66, %63 ]
  %83 = add nsw i32 %64, 1
  %84 = icmp slt i32 %83, %29
  br i1 %84, label %63, label %60, !llvm.loop !14

85:                                               ; preds = %60, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
