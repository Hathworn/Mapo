; ModuleID = '../data/hip_kernels/1169/1/main.cu'
source_filename = "../data/hip_kernels/1169/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_isNotDone = protected addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @d_isNotDone to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10scanLabelsPiiii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 3
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %14 = shl i32 %13, 3
  %15 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %16 = add i32 %14, %15
  %17 = mul nsw i32 %16, %2
  %18 = add nsw i32 %17, %12
  %19 = mul nsw i32 %18, %1
  %20 = add nsw i32 %19, %8
  %21 = icmp slt i32 %8, %1
  %22 = icmp slt i32 %12, %2
  %23 = select i1 %21, i1 %22, i1 false
  %24 = icmp slt i32 %16, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %105

26:                                               ; preds = %4
  %27 = mul nsw i32 %2, %1
  %28 = sext i32 %20 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %105, label %32

32:                                               ; preds = %26
  %33 = icmp slt i32 %27, 0
  br i1 %33, label %39, label %34

34:                                               ; preds = %32
  %35 = sub nsw i32 0, %27
  %36 = sub nsw i32 0, %1
  %37 = icmp slt i32 %1, 0
  %38 = mul nsw i32 %27, %3
  br label %42

39:                                               ; preds = %54, %32
  %40 = phi i32 [ %20, %32 ], [ %55, %54 ]
  %41 = icmp slt i32 %40, %30
  br i1 %41, label %98, label %105

42:                                               ; preds = %34, %54
  %43 = phi i32 [ %35, %34 ], [ %56, %54 ]
  %44 = phi i32 [ %20, %34 ], [ %55, %54 ]
  br i1 %37, label %54, label %45

45:                                               ; preds = %42
  %46 = add nsw i32 %43, %20
  br label %47

47:                                               ; preds = %45, %90
  %48 = phi i32 [ %36, %45 ], [ %96, %90 ]
  %49 = phi i32 [ %44, %45 ], [ %95, %90 ]
  %50 = add nsw i32 %46, %48
  %51 = icmp sgt i32 %50, 0
  %52 = icmp sle i32 %50, %38
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %58, label %63

54:                                               ; preds = %90, %42
  %55 = phi i32 [ %44, %42 ], [ %95, %90 ]
  %56 = add nsw i32 %43, %27
  %57 = icmp sgt i32 %43, 0
  br i1 %57, label %39, label %42, !llvm.loop !10

58:                                               ; preds = %47
  %59 = add nsw i32 %50, -1
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %63

63:                                               ; preds = %47, %58
  %64 = phi i32 [ %62, %58 ], [ 0, %47 ]
  %65 = icmp ne i32 %64, 0
  %66 = icmp slt i32 %64, %49
  %67 = select i1 %65, i1 %66, i1 false
  %68 = select i1 %67, i32 %64, i32 %49
  %69 = icmp sgt i32 %50, -1
  %70 = icmp slt i32 %50, %38
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %76

72:                                               ; preds = %63
  %73 = zext i32 %50 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %76

76:                                               ; preds = %72, %63
  %77 = phi i32 [ %75, %72 ], [ 0, %63 ]
  %78 = icmp ne i32 %77, 0
  %79 = icmp slt i32 %77, %68
  %80 = select i1 %78, i1 %79, i1 false
  %81 = select i1 %80, i32 %77, i32 %68
  %82 = add nsw i32 %50, 1
  %83 = icmp sgt i32 %50, -2
  %84 = icmp slt i32 %82, %38
  %85 = select i1 %83, i1 %84, i1 false
  br i1 %85, label %86, label %90

86:                                               ; preds = %76
  %87 = zext i32 %82 to i64
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %87
  %89 = load i32, i32 addrspace(1)* %88, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %90

90:                                               ; preds = %86, %76
  %91 = phi i32 [ %89, %86 ], [ 0, %76 ]
  %92 = icmp ne i32 %91, 0
  %93 = icmp slt i32 %91, %81
  %94 = select i1 %92, i1 %93, i1 false
  %95 = select i1 %94, i32 %91, i32 %81
  %96 = add nsw i32 %48, %1
  %97 = icmp sgt i32 %48, 0
  br i1 %97, label %54, label %47, !llvm.loop !12

98:                                               ; preds = %39
  %99 = sext i32 %30 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !5, !amdgpu.noclobber !9
  %102 = tail call i32 @llvm.smin.i32(i32 %101, i32 %40)
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  store i32 %102, i32 addrspace(1)* %104, align 4, !tbaa !5
  store i32 1, i32 addrspace(1)* @d_isNotDone, align 4, !tbaa !5
  br label %105

105:                                              ; preds = %26, %98, %39, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
