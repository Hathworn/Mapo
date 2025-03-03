; ModuleID = '../data/hip_kernels/2011/19/main.cu'
source_filename = "../data/hip_kernels/2011/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }

@c_volSize = protected addrspace(4) externally_initialized global %struct.HIP_vector_type zeroinitializer, align 4
@c_normalize = protected addrspace(4) externally_initialized global i8 0, align 1
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* @c_normalize to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type addrspace(4)* @c_volSize to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z34kernel_normalize_and_add_to_outputPfS_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = and i32 %5, 16777215
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = and i32 %15, 16777215
  %21 = mul i32 %20, %19
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %25 = getelementptr i8, i8 addrspace(4)* %6, i64 8
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !4, !invariant.load !5
  %28 = zext i16 %27 to i32
  %29 = and i32 %24, 16777215
  %30 = mul i32 %29, %28
  %31 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %32 = add i32 %30, %31
  %33 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_volSize, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0), align 4, !tbaa !7
  %34 = icmp ult i32 %14, %33
  br i1 %34, label %35, label %70

35:                                               ; preds = %4
  %36 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_volSize, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4, !tbaa !7
  %37 = icmp ult i32 %23, %36
  %38 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_volSize, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2), align 4
  %39 = icmp ult i32 %32, %38
  %40 = select i1 %37, i1 %39, i1 false
  br i1 %40, label %41, label %70

41:                                               ; preds = %35
  %42 = mul i32 %36, %32
  %43 = add i32 %42, %23
  %44 = mul i32 %43, %33
  %45 = add i32 %44, %14
  %46 = zext i32 %45 to i64
  %47 = load i8, i8 addrspace(4)* @c_normalize, align 1, !tbaa !10, !range !12
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %61, label %49

49:                                               ; preds = %41
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !13, !amdgpu.noclobber !5
  %52 = tail call float @llvm.fabs.f32(float %51)
  %53 = fcmp contract ogt float %52, 0x3EB0C6F7A0000000
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !13
  br i1 %53, label %56, label %67

56:                                               ; preds = %49
  %57 = getelementptr inbounds float, float addrspace(1)* %3, i64 %46
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !13, !amdgpu.noclobber !5
  %59 = fdiv contract float %58, %51
  %60 = fadd contract float %55, %59
  br label %67

61:                                               ; preds = %41
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !13, !amdgpu.noclobber !5
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %46
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !13, !amdgpu.noclobber !5
  %66 = fadd contract float %63, %65
  br label %67

67:                                               ; preds = %49, %56, %61
  %68 = phi float [ %66, %61 ], [ %60, %56 ], [ %55, %49 ]
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  store float %68, float addrspace(1)* %69, align 4, !tbaa !13
  br label %70

70:                                               ; preds = %67, %4, %35
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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
!11 = !{!"bool", !8, i64 0}
!12 = !{i8 0, i8 2}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !8, i64 0}
