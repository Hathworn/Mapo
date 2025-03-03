; ModuleID = '../data/hip_kernels/15826/8/main.cu'
source_filename = "../data/hip_kernels/15826/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20read_G_matrix_kerneliiPiS_PbPdS1_iS1_iS1_i(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture readonly %6, i32 %7, double addrspace(1)* nocapture readonly %8, i32 %9, double addrspace(1)* nocapture writeonly %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !5, !amdgpu.noclobber !9
  %17 = icmp slt i32 %16, %1
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %14
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5
  br i1 %17, label %20, label %34

20:                                               ; preds = %12
  %21 = icmp eq i32 %19, %16
  %22 = select contract i1 %21, double 1.000000e+00, double 0.000000e+00
  %23 = mul nsw i32 %16, %7
  %24 = add nsw i32 %19, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %6, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !10, !amdgpu.noclobber !9
  %28 = getelementptr inbounds double, double addrspace(1)* %5, i64 %14
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !10, !amdgpu.noclobber !9
  %30 = fmul contract double %27, %29
  %31 = fsub contract double %30, %22
  %32 = fadd contract double %29, -1.000000e+00
  %33 = fdiv contract double %31, %32
  br label %41

34:                                               ; preds = %12
  %35 = sub nsw i32 %16, %1
  %36 = mul nsw i32 %35, %9
  %37 = add nsw i32 %19, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %8, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !10, !amdgpu.noclobber !9
  br label %41

41:                                               ; preds = %34, %20
  %42 = phi double [ %33, %20 ], [ %40, %34 ]
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %14
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !12, !range !14, !amdgpu.noclobber !9
  %45 = icmp eq i8 %44, 0
  %46 = select contract i1 %45, double %42, double 0.000000e+00
  %47 = mul nsw i32 %13, %11
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %10, i64 %48
  store double %46, double addrspace(1)* %49, align 8, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"bool", !7, i64 0}
!14 = !{i8 0, i8 2}
