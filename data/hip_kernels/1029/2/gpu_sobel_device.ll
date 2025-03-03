; ModuleID = '../data/hip_kernels/1029/2/main.cu'
source_filename = "../data/hip_kernels/1029/2/main.cu"
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
  %22 = add nsw i32 %0, -2
  %23 = icmp slt i32 %13, %22
  %24 = add nsw i32 %1, -2
  %25 = icmp slt i32 %21, %24
  %26 = select i1 %23, i1 %25, i1 false
  br i1 %26, label %27, label %170

27:                                               ; preds = %4
  %28 = mul nsw i32 %21, %0
  %29 = add nsw i32 %28, %13
  %30 = add nsw i32 %21, 1
  %31 = mul nsw i32 %30, %0
  %32 = add nsw i32 %13, 1
  %33 = add nsw i32 %32, %31
  %34 = mul nuw nsw i32 %20, 18
  %35 = add nuw nsw i32 %34, %12
  %36 = sext i32 %29 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %35
  store float %38, float addrspace(3)* %39, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ne i32 %20, 15
  br i1 %40, label %55, label %41

41:                                               ; preds = %27
  %42 = add nsw i32 %29, %0
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nuw nsw i32 %35, 18
  %47 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %46
  store float %45, float addrspace(3)* %47, align 4, !tbaa !7
  %48 = shl nsw i32 %0, 1
  %49 = add nsw i32 %29, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nuw nsw i32 %35, 36
  %54 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %53
  store float %52, float addrspace(3)* %54, align 4, !tbaa !7
  br label %55

55:                                               ; preds = %41, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %56 = icmp ne i32 %12, 15
  br i1 %56, label %70, label %57

57:                                               ; preds = %55
  %58 = add nsw i32 %29, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %2, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = add nuw nsw i32 %35, 1
  %63 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %62
  store float %61, float addrspace(3)* %63, align 4, !tbaa !7
  %64 = add nsw i32 %29, 2
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = add nuw nsw i32 %35, 2
  %69 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %68
  store float %67, float addrspace(3)* %69, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %57, %55
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = select i1 %40, i1 true, i1 %56
  br i1 %71, label %100, label %72

72:                                               ; preds = %70
  %73 = add nsw i32 %29, %0
  %74 = add nsw i32 %73, 1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = add nuw nsw i32 %35, 19
  %79 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %78
  store float %77, float addrspace(3)* %79, align 4, !tbaa !7
  %80 = shl nsw i32 %0, 1
  %81 = add nsw i32 %29, %80
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = add nuw nsw i32 %35, 37
  %87 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %86
  store float %85, float addrspace(3)* %87, align 4, !tbaa !7
  %88 = add nsw i32 %73, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = add nuw nsw i32 %35, 20
  %93 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %92
  store float %91, float addrspace(3)* %93, align 4, !tbaa !7
  %94 = add nsw i32 %81, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = add nuw nsw i32 %35, 38
  %99 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ9gpu_sobeliiPfS_E8sh_block, i32 0, i32 %98
  store float %97, float addrspace(3)* %99, align 4, !tbaa !7
  br label %100

100:                                              ; preds = %70, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %102 = fadd contract float %101, 0.000000e+00
  %103 = getelementptr inbounds float, float addrspace(3)* %39, i32 1
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !7
  %105 = fmul contract float %104, 0.000000e+00
  %106 = fadd contract float %102, %105
  %107 = getelementptr inbounds float, float addrspace(3)* %39, i32 2
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !7
  %109 = fsub contract float %106, %108
  %110 = getelementptr inbounds float, float addrspace(3)* %39, i32 18
  %111 = load float, float addrspace(3)* %110, align 4, !tbaa !7
  %112 = fmul contract float %111, 2.000000e+00
  %113 = fadd contract float %109, %112
  %114 = getelementptr inbounds float, float addrspace(3)* %39, i32 19
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !7
  %116 = fmul contract float %115, 0.000000e+00
  %117 = fadd contract float %113, %116
  %118 = getelementptr inbounds float, float addrspace(3)* %39, i32 20
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !7
  %120 = fmul contract float %119, 2.000000e+00
  %121 = fsub contract float %117, %120
  %122 = getelementptr inbounds float, float addrspace(3)* %39, i32 36
  %123 = load float, float addrspace(3)* %122, align 4, !tbaa !7
  %124 = fadd contract float %123, %121
  %125 = getelementptr inbounds float, float addrspace(3)* %39, i32 37
  %126 = load float, float addrspace(3)* %125, align 4, !tbaa !7
  %127 = fmul contract float %126, 0.000000e+00
  %128 = fadd contract float %124, %127
  %129 = getelementptr inbounds float, float addrspace(3)* %39, i32 38
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !7
  %131 = fsub contract float %128, %130
  %132 = fmul contract float %104, 2.000000e+00
  %133 = fadd contract float %102, %132
  %134 = fadd contract float %108, %133
  %135 = fmul contract float %111, 0.000000e+00
  %136 = fadd contract float %134, %135
  %137 = fadd contract float %136, %116
  %138 = fmul contract float %119, 0.000000e+00
  %139 = fadd contract float %137, %138
  %140 = fsub contract float %139, %123
  %141 = fmul contract float %126, 2.000000e+00
  %142 = fsub contract float %140, %141
  %143 = fsub contract float %142, %130
  %144 = fmul contract float %131, %131
  %145 = fmul contract float %143, %143
  %146 = fadd contract float %144, %145
  %147 = fcmp olt float %146, 0x39F0000000000000
  %148 = select i1 %147, float 0x41F0000000000000, float 1.000000e+00
  %149 = fmul float %146, %148
  %150 = tail call float @llvm.sqrt.f32(float %149)
  %151 = bitcast float %150 to i32
  %152 = add nsw i32 %151, -1
  %153 = bitcast i32 %152 to float
  %154 = add nsw i32 %151, 1
  %155 = bitcast i32 %154 to float
  %156 = tail call i1 @llvm.amdgcn.class.f32(float %149, i32 608)
  %157 = select i1 %147, float 0x3EF0000000000000, float 1.000000e+00
  %158 = fneg float %155
  %159 = tail call float @llvm.fma.f32(float %158, float %150, float %149)
  %160 = fcmp ogt float %159, 0.000000e+00
  %161 = fneg float %153
  %162 = tail call float @llvm.fma.f32(float %161, float %150, float %149)
  %163 = fcmp ole float %162, 0.000000e+00
  %164 = select i1 %163, float %153, float %150
  %165 = select i1 %160, float %155, float %164
  %166 = fmul float %157, %165
  %167 = select i1 %156, float %149, float %166
  %168 = sext i32 %33 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %3, i64 %168
  store float %167, float addrspace(1)* %169, align 4, !tbaa !7
  br label %170

170:                                              ; preds = %100, %4
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
