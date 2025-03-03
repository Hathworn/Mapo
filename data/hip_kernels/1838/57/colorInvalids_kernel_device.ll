; ModuleID = '../data/hip_kernels/1838/57/main.cu'
source_filename = "../data/hip_kernels/1838/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20colorInvalids_kernelP15HIP_vector_typeIhLj4EEPKfii(%struct.HIP_vector_type addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 8
  %12 = ashr exact i32 %11, 8
  %13 = mul nsw i32 %12, %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = shl i32 %16, 8
  %22 = ashr exact i32 %21, 8
  %23 = mul nsw i32 %22, %20
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %15, %2
  %27 = icmp slt i32 %25, %3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %52

29:                                               ; preds = %4
  %30 = shl i32 %25, 8
  %31 = ashr exact i32 %30, 8
  %32 = shl i32 %2, 8
  %33 = ashr exact i32 %32, 8
  %34 = mul nsw i32 %31, %33
  %35 = add nsw i32 %34, %15
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %36, i32 0, i32 0, i32 0, i64 0
  %38 = load i8, i8 addrspace(1)* %37, align 4, !amdgpu.noclobber !5
  %39 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %36, i32 0, i32 0, i32 0, i64 1
  %40 = load i8, i8 addrspace(1)* %39, align 1, !amdgpu.noclobber !5
  %41 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = tail call i1 @llvm.amdgcn.class.f32(float %42, i32 504)
  %44 = uitofp i8 %38 to float
  %45 = fmul contract float %44, 5.000000e-01
  %46 = fptoui float %45 to i8
  %47 = uitofp i8 %40 to float
  %48 = fmul contract float %47, 5.000000e-01
  %49 = fptoui float %48 to i8
  %50 = select i1 %43, i8 %38, i8 %46
  %51 = select i1 %43, i8 %40, i8 %49
  store i8 %50, i8 addrspace(1)* %37, align 4
  store i8 %51, i8 addrspace(1)* %39, align 1
  br label %52

52:                                               ; preds = %29, %4
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
