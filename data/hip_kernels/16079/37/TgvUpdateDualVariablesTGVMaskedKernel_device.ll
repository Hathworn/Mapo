; ModuleID = '../data/hip_kernels/16079/37/main.cu'
source_filename = "../data/hip_kernels/16079/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <4 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z37TgvUpdateDualVariablesTGVMaskedKernelPfS_P15HIP_vector_typeIfLj2EEfffffS_S_S_PS0_IfLj4EES2_S4_iii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* nocapture readonly %2, float %3, float %4, float %5, float %6, float %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture readonly %9, float addrspace(1)* nocapture readonly %10, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %11, %struct.HIP_vector_type addrspace(1)* nocapture %12, %struct.HIP_vector_type.0 addrspace(1)* nocapture %13, i32 %14, i32 %15, i32 %16) local_unnamed_addr #0 {
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %20 = getelementptr i8, i8 addrspace(4)* %19, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %18, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %28 = getelementptr i8, i8 addrspace(4)* %19, i64 4
  %29 = bitcast i8 addrspace(4)* %28 to i16 addrspace(4)*
  %30 = load i16, i16 addrspace(4)* %29, align 4, !range !4, !invariant.load !5
  %31 = zext i16 %30 to i32
  %32 = mul i32 %27, %31
  %33 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %34 = add i32 %32, %33
  %35 = icmp slt i32 %26, %15
  %36 = icmp slt i32 %34, %14
  %37 = select i1 %35, i1 true, i1 %36
  br i1 %37, label %38, label %257

38:                                               ; preds = %17
  %39 = mul nsw i32 %26, %16
  %40 = add i32 %34, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fcmp contract oeq float %43, 0.000000e+00
  br i1 %44, label %257, label %45

45:                                               ; preds = %38
  %46 = add nsw i32 %34, 1
  %47 = add nsw i32 %46, %39
  %48 = add nsw i32 %26, 1
  %49 = mul nsw i32 %48, %16
  %50 = add nsw i32 %49, %34
  %51 = add nsw i32 %40, -1
  %52 = add nsw i32 %26, -1
  %53 = mul nsw i32 %52, %16
  %54 = add nsw i32 %53, %34
  %55 = icmp slt i32 %46, %14
  br i1 %55, label %56, label %60

56:                                               ; preds = %45
  %57 = sext i32 %47 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %60

60:                                               ; preds = %45, %56
  %61 = phi float [ %59, %56 ], [ 0.000000e+00, %45 ]
  %62 = icmp slt i32 %48, %15
  br i1 %62, label %63, label %67

63:                                               ; preds = %60
  %64 = sext i32 %50 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %67

67:                                               ; preds = %60, %63
  %68 = phi float [ %66, %63 ], [ 0.000000e+00, %60 ]
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %70 = load float, float addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %41, i32 0, i32 0, i32 0, i64 0
  %72 = load float, float addrspace(1)* %71, align 8, !amdgpu.noclobber !5
  %73 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %41, i32 0, i32 0, i32 0, i64 1
  %74 = load float, float addrspace(1)* %73, align 4, !amdgpu.noclobber !5
  %75 = fcmp contract une float %61, 0.000000e+00
  br i1 %75, label %76, label %80

76:                                               ; preds = %67
  %77 = sext i32 %47 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %84

80:                                               ; preds = %67
  %81 = sext i32 %51 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %84

84:                                               ; preds = %80, %76
  %85 = phi float [ %83, %80 ], [ %70, %76 ]
  %86 = phi float [ %70, %80 ], [ %79, %76 ]
  %87 = fsub contract float %86, %85
  %88 = fsub contract float %87, %72
  %89 = fcmp contract une float %68, 0.000000e+00
  br i1 %89, label %90, label %94

90:                                               ; preds = %84
  %91 = sext i32 %50 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %1, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %98

94:                                               ; preds = %84
  %95 = sext i32 %54 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %98

98:                                               ; preds = %94, %90
  %99 = phi float [ %97, %94 ], [ %70, %90 ]
  %100 = phi float [ %70, %94 ], [ %93, %90 ]
  %101 = fsub contract float %100, %99
  %102 = fsub contract float %101, %74
  %103 = getelementptr inbounds float, float addrspace(1)* %8, i64 %41
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !7, !amdgpu.noclobber !5
  %105 = fmul contract float %88, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %10, i64 %41
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fmul contract float %102, %107
  %109 = fadd contract float %105, %108
  %110 = fmul contract float %88, %107
  %111 = getelementptr inbounds float, float addrspace(1)* %9, i64 %41
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = fmul contract float %102, %112
  %114 = fadd contract float %110, %113
  %115 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %12, i64 %41, i32 0, i32 0, i32 0, i64 0
  %116 = load float, float addrspace(1)* %115, align 8, !tbaa !11, !amdgpu.noclobber !5
  %117 = fmul contract float %4, %5
  %118 = fdiv contract float %117, %6
  %119 = fmul contract float %118, %109
  %120 = fadd contract float %116, %119
  %121 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %12, i64 %41, i32 0, i32 0, i32 0, i64 1
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !11, !amdgpu.noclobber !5
  %123 = fmul contract float %118, %114
  %124 = fadd contract float %122, %123
  %125 = fmul contract float %120, %120
  %126 = fmul contract float %124, %124
  %127 = fadd contract float %125, %126
  %128 = fcmp olt float %127, 0x39F0000000000000
  %129 = select i1 %128, float 0x41F0000000000000, float 1.000000e+00
  %130 = fmul float %127, %129
  %131 = tail call float @llvm.sqrt.f32(float %130)
  %132 = bitcast float %131 to i32
  %133 = add nsw i32 %132, -1
  %134 = bitcast i32 %133 to float
  %135 = add nsw i32 %132, 1
  %136 = bitcast i32 %135 to float
  %137 = tail call i1 @llvm.amdgcn.class.f32(float %130, i32 608)
  %138 = select i1 %128, float 0x3EF0000000000000, float 1.000000e+00
  %139 = fneg float %136
  %140 = tail call float @llvm.fma.f32(float %139, float %131, float %130)
  %141 = fcmp ogt float %140, 0.000000e+00
  %142 = fneg float %134
  %143 = tail call float @llvm.fma.f32(float %142, float %131, float %130)
  %144 = fcmp ole float %143, 0.000000e+00
  %145 = select i1 %144, float %134, float %131
  %146 = select i1 %141, float %136, float %145
  %147 = fmul float %138, %146
  %148 = select i1 %137, float %130, float %147
  %149 = fcmp contract olt float %148, 1.000000e+00
  %150 = select i1 %149, float 1.000000e+00, float %148
  %151 = fdiv contract float %120, %150
  store float %151, float addrspace(1)* %115, align 8, !tbaa !11
  %152 = fdiv contract float %124, %150
  store float %152, float addrspace(1)* %121, align 4, !tbaa !11
  br i1 %75, label %153, label %157

153:                                              ; preds = %98
  %154 = sext i32 %47 to i64
  %155 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %154, i32 0, i32 0, i32 0, i64 0
  %156 = load float, float addrspace(1)* %155, align 8, !tbaa !11
  br label %161

157:                                              ; preds = %98
  %158 = sext i32 %51 to i64
  %159 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %158, i32 0, i32 0, i32 0, i64 0
  %160 = load float, float addrspace(1)* %159, align 8, !tbaa !11
  br label %161

161:                                              ; preds = %157, %153
  %162 = phi float [ %160, %157 ], [ %72, %153 ]
  %163 = phi float [ %72, %157 ], [ %156, %153 ]
  %164 = fsub contract float %163, %162
  br i1 %89, label %165, label %169

165:                                              ; preds = %161
  %166 = sext i32 %50 to i64
  %167 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %166, i32 0, i32 0, i32 0, i64 1
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !11
  br label %173

169:                                              ; preds = %161
  %170 = sext i32 %54 to i64
  %171 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %170, i32 0, i32 0, i32 0, i64 1
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !11
  br label %173

173:                                              ; preds = %169, %165
  %174 = phi float [ %172, %169 ], [ %74, %165 ]
  %175 = phi float [ %74, %169 ], [ %168, %165 ]
  %176 = fsub contract float %175, %174
  br i1 %89, label %177, label %181

177:                                              ; preds = %173
  %178 = sext i32 %50 to i64
  %179 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %178, i32 0, i32 0, i32 0, i64 0
  %180 = load float, float addrspace(1)* %179, align 8, !tbaa !11
  br label %185

181:                                              ; preds = %173
  %182 = sext i32 %54 to i64
  %183 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %182, i32 0, i32 0, i32 0, i64 0
  %184 = load float, float addrspace(1)* %183, align 8, !tbaa !11
  br label %185

185:                                              ; preds = %181, %177
  %186 = phi float [ %184, %181 ], [ %72, %177 ]
  %187 = phi float [ %72, %181 ], [ %180, %177 ]
  %188 = fsub contract float %187, %186
  br i1 %75, label %189, label %193

189:                                              ; preds = %185
  %190 = sext i32 %47 to i64
  %191 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %190, i32 0, i32 0, i32 0, i64 1
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !11
  br label %197

193:                                              ; preds = %185
  %194 = sext i32 %51 to i64
  %195 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %194, i32 0, i32 0, i32 0, i64 1
  %196 = load float, float addrspace(1)* %195, align 4, !tbaa !11
  br label %197

197:                                              ; preds = %193, %189
  %198 = phi float [ %196, %193 ], [ %74, %189 ]
  %199 = phi float [ %74, %193 ], [ %192, %189 ]
  %200 = fsub contract float %199, %198
  %201 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %11, i64 %41, i32 0, i32 0, i32 0, i64 0
  store float %164, float addrspace(1)* %201, align 16
  %202 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %11, i64 %41, i32 0, i32 0, i32 0, i64 1
  store float %176, float addrspace(1)* %202, align 4
  %203 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %11, i64 %41, i32 0, i32 0, i32 0, i64 2
  store float %188, float addrspace(1)* %203, align 8
  %204 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %11, i64 %41, i32 0, i32 0, i32 0, i64 3
  store float %200, float addrspace(1)* %204, align 4
  %205 = fmul contract float %3, %5
  %206 = fdiv contract float %205, %7
  %207 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %13, i64 %41, i32 0, i32 0, i32 0, i64 0
  %208 = load float, float addrspace(1)* %207, align 16, !tbaa !11
  %209 = fmul contract float %206, %164
  %210 = fadd contract float %209, %208
  %211 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %13, i64 %41, i32 0, i32 0, i32 0, i64 1
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !11
  %213 = fmul contract float %206, %176
  %214 = fadd contract float %213, %212
  %215 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %13, i64 %41, i32 0, i32 0, i32 0, i64 2
  %216 = load float, float addrspace(1)* %215, align 8, !tbaa !11
  %217 = fmul contract float %206, %188
  %218 = fadd contract float %217, %216
  %219 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %13, i64 %41, i32 0, i32 0, i32 0, i64 3
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !11
  %221 = fmul contract float %206, %200
  %222 = fadd contract float %221, %220
  %223 = fmul contract float %210, %210
  %224 = fmul contract float %214, %214
  %225 = fadd contract float %223, %224
  %226 = fmul contract float %218, %218
  %227 = fadd contract float %225, %226
  %228 = fmul contract float %222, %222
  %229 = fadd contract float %227, %228
  %230 = fcmp olt float %229, 0x39F0000000000000
  %231 = select i1 %230, float 0x41F0000000000000, float 1.000000e+00
  %232 = fmul float %229, %231
  %233 = tail call float @llvm.sqrt.f32(float %232)
  %234 = bitcast float %233 to i32
  %235 = add nsw i32 %234, -1
  %236 = bitcast i32 %235 to float
  %237 = add nsw i32 %234, 1
  %238 = bitcast i32 %237 to float
  %239 = tail call i1 @llvm.amdgcn.class.f32(float %232, i32 608)
  %240 = select i1 %230, float 0x3EF0000000000000, float 1.000000e+00
  %241 = fneg float %238
  %242 = tail call float @llvm.fma.f32(float %241, float %233, float %232)
  %243 = fcmp ogt float %242, 0.000000e+00
  %244 = fneg float %236
  %245 = tail call float @llvm.fma.f32(float %244, float %233, float %232)
  %246 = fcmp ole float %245, 0.000000e+00
  %247 = select i1 %246, float %236, float %233
  %248 = select i1 %243, float %238, float %247
  %249 = fmul float %240, %248
  %250 = select i1 %239, float %232, float %249
  %251 = fcmp contract olt float %250, 1.000000e+00
  %252 = select i1 %251, float 1.000000e+00, float %250
  %253 = fdiv contract float %210, %252
  store float %253, float addrspace(1)* %207, align 16, !tbaa !11
  %254 = fdiv contract float %214, %252
  store float %254, float addrspace(1)* %211, align 4, !tbaa !11
  %255 = fdiv contract float %218, %252
  store float %255, float addrspace(1)* %215, align 8, !tbaa !11
  %256 = fdiv contract float %222, %252
  store float %256, float addrspace(1)* %219, align 4, !tbaa !11
  br label %257

257:                                              ; preds = %197, %38, %17
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
