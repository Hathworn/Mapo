; ModuleID = '../data/hip_kernels/2119/1/main.cu'
source_filename = "../data/hip_kernels/2119/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ25gpu_transpo_kernel_sharedPhS_jjE5tuile = internal unnamed_addr addrspace(3) global [24 x [25 x i8]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z25gpu_transpo_kernel_sharedPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = mul i32 %7, 24
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, 24
  %12 = add i32 %11, %5
  %13 = icmp slt i32 %9, 0
  br i1 %13, label %35, label %14

14:                                               ; preds = %4
  %15 = icmp ult i32 %9, %3
  %16 = icmp sgt i32 %12, -1
  %17 = select i1 %15, i1 %16, i1 false
  %18 = icmp ult i32 %12, %2
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %35

20:                                               ; preds = %14
  %21 = mul i32 %9, %2
  %22 = add i32 %21, %12
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %23
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !5, !amdgpu.noclobber !8
  %26 = getelementptr inbounds [24 x [25 x i8]], [24 x [25 x i8]] addrspace(3)* @_ZZ25gpu_transpo_kernel_sharedPhS_jjE5tuile, i32 0, i32 %6, i32 %5
  store i8 %25, i8 addrspace(3)* %26, align 1, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = add i32 %8, %5
  %28 = add i32 %11, %6
  %29 = getelementptr inbounds [24 x [25 x i8]], [24 x [25 x i8]] addrspace(3)* @_ZZ25gpu_transpo_kernel_sharedPhS_jjE5tuile, i32 0, i32 %5, i32 %6
  %30 = load i8, i8 addrspace(3)* %29, align 1, !tbaa !5
  %31 = mul i32 %28, %3
  %32 = add i32 %27, %31
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  store i8 %30, i8 addrspace(1)* %34, align 1, !tbaa !5
  br label %35

35:                                               ; preds = %4, %14, %20
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
