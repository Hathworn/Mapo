; ModuleID = '../data/hip_kernels/12867/6/main.cu'
source_filename = "../data/hip_kernels/12867/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z9pnpolyGPUPKfffPi(float addrspace(1)* nocapture readonly %0, float %1, float %2, i32 addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %5, 3
  %7 = add i32 %6, 4
  %8 = add i32 %6, 1
  %9 = sext i32 %7 to i64
  %10 = getelementptr inbounds float, float addrspace(1)* %0, i64 %9
  %11 = load float, float addrspace(1)* %10, align 4, !tbaa !4, !amdgpu.noclobber !8
  %12 = fcmp contract ule float %11, %2
  %13 = sext i32 %8 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !4, !amdgpu.noclobber !8
  %16 = fcmp contract ogt float %15, %2
  %17 = xor i1 %12, %16
  br i1 %17, label %33, label %18

18:                                               ; preds = %4
  %19 = add i32 %6, 3
  %20 = sext i32 %6 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !4, !amdgpu.noclobber !8
  %23 = sext i32 %19 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %0, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !4, !amdgpu.noclobber !8
  %26 = fsub contract float %22, %25
  %27 = fsub contract float %2, %11
  %28 = fmul contract float %27, %26
  %29 = fsub contract float %15, %11
  %30 = fdiv contract float %28, %29
  %31 = fadd contract float %25, %30
  %32 = fcmp contract ogt float %31, %1
  br i1 %32, label %34, label %33

33:                                               ; preds = %18, %4
  br label %34

34:                                               ; preds = %18, %33
  %35 = phi i32 [ 0, %33 ], [ 1, %18 ]
  %36 = sext i32 %5 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %36
  store i32 %35, i32 addrspace(1)* %37, align 4, !tbaa !9
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
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !6, i64 0}
