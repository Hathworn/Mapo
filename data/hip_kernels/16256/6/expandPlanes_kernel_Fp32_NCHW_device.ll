; ModuleID = '../data/hip_kernels/16256/6/main.cu'
source_filename = "../data/hip_kernels/16256/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29expandPlanes_kernel_Fp32_NCHWPfPKmPKfiE7shMasks = internal unnamed_addr addrspace(3) global [4 x i64] undef, align 16
@_ZZ29expandPlanes_kernel_Fp32_NCHWPfPKmPKfiE6shVals = internal unnamed_addr addrspace(3) global [4 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z29expandPlanes_kernel_Fp32_NCHWPfPKmPKfi(float addrspace(1)* nocapture writeonly %0, i64 addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = ashr i32 %13, 6
  %15 = icmp slt i32 %14, %3
  br i1 %15, label %16, label %43

16:                                               ; preds = %4
  %17 = icmp ult i32 %5, 4
  br i1 %17, label %18, label %27

18:                                               ; preds = %16
  %19 = add nsw i32 %14, %5
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i64, i64 addrspace(1)* %1, i64 %20
  %22 = load i64, i64 addrspace(1)* %21, align 8, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds [4 x i64], [4 x i64] addrspace(3)* @_ZZ29expandPlanes_kernel_Fp32_NCHWPfPKmPKfiE7shMasks, i32 0, i32 %5
  store i64 %22, i64 addrspace(3)* %23, align 8, !tbaa !7
  %24 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !11, !amdgpu.noclobber !6
  %26 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ29expandPlanes_kernel_Fp32_NCHWPfPKmPKfiE6shVals, i32 0, i32 %5
  store float %25, float addrspace(3)* %26, align 4, !tbaa !11
  br label %27

27:                                               ; preds = %18, %16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = lshr i32 %5, 6
  %29 = getelementptr inbounds [4 x i64], [4 x i64] addrspace(3)* @_ZZ29expandPlanes_kernel_Fp32_NCHWPfPKmPKfiE7shMasks, i32 0, i32 %28
  %30 = load i64, i64 addrspace(3)* %29, align 8, !tbaa !7
  %31 = and i32 %13, 63
  %32 = zext i32 %31 to i64
  %33 = shl nuw i64 1, %32
  %34 = and i64 %30, %33
  %35 = icmp eq i64 %34, 0
  br i1 %35, label %39, label %36

36:                                               ; preds = %27
  %37 = getelementptr inbounds [4 x float], [4 x float] addrspace(3)* @_ZZ29expandPlanes_kernel_Fp32_NCHWPfPKmPKfiE6shVals, i32 0, i32 %28
  %38 = load float, float addrspace(3)* %37, align 4, !tbaa !11
  br label %39

39:                                               ; preds = %36, %27
  %40 = phi float [ %38, %36 ], [ 0.000000e+00, %27 ]
  %41 = sext i32 %13 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %40, float addrspace(1)* %42, align 4, !tbaa !11
  br label %43

43:                                               ; preds = %4, %39
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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
