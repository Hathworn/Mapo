; ModuleID = '../data/hip_kernels/7264/61/main.cu'
source_filename = "../data/hip_kernels/7264/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19customErrorCalc_f32PfS_fffS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float %2, float %3, float %4, float addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %6
  br i1 %17, label %18, label %38

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fcmp contract ogt float %23, %2
  %25 = getelementptr inbounds float, float addrspace(1)* %5, i64 %19
  br i1 %24, label %26, label %31

26:                                               ; preds = %18
  %27 = fsub contract float 1.000000e+00, %21
  store float %27, float addrspace(1)* %25, align 4, !tbaa !7
  %28 = fcmp contract olt float %21, %2
  br i1 %28, label %29, label %38

29:                                               ; preds = %26
  %30 = fmul contract float %27, %3
  br label %36

31:                                               ; preds = %18
  %32 = fmul contract float %21, %21
  store float %32, float addrspace(1)* %25, align 4, !tbaa !7
  %33 = fcmp contract ogt float %21, %2
  br i1 %33, label %34, label %38

34:                                               ; preds = %31
  %35 = fmul contract float %32, %4
  br label %36

36:                                               ; preds = %34, %29
  %37 = phi float [ %30, %29 ], [ %35, %34 ]
  store float %37, float addrspace(1)* %25, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %36, %26, %31, %7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
