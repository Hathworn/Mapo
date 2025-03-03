; ModuleID = '../data/hip_kernels/8504/10/main.cu'
source_filename = "../data/hip_kernels/8504/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12gpu_multiplyPfS_S_iiiiiiE2As = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16
@_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12gpu_multiplyPfS_S_iiiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl i32 %14, 4
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %17 = add i32 %15, %16
  %18 = icmp sgt i32 %4, 0
  br i1 %18, label %19, label %59

19:                                               ; preds = %9
  %20 = add nuw nsw i32 %4, 15
  %21 = lshr i32 %20, 4
  %22 = icmp slt i32 %13, %3
  %23 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 %16
  %24 = mul nsw i32 %13, %4
  %25 = icmp slt i32 %17, %6
  %26 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 %12, i32 %16
  %27 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 0
  %28 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 0, i32 %16
  %29 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 1
  %30 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 1, i32 %16
  %31 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 2
  %32 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 2, i32 %16
  %33 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 3
  %34 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 3, i32 %16
  %35 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 4
  %36 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 4, i32 %16
  %37 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 5
  %38 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 5, i32 %16
  %39 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 6
  %40 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 6, i32 %16
  %41 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 7
  %42 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 7, i32 %16
  %43 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 8
  %44 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 8, i32 %16
  %45 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 9
  %46 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 9, i32 %16
  %47 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 10
  %48 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 10, i32 %16
  %49 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 11
  %50 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 11, i32 %16
  %51 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 12
  %52 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 12, i32 %16
  %53 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 13
  %54 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 13, i32 %16
  %55 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 14
  %56 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 14, i32 %16
  %57 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2As, i32 0, i32 %12, i32 15
  %58 = getelementptr inbounds [16 x [16 x float]], [16 x [16 x float]] addrspace(3)* @_ZZ12gpu_multiplyPfS_S_iiiiiiE2Bs, i32 0, i32 15, i32 %16
  br label %64

59:                                               ; preds = %87, %9
  %60 = phi float [ 0.000000e+00, %9 ], [ %152, %87 ]
  %61 = icmp slt i32 %13, %7
  %62 = icmp slt i32 %17, %8
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %155, label %173

64:                                               ; preds = %19, %87
  %65 = phi i32 [ 0, %19 ], [ %153, %87 ]
  %66 = phi float [ 0.000000e+00, %19 ], [ %152, %87 ]
  %67 = shl nsw i32 %65, 4
  %68 = add nuw i32 %67, %16
  %69 = icmp ult i32 %68, %4
  %70 = select i1 %69, i1 %22, i1 false
  br i1 %70, label %71, label %76

71:                                               ; preds = %64
  %72 = add i32 %68, %24
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %76

76:                                               ; preds = %64, %71
  %77 = phi float [ %75, %71 ], [ 0.000000e+00, %64 ]
  store float %77, float addrspace(3)* %23, align 4, !tbaa !5
  %78 = add nuw i32 %67, %12
  %79 = icmp ult i32 %78, %5
  %80 = select i1 %79, i1 %25, i1 false
  br i1 %80, label %81, label %87

81:                                               ; preds = %76
  %82 = mul i32 %78, %6
  %83 = add i32 %82, %17
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !5, !amdgpu.noclobber !9
  br label %87

87:                                               ; preds = %76, %81
  %88 = phi float [ %86, %81 ], [ 0.000000e+00, %76 ]
  store float %88, float addrspace(3)* %26, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = load float, float addrspace(3)* %27, align 16, !tbaa !5
  %90 = load float, float addrspace(3)* %28, align 4, !tbaa !5
  %91 = fmul contract float %89, %90
  %92 = fadd contract float %66, %91
  %93 = load float, float addrspace(3)* %29, align 4, !tbaa !5
  %94 = load float, float addrspace(3)* %30, align 4, !tbaa !5
  %95 = fmul contract float %93, %94
  %96 = fadd contract float %92, %95
  %97 = load float, float addrspace(3)* %31, align 8, !tbaa !5
  %98 = load float, float addrspace(3)* %32, align 4, !tbaa !5
  %99 = fmul contract float %97, %98
  %100 = fadd contract float %96, %99
  %101 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %102 = load float, float addrspace(3)* %34, align 4, !tbaa !5
  %103 = fmul contract float %101, %102
  %104 = fadd contract float %100, %103
  %105 = load float, float addrspace(3)* %35, align 16, !tbaa !5
  %106 = load float, float addrspace(3)* %36, align 4, !tbaa !5
  %107 = fmul contract float %105, %106
  %108 = fadd contract float %104, %107
  %109 = load float, float addrspace(3)* %37, align 4, !tbaa !5
  %110 = load float, float addrspace(3)* %38, align 4, !tbaa !5
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %108, %111
  %113 = load float, float addrspace(3)* %39, align 8, !tbaa !5
  %114 = load float, float addrspace(3)* %40, align 4, !tbaa !5
  %115 = fmul contract float %113, %114
  %116 = fadd contract float %112, %115
  %117 = load float, float addrspace(3)* %41, align 4, !tbaa !5
  %118 = load float, float addrspace(3)* %42, align 4, !tbaa !5
  %119 = fmul contract float %117, %118
  %120 = fadd contract float %116, %119
  %121 = load float, float addrspace(3)* %43, align 16, !tbaa !5
  %122 = load float, float addrspace(3)* %44, align 4, !tbaa !5
  %123 = fmul contract float %121, %122
  %124 = fadd contract float %120, %123
  %125 = load float, float addrspace(3)* %45, align 4, !tbaa !5
  %126 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %127 = fmul contract float %125, %126
  %128 = fadd contract float %124, %127
  %129 = load float, float addrspace(3)* %47, align 8, !tbaa !5
  %130 = load float, float addrspace(3)* %48, align 4, !tbaa !5
  %131 = fmul contract float %129, %130
  %132 = fadd contract float %128, %131
  %133 = load float, float addrspace(3)* %49, align 4, !tbaa !5
  %134 = load float, float addrspace(3)* %50, align 4, !tbaa !5
  %135 = fmul contract float %133, %134
  %136 = fadd contract float %132, %135
  %137 = load float, float addrspace(3)* %51, align 16, !tbaa !5
  %138 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %139 = fmul contract float %137, %138
  %140 = fadd contract float %136, %139
  %141 = load float, float addrspace(3)* %53, align 4, !tbaa !5
  %142 = load float, float addrspace(3)* %54, align 4, !tbaa !5
  %143 = fmul contract float %141, %142
  %144 = fadd contract float %140, %143
  %145 = load float, float addrspace(3)* %55, align 8, !tbaa !5
  %146 = load float, float addrspace(3)* %56, align 4, !tbaa !5
  %147 = fmul contract float %145, %146
  %148 = fadd contract float %144, %147
  %149 = load float, float addrspace(3)* %57, align 4, !tbaa !5
  %150 = load float, float addrspace(3)* %58, align 4, !tbaa !5
  %151 = fmul contract float %149, %150
  %152 = fadd contract float %148, %151
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %153 = add nuw nsw i32 %65, 1
  %154 = icmp eq i32 %153, %21
  br i1 %154, label %59, label %64, !llvm.loop !10

155:                                              ; preds = %59
  %156 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %157 = getelementptr i8, i8 addrspace(4)* %156, i64 6
  %158 = bitcast i8 addrspace(4)* %157 to i16 addrspace(4)*
  %159 = load i16, i16 addrspace(4)* %158, align 2, !range !12, !invariant.load !9
  %160 = zext i16 %159 to i32
  %161 = mul i32 %10, %160
  %162 = add i32 %161, %12
  %163 = mul i32 %162, %8
  %164 = getelementptr i8, i8 addrspace(4)* %156, i64 4
  %165 = bitcast i8 addrspace(4)* %164 to i16 addrspace(4)*
  %166 = load i16, i16 addrspace(4)* %165, align 4, !range !12, !invariant.load !9
  %167 = zext i16 %166 to i32
  %168 = mul i32 %14, %167
  %169 = add i32 %168, %16
  %170 = add i32 %169, %163
  %171 = zext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %2, i64 %171
  store float %60, float addrspace(1)* %172, align 4, !tbaa !5
  br label %173

173:                                              ; preds = %155, %59
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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{i16 1, i16 1025}
