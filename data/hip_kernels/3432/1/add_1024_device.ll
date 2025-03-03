; ModuleID = '../data/hip_kernels/3432/1/main.cu'
source_filename = "../data/hip_kernels/3432/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8add_1024PlS_S_l(i64 addrspace(1)* nocapture readonly %0, i64 addrspace(1)* nocapture readonly %1, i64 addrspace(1)* nocapture %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i64, i64 addrspace(1)* %0, i64 %6
  %8 = load i64, i64 addrspace(1)* %7, align 8, !tbaa !5, !amdgpu.noclobber !9
  %9 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %6
  %10 = load i64, i64 addrspace(1)* %9, align 8, !tbaa !5, !amdgpu.noclobber !9
  %11 = mul nsw i64 %10, %8
  %12 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %6
  store i64 %11, i64 addrspace(1)* %12, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %13 = add i64 %3, 1
  %14 = icmp ult i64 %13, 3
  br i1 %14, label %28, label %15

15:                                               ; preds = %4, %25
  %16 = phi i64 [ %17, %25 ], [ %3, %4 ]
  %17 = sdiv i64 %16, 2
  %18 = icmp sgt i64 %17, %6
  br i1 %18, label %19, label %25

19:                                               ; preds = %15
  %20 = add nsw i64 %17, %6
  %21 = getelementptr inbounds i64, i64 addrspace(1)* %2, i64 %20
  %22 = load i64, i64 addrspace(1)* %21, align 8, !tbaa !5
  %23 = load i64, i64 addrspace(1)* %12, align 8, !tbaa !5
  %24 = add nsw i64 %23, %22
  store i64 %24, i64 addrspace(1)* %12, align 8, !tbaa !5
  br label %25

25:                                               ; preds = %19, %15
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = add nsw i64 %17, 1
  %27 = icmp ult i64 %26, 3
  br i1 %27, label %28, label %15, !llvm.loop !10

28:                                               ; preds = %25, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
