; ModuleID = '../data/hip_kernels/3338/4/main.cu'
source_filename = "../data/hip_kernels/3338/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10copyPrimesPcPyS0_yyi(i8 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture writeonly %2, i64 %3, i64 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl i32 %7, 10
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = or i32 %8, %9
  %11 = mul i32 %10, %5
  %12 = zext i32 %11 to i64
  %13 = add i64 %12, %3
  %14 = sext i32 %5 to i64
  %15 = add i64 %13, %14
  %16 = tail call i64 @llvm.umin.i64(i64 %15, i64 %4)
  %17 = zext i32 %10 to i64
  %18 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %17
  %19 = load i64, i64 addrspace(1)* %18, align 8, !tbaa !5, !amdgpu.noclobber !9
  %20 = icmp eq i64 %13, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %6
  %22 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %19
  store i64 2, i64 addrspace(1)* %22, align 8, !tbaa !5
  %23 = add i64 %19, 1
  br label %24

24:                                               ; preds = %21, %6
  %25 = phi i64 [ %23, %21 ], [ %19, %6 ]
  %26 = or i64 %13, 1
  %27 = icmp ult i64 %26, %16
  br i1 %27, label %29, label %28

28:                                               ; preds = %39, %24
  ret void

29:                                               ; preds = %24, %39
  %30 = phi i64 [ %41, %39 ], [ %26, %24 ]
  %31 = phi i64 [ %40, %39 ], [ %25, %24 ]
  %32 = sub i64 %30, %3
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !10
  %35 = icmp eq i8 %34, 1
  br i1 %35, label %36, label %39

36:                                               ; preds = %29
  %37 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %31
  store i64 %30, i64 addrspace(1)* %37, align 8, !tbaa !5
  %38 = add i64 %31, 1
  br label %39

39:                                               ; preds = %36, %29
  %40 = phi i64 [ %38, %36 ], [ %31, %29 ]
  %41 = add i64 %30, 2
  %42 = icmp ult i64 %41, %16
  br i1 %42, label %29, label %28, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!7, !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
