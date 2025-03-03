; ModuleID = '../data/hip_kernels/13306/3/main.cu'
source_filename = "../data/hip_kernels/13306/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL23KerBitReversalMatrixColPfS_S_S_ii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL23KerBitReversalMatrixColPfS_S_S_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 comdat {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = shl nuw i32 1, %5
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %101

26:                                               ; preds = %6
  %27 = icmp sgt i32 %5, 0
  br i1 %27, label %28, label %48

28:                                               ; preds = %26
  %29 = and i32 %5, 7
  %30 = icmp ult i32 %5, 8
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = and i32 %5, -8
  br label %51

33:                                               ; preds = %51, %28
  %34 = phi i32 [ undef, %28 ], [ %80, %51 ]
  %35 = phi i32 [ 0, %28 ], [ %80, %51 ]
  %36 = phi i32 [ %23, %28 ], [ %81, %51 ]
  %37 = icmp eq i32 %29, 0
  br i1 %37, label %48, label %38

38:                                               ; preds = %33, %38
  %39 = phi i32 [ %44, %38 ], [ %35, %33 ]
  %40 = phi i32 [ %45, %38 ], [ %36, %33 ]
  %41 = phi i32 [ %46, %38 ], [ 0, %33 ]
  %42 = shl i32 %39, 1
  %43 = and i32 %40, 1
  %44 = or i32 %42, %43
  %45 = ashr i32 %40, 1
  %46 = add i32 %41, 1
  %47 = icmp eq i32 %46, %29
  br i1 %47, label %48, label %38, !llvm.loop !7

48:                                               ; preds = %33, %38, %26
  %49 = phi i32 [ 0, %26 ], [ %34, %33 ], [ %44, %38 ]
  %50 = icmp slt i32 %23, %49
  br i1 %50, label %101, label %84

51:                                               ; preds = %51, %31
  %52 = phi i32 [ 0, %31 ], [ %80, %51 ]
  %53 = phi i32 [ %23, %31 ], [ %81, %51 ]
  %54 = phi i32 [ 0, %31 ], [ %82, %51 ]
  %55 = shl i32 %52, 3
  %56 = shl i32 %53, 2
  %57 = and i32 %56, 4
  %58 = or i32 %55, %57
  %59 = and i32 %53, 2
  %60 = or i32 %58, %59
  %61 = lshr i32 %53, 4
  %62 = shl i32 %60, 2
  %63 = and i32 %53, 4
  %64 = or i32 %63, %62
  %65 = lshr i32 %53, 2
  %66 = and i32 %65, 2
  %67 = or i32 %64, %66
  %68 = and i32 %61, 1
  %69 = or i32 %67, %68
  %70 = lshr i32 %53, 6
  %71 = shl i32 %69, 2
  %72 = lshr i32 %53, 4
  %73 = and i32 %72, 2
  %74 = or i32 %71, %73
  %75 = and i32 %70, 1
  %76 = or i32 %74, %75
  %77 = lshr i32 %53, 7
  %78 = shl i32 %76, 1
  %79 = and i32 %77, 1
  %80 = or i32 %78, %79
  %81 = ashr i32 %53, 8
  %82 = add i32 %54, 8
  %83 = icmp eq i32 %82, %32
  br i1 %83, label %33, label %51, !llvm.loop !9

84:                                               ; preds = %48
  %85 = mul nsw i32 %23, %4
  %86 = add nsw i32 %85, %15
  %87 = mul nsw i32 %49, %4
  %88 = add nsw i32 %87, %15
  %89 = sext i32 %86 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11, !amdgpu.noclobber !5
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !11, !amdgpu.noclobber !5
  %94 = sext i32 %88 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !11, !amdgpu.noclobber !5
  store float %96, float addrspace(1)* %90, align 4, !tbaa !11
  %97 = getelementptr inbounds float, float addrspace(1)* %3, i64 %94
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11
  store float %98, float addrspace(1)* %92, align 4, !tbaa !11
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  store float %91, float addrspace(1)* %99, align 4, !tbaa !11
  %100 = getelementptr inbounds float, float addrspace(1)* %1, i64 %94
  store float %93, float addrspace(1)* %100, align 4, !tbaa !11
  br label %101

101:                                              ; preds = %48, %84, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
