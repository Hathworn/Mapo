; ModuleID = '../data/hip_kernels/5994/11/main.cu'
source_filename = "../data/hip_kernels/5994/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13reduceUnroll2PiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = shl i32 %10, 1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = add i32 %12, %9
  %17 = icmp ult i32 %16, %2
  br i1 %17, label %18, label %26

18:                                               ; preds = %3
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i32 %12 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = add nsw i32 %24, %21
  store i32 %25, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %26

26:                                               ; preds = %18, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp ult i32 %12, %2
  br i1 %27, label %28, label %52

28:                                               ; preds = %26
  %29 = icmp ult i16 %8, 2
  br i1 %29, label %33, label %30

30:                                               ; preds = %28
  %31 = zext i32 %11 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %31
  br label %35

33:                                               ; preds = %46, %28
  %34 = icmp eq i32 %11, 0
  br i1 %34, label %48, label %52

35:                                               ; preds = %30, %46
  %36 = phi i32 [ %9, %30 ], [ %37, %46 ]
  %37 = lshr i32 %36, 1
  %38 = icmp ult i32 %11, %37
  br i1 %38, label %39, label %46

39:                                               ; preds = %35
  %40 = add nuw nsw i32 %37, %11
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7
  %44 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %45 = add nsw i32 %44, %43
  store i32 %45, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %46

46:                                               ; preds = %39, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %47 = icmp ult i32 %36, 4
  br i1 %47, label %33, label %35, !llvm.loop !11

48:                                               ; preds = %33
  %49 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %50 = zext i32 %4 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  store i32 %49, i32 addrspace(1)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %33, %48, %26
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
