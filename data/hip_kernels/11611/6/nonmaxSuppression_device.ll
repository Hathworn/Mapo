; ModuleID = '../data/hip_kernels/11611/6/main.cu'
source_filename = "../data/hip_kernels/11611/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i16> }

@g_counter = protected addrspace(1) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @g_counter to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17nonmaxSuppressionPK15HIP_vector_typeIsLj2EEiPKiiiPS0_Pf(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %92

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %19, i32 0, i32 0, i32 0, i64 0
  %21 = bitcast i16 addrspace(1)* %20 to <2 x i16> addrspace(1)*
  %22 = load <2 x i16>, <2 x i16> addrspace(1)* %21, align 4
  %23 = extractelement <2 x i16> %22, i64 1
  %24 = sext i16 %23 to i32
  %25 = extractelement <2 x i16> %22, i64 0
  %26 = sext i16 %25 to i32
  %27 = mul nsw i32 %24, %3
  %28 = add nsw i32 %27, %26
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = add nsw i32 %24, -1
  %33 = add nsw i32 %26, -1
  %34 = mul nsw i32 %32, %3
  %35 = add nsw i32 %34, %33
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = icmp sgt i32 %31, %38
  br i1 %39, label %40, label %92

40:                                               ; preds = %18
  %41 = add nsw i32 %34, %26
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  %45 = icmp sgt i32 %31, %44
  br i1 %45, label %46, label %92

46:                                               ; preds = %40
  %47 = add nsw i32 %26, 1
  %48 = add nsw i32 %34, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = icmp sgt i32 %31, %51
  br i1 %52, label %53, label %92

53:                                               ; preds = %46
  %54 = add nsw i32 %27, %33
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !6
  %58 = icmp sgt i32 %31, %57
  br i1 %58, label %59, label %92

59:                                               ; preds = %53
  %60 = add nsw i32 %27, %47
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !6
  %64 = icmp sgt i32 %31, %63
  br i1 %64, label %65, label %92

65:                                               ; preds = %59
  %66 = add nsw i32 %24, 1
  %67 = mul nsw i32 %66, %3
  %68 = add nsw i32 %67, %33
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !6
  %72 = icmp sgt i32 %31, %71
  br i1 %72, label %73, label %92

73:                                               ; preds = %65
  %74 = add nsw i32 %67, %26
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %75
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !6
  %78 = icmp sgt i32 %31, %77
  br i1 %78, label %79, label %92

79:                                               ; preds = %73
  %80 = add nsw i32 %67, %47
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !6
  %84 = icmp sgt i32 %31, %83
  br i1 %84, label %85, label %92

85:                                               ; preds = %79
  %86 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* @g_counter, i32 -1, i32 2, i32 4, i1 false)
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %87, i32 0, i32 0, i32 0, i64 0
  %89 = bitcast i16 addrspace(1)* %88 to <2 x i16> addrspace(1)*
  store <2 x i16> %22, <2 x i16> addrspace(1)* %89, align 4
  %90 = sitofp i32 %31 to float
  %91 = getelementptr inbounds float, float addrspace(1)* %6, i64 %87
  store float %90, float addrspace(1)* %91, align 4, !tbaa !11
  br label %92

92:                                               ; preds = %79, %85, %18, %40, %46, %53, %59, %65, %73, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #2

attributes #0 = { mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
