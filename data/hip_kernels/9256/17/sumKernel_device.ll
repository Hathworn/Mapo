; ModuleID = '../data/hip_kernels/9256/17/main.cu'
source_filename = "../data/hip_kernels/9256/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9sumKernelPfS_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul i32 %14, %4
  %16 = add nsw i32 %15, %4
  %17 = tail call i32 @llvm.smin.i32(i32 %16, i32 %3)
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %19, label %28

19:                                               ; preds = %5
  %20 = icmp sgt i32 %2, 0
  %21 = and i32 %2, 7
  %22 = icmp ult i32 %2, 8
  %23 = and i32 %2, -8
  %24 = icmp eq i32 %21, 0
  br label %25

25:                                               ; preds = %19, %46
  %26 = phi i32 [ %15, %19 ], [ %50, %46 ]
  br i1 %20, label %27, label %46

27:                                               ; preds = %25
  br i1 %22, label %29, label %52

28:                                               ; preds = %46, %5
  ret void

29:                                               ; preds = %52, %27
  %30 = phi float [ undef, %27 ], [ %110, %52 ]
  %31 = phi i32 [ 0, %27 ], [ %111, %52 ]
  %32 = phi float [ 0.000000e+00, %27 ], [ %110, %52 ]
  br i1 %24, label %46, label %33

33:                                               ; preds = %29, %33
  %34 = phi i32 [ %43, %33 ], [ %31, %29 ]
  %35 = phi float [ %42, %33 ], [ %32, %29 ]
  %36 = phi i32 [ %44, %33 ], [ 0, %29 ]
  %37 = mul nsw i32 %34, %3
  %38 = add nsw i32 %37, %26
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7
  %42 = fadd contract float %35, %41
  %43 = add nuw nsw i32 %34, 1
  %44 = add i32 %36, 1
  %45 = icmp eq i32 %44, %21
  br i1 %45, label %46, label %33, !llvm.loop !11

46:                                               ; preds = %29, %33, %25
  %47 = phi float [ 0.000000e+00, %25 ], [ %30, %29 ], [ %42, %33 ]
  %48 = sext i32 %26 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  store float %47, float addrspace(1)* %49, align 4, !tbaa !7
  %50 = add nsw i32 %26, 1
  %51 = icmp slt i32 %50, %17
  br i1 %51, label %25, label %28, !llvm.loop !13

52:                                               ; preds = %27, %52
  %53 = phi i32 [ %111, %52 ], [ 0, %27 ]
  %54 = phi float [ %110, %52 ], [ 0.000000e+00, %27 ]
  %55 = phi i32 [ %112, %52 ], [ 0, %27 ]
  %56 = mul nsw i32 %53, %3
  %57 = add nsw i32 %56, %26
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fadd contract float %54, %60
  %62 = or i32 %53, 1
  %63 = mul nsw i32 %62, %3
  %64 = add nsw i32 %63, %26
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = fadd contract float %61, %67
  %69 = or i32 %53, 2
  %70 = mul nsw i32 %69, %3
  %71 = add nsw i32 %70, %26
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fadd contract float %68, %74
  %76 = or i32 %53, 3
  %77 = mul nsw i32 %76, %3
  %78 = add nsw i32 %77, %26
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !7
  %82 = fadd contract float %75, %81
  %83 = or i32 %53, 4
  %84 = mul nsw i32 %83, %3
  %85 = add nsw i32 %84, %26
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fadd contract float %82, %88
  %90 = or i32 %53, 5
  %91 = mul nsw i32 %90, %3
  %92 = add nsw i32 %91, %26
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %0, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !7
  %96 = fadd contract float %89, %95
  %97 = or i32 %53, 6
  %98 = mul nsw i32 %97, %3
  %99 = add nsw i32 %98, %26
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fadd contract float %96, %102
  %104 = or i32 %53, 7
  %105 = mul nsw i32 %104, %3
  %106 = add nsw i32 %105, %26
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %0, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = fadd contract float %103, %109
  %111 = add nuw nsw i32 %53, 8
  %112 = add i32 %55, 8
  %113 = icmp eq i32 %112, %23
  br i1 %113, label %29, label %52, !llvm.loop !15
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!15 = distinct !{!15, !14}
