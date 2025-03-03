; ModuleID = '../data/hip_kernels/12797/10/main.cu'
source_filename = "../data/hip_kernels/12797/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer = internal unnamed_addr addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, float %9, float %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %6
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %4, i64 %16
  %18 = mul i32 %14, %8
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %13
  store float 0.000000e+00, float addrspace(3)* %21, align 4, !tbaa !5
  %22 = icmp ult i32 %13, %6
  br i1 %22, label %23, label %30

23:                                               ; preds = %12
  %24 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %25 = getelementptr i8, i8 addrspace(4)* %24, i64 4
  %26 = bitcast i8 addrspace(4)* %25 to i16 addrspace(4)*
  %27 = load i16, i16 addrspace(4)* %26, align 4, !range !9, !invariant.load !10
  %28 = zext i16 %27 to i32
  br label %32

29:                                               ; preds = %32
  store float %41, float addrspace(3)* %21, align 4, !tbaa !5
  br label %30

30:                                               ; preds = %29, %12
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = icmp ult i32 %13, 64
  br i1 %31, label %44, label %50

32:                                               ; preds = %23, %32
  %33 = phi float [ 0.000000e+00, %23 ], [ %41, %32 ]
  %34 = phi i32 [ %13, %23 ], [ %42, %32 ]
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %17, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !10
  %38 = add nuw i32 %34, 1
  %39 = uitofp i32 %38 to float
  %40 = fmul contract float %37, %39
  %41 = fadd contract float %33, %40
  %42 = add i32 %34, %28
  %43 = icmp ult i32 %42, %6
  br i1 %43, label %32, label %29, !llvm.loop !11

44:                                               ; preds = %30
  %45 = add nuw nsw i32 %13, 64
  %46 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %48 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %49 = fadd contract float %47, %48
  store float %49, float addrspace(3)* %21, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %30, %44
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ult i32 %13, 32
  br i1 %51, label %52, label %58

52:                                               ; preds = %50
  %53 = add nuw nsw i32 %13, 32
  %54 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %56 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %57 = fadd contract float %55, %56
  store float %57, float addrspace(3)* %21, align 4, !tbaa !5
  br label %58

58:                                               ; preds = %52, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ult i32 %13, 16
  br i1 %59, label %60, label %66

60:                                               ; preds = %58
  %61 = add nuw nsw i32 %13, 16
  %62 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !5
  %64 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %65 = fadd contract float %63, %64
  store float %65, float addrspace(3)* %21, align 4, !tbaa !5
  br label %66

66:                                               ; preds = %60, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %67 = icmp ult i32 %13, 8
  br i1 %67, label %68, label %74

68:                                               ; preds = %66
  %69 = add nuw nsw i32 %13, 8
  %70 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %72 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %73 = fadd contract float %71, %72
  store float %73, float addrspace(3)* %21, align 4, !tbaa !5
  br label %74

74:                                               ; preds = %68, %66
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = icmp ult i32 %13, 4
  br i1 %75, label %76, label %82

76:                                               ; preds = %74
  %77 = add nuw nsw i32 %13, 4
  %78 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %77
  %79 = load float, float addrspace(3)* %78, align 4, !tbaa !5
  %80 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %81 = fadd contract float %79, %80
  store float %81, float addrspace(3)* %21, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %76, %74
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = icmp ult i32 %13, 2
  br i1 %83, label %84, label %90

84:                                               ; preds = %82
  %85 = add nuw nsw i32 %13, 2
  %86 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %88 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %89 = fadd contract float %87, %88
  store float %89, float addrspace(3)* %21, align 4, !tbaa !5
  br label %90

90:                                               ; preds = %84, %82
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = icmp eq i32 %13, 0
  br i1 %91, label %92, label %132

92:                                               ; preds = %90
  %93 = add nuw nsw i32 %13, 1
  %94 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 %93
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %96 = load float, float addrspace(3)* %21, align 4, !tbaa !5
  %97 = fadd contract float %95, %96
  store float %97, float addrspace(3)* %21, align 4, !tbaa !5
  %98 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 0), align 16, !tbaa !5
  %99 = sitofp i32 %6 to float
  %100 = fdiv contract float %98, %99
  %101 = zext i32 %14 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  store float %100, float addrspace(1)* %102, align 4, !tbaa !5
  %103 = icmp eq i32 %11, 0
  br i1 %103, label %110, label %104

104:                                              ; preds = %92
  %105 = getelementptr inbounds float, float addrspace(1)* %5, i64 %101
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !5
  %107 = fadd contract float %100, %106
  %108 = tail call float @llvm.maxnum.f32(float %107, float 0.000000e+00)
  %109 = tail call float @llvm.minnum.f32(float %108, float 1.000000e+00)
  br label %110

110:                                              ; preds = %104, %92
  %111 = phi float [ %109, %104 ], [ %100, %92 ]
  %112 = sitofp i32 %7 to float
  %113 = fmul contract float %111, %112
  %114 = fpext float %113 to double
  %115 = sitofp i32 %8 to float
  %116 = fpext float %115 to double
  %117 = fmul contract double %116, 5.000000e-01
  %118 = fsub contract double %114, %117
  %119 = fptrunc double %118 to float
  %120 = add i32 %7, 1
  %121 = sub i32 %120, %8
  %122 = sitofp i32 %121 to float
  %123 = tail call float @llvm.minnum.f32(float %119, float %122)
  %124 = tail call float @llvm.maxnum.f32(float %123, float 1.000000e+00)
  %125 = tail call float @llvm.ceil.f32(float %124)
  %126 = fadd contract float %125, -1.000000e+00
  %127 = fsub contract float %113, %126
  %128 = fptosi float %125 to i32
  %129 = sitofp i32 %128 to float
  %130 = getelementptr inbounds float, float addrspace(1)* %3, i64 %101
  store float %129, float addrspace(1)* %130, align 4, !tbaa !5
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  store float %127, float addrspace(1)* %131, align 4, !tbaa !5
  store float %127, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 0), align 16, !tbaa !5
  br label %132

132:                                              ; preds = %90, %110
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %133 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ36cunnx_WindowGate_updateOutput_kernelPfS_S_S_PKfS1_iiiffiE6buffer, i32 0, i32 0), align 16, !tbaa !5
  %134 = icmp slt i32 %13, %8
  br i1 %134, label %135, label %141

135:                                              ; preds = %132
  %136 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %137 = getelementptr i8, i8 addrspace(4)* %136, i64 4
  %138 = bitcast i8 addrspace(4)* %137 to i16 addrspace(4)*
  %139 = load i16, i16 addrspace(4)* %138, align 4, !range !9, !invariant.load !10
  %140 = zext i16 %139 to i32
  br label %142

141:                                              ; preds = %142, %132
  ret void

142:                                              ; preds = %135, %142
  %143 = phi i32 [ %13, %135 ], [ %166, %142 ]
  %144 = add nsw i32 %143, 1
  %145 = sitofp i32 %144 to float
  %146 = fsub contract float %145, %133
  %147 = fmul contract float %146, %146
  %148 = fmul contract float %147, %10
  %149 = fmul float %148, 0x3FF7154760000000
  %150 = tail call float @llvm.rint.f32(float %149)
  %151 = fcmp ogt float %148, 0x40562E4300000000
  %152 = fcmp olt float %148, 0xC059D1DA00000000
  %153 = fneg float %149
  %154 = tail call float @llvm.fma.f32(float %148, float 0x3FF7154760000000, float %153)
  %155 = tail call float @llvm.fma.f32(float %148, float 0x3E54AE0BE0000000, float %154)
  %156 = fsub float %149, %150
  %157 = fadd float %155, %156
  %158 = tail call float @llvm.exp2.f32(float %157)
  %159 = fptosi float %150 to i32
  %160 = tail call float @llvm.amdgcn.ldexp.f32(float %158, i32 %159)
  %161 = select i1 %152, float 0.000000e+00, float %160
  %162 = select i1 %151, float 0x7FF0000000000000, float %161
  %163 = fmul contract float %162, %9
  %164 = sext i32 %143 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %20, i64 %164
  store float %163, float addrspace(1)* %165, align 4, !tbaa !5
  %166 = add i32 %143, %140
  %167 = icmp slt i32 %166, %8
  br i1 %167, label %142, label %141, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
