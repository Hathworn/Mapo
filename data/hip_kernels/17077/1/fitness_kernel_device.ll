; ModuleID = '../data/hip_kernels/17077/1/main.cu'
source_filename = "../data/hip_kernels/17077/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@cache = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14fitness_kernelPiS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %5
  %7 = load i32, i32 addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %8 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 %3
  store i32 0, i32 addrspace(3)* %8, align 4, !tbaa !5
  %9 = icmp ugt i32 %4, %3
  br i1 %9, label %10, label %21

10:                                               ; preds = %2
  %11 = zext i32 %3 to i64
  %12 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %11
  %13 = load i32, i32 addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = sub nsw i32 %7, %13
  %15 = tail call i32 @llvm.abs.i32(i32 %14, i1 true)
  %16 = icmp eq i32 %7, %13
  %17 = sub i32 %4, %3
  %18 = icmp eq i32 %15, %17
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %10
  store i32 1, i32 addrspace(3)* %8, align 4, !tbaa !5
  br label %21

21:                                               ; preds = %10, %20, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !10, !invariant.load !9
  %26 = icmp ult i16 %25, 2
  br i1 %26, label %41, label %27

27:                                               ; preds = %21
  %28 = zext i16 %25 to i32
  br label %29

29:                                               ; preds = %27, %39
  %30 = phi i32 [ %31, %39 ], [ %28, %27 ]
  %31 = lshr i32 %30, 1
  %32 = icmp ult i32 %3, %31
  br i1 %32, label %33, label %39

33:                                               ; preds = %29
  %34 = add nuw nsw i32 %31, %3
  %35 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 %34
  %36 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %37 = load i32, i32 addrspace(3)* %8, align 4, !tbaa !5
  %38 = add nsw i32 %37, %36
  store i32 %38, i32 addrspace(3)* %8, align 4, !tbaa !5
  br label %39

39:                                               ; preds = %33, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i32 %30, 4
  br i1 %40, label %41, label %29, !llvm.loop !11

41:                                               ; preds = %39, %21
  %42 = icmp eq i32 %3, 0
  br i1 %42, label %43, label %46

43:                                               ; preds = %41
  %44 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 0), align 4, !tbaa !5
  %45 = atomicrmw add i32 addrspace(1)* %1, i32 %44 syncscope("agent-one-as") monotonic, align 4
  br label %46

46:                                               ; preds = %43, %41
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
