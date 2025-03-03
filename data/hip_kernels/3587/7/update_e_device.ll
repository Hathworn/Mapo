; ModuleID = '../data/hip_kernels/3587/7/main.cu'
source_filename = "../data/hip_kernels/3587/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL8update_eiPdS_ddiiiidddd = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL8update_eiPdS_ddiiiidddd(i32 %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, double %3, double %4, i32 %5, i32 %6, i32 %7, i32 %8, double %9, double %10, double %11, double %12) local_unnamed_addr #0 comdat {
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = mul i32 %19, %18
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %24, label %50

24:                                               ; preds = %13
  %25 = sext i32 %22 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %1, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = fsub contract double %4, %3
  %29 = fadd contract double %28, %27
  %30 = sitofp i32 %7 to double
  %31 = mul nsw i32 %5, %0
  %32 = add nsw i32 %22, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = fmul contract double %35, %30
  %37 = sitofp i32 %8 to double
  %38 = mul nsw i32 %6, %0
  %39 = add nsw i32 %22, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %2, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !5
  %43 = fmul contract double %42, %37
  %44 = fsub contract double %10, %9
  %45 = fmul contract double %44, %36
  %46 = fadd contract double %29, %45
  %47 = fsub contract double %12, %11
  %48 = fmul contract double %47, %43
  %49 = fadd contract double %46, %48
  store double %49, double addrspace(1)* %26, align 8, !tbaa !7
  br label %50

50:                                               ; preds = %24, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
