; ModuleID = '../data/hip_kernels/12709/1/main.cu'
source_filename = "../data/hip_kernels/12709/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17matMul_CUDA_floatPfiS_S_(float addrspace(1)* nocapture %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = mul nsw i32 %1, %1
  %15 = icmp slt i32 %13, %14
  %16 = icmp sgt i32 %1, 0
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %108

18:                                               ; preds = %4
  %19 = srem i32 %13, %1
  %20 = sext i32 %13 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7
  %23 = and i32 %1, 3
  %24 = icmp ult i32 %1, 4
  br i1 %24, label %85, label %25

25:                                               ; preds = %18
  %26 = and i32 %1, -4
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi float [ %22, %25 ], [ %81, %27 ]
  %29 = phi i32 [ 0, %25 ], [ %82, %27 ]
  %30 = phi i32 [ 0, %25 ], [ %83, %27 ]
  %31 = add i32 %29, %13
  %32 = sub i32 %31, %19
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7
  %36 = mul nsw i32 %29, %1
  %37 = add nsw i32 %19, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %3, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7
  %41 = fmul contract float %35, %40
  %42 = fadd contract float %28, %41
  store float %42, float addrspace(1)* %21, align 4, !tbaa !7
  %43 = or i32 %29, 1
  %44 = add i32 %43, %13
  %45 = sub i32 %44, %19
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = mul nsw i32 %43, %1
  %50 = add nsw i32 %19, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %3, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %42, %54
  store float %55, float addrspace(1)* %21, align 4, !tbaa !7
  %56 = or i32 %29, 2
  %57 = add i32 %56, %13
  %58 = sub i32 %57, %19
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = mul nsw i32 %56, %1
  %63 = add nsw i32 %19, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fmul contract float %61, %66
  %68 = fadd contract float %55, %67
  store float %68, float addrspace(1)* %21, align 4, !tbaa !7
  %69 = or i32 %29, 3
  %70 = add i32 %69, %13
  %71 = sub i32 %70, %19
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = mul nsw i32 %69, %1
  %76 = add nsw i32 %19, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %3, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %74, %79
  %81 = fadd contract float %68, %80
  store float %81, float addrspace(1)* %21, align 4, !tbaa !7
  %82 = add nuw nsw i32 %29, 4
  %83 = add i32 %30, 4
  %84 = icmp eq i32 %83, %26
  br i1 %84, label %85, label %27, !llvm.loop !11

85:                                               ; preds = %27, %18
  %86 = phi float [ %22, %18 ], [ %81, %27 ]
  %87 = phi i32 [ 0, %18 ], [ %82, %27 ]
  %88 = icmp eq i32 %23, 0
  br i1 %88, label %108, label %89

89:                                               ; preds = %85, %89
  %90 = phi float [ %104, %89 ], [ %86, %85 ]
  %91 = phi i32 [ %105, %89 ], [ %87, %85 ]
  %92 = phi i32 [ %106, %89 ], [ 0, %85 ]
  %93 = add i32 %91, %13
  %94 = sub i32 %93, %19
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = mul nsw i32 %91, %1
  %99 = add nsw i32 %19, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %3, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fmul contract float %97, %102
  %104 = fadd contract float %90, %103
  store float %104, float addrspace(1)* %21, align 4, !tbaa !7
  %105 = add nuw nsw i32 %91, 1
  %106 = add i32 %92, 1
  %107 = icmp eq i32 %106, %23
  br i1 %107, label %108, label %89, !llvm.loop !13

108:                                              ; preds = %85, %89, %4
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
