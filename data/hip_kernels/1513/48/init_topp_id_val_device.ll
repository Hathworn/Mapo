; ModuleID = '../data/hip_kernels/1513/48/main.cu'
source_filename = "../data/hip_kernels/1513/48/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z16init_topp_id_valPiS_ii(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = icmp ne i32 %6, 0
  %8 = icmp sgt i32 %5, %2
  %9 = select i1 %7, i1 true, i1 %8
  br i1 %9, label %23, label %10

10:                                               ; preds = %4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  br label %16

16:                                               ; preds = %10, %16
  %17 = phi i32 [ %5, %10 ], [ %21, %16 ]
  %18 = mul nsw i32 %17, %3
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  store i32 %18, i32 addrspace(1)* %20, align 4, !tbaa !7
  %21 = add i32 %17, %15
  %22 = icmp sgt i32 %21, %2
  br i1 %22, label %23, label %16, !llvm.loop !11

23:                                               ; preds = %16, %4
  %24 = icmp slt i32 %5, %3
  br i1 %24, label %25, label %39

25:                                               ; preds = %23
  %26 = mul nsw i32 %6, %3
  %27 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %28 = getelementptr i8, i8 addrspace(4)* %27, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !5, !invariant.load !6
  %31 = zext i16 %30 to i32
  br label %32

32:                                               ; preds = %25, %32
  %33 = phi i32 [ %5, %25 ], [ %37, %32 ]
  %34 = add nsw i32 %33, %26
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  store i32 %33, i32 addrspace(1)* %36, align 4, !tbaa !7
  %37 = add i32 %33, %31
  %38 = icmp slt i32 %37, %3
  br i1 %38, label %32, label %39, !llvm.loop !13

39:                                               ; preds = %32, %23
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
