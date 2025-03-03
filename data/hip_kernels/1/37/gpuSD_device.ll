; ModuleID = '../data/hip_kernels/1/37/main.cu'
source_filename = "../data/hip_kernels/1/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ5gpuSDPKfmS0_mmS0_S0_PfE5meanA = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ5gpuSDPKfmS0_mmS0_S0_PfE5meanB = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ5gpuSDPKfmS0_mmS0_S0_PfE1n = internal unnamed_addr addrspace(3) global float undef, align 4
@_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16
@_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z5gpuSDPKfmS0_mmS0_S0_Pf(float addrspace(1)* nocapture readonly %0, i64 %1, float addrspace(1)* nocapture readonly %2, i64 %3, i64 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = zext i32 %9 to i64
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = zext i32 %13 to i64
  %15 = icmp ult i64 %12, %1
  %16 = icmp ult i64 %14, %3
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %169

18:                                               ; preds = %8
  %19 = icmp eq i32 %9, 0
  br i1 %19, label %20, label %31

20:                                               ; preds = %18
  %21 = mul i64 %12, %3
  %22 = add i64 %21, %14
  %23 = shl i64 %22, 1
  %24 = getelementptr inbounds float, float addrspace(1)* %5, i64 %23
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %25, float addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE5meanA, align 4, !tbaa !5
  %26 = add nuw nsw i64 %23, 1
  %27 = getelementptr inbounds float, float addrspace(1)* %5, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %28, float addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE5meanB, align 4, !tbaa !5
  %29 = getelementptr inbounds float, float addrspace(1)* %6, i64 %22
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !5, !amdgpu.noclobber !9
  store float %30, float addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE1n, align 4, !tbaa !5
  br label %31

31:                                               ; preds = %20, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %9
  store float 0.000000e+00, float addrspace(3)* %32, align 4, !tbaa !5
  %33 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %9
  store float 0.000000e+00, float addrspace(3)* %33, align 4, !tbaa !5
  %34 = icmp ult i64 %10, %4
  br i1 %34, label %35, label %65

35:                                               ; preds = %31
  %36 = mul i64 %12, %4
  %37 = mul i64 %14, %4
  %38 = load float, float addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE5meanA, align 4
  %39 = load float, float addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE5meanB, align 4
  br label %40

40:                                               ; preds = %35, %60
  %41 = phi float [ 0.000000e+00, %35 ], [ %61, %60 ]
  %42 = phi float [ 0.000000e+00, %35 ], [ %62, %60 ]
  %43 = phi i64 [ %10, %35 ], [ %63, %60 ]
  %44 = add i64 %43, %36
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = add i64 %43, %37
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = fcmp uno float %46, 0.000000e+00
  %51 = fcmp uno float %49, 0.000000e+00
  %52 = select i1 %50, i1 true, i1 %51
  br i1 %52, label %60, label %53

53:                                               ; preds = %40
  %54 = fsub contract float %46, %38
  %55 = fsub contract float %49, %39
  %56 = fmul contract float %54, %54
  %57 = fadd contract float %42, %56
  store float %57, float addrspace(3)* %32, align 4, !tbaa !5
  %58 = fmul contract float %55, %55
  %59 = fadd contract float %58, %41
  store float %59, float addrspace(3)* %33, align 4, !tbaa !5
  br label %60

60:                                               ; preds = %40, %53
  %61 = phi float [ %41, %40 ], [ %59, %53 ]
  %62 = phi float [ %42, %40 ], [ %57, %53 ]
  %63 = add i64 %43, 16
  %64 = icmp ult i64 %63, %4
  br i1 %64, label %40, label %65, !llvm.loop !10

65:                                               ; preds = %60, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %66 = icmp ult i32 %9, 8
  br i1 %66, label %67, label %77

67:                                               ; preds = %65
  %68 = add nuw nsw i32 %9, 8
  %69 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !5
  %71 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %72 = fadd contract float %70, %71
  store float %72, float addrspace(3)* %32, align 4, !tbaa !5
  %73 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %68
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !5
  %75 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %76 = fadd contract float %74, %75
  store float %76, float addrspace(3)* %33, align 4, !tbaa !5
  br label %77

77:                                               ; preds = %67, %65
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = icmp ult i32 %9, 4
  br i1 %78, label %79, label %89

79:                                               ; preds = %77
  %80 = add nuw nsw i32 %9, 4
  %81 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !5
  %83 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %84 = fadd contract float %82, %83
  store float %84, float addrspace(3)* %32, align 4, !tbaa !5
  %85 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %80
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !5
  %87 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %88 = fadd contract float %86, %87
  store float %88, float addrspace(3)* %33, align 4, !tbaa !5
  br label %89

89:                                               ; preds = %79, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = icmp ult i32 %9, 2
  br i1 %90, label %91, label %101

91:                                               ; preds = %89
  %92 = add nuw nsw i32 %9, 2
  %93 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %92
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !5
  %95 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %96 = fadd contract float %94, %95
  store float %96, float addrspace(3)* %32, align 4, !tbaa !5
  %97 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %92
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %99 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %100 = fadd contract float %98, %99
  store float %100, float addrspace(3)* %33, align 4, !tbaa !5
  br label %101

101:                                              ; preds = %91, %89
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = icmp eq i32 %9, 0
  br i1 %102, label %103, label %113

103:                                              ; preds = %101
  %104 = add nuw nsw i32 %9, 1
  %105 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 %104
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !5
  %107 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %108 = fadd contract float %106, %107
  store float %108, float addrspace(3)* %32, align 4, !tbaa !5
  %109 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 %104
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !5
  %111 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %112 = fadd contract float %110, %111
  store float %112, float addrspace(3)* %33, align 4, !tbaa !5
  br label %113

113:                                              ; preds = %103, %101
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %114, label %169

114:                                              ; preds = %113
  %115 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsA, i32 0, i32 0), align 16, !tbaa !5
  %116 = load float, float addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE1n, align 4, !tbaa !5
  %117 = fadd contract float %116, -1.000000e+00
  %118 = fdiv contract float %115, %117
  %119 = fcmp olt float %118, 0x39F0000000000000
  %120 = select i1 %119, float 0x41F0000000000000, float 1.000000e+00
  %121 = fmul float %118, %120
  %122 = tail call float @llvm.sqrt.f32(float %121)
  %123 = bitcast float %122 to i32
  %124 = add nsw i32 %123, -1
  %125 = bitcast i32 %124 to float
  %126 = add nsw i32 %123, 1
  %127 = bitcast i32 %126 to float
  %128 = tail call i1 @llvm.amdgcn.class.f32(float %121, i32 608)
  %129 = select i1 %119, float 0x3EF0000000000000, float 1.000000e+00
  %130 = fneg float %127
  %131 = tail call float @llvm.fma.f32(float %130, float %122, float %121)
  %132 = fcmp ogt float %131, 0.000000e+00
  %133 = fneg float %125
  %134 = tail call float @llvm.fma.f32(float %133, float %122, float %121)
  %135 = fcmp ole float %134, 0.000000e+00
  %136 = select i1 %135, float %125, float %122
  %137 = select i1 %132, float %127, float %136
  %138 = fmul float %129, %137
  %139 = select i1 %128, float %121, float %138
  %140 = mul i64 %12, %3
  %141 = add i64 %140, %14
  %142 = shl i64 %141, 1
  %143 = getelementptr inbounds float, float addrspace(1)* %7, i64 %142
  store float %139, float addrspace(1)* %143, align 4, !tbaa !5
  %144 = load float, float addrspace(3)* getelementptr inbounds ([16 x float], [16 x float] addrspace(3)* @_ZZ5gpuSDPKfmS0_mmS0_S0_PfE11threadSumsB, i32 0, i32 0), align 16, !tbaa !5
  %145 = fdiv contract float %144, %117
  %146 = fcmp olt float %145, 0x39F0000000000000
  %147 = select i1 %146, float 0x41F0000000000000, float 1.000000e+00
  %148 = fmul float %145, %147
  %149 = tail call float @llvm.sqrt.f32(float %148)
  %150 = bitcast float %149 to i32
  %151 = add nsw i32 %150, -1
  %152 = bitcast i32 %151 to float
  %153 = add nsw i32 %150, 1
  %154 = bitcast i32 %153 to float
  %155 = tail call i1 @llvm.amdgcn.class.f32(float %148, i32 608)
  %156 = select i1 %146, float 0x3EF0000000000000, float 1.000000e+00
  %157 = fneg float %154
  %158 = tail call float @llvm.fma.f32(float %157, float %149, float %148)
  %159 = fcmp ogt float %158, 0.000000e+00
  %160 = fneg float %152
  %161 = tail call float @llvm.fma.f32(float %160, float %149, float %148)
  %162 = fcmp ole float %161, 0.000000e+00
  %163 = select i1 %162, float %152, float %149
  %164 = select i1 %159, float %154, float %163
  %165 = fmul float %156, %164
  %166 = select i1 %155, float %148, float %165
  %167 = add nuw nsw i64 %142, 1
  %168 = getelementptr inbounds float, float addrspace(1)* %7, i64 %167
  store float %166, float addrspace(1)* %168, align 4, !tbaa !5
  br label %169

169:                                              ; preds = %113, %114, %8
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
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

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
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
