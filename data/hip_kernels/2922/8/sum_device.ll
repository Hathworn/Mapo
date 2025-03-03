; ModuleID = '../data/hip_kernels/2922/8/main.cu'
source_filename = "../data/hip_kernels/2922/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3sumPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = sdiv i32 %3, 2
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp slt i32 %14, %5
  br i1 %15, label %16, label %26

16:                                               ; preds = %4
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !5
  %20 = add nsw i32 %14, %5
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = add nsw i32 %23, %19
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %17
  store i32 %24, i32 addrspace(1)* %25, align 4, !tbaa !7
  br label %26

26:                                               ; preds = %16, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = add i32 %3, 3
  %28 = icmp ult i32 %27, 7
  br i1 %28, label %33, label %29

29:                                               ; preds = %26
  %30 = sdiv i32 %3, 4
  %31 = sext i32 %14 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %31
  br label %35

33:                                               ; preds = %45, %26
  %34 = icmp eq i32 %14, 0
  br i1 %34, label %48, label %50

35:                                               ; preds = %29, %45
  %36 = phi i32 [ %30, %29 ], [ %46, %45 ]
  %37 = icmp ult i32 %14, %36
  br i1 %37, label %38, label %45

38:                                               ; preds = %35
  %39 = add i32 %36, %14
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7
  %43 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %44 = add nsw i32 %43, %42
  store i32 %44, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %45

45:                                               ; preds = %38, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = lshr i32 %36, 1
  %47 = icmp ult i32 %36, 2
  br i1 %47, label %33, label %35, !llvm.loop !11

48:                                               ; preds = %33
  %49 = load i32, i32 addrspace(1)* %2, align 4, !tbaa !7
  store i32 %49, i32 addrspace(1)* %1, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %48, %33
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
