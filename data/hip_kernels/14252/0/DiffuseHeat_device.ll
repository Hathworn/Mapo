; ModuleID = '../data/hip_kernels/14252/0/main.cu'
source_filename = "../data/hip_kernels/14252/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11DiffuseHeatPfS_mddm(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i64 %2, double %3, double %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %12
  %15 = add i32 %14, %7
  %16 = add i32 %15, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %49, label %18

18:                                               ; preds = %6
  %19 = zext i32 %16 to i64
  %20 = add i64 %2, -1
  %21 = icmp ugt i64 %20, %19
  br i1 %21, label %22, label %49

22:                                               ; preds = %18
  %23 = uitofp i64 %5 to double
  %24 = icmp eq i64 %5, 0
  br i1 %24, label %49, label %25

25:                                               ; preds = %22
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %27 = add i32 %15, 2
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = zext i32 %15 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  br label %33

33:                                               ; preds = %25, %33
  %34 = phi double [ 0.000000e+00, %25 ], [ %47, %33 ]
  %35 = load float, float addrspace(1)* %26, align 4, !tbaa !7
  %36 = fpext float %35 to double
  %37 = load float, float addrspace(1)* %29, align 4, !tbaa !7
  %38 = fmul contract float %35, 2.000000e+00
  %39 = fsub contract float %37, %38
  %40 = load float, float addrspace(1)* %31, align 4, !tbaa !7
  %41 = fadd contract float %39, %40
  %42 = fpext float %41 to double
  %43 = fmul contract double %42, 2.500000e-01
  %44 = fadd contract double %43, %36
  %45 = fptrunc double %44 to float
  store float %45, float addrspace(1)* %32, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  store float %46, float addrspace(1)* %26, align 4, !tbaa !7
  %47 = fadd contract double %34, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = fcmp contract olt double %47, %23
  br i1 %48, label %33, label %49, !llvm.loop !11

49:                                               ; preds = %33, %22, %18, %6
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
