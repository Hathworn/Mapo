; ModuleID = '../data/hip_kernels/16910/3/main.cu'
source_filename = "../data/hip_kernels/16910/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14cleanup_spikesPKdPKfPKiPfPiS6_S6_E5sdata = internal addrspace(3) global [1187 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14cleanup_spikesPKdPKfPKiPfPiS6_S6_(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, i32 addrspace(1)* nocapture %6) local_unnamed_addr #0 {
  %8 = getelementptr inbounds double, double addrspace(1)* %0, i64 4
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !4, !amdgpu.noclobber !8
  %10 = fptosi double %9 to i32
  %11 = add nsw i32 %10, -1
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !9
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !10, !invariant.load !8
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !11
  %24 = mul i32 %13, %20
  %25 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %26 = load double, double addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !8
  %27 = fptrunc double %26 to float
  %28 = sub i32 %15, %10
  %29 = add i32 %28, -1023
  %30 = icmp sgt i32 %24, %29
  br i1 %30, label %97, label %31

31:                                               ; preds = %7
  %32 = shl nsw i32 %11, 1
  %33 = icmp slt i32 %12, %32
  %34 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfPKiPfPiS6_S6_E5sdata, i32 0, i32 %12
  %35 = addrspacecast float addrspace(3)* %34 to float*
  %36 = add i32 %32, %12
  %37 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfPKiPfPiS6_S6_E5sdata, i32 0, i32 %36
  %38 = addrspacecast float addrspace(3)* %37 to float*
  %39 = add nsw i32 %11, %12
  %40 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfPKiPfPiS6_S6_E5sdata, i32 0, i32 %39
  %41 = addrspacecast float addrspace(3)* %40 to float*
  %42 = fmul contract float %27, %27
  %43 = sub i32 1, %10
  %44 = icmp slt i32 %43, %10
  br label %45

45:                                               ; preds = %31, %88
  %46 = phi i32 [ %24, %31 ], [ %95, %88 ]
  br i1 %33, label %47, label %52

47:                                               ; preds = %45
  %48 = add nsw i32 %46, %12
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !20
  store volatile float %51, float* %35, align 4, !tbaa !20
  br label %52

52:                                               ; preds = %47, %45
  %53 = add i32 %36, %46
  %54 = icmp slt i32 %53, %15
  br i1 %54, label %55, label %59

55:                                               ; preds = %52
  %56 = sext i32 %53 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !20
  br label %59

59:                                               ; preds = %52, %55
  %60 = phi float [ %58, %55 ], [ 0.000000e+00, %52 ]
  store volatile float %60, float* %38, align 4, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = load volatile float, float* %41, align 4, !tbaa !20
  %62 = add nsw i32 %46, %39
  %63 = fcmp contract ogt float %61, %42
  %64 = icmp slt i32 %62, %28
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %88

66:                                               ; preds = %59
  br i1 %44, label %69, label %77

67:                                               ; preds = %69
  %68 = icmp slt i32 %76, %10
  br i1 %68, label %69, label %77, !llvm.loop !22

69:                                               ; preds = %66, %67
  %70 = phi i32 [ %76, %67 ], [ %43, %66 ]
  %71 = add nsw i32 %70, %39
  %72 = getelementptr inbounds [1187 x float], [1187 x float] addrspace(3)* @_ZZ14cleanup_spikesPKdPKfPKiPfPiS6_S6_E5sdata, i32 0, i32 %71
  %73 = addrspacecast float addrspace(3)* %72 to float*
  %74 = load volatile float, float* %73, align 4, !tbaa !20
  %75 = fcmp contract ogt float %74, %61
  %76 = add nsw i32 %70, 1
  br i1 %75, label %88, label %67

77:                                               ; preds = %67, %66
  %78 = atomicrmw add i32 addrspace(1)* %6, i32 1 syncscope("agent-one-as") monotonic, align 4
  %79 = icmp slt i32 %78, 5000
  br i1 %79, label %80, label %88

80:                                               ; preds = %77
  %81 = sext i32 %78 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %81
  store i32 %62, i32 addrspace(1)* %82, align 4, !tbaa !24
  %83 = sext i32 %62 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !24
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %81
  store i32 %85, i32 addrspace(1)* %86, align 4, !tbaa !24
  %87 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  store float %61, float addrspace(1)* %87, align 4, !tbaa !20
  br label %88

88:                                               ; preds = %69, %80, %77, %59
  %89 = udiv i32 %23, %20
  %90 = mul i32 %89, %20
  %91 = icmp ugt i32 %23, %90
  %92 = zext i1 %91 to i32
  %93 = add i32 %89, %92
  %94 = mul i32 %93, %20
  %95 = add i32 %94, %46
  %96 = icmp sgt i32 %95, %29
  br i1 %96, label %97, label %45, !llvm.loop !26

97:                                               ; preds = %88, %7
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
