; ModuleID = '../data/hip_kernels/1029/1/main.cu'
source_filename = "../data/hip_kernels/1029/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12gpu_gaussianiiPfS_E8sh_block = internal unnamed_addr addrspace(3) global [324 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z12gpu_gaussianiiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
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
  br i1 %26, label %27, label %138

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
  %39 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %35
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
  %47 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %46
  store float %45, float addrspace(3)* %47, align 4, !tbaa !7
  %48 = shl nsw i32 %0, 1
  %49 = add nsw i32 %29, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %2, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = add nuw nsw i32 %35, 36
  %54 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %53
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
  %63 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %62
  store float %61, float addrspace(3)* %63, align 4, !tbaa !7
  %64 = add nsw i32 %29, 2
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = add nuw nsw i32 %35, 2
  %69 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %68
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
  %79 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %78
  store float %77, float addrspace(3)* %79, align 4, !tbaa !7
  %80 = shl nsw i32 %0, 1
  %81 = add nsw i32 %29, %80
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = add nuw nsw i32 %35, 37
  %87 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %86
  store float %85, float addrspace(3)* %87, align 4, !tbaa !7
  %88 = add nsw i32 %73, 2
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = add nuw nsw i32 %35, 20
  %93 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %92
  store float %91, float addrspace(3)* %93, align 4, !tbaa !7
  %94 = add nsw i32 %81, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = add nuw nsw i32 %35, 38
  %99 = getelementptr inbounds [324 x float], [324 x float] addrspace(3)* @_ZZ12gpu_gaussianiiPfS_E8sh_block, i32 0, i32 %98
  store float %97, float addrspace(3)* %99, align 4, !tbaa !7
  br label %100

100:                                              ; preds = %70, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %102 = fmul contract float %101, 6.250000e-02
  %103 = fadd contract float %102, 0.000000e+00
  %104 = getelementptr inbounds float, float addrspace(3)* %39, i32 1
  %105 = load float, float addrspace(3)* %104, align 4, !tbaa !7
  %106 = fmul contract float %105, 1.250000e-01
  %107 = fadd contract float %103, %106
  %108 = getelementptr inbounds float, float addrspace(3)* %39, i32 2
  %109 = load float, float addrspace(3)* %108, align 4, !tbaa !7
  %110 = fmul contract float %109, 6.250000e-02
  %111 = fadd contract float %107, %110
  %112 = getelementptr inbounds float, float addrspace(3)* %39, i32 18
  %113 = load float, float addrspace(3)* %112, align 4, !tbaa !7
  %114 = fmul contract float %113, 1.250000e-01
  %115 = fadd contract float %111, %114
  %116 = getelementptr inbounds float, float addrspace(3)* %39, i32 19
  %117 = load float, float addrspace(3)* %116, align 4, !tbaa !7
  %118 = fmul contract float %117, 2.500000e-01
  %119 = fadd contract float %115, %118
  %120 = getelementptr inbounds float, float addrspace(3)* %39, i32 20
  %121 = load float, float addrspace(3)* %120, align 4, !tbaa !7
  %122 = fmul contract float %121, 1.250000e-01
  %123 = fadd contract float %119, %122
  %124 = getelementptr inbounds float, float addrspace(3)* %39, i32 36
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !7
  %126 = fmul contract float %125, 6.250000e-02
  %127 = fadd contract float %123, %126
  %128 = getelementptr inbounds float, float addrspace(3)* %39, i32 37
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !7
  %130 = fmul contract float %129, 1.250000e-01
  %131 = fadd contract float %127, %130
  %132 = getelementptr inbounds float, float addrspace(3)* %39, i32 38
  %133 = load float, float addrspace(3)* %132, align 4, !tbaa !7
  %134 = fmul contract float %133, 6.250000e-02
  %135 = fadd contract float %131, %134
  %136 = sext i32 %33 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %3, i64 %136
  store float %135, float addrspace(1)* %137, align 4, !tbaa !7
  br label %138

138:                                              ; preds = %100, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
