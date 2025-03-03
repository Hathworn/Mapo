; ModuleID = '../data/hip_kernels/437/8/main.cu'
source_filename = "../data/hip_kernels/437/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE13shdcurmaxdist.0 = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE11shdcurlabel.0 = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE18shdcurmaxdistindex.0 = internal unnamed_addr addrspace(3) global i32 undef, align 4
@_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE5state.0 = internal unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z21_segmentedScanBackKerPfPiS0_S_S0_S0_i(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = add i32 %8, 1
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp eq i32 %16, 0
  br i1 %18, label %19, label %32

19:                                               ; preds = %7
  %20 = zext i32 %8 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %3, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %22, float addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE13shdcurmaxdist.0, align 4, !tbaa !7
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %20
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !11, !amdgpu.noclobber !5
  store i32 %24, i32 addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE11shdcurlabel.0, align 4, !tbaa !11
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %20
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !11, !amdgpu.noclobber !5
  store i32 %26, i32 addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE18shdcurmaxdistindex.0, align 4, !tbaa !11
  %27 = sext i32 %17 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !11, !amdgpu.noclobber !5
  %30 = icmp eq i32 %29, %24
  %31 = zext i1 %30 to i32
  store i32 %31, i32 addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE5state.0, align 4, !tbaa !11
  br label %32

32:                                               ; preds = %19, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = load i32, i32 addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE5state.0, align 4, !tbaa !11
  %34 = icmp ne i32 %33, 0
  %35 = icmp slt i32 %17, %6
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %51

37:                                               ; preds = %32
  %38 = sext i32 %17 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !11, !amdgpu.noclobber !5
  %41 = load i32, i32 addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE11shdcurlabel.0, align 4, !tbaa !11
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %51

43:                                               ; preds = %37
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = load float, float addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE13shdcurmaxdist.0, align 4, !tbaa !7
  %47 = fcmp contract olt float %45, %46
  br i1 %47, label %48, label %51

48:                                               ; preds = %43
  store float %46, float addrspace(1)* %44, align 4, !tbaa !7
  %49 = load i32, i32 addrspace(3)* @_ZZ21_segmentedScanBackKerPfPiS0_S_S0_S0_iE18shdcurmaxdistindex.0, align 4, !tbaa !11
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  store i32 %49, i32 addrspace(1)* %50, align 4, !tbaa !11
  br label %51

51:                                               ; preds = %37, %43, %48, %32
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
