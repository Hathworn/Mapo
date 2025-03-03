; ModuleID = '../data/hip_kernels/9391/3/main.cu'
source_filename = "../data/hip_kernels/9391/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21reduced_sum_axis_zeroPKfPfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %104

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  store float 0.000000e+00, float addrspace(1)* %17, align 4, !tbaa !7
  %18 = sdiv i32 %2, %3
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %104

20:                                               ; preds = %15
  %21 = and i32 %18, 7
  %22 = icmp ult i32 %18, 8
  br i1 %22, label %87, label %23

23:                                               ; preds = %20
  %24 = and i32 %18, -8
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi float [ 0.000000e+00, %23 ], [ %83, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %84, %25 ]
  %28 = phi i32 [ 0, %23 ], [ %85, %25 ]
  %29 = mul nsw i32 %27, %3
  %30 = add nsw i32 %29, %13
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7
  %34 = fadd contract float %33, %26
  store float %34, float addrspace(1)* %17, align 4, !tbaa !7
  %35 = or i32 %27, 1
  %36 = mul nsw i32 %35, %3
  %37 = add nsw i32 %36, %13
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fadd contract float %40, %34
  store float %41, float addrspace(1)* %17, align 4, !tbaa !7
  %42 = or i32 %27, 2
  %43 = mul nsw i32 %42, %3
  %44 = add nsw i32 %43, %13
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7
  %48 = fadd contract float %47, %41
  store float %48, float addrspace(1)* %17, align 4, !tbaa !7
  %49 = or i32 %27, 3
  %50 = mul nsw i32 %49, %3
  %51 = add nsw i32 %50, %13
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !7
  %55 = fadd contract float %54, %48
  store float %55, float addrspace(1)* %17, align 4, !tbaa !7
  %56 = or i32 %27, 4
  %57 = mul nsw i32 %56, %3
  %58 = add nsw i32 %57, %13
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %0, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = fadd contract float %61, %55
  store float %62, float addrspace(1)* %17, align 4, !tbaa !7
  %63 = or i32 %27, 5
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %64, %13
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %0, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fadd contract float %68, %62
  store float %69, float addrspace(1)* %17, align 4, !tbaa !7
  %70 = or i32 %27, 6
  %71 = mul nsw i32 %70, %3
  %72 = add nsw i32 %71, %13
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = fadd contract float %75, %69
  store float %76, float addrspace(1)* %17, align 4, !tbaa !7
  %77 = or i32 %27, 7
  %78 = mul nsw i32 %77, %3
  %79 = add nsw i32 %78, %13
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7
  %83 = fadd contract float %82, %76
  store float %83, float addrspace(1)* %17, align 4, !tbaa !7
  %84 = add nuw nsw i32 %27, 8
  %85 = add i32 %28, 8
  %86 = icmp eq i32 %85, %24
  br i1 %86, label %87, label %25, !llvm.loop !11

87:                                               ; preds = %25, %20
  %88 = phi float [ 0.000000e+00, %20 ], [ %83, %25 ]
  %89 = phi i32 [ 0, %20 ], [ %84, %25 ]
  %90 = icmp eq i32 %21, 0
  br i1 %90, label %104, label %91

91:                                               ; preds = %87, %91
  %92 = phi float [ %100, %91 ], [ %88, %87 ]
  %93 = phi i32 [ %101, %91 ], [ %89, %87 ]
  %94 = phi i32 [ %102, %91 ], [ 0, %87 ]
  %95 = mul nsw i32 %93, %3
  %96 = add nsw i32 %95, %13
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7
  %100 = fadd contract float %99, %92
  store float %100, float addrspace(1)* %17, align 4, !tbaa !7
  %101 = add nuw nsw i32 %93, 1
  %102 = add i32 %94, 1
  %103 = icmp eq i32 %102, %21
  br i1 %103, label %104, label %91, !llvm.loop !13

104:                                              ; preds = %87, %91, %15, %4
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
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
