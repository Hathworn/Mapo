; ModuleID = '../data/hip_kernels/1838/48/main.cu'
source_filename = "../data/hip_kernels/1838/48/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z38blendFloatImageFloatLabelToRGBA_kernelP15HIP_vector_typeIhLj4EEPKfS3_iiff(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = shl i32 %8, 8
  %15 = ashr exact i32 %14, 8
  %16 = mul nsw i32 %15, %13
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = shl i32 %19, 8
  %25 = ashr exact i32 %24, 8
  %26 = mul nsw i32 %25, %23
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %18, %3
  %30 = icmp slt i32 %28, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %61

32:                                               ; preds = %7
  %33 = shl i32 %28, 8
  %34 = ashr exact i32 %33, 8
  %35 = shl i32 %3, 8
  %36 = ashr exact i32 %35, 8
  %37 = mul nsw i32 %34, %36
  %38 = add nsw i32 %37, %18
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = fmul contract float %41, 5.000000e-01
  %43 = fadd contract float %42, 1.280000e+02
  %44 = fptoui float %43 to i8
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = tail call i1 @llvm.amdgcn.class.f32(float %46, i32 504)
  %48 = xor i1 %47, true
  %49 = fcmp contract olt float %46, %5
  %50 = select i1 %48, i1 true, i1 %49
  %51 = fcmp contract ogt float %46, %6
  %52 = select i1 %50, i1 true, i1 %51
  %53 = uitofp i8 %44 to float
  %54 = fmul contract float %53, 0x3FE3333340000000
  %55 = fptoui float %54 to i8
  %56 = select i1 %52, i8 %44, i8 %55
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %39, i32 0, i32 0, i32 0, i64 0
  store i8 %56, i8 addrspace(1)* %57, align 4
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %39, i32 0, i32 0, i32 0, i64 1
  store i8 %56, i8 addrspace(1)* %58, align 1
  %59 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %39, i32 0, i32 0, i32 0, i64 2
  store i8 %44, i8 addrspace(1)* %59, align 2
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %39, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %60, align 1
  br label %61

61:                                               ; preds = %32, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

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
