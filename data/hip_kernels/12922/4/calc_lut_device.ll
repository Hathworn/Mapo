; ModuleID = '../data/hip_kernels/12922/4/main.cu'
source_filename = "../data/hip_kernels/12922/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8calc_lutPiS_iiE11shared_hist = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16
@_ZZ8calc_lutPiS_iiE3cdf = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8calc_lutPiS_ii(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %6
  %8 = load i32, i32 addrspace(1)* %7, align 4, !tbaa !5, !amdgpu.noclobber !9
  %9 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %5
  store i32 %8, i32 addrspace(3)* %9, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %14

10:                                               ; preds = %14
  %11 = icmp eq i32 %5, 0
  br i1 %11, label %12, label %36

12:                                               ; preds = %10
  %13 = load i32, i32 addrspace(3)* %9, align 4, !tbaa !5
  br label %20

14:                                               ; preds = %4, %14
  %15 = phi i32 [ 0, %4 ], [ %16, %14 ]
  %16 = add nuw nsw i32 %15, 1
  %17 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %15
  %18 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %14, label %10, !llvm.loop !10

20:                                               ; preds = %36, %12
  %21 = phi i32 [ %13, %12 ], [ %42, %36 ]
  %22 = sub nsw i32 %2, %18
  %23 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE3cdf, i32 0, i32 %5
  store i32 %21, i32 addrspace(3)* %23, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %25 = sitofp i32 %24 to float
  %26 = sitofp i32 %18 to float
  %27 = fsub contract float %25, %26
  %28 = fmul contract float %27, 2.550000e+02
  %29 = sitofp i32 %22 to float
  %30 = fdiv contract float %28, %29
  %31 = fpext float %30 to double
  %32 = fadd contract double %31, 5.000000e-01
  %33 = fptosi double %32 to i32
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %6
  %35 = tail call i32 @llvm.smax.i32(i32 %33, i32 0)
  store i32 %35, i32 addrspace(1)* %34, align 4
  ret void

36:                                               ; preds = %10, %36
  %37 = phi i32 [ %43, %36 ], [ 1, %10 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = sub i32 %5, %37
  %39 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ8calc_lutPiS_iiE11shared_hist, i32 0, i32 %38
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %41 = load i32, i32 addrspace(3)* %9, align 4, !tbaa !5
  %42 = add nsw i32 %41, %40
  store i32 %42, i32 addrspace(3)* %9, align 4, !tbaa !5
  %43 = shl nuw nsw i32 %37, 1
  %44 = icmp ult i32 %5, %43
  br i1 %44, label %20, label %36, !llvm.loop !12
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
