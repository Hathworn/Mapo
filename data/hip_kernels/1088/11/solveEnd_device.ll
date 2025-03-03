; ModuleID = '../data/hip_kernels/1088/11/main.cu'
source_filename = "../data/hip_kernels/1088/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL8solveEndPdddddddddii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL8solveEndPdddddddddii(double addrspace(1)* nocapture %0, double %1, double %2, double %3, double %4, double %5, double %6, double %7, double %8, i32 %9, i32 %10) local_unnamed_addr #0 comdat {
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = mul i32 %17, %16
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = add nsw i32 %9, -2
  %22 = mul nsw i32 %21, %10
  %23 = add nsw i32 %20, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 %24
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !7, !amdgpu.noclobber !5
  %27 = sext i32 %20 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !5
  %30 = fmul contract double %29, %4
  %31 = add nsw i32 %9, -4
  %32 = mul nsw i32 %31, %10
  %33 = add nsw i32 %20, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = fmul contract double %36, %1
  %38 = fadd contract double %30, %37
  %39 = add nsw i32 %9, -3
  %40 = mul nsw i32 %39, %10
  %41 = add nsw i32 %20, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %0, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7, !amdgpu.noclobber !5
  %45 = fmul contract double %44, %2
  %46 = fadd contract double %38, %45
  %47 = fsub contract double %26, %46
  %48 = add nsw i32 %9, -1
  %49 = mul nsw i32 %48, %10
  %50 = add nsw i32 %20, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract double %29, %3
  %55 = add nsw i32 %20, %10
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = fmul contract double %58, %4
  %60 = fadd contract double %54, %59
  %61 = fmul contract double %44, %1
  %62 = fadd contract double %61, %60
  %63 = fsub contract double %53, %62
  %64 = fmul contract double %47, %5
  %65 = fmul contract double %63, %6
  %66 = fadd contract double %64, %65
  store double %66, double addrspace(1)* %25, align 8, !tbaa !7
  %67 = fmul contract double %47, %7
  %68 = fmul contract double %63, %8
  %69 = fadd contract double %67, %68
  store double %69, double addrspace(1)* %52, align 8, !tbaa !7
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
