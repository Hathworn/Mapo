; ModuleID = '../data/hip_kernels/6745/3/main.cu'
source_filename = "../data/hip_kernels/6745/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9gpu_checkiPmPjmE3tmp = internal addrspace(3) global [16 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z9gpu_checkiPmPjm(i32 %0, i64 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp ult i32 %12, 16
  br i1 %14, label %15, label %17

15:                                               ; preds = %4
  %16 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9gpu_checkiPmPjmE3tmp, i32 0, i32 %12
  store i32 0, i32 addrspace(3)* %16, align 4, !tbaa !7
  br label %17

17:                                               ; preds = %15, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp slt i32 %13, %0
  br i1 %18, label %19, label %40

19:                                               ; preds = %17
  %20 = mul nsw i32 %0, 3
  %21 = add nsw i32 %13, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %22
  %24 = load i64, i64 addrspace(1)* %23, align 8, !tbaa !11, !amdgpu.noclobber !5
  %25 = icmp ult i64 %24, %3
  br i1 %25, label %26, label %32

26:                                               ; preds = %19
  %27 = lshr i32 %12, 5
  %28 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9gpu_checkiPmPjmE3tmp, i32 0, i32 %27
  %29 = and i32 %12, 31
  %30 = shl nuw i32 1, %29
  %31 = atomicrmw or i32 addrspace(3)* %28, i32 %30 syncscope("agent-one-as") monotonic, align 4
  br label %32

32:                                               ; preds = %26, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %14, label %33, label %40

33:                                               ; preds = %32
  %34 = getelementptr inbounds [16 x i32], [16 x i32] addrspace(3)* @_ZZ9gpu_checkiPmPjmE3tmp, i32 0, i32 %12
  %35 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !7
  %36 = shl i32 %10, 7
  %37 = add nuw i32 %36, %12
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  store i32 %35, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %32, %33, %17
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"long", !9, i64 0}
