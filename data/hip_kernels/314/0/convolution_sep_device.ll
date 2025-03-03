; ModuleID = '../data/hip_kernels/314/0/main.cu'
source_filename = "../data/hip_kernels/314/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.dim3 = type { i32, i32, i32 }

@s_image = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15convolution_sepPfPKfS1_i4dim3i(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, %struct.dim3 addrspace(4)* nocapture readonly byref(%struct.dim3) align 4 %4, i32 %5) local_unnamed_addr #0 {
  %7 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %4, i64 0, i32 0
  %8 = load i32, i32 addrspace(4)* %7, align 4, !amdgpu.noclobber !4
  %9 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %4, i64 0, i32 1
  %10 = load i32, i32 addrspace(4)* %9, align 4, !amdgpu.noclobber !4
  %11 = getelementptr inbounds %struct.dim3, %struct.dim3 addrspace(4)* %4, i64 0, i32 2
  %12 = load i32, i32 addrspace(4)* %11, align 4, !amdgpu.noclobber !4
  switch i32 %5, label %13 [
    i32 0, label %17
    i32 1, label %39
    i32 2, label %61
  ]

13:                                               ; preds = %6
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !5
  br label %83

17:                                               ; preds = %6
  %18 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !6, !invariant.load !4
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5
  %26 = add i32 %24, %25
  %27 = zext i32 %26 to i64
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %29 = getelementptr i8, i8 addrspace(4)* %18, i64 6
  %30 = bitcast i8 addrspace(4)* %29 to i16 addrspace(4)*
  %31 = load i16, i16 addrspace(4)* %30, align 2, !range !6, !invariant.load !4
  %32 = zext i16 %31 to i32
  %33 = mul i32 %28, %32
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !5
  %35 = add i32 %33, %34
  %36 = zext i32 %35 to i64
  %37 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %38 = zext i32 %37 to i64
  br label %83

39:                                               ; preds = %6
  %40 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %41 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %42 = getelementptr i8, i8 addrspace(4)* %40, i64 4
  %43 = bitcast i8 addrspace(4)* %42 to i16 addrspace(4)*
  %44 = load i16, i16 addrspace(4)* %43, align 4, !range !6, !invariant.load !4
  %45 = zext i16 %44 to i32
  %46 = mul i32 %41, %45
  %47 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5
  %48 = add i32 %46, %47
  %49 = zext i32 %48 to i64
  %50 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %51 = getelementptr i8, i8 addrspace(4)* %40, i64 6
  %52 = bitcast i8 addrspace(4)* %51 to i16 addrspace(4)*
  %53 = load i16, i16 addrspace(4)* %52, align 2, !range !6, !invariant.load !4
  %54 = zext i16 %53 to i32
  %55 = mul i32 %50, %54
  %56 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !5
  %57 = add i32 %55, %56
  %58 = zext i32 %57 to i64
  %59 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %60 = zext i32 %59 to i64
  br label %83

61:                                               ; preds = %6
  %62 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %63 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %64 = getelementptr i8, i8 addrspace(4)* %62, i64 4
  %65 = bitcast i8 addrspace(4)* %64 to i16 addrspace(4)*
  %66 = load i16, i16 addrspace(4)* %65, align 4, !range !6, !invariant.load !4
  %67 = zext i16 %66 to i32
  %68 = mul i32 %63, %67
  %69 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5
  %70 = add i32 %68, %69
  %71 = zext i32 %70 to i64
  %72 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %73 = getelementptr i8, i8 addrspace(4)* %62, i64 6
  %74 = bitcast i8 addrspace(4)* %73 to i16 addrspace(4)*
  %75 = load i16, i16 addrspace(4)* %74, align 2, !range !6, !invariant.load !4
  %76 = zext i16 %75 to i32
  %77 = mul i32 %72, %76
  %78 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !5
  %79 = add i32 %77, %78
  %80 = zext i32 %79 to i64
  %81 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %82 = zext i32 %81 to i64
  br label %83

83:                                               ; preds = %13, %39, %61, %17
  %84 = phi i32 [ %16, %13 ], [ %56, %39 ], [ %78, %61 ], [ %34, %17 ]
  %85 = phi i32 [ %15, %13 ], [ %47, %39 ], [ %69, %61 ], [ %25, %17 ]
  %86 = phi i8 addrspace(4)* [ %14, %13 ], [ %40, %39 ], [ %62, %61 ], [ %18, %17 ]
  %87 = phi i64 [ undef, %13 ], [ %60, %39 ], [ %71, %61 ], [ %38, %17 ]
  %88 = phi i64 [ undef, %13 ], [ %49, %39 ], [ %82, %61 ], [ %36, %17 ]
  %89 = phi i64 [ undef, %13 ], [ %58, %39 ], [ %80, %61 ], [ %27, %17 ]
  %90 = zext i32 %8 to i64
  %91 = icmp ult i64 %89, %90
  %92 = zext i32 %10 to i64
  %93 = icmp ult i64 %88, %92
  %94 = select i1 %91, i1 %93, i1 false
  %95 = zext i32 %12 to i64
  %96 = icmp ult i64 %87, %95
  %97 = select i1 %94, i1 %96, i1 false
  %98 = mul nuw i64 %87, %92
  %99 = add nuw i64 %98, %88
  %100 = mul i64 %99, %90
  %101 = add i64 %100, %89
  %102 = sdiv i32 %3, 2
  %103 = sext i32 %102 to i64
  %104 = getelementptr i8, i8 addrspace(4)* %86, i64 4
  %105 = bitcast i8 addrspace(4)* %104 to i16 addrspace(4)*
  %106 = load i16, i16 addrspace(4)* %105, align 4, !range !6, !invariant.load !4
  %107 = zext i16 %106 to i64
  %108 = shl nsw i64 %103, 1
  %109 = add nsw i64 %108, %107
  %110 = zext i32 %85 to i64
  %111 = add nsw i64 %103, %110
  %112 = zext i32 %84 to i64
  %113 = icmp ult i32 %85, %102
  br i1 %113, label %114, label %119

114:                                              ; preds = %83
  %115 = trunc i64 %109 to i32
  %116 = mul i32 %84, %115
  %117 = add i32 %116, %85
  %118 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %117
  store float 0.000000e+00, float addrspace(3)* %118, align 4, !tbaa !7
  br label %119

119:                                              ; preds = %114, %83
  %120 = sub nsw i64 %107, %103
  %121 = icmp ugt i64 %120, %110
  br i1 %121, label %128, label %122

122:                                              ; preds = %119
  %123 = add nsw i64 %111, %103
  %124 = mul nsw i64 %109, %112
  %125 = add nsw i64 %123, %124
  %126 = trunc i64 %125 to i32
  %127 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %126
  store float 0.000000e+00, float addrspace(3)* %127, align 4, !tbaa !7
  br label %128

128:                                              ; preds = %122, %119
  br i1 %97, label %129, label %132

129:                                              ; preds = %128
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !4
  br label %132

132:                                              ; preds = %128, %129
  %133 = phi contract float [ %131, %129 ], [ 0.000000e+00, %128 ]
  %134 = mul nsw i64 %109, %112
  %135 = add nsw i64 %134, %111
  %136 = trunc i64 %135 to i32
  %137 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %136
  store float %133, float addrspace(3)* %137, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %138 = icmp sgt i32 %3, 0
  br i1 %138, label %139, label %169

139:                                              ; preds = %132
  %140 = add nsw i64 %111, %103
  %141 = add nsw i64 %140, %134
  %142 = and i32 %3, 7
  %143 = icmp ult i32 %3, 8
  br i1 %143, label %147, label %144

144:                                              ; preds = %139
  %145 = and i32 %3, -8
  %146 = trunc i64 %141 to i32
  br label %171

147:                                              ; preds = %171, %139
  %148 = phi float [ undef, %139 ], [ %245, %171 ]
  %149 = phi i32 [ 0, %139 ], [ %246, %171 ]
  %150 = phi float [ 0.000000e+00, %139 ], [ %245, %171 ]
  %151 = icmp eq i32 %142, 0
  br i1 %151, label %169, label %152

152:                                              ; preds = %147
  %153 = trunc i64 %141 to i32
  br label %154

154:                                              ; preds = %154, %152
  %155 = phi i32 [ %149, %152 ], [ %166, %154 ]
  %156 = phi float [ %150, %152 ], [ %165, %154 ]
  %157 = phi i32 [ 0, %152 ], [ %167, %154 ]
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds float, float addrspace(1)* %2, i64 %158
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !7, !amdgpu.noclobber !4
  %161 = sub i32 %153, %155
  %162 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %161
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !7
  %164 = fmul contract float %160, %163
  %165 = fadd contract float %156, %164
  %166 = add nuw nsw i32 %155, 1
  %167 = add nuw nsw i32 %157, 1
  %168 = icmp eq i32 %167, %142
  br i1 %168, label %169, label %154, !llvm.loop !11

169:                                              ; preds = %154, %147, %132
  %170 = phi float [ 0.000000e+00, %132 ], [ %148, %147 ], [ %165, %154 ]
  br i1 %97, label %249, label %251

171:                                              ; preds = %171, %144
  %172 = phi i32 [ 0, %144 ], [ %246, %171 ]
  %173 = phi float [ 0.000000e+00, %144 ], [ %245, %171 ]
  %174 = phi i32 [ 0, %144 ], [ %247, %171 ]
  %175 = zext i32 %172 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7, !amdgpu.noclobber !4
  %178 = sub i32 %146, %172
  %179 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %178
  %180 = load float, float addrspace(3)* %179, align 4, !tbaa !7
  %181 = fmul contract float %177, %180
  %182 = fadd contract float %173, %181
  %183 = or i32 %172, 1
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %2, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7, !amdgpu.noclobber !4
  %187 = sub i32 %146, %183
  %188 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %187
  %189 = load float, float addrspace(3)* %188, align 4, !tbaa !7
  %190 = fmul contract float %186, %189
  %191 = fadd contract float %182, %190
  %192 = or i32 %172, 2
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %2, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !7, !amdgpu.noclobber !4
  %196 = sub i32 %146, %192
  %197 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 4, !tbaa !7
  %199 = fmul contract float %195, %198
  %200 = fadd contract float %191, %199
  %201 = or i32 %172, 3
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds float, float addrspace(1)* %2, i64 %202
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !7, !amdgpu.noclobber !4
  %205 = sub i32 %146, %201
  %206 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %205
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !7
  %208 = fmul contract float %204, %207
  %209 = fadd contract float %200, %208
  %210 = or i32 %172, 4
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %2, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7, !amdgpu.noclobber !4
  %214 = sub i32 %146, %210
  %215 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %214
  %216 = load float, float addrspace(3)* %215, align 4, !tbaa !7
  %217 = fmul contract float %213, %216
  %218 = fadd contract float %209, %217
  %219 = or i32 %172, 5
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds float, float addrspace(1)* %2, i64 %220
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7, !amdgpu.noclobber !4
  %223 = sub i32 %146, %219
  %224 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %223
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !7
  %226 = fmul contract float %222, %225
  %227 = fadd contract float %218, %226
  %228 = or i32 %172, 6
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %2, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7, !amdgpu.noclobber !4
  %232 = sub i32 %146, %228
  %233 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %232
  %234 = load float, float addrspace(3)* %233, align 4, !tbaa !7
  %235 = fmul contract float %231, %234
  %236 = fadd contract float %227, %235
  %237 = or i32 %172, 7
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, float addrspace(1)* %2, i64 %238
  %240 = load float, float addrspace(1)* %239, align 4, !tbaa !7, !amdgpu.noclobber !4
  %241 = sub i32 %146, %237
  %242 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_image, i32 0, i32 %241
  %243 = load float, float addrspace(3)* %242, align 4, !tbaa !7
  %244 = fmul contract float %240, %243
  %245 = fadd contract float %236, %244
  %246 = add nuw nsw i32 %172, 8
  %247 = add i32 %174, 8
  %248 = icmp eq i32 %247, %145
  br i1 %248, label %147, label %171, !llvm.loop !13

249:                                              ; preds = %169
  %250 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  store float %170, float addrspace(1)* %250, align 4, !tbaa !7
  br label %251

251:                                              ; preds = %249, %169
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!4 = !{}
!5 = !{i32 0, i32 1024}
!6 = !{i16 1, i16 1025}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14, !12}
!14 = !{!"llvm.loop.mustprogress"}
