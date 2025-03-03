; ModuleID = '../data/hip_kernels/3432/0/main.cu'
source_filename = "../data/hip_kernels/3432/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3addPlS_S_l(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = icmp slt i64 %6, %3
  br i1 %7, label %8, label %24

8:                                                ; preds = %4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i64
  br label %14

14:                                               ; preds = %8, %14
  %15 = phi i64 [ %6, %8 ], [ %22, %14 ]
  %16 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %15
  %17 = load i64, i64 addrspace(1)* %16, align 8, !tbaa !7
  %18 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %15
  %19 = load i64, i64 addrspace(1)* %18, align 8, !tbaa !7
  %20 = mul nsw i64 %19, %17
  %21 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %15
  store i64 %20, i64 addrspace(1)* %21, align 8, !tbaa !7
  %22 = add nuw nsw i64 %15, %13
  %23 = icmp slt i64 %22, %3
  br i1 %23, label %14, label %24, !llvm.loop !11

24:                                               ; preds = %14, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = add i64 %3, 1
  %26 = icmp ult i64 %25, 3
  br i1 %26, label %51, label %27

27:                                               ; preds = %24
  %28 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %29 = getelementptr i8, i8 addrspace(4)* %28, i64 4
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  br label %31

31:                                               ; preds = %27, %48
  %32 = phi i64 [ %3, %27 ], [ %33, %48 ]
  %33 = sdiv i64 %32, 2
  %34 = icmp sgt i64 %33, %6
  br i1 %34, label %35, label %48

35:                                               ; preds = %31
  %36 = load i16, i16 addrspace(4)* %30, align 4, !range !5, !invariant.load !6
  %37 = zext i16 %36 to i64
  br label %38

38:                                               ; preds = %35, %38
  %39 = phi i64 [ %6, %35 ], [ %46, %38 ]
  %40 = add nsw i64 %39, %33
  %41 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %40
  %42 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !7
  %43 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %39
  %44 = load i64, i64 addrspace(1)* %43, align 8, !tbaa !7
  %45 = add nsw i64 %44, %42
  store i64 %45, i64 addrspace(1)* %43, align 8, !tbaa !7
  %46 = add nuw nsw i64 %39, %37
  %47 = icmp slt i64 %46, %33
  br i1 %47, label %38, label %48, !llvm.loop !13

48:                                               ; preds = %38, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = add nsw i64 %33, 1
  %50 = icmp ult i64 %49, 3
  br i1 %50, label %51, label %31, !llvm.loop !14

51:                                               ; preds = %48, %24
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
