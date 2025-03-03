; ModuleID = '../data/hip_kernels/6565/28/main.cu'
source_filename = "../data/hip_kernels/6565/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@cache = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z24calcSoftmaxSumForwardGPUPfS_S_S_Piiij(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %17 = bitcast i8 addrspace(4)* %16 to i32 addrspace(4)*
  %18 = load i32, i32 addrspace(4)* %17, align 4, !tbaa !7
  %19 = mul i32 %10, %15
  %20 = add i32 %19, %9
  %21 = udiv i32 %18, %15
  %22 = mul i32 %21, %15
  %23 = icmp ugt i32 %18, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %15
  %27 = icmp ult i32 %20, %7
  br i1 %27, label %28, label %59

28:                                               ; preds = %8
  %29 = zext i32 %10 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %2, i64 %29
  br label %31

31:                                               ; preds = %28, %31
  %32 = phi i32 [ %20, %28 ], [ %57, %31 ]
  %33 = phi i32 [ 0, %28 ], [ %56, %31 ]
  %34 = phi float [ 0.000000e+00, %28 ], [ %55, %31 ]
  %35 = zext i32 %32 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16
  %38 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %39 = fsub contract float %37, %38
  %40 = fmul float %39, 0x3FF7154760000000
  %41 = tail call float @llvm.rint.f32(float %40)
  %42 = fcmp ogt float %39, 0x40562E4300000000
  %43 = fcmp olt float %39, 0xC059D1DA00000000
  %44 = fneg float %40
  %45 = tail call float @llvm.fma.f32(float %39, float 0x3FF7154760000000, float %44)
  %46 = tail call float @llvm.fma.f32(float %39, float 0x3E54AE0BE0000000, float %45)
  %47 = fsub float %40, %41
  %48 = fadd float %46, %47
  %49 = tail call float @llvm.exp2.f32(float %48)
  %50 = fptosi float %41 to i32
  %51 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 %50)
  %52 = select i1 %43, float 0.000000e+00, float %51
  %53 = select i1 %42, float 0x7FF0000000000000, float %52
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  store float %53, float addrspace(1)* %54, align 4, !tbaa !16
  %55 = fadd contract float %34, %53
  %56 = add i32 %33, %26
  %57 = add i32 %56, %20
  %58 = icmp ult i32 %57, %7
  br i1 %58, label %31, label %59, !llvm.loop !20

59:                                               ; preds = %31, %8
  %60 = phi float [ 0.000000e+00, %8 ], [ %55, %31 ]
  %61 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %20
  store float %60, float addrspace(3)* %61, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = icmp ult i16 %14, 2
  br i1 %62, label %87, label %63

63:                                               ; preds = %59
  %64 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %19
  %65 = add i32 %19, -1
  br label %66

66:                                               ; preds = %63, %85
  %67 = phi i32 [ %15, %63 ], [ %68, %85 ]
  %68 = lshr i32 %67, 1
  %69 = icmp ult i32 %9, %68
  br i1 %69, label %70, label %76

70:                                               ; preds = %66
  %71 = load float, float addrspace(3)* %61, align 4, !tbaa !16
  %72 = add i32 %68, %20
  %73 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !16
  %75 = fadd contract float %71, %74
  store float %75, float addrspace(3)* %61, align 4, !tbaa !16
  br label %76

76:                                               ; preds = %70, %66
  %77 = and i32 %67, 1
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %85, label %79

79:                                               ; preds = %76
  %80 = load float, float addrspace(3)* %64, align 4, !tbaa !16
  %81 = add i32 %65, %67
  %82 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %81
  %83 = load float, float addrspace(3)* %82, align 4, !tbaa !16
  %84 = fadd contract float %80, %83
  store float %84, float addrspace(3)* %64, align 4, !tbaa !16
  br label %85

85:                                               ; preds = %79, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %86 = icmp ult i32 %67, 4
  br i1 %86, label %87, label %66, !llvm.loop !22

87:                                               ; preds = %85, %59
  %88 = icmp eq i32 %9, 0
  br i1 %88, label %89, label %100

89:                                               ; preds = %87, %89
  %90 = cmpxchg i32 addrspace(1)* %4, i32 0, i32 1 syncscope("agent-one-as") monotonic monotonic, align 4
  %91 = extractvalue { i32, i1 } %90, 1
  br i1 %91, label %92, label %89, !llvm.loop !23

92:                                               ; preds = %89
  %93 = zext i32 %10 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @cache, i32 0, i32 %19
  %97 = load float, float addrspace(3)* %96, align 4, !tbaa !16
  %98 = fadd contract float %95, %97
  store float %98, float addrspace(1)* %94, align 4, !tbaa !16
  %99 = atomicrmw xchg i32 addrspace(1)* %4, i32 0 syncscope("agent-one-as") monotonic, align 4
  br label %100

100:                                              ; preds = %92, %87
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

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
