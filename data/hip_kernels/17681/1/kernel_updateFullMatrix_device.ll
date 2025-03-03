; ModuleID = '../data/hip_kernels/17681/1/main.cu'
source_filename = "../data/hip_kernels/17681/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23kernel_updateFullMatrixPfS_S_S_S_S_fj(float addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul i32 %9, %7
  %11 = icmp eq i32 %7, 0
  br i1 %11, label %37, label %12

12:                                               ; preds = %8
  %13 = fpext float %6 to double
  %14 = fmul contract double %13, 5.000000e-01
  br label %15

15:                                               ; preds = %12, %15
  %16 = phi i32 [ 0, %12 ], [ %35, %15 ]
  %17 = add i32 %16, %10
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %2, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !5
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %18
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !5
  %23 = fmul contract float %20, %22
  %24 = fpext float %23 to double
  %25 = fdiv contract double %24, %14
  %26 = getelementptr inbounds float, float addrspace(1)* %4, i64 %18
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !5
  %28 = getelementptr inbounds float, float addrspace(1)* %5, i64 %18
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !5
  %30 = fdiv contract float %27, %29
  %31 = fpext float %30 to double
  %32 = fadd contract double %25, %31
  %33 = fptrunc double %32 to float
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %18
  store float %33, float addrspace(1)* %34, align 4, !tbaa !5
  %35 = add nuw i32 %16, 1
  %36 = icmp eq i32 %35, %7
  br i1 %36, label %37, label %15, !llvm.loop !9

37:                                               ; preds = %15, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
