; ModuleID = '../data/hip_kernels/6630/4/main.cu'
source_filename = "../data/hip_kernels/6630/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Rs = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29matrixEuclideanDistanceKernelPfS_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %2, 0
  br i1 %14, label %15, label %36

15:                                               ; preds = %4
  %16 = sdiv i32 %3, 256
  %17 = icmp slt i32 %3, -255
  %18 = icmp slt i32 %13, %2
  %19 = icmp sgt i32 %3, 0
  %20 = select i1 %19, i1 %18, i1 false
  %21 = mul nsw i32 %13, %3
  %22 = mul nsw i32 %13, %2
  %23 = add nsw i32 %16, 1
  %24 = and i32 %23, 7
  %25 = icmp ult i32 %16, 7
  %26 = and i32 %23, -8
  %27 = icmp eq i32 %24, 0
  %28 = and i32 %3, 7
  %29 = icmp ult i32 %3, 8
  %30 = and i32 %3, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %15, %262
  %33 = phi i32 [ 0, %15 ], [ %263, %262 ]
  br i1 %17, label %55, label %34

34:                                               ; preds = %32
  %35 = mul nsw i32 %33, %3
  br i1 %25, label %37, label %57

36:                                               ; preds = %262, %4
  ret void

37:                                               ; preds = %146, %34
  %38 = phi i32 [ 0, %34 ], [ %147, %146 ]
  br i1 %27, label %55, label %39

39:                                               ; preds = %37, %51
  %40 = phi i32 [ %52, %51 ], [ %38, %37 ]
  %41 = phi i32 [ %53, %51 ], [ 0, %37 ]
  %42 = shl nsw i32 %40, 8
  %43 = add nuw i32 %42, %12
  %44 = icmp ult i32 %43, %3
  br i1 %44, label %45, label %51

45:                                               ; preds = %39
  %46 = add i32 %43, %35
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %0, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7
  %50 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %43
  store float %49, float addrspace(3)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %45, %39
  %52 = add nuw nsw i32 %40, 1
  %53 = add i32 %41, 1
  %54 = icmp eq i32 %53, %24
  br i1 %54, label %55, label %39, !llvm.loop !11

55:                                               ; preds = %37, %51, %32
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %20, label %56, label %170

56:                                               ; preds = %55
  br i1 %29, label %150, label %172

57:                                               ; preds = %34, %146
  %58 = phi i32 [ %147, %146 ], [ 0, %34 ]
  %59 = phi i32 [ %148, %146 ], [ 0, %34 ]
  %60 = shl nsw i32 %58, 8
  %61 = or i32 %60, %12
  %62 = icmp ult i32 %61, %3
  br i1 %62, label %63, label %69

63:                                               ; preds = %57
  %64 = add i32 %61, %35
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %61
  store float %67, float addrspace(3)* %68, align 4, !tbaa !7
  br label %69

69:                                               ; preds = %57, %63
  %70 = shl i32 %58, 8
  %71 = or i32 %70, 256
  %72 = add nuw nsw i32 %71, %12
  %73 = icmp ult i32 %72, %3
  br i1 %73, label %74, label %80

74:                                               ; preds = %69
  %75 = add i32 %72, %35
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %72
  store float %78, float addrspace(3)* %79, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %74, %69
  %81 = shl i32 %58, 8
  %82 = or i32 %81, 512
  %83 = add nuw nsw i32 %82, %12
  %84 = icmp ult i32 %83, %3
  br i1 %84, label %85, label %91

85:                                               ; preds = %80
  %86 = add i32 %83, %35
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %0, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !7
  %90 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %83
  store float %89, float addrspace(3)* %90, align 4, !tbaa !7
  br label %91

91:                                               ; preds = %85, %80
  %92 = shl i32 %58, 8
  %93 = or i32 %92, 768
  %94 = add nuw nsw i32 %93, %12
  %95 = icmp ult i32 %94, %3
  br i1 %95, label %96, label %102

96:                                               ; preds = %91
  %97 = add i32 %94, %35
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds float, float addrspace(1)* %0, i64 %98
  %100 = load float, float addrspace(1)* %99, align 4, !tbaa !7
  %101 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %94
  store float %100, float addrspace(3)* %101, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %96, %91
  %103 = shl i32 %58, 8
  %104 = or i32 %103, %12
  %105 = or i32 %104, 1024
  %106 = icmp ult i32 %105, %3
  br i1 %106, label %107, label %113

107:                                              ; preds = %102
  %108 = add i32 %105, %35
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7
  %112 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %105
  store float %111, float addrspace(3)* %112, align 4, !tbaa !7
  br label %113

113:                                              ; preds = %107, %102
  %114 = shl i32 %58, 8
  %115 = or i32 %114, 1280
  %116 = add nuw i32 %115, %12
  %117 = icmp ult i32 %116, %3
  br i1 %117, label %118, label %124

118:                                              ; preds = %113
  %119 = add i32 %116, %35
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %116
  store float %122, float addrspace(3)* %123, align 4, !tbaa !7
  br label %124

124:                                              ; preds = %118, %113
  %125 = shl i32 %58, 8
  %126 = or i32 %125, 1536
  %127 = add nuw i32 %126, %12
  %128 = icmp ult i32 %127, %3
  br i1 %128, label %129, label %135

129:                                              ; preds = %124
  %130 = add i32 %127, %35
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %0, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7
  %134 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %127
  store float %133, float addrspace(3)* %134, align 4, !tbaa !7
  br label %135

135:                                              ; preds = %129, %124
  %136 = shl i32 %58, 8
  %137 = or i32 %136, 1792
  %138 = add nuw i32 %137, %12
  %139 = icmp ult i32 %138, %3
  br i1 %139, label %140, label %146

140:                                              ; preds = %135
  %141 = add i32 %138, %35
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %138
  store float %144, float addrspace(3)* %145, align 4, !tbaa !7
  br label %146

146:                                              ; preds = %140, %135
  %147 = add nuw nsw i32 %58, 8
  %148 = add i32 %59, 8
  %149 = icmp eq i32 %148, %26
  br i1 %149, label %37, label %57, !llvm.loop !13

150:                                              ; preds = %172, %56
  %151 = phi float [ undef, %56 ], [ %254, %172 ]
  %152 = phi i32 [ 0, %56 ], [ %255, %172 ]
  %153 = phi float [ 0.000000e+00, %56 ], [ %254, %172 ]
  br i1 %31, label %170, label %154

154:                                              ; preds = %150, %154
  %155 = phi i32 [ %167, %154 ], [ %152, %150 ]
  %156 = phi float [ %166, %154 ], [ %153, %150 ]
  %157 = phi i32 [ %168, %154 ], [ 0, %150 ]
  %158 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %155
  %159 = load float, float addrspace(3)* %158, align 4, !tbaa !7
  %160 = add nsw i32 %155, %21
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = fsub contract float %159, %163
  %165 = fmul contract float %164, %164
  %166 = fadd contract float %156, %165
  %167 = add nuw nsw i32 %155, 1
  %168 = add i32 %157, 1
  %169 = icmp eq i32 %168, %28
  br i1 %169, label %170, label %154, !llvm.loop !15

170:                                              ; preds = %150, %154, %55
  %171 = phi float [ 0.000000e+00, %55 ], [ %151, %150 ], [ %166, %154 ]
  br i1 %18, label %258, label %262

172:                                              ; preds = %56, %172
  %173 = phi i32 [ %255, %172 ], [ 0, %56 ]
  %174 = phi float [ %254, %172 ], [ 0.000000e+00, %56 ]
  %175 = phi i32 [ %256, %172 ], [ 0, %56 ]
  %176 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %173
  %177 = load float, float addrspace(3)* %176, align 4, !tbaa !7
  %178 = add nsw i32 %173, %21
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = fsub contract float %177, %181
  %183 = fmul contract float %182, %182
  %184 = fadd contract float %174, %183
  %185 = or i32 %173, 1
  %186 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %185
  %187 = load float, float addrspace(3)* %186, align 4, !tbaa !7
  %188 = add nsw i32 %185, %21
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = fsub contract float %187, %191
  %193 = fmul contract float %192, %192
  %194 = fadd contract float %184, %193
  %195 = or i32 %173, 2
  %196 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %195
  %197 = load float, float addrspace(3)* %196, align 4, !tbaa !7
  %198 = add nsw i32 %195, %21
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7
  %202 = fsub contract float %197, %201
  %203 = fmul contract float %202, %202
  %204 = fadd contract float %194, %203
  %205 = or i32 %173, 3
  %206 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %205
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !7
  %208 = add nsw i32 %205, %21
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !7
  %212 = fsub contract float %207, %211
  %213 = fmul contract float %212, %212
  %214 = fadd contract float %204, %213
  %215 = or i32 %173, 4
  %216 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %215
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !7
  %218 = add nsw i32 %215, %21
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %0, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7
  %222 = fsub contract float %217, %221
  %223 = fmul contract float %222, %222
  %224 = fadd contract float %214, %223
  %225 = or i32 %173, 5
  %226 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %225
  %227 = load float, float addrspace(3)* %226, align 4, !tbaa !7
  %228 = add nsw i32 %225, %21
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %0, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7
  %232 = fsub contract float %227, %231
  %233 = fmul contract float %232, %232
  %234 = fadd contract float %224, %233
  %235 = or i32 %173, 6
  %236 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %235
  %237 = load float, float addrspace(3)* %236, align 4, !tbaa !7
  %238 = add nsw i32 %235, %21
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %239
  %241 = load float, float addrspace(1)* %240, align 4, !tbaa !7
  %242 = fsub contract float %237, %241
  %243 = fmul contract float %242, %242
  %244 = fadd contract float %234, %243
  %245 = or i32 %173, 7
  %246 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @Rs, i32 0, i32 %245
  %247 = load float, float addrspace(3)* %246, align 4, !tbaa !7
  %248 = add nsw i32 %245, %21
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %0, i64 %249
  %251 = load float, float addrspace(1)* %250, align 4, !tbaa !7
  %252 = fsub contract float %247, %251
  %253 = fmul contract float %252, %252
  %254 = fadd contract float %244, %253
  %255 = add nuw nsw i32 %173, 8
  %256 = add i32 %175, 8
  %257 = icmp eq i32 %256, %30
  br i1 %257, label %150, label %172, !llvm.loop !16

258:                                              ; preds = %170
  %259 = add nsw i32 %33, %22
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %1, i64 %260
  store float %171, float addrspace(1)* %261, align 4, !tbaa !7
  br label %262

262:                                              ; preds = %258, %170
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %263 = add nuw nsw i32 %33, 1
  %264 = icmp eq i32 %263, %2
  br i1 %264, label %36, label %32, !llvm.loop !17
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !14}
