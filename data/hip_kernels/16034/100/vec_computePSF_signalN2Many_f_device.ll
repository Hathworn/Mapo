; ModuleID = '../data/hip_kernels/16034/100/main.cu'
source_filename = "../data/hip_kernels/16034/100/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_computePSF_signalN2Many_f(i32 %0, i32 %1, i32 %2, float %3, i32 addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !7
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = udiv i32 %20, %17
  %30 = mul i32 %29, %17
  %31 = icmp ugt i32 %20, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %28
  %35 = add i32 %34, %12
  %36 = mul i32 %35, %17
  %37 = add i32 %36, %11
  %38 = icmp slt i32 %37, %0
  br i1 %38, label %39, label %76

39:                                               ; preds = %10
  %40 = freeze i32 %37
  %41 = freeze i32 %1
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %40, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !16, !amdgpu.noclobber !6
  %48 = mul nsw i32 %42, %2
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !20, !amdgpu.noclobber !6
  %53 = fdiv contract float %52, %3
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %45
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !16, !amdgpu.noclobber !6
  %56 = add nsw i32 %55, %48
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %6, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !20, !amdgpu.noclobber !6
  %60 = fdiv contract float %59, %3
  %61 = fmul contract float %53, %53
  %62 = fmul contract float %60, %60
  %63 = fadd contract float %61, %62
  %64 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %45
  %65 = load i32, i32 addrspace(1)* %64, align 4, !tbaa !16, !amdgpu.noclobber !6
  %66 = shl nsw i32 %1, 1
  %67 = mul nsw i32 %42, %66
  %68 = add nsw i32 %65, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %9, i64 %69
  store float %63, float addrspace(1)* %70, align 4, !tbaa !20
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %45
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !6
  %73 = add nsw i32 %72, %67
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %9, i64 %74
  store float 0.000000e+00, float addrspace(1)* %75, align 4, !tbaa !20
  br label %76

76:                                               ; preds = %39, %10
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
