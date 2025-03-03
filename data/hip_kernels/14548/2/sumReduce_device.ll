; ModuleID = '../data/hip_kernels/14548/2/main.cu'
source_filename = "../data/hip_kernels/14548/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL9sumReducePiPf = comdat any

@_ZZL9sumReducePiPfE5s_sum = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL9sumReducePiPf(i32 addrspace(1)* nocapture readnone %0, float addrspace(1)* nocapture %1) local_unnamed_addr #0 comdat {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = icmp ult i32 %3, 64
  br i1 %4, label %5, label %10

5:                                                ; preds = %2
  %6 = shl nuw nsw i32 %3, 9
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds float, float addrspace(1)* %1, i64 %7
  %9 = load float, float addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %10

10:                                               ; preds = %2, %5
  %11 = phi float [ %9, %5 ], [ 0.000000e+00, %2 ]
  %12 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZL9sumReducePiPfE5s_sum, i32 0, i32 %3
  store float %11, float addrspace(3)* %12, align 4
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !10, !invariant.load !9
  %17 = icmp ult i16 %16, 2
  br i1 %17, label %22, label %18

18:                                               ; preds = %10
  %19 = zext i16 %16 to i32
  br label %26

20:                                               ; preds = %36
  %21 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  br label %22

22:                                               ; preds = %20, %10
  %23 = phi float [ %21, %20 ], [ %11, %10 ]
  %24 = zext i32 %3 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  store float %23, float addrspace(1)* %25, align 4, !tbaa !5
  ret void

26:                                               ; preds = %18, %36
  %27 = phi i32 [ %19, %18 ], [ %28, %36 ]
  %28 = lshr i32 %27, 1
  %29 = icmp ult i32 %3, %28
  br i1 %29, label %30, label %36

30:                                               ; preds = %26
  %31 = add nuw nsw i32 %28, %3
  %32 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZL9sumReducePiPfE5s_sum, i32 0, i32 %31
  %33 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %34 = load float, float addrspace(3)* %12, align 4, !tbaa !5
  %35 = fadd contract float %33, %34
  store float %35, float addrspace(3)* %12, align 4, !tbaa !5
  br label %36

36:                                               ; preds = %30, %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp ult i32 %27, 4
  br i1 %37, label %20, label %26, !llvm.loop !11
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
