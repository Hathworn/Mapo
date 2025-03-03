; ModuleID = '../data/hip_kernels/14701/0/main.cu'
source_filename = "../data/hip_kernels/14701/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5primePii(i32 addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp sgt i32 %11, %1
  br i1 %12, label %53, label %13

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !5
  %17 = sitofp i32 %16 to float
  %18 = icmp slt i32 %16, 1
  %19 = select i1 %18, float 0x41F0000000000000, float 1.000000e+00
  %20 = fmul float %19, %17
  %21 = tail call float @llvm.sqrt.f32(float %20)
  %22 = bitcast float %21 to i32
  %23 = add nsw i32 %22, -1
  %24 = bitcast i32 %23 to float
  %25 = add nsw i32 %22, 1
  %26 = bitcast i32 %25 to float
  %27 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 608)
  %28 = select i1 %18, float 0x3EF0000000000000, float 1.000000e+00
  %29 = fneg float %26
  %30 = tail call float @llvm.fma.f32(float %29, float %21, float %20)
  %31 = fcmp ogt float %30, 0.000000e+00
  %32 = fneg float %24
  %33 = tail call float @llvm.fma.f32(float %32, float %21, float %20)
  %34 = fcmp ole float %33, 0.000000e+00
  %35 = select i1 %34, float %24, float %21
  %36 = select i1 %31, float %26, float %35
  %37 = fmul float %28, %36
  %38 = select i1 %27, float %20, float %37
  %39 = fadd contract float %38, 1.000000e+00
  %40 = and i32 %16, 1
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %52, label %42

42:                                               ; preds = %13
  %43 = fcmp contract ult float %39, 3.000000e+00
  br i1 %43, label %53, label %47

44:                                               ; preds = %47
  %45 = sitofp i32 %51 to float
  %46 = fcmp contract ult float %39, %45
  br i1 %46, label %53, label %47, !llvm.loop !11

47:                                               ; preds = %42, %44
  %48 = phi i32 [ %51, %44 ], [ 3, %42 ]
  %49 = srem i32 %16, %48
  %50 = icmp eq i32 %49, 0
  %51 = add nuw nsw i32 %48, 2
  br i1 %50, label %52, label %44

52:                                               ; preds = %47, %13
  store i32 1, i32 addrspace(1)* %15, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %44, %52, %42, %2
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
