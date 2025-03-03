; ModuleID = '../data/hip_kernels/2824/139/main.cu'
source_filename = "../data/hip_kernels/2824/139/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16reduceUnrolling2PiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = add i32 %13, %10
  %17 = icmp ult i32 %16, %2
  br i1 %17, label %18, label %26

18:                                               ; preds = %3
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  %22 = zext i32 %13 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = add nsw i32 %24, %21
  store i32 %25, i32 addrspace(1)* %23, align 4, !tbaa !7
  br label %26

26:                                               ; preds = %18, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp ult i16 %9, 2
  br i1 %27, label %31, label %28

28:                                               ; preds = %26
  %29 = zext i32 %4 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %29
  br label %33

31:                                               ; preds = %44, %26
  %32 = icmp eq i32 %4, 0
  br i1 %32, label %46, label %50

33:                                               ; preds = %28, %44
  %34 = phi i32 [ %10, %28 ], [ %35, %44 ]
  %35 = lshr i32 %34, 1
  %36 = icmp ult i32 %4, %35
  br i1 %36, label %37, label %44

37:                                               ; preds = %33
  %38 = add nuw nsw i32 %35, %4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7
  %42 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %43 = add nsw i32 %42, %41
  store i32 %43, i32 addrspace(1)* %30, align 4, !tbaa !7
  br label %44

44:                                               ; preds = %37, %33
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %45 = icmp ult i32 %34, 4
  br i1 %45, label %31, label %33, !llvm.loop !11

46:                                               ; preds = %31
  %47 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %48 = zext i32 %5 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  store i32 %47, i32 addrspace(1)* %49, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %46, %31
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
