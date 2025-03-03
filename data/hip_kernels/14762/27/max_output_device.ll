; ModuleID = '../data/hip_kernels/14762/27/main.cu'
source_filename = "../data/hip_kernels/14762/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10max_outputPfS_S_ll(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i64 %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = zext i32 %14 to i64
  %16 = icmp slt i64 %15, %3
  br i1 %16, label %17, label %114

17:                                               ; preds = %5
  %18 = mul nsw i64 %15, %4
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = icmp sgt i64 %4, 1
  br i1 %21, label %22, label %109

22:                                               ; preds = %17
  %23 = add i64 %4, -1
  %24 = add i64 %4, -2
  %25 = and i64 %23, 7
  %26 = icmp ult i64 %24, 7
  br i1 %26, label %84, label %27

27:                                               ; preds = %22
  %28 = and i64 %23, -8
  br label %29

29:                                               ; preds = %29, %27
  %30 = phi i64 [ 1, %27 ], [ %81, %29 ]
  %31 = phi i64 [ 0, %27 ], [ %80, %29 ]
  %32 = phi float [ %20, %27 ], [ %79, %29 ]
  %33 = phi i64 [ 0, %27 ], [ %82, %29 ]
  %34 = getelementptr inbounds float, float addrspace(1)* %19, i64 %30
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = fcmp contract ogt float %35, %32
  %37 = select i1 %36, float %35, float %32
  %38 = select i1 %36, i64 %30, i64 %31
  %39 = add nuw nsw i64 %30, 1
  %40 = getelementptr inbounds float, float addrspace(1)* %19, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = fcmp contract ogt float %41, %37
  %43 = select i1 %42, float %41, float %37
  %44 = select i1 %42, i64 %39, i64 %38
  %45 = add nuw nsw i64 %30, 2
  %46 = getelementptr inbounds float, float addrspace(1)* %19, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = fcmp contract ogt float %47, %43
  %49 = select i1 %48, float %47, float %43
  %50 = select i1 %48, i64 %45, i64 %44
  %51 = add nuw nsw i64 %30, 3
  %52 = getelementptr inbounds float, float addrspace(1)* %19, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = fcmp contract ogt float %53, %49
  %55 = select i1 %54, float %53, float %49
  %56 = select i1 %54, i64 %51, i64 %50
  %57 = add nuw nsw i64 %30, 4
  %58 = getelementptr inbounds float, float addrspace(1)* %19, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = fcmp contract ogt float %59, %55
  %61 = select i1 %60, float %59, float %55
  %62 = select i1 %60, i64 %57, i64 %56
  %63 = add nuw nsw i64 %30, 5
  %64 = getelementptr inbounds float, float addrspace(1)* %19, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = fcmp contract ogt float %65, %61
  %67 = select i1 %66, float %65, float %61
  %68 = select i1 %66, i64 %63, i64 %62
  %69 = add nuw nsw i64 %30, 6
  %70 = getelementptr inbounds float, float addrspace(1)* %19, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = fcmp contract ogt float %71, %67
  %73 = select i1 %72, float %71, float %67
  %74 = select i1 %72, i64 %69, i64 %68
  %75 = add nuw nsw i64 %30, 7
  %76 = getelementptr inbounds float, float addrspace(1)* %19, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = fcmp contract ogt float %77, %73
  %79 = select i1 %78, float %77, float %73
  %80 = select i1 %78, i64 %75, i64 %74
  %81 = add nuw nsw i64 %30, 8
  %82 = add i64 %33, 8
  %83 = icmp eq i64 %82, %28
  br i1 %83, label %84, label %29, !llvm.loop !11

84:                                               ; preds = %29, %22
  %85 = phi float [ undef, %22 ], [ %79, %29 ]
  %86 = phi i64 [ undef, %22 ], [ %80, %29 ]
  %87 = phi i64 [ 1, %22 ], [ %81, %29 ]
  %88 = phi i64 [ 0, %22 ], [ %80, %29 ]
  %89 = phi float [ %20, %22 ], [ %79, %29 ]
  %90 = icmp eq i64 %25, 0
  br i1 %90, label %104, label %91

91:                                               ; preds = %84, %91
  %92 = phi i64 [ %101, %91 ], [ %87, %84 ]
  %93 = phi i64 [ %100, %91 ], [ %88, %84 ]
  %94 = phi float [ %99, %91 ], [ %89, %84 ]
  %95 = phi i64 [ %102, %91 ], [ 0, %84 ]
  %96 = getelementptr inbounds float, float addrspace(1)* %19, i64 %92
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = fcmp contract ogt float %97, %94
  %99 = select i1 %98, float %97, float %94
  %100 = select i1 %98, i64 %92, i64 %93
  %101 = add nuw nsw i64 %92, 1
  %102 = add i64 %95, 1
  %103 = icmp eq i64 %102, %25
  br i1 %103, label %104, label %91, !llvm.loop !13

104:                                              ; preds = %91, %84
  %105 = phi float [ %85, %84 ], [ %99, %91 ]
  %106 = phi i64 [ %86, %84 ], [ %100, %91 ]
  %107 = add nsw i64 %106, 1
  %108 = sitofp i64 %107 to float
  br label %109

109:                                              ; preds = %104, %17
  %110 = phi float [ %20, %17 ], [ %105, %104 ]
  %111 = phi float [ 1.000000e+00, %17 ], [ %108, %104 ]
  %112 = getelementptr inbounds float, float addrspace(1)* %1, i64 %15
  store float %110, float addrspace(1)* %112, align 4, !tbaa !7
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %15
  store float %111, float addrspace(1)* %113, align 4, !tbaa !7
  br label %114

114:                                              ; preds = %5, %109
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
