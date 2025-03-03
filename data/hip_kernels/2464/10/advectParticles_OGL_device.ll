; ModuleID = '../data/hip_kernels/2464/10/main.cu'
source_filename = "../data/hip_kernels/2464/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19advectParticles_OGLP15HIP_vector_typeIfLj2EES1_iifim(%struct.HIP_vector_type addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, i32 %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %2
  %18 = icmp sgt i32 %5, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %79

20:                                               ; preds = %7
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %27 = mul i32 %26, %25
  %28 = add i32 %27, %21
  %29 = mul i32 %28, %5
  %30 = sitofp i32 %2 to float
  %31 = sitofp i32 %3 to float
  %32 = bitcast %struct.HIP_vector_type addrspace(1)* %1 to i8 addrspace(1)*
  br label %33

33:                                               ; preds = %20, %76
  %34 = phi i32 [ 0, %20 ], [ %77, %76 ]
  %35 = add i32 %29, %34
  %36 = icmp slt i32 %35, %3
  br i1 %36, label %37, label %76

37:                                               ; preds = %33
  %38 = mul nsw i32 %35, %2
  %39 = add nsw i32 %38, %16
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %40, i32 0, i32 0, i32 0, i64 0
  %42 = load float, float addrspace(1)* %41, align 8
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %40, i32 0, i32 0, i32 0, i64 1
  %44 = load float, float addrspace(1)* %43, align 4
  %45 = fmul contract float %42, %30
  %46 = fptosi float %45 to i32
  %47 = fmul contract float %44, %31
  %48 = fptosi float %47 to i32
  %49 = sext i32 %48 to i64
  %50 = mul i64 %49, %6
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 %50
  %52 = bitcast i8 addrspace(1)* %51 to %struct.HIP_vector_type addrspace(1)*
  %53 = sext i32 %46 to i64
  %54 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %52, i64 %53, i32 0, i32 0, i32 0, i64 0
  %55 = load float, float addrspace(1)* %54, align 8
  %56 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %52, i64 %53, i32 0, i32 0, i32 0, i64 1
  %57 = load float, float addrspace(1)* %56, align 4
  %58 = fmul contract float %55, %4
  %59 = fadd contract float %42, %58
  %60 = fptosi float %59 to i32
  %61 = sitofp i32 %60 to float
  %62 = fsub contract float %59, %61
  %63 = fadd contract float %62, 1.000000e+00
  %64 = fptosi float %63 to i32
  %65 = sitofp i32 %64 to float
  %66 = fsub contract float %63, %65
  %67 = fmul contract float %57, %4
  %68 = fadd contract float %44, %67
  %69 = fptosi float %68 to i32
  %70 = sitofp i32 %69 to float
  %71 = fsub contract float %68, %70
  %72 = fadd contract float %71, 1.000000e+00
  %73 = fptosi float %72 to i32
  %74 = sitofp i32 %73 to float
  %75 = fsub contract float %72, %74
  store float %66, float addrspace(1)* %41, align 8
  store float %75, float addrspace(1)* %43, align 4
  br label %76

76:                                               ; preds = %37, %33
  %77 = add nuw nsw i32 %34, 1
  %78 = icmp eq i32 %77, %5
  br i1 %78, label %79, label %33, !llvm.loop !7

79:                                               ; preds = %76, %7
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
