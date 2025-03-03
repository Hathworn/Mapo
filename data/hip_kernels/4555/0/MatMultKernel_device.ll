; ModuleID = '../data/hip_kernels/4555/0/main.cu'
source_filename = "../data/hip_kernels/4555/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13MatMultKernelPdS_S_iiiE9subArray1 = internal unnamed_addr addrspace(3) global [1 x [1 x double]] undef, align 8
@_ZZ13MatMultKernelPdS_S_iiiE9subArray2 = internal unnamed_addr addrspace(3) global [1 x [1 x double]] undef, align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13MatMultKernelPdS_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %11 = add nsw i32 %8, %10
  %12 = add nsw i32 %7, %9
  %13 = icmp sgt i32 %4, 0
  br i1 %13, label %14, label %22

14:                                               ; preds = %6
  %15 = icmp slt i32 %11, %3
  %16 = getelementptr inbounds [1 x [1 x double]], [1 x [1 x double]] addrspace(3)* @_ZZ13MatMultKernelPdS_S_iiiE9subArray1, i32 0, i32 %10, i32 %9
  %17 = mul nsw i32 %11, %4
  %18 = icmp slt i32 %12, %5
  %19 = getelementptr inbounds [1 x [1 x double]], [1 x [1 x double]] addrspace(3)* @_ZZ13MatMultKernelPdS_S_iiiE9subArray2, i32 0, i32 %10, i32 %9
  %20 = getelementptr inbounds [1 x [1 x double]], [1 x [1 x double]] addrspace(3)* @_ZZ13MatMultKernelPdS_S_iiiE9subArray1, i32 0, i32 %10, i32 0
  %21 = getelementptr inbounds [1 x [1 x double]], [1 x [1 x double]] addrspace(3)* @_ZZ13MatMultKernelPdS_S_iiiE9subArray2, i32 0, i32 0, i32 %9
  br label %27

22:                                               ; preds = %49, %6
  %23 = phi double [ 0.000000e+00, %6 ], [ %54, %49 ]
  %24 = icmp slt i32 %11, %3
  %25 = icmp slt i32 %12, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %57, label %62

27:                                               ; preds = %14, %49
  %28 = phi i32 [ 0, %14 ], [ %55, %49 ]
  %29 = phi double [ 0.000000e+00, %14 ], [ %54, %49 ]
  %30 = add nuw i32 %28, %9
  %31 = icmp slt i32 %30, %4
  %32 = select i1 %15, i1 %31, i1 false
  br i1 %32, label %33, label %38

33:                                               ; preds = %27
  %34 = add i32 %30, %17
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %38

38:                                               ; preds = %27, %33
  %39 = phi double [ %37, %33 ], [ 0.000000e+00, %27 ]
  store double %39, double addrspace(3)* %16, align 8, !tbaa !5
  br i1 %18, label %40, label %49

40:                                               ; preds = %38
  %41 = add nuw nsw i32 %28, %10
  %42 = icmp slt i32 %41, %4
  br i1 %42, label %43, label %49

43:                                               ; preds = %40
  %44 = mul nsw i32 %41, %5
  %45 = add nsw i32 %44, %12
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !5, !amdgpu.noclobber !9
  br label %49

49:                                               ; preds = %38, %40, %43
  %50 = phi double [ %48, %43 ], [ 0.000000e+00, %40 ], [ 0.000000e+00, %38 ]
  store double %50, double addrspace(3)* %19, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = load double, double addrspace(3)* %20, align 8, !tbaa !5
  %52 = load double, double addrspace(3)* %21, align 8, !tbaa !5
  %53 = fmul contract double %51, %52
  %54 = fadd contract double %29, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %55 = add nuw nsw i32 %28, 1
  %56 = icmp eq i32 %55, %4
  br i1 %56, label %22, label %27, !llvm.loop !10

57:                                               ; preds = %22
  %58 = mul nsw i32 %11, %5
  %59 = add nsw i32 %58, %12
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %2, i64 %60
  store double %23, double addrspace(1)* %61, align 8, !tbaa !5
  br label %62

62:                                               ; preds = %57, %22
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
