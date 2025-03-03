; ModuleID = '../data/hip_kernels/9664/19/main.cu'
source_filename = "../data/hip_kernels/9664/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x double> }

@shaccelerations = external hidden local_unnamed_addr addrspace(3) global [0 x %struct.HIP_vector_type], align 32

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11sum_partialP15HIP_vector_typeIdLj4EES1_j(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp ult i32 %12, %2
  br i1 %13, label %14, label %35

14:                                               ; preds = %3
  %15 = zext i32 %12 to i64
  %16 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 0
  %17 = load double, double addrspace(1)* %16, align 32, !amdgpu.noclobber !5
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 1
  %19 = load double, double addrspace(1)* %18, align 8, !amdgpu.noclobber !5
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15, i32 0, i32 0, i32 0, i64 2
  %21 = load double, double addrspace(1)* %20, align 16, !amdgpu.noclobber !5
  %22 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15
  %23 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %11
  %24 = bitcast %struct.HIP_vector_type addrspace(3)* %23 to i8 addrspace(3)*
  %25 = bitcast %struct.HIP_vector_type addrspace(1)* %22 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 32 dereferenceable(32) %24, i8 addrspace(1)* noundef align 32 dereferenceable(32) %25, i64 32, i1 false)
  %26 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %11, i32 0, i32 0, i32 0, i32 0
  %27 = load double, double addrspace(3)* %26, align 32, !tbaa !7
  %28 = fadd contract double %17, %27
  %29 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %11, i32 0, i32 0, i32 0, i32 1
  %30 = load double, double addrspace(3)* %29, align 8, !tbaa !7
  %31 = fadd contract double %19, %30
  %32 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %11, i32 0, i32 0, i32 0, i32 2
  %33 = load double, double addrspace(3)* %32, align 16, !tbaa !7
  %34 = fadd contract double %21, %33
  store double %28, double addrspace(1)* %16, align 32
  store double %31, double addrspace(1)* %18, align 8
  store double %34, double addrspace(1)* %20, align 16
  br label %35

35:                                               ; preds = %3, %14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
