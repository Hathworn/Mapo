; ModuleID = '../data/hip_kernels/24/16/main.cu'
source_filename = "../data/hip_kernels/24/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10multKernelPfS_S_iE3s_a = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ10multKernelPfS_S_iE3s_b = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10multKernelPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %6
  %16 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %7, %19
  %21 = add i32 %20, %5
  %22 = sdiv i32 %3, 16
  %23 = icmp sgt i32 %3, 15
  %24 = mul nsw i32 %15, %3
  br i1 %23, label %25, label %61

25:                                               ; preds = %4
  %26 = add i32 %24, %5
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 %5
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 %6, i32 %5
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 0
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 0, i32 %5
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 1
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 1, i32 %5
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 2
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 2, i32 %5
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 3
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 3, i32 %5
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 4
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 4, i32 %5
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 5
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 5, i32 %5
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 6
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 6, i32 %5
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 7
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 7, i32 %5
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 8
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 8, i32 %5
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 9
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 9, i32 %5
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 10
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 10, i32 %5
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 11
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 11, i32 %5
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 12
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 12, i32 %5
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 13
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 13, i32 %5
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 14
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 14, i32 %5
  %59 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_a, i32 0, i32 %6, i32 15
  %60 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ10multKernelPfS_S_iE3s_b, i32 0, i32 15, i32 %5
  br label %66

61:                                               ; preds = %66, %4
  %62 = phi float [ 0.000000e+00, %4 ], [ %143, %66 ]
  %63 = add nsw i32 %24, %21
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  store float %62, float addrspace(1)* %65, align 4, !tbaa !7
  ret void

66:                                               ; preds = %25, %66
  %67 = phi i32 [ 0, %25 ], [ %144, %66 ]
  %68 = phi float [ 0.000000e+00, %25 ], [ %143, %66 ]
  %69 = shl nsw i32 %67, 4
  %70 = add i32 %26, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %73, float addrspace(3)* %27, align 4, !tbaa !7
  %74 = add nuw nsw i32 %69, %6
  %75 = mul nsw i32 %74, %3
  %76 = add nsw i32 %75, %21
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !6
  store float %79, float addrspace(3)* %28, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = load float, float addrspace(3)* %29, align 16, !tbaa !7
  %81 = load float, float addrspace(3)* %30, align 4, !tbaa !7
  %82 = fmul contract float %80, %81
  %83 = fadd contract float %68, %82
  %84 = load float, float addrspace(3)* %31, align 4, !tbaa !7
  %85 = load float, float addrspace(3)* %32, align 4, !tbaa !7
  %86 = fmul contract float %84, %85
  %87 = fadd contract float %83, %86
  %88 = load float, float addrspace(3)* %33, align 8, !tbaa !7
  %89 = load float, float addrspace(3)* %34, align 4, !tbaa !7
  %90 = fmul contract float %88, %89
  %91 = fadd contract float %87, %90
  %92 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %93 = load float, float addrspace(3)* %36, align 4, !tbaa !7
  %94 = fmul contract float %92, %93
  %95 = fadd contract float %91, %94
  %96 = load float, float addrspace(3)* %37, align 16, !tbaa !7
  %97 = load float, float addrspace(3)* %38, align 4, !tbaa !7
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %95, %98
  %100 = load float, float addrspace(3)* %39, align 4, !tbaa !7
  %101 = load float, float addrspace(3)* %40, align 4, !tbaa !7
  %102 = fmul contract float %100, %101
  %103 = fadd contract float %99, %102
  %104 = load float, float addrspace(3)* %41, align 8, !tbaa !7
  %105 = load float, float addrspace(3)* %42, align 4, !tbaa !7
  %106 = fmul contract float %104, %105
  %107 = fadd contract float %103, %106
  %108 = load float, float addrspace(3)* %43, align 4, !tbaa !7
  %109 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %110 = fmul contract float %108, %109
  %111 = fadd contract float %107, %110
  %112 = load float, float addrspace(3)* %45, align 16, !tbaa !7
  %113 = load float, float addrspace(3)* %46, align 4, !tbaa !7
  %114 = fmul contract float %112, %113
  %115 = fadd contract float %111, %114
  %116 = load float, float addrspace(3)* %47, align 4, !tbaa !7
  %117 = load float, float addrspace(3)* %48, align 4, !tbaa !7
  %118 = fmul contract float %116, %117
  %119 = fadd contract float %115, %118
  %120 = load float, float addrspace(3)* %49, align 8, !tbaa !7
  %121 = load float, float addrspace(3)* %50, align 4, !tbaa !7
  %122 = fmul contract float %120, %121
  %123 = fadd contract float %119, %122
  %124 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %125 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %126 = fmul contract float %124, %125
  %127 = fadd contract float %123, %126
  %128 = load float, float addrspace(3)* %53, align 16, !tbaa !7
  %129 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %130 = fmul contract float %128, %129
  %131 = fadd contract float %127, %130
  %132 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %133 = load float, float addrspace(3)* %56, align 4, !tbaa !7
  %134 = fmul contract float %132, %133
  %135 = fadd contract float %131, %134
  %136 = load float, float addrspace(3)* %57, align 8, !tbaa !7
  %137 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %138 = fmul contract float %136, %137
  %139 = fadd contract float %135, %138
  %140 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %141 = load float, float addrspace(3)* %60, align 4, !tbaa !7
  %142 = fmul contract float %140, %141
  %143 = fadd contract float %139, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %144 = add nuw nsw i32 %67, 1
  %145 = icmp eq i32 %144, %22
  br i1 %145, label %61, label %66, !llvm.loop !11
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
