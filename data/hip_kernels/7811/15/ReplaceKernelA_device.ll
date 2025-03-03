; ModuleID = '../data/hip_kernels/7811/15/main.cu'
source_filename = "../data/hip_kernels/7811/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14ReplaceKernelAPKfPfiiffffffffffiiff(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, float %4, float %5, float %6, float %7, float %8, float %9, float %10, float %11, float %12, float %13, i32 %14, i32 %15, float %16, float %17) local_unnamed_addr #0 {
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 4, !range !4, !invariant.load !5
  %24 = zext i16 %23 to i32
  %25 = mul i32 %19, %24
  %26 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %27 = add i32 %25, %26
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %29 = getelementptr i8, i8 addrspace(4)* %20, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !4, !invariant.load !5
  %32 = zext i16 %31 to i32
  %33 = mul i32 %28, %32
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %35 = add i32 %33, %34
  %36 = icmp slt i32 %27, %2
  %37 = icmp slt i32 %35, %3
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %239

39:                                               ; preds = %18
  %40 = mul nsw i32 %35, %2
  %41 = add nsw i32 %40, %27
  %42 = shl nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = add nuw nsw i32 %42, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = add nuw nsw i32 %42, 2
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %0, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = tail call float @llvm.minnum.f32(float %45, float %49)
  %55 = tail call float @llvm.minnum.f32(float %54, float %53)
  %56 = tail call float @llvm.maxnum.f32(float %45, float %49)
  %57 = tail call float @llvm.maxnum.f32(float %56, float %53)
  %58 = fsub contract float %57, %55
  %59 = fcmp contract une float %57, 0.000000e+00
  %60 = fdiv contract float %58, %57
  %61 = select i1 %59, float %60, float 0.000000e+00
  %62 = fcmp contract oeq float %58, 0.000000e+00
  br i1 %62, label %78, label %63

63:                                               ; preds = %39
  %64 = fcmp contract oeq float %45, %57
  br i1 %64, label %65, label %68

65:                                               ; preds = %63
  %66 = fsub contract float %49, %53
  %67 = fdiv contract float %66, %58
  br label %78

68:                                               ; preds = %63
  %69 = fcmp contract oeq float %49, %57
  br i1 %69, label %70, label %74

70:                                               ; preds = %68
  %71 = fsub contract float %53, %45
  %72 = fdiv contract float %71, %58
  %73 = fadd contract float %72, 2.000000e+00
  br label %78

74:                                               ; preds = %68
  %75 = fsub contract float %45, %49
  %76 = fdiv contract float %75, %58
  %77 = fadd contract float %76, 4.000000e+00
  br label %78

78:                                               ; preds = %39, %65, %74, %70
  %79 = phi float [ %67, %65 ], [ %73, %70 ], [ %77, %74 ], [ 0.000000e+00, %39 ]
  %80 = fmul contract float %79, 0x3FC5555560000000
  %81 = fcmp contract olt float %80, 0.000000e+00
  %82 = fadd contract float %80, 1.000000e+00
  %83 = select i1 %81, float %82, float %80
  %84 = fmul contract float %83, 3.600000e+02
  %85 = fcmp contract olt float %5, %4
  br i1 %85, label %86, label %90

86:                                               ; preds = %78
  %87 = fcmp contract ugt float %84, %5
  %88 = fcmp contract ult float %84, %4
  %89 = select i1 %87, i1 %88, i1 false
  br i1 %89, label %90, label %161

90:                                               ; preds = %86, %78
  %91 = fcmp contract ult float %84, %4
  %92 = fcmp contract ugt float %84, %5
  %93 = select i1 %91, i1 true, i1 %92
  br i1 %93, label %94, label %161

94:                                               ; preds = %90
  %95 = fcmp contract olt float %4, %6
  br i1 %95, label %96, label %100

96:                                               ; preds = %94
  %97 = fcmp contract ugt float %84, %4
  %98 = fcmp contract ult float %84, %6
  %99 = select i1 %97, i1 %98, i1 false
  br i1 %99, label %100, label %104

100:                                              ; preds = %96, %94
  %101 = fcmp contract ult float %84, %6
  %102 = fcmp contract ugt float %84, %4
  %103 = select i1 %101, i1 true, i1 %102
  br i1 %103, label %127, label %104

104:                                              ; preds = %100, %96
  %105 = fadd contract float %6, 3.600000e+02
  %106 = fcmp contract oeq float %105, %4
  %107 = fcmp contract oeq float %4, %6
  %108 = or i1 %107, %106
  br i1 %108, label %127, label %109

109:                                              ; preds = %104
  br i1 %95, label %110, label %114

110:                                              ; preds = %109
  %111 = fcmp contract ugt float %84, %4
  %112 = fcmp contract ult float %84, %6
  %113 = select i1 %111, i1 %112, i1 false
  br i1 %113, label %114, label %118

114:                                              ; preds = %110, %109
  %115 = fcmp contract ult float %84, %6
  %116 = fcmp contract ugt float %84, %4
  %117 = select i1 %115, i1 true, i1 %116
  br i1 %117, label %127, label %118

118:                                              ; preds = %114, %110
  %119 = fcmp contract olt float %84, %6
  %120 = fadd contract float %84, 3.600000e+02
  %121 = select contract i1 %119, float %120, float %84
  %122 = fsub contract float %121, %6
  %123 = fadd contract float %4, 3.600000e+02
  %124 = select contract i1 %95, float %123, float %4
  %125 = fsub contract float %124, %6
  %126 = fdiv contract float %122, %125
  br label %127

127:                                              ; preds = %104, %114, %118, %100
  %128 = phi float [ 0.000000e+00, %100 ], [ 1.000000e+00, %104 ], [ %126, %118 ], [ 0.000000e+00, %114 ]
  %129 = fcmp contract olt float %7, %5
  br i1 %129, label %130, label %134

130:                                              ; preds = %127
  %131 = fcmp contract ugt float %84, %7
  %132 = fcmp contract ult float %84, %5
  %133 = select i1 %131, i1 %132, i1 false
  br i1 %133, label %134, label %138

134:                                              ; preds = %130, %127
  %135 = fcmp contract ult float %84, %5
  %136 = fcmp contract ugt float %84, %7
  %137 = select i1 %135, i1 true, i1 %136
  br i1 %137, label %158, label %138

138:                                              ; preds = %134, %130
  br i1 %129, label %139, label %143

139:                                              ; preds = %138
  %140 = fcmp contract ugt float %84, %7
  %141 = fcmp contract ult float %84, %5
  %142 = select i1 %140, i1 %141, i1 false
  br i1 %142, label %143, label %147

143:                                              ; preds = %139, %138
  %144 = fcmp contract ult float %84, %5
  %145 = fcmp contract ugt float %84, %7
  %146 = select i1 %144, i1 true, i1 %145
  br i1 %146, label %158, label %147

147:                                              ; preds = %143, %139
  %148 = fcmp contract oeq float %7, %5
  br i1 %148, label %158, label %149

149:                                              ; preds = %147
  %150 = fadd contract float %7, 3.600000e+02
  %151 = select contract i1 %129, float %150, float %7
  %152 = fcmp contract olt float %84, %5
  %153 = fadd contract float %84, 3.600000e+02
  %154 = select contract i1 %152, float %153, float %84
  %155 = fsub contract float %151, %154
  %156 = fsub contract float %151, %5
  %157 = fdiv contract float %155, %156
  br label %158

158:                                              ; preds = %143, %147, %149, %134
  %159 = phi float [ 0.000000e+00, %134 ], [ 0.000000e+00, %143 ], [ %157, %149 ], [ 1.000000e+00, %147 ]
  %160 = tail call float @llvm.maxnum.f32(float %128, float %159)
  br label %161

161:                                              ; preds = %86, %90, %158
  %162 = phi float [ %160, %158 ], [ 1.000000e+00, %90 ], [ 1.000000e+00, %86 ]
  %163 = fsub contract float %8, %10
  %164 = fadd contract float %9, %10
  %165 = fcmp contract ult float %61, %8
  %166 = fcmp contract ugt float %61, %9
  %167 = select i1 %165, i1 true, i1 %166
  br i1 %167, label %168, label %182

168:                                              ; preds = %161
  %169 = fcmp contract ugt float %163, %61
  %170 = fcmp contract ugt float %61, %8
  %171 = or i1 %169, %170
  br i1 %171, label %175, label %172

172:                                              ; preds = %168
  %173 = fsub contract float %61, %163
  %174 = fdiv contract float %173, %10
  br label %182

175:                                              ; preds = %168
  %176 = fcmp contract ult float %61, %9
  %177 = fcmp contract ugt float %61, %164
  %178 = select i1 %176, i1 true, i1 %177
  br i1 %178, label %182, label %179

179:                                              ; preds = %175
  %180 = fsub contract float %164, %61
  %181 = fdiv contract float %180, %10
  br label %182

182:                                              ; preds = %175, %161, %172, %179
  %183 = phi float [ %174, %172 ], [ %181, %179 ], [ 1.000000e+00, %161 ], [ 0.000000e+00, %175 ]
  %184 = fsub contract float %11, %13
  %185 = fadd contract float %12, %13
  %186 = fcmp contract ult float %57, %11
  %187 = fcmp contract ugt float %57, %12
  %188 = select i1 %186, i1 true, i1 %187
  br i1 %188, label %189, label %203

189:                                              ; preds = %182
  %190 = fcmp contract ugt float %184, %57
  %191 = fcmp contract ugt float %57, %11
  %192 = or i1 %190, %191
  br i1 %192, label %196, label %193

193:                                              ; preds = %189
  %194 = fsub contract float %57, %184
  %195 = fdiv contract float %194, %13
  br label %203

196:                                              ; preds = %189
  %197 = fcmp contract ult float %57, %12
  %198 = fcmp contract ugt float %57, %185
  %199 = select i1 %197, i1 true, i1 %198
  br i1 %199, label %203, label %200

200:                                              ; preds = %196
  %201 = fsub contract float %185, %57
  %202 = fdiv contract float %201, %13
  br label %203

203:                                              ; preds = %196, %182, %193, %200
  %204 = phi float [ %195, %193 ], [ %202, %200 ], [ 1.000000e+00, %182 ], [ 0.000000e+00, %196 ]
  %205 = tail call float @llvm.minnum.f32(float %162, float %183)
  %206 = tail call float @llvm.minnum.f32(float %205, float %204)
  switch i32 %14, label %215 [
    i32 0, label %216
    i32 1, label %207
    i32 2, label %208
    i32 3, label %209
    i32 4, label %210
    i32 5, label %211
    i32 6, label %213
  ]

207:                                              ; preds = %203
  br label %216

208:                                              ; preds = %203
  br label %216

209:                                              ; preds = %203
  br label %216

210:                                              ; preds = %203
  br label %216

211:                                              ; preds = %203
  %212 = tail call float @llvm.minnum.f32(float %162, float %204)
  br label %216

213:                                              ; preds = %203
  %214 = tail call float @llvm.minnum.f32(float %183, float %204)
  br label %216

215:                                              ; preds = %203
  br label %216

216:                                              ; preds = %203, %207, %209, %211, %215, %213, %210, %208
  %217 = phi contract float [ 1.000000e+00, %203 ], [ %162, %207 ], [ %183, %208 ], [ %204, %209 ], [ %205, %210 ], [ %212, %211 ], [ %214, %213 ], [ %206, %215 ]
  %218 = icmp eq i32 %15, 0
  %219 = select i1 %218, float %206, float %217
  %220 = fcmp contract ogt float %16, 0.000000e+00
  %221 = fmul contract float %16, 4.000000e+00
  %222 = fsub contract float 1.000000e+00, %219
  %223 = fmul contract float %221, %222
  %224 = fsub contract float %219, %223
  %225 = tail call float @llvm.maxnum.f32(float %224, float 0.000000e+00)
  %226 = select i1 %220, float %225, float %219
  %227 = fcmp contract ogt float %17, 0.000000e+00
  %228 = fmul contract float %17, 4.000000e+00
  %229 = fadd contract float %228, 1.000000e+00
  %230 = fmul contract float %229, %226
  %231 = tail call float @llvm.minnum.f32(float %230, float 1.000000e+00)
  %232 = select i1 %227, float %231, float %226
  %233 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  store float %84, float addrspace(1)* %233, align 4, !tbaa !7
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  store float %61, float addrspace(1)* %234, align 4, !tbaa !7
  %235 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %57, float addrspace(1)* %235, align 4, !tbaa !7
  %236 = add nuw nsw i32 %42, 3
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %1, i64 %237
  store float %232, float addrspace(1)* %238, align 4, !tbaa !7
  br label %239

239:                                              ; preds = %216, %18
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

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
