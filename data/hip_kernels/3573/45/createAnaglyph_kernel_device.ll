; ModuleID = '../data/hip_kernels/3573/45/main.cu'
source_filename = "../data/hip_kernels/3573/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i8> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21createAnaglyph_kernelP15HIP_vector_typeIhLj4EEPKS0_S3_iii(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sub nsw i32 %15, %5
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %15, %3
  %26 = icmp slt i32 %24, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %78

28:                                               ; preds = %6
  %29 = mul nsw i32 %24, %3
  %30 = add nsw i32 %29, %15
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %31
  %33 = bitcast %struct.HIP_vector_type addrspace(1)* %32 to i32 addrspace(1)*
  %34 = load i32, i32 addrspace(1)* %33, align 4, !amdgpu.noclobber !5
  %35 = trunc i32 %34 to i8
  %36 = lshr i32 %34, 8
  %37 = trunc i32 %36 to i8
  %38 = lshr i32 %34, 16
  %39 = trunc i32 %38 to i8
  %40 = uitofp i8 %35 to float
  %41 = fmul contract float %40, 0x3FD322D0E0000000
  %42 = uitofp i8 %37 to float
  %43 = fmul contract float %42, 0x3FE2C8B440000000
  %44 = fadd contract float %41, %43
  %45 = uitofp i8 %39 to float
  %46 = fmul contract float %45, 0x3FBD2F1AA0000000
  %47 = fadd contract float %46, %44
  %48 = fptoui float %47 to i8
  %49 = icmp sgt i32 %16, 0
  %50 = icmp slt i32 %16, %3
  %51 = select i1 %49, i1 %50, i1 false
  br i1 %51, label %52, label %72

52:                                               ; preds = %28
  %53 = add nsw i32 %29, %16
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %54
  %56 = bitcast %struct.HIP_vector_type addrspace(1)* %55 to i32 addrspace(1)*
  %57 = load i32, i32 addrspace(1)* %56, align 4, !amdgpu.noclobber !5
  %58 = trunc i32 %57 to i8
  %59 = lshr i32 %57, 8
  %60 = trunc i32 %59 to i8
  %61 = lshr i32 %57, 16
  %62 = trunc i32 %61 to i8
  %63 = uitofp i8 %58 to float
  %64 = fmul contract float %63, 0x3FD322D0E0000000
  %65 = uitofp i8 %60 to float
  %66 = fmul contract float %65, 0x3FE2C8B440000000
  %67 = fadd contract float %64, %66
  %68 = uitofp i8 %62 to float
  %69 = fmul contract float %68, 0x3FBD2F1AA0000000
  %70 = fadd contract float %69, %67
  %71 = fptoui float %70 to i8
  br label %72

72:                                               ; preds = %28, %52
  %73 = phi i8 [ %71, %52 ], [ 0, %28 ]
  %74 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 0
  store i8 %48, i8 addrspace(1)* %74, align 4
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 1
  store i8 %73, i8 addrspace(1)* %75, align 1
  %76 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 2
  store i8 %73, i8 addrspace(1)* %76, align 2
  %77 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %31, i32 0, i32 0, i32 0, i64 3
  store i8 -1, i8 addrspace(1)* %77, align 1
  br label %78

78:                                               ; preds = %72, %6
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
