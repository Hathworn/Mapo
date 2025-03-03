; ModuleID = '../data/hip_kernels/9767/1/main.cu'
source_filename = "../data/hip_kernels/9767/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ3dotPfS_S_iiE5cache = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z3dotPfS_S_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %11
  %17 = add i32 %16, %6
  %18 = icmp slt i32 %17, %4
  br i1 %18, label %19, label %37

19:                                               ; preds = %5
  %20 = udiv i32 %14, %11
  %21 = mul i32 %20, %11
  %22 = icmp ugt i32 %14, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %11
  br label %26

26:                                               ; preds = %19, %26
  %27 = phi i32 [ %17, %19 ], [ %28, %26 ]
  %28 = add i32 %25, %27
  %29 = icmp slt i32 %28, %4
  br i1 %29, label %26, label %30, !llvm.loop !16

30:                                               ; preds = %26
  %31 = sext i32 %27 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !18, !amdgpu.noclobber !6
  %34 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !18, !amdgpu.noclobber !6
  %36 = fmul contract float %33, %35
  br label %37

37:                                               ; preds = %30, %5
  %38 = phi float [ %36, %30 ], [ 0.000000e+00, %5 ]
  %39 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ3dotPfS_S_iiE5cache, i32 0, i32 %6
  store float %38, float addrspace(3)* %39, align 4, !tbaa !18
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
  %45 = icmp slt i32 %6, %44
  br i1 %45, label %46, label %52

46:                                               ; preds = %43
  %47 = add nsw i32 %44, %6
  %48 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ3dotPfS_S_iiE5cache, i32 0, i32 %47
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !18
  %50 = load float, float addrspace(3)* %39, align 4, !tbaa !18
  %51 = fadd contract float %49, %50
  store float %51, float addrspace(3)* %39, align 4, !tbaa !18
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
  %57 = icmp eq i32 %6, 0
  br i1 %57, label %58, label %62

58:                                               ; preds = %56
  %59 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ3dotPfS_S_iiE5cache, i32 0, i32 0), align 16, !tbaa !18
  %60 = zext i32 %15 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %2, i64 %60
  store float %59, float addrspace(1)* %61, align 4, !tbaa !18
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
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"float", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
