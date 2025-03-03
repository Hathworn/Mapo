; ModuleID = '../data/hip_kernels/8731/8/main.cu'
source_filename = "../data/hip_kernels/8731/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16updateVelocity_kP15HIP_vector_typeIfLj2EEPfS2_iiiim(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i64 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %3
  %19 = icmp sgt i32 %6, 0
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %107

21:                                               ; preds = %8
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %28 = mul i32 %27, %26
  %29 = add i32 %28, %22
  %30 = mul i32 %29, %6
  %31 = mul nsw i32 %5, %3
  %32 = sitofp i32 %31 to float
  %33 = fdiv contract float 1.000000e+00, %32
  %34 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %35 = sext i32 %17 to i64
  %36 = and i32 %6, 1
  %37 = icmp eq i32 %6, 1
  br i1 %37, label %85, label %38

38:                                               ; preds = %21
  %39 = and i32 %6, -2
  br label %40

40:                                               ; preds = %81, %38
  %41 = phi i32 [ 0, %38 ], [ %82, %81 ]
  %42 = phi i32 [ 0, %38 ], [ %83, %81 ]
  %43 = add i32 %30, %41
  %44 = icmp slt i32 %43, %5
  br i1 %44, label %45, label %61

45:                                               ; preds = %40
  %46 = mul nsw i32 %43, %4
  %47 = add nsw i32 %46, %17
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fmul contract float %33, %50
  %54 = fmul contract float %33, %52
  %55 = sext i32 %43 to i64
  %56 = mul i64 %55, %7
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 %56
  %58 = bitcast i8 addrspace(1)* %57 to %struct.HIP_vector_type addrspace(1)*
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %58, i64 %35, i32 0, i32 0, i32 0, i64 0
  store float %53, float addrspace(1)* %59, align 8
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %58, i64 %35, i32 0, i32 0, i32 0, i64 1
  store float %54, float addrspace(1)* %60, align 4
  br label %61

61:                                               ; preds = %45, %40
  %62 = or i32 %41, 1
  %63 = add i32 %30, %62
  %64 = icmp slt i32 %63, %5
  br i1 %64, label %65, label %81

65:                                               ; preds = %61
  %66 = mul nsw i32 %63, %4
  %67 = add nsw i32 %66, %17
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %68
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7
  %73 = fmul contract float %33, %70
  %74 = fmul contract float %33, %72
  %75 = sext i32 %63 to i64
  %76 = mul i64 %75, %7
  %77 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 %76
  %78 = bitcast i8 addrspace(1)* %77 to %struct.HIP_vector_type addrspace(1)*
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %78, i64 %35, i32 0, i32 0, i32 0, i64 0
  store float %73, float addrspace(1)* %79, align 8
  %80 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %78, i64 %35, i32 0, i32 0, i32 0, i64 1
  store float %74, float addrspace(1)* %80, align 4
  br label %81

81:                                               ; preds = %65, %61
  %82 = add nuw nsw i32 %41, 2
  %83 = add i32 %42, 2
  %84 = icmp eq i32 %83, %39
  br i1 %84, label %85, label %40, !llvm.loop !11

85:                                               ; preds = %81, %21
  %86 = phi i32 [ 0, %21 ], [ %82, %81 ]
  %87 = icmp eq i32 %36, 0
  br i1 %87, label %107, label %88

88:                                               ; preds = %85
  %89 = add i32 %30, %86
  %90 = icmp slt i32 %89, %5
  br i1 %90, label %91, label %107

91:                                               ; preds = %88
  %92 = mul nsw i32 %89, %4
  %93 = add nsw i32 %92, %17
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %97 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !7
  %99 = fmul contract float %33, %96
  %100 = fmul contract float %33, %98
  %101 = sext i32 %89 to i64
  %102 = mul i64 %101, %7
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %34, i64 %102
  %104 = bitcast i8 addrspace(1)* %103 to %struct.HIP_vector_type addrspace(1)*
  %105 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %104, i64 %35, i32 0, i32 0, i32 0, i64 0
  store float %99, float addrspace(1)* %105, align 8
  %106 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %104, i64 %35, i32 0, i32 0, i32 0, i64 1
  store float %100, float addrspace(1)* %106, align 4
  br label %107

107:                                              ; preds = %85, %91, %88, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
