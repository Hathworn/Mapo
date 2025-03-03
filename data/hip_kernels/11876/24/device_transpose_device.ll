; ModuleID = '../data/hip_kernels/11876/24/main.cu'
source_filename = "../data/hip_kernels/11876/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_n_inputs = protected addrspace(4) externally_initialized global i32 0, align 4
@d_n_inputs_cols = protected addrspace(4) externally_initialized global i32 0, align 4
@d_nhid_cols = protected addrspace(4) externally_initialized global i32 0, align 4
@d_w = protected addrspace(4) externally_initialized global float* null, align 8
@d_wtr = protected addrspace(4) externally_initialized global float* null, align 8
@llvm.compiler.used = appending addrspace(1) global [5 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_n_inputs to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_n_inputs_cols to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @d_nhid_cols to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_w to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (float* addrspace(4)* @d_wtr to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16device_transposev() local_unnamed_addr #0 {
  %1 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %2 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %3 = getelementptr i8, i8 addrspace(4)* %2, i64 4
  %4 = bitcast i8 addrspace(4)* %3 to i16 addrspace(4)*
  %5 = load i16, i16 addrspace(4)* %4, align 4, !range !4, !invariant.load !5
  %6 = zext i16 %5 to i32
  %7 = mul i32 %1, %6
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %9 = add i32 %7, %8
  %10 = load i32, i32 addrspace(4)* @d_n_inputs, align 4, !tbaa !7
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %27

12:                                               ; preds = %0
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = load float*, float* addrspace(4)* @d_w, align 8, !tbaa !11
  %15 = load i32, i32 addrspace(4)* @d_n_inputs_cols, align 4, !tbaa !7
  %16 = mul nsw i32 %15, %13
  %17 = add nsw i32 %16, %9
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %14, i64 %18
  %20 = load float, float* %19, align 4, !tbaa !13
  %21 = load float*, float* addrspace(4)* @d_wtr, align 8, !tbaa !11
  %22 = load i32, i32 addrspace(4)* @d_nhid_cols, align 4, !tbaa !7
  %23 = mul nsw i32 %22, %9
  %24 = add nsw i32 %23, %13
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %21, i64 %25
  store float %20, float* %26, align 4, !tbaa !13
  br label %27

27:                                               ; preds = %0, %12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !9, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
