; ModuleID = '../data/hip_kernels/4672/2/main.cu'
source_filename = "../data/hip_kernels/4672/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9smoothingPfS_ddi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, double %2, double %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = shl i32 %14, 1
  %16 = icmp slt i32 %15, %4
  br i1 %16, label %17, label %43

17:                                               ; preds = %5
  %18 = sext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = fpext float %20 to double
  %22 = fadd contract double %2, 1.000000e+00
  %23 = fmul contract double %22, %21
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = fpext float %25 to double
  %27 = fmul contract double %26, %2
  %28 = fsub contract double %23, %27
  %29 = fptrunc double %28 to float
  store float %29, float addrspace(1)* %24, align 4, !tbaa !7
  %30 = add nuw nsw i32 %15, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fpext float %33 to double
  %35 = fadd contract double %3, 1.000000e+00
  %36 = fmul contract double %35, %34
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = fpext float %38 to double
  %40 = fmul contract double %39, %3
  %41 = fsub contract double %36, %40
  %42 = fptrunc double %41 to float
  store float %42, float addrspace(1)* %37, align 4, !tbaa !7
  br label %43

43:                                               ; preds = %17, %5
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
