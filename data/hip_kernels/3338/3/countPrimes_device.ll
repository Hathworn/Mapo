; ModuleID = '../data/hip_kernels/3338/3/main.cu'
source_filename = "../data/hip_kernels/3338/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11countPrimesPcPyyyi(i8 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture writeonly %1, i64 %2, i64 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = shl i32 %6, 10
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = or i32 %7, %8
  %10 = mul i32 %9, %4
  %11 = zext i32 %10 to i64
  %12 = add i64 %11, %2
  %13 = sext i32 %4 to i64
  %14 = add i64 %12, %13
  %15 = tail call i64 @llvm.umin.i64(i64 %14, i64 %3)
  %16 = icmp eq i64 %12, 0
  %17 = zext i1 %16 to i64
  %18 = or i64 %12, 1
  %19 = icmp ult i64 %18, %15
  br i1 %19, label %24, label %20

20:                                               ; preds = %24, %5
  %21 = phi i64 [ %17, %5 ], [ %32, %24 ]
  %22 = zext i32 %9 to i64
  %23 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %22
  store i64 %21, i64 addrspace(1)* %23, align 8, !tbaa !5
  ret void

24:                                               ; preds = %5, %24
  %25 = phi i64 [ %33, %24 ], [ %18, %5 ]
  %26 = phi i64 [ %32, %24 ], [ %17, %5 ]
  %27 = sub i64 %25, %2
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !9, !amdgpu.noclobber !10
  %30 = icmp eq i8 %29, 1
  %31 = zext i1 %30 to i64
  %32 = add i64 %26, %31
  %33 = add i64 %25, 2
  %34 = icmp ult i64 %33, %15
  br i1 %34, label %24, label %20, !llvm.loop !11
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
!9 = !{!7, !7, i64 0}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
