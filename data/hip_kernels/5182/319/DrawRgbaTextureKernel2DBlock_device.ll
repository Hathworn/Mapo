; ModuleID = '../data/hip_kernels/5182/319/main.cu'
source_filename = "../data/hip_kernels/5182/319/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z28DrawRgbaTextureKernel2DBlockPfiiiiS_ii(float addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = udiv i32 %17, %14
  %24 = mul i32 %23, %14
  %25 = icmp ugt i32 %17, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %18
  %29 = add i32 %28, %10
  %30 = mul i32 %29, %22
  %31 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %32 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %33 = add i32 %30, %31
  %34 = mul i32 %33, %14
  %35 = add i32 %34, %32
  %36 = mul nsw i32 %7, %6
  %37 = mul i32 %10, %22
  %38 = icmp slt i32 %18, 3
  br i1 %38, label %39, label %75

39:                                               ; preds = %8
  switch i32 %18, label %42 [
    i32 0, label %40
    i32 2, label %41
  ]

40:                                               ; preds = %39
  br label %42

41:                                               ; preds = %39
  br label %42

42:                                               ; preds = %39, %41, %40
  %43 = phi i32 [ %18, %39 ], [ 0, %41 ], [ 2, %40 ]
  %44 = add nsw i32 %32, %3
  %45 = icmp slt i32 %44, %1
  %46 = icmp sgt i32 %44, -1
  %47 = and i1 %45, %46
  br i1 %47, label %48, label %75

48:                                               ; preds = %42
  %49 = add i32 %31, %4
  %50 = add i32 %49, %37
  %51 = icmp slt i32 %50, %2
  %52 = icmp sgt i32 %50, -1
  %53 = and i1 %51, %52
  br i1 %53, label %54, label %75

54:                                               ; preds = %48
  %55 = mul i32 %43, %2
  %56 = add i32 %55, %50
  %57 = mul i32 %56, %1
  %58 = add i32 %57, %44
  %59 = sub i32 3, %18
  %60 = mul i32 %36, %59
  %61 = add i32 %60, %35
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %5, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !16, !amdgpu.noclobber !5
  %65 = sext i32 %58 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !5
  %68 = fsub contract float 1.000000e+00, %64
  %69 = fmul contract float %67, %68
  %70 = sext i32 %35 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %5, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !5
  %73 = fmul contract float %64, %72
  %74 = fadd contract float %69, %73
  store float %74, float addrspace(1)* %66, align 4, !tbaa !16
  br label %75

75:                                               ; preds = %42, %48, %54, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
