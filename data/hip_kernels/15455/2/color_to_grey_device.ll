; ModuleID = '../data/hip_kernels/15455/2/main.cu'
source_filename = "../data/hip_kernels/15455/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" }
%"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" = type { [3 x i8] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13color_to_greyP15HIP_vector_typeIhLj3EES1_ii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %2
  %23 = icmp slt i32 %21, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %71

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %2
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i32 0, i64 0
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !6
  %31 = uitofp i8 %30 to float
  %32 = fmul contract float %31, 0x3FCB367A00000000
  %33 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i32 0, i64 1
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !6
  %35 = uitofp i8 %34 to float
  %36 = fmul contract float %35, 0x3FE6CCCCC0000000
  %37 = fadd contract float %32, %36
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %28, i32 0, i32 0, i32 0, i32 0, i64 2
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !amdgpu.noclobber !6
  %40 = uitofp i8 %39 to float
  %41 = fmul contract float %40, 0x3FB27BB300000000
  %42 = fadd contract float %37, %41
  %43 = fptoui float %42 to i8
  %44 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %43, i8 addrspace(1)* %44, align 1, !tbaa !7
  %45 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7
  %46 = uitofp i8 %45 to float
  %47 = fmul contract float %46, 0x3FCB367A00000000
  %48 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7
  %49 = uitofp i8 %48 to float
  %50 = fmul contract float %49, 0x3FE6CCCCC0000000
  %51 = fadd contract float %47, %50
  %52 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7
  %53 = uitofp i8 %52 to float
  %54 = fmul contract float %53, 0x3FB27BB300000000
  %55 = fadd contract float %51, %54
  %56 = fptoui float %55 to i8
  %57 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %56, i8 addrspace(1)* %57, align 1, !tbaa !7
  %58 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7
  %59 = uitofp i8 %58 to float
  %60 = fmul contract float %59, 0x3FCB367A00000000
  %61 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7
  %62 = uitofp i8 %61 to float
  %63 = fmul contract float %62, 0x3FE6CCCCC0000000
  %64 = fadd contract float %60, %63
  %65 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7
  %66 = uitofp i8 %65 to float
  %67 = fmul contract float %66, 0x3FB27BB300000000
  %68 = fadd contract float %64, %67
  %69 = fptoui float %68 to i8
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %69, i8 addrspace(1)* %70, align 1, !tbaa !7
  br label %71

71:                                               ; preds = %25, %4
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
