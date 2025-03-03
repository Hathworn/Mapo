; ModuleID = '../data/hip_kernels/9310/14/main.cu'
source_filename = "../data/hip_kernels/9310/14/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL34kernelCalcSum_EffectiveShareAccessPKiiPi = comdat any

@cache = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL34kernelCalcSum_EffectiveShareAccessPKiiPi(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 comdat {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %1
  br i1 %13, label %14, label %18

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %18

18:                                               ; preds = %3, %14
  %19 = phi i32 [ %17, %14 ], [ 0, %3 ]
  %20 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 %4
  store i32 %19, i32 addrspace(3)* %20, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ugt i16 %8, 1
  br i1 %21, label %24, label %22

22:                                               ; preds = %34, %18
  %23 = icmp eq i32 %4, 0
  br i1 %23, label %36, label %39

24:                                               ; preds = %18, %34
  %25 = phi i32 [ %26, %34 ], [ %9, %18 ]
  %26 = lshr i32 %25, 1
  %27 = icmp ult i32 %4, %26
  br i1 %27, label %28, label %34

28:                                               ; preds = %24
  %29 = xor i32 %26, %4
  %30 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 %29
  %31 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !7
  %32 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !7
  %33 = add nsw i32 %32, %31
  store i32 %33, i32 addrspace(3)* %20, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %28, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ugt i32 %25, 3
  br i1 %35, label %24, label %22, !llvm.loop !11

36:                                               ; preds = %22
  %37 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 0), align 4, !tbaa !7
  %38 = atomicrmw add i32 addrspace(1)* %2, i32 %37 syncscope("agent-one-as") monotonic, align 4
  br label %39

39:                                               ; preds = %36, %22
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
