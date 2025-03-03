; ModuleID = '../data/hip_kernels/18492/6/main.cu'
source_filename = "../data/hip_kernels/18492/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

$_ZL23yuv422_to_yuv444_kernelPKvPvi = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL23yuv422_to_yuv444_kernelPKvPvi(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 comdat {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sdiv i32 %2, 2
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %52

15:                                               ; preds = %3
  %16 = bitcast i8 addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %17 = shl nsw i32 %12, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %16, i64 %18
  %20 = bitcast i8 addrspace(1)* %1 to %struct.HIP_vector_type addrspace(1)*
  %21 = mul nsw i32 %12, 3
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %20, i64 %22
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %19, i64 0, i32 0, i32 0, i32 0, i64 0
  %25 = load i8, i8 addrspace(1)* %24, align 4, !amdgpu.noclobber !6
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %16, i64 %18, i32 0, i32 0, i32 0, i64 1
  %27 = load i8, i8 addrspace(1)* %26, align 1, !amdgpu.noclobber !6
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %16, i64 %18, i32 0, i32 0, i32 0, i64 2
  %29 = load i8, i8 addrspace(1)* %28, align 2, !amdgpu.noclobber !6
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %16, i64 %18, i32 0, i32 0, i32 0, i64 3
  %31 = load i8, i8 addrspace(1)* %30, align 1, !amdgpu.noclobber !6
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %19, i64 1, i32 0, i32 0, i32 0, i64 0
  %33 = load i8, i8 addrspace(1)* %32, align 4, !amdgpu.noclobber !6
  %34 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %19, i64 1, i32 0, i32 0, i32 0, i64 1
  %35 = load i8, i8 addrspace(1)* %34, align 1, !amdgpu.noclobber !6
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %19, i64 1, i32 0, i32 0, i32 0, i64 2
  %37 = load i8, i8 addrspace(1)* %36, align 2, !amdgpu.noclobber !6
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %19, i64 1, i32 0, i32 0, i32 0, i64 3
  %39 = load i8, i8 addrspace(1)* %38, align 1, !amdgpu.noclobber !6
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 0, i32 0, i32 0, i32 0, i64 0
  store i8 %27, i8 addrspace(1)* %40, align 4
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %20, i64 %22, i32 0, i32 0, i32 0, i64 1
  store i8 %25, i8 addrspace(1)* %41, align 1
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %20, i64 %22, i32 0, i32 0, i32 0, i64 2
  store i8 %29, i8 addrspace(1)* %42, align 2
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %20, i64 %22, i32 0, i32 0, i32 0, i64 3
  store i8 %31, i8 addrspace(1)* %43, align 1
  %44 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 1, i32 0, i32 0, i32 0, i64 0
  store i8 %25, i8 addrspace(1)* %44, align 4
  %45 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 1, i32 0, i32 0, i32 0, i64 1
  store i8 %29, i8 addrspace(1)* %45, align 1
  %46 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 1, i32 0, i32 0, i32 0, i64 2
  store i8 %35, i8 addrspace(1)* %46, align 2
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 1, i32 0, i32 0, i32 0, i64 3
  store i8 %33, i8 addrspace(1)* %47, align 1
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 2, i32 0, i32 0, i32 0, i64 0
  store i8 %37, i8 addrspace(1)* %48, align 4
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 2, i32 0, i32 0, i32 0, i64 1
  store i8 %39, i8 addrspace(1)* %49, align 1
  %50 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 2, i32 0, i32 0, i32 0, i64 2
  store i8 %33, i8 addrspace(1)* %50, align 2
  %51 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %23, i64 2, i32 0, i32 0, i32 0, i64 3
  store i8 %37, i8 addrspace(1)* %51, align 1
  br label %52

52:                                               ; preds = %3, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
