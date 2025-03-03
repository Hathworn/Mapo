; ModuleID = '../data/hip_kernels/15944/16/main.cu'
source_filename = "../data/hip_kernels/15944/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z37refine_computeBestDepthSimMaps_kernelPfiS_iP15HIP_vector_typeIfLj3EEiS2_iiif(float addrspace(1)* nocapture writeonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2, i32 %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, i32 %5, %struct.HIP_vector_type addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, float %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %8
  %30 = icmp slt i32 %28, %9
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %95

32:                                               ; preds = %11
  %33 = mul nsw i32 %28, %7
  %34 = add nsw i32 %33, %20
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %35, i32 0, i32 0, i32 0, i32 0, i64 0
  %37 = load float, float addrspace(1)* %36, align 4
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %35, i32 0, i32 0, i32 0, i32 0, i64 1
  %39 = load float, float addrspace(1)* %38, align 4
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %35, i32 0, i32 0, i32 0, i32 0, i64 2
  %41 = load float, float addrspace(1)* %40, align 4
  %42 = mul nsw i32 %28, %5
  %43 = add nsw i32 %42, %20
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %44, i32 0, i32 0, i32 0, i32 0, i64 0
  %46 = bitcast float addrspace(1)* %45 to <2 x float> addrspace(1)*
  %47 = load <2 x float>, <2 x float> addrspace(1)* %46, align 4
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %44, i32 0, i32 0, i32 0, i32 0, i64 2
  %49 = load float, float addrspace(1)* %48, align 4
  %50 = extractelement <2 x float> %47, i64 0
  %51 = extractelement <2 x float> %47, i64 1
  %52 = fcmp contract olt float %50, %51
  %53 = select contract i1 %52, float %37, float %39
  %54 = select contract i1 %52, float %50, float %51
  %55 = fcmp contract olt float %49, %54
  %56 = select contract i1 %55, float %41, float %53
  %57 = select contract i1 %55, float %49, float %54
  %58 = fadd contract float %50, 1.000000e+00
  %59 = fmul contract float %58, 5.000000e-01
  %60 = fadd contract float %49, 1.000000e+00
  %61 = fmul contract float %60, 5.000000e-01
  %62 = fadd contract float %51, 1.000000e+00
  %63 = fmul contract float %62, 5.000000e-01
  %64 = fcmp contract ogt float %59, %63
  %65 = fcmp contract ogt float %61, %63
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %80

67:                                               ; preds = %32
  %68 = fsub contract float %61, %59
  %69 = fadd contract float %59, %61
  %70 = fmul contract float %63, 2.000000e+00
  %71 = fsub contract float %69, %70
  %72 = fmul contract float %71, 2.000000e+00
  %73 = fneg contract float %68
  %74 = fdiv contract float %73, %72
  %75 = fadd contract float %37, %41
  %76 = fmul contract float %75, 5.000000e-01
  %77 = fsub contract float %76, %37
  %78 = fmul contract float %77, %74
  %79 = fadd contract float %76, %78
  br label %80

80:                                               ; preds = %32, %67
  %81 = phi float [ %79, %67 ], [ -1.000000e+00, %32 ]
  %82 = fcmp contract ogt float %81, 0.000000e+00
  %83 = select i1 %82, float %81, float %56
  %84 = fcmp contract olt float %57, %10
  %85 = select contract i1 %84, float %57, float 1.000000e+00
  %86 = mul nsw i32 %28, %1
  %87 = add nsw i32 %86, %20
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  store float %85, float addrspace(1)* %89, align 4, !tbaa !7
  %90 = select contract i1 %84, float %83, float -1.000000e+00
  %91 = mul nsw i32 %28, %3
  %92 = add nsw i32 %91, %20
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  store float %90, float addrspace(1)* %94, align 4, !tbaa !7
  br label %95

95:                                               ; preds = %80, %11
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
