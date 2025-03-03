; ModuleID = '../data/hip_kernels/189/52/main.cu'
source_filename = "../data/hip_kernels/189/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22p2pPingPongLatencyTestPvS_Pmii(i8 addrspace(1)* %0, i8 addrspace(1)* %1, i64 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = bitcast i8 addrspace(1)* %0 to i32 addrspace(1)*
  %7 = addrspacecast i32 addrspace(1)* %6 to i32*
  %8 = bitcast i8 addrspace(1)* %1 to i32 addrspace(1)*
  %9 = addrspacecast i32 addrspace(1)* %8 to i32*
  %10 = icmp eq i32 %4, 0
  br i1 %10, label %27, label %11

11:                                               ; preds = %5
  %12 = icmp eq i32 %3, 0
  br label %13

13:                                               ; preds = %11, %24
  %14 = phi i32 [ %18, %24 ], [ %4, %11 ]
  %15 = phi i32 [ %25, %24 ], [ 0, %11 ]
  %16 = phi i64 addrspace(1)* [ %20, %24 ], [ %2, %11 ]
  %17 = phi i1 [ false, %24 ], [ %12, %11 ]
  %18 = add nsw i32 %14, -1
  %19 = tail call i64 @llvm.amdgcn.s.memtime()
  %20 = getelementptr inbounds i64, i64 addrspace(1)* %16, i64 1
  store i64 %19, i64 addrspace(1)* %16, align 8, !tbaa !4
  br i1 %17, label %24, label %21

21:                                               ; preds = %13, %21
  %22 = load volatile i32, i32* %7, align 4, !tbaa !8
  %23 = icmp eq i32 %22, %15
  br i1 %23, label %24, label %21, !llvm.loop !10

24:                                               ; preds = %21, %13
  %25 = sub nsw i32 1, %15
  store volatile i32 %25, i32* %9, align 4, !tbaa !8
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %27, label %13, !llvm.loop !12

27:                                               ; preds = %24, %5
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
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
