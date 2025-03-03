; ModuleID = '../data/hip_kernels/15424/1/main.cu'
source_filename = "../data/hip_kernels/15424/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ33Max_Interleaved_Addressing_SharedPfiE5sdata = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z33Max_Interleaved_Addressing_SharedPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !4, !invariant.load !5
  %7 = zext i16 %6 to i32
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, %7
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %34

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !5
  %17 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33Max_Interleaved_Addressing_SharedPfiE5sdata, i32 0, i32 %10
  store float %16, float addrspace(3)* %17, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp ugt i16 %6, 1
  br i1 %18, label %19, label %34

19:                                               ; preds = %13, %32
  %20 = phi i32 [ %21, %32 ], [ 1, %13 ]
  %21 = shl nsw i32 %20, 1
  %22 = add i32 %21, 1023
  %23 = and i32 %22, %10
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %32

25:                                               ; preds = %19
  %26 = load float, float addrspace(3)* %17, align 4, !tbaa !7
  %27 = add i32 %20, %10
  %28 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ33Max_Interleaved_Addressing_SharedPfiE5sdata, i32 0, i32 %27
  %29 = load float, float addrspace(3)* %28, align 4, !tbaa !7
  %30 = fcmp contract olt float %26, %29
  %31 = select contract i1 %30, float %29, float %26
  store float %31, float addrspace(3)* %17, align 4, !tbaa !7
  br label %32

32:                                               ; preds = %25, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ult i32 %21, %7
  br i1 %33, label %19, label %34, !llvm.loop !11

34:                                               ; preds = %32, %13, %2
  %35 = icmp eq i32 %11, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %34
  %37 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ33Max_Interleaved_Addressing_SharedPfiE5sdata, i32 0, i32 0), align 16, !tbaa !7
  store float %37, float addrspace(1)* %0, align 4, !tbaa !7
  br label %38

38:                                               ; preds = %36, %34
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
