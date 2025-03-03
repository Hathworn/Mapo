; ModuleID = '../data/hip_kernels/8192/316/main.cu'
source_filename = "../data/hip_kernels/8192/316/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21DrawRgbaTextureKernelPfiiiiS_ii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %18
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %17
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %25
  %29 = mul nsw i32 %7, %6
  %30 = sdiv i32 %28, %29
  %31 = mul nsw i32 %30, %29
  %32 = sub nsw i32 %28, %31
  %33 = sdiv i32 %32, %6
  %34 = mul nsw i32 %33, %6
  %35 = sub nsw i32 %32, %34
  %36 = icmp slt i32 %30, 3
  br i1 %36, label %37, label %71

37:                                               ; preds = %8
  switch i32 %30, label %40 [
    i32 0, label %38
    i32 2, label %39
  ]

38:                                               ; preds = %37
  br label %40

39:                                               ; preds = %37
  br label %40

40:                                               ; preds = %37, %39, %38
  %41 = phi i32 [ %30, %37 ], [ 0, %39 ], [ 2, %38 ]
  %42 = add nsw i32 %35, %3
  %43 = icmp slt i32 %42, %1
  %44 = icmp sgt i32 %42, -1
  %45 = and i1 %43, %44
  br i1 %45, label %46, label %71

46:                                               ; preds = %40
  %47 = add nsw i32 %33, %4
  %48 = icmp slt i32 %47, %2
  %49 = icmp sgt i32 %47, -1
  %50 = and i1 %48, %49
  br i1 %50, label %51, label %71

51:                                               ; preds = %46
  %52 = mul i32 %41, %2
  %53 = add i32 %52, %47
  %54 = mul i32 %53, %1
  %55 = add i32 %54, %42
  %56 = mul nsw i32 %29, 3
  %57 = add nsw i32 %32, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %5, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16, !amdgpu.noclobber !5
  %61 = sext i32 %55 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !16, !amdgpu.noclobber !5
  %64 = fsub contract float 1.000000e+00, %60
  %65 = fmul contract float %63, %64
  %66 = sext i32 %28 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %5, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !16, !amdgpu.noclobber !5
  %69 = fmul contract float %60, %68
  %70 = fadd contract float %65, %69
  store float %70, float addrspace(1)* %62, align 4, !tbaa !16
  br label %71

71:                                               ; preds = %40, %46, %51, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
