; ModuleID = '../data/hip_kernels/16034/129/main.cu'
source_filename = "../data/hip_kernels/16034/129/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_divCorrelation(i32 %0, float addrspace(1)* nocapture %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = udiv i32 %15, %12
  %25 = mul i32 %24, %12
  %26 = icmp ugt i32 %15, %25
  %27 = zext i1 %26 to i32
  %28 = add i32 %24, %27
  %29 = mul i32 %28, %23
  %30 = add i32 %29, %7
  %31 = mul i32 %30, %12
  %32 = add i32 %31, %6
  %33 = icmp slt i32 %32, %0
  br i1 %33, label %34, label %77

34:                                               ; preds = %5
  %35 = mul nsw i32 %2, %2
  %36 = freeze i32 %32
  %37 = freeze i32 %35
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !16, !amdgpu.noclobber !6
  %44 = sext i32 %38 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %4, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !6
  %47 = fmul contract float %43, %46
  %48 = fcmp contract ogt float %47, 0.000000e+00
  %49 = sext i32 %32 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  br i1 %48, label %51, label %75

51:                                               ; preds = %34
  %52 = load float, float addrspace(1)* %50, align 4, !tbaa !16, !amdgpu.noclobber !6
  %53 = fcmp olt float %47, 0x39F0000000000000
  %54 = select i1 %53, float 0x41F0000000000000, float 1.000000e+00
  %55 = fmul float %47, %54
  %56 = tail call float @llvm.sqrt.f32(float %55)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 608)
  %63 = select i1 %53, float 0x3EF0000000000000, float 1.000000e+00
  %64 = fneg float %61
  %65 = tail call float @llvm.fma.f32(float %64, float %56, float %55)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = fneg float %59
  %68 = tail call float @llvm.fma.f32(float %67, float %56, float %55)
  %69 = fcmp ole float %68, 0.000000e+00
  %70 = select i1 %69, float %59, float %56
  %71 = select i1 %66, float %61, float %70
  %72 = fmul float %63, %71
  %73 = select i1 %62, float %55, float %72
  %74 = fdiv contract float %52, %73
  br label %75

75:                                               ; preds = %34, %51
  %76 = phi float [ %74, %51 ], [ -1.000000e+00, %34 ]
  store float %76, float addrspace(1)* %50, align 4, !tbaa !16
  br label %77

77:                                               ; preds = %75, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
