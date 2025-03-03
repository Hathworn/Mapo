; ModuleID = '../data/hip_kernels/3573/72/main.cu'
source_filename = "../data/hip_kernels/3573/72/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z36convertPointCloudToDepthImage_kernelPjPK15HIP_vector_typeIfLj4EEiiiffffPKfS5_(i32 addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, float %5, float %6, float %7, float %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = icmp slt i32 %20, %4
  br i1 %21, label %22, label %96

22:                                               ; preds = %11
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i64 0
  %25 = load float, float addrspace(1)* %24, align 16, !amdgpu.noclobber !5
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i64 1
  %27 = load float, float addrspace(1)* %26, align 4, !amdgpu.noclobber !5
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %23, i32 0, i32 0, i32 0, i64 2
  %29 = load float, float addrspace(1)* %28, align 8, !amdgpu.noclobber !5
  %30 = load float, float addrspace(1)* %10, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = fmul contract float %25, %30
  %32 = getelementptr inbounds float, float addrspace(1)* %10, i64 1
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fmul contract float %27, %33
  %35 = fadd contract float %31, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %10, i64 2
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fmul contract float %29, %37
  %39 = fadd contract float %35, %38
  %40 = load float, float addrspace(1)* %9, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fadd contract float %40, %39
  %42 = getelementptr inbounds float, float addrspace(1)* %10, i64 3
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fmul contract float %25, %43
  %45 = getelementptr inbounds float, float addrspace(1)* %10, i64 4
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = fmul contract float %27, %46
  %48 = fadd contract float %44, %47
  %49 = getelementptr inbounds float, float addrspace(1)* %10, i64 5
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = fmul contract float %29, %50
  %52 = fadd contract float %48, %51
  %53 = getelementptr inbounds float, float addrspace(1)* %9, i64 1
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = fadd contract float %54, %52
  %56 = getelementptr inbounds float, float addrspace(1)* %10, i64 6
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fmul contract float %25, %57
  %59 = getelementptr inbounds float, float addrspace(1)* %10, i64 7
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = fmul contract float %27, %60
  %62 = fadd contract float %58, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %10, i64 8
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fmul contract float %29, %64
  %66 = fadd contract float %62, %65
  %67 = getelementptr inbounds float, float addrspace(1)* %9, i64 2
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !5
  %69 = fadd contract float %68, %66
  %70 = fdiv contract float 1.000000e+00, %69
  %71 = fmul contract float %41, %7
  %72 = fmul contract float %71, %70
  %73 = fadd contract float %72, %5
  %74 = tail call float @llvm.rint.f32(float %73)
  %75 = fptosi float %74 to i32
  %76 = fmul contract float %55, %8
  %77 = fmul contract float %76, %70
  %78 = fadd contract float %77, %6
  %79 = tail call float @llvm.rint.f32(float %78)
  %80 = fptosi float %79 to i32
  %81 = icmp sgt i32 %75, -1
  br i1 %81, label %82, label %96

82:                                               ; preds = %22
  %83 = icmp slt i32 %75, %2
  %84 = icmp sgt i32 %80, -1
  %85 = select i1 %83, i1 %84, i1 false
  %86 = icmp slt i32 %80, %3
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %96

88:                                               ; preds = %82
  %89 = mul nsw i32 %80, %2
  %90 = add nsw i32 %89, %75
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = fmul contract float %29, 1.000000e+03
  %94 = fptoui float %93 to i32
  %95 = atomicrmw umin i32 addrspace(1)* %92, i32 %94 syncscope("agent-one-as") monotonic, align 4
  br label %96

96:                                               ; preds = %82, %88, %22, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
