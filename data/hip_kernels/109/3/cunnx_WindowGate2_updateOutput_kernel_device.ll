; ModuleID = '../data/hip_kernels/109/3/main.cu'
source_filename = "../data/hip_kernels/109/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer = internal unnamed_addr addrspace(3) global [129 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture writeonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %7
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %5, i64 %17
  %19 = mul i32 %15, %10
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %14
  store float 0.000000e+00, float addrspace(3)* %22, align 4, !tbaa !5
  %23 = icmp ult i32 %14, %7
  br i1 %23, label %24, label %31

24:                                               ; preds = %13
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !9, !invariant.load !10
  %29 = zext i16 %28 to i32
  br label %33

30:                                               ; preds = %33
  store float %42, float addrspace(3)* %22, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %30, %13
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i32 %14, 64
  br i1 %32, label %45, label %51

33:                                               ; preds = %24, %33
  %34 = phi float [ 0.000000e+00, %24 ], [ %42, %33 ]
  %35 = phi i32 [ %14, %24 ], [ %43, %33 ]
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %18, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !10
  %39 = add nuw i32 %35, 1
  %40 = uitofp i32 %39 to float
  %41 = fmul contract float %38, %40
  %42 = fadd contract float %34, %41
  %43 = add i32 %35, %29
  %44 = icmp ult i32 %43, %7
  br i1 %44, label %33, label %30, !llvm.loop !11

45:                                               ; preds = %31
  %46 = add nuw nsw i32 %14, 64
  %47 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %49 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %50 = fadd contract float %48, %49
  store float %50, float addrspace(3)* %22, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %31, %45
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ult i32 %14, 32
  br i1 %52, label %53, label %59

53:                                               ; preds = %51
  %54 = add nuw nsw i32 %14, 32
  %55 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %57 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %58 = fadd contract float %56, %57
  store float %58, float addrspace(3)* %22, align 4, !tbaa !5
  br label %59

59:                                               ; preds = %53, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = icmp ult i32 %14, 16
  br i1 %60, label %61, label %67

61:                                               ; preds = %59
  %62 = add nuw nsw i32 %14, 16
  %63 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !5
  %65 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %66 = fadd contract float %64, %65
  store float %66, float addrspace(3)* %22, align 4, !tbaa !5
  br label %67

67:                                               ; preds = %61, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %68 = icmp ult i32 %14, 8
  br i1 %68, label %69, label %75

69:                                               ; preds = %67
  %70 = add nuw nsw i32 %14, 8
  %71 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !5
  %73 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %74 = fadd contract float %72, %73
  store float %74, float addrspace(3)* %22, align 4, !tbaa !5
  br label %75

75:                                               ; preds = %69, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = icmp ult i32 %14, 4
  br i1 %76, label %77, label %83

77:                                               ; preds = %75
  %78 = add nuw nsw i32 %14, 4
  %79 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %81 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %82 = fadd contract float %80, %81
  store float %82, float addrspace(3)* %22, align 4, !tbaa !5
  br label %83

83:                                               ; preds = %77, %75
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = icmp ult i32 %14, 2
  br i1 %84, label %85, label %91

85:                                               ; preds = %83
  %86 = add nuw nsw i32 %14, 2
  %87 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !5
  %89 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %90 = fadd contract float %88, %89
  store float %90, float addrspace(3)* %22, align 4, !tbaa !5
  br label %91

91:                                               ; preds = %85, %83
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = icmp eq i32 %14, 0
  br i1 %92, label %93, label %149

93:                                               ; preds = %91
  %94 = add nuw nsw i32 %14, 1
  %95 = getelementptr inbounds [129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 %94
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !5
  %97 = load float, float addrspace(3)* %22, align 4, !tbaa !5
  %98 = fadd contract float %96, %97
  store float %98, float addrspace(3)* %22, align 4, !tbaa !5
  %99 = load float, float addrspace(3)* getelementptr inbounds ([129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 0), align 16, !tbaa !5
  %100 = sitofp i32 %7 to float
  %101 = fdiv contract float %99, %100
  %102 = zext i32 %15 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  store float %101, float addrspace(1)* %103, align 4, !tbaa !5
  %104 = icmp eq i32 %12, 0
  br i1 %104, label %111, label %105

105:                                              ; preds = %93
  %106 = getelementptr inbounds float, float addrspace(1)* %6, i64 %102
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5
  %108 = fadd contract float %101, %107
  %109 = tail call float @llvm.maxnum.f32(float %108, float 0.000000e+00)
  %110 = tail call float @llvm.minnum.f32(float %109, float 1.000000e+00)
  br label %111

111:                                              ; preds = %105, %93
  %112 = phi float [ %110, %105 ], [ %101, %93 ]
  %113 = sitofp i32 %8 to float
  %114 = fmul contract float %112, %113
  %115 = fdiv contract float %114, %100
  %116 = fpext float %115 to double
  %117 = sitofp i32 %9 to float
  %118 = fpext float %117 to double
  %119 = fmul contract double %118, 5.000000e-01
  %120 = fsub contract double %116, %119
  %121 = fptrunc double %120 to float
  %122 = fpext float %114 to double
  %123 = sitofp i32 %10 to float
  %124 = fpext float %123 to double
  %125 = fmul contract double %124, 5.000000e-01
  %126 = fsub contract double %122, %125
  %127 = fptrunc double %126 to float
  %128 = add i32 %7, 1
  %129 = sub i32 %128, %9
  %130 = sitofp i32 %129 to float
  %131 = tail call float @llvm.minnum.f32(float %121, float %130)
  %132 = tail call float @llvm.maxnum.f32(float %131, float 1.000000e+00)
  %133 = add i32 %8, 1
  %134 = sub i32 %133, %10
  %135 = sitofp i32 %134 to float
  %136 = tail call float @llvm.minnum.f32(float %127, float %135)
  %137 = tail call float @llvm.maxnum.f32(float %136, float 1.000000e+00)
  %138 = tail call float @llvm.ceil.f32(float %132)
  %139 = tail call float @llvm.ceil.f32(float %137)
  %140 = fadd contract float %139, -1.000000e+00
  %141 = fsub contract float %114, %140
  %142 = fptosi float %138 to i32
  %143 = sitofp i32 %142 to float
  %144 = getelementptr inbounds float, float addrspace(1)* %3, i64 %102
  store float %143, float addrspace(1)* %144, align 4, !tbaa !5
  %145 = fptosi float %139 to i32
  %146 = sitofp i32 %145 to float
  %147 = getelementptr inbounds float, float addrspace(1)* %4, i64 %102
  store float %146, float addrspace(1)* %147, align 4, !tbaa !5
  %148 = getelementptr inbounds float, float addrspace(1)* %1, i64 %102
  store float %141, float addrspace(1)* %148, align 4, !tbaa !5
  store float %138, float addrspace(3)* getelementptr inbounds ([129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 128), align 16, !tbaa !5
  br label %149

149:                                              ; preds = %91, %111
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %150 = load float, float addrspace(3)* getelementptr inbounds ([129 x float], [129 x float] addrspace(3)* @_ZZ37cunnx_WindowGate2_updateOutput_kernelPfS_S_S_S_PKfS1_iiiiiiE6buffer, i32 0, i32 128), align 16, !tbaa !5
  %151 = fptosi float %150 to i32
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %18, i64 %152
  %154 = icmp slt i32 %14, %10
  br i1 %154, label %155, label %162

155:                                              ; preds = %149
  %156 = sitofp i32 %11 to float
  %157 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %158 = getelementptr i8, i8 addrspace(4)* %157, i64 4
  %159 = bitcast i8 addrspace(4)* %158 to i16 addrspace(4)*
  %160 = load i16, i16 addrspace(4)* %159, align 4, !range !9, !invariant.load !10
  %161 = zext i16 %160 to i32
  br label %163

162:                                              ; preds = %163, %149
  ret void

163:                                              ; preds = %155, %163
  %164 = phi i32 [ %14, %155 ], [ %174, %163 ]
  %165 = sitofp i32 %164 to float
  %166 = fdiv contract float %165, %156
  %167 = tail call float @llvm.floor.f32(float %166)
  %168 = fptosi float %167 to i32
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %153, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !5
  %172 = sext i32 %164 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %21, i64 %172
  store float %171, float addrspace(1)* %173, align 4, !tbaa !5
  %174 = add i32 %164, %161
  %175 = icmp slt i32 %174, %10
  br i1 %175, label %163, label %162, !llvm.loop !13
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

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
