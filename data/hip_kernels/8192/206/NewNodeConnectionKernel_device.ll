; ModuleID = '../data/hip_kernels/8192/206/main.cu'
source_filename = "../data/hip_kernels/8192/206/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23NewNodeConnectionKerneliiiPiS_S_Pffif(i32 %0, i32 %1, i32 %2, i32 addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture %6, float %7, i32 %8, float %9) local_unnamed_addr #0 {
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !6
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %28 = add i32 %26, %19
  %29 = mul i32 %28, %15
  %30 = add i32 %29, %27
  %31 = icmp slt i32 %30, 1
  br i1 %31, label %32, label %76

32:                                               ; preds = %10
  %33 = sext i32 %2 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %33
  store i32 1, i32 addrspace(1)* %34, align 4, !tbaa !16
  %35 = mul nsw i32 %8, %1
  %36 = add nsw i32 %35, %0
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %37
  store i32 0, i32 addrspace(1)* %38, align 4, !tbaa !16
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %37
  store i32 0, i32 addrspace(1)* %39, align 4, !tbaa !16
  %40 = mul nsw i32 %8, %0
  %41 = add nsw i32 %40, %1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %42
  store i32 0, i32 addrspace(1)* %43, align 4, !tbaa !16
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %42
  store i32 0, i32 addrspace(1)* %44, align 4, !tbaa !16
  %45 = add nsw i32 %35, %2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %46
  store i32 1, i32 addrspace(1)* %47, align 4, !tbaa !16
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %46
  store i32 0, i32 addrspace(1)* %48, align 4, !tbaa !16
  %49 = mul nsw i32 %8, %2
  %50 = add nsw i32 %49, %1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %51
  store i32 1, i32 addrspace(1)* %52, align 4, !tbaa !16
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %51
  store i32 0, i32 addrspace(1)* %53, align 4, !tbaa !16
  %54 = add nsw i32 %40, %2
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %55
  store i32 1, i32 addrspace(1)* %56, align 4, !tbaa !16
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %55
  store i32 0, i32 addrspace(1)* %57, align 4, !tbaa !16
  %58 = add nsw i32 %49, %0
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %59
  store i32 1, i32 addrspace(1)* %60, align 4, !tbaa !16
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %59
  store i32 0, i32 addrspace(1)* %61, align 4, !tbaa !16
  %62 = sext i32 %1 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %6, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !20, !amdgpu.noclobber !5
  %65 = fmul contract float %64, %7
  %66 = fsub contract float %64, %65
  store float %66, float addrspace(1)* %63, align 4, !tbaa !20
  %67 = sext i32 %0 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %6, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !20
  %70 = fmul contract float %69, %7
  %71 = fsub contract float %69, %70
  store float %71, float addrspace(1)* %68, align 4, !tbaa !20
  %72 = load float, float addrspace(1)* %63, align 4, !tbaa !20
  %73 = fadd contract float %72, %71
  %74 = fmul contract float %73, %9
  %75 = getelementptr inbounds float, float addrspace(1)* %6, i64 %33
  store float %74, float addrspace(1)* %75, align 4, !tbaa !20
  br label %76

76:                                               ; preds = %32, %10
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
