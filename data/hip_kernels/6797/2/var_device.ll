; ModuleID = '../data/hip_kernels/6797/2/main.cu'
source_filename = "../data/hip_kernels/6797/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z3varPiS_if(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, float %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 8
  %7 = add nsw i32 %6, 256
  %8 = tail call i32 @llvm.smin.i32(i32 %7, i32 %2)
  %9 = icmp slt i32 %6, %8
  br i1 %9, label %16, label %12

10:                                               ; preds = %16
  %11 = fptosi float %25 to i32
  br label %12

12:                                               ; preds = %10, %4
  %13 = phi i32 [ 0, %4 ], [ %11, %10 ]
  %14 = zext i32 %5 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  store i32 %13, i32 addrspace(1)* %15, align 4, !tbaa !4
  ret void

16:                                               ; preds = %4, %16
  %17 = phi i32 [ %26, %16 ], [ %6, %4 ]
  %18 = phi float [ %25, %16 ], [ 0.000000e+00, %4 ]
  %19 = sext i32 %17 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !4, !amdgpu.noclobber !8
  %22 = sitofp i32 %21 to float
  %23 = fsub contract float %22, %3
  %24 = fmul contract float %23, %23
  %25 = fadd contract float %18, %24
  %26 = add nsw i32 %17, 1
  %27 = icmp slt i32 %26, %8
  br i1 %27, label %16, label %10, !llvm.loop !9
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
