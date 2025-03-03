; ModuleID = '../data/hip_kernels/43/6/main.cu'
source_filename = "../data/hip_kernels/43/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z25chol_kernel_optimized_divPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = sub nsw i32 0, %11
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %14, label %40

14:                                               ; preds = %3
  %15 = mul i32 %1, 2049
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = fcmp olt float %18, 0x39F0000000000000
  %20 = select i1 %19, float 0x41F0000000000000, float 1.000000e+00
  %21 = fmul float %18, %20
  %22 = tail call float @llvm.sqrt.f32(float %21)
  %23 = bitcast float %22 to i32
  %24 = add nsw i32 %23, -1
  %25 = bitcast i32 %24 to float
  %26 = add nsw i32 %23, 1
  %27 = bitcast i32 %26 to float
  %28 = tail call i1 @llvm.amdgcn.class.f32(float %21, i32 608)
  %29 = select i1 %19, float 0x3EF0000000000000, float 1.000000e+00
  %30 = fneg float %27
  %31 = tail call float @llvm.fma.f32(float %30, float %22, float %21)
  %32 = fcmp ogt float %31, 0.000000e+00
  %33 = fneg float %25
  %34 = tail call float @llvm.fma.f32(float %33, float %22, float %21)
  %35 = fcmp ole float %34, 0.000000e+00
  %36 = select i1 %35, float %25, float %22
  %37 = select i1 %32, float %27, float %36
  %38 = fmul float %29, %37
  %39 = select i1 %28, float %21, float %38
  store float %39, float addrspace(1)* %17, align 4, !tbaa !7
  br label %40

40:                                               ; preds = %14, %3
  %41 = add nsw i32 %1, 1
  %42 = icmp eq i32 %4, 0
  br i1 %42, label %43, label %65

43:                                               ; preds = %40
  %44 = add i32 %41, %11
  %45 = icmp uge i32 %44, %41
  %46 = icmp ult i32 %44, 2048
  %47 = and i1 %45, %46
  br i1 %47, label %48, label %65

48:                                               ; preds = %43
  %49 = shl i32 %1, 11
  %50 = mul i32 %1, 2049
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  br label %53

53:                                               ; preds = %48, %53
  %54 = phi i32 [ %44, %48 ], [ %61, %53 ]
  %55 = load float, float addrspace(1)* %52, align 4, !tbaa !7
  %56 = add nuw i32 %54, %49
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fdiv contract float %59, %55
  store float %60, float addrspace(1)* %58, align 4, !tbaa !7
  %61 = add i32 %54, %2
  %62 = icmp uge i32 %61, %41
  %63 = icmp ult i32 %61, 2048
  %64 = and i1 %62, %63
  br i1 %64, label %53, label %65, !llvm.loop !11

65:                                               ; preds = %53, %43, %40
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
