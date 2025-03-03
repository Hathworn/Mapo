; ModuleID = '../data/hip_kernels/7086/232/main.cu'
source_filename = "../data/hip_kernels/7086/232/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11kLogregCostPfS_S_S_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %5
  br i1 %12, label %13, label %142

13:                                               ; preds = %7
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %1, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = fptosi float %16 to i32
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %14
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = mul nsw i32 %17, %5
  %21 = add nsw i32 %20, %11
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = tail call float @llvm.log.f32(float %24)
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %14
  store float %25, float addrspace(1)* %26, align 4, !tbaa !5
  %27 = fcmp contract une float %24, %19
  br i1 %27, label %139, label %28

28:                                               ; preds = %13
  %29 = icmp sgt i32 %6, 0
  br i1 %29, label %30, label %58

30:                                               ; preds = %28
  %31 = and i32 %6, 7
  %32 = icmp ult i32 %6, 8
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = and i32 %6, -8
  br label %61

35:                                               ; preds = %61, %30
  %36 = phi i32 [ undef, %30 ], [ %135, %61 ]
  %37 = phi i32 [ 0, %30 ], [ %136, %61 ]
  %38 = phi i32 [ 0, %30 ], [ %135, %61 ]
  %39 = icmp eq i32 %31, 0
  br i1 %39, label %55, label %40

40:                                               ; preds = %35, %40
  %41 = phi i32 [ %52, %40 ], [ %37, %35 ]
  %42 = phi i32 [ %51, %40 ], [ %38, %35 ]
  %43 = phi i32 [ %53, %40 ], [ 0, %35 ]
  %44 = mul nsw i32 %41, %5
  %45 = add nsw i32 %44, %11
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !5
  %49 = fcmp contract oeq float %48, %19
  %50 = zext i1 %49 to i32
  %51 = add nuw nsw i32 %42, %50
  %52 = add nuw nsw i32 %41, 1
  %53 = add i32 %43, 1
  %54 = icmp eq i32 %53, %31
  br i1 %54, label %55, label %40, !llvm.loop !10

55:                                               ; preds = %40, %35
  %56 = phi i32 [ %36, %35 ], [ %51, %40 ]
  %57 = sitofp i32 %56 to float
  br label %58

58:                                               ; preds = %55, %28
  %59 = phi float [ 0.000000e+00, %28 ], [ %57, %55 ]
  %60 = fdiv contract float 1.000000e+00, %59
  br label %139

61:                                               ; preds = %61, %33
  %62 = phi i32 [ 0, %33 ], [ %136, %61 ]
  %63 = phi i32 [ 0, %33 ], [ %135, %61 ]
  %64 = phi i32 [ 0, %33 ], [ %137, %61 ]
  %65 = mul nsw i32 %62, %5
  %66 = add nsw i32 %65, %11
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5
  %70 = fcmp contract oeq float %69, %19
  %71 = zext i1 %70 to i32
  %72 = add nuw nsw i32 %63, %71
  %73 = or i32 %62, 1
  %74 = mul nsw i32 %73, %5
  %75 = add nsw i32 %74, %11
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5
  %79 = fcmp contract oeq float %78, %19
  %80 = zext i1 %79 to i32
  %81 = add nuw nsw i32 %72, %80
  %82 = or i32 %62, 2
  %83 = mul nsw i32 %82, %5
  %84 = add nsw i32 %83, %11
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = fcmp contract oeq float %87, %19
  %89 = zext i1 %88 to i32
  %90 = add nuw nsw i32 %81, %89
  %91 = or i32 %62, 3
  %92 = mul nsw i32 %91, %5
  %93 = add nsw i32 %92, %11
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5
  %97 = fcmp contract oeq float %96, %19
  %98 = zext i1 %97 to i32
  %99 = add nuw nsw i32 %90, %98
  %100 = or i32 %62, 4
  %101 = mul nsw i32 %100, %5
  %102 = add nsw i32 %101, %11
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5
  %106 = fcmp contract oeq float %105, %19
  %107 = zext i1 %106 to i32
  %108 = add nuw nsw i32 %99, %107
  %109 = or i32 %62, 5
  %110 = mul nsw i32 %109, %5
  %111 = add nsw i32 %110, %11
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5
  %115 = fcmp contract oeq float %114, %19
  %116 = zext i1 %115 to i32
  %117 = add nuw nsw i32 %108, %116
  %118 = or i32 %62, 6
  %119 = mul nsw i32 %118, %5
  %120 = add nsw i32 %119, %11
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !5
  %124 = fcmp contract oeq float %123, %19
  %125 = zext i1 %124 to i32
  %126 = add nuw nsw i32 %117, %125
  %127 = or i32 %62, 7
  %128 = mul nsw i32 %127, %5
  %129 = add nsw i32 %128, %11
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !5
  %133 = fcmp contract oeq float %132, %19
  %134 = zext i1 %133 to i32
  %135 = add nuw nsw i32 %126, %134
  %136 = add nuw nsw i32 %62, 8
  %137 = add i32 %64, 8
  %138 = icmp eq i32 %137, %34
  br i1 %138, label %35, label %61, !llvm.loop !12

139:                                              ; preds = %13, %58
  %140 = phi float [ %60, %58 ], [ 0.000000e+00, %13 ]
  %141 = getelementptr inbounds float, float addrspace(1)* %4, i64 %14
  store float %140, float addrspace(1)* %141, align 4, !tbaa !5
  br label %142

142:                                              ; preds = %139, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
