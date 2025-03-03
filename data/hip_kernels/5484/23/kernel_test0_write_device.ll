; ModuleID = '../data/hip_kernels/5484/23/main.cu'
source_filename = "../data/hip_kernels/5484/23/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z18kernel_test0_writePcS_(i8 addrspace(1)* %0, i8 addrspace(1)* readnone %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = shl i32 %3, 20
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %5
  %7 = bitcast i8 addrspace(1)* %6 to i32 addrspace(1)*
  %8 = addrspacecast i32 addrspace(1)* %7 to i32*
  %9 = icmp ult i8 addrspace(1)* %6, %1
  br i1 %9, label %10, label %30

10:                                               ; preds = %2
  %11 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 1048576
  %12 = bitcast i8 addrspace(1)* %11 to i32 addrspace(1)*
  %13 = addrspacecast i32 addrspace(1)* %12 to i32*
  store i32 1, i32 addrspace(1)* %7, align 4, !tbaa !4
  %14 = ptrtoint i32* %8 to i64
  br label %15

15:                                               ; preds = %27, %10
  %16 = phi i64 [ 4, %10 ], [ %29, %27 ]
  %17 = phi i32 [ 1, %10 ], [ %28, %27 ]
  br label %18

18:                                               ; preds = %18, %15
  %19 = phi i64 [ %16, %15 ], [ %23, %18 ]
  %20 = or i64 %19, %14
  %21 = inttoptr i64 %20 to i32*
  %22 = icmp eq i32* %21, %8
  %23 = shl i64 %19, 1
  br i1 %22, label %18, label %24, !llvm.loop !8

24:                                               ; preds = %18
  %25 = inttoptr i64 %20 to i32*
  %26 = icmp ult i32* %25, %13
  br i1 %26, label %27, label %30

27:                                               ; preds = %24
  store i32 %17, i32* %25, align 4, !tbaa !4
  %28 = shl i32 %17, 1
  %29 = shl i64 %19, 1
  br label %15, !llvm.loop !8

30:                                               ; preds = %24, %2
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
