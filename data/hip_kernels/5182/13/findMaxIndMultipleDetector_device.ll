; ModuleID = '../data/hip_kernels/5182/13/main.cu'
source_filename = "../data/hip_kernels/5182/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26findMaxIndMultipleDetectorPfPii(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 1
  br i1 %4, label %5, label %44

5:                                                ; preds = %3
  %6 = add i32 %2, -1
  %7 = add i32 %2, -2
  %8 = and i32 %6, 7
  %9 = icmp ult i32 %7, 7
  br i1 %9, label %12, label %10

10:                                               ; preds = %5
  %11 = and i32 %6, -8
  br label %46

12:                                               ; preds = %46, %5
  %13 = phi i32 [ undef, %5 ], [ %152, %46 ]
  %14 = phi i32 [ undef, %5 ], [ %153, %46 ]
  %15 = phi i32 [ 1, %5 ], [ %154, %46 ]
  %16 = phi i32 [ 1, %5 ], [ %153, %46 ]
  %17 = phi i32 [ 0, %5 ], [ %152, %46 ]
  %18 = icmp eq i32 %8, 0
  br i1 %18, label %39, label %19

19:                                               ; preds = %12, %19
  %20 = phi i32 [ %36, %19 ], [ %15, %12 ]
  %21 = phi i32 [ %35, %19 ], [ %16, %12 ]
  %22 = phi i32 [ %34, %19 ], [ %17, %12 ]
  %23 = phi i32 [ %37, %19 ], [ 0, %12 ]
  %24 = sext i32 %22 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !4, !amdgpu.noclobber !8
  %27 = zext i32 %20 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !4, !amdgpu.noclobber !8
  %30 = fcmp contract olt float %26, %29
  %31 = fcmp contract oeq float %26, %29
  %32 = zext i1 %31 to i32
  %33 = add nsw i32 %21, %32
  %34 = select i1 %30, i32 %20, i32 %22
  %35 = select i1 %30, i32 1, i32 %33
  %36 = add nuw nsw i32 %20, 1
  %37 = add i32 %23, 1
  %38 = icmp eq i32 %37, %8
  br i1 %38, label %39, label %19, !llvm.loop !9

39:                                               ; preds = %19, %12
  %40 = phi i32 [ %13, %12 ], [ %34, %19 ]
  %41 = phi i32 [ %14, %12 ], [ %35, %19 ]
  %42 = icmp sgt i32 %41, 1
  %43 = select i1 %42, i32 -1, i32 %40
  br label %44

44:                                               ; preds = %39, %3
  %45 = phi i32 [ 0, %3 ], [ %43, %39 ]
  store i32 %45, i32 addrspace(1)* %1, align 4, !tbaa !11
  ret void

46:                                               ; preds = %46, %10
  %47 = phi i32 [ 1, %10 ], [ %154, %46 ]
  %48 = phi i32 [ 1, %10 ], [ %153, %46 ]
  %49 = phi i32 [ 0, %10 ], [ %152, %46 ]
  %50 = phi i32 [ 0, %10 ], [ %155, %46 ]
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !4, !amdgpu.noclobber !8
  %54 = zext i32 %47 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %0, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !4, !amdgpu.noclobber !8
  %57 = fcmp contract olt float %53, %56
  %58 = fcmp contract oeq float %53, %56
  %59 = zext i1 %58 to i32
  %60 = add nsw i32 %48, %59
  %61 = select i1 %57, i32 %47, i32 %49
  %62 = select i1 %57, i32 1, i32 %60
  %63 = add nuw nsw i32 %47, 1
  %64 = sext i32 %61 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !4, !amdgpu.noclobber !8
  %67 = zext i32 %63 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !4, !amdgpu.noclobber !8
  %70 = fcmp contract olt float %66, %69
  %71 = fcmp contract oeq float %66, %69
  %72 = zext i1 %71 to i32
  %73 = add nsw i32 %62, %72
  %74 = select i1 %70, i32 %63, i32 %61
  %75 = select i1 %70, i32 1, i32 %73
  %76 = add nuw nsw i32 %47, 2
  %77 = sext i32 %74 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !4, !amdgpu.noclobber !8
  %80 = zext i32 %76 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !4, !amdgpu.noclobber !8
  %83 = fcmp contract olt float %79, %82
  %84 = fcmp contract oeq float %79, %82
  %85 = zext i1 %84 to i32
  %86 = add nsw i32 %75, %85
  %87 = select i1 %83, i32 %76, i32 %74
  %88 = select i1 %83, i32 1, i32 %86
  %89 = add nuw nsw i32 %47, 3
  %90 = sext i32 %87 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !4, !amdgpu.noclobber !8
  %93 = zext i32 %89 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !4, !amdgpu.noclobber !8
  %96 = fcmp contract olt float %92, %95
  %97 = fcmp contract oeq float %92, %95
  %98 = zext i1 %97 to i32
  %99 = add nsw i32 %88, %98
  %100 = select i1 %96, i32 %89, i32 %87
  %101 = select i1 %96, i32 1, i32 %99
  %102 = add nuw nsw i32 %47, 4
  %103 = sext i32 %100 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !4, !amdgpu.noclobber !8
  %106 = zext i32 %102 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !4, !amdgpu.noclobber !8
  %109 = fcmp contract olt float %105, %108
  %110 = fcmp contract oeq float %105, %108
  %111 = zext i1 %110 to i32
  %112 = add nsw i32 %101, %111
  %113 = select i1 %109, i32 %102, i32 %100
  %114 = select i1 %109, i32 1, i32 %112
  %115 = add nuw nsw i32 %47, 5
  %116 = sext i32 %113 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %0, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !4, !amdgpu.noclobber !8
  %119 = zext i32 %115 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !4, !amdgpu.noclobber !8
  %122 = fcmp contract olt float %118, %121
  %123 = fcmp contract oeq float %118, %121
  %124 = zext i1 %123 to i32
  %125 = add nsw i32 %114, %124
  %126 = select i1 %122, i32 %115, i32 %113
  %127 = select i1 %122, i32 1, i32 %125
  %128 = add nuw nsw i32 %47, 6
  %129 = sext i32 %126 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !4, !amdgpu.noclobber !8
  %132 = zext i32 %128 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !4, !amdgpu.noclobber !8
  %135 = fcmp contract olt float %131, %134
  %136 = fcmp contract oeq float %131, %134
  %137 = zext i1 %136 to i32
  %138 = add nsw i32 %127, %137
  %139 = select i1 %135, i32 %128, i32 %126
  %140 = select i1 %135, i32 1, i32 %138
  %141 = add nuw nsw i32 %47, 7
  %142 = sext i32 %139 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !4, !amdgpu.noclobber !8
  %145 = zext i32 %141 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !4, !amdgpu.noclobber !8
  %148 = fcmp contract olt float %144, %147
  %149 = fcmp contract oeq float %144, %147
  %150 = zext i1 %149 to i32
  %151 = add nsw i32 %140, %150
  %152 = select i1 %148, i32 %141, i32 %139
  %153 = select i1 %148, i32 1, i32 %151
  %154 = add nuw nsw i32 %47, 8
  %155 = add i32 %50, 8
  %156 = icmp eq i32 %155, %11
  br i1 %156, label %12, label %46, !llvm.loop !13
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
