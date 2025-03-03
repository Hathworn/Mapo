; ModuleID = '../data/hip_kernels/1/44/main.cu'
source_filename = "../data/hip_kernels/1/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14noNAsPmccMeansiiPfS_E10threadSums = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14noNAsPmccMeansiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %13, %0
  %15 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul nuw nsw i32 %12, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add nuw nsw i32 %19, %20
  %22 = icmp slt i32 %13, %1
  br i1 %22, label %23, label %60

23:                                               ; preds = %4
  %24 = icmp slt i32 %20, %0
  br i1 %24, label %29, label %25

25:                                               ; preds = %29, %23
  %26 = phi float [ 0.000000e+00, %23 ], [ %36, %29 ]
  %27 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14noNAsPmccMeansiiPfS_E10threadSums, i32 0, i32 %21
  store float %26, float addrspace(3)* %27, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ult i16 %17, 2
  br i1 %28, label %39, label %41

29:                                               ; preds = %23, %29
  %30 = phi i32 [ %37, %29 ], [ %20, %23 ]
  %31 = phi float [ %36, %29 ], [ 0.000000e+00, %23 ]
  %32 = add nsw i32 %30, %14
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fadd contract float %31, %35
  %37 = add i32 %30, %18
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %29, label %25, !llvm.loop !11

39:                                               ; preds = %51, %25
  %40 = icmp eq i32 %20, 0
  br i1 %40, label %53, label %60

41:                                               ; preds = %25, %51
  %42 = phi i32 [ %43, %51 ], [ %18, %25 ]
  %43 = lshr i32 %42, 1
  %44 = icmp ult i32 %20, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %41
  %46 = add nuw nsw i32 %43, %21
  %47 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14noNAsPmccMeansiiPfS_E10threadSums, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %49 = load float, float addrspace(3)* %27, align 4, !tbaa !7
  %50 = fadd contract float %48, %49
  store float %50, float addrspace(3)* %27, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %45, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ult i32 %42, 4
  br i1 %52, label %39, label %41, !llvm.loop !13

53:                                               ; preds = %39
  %54 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ14noNAsPmccMeansiiPfS_E10threadSums, i32 0, i32 %19
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %56 = sitofp i32 %0 to float
  %57 = fdiv contract float %55, %56
  %58 = sext i32 %13 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  store float %57, float addrspace(1)* %59, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %39, %53, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!13 = distinct !{!13, !12}
