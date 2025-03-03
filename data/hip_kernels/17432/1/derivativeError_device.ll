; ModuleID = '../data/hip_kernels/17432/1/main.cu'
source_filename = "../data/hip_kernels/17432/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15derivativeErrorPfS_S_E5sdata = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15derivativeErrorPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 16
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 8, !tbaa !7
  %17 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = udiv i32 %16, %20
  %22 = mul i32 %21, %20
  %23 = icmp ugt i32 %16, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %13
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ15derivativeErrorPfS_S_E5sdata, i32 0, i32 %11
  store float %30, float addrspace(3)* %31, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i16 %8, 2
  br i1 %32, label %33, label %35

33:                                               ; preds = %45, %3
  %34 = icmp eq i32 %11, 0
  br i1 %34, label %47, label %54

35:                                               ; preds = %3, %45
  %36 = phi i32 [ %37, %45 ], [ %9, %3 ]
  %37 = lshr i32 %36, 1
  %38 = icmp ult i32 %11, %37
  br i1 %38, label %39, label %45

39:                                               ; preds = %35
  %40 = add nuw nsw i32 %37, %11
  %41 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ15derivativeErrorPfS_S_E5sdata, i32 0, i32 %40
  %42 = load float, float addrspace(3)* %41, align 4, !tbaa !16
  %43 = load float, float addrspace(3)* %31, align 4, !tbaa !16
  %44 = fadd contract float %42, %43
  store float %44, float addrspace(3)* %31, align 4, !tbaa !16
  br label %45

45:                                               ; preds = %39, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %46 = icmp ult i32 %36, 4
  br i1 %46, label %33, label %35, !llvm.loop !20

47:                                               ; preds = %33
  %48 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ15derivativeErrorPfS_S_E5sdata, i32 0, i32 %4
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !16
  %50 = mul i32 %4, %20
  %51 = add i32 %50, %13
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  store float %49, float addrspace(1)* %53, align 4, !tbaa !16
  br label %54

54:                                               ; preds = %47, %33
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !12, i64 16}
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
