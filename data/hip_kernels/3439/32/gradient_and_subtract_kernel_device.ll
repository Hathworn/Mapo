; ModuleID = '../data/hip_kernels/3439/32/main.cu'
source_filename = "../data/hip_kernels/3439/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

@c_Size = protected addrspace(4) externally_initialized global %struct.HIP_vector_type zeroinitializer, align 4
@c_Spacing = protected addrspace(4) externally_initialized global %struct.HIP_vector_type.0 zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type addrspace(4)* @c_Size to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type.0 addrspace(4)* @c_Spacing to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28gradient_and_subtract_kernelPfS_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture %2, float addrspace(1)* nocapture %3) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %97

32:                                               ; preds = %4
  %33 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_Size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4, !tbaa !7
  %34 = icmp ult i32 %21, %33
  %35 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_Size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2), align 4
  %36 = icmp ult i32 %29, %35
  %37 = select i1 %34, i1 %36, i1 false
  br i1 %37, label %38, label %97

38:                                               ; preds = %32
  %39 = mul i32 %33, %29
  %40 = add i32 %39, %21
  %41 = mul i32 %40, %30
  %42 = add i32 %41, %13
  %43 = zext i32 %42 to i64
  %44 = add i32 %40, 1
  %45 = mul i32 %44, %30
  %46 = add i32 %45, %13
  %47 = zext i32 %46 to i64
  %48 = add nuw i32 %29, 1
  %49 = mul i32 %33, %48
  %50 = add i32 %49, %21
  %51 = mul i32 %50, %30
  %52 = add i32 %51, %13
  %53 = zext i32 %52 to i64
  %54 = add nsw i32 %30, -1
  %55 = icmp eq i32 %13, %54
  br i1 %55, label %69, label %56

56:                                               ; preds = %38
  %57 = add i32 %42, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !10, !amdgpu.noclobber !5
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !10, !amdgpu.noclobber !5
  %63 = fsub contract float %60, %62
  %64 = load float, float addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(4)* @c_Spacing, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0), align 4, !tbaa !7
  %65 = fdiv contract float %63, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !10, !amdgpu.noclobber !5
  %68 = fsub contract float %67, %65
  store float %68, float addrspace(1)* %66, align 4, !tbaa !10
  br label %69

69:                                               ; preds = %56, %38
  %70 = add nsw i32 %33, -1
  %71 = icmp eq i32 %21, %70
  br i1 %71, label %83, label %72

72:                                               ; preds = %69
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !10
  %75 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !10
  %77 = fsub contract float %74, %76
  %78 = load float, float addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(4)* @c_Spacing, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4, !tbaa !7
  %79 = fdiv contract float %77, %78
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !10
  %82 = fsub contract float %81, %79
  store float %82, float addrspace(1)* %80, align 4, !tbaa !10
  br label %83

83:                                               ; preds = %72, %69
  %84 = add nsw i32 %35, -1
  %85 = icmp eq i32 %29, %84
  br i1 %85, label %97, label %86

86:                                               ; preds = %83
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !10
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !10
  %91 = fsub contract float %88, %90
  %92 = load float, float addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(4)* @c_Spacing, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2), align 4, !tbaa !7
  %93 = fdiv contract float %91, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %43
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !10
  %96 = fsub contract float %95, %93
  store float %96, float addrspace(1)* %94, align 4, !tbaa !10
  br label %97

97:                                               ; preds = %83, %86, %4, %32
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!11 = !{!"float", !8, i64 0}
