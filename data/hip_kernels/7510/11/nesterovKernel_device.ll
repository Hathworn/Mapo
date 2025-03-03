; ModuleID = '../data/hip_kernels/7510/11/main.cu'
source_filename = "../data/hip_kernels/7510/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14nesterovKerneliPiS_iPfS0_ffS0_S0_(i32 %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture %4, float addrspace(1)* nocapture readonly %5, float %6, float %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !4, !amdgpu.noclobber !8
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %12
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !4, !amdgpu.noclobber !8
  %17 = icmp ne i32 %14, -1
  %18 = icmp sgt i32 %16, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %67

20:                                               ; preds = %10
  %21 = sitofp i32 %16 to float
  %22 = fdiv contract float 1.000000e+00, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !9, !invariant.load !8
  %28 = zext i16 %27 to i32
  %29 = mul i32 %23, %28
  %30 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !10
  %31 = add i32 %29, %30
  %32 = mul i32 %31, %0
  %33 = mul nsw i32 %14, %3
  %34 = add nsw i32 %32, %33
  %35 = add nsw i32 %34, %0
  %36 = add nsw i32 %33, %3
  %37 = tail call i32 @llvm.smin.i32(i32 %35, i32 %36)
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %67

39:                                               ; preds = %20
  %40 = mul nsw i32 %11, %3
  %41 = add nsw i32 %32, %40
  %42 = fadd contract float %7, 1.000000e+00
  br label %43

43:                                               ; preds = %39, %43
  %44 = phi i32 [ %34, %39 ], [ %64, %43 ]
  %45 = phi i32 [ %41, %39 ], [ %65, %43 ]
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %8, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !11
  %49 = getelementptr inbounds float, float addrspace(1)* %9, i64 %46
  store float %48, float addrspace(1)* %49, align 4, !tbaa !11
  %50 = sext i32 %45 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %5, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !11
  %53 = fmul contract float %22, %52
  %54 = load float, float addrspace(1)* %47, align 4, !tbaa !11
  %55 = fmul contract float %54, %7
  %56 = fmul contract float %53, %6
  %57 = fsub contract float %55, %56
  store float %57, float addrspace(1)* %47, align 4, !tbaa !11
  %58 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11
  %60 = fmul contract float %48, %7
  %61 = fsub contract float %59, %60
  %62 = fmul contract float %42, %57
  %63 = fadd contract float %61, %62
  store float %63, float addrspace(1)* %58, align 4, !tbaa !11
  %64 = add nsw i32 %44, 1
  %65 = add nsw i32 %45, 1
  %66 = icmp slt i32 %64, %37
  br i1 %66, label %43, label %67, !llvm.loop !13

67:                                               ; preds = %43, %20, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{i32 0, i32 1024}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
