; ModuleID = '../data/hip_kernels/15733/3/main.cu'
source_filename = "../data/hip_kernels/15733/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7conv_1dPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sdiv i32 %4, -2
  %16 = add i32 %14, %15
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %50

18:                                               ; preds = %5
  %19 = and i32 %4, 3
  %20 = icmp ult i32 %4, 4
  br i1 %20, label %23, label %21

21:                                               ; preds = %18
  %22 = and i32 %4, -4
  br label %54

23:                                               ; preds = %119, %18
  %24 = phi i32 [ undef, %18 ], [ %120, %119 ]
  %25 = phi i32 [ 0, %18 ], [ %121, %119 ]
  %26 = phi i32 [ 0, %18 ], [ %120, %119 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %50, label %28

28:                                               ; preds = %23, %45
  %29 = phi i32 [ %47, %45 ], [ %25, %23 ]
  %30 = phi i32 [ %46, %45 ], [ %26, %23 ]
  %31 = phi i32 [ %48, %45 ], [ 0, %23 ]
  %32 = add nsw i32 %16, %29
  %33 = icmp sgt i32 %32, -1
  %34 = icmp slt i32 %32, %3
  %35 = select i1 %33, i1 %34, i1 false
  br i1 %35, label %36, label %45

36:                                               ; preds = %28
  %37 = zext i32 %32 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = zext i32 %29 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = mul nsw i32 %42, %39
  %44 = add nsw i32 %43, %30
  br label %45

45:                                               ; preds = %36, %28
  %46 = phi i32 [ %44, %36 ], [ %30, %28 ]
  %47 = add nuw nsw i32 %29, 1
  %48 = add i32 %31, 1
  %49 = icmp eq i32 %48, %19
  br i1 %49, label %50, label %28, !llvm.loop !11

50:                                               ; preds = %23, %45, %5
  %51 = phi i32 [ 0, %5 ], [ %24, %23 ], [ %46, %45 ]
  %52 = sext i32 %14 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %52
  store i32 %51, i32 addrspace(1)* %53, align 4, !tbaa !7
  ret void

54:                                               ; preds = %119, %21
  %55 = phi i32 [ 0, %21 ], [ %121, %119 ]
  %56 = phi i32 [ 0, %21 ], [ %120, %119 ]
  %57 = phi i32 [ 0, %21 ], [ %122, %119 ]
  %58 = add nsw i32 %16, %55
  %59 = icmp sgt i32 %58, -1
  %60 = icmp slt i32 %58, %3
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %62, label %71

62:                                               ; preds = %54
  %63 = zext i32 %58 to i64
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %63
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = zext i32 %55 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %66
  %68 = load i32, i32 addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = mul nsw i32 %68, %65
  %70 = add nsw i32 %69, %56
  br label %71

71:                                               ; preds = %54, %62
  %72 = phi i32 [ %70, %62 ], [ %56, %54 ]
  %73 = or i32 %55, 1
  %74 = add nsw i32 %16, %73
  %75 = icmp sgt i32 %74, -1
  %76 = icmp slt i32 %74, %3
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %87

78:                                               ; preds = %71
  %79 = zext i32 %74 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !5
  %82 = zext i32 %73 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !7, !amdgpu.noclobber !5
  %85 = mul nsw i32 %84, %81
  %86 = add nsw i32 %85, %72
  br label %87

87:                                               ; preds = %78, %71
  %88 = phi i32 [ %86, %78 ], [ %72, %71 ]
  %89 = or i32 %55, 2
  %90 = add nsw i32 %16, %89
  %91 = icmp sgt i32 %90, -1
  %92 = icmp slt i32 %90, %3
  %93 = select i1 %91, i1 %92, i1 false
  br i1 %93, label %94, label %103

94:                                               ; preds = %87
  %95 = zext i32 %90 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = zext i32 %89 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = mul nsw i32 %100, %97
  %102 = add nsw i32 %101, %88
  br label %103

103:                                              ; preds = %94, %87
  %104 = phi i32 [ %102, %94 ], [ %88, %87 ]
  %105 = or i32 %55, 3
  %106 = add nsw i32 %16, %105
  %107 = icmp sgt i32 %106, -1
  %108 = icmp slt i32 %106, %3
  %109 = select i1 %107, i1 %108, i1 false
  br i1 %109, label %110, label %119

110:                                              ; preds = %103
  %111 = zext i32 %106 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = zext i32 %105 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = mul nsw i32 %116, %113
  %118 = add nsw i32 %117, %104
  br label %119

119:                                              ; preds = %110, %103
  %120 = phi i32 [ %118, %110 ], [ %104, %103 ]
  %121 = add nuw nsw i32 %55, 4
  %122 = add i32 %57, 4
  %123 = icmp eq i32 %122, %22
  br i1 %123, label %23, label %54, !llvm.loop !13
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
