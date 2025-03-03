; ModuleID = '../data/hip_kernels/10833/2/main.cu'
source_filename = "../data/hip_kernels/10833/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11clock_blockPll(i64 addrspace(1)* nocapture writeonly %0, i64 %1) local_unnamed_addr #0 {
  %3 = tail call i64 @llvm.amdgcn.s.memtime()
  %4 = icmp sgt i64 %1, 0
  br i1 %4, label %5, label %10

5:                                                ; preds = %2, %5
  %6 = tail call i64 @llvm.amdgcn.s.memtime()
  %7 = sub i64 %6, %3
  %8 = and i64 %7, 4294967295
  %9 = icmp slt i64 %8, %1
  br i1 %9, label %5, label %10, !llvm.loop !4

10:                                               ; preds = %5, %2
  %11 = phi i64 [ 0, %2 ], [ %8, %5 ]
  store i64 %11, i64 addrspace(1)* %0, align 8, !tbaa !6
  ret void
}

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memtime() #1

attributes #0 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!7, !7, i64 0}
!7 = !{!"long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
