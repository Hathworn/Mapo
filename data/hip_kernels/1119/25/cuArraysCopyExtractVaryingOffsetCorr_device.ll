; ModuleID = '../data/hip_kernels/1119/25/main.cu'
source_filename = "../data/hip_kernels/1119/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z36cuArraysCopyExtractVaryingOffsetCorrPKfiiPfiiPiiPK15HIP_vector_typeIiLj2EE(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture writeonly %6, i32 %7, %struct.HIP_vector_type addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = add i32 %18, %11
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !5, !invariant.load !6
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = add i32 %26, %20
  %28 = sext i32 %10 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %28, i32 0, i32 0, i32 0, i64 0
  %30 = load i32, i32 addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !6
  %31 = sdiv i32 %4, -2
  %32 = add i32 %30, %31
  %33 = add i32 %32, %19
  %34 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %28, i32 0, i32 0, i32 0, i64 1
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = sdiv i32 %5, -2
  %37 = add i32 %35, %36
  %38 = add i32 %37, %27
  %39 = icmp slt i32 %19, %4
  %40 = icmp slt i32 %27, %5
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %68

42:                                               ; preds = %9
  %43 = mul i32 %10, %4
  %44 = add i32 %19, %43
  %45 = mul i32 %44, %5
  %46 = add i32 %45, %27
  %47 = icmp sgt i32 %33, -1
  %48 = icmp sgt i32 %38, -1
  %49 = select i1 %47, i1 %48, i1 false
  %50 = icmp slt i32 %33, %1
  %51 = select i1 %49, i1 %50, i1 false
  %52 = icmp slt i32 %38, %2
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %62

54:                                               ; preds = %42
  %55 = mul i32 %10, %1
  %56 = add i32 %33, %55
  %57 = mul i32 %56, %2
  %58 = add i32 %57, %38
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !10, !amdgpu.noclobber !6
  br label %62

62:                                               ; preds = %42, %54
  %63 = phi float [ %61, %54 ], [ 0.000000e+00, %42 ]
  %64 = phi i32 [ 1, %54 ], [ 0, %42 ]
  %65 = sext i32 %46 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %3, i64 %65
  store float %63, float addrspace(1)* %66, align 4, !tbaa !10
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %65
  store i32 %64, i32 addrspace(1)* %67, align 4, !tbaa !12
  br label %68

68:                                               ; preds = %62, %9
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
