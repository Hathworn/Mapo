; ModuleID = '../data/hip_kernels/13231/4/main.cu'
source_filename = "../data/hip_kernels/13231/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23convolutionGPUkernel_1DPiS_S_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %129

16:                                               ; preds = %5
  %17 = icmp sgt i32 %4, 0
  br i1 %17, label %18, label %54

18:                                               ; preds = %16
  %19 = lshr i32 %4, 1
  %20 = sub i32 %14, %19
  %21 = and i32 %4, 3
  %22 = icmp ult i32 %4, 4
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = and i32 %4, -4
  br label %58

25:                                               ; preds = %123, %18
  %26 = phi i32 [ undef, %18 ], [ %124, %123 ]
  %27 = phi i32 [ 0, %18 ], [ %126, %123 ]
  %28 = phi i32 [ %20, %18 ], [ %125, %123 ]
  %29 = phi i32 [ 0, %18 ], [ %124, %123 ]
  %30 = icmp eq i32 %21, 0
  br i1 %30, label %54, label %31

31:                                               ; preds = %25, %48
  %32 = phi i32 [ %51, %48 ], [ %27, %25 ]
  %33 = phi i32 [ %50, %48 ], [ %28, %25 ]
  %34 = phi i32 [ %49, %48 ], [ %29, %25 ]
  %35 = phi i32 [ %52, %48 ], [ 0, %25 ]
  %36 = icmp slt i32 %33, %3
  %37 = icmp sgt i32 %33, -1
  %38 = and i1 %36, %37
  br i1 %38, label %39, label %48

39:                                               ; preds = %31
  %40 = zext i32 %33 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = zext i32 %32 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = mul nsw i32 %45, %42
  %47 = add nsw i32 %46, %34
  br label %48

48:                                               ; preds = %39, %31
  %49 = phi i32 [ %47, %39 ], [ %34, %31 ]
  %50 = add nsw i32 %33, 1
  %51 = add nuw nsw i32 %32, 1
  %52 = add i32 %35, 1
  %53 = icmp eq i32 %52, %21
  br i1 %53, label %54, label %31, !llvm.loop !11

54:                                               ; preds = %25, %48, %16
  %55 = phi i32 [ 0, %16 ], [ %26, %25 ], [ %49, %48 ]
  %56 = sext i32 %14 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  store i32 %55, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %129

58:                                               ; preds = %123, %23
  %59 = phi i32 [ 0, %23 ], [ %126, %123 ]
  %60 = phi i32 [ %20, %23 ], [ %125, %123 ]
  %61 = phi i32 [ 0, %23 ], [ %124, %123 ]
  %62 = phi i32 [ 0, %23 ], [ %127, %123 ]
  %63 = icmp slt i32 %60, %3
  %64 = icmp sgt i32 %60, -1
  %65 = and i1 %63, %64
  br i1 %65, label %66, label %75

66:                                               ; preds = %58
  %67 = zext i32 %60 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = zext i32 %59 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = mul nsw i32 %72, %69
  %74 = add nsw i32 %73, %61
  br label %75

75:                                               ; preds = %58, %66
  %76 = phi i32 [ %74, %66 ], [ %61, %58 ]
  %77 = add nsw i32 %60, 1
  %78 = icmp slt i32 %77, %3
  %79 = icmp sgt i32 %60, -2
  %80 = and i1 %78, %79
  br i1 %80, label %81, label %91

81:                                               ; preds = %75
  %82 = or i32 %59, 1
  %83 = zext i32 %77 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = zext i32 %82 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = mul nsw i32 %88, %85
  %90 = add nsw i32 %89, %76
  br label %91

91:                                               ; preds = %81, %75
  %92 = phi i32 [ %90, %81 ], [ %76, %75 ]
  %93 = add nsw i32 %60, 2
  %94 = icmp slt i32 %93, %3
  %95 = icmp sgt i32 %60, -3
  %96 = and i1 %94, %95
  br i1 %96, label %97, label %107

97:                                               ; preds = %91
  %98 = or i32 %59, 2
  %99 = zext i32 %93 to i64
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %99
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !5
  %102 = zext i32 %98 to i64
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %102
  %104 = load i32, i32 addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = mul nsw i32 %104, %101
  %106 = add nsw i32 %105, %92
  br label %107

107:                                              ; preds = %97, %91
  %108 = phi i32 [ %106, %97 ], [ %92, %91 ]
  %109 = add nsw i32 %60, 3
  %110 = icmp slt i32 %109, %3
  %111 = icmp sgt i32 %60, -4
  %112 = and i1 %110, %111
  br i1 %112, label %113, label %123

113:                                              ; preds = %107
  %114 = or i32 %59, 3
  %115 = zext i32 %109 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = zext i32 %114 to i64
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %118
  %120 = load i32, i32 addrspace(1)* %119, align 4, !tbaa !7, !amdgpu.noclobber !5
  %121 = mul nsw i32 %120, %117
  %122 = add nsw i32 %121, %108
  br label %123

123:                                              ; preds = %113, %107
  %124 = phi i32 [ %122, %113 ], [ %108, %107 ]
  %125 = add nsw i32 %60, 4
  %126 = add nuw nsw i32 %59, 4
  %127 = add i32 %62, 4
  %128 = icmp eq i32 %127, %24
  br i1 %128, label %25, label %58, !llvm.loop !13

129:                                              ; preds = %54, %5
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
