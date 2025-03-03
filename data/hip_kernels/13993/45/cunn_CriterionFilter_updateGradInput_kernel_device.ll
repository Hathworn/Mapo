; ModuleID = '../data/hip_kernels/13993/45/main.cu'
source_filename = "../data/hip_kernels/13993/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z43cunn_CriterionFilter_updateGradInput_kernelPfS_S_iiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = freeze i32 %8
  %10 = freeze i32 %6
  %11 = udiv i32 %9, %10
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %16, %6
  %18 = mul nsw i32 %11, %5
  %19 = mul nsw i32 %18, %4
  %20 = load float, float addrspace(1)* %2, align 4, !tbaa !6, !amdgpu.noclobber !5
  %21 = fptosi float %20 to i32
  %22 = mul i32 %11, %10
  %23 = sub i32 %9, %22
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %5
  br i1 %27, label %28, label %106

28:                                               ; preds = %7
  %29 = icmp slt i32 %4, 1
  %30 = add i32 %4, -1
  %31 = and i32 %4, 7
  %32 = icmp ult i32 %30, 7
  %33 = and i32 %4, -8
  %34 = icmp eq i32 %31, 0
  br label %35

35:                                               ; preds = %28, %103
  %36 = phi i32 [ %26, %28 ], [ %104, %103 ]
  %37 = add nsw i32 %36, %18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %1, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !6
  %41 = fptosi float %40 to i32
  %42 = icmp ne i32 %41, %21
  %43 = select i1 %42, i1 true, i1 %29
  br i1 %43, label %103, label %44

44:                                               ; preds = %35
  %45 = add i32 %36, %19
  br i1 %32, label %91, label %46

46:                                               ; preds = %44, %46
  %47 = phi i32 [ %88, %46 ], [ 0, %44 ]
  %48 = phi i32 [ %89, %46 ], [ 0, %44 ]
  %49 = mul nsw i32 %47, %5
  %50 = add i32 %45, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  store float 0.000000e+00, float addrspace(1)* %52, align 4, !tbaa !6
  %53 = or i32 %47, 1
  %54 = mul nsw i32 %53, %5
  %55 = add i32 %45, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  store float 0.000000e+00, float addrspace(1)* %57, align 4, !tbaa !6
  %58 = or i32 %47, 2
  %59 = mul nsw i32 %58, %5
  %60 = add i32 %45, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  store float 0.000000e+00, float addrspace(1)* %62, align 4, !tbaa !6
  %63 = or i32 %47, 3
  %64 = mul nsw i32 %63, %5
  %65 = add i32 %45, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  store float 0.000000e+00, float addrspace(1)* %67, align 4, !tbaa !6
  %68 = or i32 %47, 4
  %69 = mul nsw i32 %68, %5
  %70 = add i32 %45, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  store float 0.000000e+00, float addrspace(1)* %72, align 4, !tbaa !6
  %73 = or i32 %47, 5
  %74 = mul nsw i32 %73, %5
  %75 = add i32 %45, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  store float 0.000000e+00, float addrspace(1)* %77, align 4, !tbaa !6
  %78 = or i32 %47, 6
  %79 = mul nsw i32 %78, %5
  %80 = add i32 %45, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float 0.000000e+00, float addrspace(1)* %82, align 4, !tbaa !6
  %83 = or i32 %47, 7
  %84 = mul nsw i32 %83, %5
  %85 = add i32 %45, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  store float 0.000000e+00, float addrspace(1)* %87, align 4, !tbaa !6
  %88 = add nuw nsw i32 %47, 8
  %89 = add i32 %48, 8
  %90 = icmp eq i32 %89, %33
  br i1 %90, label %91, label %46, !llvm.loop !11

91:                                               ; preds = %46, %44
  %92 = phi i32 [ 0, %44 ], [ %88, %46 ]
  br i1 %34, label %103, label %93

93:                                               ; preds = %91, %93
  %94 = phi i32 [ %100, %93 ], [ %92, %91 ]
  %95 = phi i32 [ %101, %93 ], [ 0, %91 ]
  %96 = mul nsw i32 %94, %5
  %97 = add i32 %45, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  store float 0.000000e+00, float addrspace(1)* %99, align 4, !tbaa !6
  %100 = add nuw nsw i32 %94, 1
  %101 = add i32 %95, 1
  %102 = icmp eq i32 %101, %31
  br i1 %102, label %103, label %93, !llvm.loop !13

103:                                              ; preds = %91, %93, %35
  %104 = add nsw i32 %36, %17
  %105 = icmp slt i32 %104, %5
  br i1 %105, label %35, label %106, !llvm.loop !15

106:                                              ; preds = %103, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{i32 0, i32 1024}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !12}
