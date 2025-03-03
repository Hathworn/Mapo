; ModuleID = '../data/hip_kernels/17908/33/main.cu'
source_filename = "../data/hip_kernels/17908/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18kernel_test7_writePcS_S_Pj(i8 addrspace(1)* writeonly %0, i8 addrspace(1)* readnone %1, i8 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readnone %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 20
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %7
  %9 = bitcast i8 addrspace(1)* %8 to i32 addrspace(1)*
  %10 = bitcast i8 addrspace(1)* %2 to i32 addrspace(1)*
  %11 = icmp ult i8 addrspace(1)* %8, %1
  br i1 %11, label %12, label %21

12:                                               ; preds = %4, %12
  %13 = phi i64 [ %19, %12 ], [ 0, %4 ]
  %14 = trunc i64 %13 to i32
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %13
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !4
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %13
  store i32 %16, i32 addrspace(1)* %17, align 4, !tbaa !4
  %18 = add nuw nsw i64 %13, 1
  %19 = and i64 %18, 4294967295
  %20 = icmp ult i32 %14, 262143
  br i1 %20, label %12, label %21, !llvm.loop !8

21:                                               ; preds = %12, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
