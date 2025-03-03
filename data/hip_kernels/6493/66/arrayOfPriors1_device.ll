; ModuleID = '../data/hip_kernels/6493/66/main.cu'
source_filename = "../data/hip_kernels/6493/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14arrayOfPriors1iiPKfS0_S0_S0_Pf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readnone %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture readnone %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %13
  %16 = add i32 %15, %8
  %17 = icmp slt i32 %16, %1
  br i1 %17, label %18, label %33

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %2, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  %22 = sitofp i32 %0 to float
  %23 = fcmp contract oeq float %21, %22
  %24 = uitofp i1 %23 to float
  %25 = fmul contract float %24, 0.000000e+00
  %26 = fpext float %25 to double
  %27 = fcmp contract olt float %21, %22
  %28 = uitofp i1 %27 to double
  %29 = fmul contract double %28, 2.000000e+19
  %30 = fadd contract double %29, %26
  %31 = fptrunc double %30 to float
  %32 = getelementptr inbounds float, float addrspace(1)* %6, i64 %19
  store float %31, float addrspace(1)* %32, align 4, !tbaa !7
  br label %33

33:                                               ; preds = %18, %7
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
