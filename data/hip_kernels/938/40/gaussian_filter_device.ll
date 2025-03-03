; ModuleID = '../data/hip_kernels/938/40/main.cu'
source_filename = "../data/hip_kernels/938/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15gaussian_filterPjS_iiE5cikti = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15gaussian_filterPjS_ii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  store i32 0, i32 addrspace(3)* @_ZZ15gaussian_filterPjS_iiE5cikti, align 4, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = mul i32 %5, %2
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = add i32 %6, %7
  %9 = shl i32 %8, 1
  %10 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !8
  %11 = mul i32 %10, %2
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !8
  %13 = add i32 %11, %12
  %14 = add i32 %13, %9
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !4, !amdgpu.noclobber !9
  %18 = load i32, i32 addrspace(3)* @_ZZ15gaussian_filterPjS_iiE5cikti, align 4, !tbaa !4
  %19 = add i32 %18, %17
  store i32 %19, i32 addrspace(3)* @_ZZ15gaussian_filterPjS_iiE5cikti, align 4, !tbaa !4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = load i32, i32 addrspace(3)* @_ZZ15gaussian_filterPjS_iiE5cikti, align 4, !tbaa !4
  %21 = lshr i32 %6, 1
  %22 = add i32 %21, %7
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  store i32 %20, i32 addrspace(1)* %24, align 4, !tbaa !4
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

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{i32 0, i32 1024}
!9 = !{}
