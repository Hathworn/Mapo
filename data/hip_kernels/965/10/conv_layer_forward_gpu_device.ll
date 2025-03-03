; ModuleID = '../data/hip_kernels/965/10/main.cu'
source_filename = "../data/hip_kernels/965/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w = internal unnamed_addr addrspace(3) global [5 x [5 x float]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z22conv_layer_forward_gpuPfS_S_iiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = mul i32 %9, %3
  %14 = icmp slt i32 %11, %6
  %15 = icmp slt i32 %12, %6
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %26

17:                                               ; preds = %8
  %18 = mul i32 %10, %6
  %19 = add i32 %18, %11
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %12
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  %25 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %11, i32 %12
  store float %24, float addrspace(3)* %25, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %17, %8
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp slt i32 %11, %5
  %28 = icmp slt i32 %12, %5
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %155

30:                                               ; preds = %26
  %31 = icmp sgt i32 %6, 0
  br i1 %31, label %32, label %145

32:                                               ; preds = %30
  %33 = add i32 %13, %11
  %34 = and i32 %6, 7
  %35 = icmp ult i32 %6, 8
  %36 = and i32 %6, -8
  %37 = icmp eq i32 %34, 0
  br label %38

38:                                               ; preds = %32, %141
  %39 = phi i32 [ 0, %32 ], [ %143, %141 ]
  %40 = phi float [ 0.000000e+00, %32 ], [ %142, %141 ]
  %41 = add i32 %33, %39
  %42 = mul i32 %41, %4
  %43 = add i32 %42, %12
  br i1 %35, label %122, label %44

44:                                               ; preds = %38, %44
  %45 = phi float [ %118, %44 ], [ %40, %38 ]
  %46 = phi i32 [ %119, %44 ], [ 0, %38 ]
  %47 = phi i32 [ %120, %44 ], [ 0, %38 ]
  %48 = add i32 %43, %46
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %46
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !5
  %54 = fmul contract float %51, %53
  %55 = fadd contract float %45, %54
  %56 = or i32 %46, 1
  %57 = add i32 %43, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %56
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !5
  %63 = fmul contract float %60, %62
  %64 = fadd contract float %55, %63
  %65 = or i32 %46, 2
  %66 = add i32 %43, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %0, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %65
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !5
  %72 = fmul contract float %69, %71
  %73 = fadd contract float %64, %72
  %74 = or i32 %46, 3
  %75 = add i32 %43, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !5, !amdgpu.noclobber !9
  %79 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %74
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !5
  %81 = fmul contract float %78, %80
  %82 = fadd contract float %73, %81
  %83 = or i32 %46, 4
  %84 = add i32 %43, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %83
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !5
  %90 = fmul contract float %87, %89
  %91 = fadd contract float %82, %90
  %92 = or i32 %46, 5
  %93 = add i32 %43, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %0, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !5, !amdgpu.noclobber !9
  %97 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %92
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !5
  %99 = fmul contract float %96, %98
  %100 = fadd contract float %91, %99
  %101 = or i32 %46, 6
  %102 = add i32 %43, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %101
  %107 = load float, float addrspace(3)* %106, align 4, !tbaa !5
  %108 = fmul contract float %105, %107
  %109 = fadd contract float %100, %108
  %110 = or i32 %46, 7
  %111 = add i32 %43, %110
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !5, !amdgpu.noclobber !9
  %115 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %110
  %116 = load float, float addrspace(3)* %115, align 4, !tbaa !5
  %117 = fmul contract float %114, %116
  %118 = fadd contract float %109, %117
  %119 = add nuw nsw i32 %46, 8
  %120 = add i32 %47, 8
  %121 = icmp eq i32 %120, %36
  br i1 %121, label %122, label %44, !llvm.loop !10

122:                                              ; preds = %44, %38
  %123 = phi float [ undef, %38 ], [ %118, %44 ]
  %124 = phi float [ %40, %38 ], [ %118, %44 ]
  %125 = phi i32 [ 0, %38 ], [ %119, %44 ]
  br i1 %37, label %141, label %126

126:                                              ; preds = %122, %126
  %127 = phi float [ %137, %126 ], [ %124, %122 ]
  %128 = phi i32 [ %138, %126 ], [ %125, %122 ]
  %129 = phi i32 [ %139, %126 ], [ 0, %122 ]
  %130 = add i32 %43, %128
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !5, !amdgpu.noclobber !9
  %134 = getelementptr inbounds [5 x [5 x float]], [5 x [5 x float]] addrspace(3)* @_ZZ22conv_layer_forward_gpuPfS_S_iiiiiE8cached_w, i32 0, i32 %39, i32 %128
  %135 = load float, float addrspace(3)* %134, align 4, !tbaa !5
  %136 = fmul contract float %133, %135
  %137 = fadd contract float %127, %136
  %138 = add nuw nsw i32 %128, 1
  %139 = add i32 %129, 1
  %140 = icmp eq i32 %139, %34
  br i1 %140, label %141, label %126, !llvm.loop !12

141:                                              ; preds = %126, %122
  %142 = phi float [ %123, %122 ], [ %137, %126 ]
  %143 = add nuw nsw i32 %39, 1
  %144 = icmp eq i32 %143, %6
  br i1 %144, label %145, label %38, !llvm.loop !14

145:                                              ; preds = %141, %30
  %146 = phi float [ 0.000000e+00, %30 ], [ %142, %141 ]
  %147 = mul i32 %9, %7
  %148 = add i32 %147, %10
  %149 = mul i32 %148, %5
  %150 = add i32 %149, %11
  %151 = mul i32 %150, %5
  %152 = add i32 %151, %12
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  store float %146, float addrspace(1)* %154, align 4, !tbaa !5
  br label %155

155:                                              ; preds = %145, %26
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !11}
