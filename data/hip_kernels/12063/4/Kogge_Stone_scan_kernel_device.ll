; ModuleID = '../data/hip_kernels/12063/4/main.cu'
source_filename = "../data/hip_kernels/12063/4/main.cu"
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
  %13 = icmp sge i32 %12, %2
  %14 = icmp eq i32 %11, 0
  %15 = or i1 %14, %13
  br i1 %15, label %21, label %16

16:                                               ; preds = %3
  %17 = add nsw i32 %12, -1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %21

21:                                               ; preds = %3, %16
  %22 = phi float [ %20, %16 ], [ 0.000000e+00, %3 ]
  %23 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %11
  store float %22, float addrspace(3)* %23, align 4
  %24 = icmp ult i32 %11, %2
  br i1 %24, label %25, label %45

25:                                               ; preds = %21
  %26 = icmp ugt i16 %8, 1
  br i1 %26, label %31, label %27

27:                                               ; preds = %41, %25
  %28 = phi float [ %22, %25 ], [ %42, %41 ]
  %29 = sext i32 %12 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %29
  store float %28, float addrspace(1)* %30, align 4, !tbaa !7
  br label %45

31:                                               ; preds = %25, %41
  %32 = phi float [ %42, %41 ], [ %22, %25 ]
  %33 = phi i32 [ %43, %41 ], [ 1, %25 ]
  %34 = icmp ult i32 %11, %33
  br i1 %34, label %41, label %35

35:                                               ; preds = %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %36 = sub i32 %11, %33
  %37 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ23Kogge_Stone_scan_kernelPfS_iE2XY, i32 0, i32 %36
  %38 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %39 = load float, float addrspace(3)* %23, align 4, !tbaa !7
  %40 = fadd contract float %38, %39
  store float %40, float addrspace(3)* %23, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %31, %35
  %42 = phi float [ %32, %31 ], [ %40, %35 ]
  %43 = shl i32 %33, 1
  %44 = icmp ult i32 %43, %9
  br i1 %44, label %31, label %27, !llvm.loop !11

45:                                               ; preds = %27, %21
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
