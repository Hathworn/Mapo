; ModuleID = '../data/hip_kernels/9576/36/main.cu'
source_filename = "../data/hip_kernels/9576/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z20kernel_modtest_writePcS_jjj(i8 addrspace(1)* writeonly %0, i8 addrspace(1)* readnone %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 20
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %8
  %10 = bitcast i8 addrspace(1)* %9 to i32 addrspace(1)*
  %11 = icmp ult i8 addrspace(1)* %9, %1
  br i1 %11, label %12, label %32

12:                                               ; preds = %5
  %13 = icmp ult i32 %2, 262144
  br i1 %13, label %14, label %20

14:                                               ; preds = %12, %14
  %15 = phi i32 [ %18, %14 ], [ %2, %12 ]
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %16
  store i32 %3, i32 addrspace(1)* %17, align 4, !tbaa !4
  %18 = add nuw nsw i32 %15, 20
  %19 = icmp ult i32 %15, 262124
  br i1 %19, label %14, label %20, !llvm.loop !8

20:                                               ; preds = %14, %12
  br label %21

21:                                               ; preds = %20, %28
  %22 = phi i64 [ %30, %28 ], [ 0, %20 ]
  %23 = trunc i64 %22 to i32
  %24 = urem i32 %23, 20
  %25 = icmp eq i32 %24, %2
  br i1 %25, label %28, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %22
  store i32 %4, i32 addrspace(1)* %27, align 4, !tbaa !4
  br label %28

28:                                               ; preds = %21, %26
  %29 = add nuw nsw i64 %22, 1
  %30 = and i64 %29, 4294967295
  %31 = icmp ult i32 %23, 262143
  br i1 %31, label %21, label %32, !llvm.loop !10

32:                                               ; preds = %28, %5
  ret void
}

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
