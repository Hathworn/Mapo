; ModuleID = '../data/hip_kernels/8006/2/main.cu'
source_filename = "../data/hip_kernels/8006/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9block_sumPKfPfm(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = zext i32 %12 to i64
  %14 = icmp ult i64 %13, %2
  br i1 %14, label %15, label %18

15:                                               ; preds = %3
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %18

18:                                               ; preds = %15, %3
  %19 = phi float [ %17, %15 ], [ 0.000000e+00, %3 ]
  %20 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %11
  store float %19, float addrspace(3)* %20, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %21 = icmp ult i16 %8, 2
  br i1 %21, label %22, label %24

22:                                               ; preds = %34, %18
  %23 = icmp eq i32 %11, 0
  br i1 %23, label %36, label %40

24:                                               ; preds = %18, %34
  %25 = phi i32 [ %26, %34 ], [ %9, %18 ]
  %26 = lshr i32 %25, 1
  %27 = icmp ult i32 %11, %26
  br i1 %27, label %28, label %34

28:                                               ; preds = %24
  %29 = add nuw nsw i32 %26, %11
  %30 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %29
  %31 = load float, float addrspace(3)* %30, align 4, !tbaa !7
  %32 = load float, float addrspace(3)* %20, align 4, !tbaa !7
  %33 = fadd contract float %31, %32
  store float %33, float addrspace(3)* %20, align 4, !tbaa !7
  br label %34

34:                                               ; preds = %28, %24
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp ult i32 %25, 4
  br i1 %35, label %22, label %24, !llvm.loop !11

36:                                               ; preds = %22
  %37 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %38 = zext i32 %4 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  store float %37, float addrspace(1)* %39, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %36, %22
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
