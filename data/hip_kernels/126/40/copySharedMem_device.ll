; ModuleID = '../data/hip_kernels/126/40/main.cu'
source_filename = "../data/hip_kernels/126/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13copySharedMemPfPKfE4tile = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13copySharedMemPfPKf(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = shl i32 %3, 5
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = shl i32 %7, 5
  %9 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %10 = add i32 %8, %9
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !5
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = shl i32 %23, 5
  %25 = mul nsw i32 %10, %24
  %26 = add nsw i32 %25, %6
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !15
  %30 = shl nuw nsw i32 %9, 5
  %31 = add nuw nsw i32 %30, %5
  %32 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13copySharedMemPfPKfE4tile, i32 0, i32 %31
  store float %29, float addrspace(3)* %32, align 4, !tbaa !16
  %33 = add nsw i32 %10, 8
  %34 = mul nsw i32 %33, %24
  %35 = add nsw i32 %34, %6
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !16, !amdgpu.noclobber !15
  %39 = shl nuw nsw i32 %9, 5
  %40 = add nuw nsw i32 %39, 256
  %41 = add nuw nsw i32 %40, %5
  %42 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13copySharedMemPfPKfE4tile, i32 0, i32 %41
  store float %38, float addrspace(3)* %42, align 4, !tbaa !16
  %43 = add nsw i32 %10, 16
  %44 = mul nsw i32 %43, %24
  %45 = add nsw i32 %44, %6
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !15
  %49 = shl nuw nsw i32 %9, 5
  %50 = add nuw nsw i32 %49, 512
  %51 = add nuw nsw i32 %50, %5
  %52 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13copySharedMemPfPKfE4tile, i32 0, i32 %51
  store float %48, float addrspace(3)* %52, align 4, !tbaa !16
  %53 = add nsw i32 %10, 24
  %54 = mul nsw i32 %53, %24
  %55 = add nsw i32 %54, %6
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !16, !amdgpu.noclobber !15
  %59 = shl nuw nsw i32 %9, 5
  %60 = add nuw nsw i32 %59, 768
  %61 = add nuw nsw i32 %60, %5
  %62 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ13copySharedMemPfPKfE4tile, i32 0, i32 %61
  store float %58, float addrspace(3)* %62, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = load float, float addrspace(3)* %32, align 4, !tbaa !16
  %64 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  store float %63, float addrspace(1)* %64, align 4, !tbaa !16
  %65 = load float, float addrspace(3)* %42, align 4, !tbaa !16
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %36
  store float %65, float addrspace(1)* %66, align 4, !tbaa !16
  %67 = load float, float addrspace(3)* %52, align 4, !tbaa !16
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  store float %67, float addrspace(1)* %68, align 4, !tbaa !16
  %69 = load float, float addrspace(3)* %62, align 4, !tbaa !16
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %56
  store float %69, float addrspace(1)* %70, align 4, !tbaa !16
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
