; ModuleID = '../data/hip_kernels/3439/31/main.cu'
source_filename = "../data/hip_kernels/3439/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }

@c_Size = protected addrspace(4) externally_initialized global %struct.HIP_vector_type zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type addrspace(4)* @c_Size to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26magnitude_threshold_kernelPfS_S_f(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %23 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %29 = add i32 %27, %28
  %30 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_Size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0), align 4, !tbaa !7
  %31 = icmp ult i32 %13, %30
  br i1 %31, label %32, label %84

32:                                               ; preds = %4
  %33 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_Size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4, !tbaa !7
  %34 = icmp ult i32 %21, %33
  %35 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_Size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2), align 4
  %36 = icmp ult i32 %29, %35
  %37 = select i1 %34, i1 %36, i1 false
  br i1 %37, label %38, label %84

38:                                               ; preds = %32
  %39 = mul i32 %33, %29
  %40 = add i32 %39, %21
  %41 = mul i32 %40, %30
  %42 = add i32 %41, %13
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !10, !amdgpu.noclobber !5
  %46 = fmul contract float %45, %45
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !10, !amdgpu.noclobber !5
  %49 = fmul contract float %48, %48
  %50 = fadd contract float %46, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !10, !amdgpu.noclobber !5
  %53 = fmul contract float %52, %52
  %54 = fadd contract float %50, %53
  %55 = fcmp olt float %54, 0x39F0000000000000
  %56 = select i1 %55, float 0x41F0000000000000, float 1.000000e+00
  %57 = fmul float %54, %56
  %58 = tail call float @llvm.sqrt.f32(float %57)
  %59 = bitcast float %58 to i32
  %60 = add nsw i32 %59, -1
  %61 = bitcast i32 %60 to float
  %62 = add nsw i32 %59, 1
  %63 = bitcast i32 %62 to float
  %64 = tail call i1 @llvm.amdgcn.class.f32(float %57, i32 608)
  %65 = select i1 %55, float 0x3EF0000000000000, float 1.000000e+00
  %66 = fneg float %63
  %67 = tail call float @llvm.fma.f32(float %66, float %58, float %57)
  %68 = fcmp ogt float %67, 0.000000e+00
  %69 = fneg float %61
  %70 = tail call float @llvm.fma.f32(float %69, float %58, float %57)
  %71 = fcmp ole float %70, 0.000000e+00
  %72 = select i1 %71, float %61, float %58
  %73 = select i1 %68, float %63, float %72
  %74 = fmul float %65, %73
  %75 = select i1 %64, float %57, float %74
  %76 = fcmp contract ogt float %75, %3
  br i1 %76, label %77, label %84

77:                                               ; preds = %38
  %78 = fdiv contract float %3, %75
  %79 = fmul contract float %45, %78
  store float %79, float addrspace(1)* %44, align 4, !tbaa !10
  %80 = load float, float addrspace(1)* %47, align 4, !tbaa !10
  %81 = fmul contract float %78, %80
  store float %81, float addrspace(1)* %47, align 4, !tbaa !10
  %82 = load float, float addrspace(1)* %51, align 4, !tbaa !10
  %83 = fmul contract float %78, %82
  store float %83, float addrspace(1)* %51, align 4, !tbaa !10
  br label %84

84:                                               ; preds = %38, %77, %4, %32
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
