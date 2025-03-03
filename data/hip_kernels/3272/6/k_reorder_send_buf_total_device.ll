; ModuleID = '../data/hip_kernels/3272/6/main.cu'
source_filename = "../data/hip_kernels/3272/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }

$_ZL24k_reorder_send_buf_totaliiPjS_P15HIP_vector_typeIfLj4EES2_S2_S2_ = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL24k_reorder_send_buf_totaliiPjS_P15HIP_vector_typeIfLj4EES2_S2_S2_(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, %struct.HIP_vector_type addrspace(1)* nocapture readonly %4, %struct.HIP_vector_type addrspace(1)* nocapture readonly %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 comdat {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 9
  %12 = add i32 %11, %9
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %31

14:                                               ; preds = %8
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = icmp eq i32 %17, 10
  br i1 %18, label %19, label %31

19:                                               ; preds = %14
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %15
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %15
  %23 = sext i32 %21 to i64
  %24 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %23
  %25 = bitcast %struct.HIP_vector_type addrspace(1)* %24 to i8 addrspace(1)*
  %26 = bitcast %struct.HIP_vector_type addrspace(1)* %22 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %25, i8 addrspace(1)* noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %27 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %5, i64 %15
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %23
  %29 = bitcast %struct.HIP_vector_type addrspace(1)* %28 to i8 addrspace(1)*
  %30 = bitcast %struct.HIP_vector_type addrspace(1)* %27 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 16 dereferenceable(16) %29, i8 addrspace(1)* noundef align 16 dereferenceable(16) %30, i64 16, i1 false)
  br label %31

31:                                               ; preds = %14, %19, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
