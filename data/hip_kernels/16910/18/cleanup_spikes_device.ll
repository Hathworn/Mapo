; ModuleID = '../data/hip_kernels/16910/18/main.cu'
source_filename = "../data/hip_kernels/16910/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14cleanup_spikesPKdPKfS2_S2_S2_PKiPiS5_PfS6_S6_S5_E5sdata = internal addrspace(3) global [1187 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14cleanup_spikesPKdPKfS2_S2_S2_PKiPiS5_PfS6_S6_S5_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readnone %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10, i32 addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = add nsw i32 %15, -1
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %19 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %20 = fptosi double %19 to i32
  %21 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %22 = getelementptr i8, i8 addrspace(4)* %21, i64 4
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 4, !range !10, !invariant.load !8
  %25 = zext i16 %24 to i32
  %26 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 12
  %27 = bitcast i8 addrspace(4)* %26 to i32 addrspace(4)*
  %28 = load i32, i32 addrspace(4)* %27, align 4, !tbaa !11
  %29 = mul i32 %18, %25
  %30 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !4, !amdgpu.noclobber !8
  %32 = fptrunc double %31 to float
  %33 = sub i32 %20, %15
  %34 = add i32 %33, -1023
  %35 = icmp sgt i32 %29, %34
  br i1 %35, label %126, label %36

36:                                               ; preds = %12
  %37 = shl nsw i32 %16, 1
  %38 = icmp slt i32 %17, %37
  %39 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfS2_S2_S2_PKiPiS5_PfS6_S6_S5_E5sdata, i32 0, i32 %17
  %40 = addrspacecast float addrspace(3)* %39 to float*
  %41 = add i32 %37, %17
  %42 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfS2_S2_S2_PKiPiS5_PfS6_S6_S5_E5sdata, i32 0, i32 %41
  %43 = addrspacecast float addrspace(3)* %42 to float*
  %44 = add nsw i32 %16, %17
  %45 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfS2_S2_S2_PKiPiS5_PfS6_S6_S5_E5sdata, i32 0, i32 %44
  %46 = addrspacecast float addrspace(3)* %45 to float*
  %47 = fmul contract float %32, %32
  %48 = sub i32 1, %15
  %49 = icmp slt i32 %48, %15
  br label %50

50:                                               ; preds = %36, %117
  %51 = phi i32 [ %29, %36 ], [ %124, %117 ]
  br i1 %38, label %52, label %57

52:                                               ; preds = %50
  %53 = add nsw i32 %51, %17
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %3, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !20
  store volatile float %56, float* %40, align 4, !tbaa !20
  br label %57

57:                                               ; preds = %52, %50
  %58 = add i32 %41, %51
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %3, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !20
  store volatile float %61, float* %43, align 4, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = load volatile float, float* %46, align 4, !tbaa !20
  %63 = fcmp contract ogt float %62, %47
  br i1 %63, label %64, label %117

64:                                               ; preds = %57
  br i1 %49, label %67, label %75

65:                                               ; preds = %67
  %66 = icmp slt i32 %74, %15
  br i1 %66, label %67, label %75, !llvm.loop !22

67:                                               ; preds = %64, %65
  %68 = phi i32 [ %74, %65 ], [ %48, %64 ]
  %69 = add nsw i32 %68, %44
  %70 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfS2_S2_S2_PKiPiS5_PfS6_S6_S5_E5sdata, i32 0, i32 %69
  %71 = addrspacecast float addrspace(3)* %70 to float*
  %72 = load volatile float, float* %71, align 4, !tbaa !20
  %73 = fcmp contract ogt float %72, %62
  %74 = add nsw i32 %68, 1
  br i1 %73, label %117, label %65

75:                                               ; preds = %65, %64
  %76 = atomicrmw add i32 addrspace(1)* %11, i32 1 syncscope("agent-one-as") monotonic, align 4
  %77 = icmp slt i32 %76, 100000
  br i1 %77, label %78, label %117

78:                                               ; preds = %75
  %79 = add nsw i32 %51, %44
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !24
  %83 = sext i32 %76 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %83
  store i32 %79, i32 addrspace(1)* %84, align 4, !tbaa !24
  %85 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %83
  store i32 %82, i32 addrspace(1)* %85, align 4, !tbaa !24
  %86 = mul nsw i32 %82, %20
  %87 = add nsw i32 %86, %79
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !20
  %91 = getelementptr inbounds float, float addrspace(1)* %9, i64 %83
  store float %90, float addrspace(1)* %91, align 4, !tbaa !20
  %92 = fcmp olt float %62, 0x39F0000000000000
  %93 = select i1 %92, float 0x41F0000000000000, float 1.000000e+00
  %94 = fmul float %62, %93
  %95 = tail call float @llvm.sqrt.f32(float %94)
  %96 = bitcast float %95 to i32
  %97 = add nsw i32 %96, -1
  %98 = bitcast i32 %97 to float
  %99 = add nsw i32 %96, 1
  %100 = bitcast i32 %99 to float
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %94, i32 608)
  %102 = select i1 %92, float 0x3EF0000000000000, float 1.000000e+00
  %103 = fneg float %100
  %104 = tail call float @llvm.fma.f32(float %103, float %95, float %94)
  %105 = fcmp ogt float %104, 0.000000e+00
  %106 = fneg float %98
  %107 = tail call float @llvm.fma.f32(float %106, float %95, float %94)
  %108 = fcmp ole float %107, 0.000000e+00
  %109 = select i1 %108, float %98, float %95
  %110 = select i1 %105, float %100, float %109
  %111 = fmul float %102, %110
  %112 = select i1 %101, float %94, float %111
  %113 = getelementptr inbounds float, float addrspace(1)* %8, i64 %83
  store float %112, float addrspace(1)* %113, align 4, !tbaa !20
  %114 = getelementptr inbounds float, float addrspace(1)* %4, i64 %80
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !20
  %116 = getelementptr inbounds float, float addrspace(1)* %10, i64 %83
  store float %115, float addrspace(1)* %116, align 4, !tbaa !20
  br label %117

117:                                              ; preds = %67, %78, %75, %57
  %118 = udiv i32 %28, %25
  %119 = mul i32 %118, %25
  %120 = icmp ugt i32 %28, %119
  %121 = zext i1 %120 to i32
  %122 = add i32 %118, %121
  %123 = mul i32 %122, %25
  %124 = add i32 %123, %51
  %125 = icmp sgt i32 %124, %34
  br i1 %125, label %126, label %50, !llvm.loop !26

126:                                              ; preds = %117, %12
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

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
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i32 0, i32 1024}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !6, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !6, i64 0}
!26 = distinct !{!26, !23}
