; ModuleID = '../data/hip_kernels/16034/105/main.cu'
source_filename = "../data/hip_kernels/16034/105/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_signalNsqrtMany_fcrop(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4, float %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = udiv i32 %18, %15
  %28 = mul i32 %27, %15
  %29 = icmp ugt i32 %18, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %26
  %33 = add i32 %32, %10
  %34 = mul i32 %33, %15
  %35 = add i32 %34, %9
  %36 = icmp slt i32 %35, %0
  br i1 %36, label %37, label %86

37:                                               ; preds = %8
  %38 = freeze i32 %35
  %39 = freeze i32 %1
  %40 = sdiv i32 %38, %39
  %41 = mul i32 %40, %39
  %42 = sub i32 %38, %41
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !6
  %46 = shl i32 %2, 1
  %47 = mul i32 %46, %40
  %48 = add nsw i32 %45, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %4, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !20, !amdgpu.noclobber !6
  %52 = fdiv contract float %51, %5
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %43
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !16, !amdgpu.noclobber !6
  %55 = add nsw i32 %54, %47
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %4, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !20, !amdgpu.noclobber !6
  %59 = fdiv contract float %58, %5
  %60 = fmul contract float %52, %52
  %61 = fmul contract float %59, %59
  %62 = fadd contract float %60, %61
  %63 = fcmp olt float %62, 0x39F0000000000000
  %64 = select i1 %63, float 0x41F0000000000000, float 1.000000e+00
  %65 = fmul float %62, %64
  %66 = tail call float @llvm.sqrt.f32(float %65)
  %67 = bitcast float %66 to i32
  %68 = add nsw i32 %67, -1
  %69 = bitcast i32 %68 to float
  %70 = add nsw i32 %67, 1
  %71 = bitcast i32 %70 to float
  %72 = tail call i1 @llvm.amdgcn.class.f32(float %65, i32 608)
  %73 = select i1 %63, float 0x3EF0000000000000, float 1.000000e+00
  %74 = fneg float %71
  %75 = tail call float @llvm.fma.f32(float %74, float %66, float %65)
  %76 = fcmp ogt float %75, 0.000000e+00
  %77 = fneg float %69
  %78 = tail call float @llvm.fma.f32(float %77, float %66, float %65)
  %79 = fcmp ole float %78, 0.000000e+00
  %80 = select i1 %79, float %69, float %66
  %81 = select i1 %76, float %71, float %80
  %82 = fmul float %73, %81
  %83 = select i1 %72, float %65, float %82
  %84 = sext i32 %35 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  store float %83, float addrspace(1)* %85, align 4, !tbaa !20
  br label %86

86:                                               ; preds = %37, %8
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
