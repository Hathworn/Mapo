; ModuleID = '../data/hip_kernels/18468/16/main.cu'
source_filename = "../data/hip_kernels/18468/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8reduce_aPfS_E5sdata = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8reduce_aPfS_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ8reduce_aPfS_E5sdata, i32 0, i32 %3
  store float 0.000000e+00, float addrspace(3)* %4, align 4, !tbaa !5
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !9, !invariant.load !10
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %9
  %15 = add i32 %14, %3
  %16 = icmp ult i32 %15, 4096
  br i1 %16, label %17, label %27

17:                                               ; preds = %2
  %18 = zext i32 %15 to i64
  %19 = udiv i32 %12, %9
  %20 = mul i32 %19, %9
  %21 = icmp ugt i32 %12, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %9
  %25 = zext i32 %24 to i64
  br label %29

26:                                               ; preds = %29
  store float %34, float addrspace(3)* %4, align 4, !tbaa !5
  br label %27

27:                                               ; preds = %26, %2
  %28 = icmp ult i16 %8, 2
  br i1 %28, label %37, label %39

29:                                               ; preds = %17, %29
  %30 = phi float [ 0.000000e+00, %17 ], [ %34, %29 ]
  %31 = phi i64 [ %18, %17 ], [ %35, %29 ]
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !10
  %34 = fadd contract float %33, %30
  %35 = add nuw nsw i64 %31, %25
  %36 = icmp ult i64 %35, 4096
  br i1 %36, label %29, label %26, !llvm.loop !20

37:                                               ; preds = %49, %27
  %38 = icmp eq i32 %3, 0
  br i1 %38, label %51, label %54

39:                                               ; preds = %27, %49
  %40 = phi i32 [ %41, %49 ], [ %9, %27 ]
  %41 = lshr i32 %40, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %42 = icmp ult i32 %3, %41
  br i1 %42, label %43, label %49

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %41, %3
  %45 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ8reduce_aPfS_E5sdata, i32 0, i32 %44
  %46 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %47 = load float, float addrspace(3)* %4, align 4, !tbaa !5
  %48 = fadd contract float %46, %47
  store float %48, float addrspace(3)* %4, align 4, !tbaa !5
  br label %49

49:                                               ; preds = %39, %43
  %50 = icmp ult i32 %40, 4
  br i1 %50, label %37, label %39, !llvm.loop !22

51:                                               ; preds = %37
  %52 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ8reduce_aPfS_E5sdata, i32 0, i32 0), align 16, !tbaa !5
  %53 = atomicrmw fadd float addrspace(1)* %1, float %52 syncscope("agent-one-as") monotonic, align 4
  br label %54

54:                                               ; preds = %51, %37
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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
