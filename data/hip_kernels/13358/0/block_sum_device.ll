; ModuleID = '../data/hip_kernels/13358/0/main.cu'
source_filename = "../data/hip_kernels/13358/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9block_sumPKfPfS1_mE13sharedSumData = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16
@_ZZ9block_sumPKfPfS1_mE16sharedSquareData = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9block_sumPKfPfS1_m(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = icmp ult i64 %14, %3
  br i1 %15, label %16, label %19

16:                                               ; preds = %4
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %19

19:                                               ; preds = %16, %4
  %20 = phi float [ %18, %16 ], [ 0.000000e+00, %4 ]
  %21 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9block_sumPKfPfS1_mE13sharedSumData, i32 0, i32 %12
  store float %20, float addrspace(3)* %21, align 4, !tbaa !7
  %22 = fmul contract float %20, %20
  %23 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9block_sumPKfPfS1_mE16sharedSquareData, i32 0, i32 %12
  store float %22, float addrspace(3)* %23, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %24 = icmp ult i16 %9, 2
  br i1 %24, label %25, label %27

25:                                               ; preds = %41, %19
  %26 = icmp eq i32 %12, 0
  br i1 %26, label %43, label %49

27:                                               ; preds = %19, %41
  %28 = phi i32 [ %29, %41 ], [ %10, %19 ]
  %29 = lshr i32 %28, 1
  %30 = icmp ult i32 %12, %29
  br i1 %30, label %31, label %41

31:                                               ; preds = %27
  %32 = add nuw nsw i32 %29, %12
  %33 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9block_sumPKfPfS1_mE13sharedSumData, i32 0, i32 %32
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !7
  %35 = load float, float addrspace(3)* %21, align 4, !tbaa !7
  %36 = fadd contract float %34, %35
  store float %36, float addrspace(3)* %21, align 4, !tbaa !7
  %37 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ9block_sumPKfPfS1_mE16sharedSquareData, i32 0, i32 %32
  %38 = load float, float addrspace(3)* %37, align 4, !tbaa !7
  %39 = load float, float addrspace(3)* %23, align 4, !tbaa !7
  %40 = fadd contract float %38, %39
  store float %40, float addrspace(3)* %23, align 4, !tbaa !7
  br label %41

41:                                               ; preds = %31, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp ult i32 %28, 4
  br i1 %42, label %25, label %27, !llvm.loop !11

43:                                               ; preds = %25
  %44 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ9block_sumPKfPfS1_mE13sharedSumData, i32 0, i32 0), align 16, !tbaa !7
  %45 = zext i32 %5 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %44, float addrspace(1)* %46, align 4, !tbaa !7
  %47 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ9block_sumPKfPfS1_mE16sharedSquareData, i32 0, i32 0), align 16, !tbaa !7
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %45
  store float %47, float addrspace(1)* %48, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %43, %25
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
