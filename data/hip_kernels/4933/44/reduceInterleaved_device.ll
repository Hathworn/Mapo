; ModuleID = '../data/hip_kernels/4933/44/main.cu'
source_filename = "../data/hip_kernels/4933/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17reduceInterleavedPiS_j(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = icmp ult i32 %12, %2
  br i1 %15, label %16, label %40

16:                                               ; preds = %3
  %17 = icmp ult i16 %9, 2
  br i1 %17, label %21, label %18

18:                                               ; preds = %16
  %19 = zext i32 %4 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %19
  br label %23

21:                                               ; preds = %34, %16
  %22 = icmp eq i32 %4, 0
  br i1 %22, label %36, label %40

23:                                               ; preds = %18, %34
  %24 = phi i32 [ %10, %18 ], [ %25, %34 ]
  %25 = lshr i32 %24, 1
  %26 = icmp ult i32 %4, %25
  br i1 %26, label %27, label %34

27:                                               ; preds = %23
  %28 = add nuw nsw i32 %25, %4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %14, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7
  %33 = add nsw i32 %32, %31
  store i32 %33, i32 addrspace(1)* %20, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %27, %23
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %24, 4
  br i1 %35, label %21, label %23, !llvm.loop !11

36:                                               ; preds = %21
  %37 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7
  %38 = zext i32 %5 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  store i32 %37, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %21, %36, %3
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
