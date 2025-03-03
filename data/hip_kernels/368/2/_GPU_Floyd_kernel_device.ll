; ModuleID = '../data/hip_kernels/368/2/main.cu'
source_filename = "../data/hip_kernels/368/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17_GPU_Floyd_kerneliPiS_iE4best = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z17_GPU_Floyd_kerneliPiS_i(i32 %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %43

15:                                               ; preds = %4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = mul i32 %16, %3
  %18 = add i32 %13, %17
  %19 = icmp eq i32 %12, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %15
  %21 = add i32 %17, %0
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %24, i32 addrspace(3)* @_ZZ17_GPU_Floyd_kerneliPiS_iE4best, align 4, !tbaa !7
  br label %25

25:                                               ; preds = %20, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = load i32, i32 addrspace(3)* @_ZZ17_GPU_Floyd_kerneliPiS_iE4best, align 4, !tbaa !7
  %27 = icmp sgt i32 %26, 10
  br i1 %27, label %43, label %28

28:                                               ; preds = %25
  %29 = mul nsw i32 %3, %0
  %30 = add nsw i32 %13, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %43, label %35

35:                                               ; preds = %28
  %36 = add nsw i32 %33, %26
  %37 = sext i32 %18 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = icmp slt i32 %36, %39
  br i1 %40, label %41, label %43

41:                                               ; preds = %35
  store i32 %36, i32 addrspace(1)* %38, align 4, !tbaa !7
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %37
  store i32 %0, i32 addrspace(1)* %42, align 4, !tbaa !7
  br label %43

43:                                               ; preds = %25, %35, %41, %28, %4
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
