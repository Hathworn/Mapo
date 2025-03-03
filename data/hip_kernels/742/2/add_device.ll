; ModuleID = '../data/hip_kernels/742/2/main.cu'
source_filename = "../data/hip_kernels/742/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z3addPiS_S_S_Pf(i32 addrspace(1)* nocapture readnone %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = sitofp i32 %17 to double
  %19 = fmul contract double %18, 3.906250e-03
  %20 = fptrunc double %19 to float
  %21 = mul nsw i32 %14, 6
  %22 = add nsw i32 %21, 30720
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %4, i64 %23
  store float %20, float addrspace(1)* %24, align 4, !tbaa !11
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = sitofp i32 %26 to double
  %28 = fmul contract double %27, 3.906250e-03
  %29 = fptrunc double %28 to float
  %30 = add nsw i32 %21, 30721
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %4, i64 %31
  store float %29, float addrspace(1)* %32, align 4, !tbaa !11
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %15
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = sitofp i32 %34 to double
  %36 = fmul contract double %35, 3.906250e-03
  %37 = fptrunc double %36 to float
  %38 = add nsw i32 %21, 30722
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %4, i64 %39
  store float %37, float addrspace(1)* %40, align 4, !tbaa !11
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
