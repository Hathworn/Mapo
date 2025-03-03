; ModuleID = '../data/hip_kernels/2530/7/main.cu'
source_filename = "../data/hip_kernels/2530/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9gpu_sobeliiPfS_E8sh_block = internal unnamed_addr addrspace(3) global [324 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z9gpu_sobeliiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul nsw i32 %21, %0
  %23 = add nsw i32 %22, %13
  %24 = add nsw i32 %21, 1
  %25 = mul nsw i32 %24, %0
  %26 = add nsw i32 %13, 1
  %27 = add nsw i32 %25, %26
  %28 = mul nuw nsw i32 %20, 18
  %29 = add nuw nsw i32 %28, %12
  %30 = icmp ne i32 %13, 0
  %31 = and i32 %26, 15
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %30, i1 %32, i1 false
  br i1 %33, label %34, label %47

34:                                               ; preds = %4
  %35 = add nsw i32 %23, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nuw nsw i32 %29, 1
  %40 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %39
  store float %38, float addrspace(3)* %40, align 4, !tbaa !7
  %41 = add nsw i32 %23, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = add nuw nsw i32 %29, 2
  %46 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %45
  store float %44, float addrspace(3)* %46, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %34, %4
  %48 = icmp ne i32 %21, 0
  %49 = and i32 %24, 15
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %48, i1 %50, i1 false
  br i1 %51, label %52, label %66

52:                                               ; preds = %47
  %53 = add nsw i32 %23, %0
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %2, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = add nuw nsw i32 %29, 18
  %58 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %57
  store float %56, float addrspace(3)* %58, align 4, !tbaa !7
  %59 = shl nsw i32 %0, 1
  %60 = add nsw i32 %23, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %2, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = add nuw nsw i32 %29, 36
  %65 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %64
  store float %63, float addrspace(3)* %65, align 4, !tbaa !7
  br label %66

66:                                               ; preds = %52, %47
  %67 = select i1 %33, i1 %48, i1 false
  %68 = select i1 %67, i1 %50, i1 false
  br i1 %68, label %69, label %97

69:                                               ; preds = %66
  %70 = add nsw i32 %23, %0
  %71 = add nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = add nuw nsw i32 %29, 19
  %76 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %75
  store float %74, float addrspace(3)* %76, align 4, !tbaa !7
  %77 = add nsw i32 %70, 2
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = add nuw nsw i32 %29, 20
  %82 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %81
  store float %80, float addrspace(3)* %82, align 4, !tbaa !7
  %83 = shl nsw i32 %0, 1
  %84 = add nsw i32 %23, %83
  %85 = add nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = add nuw nsw i32 %29, 37
  %90 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %89
  store float %88, float addrspace(3)* %90, align 4, !tbaa !7
  %91 = add nsw i32 %84, 2
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = add nuw nsw i32 %29, 38
  %96 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %95
  store float %94, float addrspace(3)* %96, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %69, %66
  %98 = sext i32 %23 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %29
  store float %100, float addrspace(3)* %101, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = add nsw i32 %0, -2
  %103 = icmp slt i32 %13, %102
  %104 = add nsw i32 %1, -2
  %105 = icmp slt i32 %21, %104
  %106 = select i1 %103, i1 %105, i1 false
  br i1 %106, label %107, label %177

107:                                              ; preds = %97
  %108 = load float, float addrspace(3)* %101, align 4, !tbaa !7
  %109 = fadd contract float %108, 0.000000e+00
  %110 = getelementptr inbounds float, float addrspace(3)* %101, i32 1
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = fmul contract float %111, 0.000000e+00
  %113 = fadd contract float %109, %112
  %114 = getelementptr inbounds float, float addrspace(3)* %101, i32 2
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %116 = fsub contract float %113, %115
  %117 = getelementptr inbounds float, float addrspace(3)* %101, i32 18
  %118 = load float, float addrspace(3)* %117, align 4, !tbaa !7
  %119 = fmul contract float %118, 2.000000e+00
  %120 = fadd contract float %116, %119
  %121 = getelementptr inbounds float, float addrspace(3)* %101, i32 19
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %123 = fmul contract float %122, 0.000000e+00
  %124 = fadd contract float %120, %123
  %125 = getelementptr inbounds float, float addrspace(3)* %101, i32 20
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !7
  %127 = fmul contract float %126, 2.000000e+00
  %128 = fsub contract float %124, %127
  %129 = getelementptr inbounds float, float addrspace(3)* %101, i32 36
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !7
  %131 = fadd contract float %130, %128
  %132 = getelementptr inbounds float, float addrspace(3)* %101, i32 37
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !7
  %134 = fmul contract float %133, 0.000000e+00
  %135 = fadd contract float %131, %134
  %136 = getelementptr inbounds float, float addrspace(3)* %101, i32 38
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !7
  %138 = fsub contract float %135, %137
  %139 = fmul contract float %111, 2.000000e+00
  %140 = fadd contract float %109, %139
  %141 = fadd contract float %115, %140
  %142 = fmul contract float %118, 0.000000e+00
  %143 = fadd contract float %141, %142
  %144 = fadd contract float %143, %123
  %145 = fmul contract float %126, 0.000000e+00
  %146 = fadd contract float %144, %145
  %147 = fsub contract float %146, %130
  %148 = fmul contract float %133, 2.000000e+00
  %149 = fsub contract float %147, %148
  %150 = fsub contract float %149, %137
  %151 = fmul contract float %138, %138
  %152 = fmul contract float %150, %150
  %153 = fadd contract float %151, %152
  %154 = fcmp olt float %153, 0x39F0000000000000
  %155 = select i1 %154, float 0x41F0000000000000, float 1.000000e+00
  %156 = fmul float %153, %155
  %157 = tail call float @llvm.sqrt.f32(float %156)
  %158 = bitcast float %157 to i32
  %159 = add nsw i32 %158, -1
  %160 = bitcast i32 %159 to float
  %161 = add nsw i32 %158, 1
  %162 = bitcast i32 %161 to float
  %163 = tail call i1 @llvm.amdgcn.class.f32(float %156, i32 608)
  %164 = select i1 %154, float 0x3EF0000000000000, float 1.000000e+00
  %165 = fneg float %162
  %166 = tail call float @llvm.fma.f32(float %165, float %157, float %156)
  %167 = fcmp ogt float %166, 0.000000e+00
  %168 = fneg float %160
  %169 = tail call float @llvm.fma.f32(float %168, float %157, float %156)
  %170 = fcmp ole float %169, 0.000000e+00
  %171 = select i1 %170, float %160, float %157
  %172 = select i1 %167, float %162, float %171
  %173 = fmul float %164, %172
  %174 = select i1 %163, float %156, float %173
  %175 = sext i32 %27 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %3, i64 %175
  store float %174, float addrspace(1)* %176, align 4, !tbaa !7
  br label %177

177:                                              ; preds = %107, %97
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
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
