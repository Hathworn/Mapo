; ModuleID = '../data/hip_kernels/989/6/main.cu'
source_filename = "../data/hip_kernels/989/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@slack = protected addrspace(1) externally_initialized global [1048576 x i32] zeroinitializer, align 16
@min_in_rows = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@min_in_cols = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@zeros = protected addrspace(1) externally_initialized global [1048576 x i32] zeroinitializer, align 16
@zeros_size_b = protected addrspace(1) externally_initialized global [2 x i32] zeroinitializer, align 4
@row_of_star_at_column = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@column_of_star_at_row = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@cover_row = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@cover_column = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@column_of_prime_at_row = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@row_of_green_at_column = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@max_in_mat_row = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@min_in_mat_col = protected local_unnamed_addr addrspace(1) externally_initialized global [1024 x i32] zeroinitializer, align 16
@d_min_in_mat_vect = protected local_unnamed_addr addrspace(1) externally_initialized global [256 x i32] zeroinitializer, align 16
@d_min_in_mat = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@zeros_size.managed = protected addrspace(1) externally_initialized global i32 0, align 4
@n_matches.managed = protected addrspace(1) externally_initialized global i32 0, align 4
@goto_5.managed = protected addrspace(1) externally_initialized global i8 0, align 1
@repeat_kernel.managed = protected addrspace(1) externally_initialized global i8 0, align 1
@zeros_size = protected addrspace(1) externally_initialized global i32 addrspace(1)* null
@n_matches = protected addrspace(1) externally_initialized global i32 addrspace(1)* null
@goto_5 = protected addrspace(1) externally_initialized global i8 addrspace(1)* null
@repeat_kernel = protected addrspace(1) externally_initialized global i8 addrspace(1)* null
@llvm.compiler.used = appending addrspace(1) global [11 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i8 addrspace(1)* addrspace(1)* @goto_5 to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* @goto_5.managed to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* addrspace(1)* @n_matches to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @n_matches.managed to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i8 addrspace(1)* addrspace(1)* @repeat_kernel to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* @repeat_kernel.managed to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([1048576 x i32] addrspace(1)* @slack to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([1048576 x i32] addrspace(1)* @zeros to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* addrspace(1)* @zeros_size to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @zeros_size.managed to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([2 x i32] addrspace(1)* @zeros_size_b to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15compress_matrixv() local_unnamed_addr #0 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %3 = bitcast i8 addrspace(4)* %2 to i16 addrspace(4)*
  %4 = load i16, i16 addrspace(4)* %3, align 4, !range !4, !invariant.load !5
  %5 = zext i16 %4 to i32
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = mul i32 %6, %5
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %9 = add i32 %7, %8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1048576 x i32], [1048576 x i32] addrspace(1)* @slack, i64 0, i64 %10
  %12 = load i32, i32 addrspace(1)* %11, align 4, !tbaa !7
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %25

14:                                               ; preds = %0
  %15 = load i32 addrspace(1)*, i32 addrspace(1)* addrspace(1)* @zeros_size, align 8
  %16 = atomicrmw add i32 addrspace(1)* %15, i32 1 syncscope("agent-one-as") monotonic, align 4
  %17 = ashr i32 %9, 19
  %18 = and i32 %9, -524288
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds [2 x i32], [2 x i32] addrspace(1)* @zeros_size_b, i64 0, i64 %19
  %21 = atomicrmw add i32 addrspace(1)* %20, i32 1 syncscope("agent-one-as") monotonic, align 4
  %22 = add nsw i32 %21, %18
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [1048576 x i32], [1048576 x i32] addrspace(1)* @zeros, i64 0, i64 %23
  store i32 %9, i32 addrspace(1)* %24, align 4, !tbaa !7
  br label %25

25:                                               ; preds = %14, %0
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
