; ModuleID = '../data/hip_kernels/219/28/main.cu'
source_filename = "../data/hip_kernels/219/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10segmentMaxPfS_iiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = mul i32 %16, %4
  %18 = icmp ugt i32 %17, %3
  %19 = sub i32 %16, %5
  %20 = add i32 %19, 1
  %21 = mul i32 %20, %6
  %22 = add i32 %21, %3
  %23 = icmp ult i32 %22, %2
  %24 = and i1 %18, %23
  %25 = mul i32 %19, %6
  %26 = add i32 %25, %3
  %27 = select i1 %24, i32 %26, i32 %17
  %28 = select i1 %24, i32 %6, i32 %4
  %29 = zext i32 %27 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = icmp sgt i32 %28, 0
  br i1 %31, label %32, label %117

32:                                               ; preds = %7
  %33 = and i32 %28, 7
  %34 = icmp ult i32 %28, 8
  br i1 %34, label %99, label %35

35:                                               ; preds = %32
  %36 = and i32 %28, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi float [ 0.000000e+00, %35 ], [ %95, %37 ]
  %39 = phi i32 [ 0, %35 ], [ %96, %37 ]
  %40 = phi i32 [ 0, %35 ], [ %97, %37 ]
  %41 = zext i32 %39 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %30, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fcmp contract olt float %38, %44
  %46 = select i1 %45, float %44, float %38
  %47 = or i32 %39, 1
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %30, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = tail call float @llvm.fabs.f32(float %50)
  %52 = fcmp contract olt float %46, %51
  %53 = select i1 %52, float %51, float %46
  %54 = or i32 %39, 2
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %30, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = tail call float @llvm.fabs.f32(float %57)
  %59 = fcmp contract olt float %53, %58
  %60 = select i1 %59, float %58, float %53
  %61 = or i32 %39, 3
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %30, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = tail call float @llvm.fabs.f32(float %64)
  %66 = fcmp contract olt float %60, %65
  %67 = select i1 %66, float %65, float %60
  %68 = or i32 %39, 4
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %30, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = tail call float @llvm.fabs.f32(float %71)
  %73 = fcmp contract olt float %67, %72
  %74 = select i1 %73, float %72, float %67
  %75 = or i32 %39, 5
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %30, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = tail call float @llvm.fabs.f32(float %78)
  %80 = fcmp contract olt float %74, %79
  %81 = select i1 %80, float %79, float %74
  %82 = or i32 %39, 6
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %30, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = tail call float @llvm.fabs.f32(float %85)
  %87 = fcmp contract olt float %81, %86
  %88 = select i1 %87, float %86, float %81
  %89 = or i32 %39, 7
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %30, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = tail call float @llvm.fabs.f32(float %92)
  %94 = fcmp contract olt float %88, %93
  %95 = select i1 %94, float %93, float %88
  %96 = add nuw nsw i32 %39, 8
  %97 = add i32 %40, 8
  %98 = icmp eq i32 %97, %36
  br i1 %98, label %99, label %37, !llvm.loop !11

99:                                               ; preds = %37, %32
  %100 = phi float [ undef, %32 ], [ %95, %37 ]
  %101 = phi float [ 0.000000e+00, %32 ], [ %95, %37 ]
  %102 = phi i32 [ 0, %32 ], [ %96, %37 ]
  %103 = icmp eq i32 %33, 0
  br i1 %103, label %117, label %104

104:                                              ; preds = %99, %104
  %105 = phi float [ %113, %104 ], [ %101, %99 ]
  %106 = phi i32 [ %114, %104 ], [ %102, %99 ]
  %107 = phi i32 [ %115, %104 ], [ 0, %99 ]
  %108 = zext i32 %106 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %30, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7, !amdgpu.noclobber !5
  %111 = tail call float @llvm.fabs.f32(float %110)
  %112 = fcmp contract olt float %105, %111
  %113 = select i1 %112, float %111, float %105
  %114 = add nuw nsw i32 %106, 1
  %115 = add i32 %107, 1
  %116 = icmp eq i32 %115, %33
  br i1 %116, label %117, label %104, !llvm.loop !13

117:                                              ; preds = %99, %104, %7
  %118 = phi float [ 0.000000e+00, %7 ], [ %100, %99 ], [ %113, %104 ]
  %119 = zext i32 %16 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  store float %118, float addrspace(1)* %120, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
