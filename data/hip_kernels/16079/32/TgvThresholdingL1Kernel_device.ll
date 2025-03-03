; ModuleID = '../data/hip_kernels/16079/32/main.cu'
source_filename = "../data/hip_kernels/16079/32/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23TgvThresholdingL1KernelP15HIP_vector_typeIfLj2EEPfS2_S2_ffS2_S2_S2_iii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float %4, float %5, float addrspace(1)* nocapture readonly %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %29 = add i32 %27, %28
  %30 = sitofp i32 %9 to float
  %31 = fmul contract float %30, 5.000000e-01
  %32 = sitofp i32 %10 to float
  %33 = fmul contract float %32, 5.000000e-01
  %34 = sitofp i32 %21 to float
  %35 = fsub contract float %34, %33
  %36 = fmul contract float %35, %35
  %37 = sitofp i32 %29 to float
  %38 = fsub contract float %37, %31
  %39 = fmul contract float %38, %38
  %40 = fadd contract float %36, %39
  %41 = fcmp olt float %40, 0x39F0000000000000
  %42 = select i1 %41, float 0x41F0000000000000, float 1.000000e+00
  %43 = fmul float %40, %42
  %44 = tail call float @llvm.sqrt.f32(float %43)
  %45 = bitcast float %44 to i32
  %46 = add nsw i32 %45, -1
  %47 = bitcast i32 %46 to float
  %48 = add nsw i32 %45, 1
  %49 = bitcast i32 %48 to float
  %50 = icmp slt i32 %21, %10
  %51 = icmp slt i32 %29, %9
  %52 = select i1 %50, i1 %51, i1 false
  br i1 %52, label %53, label %175

53:                                               ; preds = %12
  %54 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 608)
  %55 = select i1 %41, float 0x3EF0000000000000, float 1.000000e+00
  %56 = fneg float %49
  %57 = tail call float @llvm.fma.f32(float %56, float %44, float %43)
  %58 = fcmp ogt float %57, 0.000000e+00
  %59 = fneg float %47
  %60 = tail call float @llvm.fma.f32(float %59, float %44, float %43)
  %61 = fcmp ole float %60, 0.000000e+00
  %62 = select i1 %61, float %47, float %44
  %63 = select i1 %58, float %49, float %62
  %64 = fmul float %55, %63
  %65 = select i1 %54, float %43, float %64
  %66 = fdiv contract float %30, 0x40019999A0000000
  %67 = mul nsw i32 %21, %11
  %68 = add i32 %29, %67
  %69 = fcmp contract ult float %65, %66
  br i1 %69, label %72, label %70

70:                                               ; preds = %53
  %71 = sext i32 %68 to i64
  br label %171

72:                                               ; preds = %53
  %73 = add nsw i32 %68, -1
  %74 = add nsw i32 %21, -1
  %75 = mul nsw i32 %74, %11
  %76 = add nsw i32 %75, %29
  %77 = icmp sgt i32 %29, 0
  br i1 %77, label %78, label %86

78:                                               ; preds = %72
  %79 = sext i32 %68 to i64
  %80 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %79, i32 0, i32 0, i32 0, i64 0
  %81 = load float, float addrspace(1)* %80, align 8, !tbaa !7, !amdgpu.noclobber !5
  %82 = sext i32 %73 to i64
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %82, i32 0, i32 0, i32 0, i64 0
  %84 = load float, float addrspace(1)* %83, align 8, !tbaa !7, !amdgpu.noclobber !5
  %85 = fsub contract float %81, %84
  br label %98

86:                                               ; preds = %72
  %87 = add nsw i32 %9, -1
  %88 = icmp eq i32 %29, %87
  br i1 %88, label %89, label %94

89:                                               ; preds = %86
  %90 = sext i32 %73 to i64
  %91 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %90, i32 0, i32 0, i32 0, i64 0
  %92 = load float, float addrspace(1)* %91, align 8, !tbaa !7, !amdgpu.noclobber !5
  %93 = fneg contract float %92
  br label %98

94:                                               ; preds = %86
  %95 = sext i32 %68 to i64
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %95, i32 0, i32 0, i32 0, i64 0
  %97 = load float, float addrspace(1)* %96, align 8, !tbaa !7, !amdgpu.noclobber !5
  br label %98

98:                                               ; preds = %89, %94, %78
  %99 = phi float [ %85, %78 ], [ %93, %89 ], [ %97, %94 ]
  %100 = icmp sgt i32 %21, 0
  br i1 %100, label %101, label %109

101:                                              ; preds = %98
  %102 = sext i32 %68 to i64
  %103 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %102, i32 0, i32 0, i32 0, i64 1
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = sext i32 %76 to i64
  %106 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %105, i32 0, i32 0, i32 0, i64 1
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fsub contract float %104, %107
  br label %122

109:                                              ; preds = %98
  %110 = add nsw i32 %10, -1
  %111 = icmp eq i32 %21, %110
  br i1 %111, label %112, label %118

112:                                              ; preds = %109
  %113 = sext i32 %76 to i64
  %114 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %113, i32 0, i32 0, i32 0, i64 1
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = fneg contract float %115
  %117 = sext i32 %68 to i64
  br label %122

118:                                              ; preds = %109
  %119 = sext i32 %68 to i64
  %120 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %119, i32 0, i32 0, i32 0, i64 1
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %122

122:                                              ; preds = %112, %118, %101
  %123 = phi i64 [ %117, %112 ], [ %119, %118 ], [ %102, %101 ]
  %124 = phi float [ %116, %112 ], [ %121, %118 ], [ %108, %101 ]
  %125 = fadd contract float %99, %124
  %126 = getelementptr inbounds float, float addrspace(1)* %6, i64 %123
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !10, !amdgpu.noclobber !5
  %128 = fcmp contract oeq float %127, 0.000000e+00
  %129 = select i1 %128, float 1.000000e+00, float %127
  %130 = fdiv contract float %5, %129
  %131 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !10, !amdgpu.noclobber !5
  %133 = fmul contract float %125, %130
  %134 = fadd contract float %132, %133
  %135 = getelementptr inbounds float, float addrspace(1)* %7, i64 %123
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !10, !amdgpu.noclobber !5
  %137 = fsub contract float %134, %136
  %138 = getelementptr inbounds float, float addrspace(1)* %2, i64 %123
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !10, !amdgpu.noclobber !5
  %140 = fmul contract float %139, %137
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %123
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !10, !amdgpu.noclobber !5
  %143 = fadd contract float %142, %140
  %144 = fmul contract float %130, %4
  %145 = fmul contract float %139, %139
  %146 = fmul contract float %144, %145
  %147 = fneg contract float %4
  %148 = fmul contract float %130, %147
  %149 = fmul contract float %148, %145
  %150 = fcmp contract ugt float %143, %146
  %151 = fcmp contract ult float %143, %149
  %152 = select i1 %150, i1 true, i1 %151
  br i1 %152, label %158, label %153

153:                                              ; preds = %122
  %154 = fcmp contract oeq float %139, 0.000000e+00
  br i1 %154, label %168, label %155

155:                                              ; preds = %153
  %156 = fdiv contract float %143, %139
  %157 = fsub contract float %137, %156
  br label %168

158:                                              ; preds = %122
  %159 = fcmp contract olt float %143, %149
  br i1 %159, label %160, label %163

160:                                              ; preds = %158
  %161 = fmul contract float %139, %144
  %162 = fadd contract float %161, %137
  br label %168

163:                                              ; preds = %158
  %164 = fcmp contract ogt float %143, %146
  %165 = fmul contract float %139, %144
  %166 = fsub contract float %137, %165
  %167 = select i1 %164, float %166, float undef
  br label %168

168:                                              ; preds = %163, %153, %160, %155
  %169 = phi float [ %157, %155 ], [ %162, %160 ], [ %137, %153 ], [ %167, %163 ]
  %170 = fadd contract float %136, %169
  br label %171

171:                                              ; preds = %168, %70
  %172 = phi i64 [ %71, %70 ], [ %123, %168 ]
  %173 = phi float [ 0.000000e+00, %70 ], [ %170, %168 ]
  %174 = getelementptr inbounds float, float addrspace(1)* %8, i64 %172
  store float %173, float addrspace(1)* %174, align 4, !tbaa !10
  br label %175

175:                                              ; preds = %171, %12
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !8, i64 0}
