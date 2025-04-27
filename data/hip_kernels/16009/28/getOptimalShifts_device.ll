; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/28/getOptimalShifts.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/16009/28/getOptimalShifts.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16getOptimalShiftsP15HIP_vector_typeIfLj2EEPKS0_iiiiii(%struct.HIP_vector_type addrspace(1)* noalias nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* noalias nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %3
  %27 = icmp slt i32 %25, %4
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %78

29:                                               ; preds = %8
  %30 = add nsw i32 %2, -1
  %31 = mul nsw i32 %25, %3
  %32 = add nsw i32 %31, %17
  %33 = mul nsw i32 %32, %30
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %34
  %36 = icmp slt i32 %6, %7
  br i1 %36, label %37, label %51

37:                                               ; preds = %29, %37
  %38 = phi i32 [ %49, %37 ], [ %6, %29 ]
  %39 = phi float [ %45, %37 ], [ 0.000000e+00, %29 ]
  %40 = phi float [ %48, %37 ], [ 0.000000e+00, %29 ]
  %41 = sext i32 %38 to i64
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %35, i64 %41
  %43 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %42, i64 0, i32 0, i32 0, i32 0, i64 0
  %44 = load float, float addrspace(1)* %43, align 8, !tbaa !7
  %45 = fadd contract float %39, %44
  %46 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %42, i64 0, i32 0, i32 0, i32 0, i64 1
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fadd contract float %40, %47
  %49 = add nsw i32 %38, 1
  %50 = icmp slt i32 %49, %7
  br i1 %50, label %37, label %67, !llvm.loop !10

51:                                               ; preds = %29
  %52 = icmp slt i32 %7, %6
  br i1 %52, label %53, label %67

53:                                               ; preds = %51, %53
  %54 = phi i32 [ %65, %53 ], [ %7, %51 ]
  %55 = phi float [ %61, %53 ], [ 0.000000e+00, %51 ]
  %56 = phi float [ %64, %53 ], [ 0.000000e+00, %51 ]
  %57 = sext i32 %54 to i64
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %35, i64 %57
  %59 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %58, i64 0, i32 0, i32 0, i32 0, i64 0
  %60 = load float, float addrspace(1)* %59, align 8, !tbaa !7
  %61 = fsub contract float %55, %60
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %58, i64 0, i32 0, i32 0, i32 0, i64 1
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fsub contract float %56, %63
  %65 = add nsw i32 %54, 1
  %66 = icmp slt i32 %65, %6
  br i1 %66, label %53, label %67, !llvm.loop !12

67:                                               ; preds = %53, %37, %51
  %68 = phi float [ 0.000000e+00, %51 ], [ %48, %37 ], [ %64, %53 ]
  %69 = phi float [ 0.000000e+00, %51 ], [ %45, %37 ], [ %61, %53 ]
  %70 = bitcast %struct.HIP_vector_type addrspace(1)* %0 to i8 addrspace(1)*
  %71 = mul nsw i32 %25, %5
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(1)* %70, i64 %72
  %74 = bitcast i8 addrspace(1)* %73 to %struct.HIP_vector_type addrspace(1)*
  %75 = sext i32 %17 to i64
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %74, i64 %75, i32 0, i32 0, i32 0, i64 0
  store float %69, float addrspace(1)* %76, align 8
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %74, i64 %75, i32 0, i32 0, i32 0, i64 1
  store float %68, float addrspace(1)* %77, align 4
  br label %78

78:                                               ; preds = %8, %67
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
