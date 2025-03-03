; ModuleID = '../data/hip_kernels/18041/27/main.cu'
source_filename = "../data/hip_kernels/18041/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ3dotiPfS_S_E5cache = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3dotiPfS_S_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %37

18:                                               ; preds = %4
  %19 = udiv i32 %14, %11
  %20 = mul i32 %19, %11
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %11
  br label %25

25:                                               ; preds = %18, %25
  %26 = phi float [ 0.000000e+00, %18 ], [ %34, %25 ]
  %27 = phi i32 [ %16, %18 ], [ %35, %25 ]
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !6
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !6
  %33 = fmul contract float %30, %32
  %34 = fadd contract float %26, %33
  %35 = add i32 %24, %27
  %36 = icmp slt i32 %35, %0
  br i1 %36, label %25, label %37, !llvm.loop !20

37:                                               ; preds = %25, %4
  %38 = phi float [ 0.000000e+00, %4 ], [ %34, %25 ]
  %39 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ3dotiPfS_S_E5cache, i32 0, i32 %5
  store float %38, float addrspace(3)* %39, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i16 %10, 2
  br i1 %40, label %56, label %41

41:                                               ; preds = %37
  %42 = lshr i32 %11, 1
  br label %43

43:                                               ; preds = %41, %52
  %44 = phi i32 [ %53, %52 ], [ %42, %41 ]
  %45 = icmp slt i32 %5, %44
  br i1 %45, label %46, label %52

46:                                               ; preds = %43
  %47 = add nsw i32 %44, %5
  %48 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ3dotiPfS_S_E5cache, i32 0, i32 %47
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !16
  %50 = load float, float addrspace(3)* %39, align 4, !tbaa !16
  %51 = fadd contract float %49, %50
  store float %51, float addrspace(3)* %39, align 4, !tbaa !16
  br label %52

52:                                               ; preds = %46, %43
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = sdiv i32 %44, 2
  %54 = add nsw i32 %44, 1
  %55 = icmp ult i32 %54, 3
  br i1 %55, label %56, label %43, !llvm.loop !22

56:                                               ; preds = %52, %37
  %57 = icmp eq i32 %5, 0
  br i1 %57, label %58, label %62

58:                                               ; preds = %56
  %59 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ3dotiPfS_S_E5cache, i32 0, i32 0), align 16, !tbaa !16
  %60 = zext i32 %6 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %3, i64 %60
  store float %59, float addrspace(1)* %61, align 4, !tbaa !16
  br label %62

62:                                               ; preds = %58, %56
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
