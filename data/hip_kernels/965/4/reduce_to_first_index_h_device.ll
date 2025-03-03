; ModuleID = '../data/hip_kernels/965/4/main.cu'
source_filename = "../data/hip_kernels/965/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23reduce_to_first_index_hPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %105

14:                                               ; preds = %3
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %16, label %39

16:                                               ; preds = %14
  %17 = and i32 %1, 7
  %18 = icmp ult i32 %1, 8
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  %20 = and i32 %1, -8
  br label %43

21:                                               ; preds = %43, %16
  %22 = phi float [ undef, %16 ], [ %101, %43 ]
  %23 = phi i32 [ 0, %16 ], [ %102, %43 ]
  %24 = phi float [ 0.000000e+00, %16 ], [ %101, %43 ]
  %25 = icmp eq i32 %17, 0
  br i1 %25, label %39, label %26

26:                                               ; preds = %21, %26
  %27 = phi i32 [ %36, %26 ], [ %23, %21 ]
  %28 = phi float [ %35, %26 ], [ %24, %21 ]
  %29 = phi i32 [ %37, %26 ], [ 0, %21 ]
  %30 = mul nsw i32 %27, %2
  %31 = add nsw i32 %30, %12
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = fadd contract float %28, %34
  %36 = add nuw nsw i32 %27, 1
  %37 = add i32 %29, 1
  %38 = icmp eq i32 %37, %17
  br i1 %38, label %39, label %26, !llvm.loop !11

39:                                               ; preds = %21, %26, %14
  %40 = phi float [ 0.000000e+00, %14 ], [ %22, %21 ], [ %35, %26 ]
  %41 = sext i32 %12 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %40, float addrspace(1)* %42, align 4, !tbaa !7
  br label %105

43:                                               ; preds = %43, %19
  %44 = phi i32 [ 0, %19 ], [ %102, %43 ]
  %45 = phi float [ 0.000000e+00, %19 ], [ %101, %43 ]
  %46 = phi i32 [ 0, %19 ], [ %103, %43 ]
  %47 = mul nsw i32 %44, %2
  %48 = add nsw i32 %47, %12
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = fadd contract float %45, %51
  %53 = or i32 %44, 1
  %54 = mul nsw i32 %53, %2
  %55 = add nsw i32 %54, %12
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = fadd contract float %52, %58
  %60 = or i32 %44, 2
  %61 = mul nsw i32 %60, %2
  %62 = add nsw i32 %61, %12
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fadd contract float %59, %65
  %67 = or i32 %44, 3
  %68 = mul nsw i32 %67, %2
  %69 = add nsw i32 %68, %12
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %0, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fadd contract float %66, %72
  %74 = or i32 %44, 4
  %75 = mul nsw i32 %74, %2
  %76 = add nsw i32 %75, %12
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = fadd contract float %73, %79
  %81 = or i32 %44, 5
  %82 = mul nsw i32 %81, %2
  %83 = add nsw i32 %82, %12
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !5
  %87 = fadd contract float %80, %86
  %88 = or i32 %44, 6
  %89 = mul nsw i32 %88, %2
  %90 = add nsw i32 %89, %12
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  %94 = fadd contract float %87, %93
  %95 = or i32 %44, 7
  %96 = mul nsw i32 %95, %2
  %97 = add nsw i32 %96, %12
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = fadd contract float %94, %100
  %102 = add nuw nsw i32 %44, 8
  %103 = add i32 %46, 8
  %104 = icmp eq i32 %103, %20
  br i1 %104, label %21, label %43, !llvm.loop !13

105:                                              ; preds = %39, %3
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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
