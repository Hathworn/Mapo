; ModuleID = '../data/hip_kernels/12063/5/main.cu'
source_filename = "../data/hip_kernels/12063/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23Kogge_Stone_scan_kernelPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %19

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !5
  %18 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %11
  store float %17, float addrspace(3)* %18, align 4, !tbaa !7
  br label %19

19:                                               ; preds = %14, %3
  %20 = icmp ugt i16 %8, 1
  br i1 %20, label %21, label %23

21:                                               ; preds = %19
  %22 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %11
  br label %28

23:                                               ; preds = %41, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %11
  %25 = load float, float addrspace(3)* %24, align 4, !tbaa !7
  %26 = sext i32 %12 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  store float %25, float addrspace(1)* %27, align 4, !tbaa !7
  ret void

28:                                               ; preds = %21, %41
  %29 = phi float [ undef, %21 ], [ %37, %41 ]
  %30 = phi i32 [ 1, %21 ], [ %42, %41 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i32 %11, %30
  br i1 %31, label %36, label %32

32:                                               ; preds = %28
  %33 = sub i32 %11, %30
  %34 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %33
  %35 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  br label %36

36:                                               ; preds = %32, %28
  %37 = phi float [ %35, %32 ], [ %29, %28 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %31, label %41, label %38

38:                                               ; preds = %36
  %39 = load float, float addrspace(3)* %22, align 4, !tbaa !7
  %40 = fadd contract float %37, %39
  store float %40, float addrspace(3)* %22, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %38, %36
  %42 = shl i32 %30, 1
  %43 = icmp ult i32 %42, %9
  br i1 %43, label %28, label %23, !llvm.loop !11
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
