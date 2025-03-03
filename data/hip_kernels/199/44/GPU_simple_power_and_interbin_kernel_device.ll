; ModuleID = '../data/hip_kernels/199/44/main.cu'
source_filename = "../data/hip_kernels/199/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36GPU_simple_power_and_interbin_kernelP15HIP_vector_typeIfLj2EEPfS2_if(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, float %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = ashr i32 %3, 1
  %17 = icmp slt i32 %14, %16
  %18 = icmp sgt i32 %14, 0
  %19 = and i1 %17, %18
  br i1 %19, label %20, label %39

20:                                               ; preds = %5
  %21 = add nsw i32 %16, 1
  %22 = mul i32 %21, %15
  %23 = add nsw i32 %14, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 0
  %26 = load float, float addrspace(1)* %25, align 8, !amdgpu.noclobber !5
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %24, i32 0, i32 0, i32 0, i64 1
  %28 = load float, float addrspace(1)* %27, align 4, !amdgpu.noclobber !5
  %29 = add nsw i32 %23, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 0
  %32 = load float, float addrspace(1)* %31, align 8, !amdgpu.noclobber !5
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %30, i32 0, i32 0, i32 0, i64 1
  %34 = load float, float addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = fdiv contract float %26, %4
  %36 = fdiv contract float %28, %4
  %37 = fdiv contract float %32, %4
  %38 = fdiv contract float %34, %4
  br label %39

39:                                               ; preds = %20, %5
  %40 = phi float [ %36, %20 ], [ 0.000000e+00, %5 ]
  %41 = phi float [ %35, %20 ], [ 0.000000e+00, %5 ]
  %42 = phi float [ %38, %20 ], [ 0.000000e+00, %5 ]
  %43 = phi float [ %37, %20 ], [ 0.000000e+00, %5 ]
  br i1 %17, label %44, label %66

44:                                               ; preds = %39
  %45 = fmul contract float %41, %41
  %46 = fmul contract float %40, %40
  %47 = fadd contract float %46, %45
  %48 = mul i32 %16, %15
  %49 = add i32 %14, %48
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %1, i64 %50
  store float %47, float addrspace(1)* %51, align 4, !tbaa !7
  %52 = mul i32 %15, %3
  %53 = shl nsw i32 %14, 1
  %54 = add i32 %53, %52
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %2, i64 %55
  store float %47, float addrspace(1)* %56, align 4, !tbaa !7
  %57 = fsub contract float %41, %43
  %58 = fmul contract float %57, %57
  %59 = fsub contract float %40, %42
  %60 = fmul contract float %59, %59
  %61 = fadd contract float %60, %58
  %62 = fmul contract float %61, 0x3FE3BD3CC0000000
  %63 = add i32 %54, 1
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %44, %39
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
