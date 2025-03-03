; ModuleID = '../data/hip_kernels/15063/12/main.cu'
source_filename = "../data/hip_kernels/15063/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19updateOutputWeightsPfffiiS_i(float addrspace(1)* nocapture %0, float %1, float %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = icmp sgt i32 %6, 0
  br i1 %12, label %13, label %34

13:                                               ; preds = %7
  %14 = and i32 %6, 7
  %15 = icmp ult i32 %6, 8
  br i1 %15, label %18, label %16

16:                                               ; preds = %13
  %17 = and i32 %6, -8
  br label %56

18:                                               ; preds = %56, %13
  %19 = phi float [ undef, %13 ], [ %98, %56 ]
  %20 = phi float [ 0.000000e+00, %13 ], [ %98, %56 ]
  %21 = phi i32 [ 0, %13 ], [ %99, %56 ]
  %22 = icmp eq i32 %14, 0
  br i1 %22, label %34, label %23

23:                                               ; preds = %18, %23
  %24 = phi float [ %30, %23 ], [ %20, %18 ]
  %25 = phi i32 [ %31, %23 ], [ %21, %18 ]
  %26 = phi i32 [ %32, %23 ], [ 0, %18 ]
  %27 = zext i32 %25 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %5, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !6, !amdgpu.noclobber !5
  %30 = fadd contract float %24, %29
  %31 = add nuw nsw i32 %25, 1
  %32 = add i32 %26, 1
  %33 = icmp eq i32 %32, %14
  br i1 %33, label %34, label %23, !llvm.loop !10

34:                                               ; preds = %18, %23, %7
  %35 = phi float [ 0.000000e+00, %7 ], [ %19, %18 ], [ %30, %23 ]
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %37 = zext i16 %11 to i32
  %38 = mul i32 %36, %37
  %39 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !12
  %40 = mul nsw i32 %4, %3
  %41 = add i32 %40, %39
  %42 = add i32 %41, %38
  %43 = sext i32 %3 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %5, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !6, !amdgpu.noclobber !5
  %46 = fdiv contract float %45, %35
  %47 = fmul contract float %1, %2
  %48 = sext i32 %42 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !6, !amdgpu.noclobber !5
  %51 = fmul contract float %47, %50
  %52 = fmul contract float %46, %51
  %53 = fadd contract float %50, %52
  %54 = tail call float @llvm.minnum.f32(float %53, float 1.000000e+00)
  %55 = tail call float @llvm.maxnum.f32(float %54, float 0.000000e+00)
  store float %55, float addrspace(1)* %49, align 4, !tbaa !6
  ret void

56:                                               ; preds = %56, %16
  %57 = phi float [ 0.000000e+00, %16 ], [ %98, %56 ]
  %58 = phi i32 [ 0, %16 ], [ %99, %56 ]
  %59 = phi i32 [ 0, %16 ], [ %100, %56 ]
  %60 = zext i32 %58 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %5, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !6, !amdgpu.noclobber !5
  %63 = fadd contract float %57, %62
  %64 = or i32 %58, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !6, !amdgpu.noclobber !5
  %68 = fadd contract float %63, %67
  %69 = or i32 %58, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %5, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !6, !amdgpu.noclobber !5
  %73 = fadd contract float %68, %72
  %74 = or i32 %58, 3
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %5, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !6, !amdgpu.noclobber !5
  %78 = fadd contract float %73, %77
  %79 = or i32 %58, 4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %5, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !6, !amdgpu.noclobber !5
  %83 = fadd contract float %78, %82
  %84 = or i32 %58, 5
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %5, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !6, !amdgpu.noclobber !5
  %88 = fadd contract float %83, %87
  %89 = or i32 %58, 6
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !6, !amdgpu.noclobber !5
  %93 = fadd contract float %88, %92
  %94 = or i32 %58, 7
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %5, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !6, !amdgpu.noclobber !5
  %98 = fadd contract float %93, %97
  %99 = add nuw nsw i32 %58, 8
  %100 = add i32 %59, 8
  %101 = icmp eq i32 %100, %17
  br i1 %101, label %18, label %56, !llvm.loop !13
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!6 = !{!7, !7, i64 0}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{i32 0, i32 1024}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
