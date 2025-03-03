; ModuleID = '../data/hip_kernels/5182/44/main.cu'
source_filename = "../data/hip_kernels/5182/44/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26LSTMGateGradientKernelBPTTPfS_S_S_S_S_S_S_S_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = udiv i32 %20, %17
  %24 = mul i32 %23, %17
  %25 = icmp ugt i32 %20, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %30 = add i32 %28, %21
  %31 = mul i32 %30, %17
  %32 = add i32 %31, %29
  %33 = add nsw i32 %10, %9
  %34 = add nsw i32 %33, %11
  %35 = add nsw i32 %34, 1
  %36 = mul nsw i32 %35, %10
  %37 = sdiv i32 %36, %11
  %38 = icmp slt i32 %32, %37
  br i1 %38, label %39, label %95

39:                                               ; preds = %12
  %40 = freeze i32 %32
  %41 = freeze i32 %35
  %42 = sdiv i32 %40, %41
  %43 = mul i32 %42, %41
  %44 = sub i32 %40, %43
  %45 = icmp sgt i32 %44, -1
  %46 = icmp slt i32 %44, %9
  %47 = select i1 %45, i1 %46, i1 false
  %48 = icmp slt i32 %44, %33
  %49 = xor i1 %46, true
  %50 = select i1 %49, i1 %48, i1 false
  %51 = icmp slt i32 %44, %34
  %52 = xor i1 %48, true
  %53 = select i1 %52, i1 %51, i1 false
  %54 = icmp eq i32 %44, %34
  %55 = uitofp i1 %47 to float
  %56 = sext i32 %44 to i64
  %57 = select i1 %47, i64 %56, i64 0
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !16, !amdgpu.noclobber !5
  %60 = fmul contract float %59, %55
  %61 = uitofp i1 %50 to float
  %62 = sub nsw i32 %44, %9
  %63 = sext i32 %62 to i64
  %64 = select i1 %50, i64 %63, i64 0
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16, !amdgpu.noclobber !5
  %67 = fmul contract float %66, %61
  %68 = fadd contract float %60, %67
  %69 = uitofp i1 %53 to float
  %70 = mul nsw i32 %42, %11
  %71 = sub i32 %62, %10
  %72 = add nsw i32 %71, %70
  %73 = sext i32 %72 to i64
  %74 = select i1 %53, i64 %73, i64 0
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !16, !amdgpu.noclobber !5
  %77 = fmul contract float %76, %69
  %78 = fadd contract float %68, %77
  %79 = uitofp i1 %54 to float
  %80 = fadd contract float %78, %79
  %81 = sext i32 %42 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %5, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !16, !amdgpu.noclobber !5
  %84 = fmul contract float %83, %80
  %85 = sext i32 %32 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %6, i64 %85
  store float %84, float addrspace(1)* %86, align 4, !tbaa !16
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = fmul contract float %88, %80
  %90 = getelementptr inbounds float, float addrspace(1)* %7, i64 %85
  store float %89, float addrspace(1)* %90, align 4, !tbaa !16
  %91 = getelementptr inbounds float, float addrspace(1)* %4, i64 %81
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16
  %93 = fmul contract float %80, %92
  %94 = getelementptr inbounds float, float addrspace(1)* %8, i64 %85
  store float %93, float addrspace(1)* %94, align 4, !tbaa !16
  br label %95

95:                                               ; preds = %39, %12
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
