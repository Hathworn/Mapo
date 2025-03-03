; ModuleID = '../data/hip_kernels/3491/39/main.cu'
source_filename = "../data/hip_kernels/3491/39/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@g_mutex = protected addrspace(1) externally_initialized global i32 0, align 4
@g_mutex2 = protected addrspace(1) externally_initialized global i32 0, align 4
@g_q_offsets = protected addrspace(1) externally_initialized global [1 x i32] zeroinitializer, align 4
@g_q_size = protected addrspace(1) externally_initialized global [1 x i32] zeroinitializer, align 4
@llvm.compiler.used = appending addrspace(1) global [4 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @g_mutex to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast (i32 addrspace(1)* @g_mutex2 to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([1 x i32] addrspace(1)* @g_q_offsets to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([1 x i32] addrspace(1)* @g_q_size to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: mustprogress nofree norecurse nounwind
define protected amdgpu_kernel void @_Z13Frontier_copyPjS_S_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !7, !amdgpu.noclobber !6
  %14 = icmp ult i32 %12, %13
  br i1 %14, label %15, label %20

15:                                               ; preds = %3
  %16 = zext i32 %12 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  store i32 %18, i32 addrspace(1)* %19, align 4, !tbaa !7
  br label %20

20:                                               ; preds = %15, %3
  %21 = icmp eq i32 %12, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %20
  store volatile i32 0, i32* addrspacecast (i32 addrspace(1)* @g_mutex to i32*), align 4, !tbaa !7
  store volatile i32 0, i32* addrspacecast (i32 addrspace(1)* @g_mutex2 to i32*), align 4, !tbaa !7
  store volatile i32 0, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_offsets, i64 0, i64 0) to i32*), align 4, !tbaa !7
  store volatile i32 0, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @g_q_size, i64 0, i64 0) to i32*), align 4, !tbaa !7
  br label %23

23:                                               ; preds = %22, %20
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
