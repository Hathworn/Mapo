; ModuleID = '../data/hip_kernels/8192/29/main.cu'
source_filename = "../data/hip_kernels/8192/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_INPUT_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@D_HIDDEN_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@D_OUTPUT_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [3 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_HIDDEN_UNITS to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_INPUT_UNITS to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_OUTPUT_UNITS to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24ChangeInputWeightsKernelPfS_S_S_S_ff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = load i32, i32 addrspace(4)* @D_HIDDEN_UNITS, align 4, !tbaa !16
  %29 = load i32, i32 addrspace(4)* @D_INPUT_UNITS, align 4, !tbaa !16
  %30 = mul i32 %29, %28
  %31 = icmp slt i32 %27, %30
  br i1 %31, label %32, label %190

32:                                               ; preds = %7
  %33 = load i32, i32 addrspace(4)* @D_OUTPUT_UNITS, align 4, !tbaa !16
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %46

35:                                               ; preds = %32
  %36 = icmp sgt i32 %28, 0
  %37 = and i32 %28, 7
  %38 = icmp ult i32 %28, 8
  %39 = and i32 %28, -8
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %35, %79
  %42 = phi float [ 0.000000e+00, %35 ], [ %85, %79 ]
  %43 = phi i32 [ 0, %35 ], [ %86, %79 ]
  br i1 %36, label %44, label %79

44:                                               ; preds = %41
  %45 = mul nsw i32 %43, %28
  br i1 %38, label %57, label %88

46:                                               ; preds = %79, %32
  %47 = phi float [ 0.000000e+00, %32 ], [ %85, %79 ]
  %48 = fmul contract float %47, %5
  %49 = sext i32 %27 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !20, !amdgpu.noclobber !5
  %52 = fmul contract float %51, %6
  %53 = fadd contract float %48, %52
  store float %53, float addrspace(1)* %50, align 4, !tbaa !20
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !20
  %56 = fadd contract float %55, %53
  store float %56, float addrspace(1)* %54, align 4, !tbaa !20
  br label %190

57:                                               ; preds = %88, %44
  %58 = phi float [ undef, %44 ], [ %186, %88 ]
  %59 = phi i32 [ 0, %44 ], [ %187, %88 ]
  %60 = phi float [ 0.000000e+00, %44 ], [ %186, %88 ]
  br i1 %40, label %79, label %61

61:                                               ; preds = %57, %61
  %62 = phi i32 [ %76, %61 ], [ %59, %57 ]
  %63 = phi float [ %75, %61 ], [ %60, %57 ]
  %64 = phi i32 [ %77, %61 ], [ 0, %57 ]
  %65 = add nsw i32 %62, %45
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %2, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !20, !amdgpu.noclobber !5
  %69 = mul i32 %30, %62
  %70 = add nsw i32 %69, %27
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %4, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !20, !amdgpu.noclobber !5
  %74 = fmul contract float %68, %73
  %75 = fadd contract float %63, %74
  %76 = add nuw nsw i32 %62, 1
  %77 = add i32 %64, 1
  %78 = icmp eq i32 %77, %37
  br i1 %78, label %79, label %61, !llvm.loop !22

79:                                               ; preds = %57, %61, %41
  %80 = phi float [ 0.000000e+00, %41 ], [ %58, %57 ], [ %75, %61 ]
  %81 = zext i32 %43 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !20, !amdgpu.noclobber !5
  %84 = fmul contract float %80, %83
  %85 = fadd contract float %42, %84
  %86 = add nuw nsw i32 %43, 1
  %87 = icmp eq i32 %86, %33
  br i1 %87, label %46, label %41, !llvm.loop !24

88:                                               ; preds = %44, %88
  %89 = phi i32 [ %187, %88 ], [ 0, %44 ]
  %90 = phi float [ %186, %88 ], [ 0.000000e+00, %44 ]
  %91 = phi i32 [ %188, %88 ], [ 0, %44 ]
  %92 = add nsw i32 %89, %45
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !20, !amdgpu.noclobber !5
  %96 = mul i32 %30, %89
  %97 = add nsw i32 %96, %27
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %4, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !20, !amdgpu.noclobber !5
  %101 = fmul contract float %95, %100
  %102 = fadd contract float %90, %101
  %103 = or i32 %89, 1
  %104 = add nsw i32 %103, %45
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !20, !amdgpu.noclobber !5
  %108 = mul i32 %30, %103
  %109 = add nsw i32 %108, %27
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %4, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !20, !amdgpu.noclobber !5
  %113 = fmul contract float %107, %112
  %114 = fadd contract float %102, %113
  %115 = or i32 %89, 2
  %116 = add nsw i32 %115, %45
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !20, !amdgpu.noclobber !5
  %120 = mul i32 %30, %115
  %121 = add nsw i32 %120, %27
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds float, float addrspace(1)* %4, i64 %122
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !20, !amdgpu.noclobber !5
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %114, %125
  %127 = or i32 %89, 3
  %128 = add nsw i32 %127, %45
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %2, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !20, !amdgpu.noclobber !5
  %132 = mul i32 %30, %127
  %133 = add nsw i32 %132, %27
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %4, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !20, !amdgpu.noclobber !5
  %137 = fmul contract float %131, %136
  %138 = fadd contract float %126, %137
  %139 = or i32 %89, 4
  %140 = add nsw i32 %139, %45
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %2, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !20, !amdgpu.noclobber !5
  %144 = mul i32 %30, %139
  %145 = add nsw i32 %144, %27
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %4, i64 %146
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !20, !amdgpu.noclobber !5
  %149 = fmul contract float %143, %148
  %150 = fadd contract float %138, %149
  %151 = or i32 %89, 5
  %152 = add nsw i32 %151, %45
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds float, float addrspace(1)* %2, i64 %153
  %155 = load float, float addrspace(1)* %154, align 4, !tbaa !20, !amdgpu.noclobber !5
  %156 = mul i32 %30, %151
  %157 = add nsw i32 %156, %27
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %4, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !20, !amdgpu.noclobber !5
  %161 = fmul contract float %155, %160
  %162 = fadd contract float %150, %161
  %163 = or i32 %89, 6
  %164 = add nsw i32 %163, %45
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !20, !amdgpu.noclobber !5
  %168 = mul i32 %30, %163
  %169 = add nsw i32 %168, %27
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %4, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !20, !amdgpu.noclobber !5
  %173 = fmul contract float %167, %172
  %174 = fadd contract float %162, %173
  %175 = or i32 %89, 7
  %176 = add nsw i32 %175, %45
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %2, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !20, !amdgpu.noclobber !5
  %180 = mul i32 %30, %175
  %181 = add nsw i32 %180, %27
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %4, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !20, !amdgpu.noclobber !5
  %185 = fmul contract float %179, %184
  %186 = fadd contract float %174, %185
  %187 = add nuw nsw i32 %89, 8
  %188 = add i32 %91, 8
  %189 = icmp eq i32 %188, %39
  br i1 %189, label %57, label %88, !llvm.loop !26

190:                                              ; preds = %46, %7
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
!26 = distinct !{!26, !25}
