; ModuleID = '../data/hip_kernels/8192/62/main.cu'
source_filename = "../data/hip_kernels/8192/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_HIDDEN_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_HIDDEN_UNITS to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z37RecurrentWeightsRTRLDerivativesKernelPfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = load i32, i32 addrspace(4)* @D_HIDDEN_UNITS, align 4, !tbaa !16
  %27 = mul nsw i32 %26, %26
  %28 = mul nsw i32 %27, %26
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %187

30:                                               ; preds = %5
  %31 = freeze i32 %25
  %32 = freeze i32 %27
  %33 = sdiv i32 %31, %32
  %34 = mul i32 %33, %32
  %35 = sub i32 %31, %34
  %36 = freeze i32 %26
  %37 = sdiv i32 %35, %36
  %38 = mul i32 %37, %36
  %39 = sub i32 %35, %38
  %40 = icmp sgt i32 %26, 0
  br i1 %40, label %41, label %70

41:                                               ; preds = %30
  %42 = mul nsw i32 %33, %26
  %43 = and i32 %26, 7
  %44 = icmp ult i32 %26, 8
  br i1 %44, label %47, label %45

45:                                               ; preds = %41
  %46 = and i32 %26, -8
  br label %85

47:                                               ; preds = %85, %41
  %48 = phi float [ undef, %41 ], [ %183, %85 ]
  %49 = phi i32 [ 0, %41 ], [ %184, %85 ]
  %50 = phi float [ 0.000000e+00, %41 ], [ %183, %85 ]
  %51 = icmp eq i32 %43, 0
  br i1 %51, label %70, label %52

52:                                               ; preds = %47, %52
  %53 = phi i32 [ %67, %52 ], [ %49, %47 ]
  %54 = phi float [ %66, %52 ], [ %50, %47 ]
  %55 = phi i32 [ %68, %52 ], [ 0, %47 ]
  %56 = add nsw i32 %53, %42
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !20, !amdgpu.noclobber !5
  %60 = mul nsw i32 %53, %27
  %61 = add nsw i32 %60, %35
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !20, !amdgpu.noclobber !5
  %65 = fmul contract float %59, %64
  %66 = fadd contract float %54, %65
  %67 = add nuw nsw i32 %53, 1
  %68 = add i32 %55, 1
  %69 = icmp eq i32 %68, %43
  br i1 %69, label %70, label %52, !llvm.loop !22

70:                                               ; preds = %47, %52, %30
  %71 = phi float [ 0.000000e+00, %30 ], [ %48, %47 ], [ %66, %52 ]
  %72 = sext i32 %33 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !20, !amdgpu.noclobber !5
  %75 = icmp eq i32 %33, %37
  %76 = uitofp i1 %75 to float
  %77 = sext i32 %39 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !20, !amdgpu.noclobber !5
  %80 = fmul contract float %79, %76
  %81 = fadd contract float %71, %80
  %82 = fmul contract float %74, %81
  %83 = sext i32 %25 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %3, i64 %83
  store float %82, float addrspace(1)* %84, align 4, !tbaa !20
  br label %187

85:                                               ; preds = %85, %45
  %86 = phi i32 [ 0, %45 ], [ %184, %85 ]
  %87 = phi float [ 0.000000e+00, %45 ], [ %183, %85 ]
  %88 = phi i32 [ 0, %45 ], [ %185, %85 ]
  %89 = add nsw i32 %86, %42
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %2, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !20, !amdgpu.noclobber !5
  %93 = mul nsw i32 %86, %27
  %94 = add nsw i32 %93, %35
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %4, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !20, !amdgpu.noclobber !5
  %98 = fmul contract float %92, %97
  %99 = fadd contract float %87, %98
  %100 = or i32 %86, 1
  %101 = add nsw i32 %100, %42
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %2, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !20, !amdgpu.noclobber !5
  %105 = mul nsw i32 %100, %27
  %106 = add nsw i32 %105, %35
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %4, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !20, !amdgpu.noclobber !5
  %110 = fmul contract float %104, %109
  %111 = fadd contract float %99, %110
  %112 = or i32 %86, 2
  %113 = add nsw i32 %112, %42
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %2, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !20, !amdgpu.noclobber !5
  %117 = mul nsw i32 %112, %27
  %118 = add nsw i32 %117, %35
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %4, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !20, !amdgpu.noclobber !5
  %122 = fmul contract float %116, %121
  %123 = fadd contract float %111, %122
  %124 = or i32 %86, 3
  %125 = add nsw i32 %124, %42
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %2, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !20, !amdgpu.noclobber !5
  %129 = mul nsw i32 %124, %27
  %130 = add nsw i32 %129, %35
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %4, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !20, !amdgpu.noclobber !5
  %134 = fmul contract float %128, %133
  %135 = fadd contract float %123, %134
  %136 = or i32 %86, 4
  %137 = add nsw i32 %136, %42
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %2, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !20, !amdgpu.noclobber !5
  %141 = mul nsw i32 %136, %27
  %142 = add nsw i32 %141, %35
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %4, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !20, !amdgpu.noclobber !5
  %146 = fmul contract float %140, %145
  %147 = fadd contract float %135, %146
  %148 = or i32 %86, 5
  %149 = add nsw i32 %148, %42
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %2, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !20, !amdgpu.noclobber !5
  %153 = mul nsw i32 %148, %27
  %154 = add nsw i32 %153, %35
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %4, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !20, !amdgpu.noclobber !5
  %158 = fmul contract float %152, %157
  %159 = fadd contract float %147, %158
  %160 = or i32 %86, 6
  %161 = add nsw i32 %160, %42
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %2, i64 %162
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !20, !amdgpu.noclobber !5
  %165 = mul nsw i32 %160, %27
  %166 = add nsw i32 %165, %35
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %4, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !20, !amdgpu.noclobber !5
  %170 = fmul contract float %164, %169
  %171 = fadd contract float %159, %170
  %172 = or i32 %86, 7
  %173 = add nsw i32 %172, %42
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %2, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !20, !amdgpu.noclobber !5
  %177 = mul nsw i32 %172, %27
  %178 = add nsw i32 %177, %35
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %4, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !20, !amdgpu.noclobber !5
  %182 = fmul contract float %176, %181
  %183 = fadd contract float %171, %182
  %184 = add nuw nsw i32 %86, 8
  %185 = add i32 %88, 8
  %186 = icmp eq i32 %185, %46
  br i1 %186, label %47, label %85, !llvm.loop !24

187:                                              ; preds = %70, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
