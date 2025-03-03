; ModuleID = '../data/hip_kernels/9000/25/main.cu'
source_filename = "../data/hip_kernels/9000/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10repositionP15HIP_vector_typeIdLj4EES1_S1_S1_m(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %3, i64 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = zext i32 %14 to i64
  %16 = icmp ult i64 %15, %4
  br i1 %16, label %17, label %33

17:                                               ; preds = %5
  %18 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %15
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %15
  %20 = bitcast %struct.HIP_vector_type addrspace(1)* %19 to i8 addrspace(1)*
  %21 = bitcast %struct.HIP_vector_type addrspace(1)* %18 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %20, i8 addrspace(1)* noundef align 32 dereferenceable(32) %21, i64 32, i1 false)
  %22 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %15
  %23 = add i64 %15, %4
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %23
  %25 = bitcast %struct.HIP_vector_type addrspace(1)* %24 to i8 addrspace(1)*
  %26 = bitcast %struct.HIP_vector_type addrspace(1)* %22 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %25, i8 addrspace(1)* noundef align 32 dereferenceable(32) %26, i64 32, i1 false)
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %15
  %28 = shl i64 %4, 1
  %29 = add i64 %28, %15
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %29
  %31 = bitcast %struct.HIP_vector_type addrspace(1)* %30 to i8 addrspace(1)*
  %32 = bitcast %struct.HIP_vector_type addrspace(1)* %27 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %31, i8 addrspace(1)* noundef align 32 dereferenceable(32) %32, i64 32, i1 false)
  br label %33

33:                                               ; preds = %17, %5
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
