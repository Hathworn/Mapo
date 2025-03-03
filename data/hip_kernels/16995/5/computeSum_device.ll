; ModuleID = '../data/hip_kernels/16995/5/main.cu'
source_filename = "../data/hip_kernels/16995/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10computeSumPfS_jE4smem = internal addrspace(3) global [128 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10computeSumPfS_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 2
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = mul nuw nsw i32 %10, 3
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %2
  br i1 %16, label %17, label %36

17:                                               ; preds = %3
  %18 = zext i32 %13 to i64
  %19 = getelementptr inbounds float, float addrspace(1)* %0, i64 %18
  %20 = load float, float addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = add i32 %13, %10
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = shl nuw nsw i32 %10, 1
  %26 = add i32 %13, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = zext i32 %15 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = fadd contract float %20, %24
  %34 = fadd contract float %33, %29
  %35 = fadd contract float %34, %32
  br label %36

36:                                               ; preds = %17, %3
  %37 = phi float [ %35, %17 ], [ 0.000000e+00, %3 ]
  %38 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %4
  store float %37, float addrspace(3)* %38, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = icmp ugt i16 %9, 1023
  %40 = icmp ult i32 %4, 512
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %48

42:                                               ; preds = %36
  %43 = add nuw nsw i32 %4, 512
  %44 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %46 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %38, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %42, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ugt i16 %9, 511
  %50 = icmp ult i32 %4, 256
  %51 = select i1 %49, i1 %50, i1 false
  br i1 %51, label %52, label %58

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %4, 256
  %54 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %53
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %56 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %57 = fadd contract float %55, %56
  store float %57, float addrspace(3)* %38, align 4, !tbaa !7
  br label %58

58:                                               ; preds = %52, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = icmp ugt i16 %9, 255
  %60 = icmp ult i32 %4, 128
  %61 = select i1 %59, i1 %60, i1 false
  br i1 %61, label %62, label %68

62:                                               ; preds = %58
  %63 = add nuw nsw i32 %4, 128
  %64 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %63
  %65 = load float, float addrspace(3)* %64, align 4, !tbaa !7
  %66 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %67 = fadd contract float %65, %66
  store float %67, float addrspace(3)* %38, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %62, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %69 = icmp ugt i16 %9, 127
  %70 = icmp ult i32 %4, 64
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %78

72:                                               ; preds = %68
  %73 = add nuw nsw i32 %4, 64
  %74 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %76 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %77 = fadd contract float %75, %76
  store float %77, float addrspace(3)* %38, align 4, !tbaa !7
  br label %78

78:                                               ; preds = %72, %68
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %79 = icmp ult i32 %4, 32
  br i1 %79, label %80, label %118

80:                                               ; preds = %78
  %81 = add nuw nsw i32 %4, 32
  %82 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %81
  %83 = addrspacecast float addrspace(3)* %82 to float*
  %84 = load volatile float, float* %83, align 4, !tbaa !7
  %85 = addrspacecast float addrspace(3)* %38 to float*
  %86 = load volatile float, float* %85, align 4, !tbaa !7
  %87 = fadd contract float %84, %86
  store volatile float %87, float* %85, align 4, !tbaa !7
  %88 = add nuw nsw i32 %4, 16
  %89 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %88
  %90 = addrspacecast float addrspace(3)* %89 to float*
  %91 = load volatile float, float* %90, align 4, !tbaa !7
  %92 = load volatile float, float* %85, align 4, !tbaa !7
  %93 = fadd contract float %91, %92
  store volatile float %93, float* %85, align 4, !tbaa !7
  %94 = add nuw nsw i32 %4, 8
  %95 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %94
  %96 = addrspacecast float addrspace(3)* %95 to float*
  %97 = load volatile float, float* %96, align 4, !tbaa !7
  %98 = load volatile float, float* %85, align 4, !tbaa !7
  %99 = fadd contract float %97, %98
  store volatile float %99, float* %85, align 4, !tbaa !7
  %100 = add nuw nsw i32 %4, 4
  %101 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %100
  %102 = addrspacecast float addrspace(3)* %101 to float*
  %103 = load volatile float, float* %102, align 4, !tbaa !7
  %104 = load volatile float, float* %85, align 4, !tbaa !7
  %105 = fadd contract float %103, %104
  store volatile float %105, float* %85, align 4, !tbaa !7
  %106 = add nuw nsw i32 %4, 2
  %107 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %106
  %108 = addrspacecast float addrspace(3)* %107 to float*
  %109 = load volatile float, float* %108, align 4, !tbaa !7
  %110 = load volatile float, float* %85, align 4, !tbaa !7
  %111 = fadd contract float %109, %110
  store volatile float %111, float* %85, align 4, !tbaa !7
  %112 = add nuw nsw i32 %4, 1
  %113 = getelementptr inbounds [128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 %112
  %114 = addrspacecast float addrspace(3)* %113 to float*
  %115 = load volatile float, float* %114, align 4, !tbaa !7
  %116 = load volatile float, float* %85, align 4, !tbaa !7
  %117 = fadd contract float %115, %116
  store volatile float %117, float* %85, align 4, !tbaa !7
  br label %118

118:                                              ; preds = %80, %78
  %119 = icmp eq i32 %4, 0
  br i1 %119, label %120, label %124

120:                                              ; preds = %118
  %121 = load float, float addrspace(3)* getelementptr inbounds ([128 x float], [128 x float] addrspace(3)* @_ZZ10computeSumPfS_jE4smem, i32 0, i32 0), align 16, !tbaa !7
  %122 = zext i32 %5 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %1, i64 %122
  store float %121, float addrspace(1)* %123, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %120, %118
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
