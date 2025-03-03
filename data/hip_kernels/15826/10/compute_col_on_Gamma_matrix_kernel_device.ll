; ModuleID = '../data/hip_kernels/15826/10/main.cu'
source_filename = "../data/hip_kernels/15826/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z34compute_col_on_Gamma_matrix_kerneliiPiPdS0_iS0_iS0_i(i32 %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, i32 %5, double addrspace(1)* nocapture readonly %6, i32 %7, double addrspace(1)* nocapture writeonly %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !4, !amdgpu.noclobber !8
  %15 = sext i32 %0 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !4, !amdgpu.noclobber !8
  %18 = getelementptr inbounds double, double addrspace(1)* %3, i64 %15
  %19 = load double, double addrspace(1)* %18, align 8, !tbaa !9, !amdgpu.noclobber !8
  %20 = icmp slt i32 %17, %1
  br i1 %20, label %21, label %33

21:                                               ; preds = %10
  %22 = icmp eq i32 %14, %17
  %23 = uitofp i1 %22 to double
  %24 = mul nsw i32 %17, %5
  %25 = add nsw i32 %24, %14
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %4, i64 %26
  %28 = load double, double addrspace(1)* %27, align 8, !tbaa !9, !amdgpu.noclobber !8
  %29 = fmul contract double %19, %28
  %30 = fsub contract double %29, %23
  %31 = fadd contract double %19, -1.000000e+00
  %32 = fdiv contract double %30, %31
  br label %40

33:                                               ; preds = %10
  %34 = sub nsw i32 %17, %1
  %35 = mul nsw i32 %34, %7
  %36 = add nsw i32 %35, %14
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %6, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !9, !amdgpu.noclobber !8
  br label %40

40:                                               ; preds = %33, %21
  %41 = phi double [ %39, %33 ], [ %32, %21 ]
  %42 = mul nsw i32 %11, %9
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %8, i64 %43
  store double %41, double addrspace(1)* %44, align 8, !tbaa !9
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !6, i64 0}
