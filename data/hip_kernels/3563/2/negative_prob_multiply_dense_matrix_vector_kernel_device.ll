; ModuleID = '../data/hip_kernels/3563/2/main.cu'
source_filename = "../data/hip_kernels/3563/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z49negative_prob_multiply_dense_matrix_vector_kernelPfS_S_jj(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %14, %3
  br i1 %15, label %16, label %171

16:                                               ; preds = %5
  %17 = icmp eq i32 %4, 0
  br i1 %17, label %49, label %18

18:                                               ; preds = %16
  %19 = mul i32 %14, %4
  %20 = and i32 %4, 7
  %21 = icmp ult i32 %4, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = and i32 %4, -8
  br label %53

24:                                               ; preds = %53, %18
  %25 = phi float [ undef, %18 ], [ %167, %53 ]
  %26 = phi i32 [ 0, %18 ], [ %168, %53 ]
  %27 = phi float [ 1.000000e+00, %18 ], [ %167, %53 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %49, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %46, %29 ], [ %26, %24 ]
  %31 = phi float [ %45, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %47, %29 ], [ 0, %24 ]
  %33 = add i32 %30, %19
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i32 %30 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fmul contract float %36, %39
  %41 = fpext float %40 to double
  %42 = fsub contract double 1.000000e+00, %41
  %43 = fpext float %31 to double
  %44 = fmul contract double %42, %43
  %45 = fptrunc double %44 to float
  %46 = add nuw nsw i32 %30, 1
  %47 = add i32 %32, 1
  %48 = icmp eq i32 %47, %20
  br i1 %48, label %49, label %29, !llvm.loop !11

49:                                               ; preds = %24, %29, %16
  %50 = phi float [ 1.000000e+00, %16 ], [ %25, %24 ], [ %45, %29 ]
  %51 = zext i32 %14 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !7
  br label %171

53:                                               ; preds = %53, %22
  %54 = phi i32 [ 0, %22 ], [ %168, %53 ]
  %55 = phi float [ 1.000000e+00, %22 ], [ %167, %53 ]
  %56 = phi i32 [ 0, %22 ], [ %169, %53 ]
  %57 = add i32 %54, %19
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !5
  %61 = zext i32 %54 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !5
  %64 = fmul contract float %60, %63
  %65 = fpext float %64 to double
  %66 = fsub contract double 1.000000e+00, %65
  %67 = fpext float %55 to double
  %68 = fmul contract double %66, %67
  %69 = fptrunc double %68 to float
  %70 = or i32 %54, 1
  %71 = add i32 %70, %19
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = zext i32 %70 to i64
  %76 = getelementptr inbounds float, float addrspace(1)* %1, i64 %75
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fmul contract float %74, %77
  %79 = fpext float %78 to double
  %80 = fsub contract double 1.000000e+00, %79
  %81 = fpext float %69 to double
  %82 = fmul contract double %80, %81
  %83 = fptrunc double %82 to float
  %84 = or i32 %54, 2
  %85 = add i32 %84, %19
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = zext i32 %84 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %1, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = fmul contract float %88, %91
  %93 = fpext float %92 to double
  %94 = fsub contract double 1.000000e+00, %93
  %95 = fpext float %83 to double
  %96 = fmul contract double %94, %95
  %97 = fptrunc double %96 to float
  %98 = or i32 %54, 3
  %99 = add i32 %98, %19
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = zext i32 %98 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %1, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !7, !amdgpu.noclobber !5
  %106 = fmul contract float %102, %105
  %107 = fpext float %106 to double
  %108 = fsub contract double 1.000000e+00, %107
  %109 = fpext float %97 to double
  %110 = fmul contract double %108, %109
  %111 = fptrunc double %110 to float
  %112 = or i32 %54, 4
  %113 = add i32 %112, %19
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  %117 = zext i32 %112 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %1, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !7, !amdgpu.noclobber !5
  %120 = fmul contract float %116, %119
  %121 = fpext float %120 to double
  %122 = fsub contract double 1.000000e+00, %121
  %123 = fpext float %111 to double
  %124 = fmul contract double %122, %123
  %125 = fptrunc double %124 to float
  %126 = or i32 %54, 5
  %127 = add i32 %126, %19
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = zext i32 %126 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7, !amdgpu.noclobber !5
  %134 = fmul contract float %130, %133
  %135 = fpext float %134 to double
  %136 = fsub contract double 1.000000e+00, %135
  %137 = fpext float %125 to double
  %138 = fmul contract double %136, %137
  %139 = fptrunc double %138 to float
  %140 = or i32 %54, 6
  %141 = add i32 %140, %19
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7, !amdgpu.noclobber !5
  %145 = zext i32 %140 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %1, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = fmul contract float %144, %147
  %149 = fpext float %148 to double
  %150 = fsub contract double 1.000000e+00, %149
  %151 = fpext float %139 to double
  %152 = fmul contract double %150, %151
  %153 = fptrunc double %152 to float
  %154 = or i32 %54, 7
  %155 = add i32 %154, %19
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7, !amdgpu.noclobber !5
  %159 = zext i32 %154 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %1, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !7, !amdgpu.noclobber !5
  %162 = fmul contract float %158, %161
  %163 = fpext float %162 to double
  %164 = fsub contract double 1.000000e+00, %163
  %165 = fpext float %153 to double
  %166 = fmul contract double %164, %165
  %167 = fptrunc double %166 to float
  %168 = add nuw nsw i32 %54, 8
  %169 = add i32 %56, 8
  %170 = icmp eq i32 %169, %23
  br i1 %170, label %24, label %53, !llvm.loop !13

171:                                              ; preds = %49, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
