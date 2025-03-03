; ModuleID = '../data/hip_kernels/6565/11/main.cu'
source_filename = "../data/hip_kernels/6565/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20calcDenseBackwardGPUPfS_S_S_S_S_S_S_iiiiiiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readnone %4, float addrspace(1)* nocapture %5, float addrspace(1)* nocapture %6, float addrspace(1)* nocapture readnone %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, float %15, float %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %19
  %34 = add i32 %33, %18
  %35 = mul i32 %34, %27
  %36 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %37 = add i32 %35, %36
  %38 = freeze i32 %37
  %39 = freeze i32 %12
  %40 = sdiv i32 %38, %39
  %41 = mul i32 %10, %9
  %42 = mul i32 %41, %8
  %43 = mul i32 %42, %11
  %44 = mul i32 %43, %12
  %45 = icmp slt i32 %37, %44
  br i1 %45, label %46, label %102

46:                                               ; preds = %17
  %47 = mul i32 %40, %39
  %48 = sub i32 %38, %47
  %49 = freeze i32 %9
  %50 = sdiv i32 %40, %49
  %51 = mul i32 %50, %49
  %52 = sub i32 %40, %51
  %53 = freeze i32 %10
  %54 = sdiv i32 %50, %53
  %55 = mul i32 %54, %53
  %56 = sub i32 %50, %55
  %57 = freeze i32 %11
  %58 = sdiv i32 %54, %57
  %59 = mul i32 %58, %57
  %60 = sub i32 %54, %59
  %61 = mul nsw i32 %13, %12
  %62 = mul nsw i32 %61, %14
  %63 = mul nsw i32 %62, %58
  %64 = add nsw i32 %63, %48
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16, !amdgpu.noclobber !14
  %68 = mul i32 %48, %11
  %69 = add i32 %60, %68
  %70 = mul i32 %69, %10
  %71 = add i32 %70, %56
  %72 = mul i32 %71, %9
  %73 = add i32 %72, %52
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %3, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !14
  %77 = mul nsw i32 %48, %8
  %78 = add nsw i32 %58, %77
  %79 = shl nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %5, i64 %80
  store float %67, float addrspace(1)* %81, align 4, !tbaa !16
  %82 = fmul contract float %67, %76
  %83 = sext i32 %40 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fadd contract float %82, %85
  store float %86, float addrspace(1)* %84, align 4, !tbaa !16
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %90 = add nuw nsw i32 %79, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %5, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fmul contract float %93, %15
  %95 = fadd contract float %89, %94
  %96 = fmul contract float %88, %95
  %97 = fmul contract float %76, %16
  %98 = fadd contract float %97, %96
  %99 = getelementptr inbounds float, float addrspace(1)* %6, i64 %74
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !16
  %101 = fadd contract float %100, %98
  store float %101, float addrspace(1)* %99, align 4, !tbaa !16
  br label %102

102:                                              ; preds = %46, %17
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
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
