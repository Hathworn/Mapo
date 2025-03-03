; ModuleID = '../data/hip_kernels/17697/9/main.cu'
source_filename = "../data/hip_kernels/17697/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18reduce_sum_partialPKfPfjE10partialSum = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18reduce_sum_partialPKfPfj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = shl i32 %4, 1
  %14 = mul i32 %13, %9
  %15 = add i32 %14, %11
  %16 = icmp ult i32 %15, %2
  br i1 %16, label %17, label %21

17:                                               ; preds = %3
  %18 = zext i32 %15 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %21

21:                                               ; preds = %3, %17
  %22 = phi float [ %20, %17 ], [ 0.000000e+00, %3 ]
  %23 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ18reduce_sum_partialPKfPfjE10partialSum, i32 0, i32 %11
  store float %22, float addrspace(3)* %23, align 4
  %24 = add nuw nsw i32 %11, %9
  %25 = add i32 %24, %14
  %26 = icmp ult i32 %25, %2
  br i1 %26, label %27, label %31

27:                                               ; preds = %21
  %28 = zext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %31

31:                                               ; preds = %21, %27
  %32 = phi float [ %30, %27 ], [ 0.000000e+00, %21 ]
  %33 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ18reduce_sum_partialPKfPfjE10partialSum, i32 0, i32 %24
  store float %32, float addrspace(3)* %33, align 4, !tbaa !7
  br label %39

34:                                               ; preds = %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp eq i32 %11, 0
  %36 = shl nsw i32 %12, 1
  %37 = icmp ult i32 %36, %2
  %38 = select i1 %35, i1 %37, i1 false
  br i1 %38, label %51, label %55

39:                                               ; preds = %31, %48
  %40 = phi i32 [ %9, %31 ], [ %49, %48 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ult i32 %11, %40
  br i1 %41, label %42, label %48

42:                                               ; preds = %39
  %43 = add nuw nsw i32 %40, %11
  %44 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ18reduce_sum_partialPKfPfjE10partialSum, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %46 = load float, float addrspace(3)* %23, align 4, !tbaa !7
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %23, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %39, %42
  %49 = lshr i32 %40, 1
  %50 = icmp ult i32 %40, 2
  br i1 %50, label %34, label %39, !llvm.loop !11

51:                                               ; preds = %34
  %52 = load float, float addrspace(3)* getelementptr inbounds ([512 x float], [512 x float] addrspace(3)* @_ZZ18reduce_sum_partialPKfPfjE10partialSum, i32 0, i32 0), align 16, !tbaa !7
  %53 = zext i32 %4 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %53
  store float %52, float addrspace(1)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %51, %34
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
