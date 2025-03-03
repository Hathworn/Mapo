; ModuleID = '../data/hip_kernels/11896/18/main.cu'
source_filename = "../data/hip_kernels/11896/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12KtexFillRectPvPdiimP15HIP_vector_typeIfLj2EEif(i8 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i64 %4, %struct.HIP_vector_type addrspace(1)* nocapture readonly %5, i32 %6, float %7) local_unnamed_addr #0 {
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
  %26 = icmp slt i32 %17, %2
  %27 = icmp slt i32 %25, %3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %100

29:                                               ; preds = %8
  %30 = sext i32 %25 to i64
  %31 = mul i64 %30, %4
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %31
  %33 = shl nsw i32 %17, 2
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8 addrspace(1)* %32, i64 %34
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 1, i32 0, i32 0, i32 0, i64 1
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 0, i32 0, i32 0, i32 0, i64 1
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fsub contract float %37, %39
  %41 = sitofp i32 %17 to float
  %42 = getelementptr %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 0, i32 0, i32 0, i32 0, i64 0
  %43 = load float, float addrspace(1)* %42, align 8, !tbaa !7
  %44 = fsub contract float %41, %43
  %45 = fmul contract float %40, %44
  %46 = sitofp i32 %25 to float
  %47 = fsub contract float %46, %39
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 1, i32 0, i32 0, i32 0, i64 0
  %49 = load float, float addrspace(1)* %48, align 8, !tbaa !7, !amdgpu.noclobber !5
  %50 = fsub contract float %49, %43
  %51 = fmul contract float %47, %50
  %52 = fsub contract float %45, %51
  %53 = fcmp contract ult float %52, 0.000000e+00
  br i1 %53, label %100, label %54

54:                                               ; preds = %29
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 2, i32 0, i32 0, i32 0, i64 1
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = fsub contract float %56, %37
  %58 = fsub contract float %41, %49
  %59 = fmul contract float %58, %57
  %60 = fsub contract float %46, %37
  %61 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 2, i32 0, i32 0, i32 0, i64 0
  %62 = load float, float addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !5
  %63 = fsub contract float %62, %49
  %64 = fmul contract float %60, %63
  %65 = fsub contract float %59, %64
  %66 = fcmp contract ult float %65, 0.000000e+00
  br i1 %66, label %100, label %67

67:                                               ; preds = %54
  %68 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 3, i32 0, i32 0, i32 0, i64 1
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fsub contract float %69, %56
  %71 = fsub contract float %41, %62
  %72 = fmul contract float %71, %70
  %73 = fsub contract float %46, %56
  %74 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 3, i32 0, i32 0, i32 0, i64 0
  %75 = load float, float addrspace(1)* %74, align 8, !tbaa !7, !amdgpu.noclobber !5
  %76 = fsub contract float %75, %62
  %77 = fmul contract float %73, %76
  %78 = fsub contract float %72, %77
  %79 = fcmp contract ult float %78, 0.000000e+00
  br i1 %79, label %100, label %80

80:                                               ; preds = %67
  %81 = fsub contract float %39, %69
  %82 = fsub contract float %41, %75
  %83 = fmul contract float %81, %82
  %84 = fsub contract float %46, %69
  %85 = fsub contract float %43, %75
  %86 = fmul contract float %84, %85
  %87 = fsub contract float %83, %86
  %88 = fcmp contract ult float %87, 0.000000e+00
  br i1 %88, label %100, label %89

89:                                               ; preds = %80
  %90 = sext i32 %6 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %35, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7, !amdgpu.noclobber !5
  %93 = uitofp i8 %92 to float
  %94 = fcmp contract ult float %93, %7
  br i1 %94, label %100, label %95

95:                                               ; preds = %89
  %96 = mul nsw i32 %25, %2
  %97 = add nsw i32 %96, %17
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %98
  store double 1.000000e+00, double addrspace(1)* %99, align 8, !tbaa !10
  br label %100

100:                                              ; preds = %29, %54, %67, %80, %89, %95, %8
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !8, i64 0}
