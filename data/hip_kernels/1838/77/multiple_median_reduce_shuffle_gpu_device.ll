; ModuleID = '../data/hip_kernels/1838/77/main.cu'
source_filename = "../data/hip_kernels/1838/77/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = icmp ult i32 %7, 243
  br i1 %9, label %10, label %31

10:                                               ; preds = %5
  %11 = mul i32 %8, 243
  %12 = add i32 %11, %7
  %13 = sext i32 %6 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !5, !amdgpu.noclobber !9
  %16 = sitofp i32 %15 to float
  %17 = sext i32 %12 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !10, !amdgpu.noclobber !9
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %13
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !5, !amdgpu.noclobber !9
  %22 = sitofp i32 %21 to float
  %23 = fmul contract float %19, %22
  %24 = tail call float @llvm.floor.f32(float %23)
  %25 = fadd contract float %24, %16
  %26 = fptosi float %25 to i32
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !10, !amdgpu.noclobber !9
  %30 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %7
  store float %29, float addrspace(3)* %30, align 4, !tbaa !10
  br label %31

31:                                               ; preds = %10, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = mul nuw nsw i32 %7, 3
  %33 = icmp ult i32 %7, 81
  br i1 %33, label %34, label %47

34:                                               ; preds = %31
  %35 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %32
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !10
  %37 = add nuw nsw i32 %32, 1
  %38 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %37
  %39 = load float, float addrspace(3)* %38, align 4, !tbaa !10
  %40 = add nuw nsw i32 %32, 2
  %41 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %40
  %42 = load float, float addrspace(3)* %41, align 4, !tbaa !10
  %43 = tail call float @llvm.minnum.f32(float %36, float %39)
  %44 = tail call float @llvm.maxnum.f32(float %36, float %39)
  %45 = tail call float @llvm.maxnum.f32(float %43, float %42)
  %46 = tail call float @llvm.minnum.f32(float %44, float %45)
  store float %46, float addrspace(3)* %35, align 4, !tbaa !10
  br label %47

47:                                               ; preds = %34, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = mul nuw nsw i32 %7, 9
  %49 = icmp ult i32 %7, 27
  br i1 %49, label %50, label %63

50:                                               ; preds = %47
  %51 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %48
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !10
  %53 = add nuw nsw i32 %48, 3
  %54 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !10
  %56 = add nuw nsw i32 %48, 6
  %57 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %56
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !10
  %59 = tail call float @llvm.minnum.f32(float %52, float %55)
  %60 = tail call float @llvm.maxnum.f32(float %52, float %55)
  %61 = tail call float @llvm.maxnum.f32(float %59, float %58)
  %62 = tail call float @llvm.minnum.f32(float %60, float %61)
  store float %62, float addrspace(3)* %51, align 4, !tbaa !10
  br label %63

63:                                               ; preds = %50, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = mul nuw nsw i32 %7, 27
  %65 = icmp ult i32 %7, 9
  br i1 %65, label %66, label %79

66:                                               ; preds = %63
  %67 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %64
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !10
  %69 = add nuw nsw i32 %64, 9
  %70 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !10
  %72 = add nuw nsw i32 %64, 18
  %73 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !10
  %75 = tail call float @llvm.minnum.f32(float %68, float %71)
  %76 = tail call float @llvm.maxnum.f32(float %68, float %71)
  %77 = tail call float @llvm.maxnum.f32(float %75, float %74)
  %78 = tail call float @llvm.minnum.f32(float %76, float %77)
  store float %78, float addrspace(3)* %67, align 4, !tbaa !10
  br label %79

79:                                               ; preds = %66, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = mul nuw nsw i32 %7, 81
  %81 = icmp ult i32 %7, 3
  br i1 %81, label %82, label %95

82:                                               ; preds = %79
  %83 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %80
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !10
  %85 = add nuw nsw i32 %80, 27
  %86 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !10
  %88 = add nuw nsw i32 %80, 54
  %89 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !10
  %91 = tail call float @llvm.minnum.f32(float %84, float %87)
  %92 = tail call float @llvm.maxnum.f32(float %84, float %87)
  %93 = tail call float @llvm.maxnum.f32(float %91, float %90)
  %94 = tail call float @llvm.minnum.f32(float %92, float %93)
  store float %94, float addrspace(3)* %83, align 4, !tbaa !10
  br label %95

95:                                               ; preds = %82, %79
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = mul nuw nsw i32 %7, 243
  %97 = icmp eq i32 %7, 0
  br i1 %97, label %98, label %111

98:                                               ; preds = %95
  %99 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %96
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !10
  %101 = add nuw nsw i32 %96, 81
  %102 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %101
  %103 = load float, float addrspace(3)* %102, align 4, !tbaa !10
  %104 = add nuw nsw i32 %96, 162
  %105 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 %104
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !10
  %107 = tail call float @llvm.minnum.f32(float %100, float %103)
  %108 = tail call float @llvm.maxnum.f32(float %100, float %103)
  %109 = tail call float @llvm.maxnum.f32(float %107, float %106)
  %110 = tail call float @llvm.minnum.f32(float %108, float %109)
  store float %110, float addrspace(3)* %99, align 4, !tbaa !10
  br label %111

111:                                              ; preds = %98, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %112 = icmp eq i32 %7, 0
  br i1 %112, label %113, label %132

113:                                              ; preds = %111
  %114 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ34multiple_median_reduce_shuffle_gpuPKfPfS0_PKiS3_E4DATA, i32 0, i32 0), align 16, !tbaa !10
  %115 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %115, i64 12
  %117 = bitcast i8 addrspace(4)* %116 to i32 addrspace(4)*
  %118 = load i32, i32 addrspace(4)* %117, align 4, !tbaa !12
  %119 = getelementptr i8, i8 addrspace(4)* %115, i64 4
  %120 = bitcast i8 addrspace(4)* %119 to i16 addrspace(4)*
  %121 = load i16, i16 addrspace(4)* %120, align 4, !range !21, !invariant.load !9
  %122 = zext i16 %121 to i32
  %123 = udiv i32 %118, %122
  %124 = mul i32 %123, %122
  %125 = icmp ugt i32 %118, %124
  %126 = zext i1 %125 to i32
  %127 = add i32 %123, %126
  %128 = mul i32 %127, %6
  %129 = add i32 %128, %8
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %130
  store float %114, float addrspace(1)* %131, align 4, !tbaa !10
  br label %132

132:                                              ; preds = %113, %111
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = !{!13, !17, i64 12}
!13 = !{!"hsa_kernel_dispatch_packet_s", !14, i64 0, !14, i64 2, !14, i64 4, !14, i64 6, !14, i64 8, !14, i64 10, !17, i64 12, !17, i64 16, !17, i64 20, !17, i64 24, !17, i64 28, !18, i64 32, !19, i64 40, !18, i64 48, !20, i64 56}
!14 = !{!"short", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!"int", !15, i64 0}
!18 = !{!"long", !15, i64 0}
!19 = !{!"any pointer", !15, i64 0}
!20 = !{!"hsa_signal_s", !18, i64 0}
!21 = !{i16 1, i16 1025}
