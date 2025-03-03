; ModuleID = '../data/hip_kernels/13593/5/main.cu'
source_filename = "../data/hip_kernels/13593/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z25kernel_test0_global_writePcS_(i8 addrspace(1)* %0, i8 addrspace(1)* readnone %1) local_unnamed_addr #0 {
  %3 = bitcast i8 addrspace(1)* %0 to i32 addrspace(1)*
  %4 = addrspacecast i32 addrspace(1)* %3 to i32*
  %5 = bitcast i8 addrspace(1)* %1 to i32 addrspace(1)*
  %6 = addrspacecast i32 addrspace(1)* %5 to i32*
  store i32 1, i32 addrspace(1)* %3, align 4, !tbaa !4
  %7 = icmp ult i32* %4, %6
  br i1 %7, label %8, label %25

8:                                                ; preds = %2
  %9 = ptrtoint i32* %4 to i64
  br label %10

10:                                               ; preds = %22, %8
  %11 = phi i64 [ 4, %8 ], [ %24, %22 ]
  %12 = phi i32 [ 1, %8 ], [ %23, %22 ]
  br label %13

13:                                               ; preds = %13, %10
  %14 = phi i64 [ %11, %10 ], [ %18, %13 ]
  %15 = or i64 %14, %9
  %16 = inttoptr i64 %15 to i32*
  %17 = icmp eq i32* %16, %4
  %18 = shl i64 %14, 1
  br i1 %17, label %13, label %19, !llvm.loop !8

19:                                               ; preds = %13
  %20 = inttoptr i64 %15 to i32*
  %21 = icmp ult i32* %20, %6
  br i1 %21, label %22, label %25

22:                                               ; preds = %19
  store i32 %12, i32* %20, align 4, !tbaa !4
  %23 = shl i32 %12, 1
  %24 = shl i64 %14, 1
  br label %10, !llvm.loop !8

25:                                               ; preds = %19, %2
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

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
