; ModuleID = '../data/hip_kernels/16079/34/main.cu'
source_filename = "../data/hip_kernels/16079/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z29TgvThresholdingL1MaskedKernelP15HIP_vector_typeIfLj2EEPfS2_S2_S2_ffS2_S2_S2_iii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, float %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture writeonly %9, i32 %10, i32 %11, i32 %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %14, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %30 = add i32 %28, %29
  %31 = icmp slt i32 %22, %11
  %32 = icmp slt i32 %30, %10
  %33 = select i1 %31, i1 true, i1 %32
  br i1 %33, label %34, label %170

34:                                               ; preds = %13
  %35 = mul nsw i32 %22, %12
  %36 = add i32 %30, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fcmp contract oeq float %39, 0.000000e+00
  br i1 %40, label %170, label %41

41:                                               ; preds = %34
  %42 = add nsw i32 %30, 1
  %43 = add nsw i32 %22, 1
  %44 = mul nsw i32 %43, %12
  %45 = add nsw i32 %44, %30
  %46 = add nsw i32 %36, -1
  %47 = add nsw i32 %22, -1
  %48 = mul nsw i32 %47, %12
  %49 = add nsw i32 %48, %30
  %50 = icmp slt i32 %42, %10
  br i1 %50, label %51, label %56

51:                                               ; preds = %41
  %52 = add nsw i32 %42, %35
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %4, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %56

56:                                               ; preds = %41, %51
  %57 = phi float [ %55, %51 ], [ 0.000000e+00, %41 ]
  %58 = icmp slt i32 %30, 1
  br i1 %58, label %63, label %59

59:                                               ; preds = %56
  %60 = sext i32 %46 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %4, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %63

63:                                               ; preds = %56, %59
  %64 = phi float [ %62, %59 ], [ 0.000000e+00, %56 ]
  %65 = icmp slt i32 %43, %11
  br i1 %65, label %66, label %70

66:                                               ; preds = %63
  %67 = sext i32 %45 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %4, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %70

70:                                               ; preds = %63, %66
  %71 = phi float [ %69, %66 ], [ 0.000000e+00, %63 ]
  %72 = icmp slt i32 %22, 1
  br i1 %72, label %77, label %73

73:                                               ; preds = %70
  %74 = sext i32 %49 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %4, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %77

77:                                               ; preds = %70, %73
  %78 = phi float [ %76, %73 ], [ 0.000000e+00, %70 ]
  %79 = fcmp contract une float %64, 0.000000e+00
  %80 = fcmp contract une float %57, 0.000000e+00
  %81 = select i1 %79, i1 %80, i1 false
  br i1 %81, label %82, label %89

82:                                               ; preds = %77
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %37, i32 0, i32 0, i32 0, i64 0
  %84 = load float, float addrspace(1)* %83, align 8, !tbaa !11, !amdgpu.noclobber !5
  %85 = sext i32 %46 to i64
  %86 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %85, i32 0, i32 0, i32 0, i64 0
  %87 = load float, float addrspace(1)* %86, align 8, !tbaa !11, !amdgpu.noclobber !5
  %88 = fsub contract float %84, %87
  br label %99

89:                                               ; preds = %77
  %90 = fcmp contract oeq float %57, 0.000000e+00
  br i1 %90, label %91, label %96

91:                                               ; preds = %89
  %92 = sext i32 %46 to i64
  %93 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %92, i32 0, i32 0, i32 0, i64 0
  %94 = load float, float addrspace(1)* %93, align 8, !tbaa !11, !amdgpu.noclobber !5
  %95 = fneg contract float %94
  br label %99

96:                                               ; preds = %89
  %97 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %37, i32 0, i32 0, i32 0, i64 0
  %98 = load float, float addrspace(1)* %97, align 8, !tbaa !11, !amdgpu.noclobber !5
  br label %99

99:                                               ; preds = %91, %96, %82
  %100 = phi float [ %88, %82 ], [ %95, %91 ], [ %98, %96 ]
  %101 = fcmp contract une float %78, 0.000000e+00
  %102 = fcmp contract une float %71, 0.000000e+00
  %103 = select i1 %101, i1 %102, i1 false
  br i1 %103, label %104, label %111

104:                                              ; preds = %99
  %105 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %37, i32 0, i32 0, i32 0, i64 1
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !11, !amdgpu.noclobber !5
  %107 = sext i32 %49 to i64
  %108 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %107, i32 0, i32 0, i32 0, i64 1
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11, !amdgpu.noclobber !5
  %110 = fsub contract float %106, %109
  br label %121

111:                                              ; preds = %99
  %112 = fcmp contract oeq float %71, 0.000000e+00
  br i1 %112, label %113, label %118

113:                                              ; preds = %111
  %114 = sext i32 %49 to i64
  %115 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %114, i32 0, i32 0, i32 0, i64 1
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !11, !amdgpu.noclobber !5
  %117 = fneg contract float %116
  br label %121

118:                                              ; preds = %111
  %119 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %37, i32 0, i32 0, i32 0, i64 1
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !11, !amdgpu.noclobber !5
  br label %121

121:                                              ; preds = %113, %118, %104
  %122 = phi float [ %110, %104 ], [ %117, %113 ], [ %120, %118 ]
  %123 = fadd contract float %100, %122
  %124 = getelementptr inbounds float, float addrspace(1)* %7, i64 %37
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !5
  %126 = fcmp contract oeq float %125, 0.000000e+00
  %127 = select i1 %126, float 1.000000e+00, float %125
  %128 = fdiv contract float %6, %127
  %129 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = fmul contract float %123, %128
  %132 = fadd contract float %130, %131
  %133 = getelementptr inbounds float, float addrspace(1)* %8, i64 %37
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7, !amdgpu.noclobber !5
  %135 = fsub contract float %132, %134
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fmul contract float %137, %135
  %139 = getelementptr inbounds float, float addrspace(1)* %3, i64 %37
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7, !amdgpu.noclobber !5
  %141 = fadd contract float %140, %138
  %142 = fmul contract float %128, %5
  %143 = fmul contract float %137, %137
  %144 = fmul contract float %142, %143
  %145 = fneg contract float %5
  %146 = fmul contract float %128, %145
  %147 = fmul contract float %146, %143
  %148 = fcmp contract ugt float %141, %144
  %149 = fcmp contract ult float %141, %147
  %150 = select i1 %148, i1 true, i1 %149
  br i1 %150, label %156, label %151

151:                                              ; preds = %121
  %152 = fcmp contract oeq float %137, 0.000000e+00
  br i1 %152, label %166, label %153

153:                                              ; preds = %151
  %154 = fdiv contract float %141, %137
  %155 = fsub contract float %135, %154
  br label %166

156:                                              ; preds = %121
  %157 = fcmp contract olt float %141, %147
  br i1 %157, label %158, label %161

158:                                              ; preds = %156
  %159 = fmul contract float %137, %142
  %160 = fadd contract float %159, %135
  br label %166

161:                                              ; preds = %156
  %162 = fcmp contract ogt float %141, %144
  %163 = fmul contract float %137, %142
  %164 = fsub contract float %135, %163
  %165 = select i1 %162, float %164, float undef
  br label %166

166:                                              ; preds = %161, %151, %158, %153
  %167 = phi float [ %155, %153 ], [ %160, %158 ], [ %135, %151 ], [ %165, %161 ]
  %168 = fadd contract float %134, %167
  %169 = getelementptr inbounds float, float addrspace(1)* %9, i64 %37
  store float %168, float addrspace(1)* %169, align 4, !tbaa !7
  br label %170

170:                                              ; preds = %166, %34, %13
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = !{!9, !9, i64 0}
