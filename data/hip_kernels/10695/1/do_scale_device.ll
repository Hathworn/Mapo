; ModuleID = '../data/hip_kernels/10695/1/main.cu'
source_filename = "../data/hip_kernels/10695/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8do_scalePhS_jjjjddddjjjj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5, double %6, double %7, double %8, double %9, i32 %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = add i32 %15, %10
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %18 = add i32 %17, %11
  %19 = mul i32 %16, %4
  %20 = add i32 %19, %18
  %21 = uitofp i32 %16 to double
  %22 = fdiv contract double %21, %6
  %23 = fptoui double %22 to i32
  %24 = uitofp i32 %18 to double
  %25 = fdiv contract double %24, %7
  %26 = fptoui double %25 to i32
  %27 = mul i32 %23, %2
  %28 = add i32 %27, %26
  %29 = mul i32 %28, %12
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !5, !amdgpu.noclobber !8
  %33 = add i32 %28, 1
  %34 = mul i32 %33, %12
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !5, !amdgpu.noclobber !8
  %38 = add i32 %23, 1
  %39 = mul i32 %38, %2
  %40 = add i32 %39, %26
  %41 = mul i32 %40, %12
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !5, !amdgpu.noclobber !8
  %45 = add i32 %40, 1
  %46 = mul i32 %45, %12
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !5, !amdgpu.noclobber !8
  %50 = uitofp i8 %32 to double
  %51 = fmul contract double %50, %8
  %52 = fsub contract double 1.000000e+00, %8
  %53 = uitofp i8 %37 to double
  %54 = fmul contract double %52, %53
  %55 = fadd contract double %51, %54
  %56 = fmul contract double %55, %9
  %57 = fsub contract double 1.000000e+00, %9
  %58 = uitofp i8 %44 to double
  %59 = fmul contract double %58, %8
  %60 = uitofp i8 %49 to double
  %61 = fmul contract double %52, %60
  %62 = fadd contract double %59, %61
  %63 = fmul contract double %57, %62
  %64 = fadd contract double %56, %63
  %65 = fptoui double %64 to i8
  %66 = mul i32 %20, %13
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %67
  store i8 %65, i8 addrspace(1)* %68, align 1, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
