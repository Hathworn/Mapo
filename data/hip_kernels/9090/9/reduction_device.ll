; ModuleID = '../data/hip_kernels/9090/9/main.cu'
source_filename = "../data/hip_kernels/9090/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9reductioniPfS_E5s_sum = internal addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9reductioniPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = udiv i32 %13, %10
  %15 = mul i32 %14, %10
  %16 = icmp ugt i32 %13, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %5, %10
  %20 = add i32 %19, %4
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %22, label %27

22:                                               ; preds = %3
  %23 = sext i32 %20 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !16, !amdgpu.noclobber !6
  %26 = fadd contract float %25, 0.000000e+00
  br label %27

27:                                               ; preds = %3, %22
  %28 = phi float [ %26, %22 ], [ 0.000000e+00, %3 ]
  %29 = add i32 %18, %5
  %30 = mul i32 %29, %10
  %31 = add i32 %30, %4
  %32 = icmp slt i32 %31, %0
  br i1 %32, label %33, label %38

33:                                               ; preds = %27
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %1, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16, !amdgpu.noclobber !6
  %37 = fadd contract float %28, %36
  br label %38

38:                                               ; preds = %33, %27
  %39 = phi float [ %37, %33 ], [ %28, %27 ]
  %40 = shl i32 %18, 1
  %41 = add i32 %40, %5
  %42 = mul i32 %41, %10
  %43 = add i32 %42, %4
  %44 = icmp slt i32 %43, %0
  br i1 %44, label %45, label %50

45:                                               ; preds = %38
  %46 = sext i32 %43 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %1, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16, !amdgpu.noclobber !6
  %49 = fadd contract float %39, %48
  br label %50

50:                                               ; preds = %45, %38
  %51 = phi float [ %49, %45 ], [ %39, %38 ]
  %52 = mul i32 %18, 3
  %53 = add i32 %52, %5
  %54 = mul i32 %53, %10
  %55 = add i32 %54, %4
  %56 = icmp slt i32 %55, %0
  br i1 %56, label %57, label %62

57:                                               ; preds = %50
  %58 = sext i32 %55 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16, !amdgpu.noclobber !6
  %61 = fadd contract float %51, %60
  br label %62

62:                                               ; preds = %57, %50
  %63 = phi float [ %61, %57 ], [ %51, %50 ]
  %64 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %4
  %65 = addrspacecast float addrspace(3)* %64 to float*
  store volatile float %63, float* %65, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %66 = icmp ult i32 %4, 128
  br i1 %66, label %67, label %74

67:                                               ; preds = %62
  %68 = add nuw nsw i32 %4, 128
  %69 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %68
  %70 = addrspacecast float addrspace(3)* %69 to float*
  %71 = load volatile float, float* %70, align 4, !tbaa !16
  %72 = load volatile float, float* %65, align 4, !tbaa !16
  %73 = fadd contract float %71, %72
  store volatile float %73, float* %65, align 4, !tbaa !16
  br label %74

74:                                               ; preds = %67, %62
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = icmp ult i32 %4, 64
  br i1 %75, label %76, label %83

76:                                               ; preds = %74
  %77 = add nuw nsw i32 %4, 64
  %78 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %77
  %79 = addrspacecast float addrspace(3)* %78 to float*
  %80 = load volatile float, float* %79, align 4, !tbaa !16
  %81 = load volatile float, float* %65, align 4, !tbaa !16
  %82 = fadd contract float %80, %81
  store volatile float %82, float* %65, align 4, !tbaa !16
  br label %83

83:                                               ; preds = %76, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = icmp ult i32 %4, 32
  br i1 %84, label %85, label %92

85:                                               ; preds = %83
  %86 = add nuw nsw i32 %4, 32
  %87 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %86
  %88 = addrspacecast float addrspace(3)* %87 to float*
  %89 = load volatile float, float* %88, align 4, !tbaa !16
  %90 = load volatile float, float* %65, align 4, !tbaa !16
  %91 = fadd contract float %89, %90
  store volatile float %91, float* %65, align 4, !tbaa !16
  br label %92

92:                                               ; preds = %85, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %93 = icmp ult i32 %4, 16
  br i1 %93, label %94, label %101

94:                                               ; preds = %92
  %95 = add nuw nsw i32 %4, 16
  %96 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %95
  %97 = addrspacecast float addrspace(3)* %96 to float*
  %98 = load volatile float, float* %97, align 4, !tbaa !16
  %99 = load volatile float, float* %65, align 4, !tbaa !16
  %100 = fadd contract float %98, %99
  store volatile float %100, float* %65, align 4, !tbaa !16
  br label %101

101:                                              ; preds = %94, %92
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = icmp ult i32 %4, 8
  br i1 %102, label %103, label %110

103:                                              ; preds = %101
  %104 = add nuw nsw i32 %4, 8
  %105 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %104
  %106 = addrspacecast float addrspace(3)* %105 to float*
  %107 = load volatile float, float* %106, align 4, !tbaa !16
  %108 = load volatile float, float* %65, align 4, !tbaa !16
  %109 = fadd contract float %107, %108
  store volatile float %109, float* %65, align 4, !tbaa !16
  br label %110

110:                                              ; preds = %103, %101
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %111 = icmp ult i32 %4, 4
  br i1 %111, label %112, label %119

112:                                              ; preds = %110
  %113 = add nuw nsw i32 %4, 4
  %114 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %113
  %115 = addrspacecast float addrspace(3)* %114 to float*
  %116 = load volatile float, float* %115, align 4, !tbaa !16
  %117 = load volatile float, float* %65, align 4, !tbaa !16
  %118 = fadd contract float %116, %117
  store volatile float %118, float* %65, align 4, !tbaa !16
  br label %119

119:                                              ; preds = %112, %110
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %120 = icmp ult i32 %4, 2
  br i1 %120, label %121, label %128

121:                                              ; preds = %119
  %122 = add nuw nsw i32 %4, 2
  %123 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 %122
  %124 = addrspacecast float addrspace(3)* %123 to float*
  %125 = load volatile float, float* %124, align 4, !tbaa !16
  %126 = load volatile float, float* %65, align 4, !tbaa !16
  %127 = fadd contract float %125, %126
  store volatile float %127, float* %65, align 4, !tbaa !16
  br label %128

128:                                              ; preds = %121, %119
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = icmp eq i32 %4, 0
  br i1 %129, label %130, label %137

130:                                              ; preds = %128
  %131 = load volatile float, float* addrspacecast (float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ9reductioniPfS_E5s_sum, i32 0, i32 1) to float*), align 4, !tbaa !16
  %132 = load volatile float, float* %65, align 4, !tbaa !16
  %133 = fadd contract float %131, %132
  store volatile float %133, float* %65, align 4, !tbaa !16
  %134 = load volatile float, float* %65, align 4, !tbaa !16
  %135 = sext i32 %5 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %135
  store float %134, float addrspace(1)* %136, align 4, !tbaa !16
  br label %137

137:                                              ; preds = %130, %128
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
