; ModuleID = '../data/hip_kernels/1040/23/main.cu'
source_filename = "../data/hip_kernels/1040/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17init_vertex_groupPiPbS_S_S_S_S_i(i32 addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp slt i32 %9, %7
  br i1 %10, label %11, label %143

11:                                               ; preds = %8
  %12 = sext i32 %9 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !4, !amdgpu.noclobber !8
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %12
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !4, !amdgpu.noclobber !8
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %19
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %12
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !4, !amdgpu.noclobber !8
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %12
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !4, !amdgpu.noclobber !8
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %12
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !4, !amdgpu.noclobber !8
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %28 = icmp slt i32 %27, %24
  br i1 %28, label %29, label %143

29:                                               ; preds = %11
  %30 = icmp sgt i32 %22, 0
  %31 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %32 = getelementptr i8, i8 addrspace(4)* %31, i64 4
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 4, !range !10, !invariant.load !8
  %35 = zext i16 %34 to i32
  %36 = and i32 %22, 7
  %37 = icmp ult i32 %22, 8
  %38 = and i32 %22, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %69, %29
  %41 = phi i32 [ %27, %29 ], [ %70, %69 ]
  br i1 %30, label %42, label %69

42:                                               ; preds = %40
  %43 = mul nsw i32 %41, %26
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %16, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !4
  br i1 %37, label %47, label %72

47:                                               ; preds = %72, %42
  %48 = phi i32 [ undef, %42 ], [ %139, %72 ]
  %49 = phi i32 [ %46, %42 ], [ %139, %72 ]
  %50 = phi i32 [ %43, %42 ], [ %140, %72 ]
  %51 = phi i32 [ 0, %42 ], [ %137, %72 ]
  br i1 %39, label %67, label %52

52:                                               ; preds = %47, %52
  %53 = phi i32 [ %63, %52 ], [ %49, %47 ]
  %54 = phi i32 [ %64, %52 ], [ %50, %47 ]
  %55 = phi i32 [ %61, %52 ], [ %51, %47 ]
  %56 = phi i32 [ %65, %52 ], [ 0, %47 ]
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %60 = zext i8 %59 to i32
  %61 = add nuw nsw i32 %55, 1
  %62 = mul nuw nsw i32 %61, %60
  %63 = add nsw i32 %62, %53
  %64 = add nsw i32 %54, 1
  %65 = add i32 %56, 1
  %66 = icmp eq i32 %65, %36
  br i1 %66, label %67, label %52, !llvm.loop !14

67:                                               ; preds = %52, %47
  %68 = phi i32 [ %48, %47 ], [ %63, %52 ]
  store i32 %68, i32 addrspace(1)* %45, align 4, !tbaa !4
  br label %69

69:                                               ; preds = %67, %40
  %70 = add i32 %41, %35
  %71 = icmp slt i32 %70, %24
  br i1 %71, label %40, label %143, !llvm.loop !16

72:                                               ; preds = %42, %72
  %73 = phi i32 [ %139, %72 ], [ %46, %42 ]
  %74 = phi i32 [ %140, %72 ], [ %43, %42 ]
  %75 = phi i32 [ %137, %72 ], [ 0, %42 ]
  %76 = phi i32 [ %141, %72 ], [ 0, %42 ]
  %77 = sext i32 %74 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %77
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %80 = zext i8 %79 to i32
  %81 = or i32 %75, 1
  %82 = mul nuw nsw i32 %81, %80
  %83 = add nsw i32 %82, %73
  %84 = add nsw i32 %74, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %85
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %88 = zext i8 %87 to i32
  %89 = or i32 %75, 2
  %90 = mul nuw nsw i32 %89, %88
  %91 = add nsw i32 %90, %83
  %92 = add nsw i32 %74, 2
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %93
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %96 = zext i8 %95 to i32
  %97 = or i32 %75, 3
  %98 = mul nuw nsw i32 %97, %96
  %99 = add nsw i32 %98, %91
  %100 = add nsw i32 %74, 3
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %101
  %103 = load i8, i8 addrspace(1)* %102, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %104 = zext i8 %103 to i32
  %105 = or i32 %75, 4
  %106 = mul nuw nsw i32 %105, %104
  %107 = add nsw i32 %106, %99
  %108 = add nsw i32 %74, 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %109
  %111 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %112 = zext i8 %111 to i32
  %113 = or i32 %75, 5
  %114 = mul nuw nsw i32 %113, %112
  %115 = add nsw i32 %114, %107
  %116 = add nsw i32 %74, 5
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %117
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %120 = zext i8 %119 to i32
  %121 = or i32 %75, 6
  %122 = mul nuw nsw i32 %121, %120
  %123 = add nsw i32 %122, %115
  %124 = add nsw i32 %74, 6
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %125
  %127 = load i8, i8 addrspace(1)* %126, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %128 = zext i8 %127 to i32
  %129 = or i32 %75, 7
  %130 = mul nuw nsw i32 %129, %128
  %131 = add nsw i32 %130, %123
  %132 = add nsw i32 %74, 7
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %133
  %135 = load i8, i8 addrspace(1)* %134, align 1, !tbaa !11, !range !13, !amdgpu.noclobber !8
  %136 = zext i8 %135 to i32
  %137 = add nuw nsw i32 %75, 8
  %138 = mul nuw nsw i32 %137, %136
  %139 = add nsw i32 %138, %131
  %140 = add nsw i32 %74, 8
  %141 = add i32 %76, 8
  %142 = icmp eq i32 %141, %38
  br i1 %142, label %47, label %72, !llvm.loop !18

143:                                              ; preds = %69, %11, %8
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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !12, i64 0}
!12 = !{!"bool", !6, i64 0}
!13 = !{i8 0, i8 2}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
