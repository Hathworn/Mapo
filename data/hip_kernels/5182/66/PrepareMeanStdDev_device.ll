; ModuleID = '../data/hip_kernels/5182/66/main.cu'
source_filename = "../data/hip_kernels/5182/66/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17PrepareMeanStdDevPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = udiv i32 %12, %9
  %16 = mul i32 %15, %9
  %17 = icmp ugt i32 %12, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %14
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %13
  %23 = mul i32 %22, %9
  %24 = add i32 %23, %21
  %25 = mul nsw i32 %3, %2
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %67

27:                                               ; preds = %4
  %28 = freeze i32 %24
  %29 = freeze i32 %2
  %30 = sdiv i32 %28, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %28, %31
  %33 = sitofp i32 %32 to float
  %34 = fmul contract float %33, 2.000000e+00
  %35 = sitofp i32 %2 to float
  %36 = fdiv contract float %34, %35
  %37 = fadd contract float %36, -1.000000e+00
  %38 = sitofp i32 %30 to float
  %39 = fmul contract float %38, 2.000000e+00
  %40 = sitofp i32 %3 to float
  %41 = fdiv contract float %39, %40
  %42 = fadd contract float %41, -1.000000e+00
  %43 = sext i32 %24 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !5
  %46 = fmul contract float %45, %37
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %46, float addrspace(1)* %47, align 4, !tbaa !16
  %48 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %49 = fmul contract float %48, %42
  %50 = add nsw i32 %24, %25
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %49, float addrspace(1)* %52, align 4, !tbaa !16
  %53 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %54 = fmul contract float %37, %53
  %55 = fmul contract float %37, %54
  %56 = shl nsw i32 %25, 1
  %57 = add nsw i32 %24, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  store float %55, float addrspace(1)* %59, align 4, !tbaa !16
  %60 = load float, float addrspace(1)* %44, align 4, !tbaa !16
  %61 = fmul contract float %42, %60
  %62 = fmul contract float %42, %61
  %63 = mul nsw i32 %25, 3
  %64 = add nsw i32 %24, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  store float %62, float addrspace(1)* %66, align 4, !tbaa !16
  br label %67

67:                                               ; preds = %27, %4
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
