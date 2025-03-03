; ModuleID = '../data/hip_kernels/2119/6/main.cu'
source_filename = "../data/hip_kernels/2119/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23gpu_histo_kernel_sharedPhPijjE4hist = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z23gpu_histo_kernel_sharedPhPijj(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nuw nsw i32 %12, 24
  %23 = add nuw nsw i32 %22, %20
  %24 = icmp ult i32 %23, 256
  br i1 %24, label %25, label %27

25:                                               ; preds = %4
  %26 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23gpu_histo_kernel_sharedPhPijjE4hist, i32 0, i32 %23
  store i32 0, i32 addrspace(3)* %26, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %25, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp slt i32 %21, 0
  br i1 %28, label %50, label %29

29:                                               ; preds = %27
  %30 = icmp ult i32 %21, %2
  %31 = icmp sgt i32 %13, -1
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp ult i32 %13, %3
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %35, label %50

35:                                               ; preds = %29
  %36 = mul i32 %21, %3
  %37 = add i32 %36, %13
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %38
  %40 = load i8, i8 addrspace(1)* %39, align 1, !tbaa !11, !amdgpu.noclobber !5
  %41 = zext i8 %40 to i32
  %42 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23gpu_histo_kernel_sharedPhPijjE4hist, i32 0, i32 %41
  %43 = atomicrmw add i32 addrspace(3)* %42, i32 1 syncscope("agent-one-as") monotonic, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %24, label %44, label %50

44:                                               ; preds = %35
  %45 = zext i32 %23 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %45
  %47 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ23gpu_histo_kernel_sharedPhPijjE4hist, i32 0, i32 %23
  %48 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !7
  %49 = atomicrmw add i32 addrspace(1)* %46, i32 %48 syncscope("agent-one-as") monotonic, align 4
  br label %50

50:                                               ; preds = %35, %44, %27, %29
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!11 = !{!9, !9, i64 0}
