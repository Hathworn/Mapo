; ModuleID = '../data/hip_kernels/15353/5/main.cu'
source_filename = "../data/hip_kernels/15353/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<int, 3>::Native_vec_" }
%"struct.HIP_vector_base<int, 3>::Native_vec_" = type { [3 x i32] }

@c_size = protected addrspace(4) externally_initialized global %struct.HIP_vector_type zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (%struct.HIP_vector_type addrspace(4)* @c_size to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z11writeKernelPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %21 = getelementptr i8, i8 addrspace(4)* %4, i64 8
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %27 = add i32 %25, %26
  %28 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0), align 4, !tbaa !7
  %29 = icmp ult i32 %11, %28
  %30 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 1), align 4
  %31 = icmp ult i32 %19, %30
  %32 = select i1 %29, i1 %31, i1 false
  %33 = load i32, i32 addrspace(4)* getelementptr inbounds (%struct.HIP_vector_type, %struct.HIP_vector_type addrspace(4)* @c_size, i64 0, i32 0, i32 0, i32 0, i32 0, i64 2), align 4
  %34 = icmp ult i32 %27, %33
  %35 = select i1 %32, i1 %34, i1 false
  %36 = icmp sgt i32 %1, 0
  %37 = select i1 %35, i1 %36, i1 false
  br i1 %37, label %38, label %106

38:                                               ; preds = %2
  %39 = mul i32 %27, %30
  %40 = add i32 %39, %19
  %41 = mul i32 %40, %28
  %42 = add i32 %41, %11
  %43 = mul i32 %42, %1
  %44 = and i32 %1, 7
  %45 = icmp ult i32 %1, 8
  br i1 %45, label %93, label %46

46:                                               ; preds = %38
  %47 = and i32 %1, -8
  br label %48

48:                                               ; preds = %48, %46
  %49 = phi i32 [ 0, %46 ], [ %90, %48 ]
  %50 = phi i32 [ 0, %46 ], [ %91, %48 ]
  %51 = add i32 %49, %43
  %52 = zext i32 %51 to i64
  %53 = uitofp i32 %51 to float
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  store float %53, float addrspace(1)* %54, align 4, !tbaa !10
  %55 = or i32 %49, 1
  %56 = add i32 %55, %43
  %57 = zext i32 %56 to i64
  %58 = uitofp i32 %56 to float
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %58, float addrspace(1)* %59, align 4, !tbaa !10
  %60 = or i32 %49, 2
  %61 = add i32 %60, %43
  %62 = zext i32 %61 to i64
  %63 = uitofp i32 %61 to float
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  store float %63, float addrspace(1)* %64, align 4, !tbaa !10
  %65 = or i32 %49, 3
  %66 = add i32 %65, %43
  %67 = zext i32 %66 to i64
  %68 = uitofp i32 %66 to float
  %69 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  store float %68, float addrspace(1)* %69, align 4, !tbaa !10
  %70 = or i32 %49, 4
  %71 = add i32 %70, %43
  %72 = zext i32 %71 to i64
  %73 = uitofp i32 %71 to float
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  store float %73, float addrspace(1)* %74, align 4, !tbaa !10
  %75 = or i32 %49, 5
  %76 = add i32 %75, %43
  %77 = zext i32 %76 to i64
  %78 = uitofp i32 %76 to float
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float %78, float addrspace(1)* %79, align 4, !tbaa !10
  %80 = or i32 %49, 6
  %81 = add i32 %80, %43
  %82 = zext i32 %81 to i64
  %83 = uitofp i32 %81 to float
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %82
  store float %83, float addrspace(1)* %84, align 4, !tbaa !10
  %85 = or i32 %49, 7
  %86 = add i32 %85, %43
  %87 = zext i32 %86 to i64
  %88 = uitofp i32 %86 to float
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  store float %88, float addrspace(1)* %89, align 4, !tbaa !10
  %90 = add nuw nsw i32 %49, 8
  %91 = add i32 %50, 8
  %92 = icmp eq i32 %91, %47
  br i1 %92, label %93, label %48, !llvm.loop !12

93:                                               ; preds = %48, %38
  %94 = phi i32 [ 0, %38 ], [ %90, %48 ]
  %95 = icmp eq i32 %44, 0
  br i1 %95, label %106, label %96

96:                                               ; preds = %93, %96
  %97 = phi i32 [ %103, %96 ], [ %94, %93 ]
  %98 = phi i32 [ %104, %96 ], [ 0, %93 ]
  %99 = add i32 %97, %43
  %100 = zext i32 %99 to i64
  %101 = uitofp i32 %99 to float
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  store float %101, float addrspace(1)* %102, align 4, !tbaa !10
  %103 = add nuw nsw i32 %97, 1
  %104 = add i32 %98, 1
  %105 = icmp eq i32 %104, %44
  br i1 %105, label %106, label %96, !llvm.loop !14

106:                                              ; preds = %93, %96, %2
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
