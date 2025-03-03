; ModuleID = '../data/hip_kernels/4844/107/main.cu'
source_filename = "../data/hip_kernels/4844/107/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x double> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20KerSortDataParticlesjjPKjPK15HIP_vector_typeIdLj2EEPKdPKS1_IfLj4EEPS2_PdPS7_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type.0 addrspace(1)* nocapture readonly %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6, double addrspace(1)* nocapture writeonly %7, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp ult i32 %18, %0
  br i1 %19, label %20, label %40

20:                                               ; preds = %9
  %21 = icmp ult i32 %18, %1
  %22 = zext i32 %18 to i64
  br i1 %21, label %27, label %23

23:                                               ; preds = %20
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %22
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !5
  %26 = zext i32 %25 to i64
  br label %27

27:                                               ; preds = %20, %23
  %28 = phi i64 [ %26, %23 ], [ %22, %20 ]
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %28
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %22
  %31 = bitcast %struct.HIP_vector_type addrspace(1)* %30 to i8 addrspace(1)*
  %32 = bitcast %struct.HIP_vector_type addrspace(1)* %29 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %31, i8 addrspace(1)* noundef align 16 dereferenceable(16) %32, i64 16, i1 false)
  %33 = getelementptr inbounds double, double addrspace(1)* %4, i64 %28
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !11
  %35 = getelementptr inbounds double, double addrspace(1)* %7, i64 %22
  store double %34, double addrspace(1)* %35, align 8, !tbaa !11
  %36 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %5, i64 %28
  %37 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %22
  %38 = bitcast %struct.HIP_vector_type.0 addrspace(1)* %37 to i8 addrspace(1)*
  %39 = bitcast %struct.HIP_vector_type.0 addrspace(1)* %36 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %38, i8 addrspace(1)* noundef align 16 dereferenceable(16) %39, i64 16, i1 false)
  br label %40

40:                                               ; preds = %27, %9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
