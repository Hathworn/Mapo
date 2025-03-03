; ModuleID = '../data/hip_kernels/9206/5/main.cu'
source_filename = "../data/hip_kernels/9206/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15process_kernel3PKfPfi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 8, !tbaa !15
  %21 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !13, !invariant.load !14
  %24 = zext i16 %23 to i32
  %25 = udiv i32 %20, %24
  %26 = mul i32 %25, %24
  %27 = icmp ugt i32 %20, %26
  %28 = zext i1 %27 to i32
  %29 = add i32 %25, %28
  %30 = mul i32 %29, %4
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %33 = add i32 %30, %31
  %34 = mul i32 %33, %17
  %35 = add i32 %34, %32
  %36 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !16
  %37 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !16
  %38 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !16
  %39 = getelementptr i8, i8 addrspace(4)* %5, i64 8
  %40 = bitcast i8 addrspace(4)* %39 to i16 addrspace(4)*
  %41 = load i16, i16 addrspace(4)* %40, align 4, !range !13, !invariant.load !14
  %42 = zext i16 %41 to i32
  %43 = mul i32 %35, %42
  %44 = add i32 %43, %36
  %45 = mul i32 %44, %24
  %46 = add i32 %45, %37
  %47 = mul i32 %46, %12
  %48 = add i32 %47, %38
  %49 = icmp slt i32 %48, %2
  br i1 %49, label %50, label %76

50:                                               ; preds = %3
  %51 = sext i32 %48 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !17, !amdgpu.noclobber !14
  %54 = fcmp olt float %53, 0x39F0000000000000
  %55 = select i1 %54, float 0x41F0000000000000, float 1.000000e+00
  %56 = fmul float %53, %55
  %57 = tail call float @llvm.sqrt.f32(float %56)
  %58 = bitcast float %57 to i32
  %59 = add nsw i32 %58, -1
  %60 = bitcast i32 %59 to float
  %61 = add nsw i32 %58, 1
  %62 = bitcast i32 %61 to float
  %63 = tail call i1 @llvm.amdgcn.class.f32(float %56, i32 608)
  %64 = select i1 %54, float 0x3EF0000000000000, float 1.000000e+00
  %65 = fneg float %62
  %66 = tail call float @llvm.fma.f32(float %65, float %57, float %56)
  %67 = fcmp ogt float %66, 0.000000e+00
  %68 = fneg float %60
  %69 = tail call float @llvm.fma.f32(float %68, float %57, float %56)
  %70 = fcmp ole float %69, 0.000000e+00
  %71 = select i1 %70, float %60, float %57
  %72 = select i1 %67, float %62, float %71
  %73 = fmul float %64, %72
  %74 = select i1 %63, float %56, float %73
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %74, float addrspace(1)* %75, align 4, !tbaa !17
  br label %76

76:                                               ; preds = %50, %3
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
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = !{i32 0, i32 1024}
!17 = !{!18, !18, i64 0}
!18 = !{!"float", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
