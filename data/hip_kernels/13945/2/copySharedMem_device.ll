; ModuleID = '../data/hip_kernels/13945/2/main.cu'
source_filename = "../data/hip_kernels/13945/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13copySharedMemPfS_iiE4tile = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13copySharedMemPfS_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 4
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = mul nsw i32 %12, %2
  %14 = add nsw i32 %13, %8
  %15 = icmp slt i32 %8, %2
  %16 = icmp slt i32 %12, %3
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %23

18:                                               ; preds = %4
  %19 = sext i32 %14 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13copySharedMemPfS_iiE4tile, i32 0, i32 %11, i32 %7
  store float %21, float addrspace(3)* %22, align 4, !tbaa !5
  br label %23

23:                                               ; preds = %4, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp slt i32 %8, %3
  %25 = icmp slt i32 %12, %2
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %32

27:                                               ; preds = %23
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ13copySharedMemPfS_iiE4tile, i32 0, i32 %11, i32 %7
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %30 = sext i32 %14 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  store float %29, float addrspace(1)* %31, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %23, %27
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
