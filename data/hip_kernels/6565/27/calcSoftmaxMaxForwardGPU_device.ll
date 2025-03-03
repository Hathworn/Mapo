; ModuleID = '../data/hip_kernels/6565/27/main.cu'
source_filename = "../data/hip_kernels/6565/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@cache = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24calcSoftmaxMaxForwardGPUPfS_Piiij(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !7
  %17 = mul i32 %8, %13
  %18 = add i32 %17, %7
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %13
  %25 = icmp ult i32 %18, %5
  br i1 %25, label %26, label %37

26:                                               ; preds = %6, %26
  %27 = phi i32 [ %35, %26 ], [ %18, %6 ]
  %28 = phi i32 [ %34, %26 ], [ 0, %6 ]
  %29 = phi float [ %33, %26 ], [ -1.000000e+00, %6 ]
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !6
  %33 = tail call float @llvm.maxnum.f32(float %29, float %32)
  %34 = add i32 %28, %24
  %35 = add i32 %34, %18
  %36 = icmp ult i32 %35, %5
  br i1 %36, label %26, label %37, !llvm.loop !20

37:                                               ; preds = %26, %6
  %38 = phi float [ -1.000000e+00, %6 ], [ %33, %26 ]
  %39 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %18
  store float %38, float addrspace(3)* %39, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i16 %12, 2
  br i1 %40, label %65, label %41

41:                                               ; preds = %37
  %42 = and i32 %13, 1
  %43 = icmp eq i32 %42, 0
  %44 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %17
  %45 = add nsw i32 %13, -1
  %46 = add i32 %45, %17
  %47 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %46
  br label %48

48:                                               ; preds = %41, %63
  %49 = phi i32 [ %13, %41 ], [ %50, %63 ]
  %50 = lshr i32 %49, 1
  %51 = icmp ult i32 %7, %50
  br i1 %51, label %52, label %58

52:                                               ; preds = %48
  %53 = load float, float addrspace(3)* %39, align 4, !tbaa !16
  %54 = add i32 %50, %18
  %55 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !16
  %57 = tail call float @llvm.maxnum.f32(float %53, float %56)
  store float %57, float addrspace(3)* %39, align 4, !tbaa !16
  br label %58

58:                                               ; preds = %52, %48
  br i1 %43, label %63, label %59

59:                                               ; preds = %58
  %60 = load float, float addrspace(3)* %44, align 4, !tbaa !16
  %61 = load float, float addrspace(3)* %47, align 4, !tbaa !16
  %62 = tail call float @llvm.maxnum.f32(float %60, float %61)
  store float %62, float addrspace(3)* %44, align 4, !tbaa !16
  br label %63

63:                                               ; preds = %59, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp ult i32 %49, 4
  br i1 %64, label %65, label %48, !llvm.loop !22

65:                                               ; preds = %63, %37
  %66 = icmp eq i32 %7, 0
  br i1 %66, label %67, label %78

67:                                               ; preds = %65, %67
  %68 = cmpxchg i32 addrspace(1)* %2, i32 0, i32 1 syncscope("agent-one-as") monotonic monotonic, align 4
  %69 = extractvalue { i32, i1 } %68, 1
  br i1 %69, label %70, label %67, !llvm.loop !23

70:                                               ; preds = %67
  %71 = zext i32 %8 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %17
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !16
  %76 = tail call float @llvm.maxnum.f32(float %73, float %75)
  store float %76, float addrspace(1)* %72, align 4, !tbaa !16
  %77 = atomicrmw xchg i32 addrspace(1)* %2, i32 0 syncscope("agent-one-as") monotonic, align 4
  br label %78

78:                                               ; preds = %70, %65
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!23 = distinct !{!23, !21}
