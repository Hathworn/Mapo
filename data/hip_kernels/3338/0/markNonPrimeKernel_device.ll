; ModuleID = '../data/hip_kernels/3338/0/main.cu'
source_filename = "../data/hip_kernels/3338/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z18markNonPrimeKernelPcyyyyi(i8 addrspace(1)* nocapture writeonly %0, i64 %1, i64 %2, i64 %3, i64 %4, i32 %5) local_unnamed_addr #0 {
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
  %17 = icmp eq i64 %1, 2
  %18 = icmp eq i64 %13, 0
  br i1 %18, label %26, label %19

19:                                               ; preds = %6
  %20 = urem i64 %13, %1
  %21 = sub i64 %13, %20
  %22 = and i64 %21, 1
  %23 = icmp eq i64 %22, 0
  %24 = select i1 %23, i64 %1, i64 0
  %25 = sub i64 %21, %24
  br label %26

26:                                               ; preds = %19, %6
  %27 = phi i64 [ 0, %6 ], [ %25, %19 ]
  %28 = tail call i64 @llvm.umax.i64(i64 %27, i64 %2)
  %29 = select i1 %17, i64 1, i64 2
  %30 = mul i64 %29, %1
  %31 = icmp ult i64 %28, %16
  br i1 %31, label %33, label %32

32:                                               ; preds = %33, %26
  ret void

33:                                               ; preds = %26, %33
  %34 = phi i64 [ %37, %33 ], [ %28, %26 ]
  %35 = sub i64 %34, %3
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  store i8 0, i8 addrspace(1)* %36, align 1, !tbaa !5
  %37 = add i64 %34, %30
  %38 = icmp ult i64 %37, %16
  br i1 %38, label %33, label %32, !llvm.loop !8
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umax.i64(i64, i64) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
