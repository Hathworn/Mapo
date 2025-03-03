; ModuleID = '../data/hip_kernels/10483/16/main.cu'
source_filename = "../data/hip_kernels/10483/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { [16 x %1], [16 x %1], [16 x %1], [16 x %2], [16 x %2], [16 x [256 x %3]], i64, i64, [14 x i64], i64 }
%1 = type { i32, [15 x i64] }
%2 = type { i64, [15 x i64] }
%3 = type { i64, i64, i32 }
%4 = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%5 = type { i32, i32, i32, i32, [524284 x i32] }
%6 = type { %7 addrspace(1)*, %8 addrspace(1)*, %9, i64, i64, i64 }
%7 = type { i64, i64, i32, i32 }
%8 = type { [64 x [8 x i64]] }
%9 = type { i64 }
%10 = type { i64, %9, i64, i32, i32, i64, i64, %11, [2 x i32] }
%11 = type { %12 addrspace(1)* }
%12 = type { %13, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %9, [14 x i32] }
%13 = type { i32, i32, i8 addrspace(1)*, %9, i32, i32, i64 }

@0 = internal addrspace(1) global %0 zeroinitializer, align 8
@1 = internal unnamed_addr addrspace(4) constant [16 x %4] [%4 { i32 130054, i32 129546, i32 110114, i32 16288, i32 6, i32 256, i32 0, i32 4195 }, %4 { i32 86927, i32 86758, i32 73744, i32 10904, i32 399, i32 512, i32 0, i32 2804 }, %4 { i32 65280, i32 64770, i32 55054, i32 8192, i32 0, i32 128, i32 0, i32 2107 }, %4 { i32 43576, i32 43406, i32 36895, i32 5504, i32 56, i32 256, i32 0, i32 1405 }, %4 { i32 32703, i32 32193, i32 27364, i32 4160, i32 63, i32 64, i32 0, i32 1054 }, %4 { i32 21816, i32 21646, i32 18399, i32 2816, i32 56, i32 128, i32 0, i32 703 }, %4 { i32 16367, i32 15856, i32 13477, i32 2176, i32 15, i32 32, i32 32768, i32 527 }, %4 { i32 10915, i32 10745, i32 9133, i32 1472, i32 35, i32 64, i32 0, i32 352 }, %4 { i32 8187, i32 7676, i32 6524, i32 1280, i32 11, i32 16, i32 134219776, i32 265 }, %4 { i32 5459, i32 5289, i32 4495, i32 896, i32 19, i32 32, i32 524288, i32 176 }, %4 { i32 4094, i32 3583, i32 3045, i32 1024, i32 6, i32 8, i32 1077952576, i32 133 }, %4 { i32 2730, i32 2560, i32 2176, i32 512, i32 10, i32 16, i32 67109888, i32 89 }, %4 { i32 2047, i32 1536, i32 1305, i32 1024, i32 3, i32 4, i32 -2004318072, i32 66 }, %4 { i32 1365, i32 1195, i32 1015, i32 512, i32 5, i32 8, i32 538976288, i32 44 }, %4 { i32 1023, i32 512, i32 435, i32 2048, i32 1, i32 2, i32 -1431655766, i32 34 }, %4 { i32 682, i32 512, i32 435, i32 2048, i32 2, i32 4, i32 1145324612, i32 35 }], align 4

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17forwardPathKerneliiiiiifPfS_S_PiS0_iS_S_S_S_S0_S_S_S_S_S_S_S_S_S_(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, float %6, float addrspace(1)* nocapture readonly %7, float addrspace(1)* nocapture %8, float addrspace(1)* nocapture readonly %9, i32 addrspace(1)* nocapture readonly %10, i32 addrspace(1)* nocapture readonly %11, i32 %12, float addrspace(1)* nocapture readonly %13, float addrspace(1)* nocapture readonly %14, float addrspace(1)* nocapture writeonly %15, float addrspace(1)* nocapture readonly %16, i32 addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture readonly %18, float addrspace(1)* nocapture readonly %19, float addrspace(1)* nocapture readonly %20, float addrspace(1)* nocapture readonly %21, float addrspace(1)* nocapture readonly %22, float addrspace(1)* nocapture readonly %23, float addrspace(1)* nocapture %24, float addrspace(1)* nocapture %25, float addrspace(1)* nocapture %26) local_unnamed_addr #1 {
  %28 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %29 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 4
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !4, !invariant.load !5
  %33 = zext i16 %32 to i32
  %34 = mul i32 %28, %33
  %35 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %36 = add i32 %34, %35
  %37 = icmp slt i32 %36, %0
  br i1 %37, label %38, label %1108

38:                                               ; preds = %27
  %39 = icmp sgt i32 %2, 0
  br i1 %39, label %40, label %54

40:                                               ; preds = %38
  %41 = icmp sgt i32 %3, 0
  %42 = add nsw i32 %1, 1
  %43 = mul i32 %36, %2
  %44 = mul i32 %43, %42
  %45 = and i32 %3, 7
  %46 = icmp ult i32 %3, 8
  %47 = and i32 %3, -8
  %48 = icmp eq i32 %45, 0
  br label %49

49:                                               ; preds = %40, %82
  %50 = phi i32 [ 0, %40 ], [ %86, %82 ]
  %51 = add i32 %50, %44
  br i1 %41, label %52, label %82

52:                                               ; preds = %49
  %53 = mul i32 %51, %3
  br i1 %46, label %64, label %88

54:                                               ; preds = %82, %38
  %55 = icmp sgt i32 %5, 0
  br i1 %55, label %56, label %174

56:                                               ; preds = %54
  %57 = mul nsw i32 %36, %5
  %58 = add nsw i32 %1, 1
  %59 = mul nsw i32 %57, %58
  %60 = and i32 %5, 7
  %61 = icmp ult i32 %5, 8
  br i1 %61, label %158, label %62

62:                                               ; preds = %56
  %63 = and i32 %5, -8
  br label %185

64:                                               ; preds = %88, %52
  %65 = phi float [ undef, %52 ], [ %154, %88 ]
  %66 = phi float [ 0.000000e+00, %52 ], [ %154, %88 ]
  %67 = phi i32 [ 0, %52 ], [ %155, %88 ]
  br i1 %48, label %82, label %68

68:                                               ; preds = %64, %68
  %69 = phi float [ %78, %68 ], [ %66, %64 ]
  %70 = phi i32 [ %79, %68 ], [ %67, %64 ]
  %71 = phi i32 [ %80, %68 ], [ 0, %64 ]
  %72 = zext i32 %70 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %7, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = add nsw i32 %70, %53
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %8, i64 %76
  store float %74, float addrspace(1)* %77, align 4, !tbaa !7
  %78 = fadd contract float %69, %74
  %79 = add nuw nsw i32 %70, 1
  %80 = add i32 %71, 1
  %81 = icmp eq i32 %80, %45
  br i1 %81, label %82, label %68, !llvm.loop !11

82:                                               ; preds = %64, %68, %49
  %83 = phi float [ 0.000000e+00, %49 ], [ %65, %64 ], [ %78, %68 ]
  %84 = sext i32 %51 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %26, i64 %84
  store float %83, float addrspace(1)* %85, align 4, !tbaa !7
  %86 = add nuw nsw i32 %50, 1
  %87 = icmp eq i32 %86, %2
  br i1 %87, label %54, label %49, !llvm.loop !13

88:                                               ; preds = %52, %88
  %89 = phi float [ %154, %88 ], [ 0.000000e+00, %52 ]
  %90 = phi i32 [ %155, %88 ], [ 0, %52 ]
  %91 = phi i32 [ %156, %88 ], [ 0, %52 ]
  %92 = zext i32 %90 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %7, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = add nsw i32 %90, %53
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %8, i64 %96
  store float %94, float addrspace(1)* %97, align 4, !tbaa !7
  %98 = fadd contract float %89, %94
  %99 = or i32 %90, 1
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %7, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = add nsw i32 %99, %53
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %8, i64 %104
  store float %102, float addrspace(1)* %105, align 4, !tbaa !7
  %106 = fadd contract float %98, %102
  %107 = or i32 %90, 2
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %7, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !7
  %111 = add nsw i32 %107, %53
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %8, i64 %112
  store float %110, float addrspace(1)* %113, align 4, !tbaa !7
  %114 = fadd contract float %106, %110
  %115 = or i32 %90, 3
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %7, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = add nsw i32 %115, %53
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %8, i64 %120
  store float %118, float addrspace(1)* %121, align 4, !tbaa !7
  %122 = fadd contract float %114, %118
  %123 = or i32 %90, 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %7, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !7
  %127 = add nsw i32 %123, %53
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %8, i64 %128
  store float %126, float addrspace(1)* %129, align 4, !tbaa !7
  %130 = fadd contract float %122, %126
  %131 = or i32 %90, 5
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %7, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !7
  %135 = add nsw i32 %131, %53
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %8, i64 %136
  store float %134, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = fadd contract float %130, %134
  %139 = or i32 %90, 6
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %7, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7
  %143 = add nsw i32 %139, %53
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %8, i64 %144
  store float %142, float addrspace(1)* %145, align 4, !tbaa !7
  %146 = fadd contract float %138, %142
  %147 = or i32 %90, 7
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %7, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = add nsw i32 %147, %53
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %8, i64 %152
  store float %150, float addrspace(1)* %153, align 4, !tbaa !7
  %154 = fadd contract float %146, %150
  %155 = add nuw nsw i32 %90, 8
  %156 = add i32 %91, 8
  %157 = icmp eq i32 %156, %47
  br i1 %157, label %64, label %88, !llvm.loop !15

158:                                              ; preds = %185, %56
  %159 = phi i32 [ 0, %56 ], [ %251, %185 ]
  %160 = icmp eq i32 %60, 0
  br i1 %160, label %174, label %161

161:                                              ; preds = %158, %161
  %162 = phi i32 [ %171, %161 ], [ %159, %158 ]
  %163 = phi i32 [ %172, %161 ], [ 0, %158 ]
  %164 = mul nuw nsw i32 %162, 6
  %165 = zext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %16, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7
  %168 = add nsw i32 %162, %59
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %25, i64 %169
  store float %167, float addrspace(1)* %170, align 4, !tbaa !7
  %171 = add nuw nsw i32 %162, 1
  %172 = add i32 %163, 1
  %173 = icmp eq i32 %172, %60
  br i1 %173, label %174, label %161, !llvm.loop !16

174:                                              ; preds = %158, %161, %54
  %175 = sext i32 %2 to i64
  %176 = shl nsw i64 %175, 2
  %177 = tail call fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 %176) #12
  %178 = ptrtoint i8 addrspace(1)* %177 to i64
  %179 = bitcast i8 addrspace(1)* %177 to float addrspace(1)*
  br i1 %39, label %180, label %269

180:                                              ; preds = %174
  %181 = and i32 %2, 7
  %182 = icmp ult i32 %2, 8
  br i1 %182, label %254, label %183

183:                                              ; preds = %180
  %184 = and i32 %2, -8
  br label %288

185:                                              ; preds = %185, %62
  %186 = phi i32 [ 0, %62 ], [ %251, %185 ]
  %187 = phi i32 [ 0, %62 ], [ %252, %185 ]
  %188 = mul nuw nsw i32 %186, 6
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %16, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = add nsw i32 %186, %59
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %25, i64 %193
  store float %191, float addrspace(1)* %194, align 4, !tbaa !7
  %195 = or i32 %186, 1
  %196 = mul nuw nsw i32 %195, 6
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %16, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7
  %200 = add nsw i32 %195, %59
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %25, i64 %201
  store float %199, float addrspace(1)* %202, align 4, !tbaa !7
  %203 = or i32 %186, 2
  %204 = mul nuw nsw i32 %203, 6
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, float addrspace(1)* %16, i64 %205
  %207 = load float, float addrspace(1)* %206, align 4, !tbaa !7
  %208 = add nsw i32 %203, %59
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %25, i64 %209
  store float %207, float addrspace(1)* %210, align 4, !tbaa !7
  %211 = or i32 %186, 3
  %212 = mul nuw nsw i32 %211, 6
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds float, float addrspace(1)* %16, i64 %213
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !7
  %216 = add nsw i32 %211, %59
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %25, i64 %217
  store float %215, float addrspace(1)* %218, align 4, !tbaa !7
  %219 = or i32 %186, 4
  %220 = mul nuw nsw i32 %219, 6
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %16, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !7
  %224 = add nsw i32 %219, %59
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %25, i64 %225
  store float %223, float addrspace(1)* %226, align 4, !tbaa !7
  %227 = or i32 %186, 5
  %228 = mul nuw nsw i32 %227, 6
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %16, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !7
  %232 = add nsw i32 %227, %59
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %25, i64 %233
  store float %231, float addrspace(1)* %234, align 4, !tbaa !7
  %235 = or i32 %186, 6
  %236 = mul nuw nsw i32 %235, 6
  %237 = zext i32 %236 to i64
  %238 = getelementptr inbounds float, float addrspace(1)* %16, i64 %237
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !7
  %240 = add nsw i32 %235, %59
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float addrspace(1)* %25, i64 %241
  store float %239, float addrspace(1)* %242, align 4, !tbaa !7
  %243 = or i32 %186, 7
  %244 = mul nuw nsw i32 %243, 6
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %16, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = add nsw i32 %243, %59
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds float, float addrspace(1)* %25, i64 %249
  store float %247, float addrspace(1)* %250, align 4, !tbaa !7
  %251 = add nuw nsw i32 %186, 8
  %252 = add i32 %187, 8
  %253 = icmp eq i32 %252, %63
  br i1 %253, label %158, label %185, !llvm.loop !17

254:                                              ; preds = %288, %180
  %255 = phi i32 [ 0, %180 ], [ %346, %288 ]
  %256 = icmp eq i32 %181, 0
  br i1 %256, label %269, label %257

257:                                              ; preds = %254, %257
  %258 = phi i32 [ %266, %257 ], [ %255, %254 ]
  %259 = phi i32 [ %267, %257 ], [ 0, %254 ]
  %260 = shl nsw i32 %258, 3
  %261 = zext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %13, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !7
  %264 = zext i32 %258 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %179, i64 %264
  store float %263, float addrspace(1)* %265, align 4, !tbaa !7
  %266 = add nuw nsw i32 %258, 1
  %267 = add i32 %259, 1
  %268 = icmp eq i32 %267, %181
  br i1 %268, label %269, label %257, !llvm.loop !18

269:                                              ; preds = %254, %257, %174
  %270 = icmp sgt i32 %1, 0
  br i1 %270, label %271, label %349

271:                                              ; preds = %269
  %272 = mul nsw i32 %36, %1
  %273 = add nuw nsw i32 %1, 1
  %274 = mul nsw i32 %36, %273
  %275 = mul nsw i32 %274, %2
  %276 = mul nsw i32 %36, %2
  %277 = mul i32 %276, %1
  %278 = icmp sgt i32 %3, 0
  %279 = icmp sgt i32 %4, 0
  %280 = mul nsw i32 %276, %273
  %281 = mul nsw i32 %36, %5
  %282 = mul nsw i32 %281, %1
  %283 = mul nsw i32 %281, %273
  %284 = and i32 %3, 7
  %285 = icmp ult i32 %3, 8
  %286 = and i32 %3, -8
  %287 = icmp eq i32 %284, 0
  br label %350

288:                                              ; preds = %288, %183
  %289 = phi i32 [ 0, %183 ], [ %346, %288 ]
  %290 = phi i32 [ 0, %183 ], [ %347, %288 ]
  %291 = shl nsw i32 %289, 3
  %292 = zext i32 %291 to i64
  %293 = getelementptr inbounds float, float addrspace(1)* %13, i64 %292
  %294 = load float, float addrspace(1)* %293, align 4, !tbaa !7
  %295 = zext i32 %289 to i64
  %296 = getelementptr inbounds float, float addrspace(1)* %179, i64 %295
  store float %294, float addrspace(1)* %296, align 4, !tbaa !7
  %297 = or i32 %289, 1
  %298 = shl nsw i32 %297, 3
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds float, float addrspace(1)* %13, i64 %299
  %301 = load float, float addrspace(1)* %300, align 4, !tbaa !7
  %302 = zext i32 %297 to i64
  %303 = getelementptr inbounds float, float addrspace(1)* %179, i64 %302
  store float %301, float addrspace(1)* %303, align 4, !tbaa !7
  %304 = or i32 %289, 2
  %305 = shl nsw i32 %304, 3
  %306 = zext i32 %305 to i64
  %307 = getelementptr inbounds float, float addrspace(1)* %13, i64 %306
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !7
  %309 = zext i32 %304 to i64
  %310 = getelementptr inbounds float, float addrspace(1)* %179, i64 %309
  store float %308, float addrspace(1)* %310, align 4, !tbaa !7
  %311 = or i32 %289, 3
  %312 = shl nsw i32 %311, 3
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds float, float addrspace(1)* %13, i64 %313
  %315 = load float, float addrspace(1)* %314, align 4, !tbaa !7
  %316 = zext i32 %311 to i64
  %317 = getelementptr inbounds float, float addrspace(1)* %179, i64 %316
  store float %315, float addrspace(1)* %317, align 4, !tbaa !7
  %318 = or i32 %289, 4
  %319 = shl nsw i32 %318, 3
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds float, float addrspace(1)* %13, i64 %320
  %322 = load float, float addrspace(1)* %321, align 4, !tbaa !7
  %323 = zext i32 %318 to i64
  %324 = getelementptr inbounds float, float addrspace(1)* %179, i64 %323
  store float %322, float addrspace(1)* %324, align 4, !tbaa !7
  %325 = or i32 %289, 5
  %326 = shl nsw i32 %325, 3
  %327 = zext i32 %326 to i64
  %328 = getelementptr inbounds float, float addrspace(1)* %13, i64 %327
  %329 = load float, float addrspace(1)* %328, align 4, !tbaa !7
  %330 = zext i32 %325 to i64
  %331 = getelementptr inbounds float, float addrspace(1)* %179, i64 %330
  store float %329, float addrspace(1)* %331, align 4, !tbaa !7
  %332 = or i32 %289, 6
  %333 = shl nsw i32 %332, 3
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds float, float addrspace(1)* %13, i64 %334
  %336 = load float, float addrspace(1)* %335, align 4, !tbaa !7
  %337 = zext i32 %332 to i64
  %338 = getelementptr inbounds float, float addrspace(1)* %179, i64 %337
  store float %336, float addrspace(1)* %338, align 4, !tbaa !7
  %339 = or i32 %289, 7
  %340 = shl nsw i32 %339, 3
  %341 = zext i32 %340 to i64
  %342 = getelementptr inbounds float, float addrspace(1)* %13, i64 %341
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !7
  %344 = zext i32 %339 to i64
  %345 = getelementptr inbounds float, float addrspace(1)* %179, i64 %344
  store float %343, float addrspace(1)* %345, align 4, !tbaa !7
  %346 = add nuw nsw i32 %289, 8
  %347 = add nuw i32 %290, 8
  %348 = icmp eq i32 %347, %184
  br i1 %348, label %254, label %288, !llvm.loop !19

349:                                              ; preds = %881, %269
  tail call fastcc void @__ockl_dm_dealloc(i64 %178) #12
  br label %1108

350:                                              ; preds = %271, %881
  %351 = phi i32 [ 0, %271 ], [ %882, %881 ]
  %352 = add nsw i32 %351, %272
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds i32, i32 addrspace(1)* %17, i64 %353
  %355 = load i32, i32 addrspace(1)* %354, align 4, !tbaa !20
  br i1 %39, label %356, label %367

356:                                              ; preds = %350
  %357 = add nuw nsw i32 %351, 1
  %358 = mul nsw i32 %357, %2
  %359 = add nsw i32 %358, %275
  %360 = mul nsw i32 %351, %2
  %361 = add i32 %360, %277
  %362 = mul i32 %361, %3
  %363 = mul i32 %359, %3
  %364 = add nsw i32 %358, %280
  %365 = add i32 %351, %274
  %366 = mul i32 %365, %2
  br label %374

367:                                              ; preds = %685, %350
  br i1 %55, label %370, label %368

368:                                              ; preds = %367
  %369 = add nuw nsw i32 %351, 1
  br label %881

370:                                              ; preds = %367
  %371 = mul nsw i32 %351, %5
  %372 = add nuw nsw i32 %351, 1
  %373 = mul nsw i32 %372, %5
  br label %884

374:                                              ; preds = %356, %685
  %375 = phi i32 [ 0, %356 ], [ %686, %685 ]
  %376 = add nsw i32 %375, %359
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds float, float addrspace(1)* %26, i64 %377
  store float 0.000000e+00, float addrspace(1)* %378, align 4, !tbaa !7
  %379 = add i32 %375, %360
  %380 = add i32 %379, %277
  %381 = sext i32 %380 to i64
  %382 = getelementptr inbounds float, float addrspace(1)* %21, i64 %381
  %383 = load float, float addrspace(1)* %382, align 4, !tbaa !7
  %384 = shl nsw i32 %375, 3
  %385 = add nuw nsw i32 %384, 5
  %386 = zext i32 %385 to i64
  %387 = getelementptr inbounds float, float addrspace(1)* %13, i64 %386
  %388 = load float, float addrspace(1)* %387, align 4, !tbaa !7
  %389 = fcmp contract olt float %383, %388
  %390 = select contract i1 %389, float 1.000000e+00, float 0.000000e+00
  %391 = add nuw nsw i32 %384, 1
  %392 = zext i32 %391 to i64
  %393 = getelementptr inbounds float, float addrspace(1)* %13, i64 %392
  %394 = load float, float addrspace(1)* %393, align 4, !tbaa !7
  %395 = add nuw nsw i32 %384, 4
  %396 = zext i32 %395 to i64
  %397 = getelementptr inbounds float, float addrspace(1)* %13, i64 %396
  %398 = load float, float addrspace(1)* %397, align 4, !tbaa !7
  %399 = getelementptr inbounds float, float addrspace(1)* %22, i64 %381
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !7
  %401 = add nuw nsw i32 %384, 2
  %402 = zext i32 %401 to i64
  %403 = getelementptr inbounds float, float addrspace(1)* %13, i64 %402
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !7
  %405 = fmul contract float %400, %404
  %406 = getelementptr inbounds float, float addrspace(1)* %23, i64 %381
  %407 = load float, float addrspace(1)* %406, align 4, !tbaa !7
  %408 = tail call float @llvm.fabs.f32(float %388)
  %409 = tail call float @llvm.amdgcn.frexp.mant.f32(float %408)
  %410 = fcmp olt float %409, 0x3FE5555560000000
  %411 = zext i1 %410 to i32
  %412 = tail call float @llvm.amdgcn.ldexp.f32(float %409, i32 %411)
  %413 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %408)
  %414 = sub nsw i32 %413, %411
  %415 = fadd float %412, -1.000000e+00
  %416 = fadd float %412, 1.000000e+00
  %417 = fadd float %416, -1.000000e+00
  %418 = fsub float %412, %417
  %419 = tail call float @llvm.amdgcn.rcp.f32(float %416)
  %420 = fmul float %415, %419
  %421 = fmul float %416, %420
  %422 = fneg float %421
  %423 = tail call float @llvm.fma.f32(float %420, float %416, float %422)
  %424 = tail call float @llvm.fma.f32(float %420, float %418, float %423)
  %425 = fadd float %421, %424
  %426 = fsub float %425, %421
  %427 = fsub float %424, %426
  %428 = fsub float %415, %425
  %429 = fsub float %415, %428
  %430 = fsub float %429, %425
  %431 = fsub float %430, %427
  %432 = fadd float %428, %431
  %433 = fmul float %419, %432
  %434 = fadd float %420, %433
  %435 = fsub float %434, %420
  %436 = fsub float %433, %435
  %437 = fmul float %434, %434
  %438 = fneg float %437
  %439 = tail call float @llvm.fma.f32(float %434, float %434, float %438)
  %440 = fmul float %436, 2.000000e+00
  %441 = tail call float @llvm.fma.f32(float %434, float %440, float %439)
  %442 = fadd float %437, %441
  %443 = fsub float %442, %437
  %444 = fsub float %441, %443
  %445 = tail call float @llvm.fmuladd.f32(float %442, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %446 = tail call float @llvm.fmuladd.f32(float %442, float %445, float 0x3FD999BDE0000000)
  %447 = sitofp i32 %414 to float
  %448 = fmul float %447, 0x3FE62E4300000000
  %449 = fneg float %448
  %450 = tail call float @llvm.fma.f32(float %447, float 0x3FE62E4300000000, float %449)
  %451 = tail call float @llvm.fma.f32(float %447, float 0xBE205C6100000000, float %450)
  %452 = fadd float %448, %451
  %453 = fsub float %452, %448
  %454 = fsub float %451, %453
  %455 = tail call float @llvm.amdgcn.ldexp.f32(float %434, i32 1)
  %456 = fmul float %434, %442
  %457 = fneg float %456
  %458 = tail call float @llvm.fma.f32(float %442, float %434, float %457)
  %459 = tail call float @llvm.fma.f32(float %442, float %436, float %458)
  %460 = tail call float @llvm.fma.f32(float %444, float %434, float %459)
  %461 = fadd float %456, %460
  %462 = fsub float %461, %456
  %463 = fsub float %460, %462
  %464 = fmul float %442, %446
  %465 = fneg float %464
  %466 = tail call float @llvm.fma.f32(float %442, float %446, float %465)
  %467 = tail call float @llvm.fma.f32(float %444, float %446, float %466)
  %468 = fadd float %464, %467
  %469 = fsub float %468, %464
  %470 = fsub float %467, %469
  %471 = fadd float %468, 0x3FE5555540000000
  %472 = fadd float %471, 0xBFE5555540000000
  %473 = fsub float %468, %472
  %474 = fadd float %470, 0x3E2E720200000000
  %475 = fadd float %474, %473
  %476 = fadd float %471, %475
  %477 = fsub float %476, %471
  %478 = fsub float %475, %477
  %479 = fmul float %461, %476
  %480 = fneg float %479
  %481 = tail call float @llvm.fma.f32(float %461, float %476, float %480)
  %482 = tail call float @llvm.fma.f32(float %461, float %478, float %481)
  %483 = tail call float @llvm.fma.f32(float %463, float %476, float %482)
  %484 = tail call float @llvm.amdgcn.ldexp.f32(float %436, i32 1)
  %485 = fadd float %479, %483
  %486 = fsub float %485, %479
  %487 = fsub float %483, %486
  %488 = fadd float %455, %485
  %489 = fsub float %488, %455
  %490 = fsub float %485, %489
  %491 = fadd float %484, %487
  %492 = fadd float %491, %490
  %493 = fadd float %488, %492
  %494 = fsub float %493, %488
  %495 = fsub float %492, %494
  %496 = fadd float %452, %493
  %497 = fsub float %496, %452
  %498 = fsub float %496, %497
  %499 = fsub float %452, %498
  %500 = fsub float %493, %497
  %501 = fadd float %500, %499
  %502 = fadd float %454, %495
  %503 = fsub float %502, %454
  %504 = fsub float %502, %503
  %505 = fsub float %454, %504
  %506 = fsub float %495, %503
  %507 = fadd float %506, %505
  %508 = fadd float %502, %501
  %509 = fadd float %496, %508
  %510 = fsub float %509, %496
  %511 = fsub float %508, %510
  %512 = fadd float %507, %511
  %513 = fadd float %509, %512
  %514 = fsub float %513, %509
  %515 = fsub float %512, %514
  %516 = fmul float %513, 2.000000e+00
  %517 = fneg float %516
  %518 = tail call float @llvm.fma.f32(float %513, float 2.000000e+00, float %517)
  %519 = fmul float %513, 0.000000e+00
  %520 = tail call float @llvm.fma.f32(float %515, float 2.000000e+00, float %519)
  %521 = fadd float %518, %520
  %522 = fadd float %516, %521
  %523 = fsub float %522, %516
  %524 = fsub float %521, %523
  %525 = tail call float @llvm.fabs.f32(float %516) #13
  %526 = fcmp oeq float %525, 0x7FF0000000000000
  %527 = select i1 %526, float %516, float %522
  %528 = tail call float @llvm.fabs.f32(float %527) #13
  %529 = fcmp oeq float %528, 0x7FF0000000000000
  %530 = select i1 %529, float 0.000000e+00, float %524
  %531 = fcmp oeq float %527, 0x40562E4300000000
  %532 = select i1 %531, float 0x3EE0000000000000, float 0.000000e+00
  %533 = fsub float %527, %532
  %534 = fadd float %532, %530
  %535 = fmul float %533, 0x3FF7154760000000
  %536 = tail call float @llvm.rint.f32(float %535)
  %537 = fcmp ogt float %533, 0x40562E4300000000
  %538 = fcmp olt float %533, 0xC059D1DA00000000
  %539 = fneg float %535
  %540 = tail call float @llvm.fma.f32(float %533, float 0x3FF7154760000000, float %539)
  %541 = tail call float @llvm.fma.f32(float %533, float 0x3E54AE0BE0000000, float %540)
  %542 = fsub float %535, %536
  %543 = fadd float %541, %542
  %544 = tail call float @llvm.exp2.f32(float %543)
  %545 = fptosi float %536 to i32
  %546 = tail call float @llvm.amdgcn.ldexp.f32(float %544, i32 %545)
  %547 = select i1 %538, float 0.000000e+00, float %546
  %548 = select i1 %537, float 0x7FF0000000000000, float %547
  %549 = tail call float @llvm.fma.f32(float %548, float %534, float %548)
  %550 = tail call float @llvm.fabs.f32(float %548) #13
  %551 = fcmp oeq float %550, 0x7FF0000000000000
  %552 = select i1 %551, float %548, float %549
  %553 = tail call float @llvm.fabs.f32(float %552)
  %554 = fcmp oeq float %408, 0x7FF0000000000000
  %555 = fcmp oeq float %388, 0.000000e+00
  %556 = select i1 %554, float 0x7FF0000000000000, float %553
  %557 = select i1 %555, float 0.000000e+00, float %556
  %558 = fcmp uno float %388, 0.000000e+00
  %559 = select i1 %558, float 0x7FF8000000000000, float %557
  %560 = fmul contract float %407, %559
  %561 = fmul contract float %559, 5.000000e-01
  %562 = fsub contract float %560, %561
  %563 = zext i32 %375 to i64
  %564 = getelementptr inbounds float, float addrspace(1)* %179, i64 %563
  %565 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %566 = fsub contract float %394, %565
  %567 = fmul contract float %398, %566
  %568 = fmul contract float %567, %6
  %569 = fadd contract float %565, %568
  %570 = fmul contract float %405, %565
  %571 = fadd contract float %570, %569
  %572 = fmul float %562, 0x3FF7154760000000
  %573 = tail call float @llvm.rint.f32(float %572)
  %574 = fcmp ogt float %562, 0x40562E4300000000
  %575 = fcmp olt float %562, 0xC059D1DA00000000
  %576 = fneg float %572
  %577 = tail call float @llvm.fma.f32(float %562, float 0x3FF7154760000000, float %576)
  %578 = tail call float @llvm.fma.f32(float %562, float 0x3E54AE0BE0000000, float %577)
  %579 = fsub float %572, %573
  %580 = fadd float %578, %579
  %581 = tail call float @llvm.exp2.f32(float %580)
  %582 = fptosi float %573 to i32
  %583 = tail call float @llvm.amdgcn.ldexp.f32(float %581, i32 %582)
  %584 = fadd contract float %583, -1.000000e+00
  %585 = select i1 %575, float -1.000000e+00, float %584
  %586 = select i1 %574, float 0x7FF0000000000000, float %585
  %587 = fmul contract float %565, %586
  %588 = fmul contract float %390, %587
  %589 = fadd contract float %571, %588
  store float %589, float addrspace(1)* %564, align 4, !tbaa !7
  br i1 %278, label %590, label %609

590:                                              ; preds = %374
  %591 = add i32 %379, %275
  %592 = mul i32 %591, %3
  br i1 %285, label %593, label %624

593:                                              ; preds = %624, %590
  %594 = phi float [ undef, %590 ], [ %674, %624 ]
  %595 = phi i32 [ 0, %590 ], [ %675, %624 ]
  %596 = phi float [ 0.000000e+00, %590 ], [ %674, %624 ]
  br i1 %287, label %609, label %597

597:                                              ; preds = %593, %597
  %598 = phi i32 [ %606, %597 ], [ %595, %593 ]
  %599 = phi float [ %605, %597 ], [ %596, %593 ]
  %600 = phi i32 [ %607, %597 ], [ 0, %593 ]
  %601 = add nsw i32 %598, %592
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds float, float addrspace(1)* %8, i64 %602
  %604 = load float, float addrspace(1)* %603, align 4, !tbaa !7
  %605 = fadd contract float %599, %604
  %606 = add nuw nsw i32 %598, 1
  %607 = add i32 %600, 1
  %608 = icmp eq i32 %607, %284
  br i1 %608, label %609, label %597, !llvm.loop !22

609:                                              ; preds = %593, %597, %374
  %610 = phi float [ 0.000000e+00, %374 ], [ %594, %593 ], [ %605, %597 ]
  br i1 %279, label %611, label %685

611:                                              ; preds = %609
  %612 = mul nsw i32 %375, %4
  %613 = add i32 %379, %275
  %614 = mul i32 %613, %3
  %615 = mul nsw i32 %375, %3
  %616 = add nuw nsw i32 %384, 7
  %617 = zext i32 %616 to i64
  %618 = getelementptr inbounds float, float addrspace(1)* %13, i64 %617
  %619 = add nsw i32 %364, %375
  %620 = sext i32 %619 to i64
  %621 = getelementptr inbounds float, float addrspace(1)* %26, i64 %620
  %622 = add i32 %375, %366
  %623 = mul i32 %622, %4
  br label %678

624:                                              ; preds = %590, %624
  %625 = phi i32 [ %675, %624 ], [ 0, %590 ]
  %626 = phi float [ %674, %624 ], [ 0.000000e+00, %590 ]
  %627 = phi i32 [ %676, %624 ], [ 0, %590 ]
  %628 = add nsw i32 %625, %592
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds float, float addrspace(1)* %8, i64 %629
  %631 = load float, float addrspace(1)* %630, align 4, !tbaa !7
  %632 = fadd contract float %626, %631
  %633 = or i32 %625, 1
  %634 = add nsw i32 %633, %592
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds float, float addrspace(1)* %8, i64 %635
  %637 = load float, float addrspace(1)* %636, align 4, !tbaa !7
  %638 = fadd contract float %632, %637
  %639 = or i32 %625, 2
  %640 = add nsw i32 %639, %592
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds float, float addrspace(1)* %8, i64 %641
  %643 = load float, float addrspace(1)* %642, align 4, !tbaa !7
  %644 = fadd contract float %638, %643
  %645 = or i32 %625, 3
  %646 = add nsw i32 %645, %592
  %647 = sext i32 %646 to i64
  %648 = getelementptr inbounds float, float addrspace(1)* %8, i64 %647
  %649 = load float, float addrspace(1)* %648, align 4, !tbaa !7
  %650 = fadd contract float %644, %649
  %651 = or i32 %625, 4
  %652 = add nsw i32 %651, %592
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds float, float addrspace(1)* %8, i64 %653
  %655 = load float, float addrspace(1)* %654, align 4, !tbaa !7
  %656 = fadd contract float %650, %655
  %657 = or i32 %625, 5
  %658 = add nsw i32 %657, %592
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds float, float addrspace(1)* %8, i64 %659
  %661 = load float, float addrspace(1)* %660, align 4, !tbaa !7
  %662 = fadd contract float %656, %661
  %663 = or i32 %625, 6
  %664 = add nsw i32 %663, %592
  %665 = sext i32 %664 to i64
  %666 = getelementptr inbounds float, float addrspace(1)* %8, i64 %665
  %667 = load float, float addrspace(1)* %666, align 4, !tbaa !7
  %668 = fadd contract float %662, %667
  %669 = or i32 %625, 7
  %670 = add nsw i32 %669, %592
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds float, float addrspace(1)* %8, i64 %671
  %673 = load float, float addrspace(1)* %672, align 4, !tbaa !7
  %674 = fadd contract float %668, %673
  %675 = add nuw nsw i32 %625, 8
  %676 = add i32 %627, 8
  %677 = icmp eq i32 %676, %286
  br i1 %677, label %593, label %624, !llvm.loop !23

678:                                              ; preds = %611, %702
  %679 = phi i32 [ 0, %611 ], [ %708, %702 ]
  br i1 %278, label %680, label %702

680:                                              ; preds = %678
  %681 = add nsw i32 %679, %612
  %682 = mul nsw i32 %681, %3
  %683 = mul nsw i32 %681, %12
  %684 = icmp eq i32 %679, %355
  br label %688

685:                                              ; preds = %702, %609
  %686 = add nuw nsw i32 %375, 1
  %687 = icmp eq i32 %686, %2
  br i1 %687, label %367, label %374, !llvm.loop !24

688:                                              ; preds = %680, %878
  %689 = phi i32 [ 0, %680 ], [ %879, %878 ]
  %690 = phi i32 [ 0, %680 ], [ %738, %878 ]
  %691 = phi float [ 0.000000e+00, %680 ], [ %740, %878 ]
  %692 = add nsw i32 %689, %682
  %693 = sext i32 %692 to i64
  %694 = getelementptr inbounds i32, i32 addrspace(1)* %11, i64 %693
  %695 = load i32, i32 addrspace(1)* %694, align 4, !tbaa !20
  %696 = icmp sgt i32 %695, 0
  br i1 %696, label %697, label %737

697:                                              ; preds = %688
  %698 = and i32 %695, 7
  %699 = icmp ult i32 %695, 8
  br i1 %699, label %710, label %700

700:                                              ; preds = %697
  %701 = and i32 %695, -8
  br label %741

702:                                              ; preds = %878, %678
  %703 = phi float [ 0.000000e+00, %678 ], [ %740, %878 ]
  %704 = fdiv contract float %703, %610
  %705 = add i32 %679, %623
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds float, float addrspace(1)* %15, i64 %706
  store float %704, float addrspace(1)* %707, align 4, !tbaa !7
  %708 = add nuw nsw i32 %679, 1
  %709 = icmp eq i32 %708, %4
  br i1 %709, label %685, label %678, !llvm.loop !25

710:                                              ; preds = %741, %697
  %711 = phi float [ undef, %697 ], [ %847, %741 ]
  %712 = phi float [ 0.000000e+00, %697 ], [ %847, %741 ]
  %713 = phi i32 [ %690, %697 ], [ %848, %741 ]
  %714 = icmp eq i32 %698, 0
  br i1 %714, label %734, label %715

715:                                              ; preds = %710, %715
  %716 = phi float [ %730, %715 ], [ %712, %710 ]
  %717 = phi i32 [ %731, %715 ], [ %713, %710 ]
  %718 = phi i32 [ %732, %715 ], [ 0, %710 ]
  %719 = add nsw i32 %717, %683
  %720 = sext i32 %719 to i64
  %721 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %720
  %722 = load i32, i32 addrspace(1)* %721, align 4, !tbaa !20
  %723 = add nsw i32 %722, %614
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds float, float addrspace(1)* %8, i64 %724
  %726 = load float, float addrspace(1)* %725, align 4, !tbaa !7
  %727 = getelementptr inbounds float, float addrspace(1)* %9, i64 %720
  %728 = load float, float addrspace(1)* %727, align 4, !tbaa !7
  %729 = fmul contract float %726, %728
  %730 = fadd contract float %716, %729
  %731 = add nsw i32 %717, 1
  %732 = add i32 %718, 1
  %733 = icmp eq i32 %732, %698
  br i1 %733, label %734, label %715, !llvm.loop !26

734:                                              ; preds = %715, %710
  %735 = phi float [ %711, %710 ], [ %730, %715 ]
  %736 = add i32 %690, %695
  br label %737

737:                                              ; preds = %734, %688
  %738 = phi i32 [ %690, %688 ], [ %736, %734 ]
  %739 = phi float [ 0.000000e+00, %688 ], [ %735, %734 ]
  %740 = fadd contract float %691, %739
  br i1 %684, label %851, label %878

741:                                              ; preds = %741, %700
  %742 = phi float [ 0.000000e+00, %700 ], [ %847, %741 ]
  %743 = phi i32 [ %690, %700 ], [ %848, %741 ]
  %744 = phi i32 [ 0, %700 ], [ %849, %741 ]
  %745 = add nsw i32 %743, %683
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %746
  %748 = load i32, i32 addrspace(1)* %747, align 4, !tbaa !20
  %749 = add nsw i32 %748, %614
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds float, float addrspace(1)* %8, i64 %750
  %752 = load float, float addrspace(1)* %751, align 4, !tbaa !7
  %753 = getelementptr inbounds float, float addrspace(1)* %9, i64 %746
  %754 = load float, float addrspace(1)* %753, align 4, !tbaa !7
  %755 = fmul contract float %752, %754
  %756 = fadd contract float %742, %755
  %757 = add nsw i32 %743, 1
  %758 = add nsw i32 %757, %683
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %759
  %761 = load i32, i32 addrspace(1)* %760, align 4, !tbaa !20
  %762 = add nsw i32 %761, %614
  %763 = sext i32 %762 to i64
  %764 = getelementptr inbounds float, float addrspace(1)* %8, i64 %763
  %765 = load float, float addrspace(1)* %764, align 4, !tbaa !7
  %766 = getelementptr inbounds float, float addrspace(1)* %9, i64 %759
  %767 = load float, float addrspace(1)* %766, align 4, !tbaa !7
  %768 = fmul contract float %765, %767
  %769 = fadd contract float %756, %768
  %770 = add nsw i32 %743, 2
  %771 = add nsw i32 %770, %683
  %772 = sext i32 %771 to i64
  %773 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %772
  %774 = load i32, i32 addrspace(1)* %773, align 4, !tbaa !20
  %775 = add nsw i32 %774, %614
  %776 = sext i32 %775 to i64
  %777 = getelementptr inbounds float, float addrspace(1)* %8, i64 %776
  %778 = load float, float addrspace(1)* %777, align 4, !tbaa !7
  %779 = getelementptr inbounds float, float addrspace(1)* %9, i64 %772
  %780 = load float, float addrspace(1)* %779, align 4, !tbaa !7
  %781 = fmul contract float %778, %780
  %782 = fadd contract float %769, %781
  %783 = add nsw i32 %743, 3
  %784 = add nsw i32 %783, %683
  %785 = sext i32 %784 to i64
  %786 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %785
  %787 = load i32, i32 addrspace(1)* %786, align 4, !tbaa !20
  %788 = add nsw i32 %787, %614
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds float, float addrspace(1)* %8, i64 %789
  %791 = load float, float addrspace(1)* %790, align 4, !tbaa !7
  %792 = getelementptr inbounds float, float addrspace(1)* %9, i64 %785
  %793 = load float, float addrspace(1)* %792, align 4, !tbaa !7
  %794 = fmul contract float %791, %793
  %795 = fadd contract float %782, %794
  %796 = add nsw i32 %743, 4
  %797 = add nsw i32 %796, %683
  %798 = sext i32 %797 to i64
  %799 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %798
  %800 = load i32, i32 addrspace(1)* %799, align 4, !tbaa !20
  %801 = add nsw i32 %800, %614
  %802 = sext i32 %801 to i64
  %803 = getelementptr inbounds float, float addrspace(1)* %8, i64 %802
  %804 = load float, float addrspace(1)* %803, align 4, !tbaa !7
  %805 = getelementptr inbounds float, float addrspace(1)* %9, i64 %798
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !7
  %807 = fmul contract float %804, %806
  %808 = fadd contract float %795, %807
  %809 = add nsw i32 %743, 5
  %810 = add nsw i32 %809, %683
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %811
  %813 = load i32, i32 addrspace(1)* %812, align 4, !tbaa !20
  %814 = add nsw i32 %813, %614
  %815 = sext i32 %814 to i64
  %816 = getelementptr inbounds float, float addrspace(1)* %8, i64 %815
  %817 = load float, float addrspace(1)* %816, align 4, !tbaa !7
  %818 = getelementptr inbounds float, float addrspace(1)* %9, i64 %811
  %819 = load float, float addrspace(1)* %818, align 4, !tbaa !7
  %820 = fmul contract float %817, %819
  %821 = fadd contract float %808, %820
  %822 = add nsw i32 %743, 6
  %823 = add nsw i32 %822, %683
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %824
  %826 = load i32, i32 addrspace(1)* %825, align 4, !tbaa !20
  %827 = add nsw i32 %826, %614
  %828 = sext i32 %827 to i64
  %829 = getelementptr inbounds float, float addrspace(1)* %8, i64 %828
  %830 = load float, float addrspace(1)* %829, align 4, !tbaa !7
  %831 = getelementptr inbounds float, float addrspace(1)* %9, i64 %824
  %832 = load float, float addrspace(1)* %831, align 4, !tbaa !7
  %833 = fmul contract float %830, %832
  %834 = fadd contract float %821, %833
  %835 = add nsw i32 %743, 7
  %836 = add nsw i32 %835, %683
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %837
  %839 = load i32, i32 addrspace(1)* %838, align 4, !tbaa !20
  %840 = add nsw i32 %839, %614
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds float, float addrspace(1)* %8, i64 %841
  %843 = load float, float addrspace(1)* %842, align 4, !tbaa !7
  %844 = getelementptr inbounds float, float addrspace(1)* %9, i64 %837
  %845 = load float, float addrspace(1)* %844, align 4, !tbaa !7
  %846 = fmul contract float %843, %845
  %847 = fadd contract float %834, %846
  %848 = add nsw i32 %743, 8
  %849 = add i32 %744, 8
  %850 = icmp eq i32 %849, %701
  br i1 %850, label %710, label %741, !llvm.loop !27

851:                                              ; preds = %737
  %852 = load float, float addrspace(1)* %564, align 4, !tbaa !7
  %853 = add i32 %689, %615
  %854 = add i32 %853, %362
  %855 = sext i32 %854 to i64
  %856 = getelementptr inbounds float, float addrspace(1)* %24, i64 %855
  %857 = load float, float addrspace(1)* %856, align 4, !tbaa !7
  %858 = load float, float addrspace(1)* %618, align 4, !tbaa !7
  %859 = fmul contract float %857, %858
  %860 = fadd contract float %852, %859
  store float %860, float addrspace(1)* %856, align 4, !tbaa !7
  %861 = fpext float %739 to double
  %862 = sext i32 %853 to i64
  %863 = getelementptr inbounds float, float addrspace(1)* %14, i64 %862
  %864 = load float, float addrspace(1)* %863, align 4, !tbaa !7
  %865 = fsub contract float %864, %739
  %866 = fmul contract float %860, %865
  %867 = fdiv contract float %866, %864
  %868 = fpext float %867 to double
  %869 = fdiv contract double %868, 1.000000e+02
  %870 = fadd contract double %869, 1.000000e+00
  %871 = fmul contract double %870, %861
  %872 = fptrunc double %871 to float
  %873 = add i32 %853, %363
  %874 = sext i32 %873 to i64
  %875 = getelementptr inbounds float, float addrspace(1)* %8, i64 %874
  store float %872, float addrspace(1)* %875, align 4, !tbaa !7
  %876 = load float, float addrspace(1)* %621, align 4, !tbaa !7
  %877 = fadd contract float %876, %872
  store float %877, float addrspace(1)* %621, align 4, !tbaa !7
  br label %878

878:                                              ; preds = %851, %737
  %879 = add nuw nsw i32 %689, 1
  %880 = icmp eq i32 %879, %3
  br i1 %880, label %702, label %688, !llvm.loop !28

881:                                              ; preds = %884, %368
  %882 = phi i32 [ %369, %368 ], [ %372, %884 ]
  %883 = icmp eq i32 %882, %1
  br i1 %883, label %349, label %350, !llvm.loop !29

884:                                              ; preds = %370, %884
  %885 = phi i32 [ 0, %370 ], [ %1106, %884 ]
  %886 = add i32 %885, %371
  %887 = add i32 %886, %282
  %888 = sext i32 %887 to i64
  %889 = getelementptr inbounds float, float addrspace(1)* %18, i64 %888
  %890 = load float, float addrspace(1)* %889, align 4, !tbaa !7
  %891 = mul nuw nsw i32 %885, 6
  %892 = add nuw nsw i32 %891, 5
  %893 = zext i32 %892 to i64
  %894 = getelementptr inbounds float, float addrspace(1)* %16, i64 %893
  %895 = load float, float addrspace(1)* %894, align 4, !tbaa !7
  %896 = fcmp contract olt float %890, %895
  %897 = select contract i1 %896, float 1.000000e+00, float 0.000000e+00
  %898 = add i32 %886, %283
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds float, float addrspace(1)* %25, i64 %899
  %901 = load float, float addrspace(1)* %900, align 4, !tbaa !7
  %902 = or i32 %891, 1
  %903 = zext i32 %902 to i64
  %904 = getelementptr inbounds float, float addrspace(1)* %16, i64 %903
  %905 = load float, float addrspace(1)* %904, align 4, !tbaa !7
  %906 = add nuw nsw i32 %891, 3
  %907 = zext i32 %906 to i64
  %908 = getelementptr inbounds float, float addrspace(1)* %16, i64 %907
  %909 = load float, float addrspace(1)* %908, align 4, !tbaa !7
  %910 = getelementptr inbounds float, float addrspace(1)* %19, i64 %888
  %911 = load float, float addrspace(1)* %910, align 4, !tbaa !7
  %912 = add nuw nsw i32 %891, 2
  %913 = zext i32 %912 to i64
  %914 = getelementptr inbounds float, float addrspace(1)* %16, i64 %913
  %915 = load float, float addrspace(1)* %914, align 4, !tbaa !7
  %916 = fmul contract float %911, %915
  %917 = getelementptr inbounds float, float addrspace(1)* %20, i64 %888
  %918 = load float, float addrspace(1)* %917, align 4, !tbaa !7
  %919 = add nuw nsw i32 %891, 4
  %920 = zext i32 %919 to i64
  %921 = getelementptr inbounds float, float addrspace(1)* %16, i64 %920
  %922 = load float, float addrspace(1)* %921, align 4, !tbaa !7
  %923 = tail call float @llvm.fabs.f32(float %922)
  %924 = tail call float @llvm.amdgcn.frexp.mant.f32(float %923)
  %925 = fcmp olt float %924, 0x3FE5555560000000
  %926 = zext i1 %925 to i32
  %927 = tail call float @llvm.amdgcn.ldexp.f32(float %924, i32 %926)
  %928 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %923)
  %929 = sub nsw i32 %928, %926
  %930 = fadd float %927, -1.000000e+00
  %931 = fadd float %927, 1.000000e+00
  %932 = fadd float %931, -1.000000e+00
  %933 = fsub float %927, %932
  %934 = tail call float @llvm.amdgcn.rcp.f32(float %931)
  %935 = fmul float %930, %934
  %936 = fmul float %931, %935
  %937 = fneg float %936
  %938 = tail call float @llvm.fma.f32(float %935, float %931, float %937)
  %939 = tail call float @llvm.fma.f32(float %935, float %933, float %938)
  %940 = fadd float %936, %939
  %941 = fsub float %940, %936
  %942 = fsub float %939, %941
  %943 = fsub float %930, %940
  %944 = fsub float %930, %943
  %945 = fsub float %944, %940
  %946 = fsub float %945, %942
  %947 = fadd float %943, %946
  %948 = fmul float %934, %947
  %949 = fadd float %935, %948
  %950 = fsub float %949, %935
  %951 = fsub float %948, %950
  %952 = fmul float %949, %949
  %953 = fneg float %952
  %954 = tail call float @llvm.fma.f32(float %949, float %949, float %953)
  %955 = fmul float %951, 2.000000e+00
  %956 = tail call float @llvm.fma.f32(float %949, float %955, float %954)
  %957 = fadd float %952, %956
  %958 = fsub float %957, %952
  %959 = fsub float %956, %958
  %960 = tail call float @llvm.fmuladd.f32(float %957, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %961 = tail call float @llvm.fmuladd.f32(float %957, float %960, float 0x3FD999BDE0000000)
  %962 = sitofp i32 %929 to float
  %963 = fmul float %962, 0x3FE62E4300000000
  %964 = fneg float %963
  %965 = tail call float @llvm.fma.f32(float %962, float 0x3FE62E4300000000, float %964)
  %966 = tail call float @llvm.fma.f32(float %962, float 0xBE205C6100000000, float %965)
  %967 = fadd float %963, %966
  %968 = fsub float %967, %963
  %969 = fsub float %966, %968
  %970 = tail call float @llvm.amdgcn.ldexp.f32(float %949, i32 1)
  %971 = fmul float %949, %957
  %972 = fneg float %971
  %973 = tail call float @llvm.fma.f32(float %957, float %949, float %972)
  %974 = tail call float @llvm.fma.f32(float %957, float %951, float %973)
  %975 = tail call float @llvm.fma.f32(float %959, float %949, float %974)
  %976 = fadd float %971, %975
  %977 = fsub float %976, %971
  %978 = fsub float %975, %977
  %979 = fmul float %957, %961
  %980 = fneg float %979
  %981 = tail call float @llvm.fma.f32(float %957, float %961, float %980)
  %982 = tail call float @llvm.fma.f32(float %959, float %961, float %981)
  %983 = fadd float %979, %982
  %984 = fsub float %983, %979
  %985 = fsub float %982, %984
  %986 = fadd float %983, 0x3FE5555540000000
  %987 = fadd float %986, 0xBFE5555540000000
  %988 = fsub float %983, %987
  %989 = fadd float %985, 0x3E2E720200000000
  %990 = fadd float %989, %988
  %991 = fadd float %986, %990
  %992 = fsub float %991, %986
  %993 = fsub float %990, %992
  %994 = fmul float %976, %991
  %995 = fneg float %994
  %996 = tail call float @llvm.fma.f32(float %976, float %991, float %995)
  %997 = tail call float @llvm.fma.f32(float %976, float %993, float %996)
  %998 = tail call float @llvm.fma.f32(float %978, float %991, float %997)
  %999 = tail call float @llvm.amdgcn.ldexp.f32(float %951, i32 1)
  %1000 = fadd float %994, %998
  %1001 = fsub float %1000, %994
  %1002 = fsub float %998, %1001
  %1003 = fadd float %970, %1000
  %1004 = fsub float %1003, %970
  %1005 = fsub float %1000, %1004
  %1006 = fadd float %999, %1002
  %1007 = fadd float %1006, %1005
  %1008 = fadd float %1003, %1007
  %1009 = fsub float %1008, %1003
  %1010 = fsub float %1007, %1009
  %1011 = fadd float %967, %1008
  %1012 = fsub float %1011, %967
  %1013 = fsub float %1011, %1012
  %1014 = fsub float %967, %1013
  %1015 = fsub float %1008, %1012
  %1016 = fadd float %1015, %1014
  %1017 = fadd float %969, %1010
  %1018 = fsub float %1017, %969
  %1019 = fsub float %1017, %1018
  %1020 = fsub float %969, %1019
  %1021 = fsub float %1010, %1018
  %1022 = fadd float %1021, %1020
  %1023 = fadd float %1017, %1016
  %1024 = fadd float %1011, %1023
  %1025 = fsub float %1024, %1011
  %1026 = fsub float %1023, %1025
  %1027 = fadd float %1022, %1026
  %1028 = fadd float %1024, %1027
  %1029 = fsub float %1028, %1024
  %1030 = fsub float %1027, %1029
  %1031 = fmul float %1028, 2.000000e+00
  %1032 = fneg float %1031
  %1033 = tail call float @llvm.fma.f32(float %1028, float 2.000000e+00, float %1032)
  %1034 = fmul float %1028, 0.000000e+00
  %1035 = tail call float @llvm.fma.f32(float %1030, float 2.000000e+00, float %1034)
  %1036 = fadd float %1033, %1035
  %1037 = fadd float %1031, %1036
  %1038 = fsub float %1037, %1031
  %1039 = fsub float %1036, %1038
  %1040 = tail call float @llvm.fabs.f32(float %1031) #13
  %1041 = fcmp oeq float %1040, 0x7FF0000000000000
  %1042 = select i1 %1041, float %1031, float %1037
  %1043 = tail call float @llvm.fabs.f32(float %1042) #13
  %1044 = fcmp oeq float %1043, 0x7FF0000000000000
  %1045 = select i1 %1044, float 0.000000e+00, float %1039
  %1046 = fcmp oeq float %1042, 0x40562E4300000000
  %1047 = select i1 %1046, float 0x3EE0000000000000, float 0.000000e+00
  %1048 = fsub float %1042, %1047
  %1049 = fadd float %1047, %1045
  %1050 = fmul float %1048, 0x3FF7154760000000
  %1051 = tail call float @llvm.rint.f32(float %1050)
  %1052 = fcmp ogt float %1048, 0x40562E4300000000
  %1053 = fcmp olt float %1048, 0xC059D1DA00000000
  %1054 = fneg float %1050
  %1055 = tail call float @llvm.fma.f32(float %1048, float 0x3FF7154760000000, float %1054)
  %1056 = tail call float @llvm.fma.f32(float %1048, float 0x3E54AE0BE0000000, float %1055)
  %1057 = fsub float %1050, %1051
  %1058 = fadd float %1056, %1057
  %1059 = tail call float @llvm.exp2.f32(float %1058)
  %1060 = fptosi float %1051 to i32
  %1061 = tail call float @llvm.amdgcn.ldexp.f32(float %1059, i32 %1060)
  %1062 = select i1 %1053, float 0.000000e+00, float %1061
  %1063 = select i1 %1052, float 0x7FF0000000000000, float %1062
  %1064 = tail call float @llvm.fma.f32(float %1063, float %1049, float %1063)
  %1065 = tail call float @llvm.fabs.f32(float %1063) #13
  %1066 = fcmp oeq float %1065, 0x7FF0000000000000
  %1067 = select i1 %1066, float %1063, float %1064
  %1068 = tail call float @llvm.fabs.f32(float %1067)
  %1069 = fcmp oeq float %923, 0x7FF0000000000000
  %1070 = fcmp oeq float %922, 0.000000e+00
  %1071 = select i1 %1069, float 0x7FF0000000000000, float %1068
  %1072 = select i1 %1070, float 0.000000e+00, float %1071
  %1073 = fcmp uno float %922, 0.000000e+00
  %1074 = select i1 %1073, float 0x7FF8000000000000, float %1072
  %1075 = fmul contract float %918, %1074
  %1076 = fmul contract float %1074, 5.000000e-01
  %1077 = fsub contract float %1075, %1076
  %1078 = fsub contract float %905, %901
  %1079 = fmul contract float %909, %1078
  %1080 = fmul contract float %1079, %6
  %1081 = fadd contract float %901, %1080
  %1082 = fmul contract float %901, %916
  %1083 = fadd contract float %1081, %1082
  %1084 = fmul float %1077, 0x3FF7154760000000
  %1085 = tail call float @llvm.rint.f32(float %1084)
  %1086 = fcmp ogt float %1077, 0x40562E4300000000
  %1087 = fcmp olt float %1077, 0xC059D1DA00000000
  %1088 = fneg float %1084
  %1089 = tail call float @llvm.fma.f32(float %1077, float 0x3FF7154760000000, float %1088)
  %1090 = tail call float @llvm.fma.f32(float %1077, float 0x3E54AE0BE0000000, float %1089)
  %1091 = fsub float %1084, %1085
  %1092 = fadd float %1090, %1091
  %1093 = tail call float @llvm.exp2.f32(float %1092)
  %1094 = fptosi float %1085 to i32
  %1095 = tail call float @llvm.amdgcn.ldexp.f32(float %1093, i32 %1094)
  %1096 = fadd contract float %1095, -1.000000e+00
  %1097 = select i1 %1087, float -1.000000e+00, float %1096
  %1098 = select i1 %1086, float 0x7FF0000000000000, float %1097
  %1099 = fmul contract float %901, %1098
  %1100 = fmul contract float %897, %1099
  %1101 = fadd contract float %1083, %1100
  %1102 = add i32 %885, %283
  %1103 = add i32 %1102, %373
  %1104 = sext i32 %1103 to i64
  %1105 = getelementptr inbounds float, float addrspace(1)* %25, i64 %1104
  store float %1101, float addrspace(1)* %1105, align 4, !tbaa !7
  %1106 = add nuw nsw i32 %885, 1
  %1107 = icmp eq i32 %1106, %5
  br i1 %1107, label %881, label %884, !llvm.loop !30

1108:                                             ; preds = %349, %27
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc void @__ockl_dm_dealloc(i64 noundef %0) unnamed_addr #4 {
  %2 = and i64 %0, 4095
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %21

4:                                                ; preds = %1
  %5 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 24
  %7 = bitcast i8 addrspace(4)* %6 to i64 addrspace(4)*
  %8 = load i64, i64 addrspace(4)* %7, align 8, !tbaa !31
  %9 = inttoptr i64 %8 to i8 addrspace(1)*
  %10 = addrspacecast i8 addrspace(1)* %9 to i8*
  %11 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %10, i64 noundef %0, i64 noundef 0) #12
  %12 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %13 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %14 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %13, i32 0)
  %15 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %12, i32 %14)
  %16 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %17 = icmp eq i32 %15, 0
  br i1 %17, label %18, label %106

18:                                               ; preds = %4
  %19 = tail call i64 @llvm.ctpop.i64(i64 %16), !range !38
  %20 = atomicrmw sub i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %19 syncscope("agent-one-as") monotonic, align 8
  br label %106

21:                                               ; preds = %1
  %22 = and i64 %0, -2097152
  %23 = inttoptr i64 %22 to %5 addrspace(1)*
  %24 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 0
  %25 = load i32, i32 addrspace(1)* %24, align 2097152, !tbaa !39
  %26 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 1
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !42
  %28 = zext i32 %25 to i64
  %29 = icmp ult i32 %27, 256
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %28, i64 %30
  %32 = add i32 %27, -256
  %33 = lshr i32 %32, 8
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %28, i64 %34, i32 0
  %36 = and i32 %27, 255
  %37 = zext i32 %36 to i64
  %38 = trunc i64 %0 to i32
  %39 = and i32 %38, 2097151
  %40 = lshr i32 %25, 1
  %41 = add nuw i32 %40, 4
  %42 = and i32 %41, 31
  %43 = shl nuw i32 1, %42
  %44 = and i32 %25, 1
  %45 = icmp eq i32 %44, 0
  %46 = lshr i32 %43, 1
  %47 = select i1 %45, i32 0, i32 %46
  %48 = add nuw i32 %47, %43
  %49 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %28, i32 3
  br label %50

50:                                               ; preds = %101, %21
  %51 = phi i32 [ 1, %21 ], [ %102, %101 ]
  %52 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %51) #12, !srcloc !43
  %53 = icmp eq i32 %51, 0
  br i1 %53, label %101, label %54

54:                                               ; preds = %50
  %55 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %25)
  %56 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %27)
  %57 = icmp eq i32 %25, %55
  %58 = icmp eq i32 %27, %56
  %59 = select i1 %57, i1 %58, i1 false
  br i1 %59, label %60, label %101

60:                                               ; preds = %54
  %61 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %62 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %63 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %62, i32 0)
  %64 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %61, i32 %63)
  %65 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %66 = tail call i64 @llvm.ctpop.i64(i64 %65), !range !38
  %67 = trunc i64 %66 to i32
  %68 = icmp ne i32 %64, 0
  %69 = select i1 %68, i1 true, i1 %29
  %70 = select i1 %68, %3 addrspace(1)* null, %3 addrspace(1)* %31
  br i1 %69, label %75, label %71

71:                                               ; preds = %60
  %72 = load atomic i64, i64 addrspace(1)* %35 syncscope("agent-one-as") monotonic, align 8
  %73 = inttoptr i64 %72 to %3 addrspace(1)*
  %74 = getelementptr inbounds %3, %3 addrspace(1)* %73, i64 %37
  br label %75

75:                                               ; preds = %71, %60
  %76 = phi %3 addrspace(1)* [ %74, %71 ], [ %70, %60 ]
  %77 = ptrtoint %3 addrspace(1)* %76 to i64
  %78 = trunc i64 %77 to i32
  %79 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %78)
  %80 = lshr i64 %77, 32
  %81 = trunc i64 %80 to i32
  %82 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %81)
  %83 = load i32, i32 addrspace(4)* %49, align 4, !tbaa !44
  %84 = sub i32 %39, %83
  %85 = udiv i32 %84, %48
  %86 = and i32 %85, 31
  %87 = shl nuw i32 1, %86
  %88 = xor i32 %87, -1
  %89 = lshr i32 %85, 5
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds %5, %5 addrspace(1)* %23, i64 0, i32 4, i64 %90
  %92 = atomicrmw and i32 addrspace(1)* %91, i32 %88 syncscope("agent-one-as") monotonic, align 4
  br i1 %68, label %101, label %93

93:                                               ; preds = %75
  %94 = insertelement <2 x i32> undef, i32 %79, i64 0
  %95 = insertelement <2 x i32> %94, i32 %82, i64 1
  %96 = bitcast <2 x i32> %95 to i64
  %97 = inttoptr i64 %96 to i8 addrspace(1)*
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %97, i64 16
  %99 = bitcast i8 addrspace(1)* %98 to i32 addrspace(1)*
  %100 = atomicrmw sub i32 addrspace(1)* %99, i32 %67 syncscope("agent-one-as") monotonic, align 4
  br label %101

101:                                              ; preds = %93, %75, %54, %50
  %102 = phi i32 [ 0, %50 ], [ 1, %54 ], [ 0, %93 ], [ 0, %75 ]
  %103 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %102) #12, !srcloc !46
  %104 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %103, i32 noundef 0, i32 noundef 33) #15
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %106, label %50

106:                                              ; preds = %101, %18, %4
  ret void
}

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.ctpop.i64(i64) #2

; Function Attrs: nofree nounwind readonly
declare i32 @llvm.read_register.i32(metadata) #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i32(i32, i32, i32 immarg) #6

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #7

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2) unnamed_addr #8 {
  %4 = alloca i8*, align 8, addrspace(5)
  %5 = alloca i32, align 4, addrspace(5)
  %6 = alloca i64, align 8, addrspace(5)
  %7 = alloca i64, align 8, addrspace(5)
  %8 = alloca i64, align 8, addrspace(5)
  %9 = alloca i64, align 8, addrspace(5)
  %10 = alloca i64, align 8, addrspace(5)
  %11 = alloca i64, align 8, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i32, align 4, addrspace(5)
  %15 = alloca i32, align 4, addrspace(5)
  %16 = alloca %6 addrspace(1)*, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca %7 addrspace(1)*, align 8, addrspace(5)
  %19 = alloca %8 addrspace(1)*, align 8, addrspace(5)
  %20 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %4, align 8, !tbaa !47
  store i32 3, i32 addrspace(5)* %5, align 4, !tbaa !49
  store i64 %1, i64 addrspace(5)* %6, align 8, !tbaa !31
  store i64 %2, i64 addrspace(5)* %7, align 8, !tbaa !31
  store i64 0, i64 addrspace(5)* %8, align 8, !tbaa !31
  store i64 0, i64 addrspace(5)* %9, align 8, !tbaa !31
  store i64 0, i64 addrspace(5)* %10, align 8, !tbaa !31
  store i64 0, i64 addrspace(5)* %11, align 8, !tbaa !31
  store i64 0, i64 addrspace(5)* %12, align 8, !tbaa !31
  store i64 0, i64 addrspace(5)* %13, align 8, !tbaa !31
  %21 = bitcast i32 addrspace(5)* %14 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %21) #10
  %22 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %23 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %22)
  store i32 %23, i32 addrspace(5)* %14, align 4, !tbaa !49
  %24 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %25 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %24) #12, !srcloc !50
  store i32 %25, i32 addrspace(5)* %14, align 4, !tbaa !49
  %26 = bitcast i32 addrspace(5)* %15 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %26) #10
  %27 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %28 = call i32 @llvm.amdgcn.readfirstlane(i32 %27)
  store i32 %28, i32 addrspace(5)* %15, align 4, !tbaa !49
  %29 = bitcast %6 addrspace(1)* addrspace(5)* %16 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %29) #10
  %30 = load i8*, i8* addrspace(5)* %4, align 8, !tbaa !47
  %31 = addrspacecast i8* %30 to %6 addrspace(1)*
  store %6 addrspace(1)* %31, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !47
  %32 = bitcast i64 addrspace(5)* %17 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %32) #10
  %33 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !47
  %34 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %35 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !49
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %62

37:                                               ; preds = %3
  %38 = getelementptr inbounds %6, %6 addrspace(1)* %33, i64 0, i32 3
  %39 = load atomic i64, i64 addrspace(1)* %38 syncscope("one-as") acquire, align 8
  %40 = getelementptr %6, %6 addrspace(1)* %33, i64 0, i32 0
  %41 = getelementptr %6, %6 addrspace(1)* %33, i64 0, i32 5
  %42 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %40, align 8, !tbaa !51
  %43 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !54
  %44 = and i64 %43, %39
  %45 = getelementptr inbounds %7, %7 addrspace(1)* %42, i64 %44, i32 0
  %46 = load atomic i64, i64 addrspace(1)* %45 syncscope("one-as") monotonic, align 8
  %47 = cmpxchg i64 addrspace(1)* %38, i64 %39, i64 %46 syncscope("one-as") acquire monotonic, align 8
  %48 = extractvalue { i64, i1 } %47, 1
  br i1 %48, label %59, label %49

49:                                               ; preds = %49, %37
  %50 = phi { i64, i1 } [ %57, %49 ], [ %47, %37 ]
  %51 = extractvalue { i64, i1 } %50, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %52 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %40, align 8, !tbaa !51
  %53 = load i64, i64 addrspace(1)* %41, align 8, !tbaa !54
  %54 = and i64 %53, %51
  %55 = getelementptr inbounds %7, %7 addrspace(1)* %52, i64 %54, i32 0
  %56 = load atomic i64, i64 addrspace(1)* %55 syncscope("one-as") monotonic, align 8
  %57 = cmpxchg i64 addrspace(1)* %38, i64 %51, i64 %56 syncscope("one-as") acquire monotonic, align 8
  %58 = extractvalue { i64, i1 } %57, 1
  br i1 %58, label %59, label %49

59:                                               ; preds = %49, %37
  %60 = phi { i64, i1 } [ %47, %37 ], [ %57, %49 ]
  %61 = extractvalue { i64, i1 } %60, 0
  br label %62

62:                                               ; preds = %3, %59
  %63 = phi i64 [ %61, %59 ], [ 0, %3 ]
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = trunc i64 %65 to i32
  %67 = call i32 @llvm.amdgcn.readfirstlane(i32 %64)
  %68 = call i32 @llvm.amdgcn.readfirstlane(i32 %66)
  %69 = zext i32 %68 to i64
  %70 = shl nuw i64 %69, 32
  %71 = zext i32 %67 to i64
  %72 = or i64 %70, %71
  store i64 %72, i64 addrspace(5)* %17, align 8, !tbaa !31
  %73 = bitcast %7 addrspace(1)* addrspace(5)* %18 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %73) #10
  %74 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !47
  %75 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !31
  %76 = getelementptr %6, %6 addrspace(1)* %74, i64 0, i32 0
  %77 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %76, align 8, !tbaa !51
  %78 = getelementptr %6, %6 addrspace(1)* %74, i64 0, i32 5
  %79 = load i64, i64 addrspace(1)* %78, align 8, !tbaa !54
  %80 = and i64 %75, %79
  %81 = getelementptr inbounds %7, %7 addrspace(1)* %77, i64 %80
  store %7 addrspace(1)* %81, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !47
  %82 = bitcast %8 addrspace(1)* addrspace(5)* %19 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %82) #10
  %83 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !47
  %84 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !31
  %85 = getelementptr %6, %6 addrspace(1)* %83, i64 0, i32 1
  %86 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(1)* %85, align 8, !tbaa !55
  %87 = getelementptr %6, %6 addrspace(1)* %83, i64 0, i32 5
  %88 = load i64, i64 addrspace(1)* %87, align 8, !tbaa !54
  %89 = and i64 %84, %88
  %90 = getelementptr inbounds %8, %8 addrspace(1)* %86, i64 %89
  store %8 addrspace(1)* %90, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !47
  %91 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !47
  %92 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !47
  %93 = load i32, i32 addrspace(5)* %5, align 4, !tbaa !49
  %94 = load i64, i64 addrspace(5)* %6, align 8, !tbaa !31
  %95 = load i64, i64 addrspace(5)* %7, align 8, !tbaa !31
  %96 = load i64, i64 addrspace(5)* %8, align 8, !tbaa !31
  %97 = load i64, i64 addrspace(5)* %9, align 8, !tbaa !31
  %98 = load i64, i64 addrspace(5)* %10, align 8, !tbaa !31
  %99 = load i64, i64 addrspace(5)* %11, align 8, !tbaa !31
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !31
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !31
  %102 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %103 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !49
  %104 = call i64 @llvm.read_register.i64(metadata !37) #14
  %105 = icmp eq i32 %102, %103
  br i1 %105, label %106, label %110

106:                                              ; preds = %62
  %107 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 2
  store i32 %93, i32 addrspace(1)* %107, align 8, !tbaa !56
  %108 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 1
  store i64 %104, i64 addrspace(1)* %108, align 8, !tbaa !58
  %109 = getelementptr inbounds %7, %7 addrspace(1)* %91, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %109, align 4, !tbaa !59
  br label %110

110:                                              ; preds = %62, %106
  %111 = zext i32 %102 to i64
  %112 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 0
  store i64 %94, i64 addrspace(1)* %112, align 8, !tbaa !31
  %113 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 1
  store i64 %95, i64 addrspace(1)* %113, align 8, !tbaa !31
  %114 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 2
  store i64 %96, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 3
  store i64 %97, i64 addrspace(1)* %115, align 8, !tbaa !31
  %116 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 4
  store i64 %98, i64 addrspace(1)* %116, align 8, !tbaa !31
  %117 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 5
  store i64 %99, i64 addrspace(1)* %117, align 8, !tbaa !31
  %118 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 6
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !31
  %119 = getelementptr inbounds %8, %8 addrspace(1)* %92, i64 0, i32 0, i64 %111, i64 7
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !31
  %120 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !47
  %121 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !31
  %122 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %123 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !49
  %124 = icmp eq i32 %122, %123
  br i1 %124, label %125, label %157

125:                                              ; preds = %110
  %126 = getelementptr inbounds %6, %6 addrspace(1)* %120, i64 0, i32 4
  %127 = load atomic i64, i64 addrspace(1)* %126 syncscope("one-as") monotonic, align 8
  %128 = getelementptr %6, %6 addrspace(1)* %120, i64 0, i32 0
  %129 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %128, align 8, !tbaa !51
  %130 = getelementptr %6, %6 addrspace(1)* %120, i64 0, i32 5
  %131 = load i64, i64 addrspace(1)* %130, align 8, !tbaa !54
  %132 = and i64 %131, %121
  %133 = getelementptr inbounds %7, %7 addrspace(1)* %129, i64 %132, i32 0
  store i64 %127, i64 addrspace(1)* %133, align 8, !tbaa !60
  %134 = cmpxchg i64 addrspace(1)* %126, i64 %127, i64 %121 syncscope("one-as") release monotonic, align 8
  %135 = extractvalue { i64, i1 } %134, 1
  br i1 %135, label %141, label %136

136:                                              ; preds = %136, %125
  %137 = phi { i64, i1 } [ %139, %136 ], [ %134, %125 ]
  %138 = extractvalue { i64, i1 } %137, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %138, i64 addrspace(1)* %133, align 8, !tbaa !60
  %139 = cmpxchg i64 addrspace(1)* %126, i64 %138, i64 %121 syncscope("one-as") release monotonic, align 8
  %140 = extractvalue { i64, i1 } %139, 1
  br i1 %140, label %141, label %136

141:                                              ; preds = %136, %125
  %142 = getelementptr inbounds %6, %6 addrspace(1)* %120, i64 0, i32 2, i32 0
  %143 = load i64, i64 addrspace(1)* %142, align 8
  %144 = inttoptr i64 %143 to %10 addrspace(1)*
  %145 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 1, i32 0
  %146 = atomicrmw add i64 addrspace(1)* %145, i64 1 syncscope("one-as") release, align 8
  %147 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 2
  %148 = load i64, i64 addrspace(1)* %147, align 16, !tbaa !61
  %149 = icmp eq i64 %148, 0
  br i1 %149, label %157, label %150

150:                                              ; preds = %141
  %151 = inttoptr i64 %148 to i64 addrspace(1)*
  %152 = getelementptr inbounds %10, %10 addrspace(1)* %144, i64 0, i32 3
  %153 = load i32, i32 addrspace(1)* %152, align 8, !tbaa !63
  %154 = zext i32 %153 to i64
  store atomic i64 %154, i64 addrspace(1)* %151 syncscope("one-as") release, align 8
  %155 = call i32 @llvm.amdgcn.readfirstlane(i32 %153)
  %156 = and i32 %155, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %156)
  br label %157

157:                                              ; preds = %110, %141, %150
  %158 = bitcast <2 x i64> addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %158) #10
  %159 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(5)* %18, align 8, !tbaa !47
  %160 = load %8 addrspace(1)*, %8 addrspace(1)* addrspace(5)* %19, align 8, !tbaa !47
  %161 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %162 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !49
  %163 = icmp eq i32 %161, %162
  %164 = getelementptr inbounds %7, %7 addrspace(1)* %159, i64 0, i32 3
  br label %165

165:                                              ; preds = %173, %157
  br i1 %163, label %166, label %169

166:                                              ; preds = %165
  %167 = load atomic i32, i32 addrspace(1)* %164 syncscope("one-as") acquire, align 4
  %168 = and i32 %167, 1
  br label %169

169:                                              ; preds = %166, %165
  %170 = phi i32 [ %168, %166 ], [ 1, %165 ]
  %171 = call i32 @llvm.amdgcn.readfirstlane(i32 %170)
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %174, label %173

173:                                              ; preds = %169
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %165

174:                                              ; preds = %169
  %175 = zext i32 %161 to i64
  %176 = getelementptr inbounds %8, %8 addrspace(1)* %160, i64 0, i32 0, i64 %175, i64 0
  %177 = getelementptr inbounds %8, %8 addrspace(1)* %160, i64 0, i32 0, i64 %175, i64 1
  %178 = load i64, i64 addrspace(1)* %176, align 8, !tbaa !31
  %179 = load i64, i64 addrspace(1)* %177, align 8, !tbaa !31
  %180 = insertelement <2 x i64> undef, i64 %178, i64 0
  %181 = insertelement <2 x i64> %180, i64 %179, i64 1
  store <2 x i64> %181, <2 x i64> addrspace(5)* %20, align 16, !tbaa !64
  %182 = load %6 addrspace(1)*, %6 addrspace(1)* addrspace(5)* %16, align 8, !tbaa !47
  %183 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !31
  %184 = load i32, i32 addrspace(5)* %14, align 4, !tbaa !49
  %185 = load i32, i32 addrspace(5)* %15, align 4, !tbaa !49
  %186 = icmp eq i32 %184, %185
  br i1 %186, label %187, label %207

187:                                              ; preds = %174
  %188 = getelementptr inbounds %6, %6 addrspace(1)* %182, i64 0, i32 5
  %189 = load i64, i64 addrspace(1)* %188, align 8, !tbaa !54
  %190 = add i64 %189, 1
  %191 = add i64 %190, %183
  %192 = icmp eq i64 %191, 0
  %193 = select i1 %192, i64 %190, i64 %191
  %194 = getelementptr inbounds %6, %6 addrspace(1)* %182, i64 0, i32 3
  %195 = load atomic i64, i64 addrspace(1)* %194 syncscope("one-as") monotonic, align 8
  %196 = getelementptr %6, %6 addrspace(1)* %182, i64 0, i32 0
  %197 = load %7 addrspace(1)*, %7 addrspace(1)* addrspace(1)* %196, align 8, !tbaa !51
  %198 = and i64 %193, %189
  %199 = getelementptr inbounds %7, %7 addrspace(1)* %197, i64 %198, i32 0
  store i64 %195, i64 addrspace(1)* %199, align 8, !tbaa !60
  %200 = cmpxchg i64 addrspace(1)* %194, i64 %195, i64 %193 syncscope("one-as") release monotonic, align 8
  %201 = extractvalue { i64, i1 } %200, 1
  br i1 %201, label %207, label %202

202:                                              ; preds = %202, %187
  %203 = phi { i64, i1 } [ %205, %202 ], [ %200, %187 ]
  %204 = extractvalue { i64, i1 } %203, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %204, i64 addrspace(1)* %199, align 8, !tbaa !60
  %205 = cmpxchg i64 addrspace(1)* %194, i64 %204, i64 %193 syncscope("one-as") release monotonic, align 8
  %206 = extractvalue { i64, i1 } %205, 1
  br i1 %206, label %207, label %202

207:                                              ; preds = %174, %187, %202
  %208 = load <2 x i64>, <2 x i64> addrspace(5)* %20, align 16, !tbaa !64
  %209 = bitcast <2 x i64> addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %209) #10
  %210 = bitcast %8 addrspace(1)* addrspace(5)* %19 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %210) #10
  %211 = bitcast %7 addrspace(1)* addrspace(5)* %18 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %211) #10
  %212 = bitcast i64 addrspace(5)* %17 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %212) #10
  %213 = bitcast %6 addrspace(1)* addrspace(5)* %16 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %213) #10
  %214 = bitcast i32 addrspace(5)* %15 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %214) #10
  %215 = bitcast i32 addrspace(5)* %14 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %215) #10
  ret <2 x i64> %208
}

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #9

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #10

; Function Attrs: convergent noinline norecurse nounwind
define internal fastcc i8 addrspace(1)* @__ockl_dm_alloc(i64 noundef %0) unnamed_addr #11 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %1423, label %3

3:                                                ; preds = %1
  %4 = icmp ugt i64 %0, 3072
  br i1 %4, label %5, label %27

5:                                                ; preds = %3
  %6 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 24
  %8 = bitcast i8 addrspace(4)* %7 to i64 addrspace(4)*
  %9 = load i64, i64 addrspace(4)* %8, align 8, !tbaa !31
  %10 = inttoptr i64 %9 to i8 addrspace(1)*
  %11 = addrspacecast i8 addrspace(1)* %10 to i8*
  %12 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %11, i64 noundef 0, i64 noundef %0) #12
  %13 = extractelement <2 x i64> %12, i64 0
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %25, label %15

15:                                               ; preds = %5
  %16 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %17 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %18 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %17, i32 0)
  %19 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %16, i32 %18)
  %20 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %21 = icmp eq i32 %19, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %15
  %23 = tail call i64 @llvm.ctpop.i64(i64 %20), !range !38
  %24 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 9), i64 %23 syncscope("agent-one-as") monotonic, align 8
  br label %25

25:                                               ; preds = %22, %15, %5
  %26 = inttoptr i64 %13 to i8 addrspace(1)*
  br label %1423

27:                                               ; preds = %3
  %28 = trunc i64 %0 to i32
  %29 = tail call i32 @llvm.umax.i32(i32 %28, i32 16)
  %30 = tail call i32 @llvm.ctlz.i32(i32 %29, i1 false), !range !65
  %31 = sub nsw i32 31, %30
  %32 = and i32 %31, 31
  %33 = shl nuw i32 1, %32
  %34 = shl nuw nsw i32 %30, 1
  %35 = sub nsw i32 54, %34
  %36 = icmp ugt i32 %29, %33
  %37 = zext i1 %36 to i32
  %38 = or i32 %35, %37
  %39 = lshr i32 %33, 1
  %40 = or i32 %39, %33
  %41 = icmp ugt i32 %29, %40
  %42 = zext i1 %41 to i32
  %43 = add nsw i32 %38, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %44, i32 0
  %46 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %44, i32 0
  %47 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 2
  %48 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 2, i64 %44, i32 0
  %49 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 4, i64 %44, i32 0
  %50 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 3, i64 %44, i32 0
  %51 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 5
  %52 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 0
  %53 = lshr i64 191, %44
  %54 = and i64 %53, 1
  %55 = icmp eq i64 %54, 0
  %56 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 4
  %57 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %44, i32 6
  %58 = icmp eq i32 %43, 2
  %59 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %43, i64 0
  %60 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 24
  %62 = bitcast i8 addrspace(4)* %61 to i64 addrspace(4)*
  br label %63

63:                                               ; preds = %1417, %27
  %64 = phi i32 [ 1, %27 ], [ %1418, %1417 ]
  %65 = phi i8 addrspace(1)* [ null, %27 ], [ %1419, %1417 ]
  %66 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %64) #12, !srcloc !43
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %1417, label %68

68:                                               ; preds = %63
  %69 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %43)
  %70 = icmp eq i32 %69, %43
  br i1 %70, label %71, label %1417

71:                                               ; preds = %68, %1410
  %72 = phi i32 [ %1411, %1410 ], [ %66, %68 ]
  %73 = phi i32 [ %1412, %1410 ], [ 1, %68 ]
  %74 = phi i8 addrspace(1)* [ %1413, %1410 ], [ %65, %68 ]
  %75 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %73) #12, !srcloc !43
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %1410, label %77

77:                                               ; preds = %71
  %78 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %79 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %80 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %79, i32 0)
  %81 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %78, i32 %80)
  %82 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %81) #12, !srcloc !66
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %86

84:                                               ; preds = %77
  %85 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %86

86:                                               ; preds = %84, %77
  %87 = phi i32 [ %85, %84 ], [ 0, %77 ]
  %88 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %87)
  %89 = icmp ult i32 %88, 65792
  br i1 %89, label %90, label %634

90:                                               ; preds = %86
  %91 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %92 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %93 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %92, i32 0)
  %94 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %91, i32 %93)
  %95 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %96 = tail call i64 @llvm.ctpop.i64(i64 %95), !range !38
  %97 = trunc i64 %96 to i32
  br label %98

98:                                               ; preds = %631, %90
  %99 = phi i32 [ %94, %90 ], [ %102, %631 ]
  %100 = phi i32 [ %88, %90 ], [ %632, %631 ]
  %101 = phi %3 addrspace(1)* [ undef, %90 ], [ %633, %631 ]
  %102 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %99) #12, !srcloc !66
  %103 = icmp eq i32 %100, 0
  br i1 %103, label %174, label %104

104:                                              ; preds = %98
  %105 = icmp eq i32 %102, 0
  br i1 %105, label %106, label %108

106:                                              ; preds = %104
  %107 = load atomic i32, i32 addrspace(1)* %46 syncscope("agent-one-as") monotonic, align 8
  br label %108

108:                                              ; preds = %106, %104
  %109 = phi i32 [ %107, %106 ], [ 0, %104 ]
  %110 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %109)
  %111 = add i32 %110, %102
  %112 = urem i32 %111, %100
  %113 = load i32, i32 addrspace(4)* %47, align 4, !tbaa !67
  br label %114

114:                                              ; preds = %172, %108
  %115 = phi i32 [ %112, %108 ], [ %169, %172 ]
  %116 = phi i32 [ %100, %108 ], [ %170, %172 ]
  %117 = phi %3 addrspace(1)* [ %101, %108 ], [ %171, %172 ]
  %118 = icmp ugt i32 %115, 255
  br i1 %118, label %119, label %129

119:                                              ; preds = %114
  %120 = add i32 %115, -256
  %121 = lshr i32 %120, 8
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %122, i32 0
  %124 = load atomic i64, i64 addrspace(1)* %123 syncscope("agent-one-as") monotonic, align 8
  %125 = inttoptr i64 %124 to %3 addrspace(1)*
  %126 = and i32 %115, 255
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds %3, %3 addrspace(1)* %125, i64 %127
  br label %132

129:                                              ; preds = %114
  %130 = zext i32 %115 to i64
  %131 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %130
  br label %132

132:                                              ; preds = %129, %119
  %133 = phi %3 addrspace(1)* [ %128, %119 ], [ %131, %129 ]
  %134 = getelementptr inbounds %3, %3 addrspace(1)* %133, i64 0, i32 2
  %135 = load atomic i32, i32 addrspace(1)* %134 syncscope("agent-one-as") monotonic, align 8
  %136 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %135, i32 %113, i32 36)
  %137 = icmp eq i64 %136, 0
  br i1 %137, label %143, label %138

138:                                              ; preds = %132
  %139 = tail call i64 @llvm.cttz.i64(i64 %136, i1 true), !range !38
  %140 = trunc i64 %139 to i32
  %141 = shl nuw nsw i32 %140, 2
  %142 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %141, i32 %115)
  br label %143

143:                                              ; preds = %138, %132
  %144 = phi i32 [ %142, %138 ], [ -1, %132 ]
  %145 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %144)
  %146 = icmp eq i32 %145, -1
  br i1 %146, label %162, label %147

147:                                              ; preds = %143
  %148 = icmp ugt i32 %145, 255
  br i1 %148, label %149, label %159

149:                                              ; preds = %147
  %150 = add i32 %145, -256
  %151 = lshr i32 %150, 8
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %152, i32 0
  %154 = load atomic i64, i64 addrspace(1)* %153 syncscope("agent-one-as") monotonic, align 8
  %155 = inttoptr i64 %154 to %3 addrspace(1)*
  %156 = and i32 %145, 255
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds %3, %3 addrspace(1)* %155, i64 %157
  br label %168

159:                                              ; preds = %147
  %160 = zext i32 %145 to i64
  %161 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %160
  br label %168

162:                                              ; preds = %143
  %163 = add i32 %115, %97
  %164 = urem i32 %163, %100
  br i1 %105, label %165, label %166

165:                                              ; preds = %162
  store atomic i32 %164, i32 addrspace(1)* %46 syncscope("agent-one-as") monotonic, align 8
  br label %166

166:                                              ; preds = %165, %162
  %167 = sub i32 %116, %97
  br label %168

168:                                              ; preds = %166, %159, %149
  %169 = phi i32 [ %164, %166 ], [ %115, %149 ], [ %115, %159 ]
  %170 = phi i32 [ %167, %166 ], [ %116, %149 ], [ %116, %159 ]
  %171 = phi %3 addrspace(1)* [ %117, %166 ], [ %158, %149 ], [ %161, %159 ]
  br i1 %146, label %172, label %1299

172:                                              ; preds = %168
  %173 = icmp sgt i32 %170, 0
  br i1 %173, label %114, label %174

174:                                              ; preds = %172, %98
  %175 = phi %3 addrspace(1)* [ %101, %98 ], [ %171, %172 ]
  %176 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %177 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %178 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %177, i32 0)
  %179 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %176, i32 %178)
  br label %180

180:                                              ; preds = %548, %174
  %181 = phi i32 [ %179, %174 ], [ %550, %548 ]
  %182 = phi %3 addrspace(1)* [ undef, %174 ], [ %551, %548 ]
  %183 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %181) #12, !srcloc !66
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %185, label %187

185:                                              ; preds = %180
  %186 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %187

187:                                              ; preds = %185, %180
  %188 = phi i32 [ %186, %185 ], [ 0, %180 ]
  %189 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %188)
  %190 = icmp eq i32 %189, 65792
  br i1 %190, label %548, label %191

191:                                              ; preds = %187
  br i1 %184, label %192, label %197

192:                                              ; preds = %191
  %193 = cmpxchg i32 addrspace(1)* %48, i32 0, i32 256 syncscope("agent-one-as") monotonic monotonic, align 4
  %194 = extractvalue { i32, i1 } %193, 1
  %195 = extractvalue { i32, i1 } %193, 0
  %196 = select i1 %194, i32 256, i32 %195
  br label %197

197:                                              ; preds = %192, %191
  %198 = phi i32 [ %196, %192 ], [ 0, %191 ]
  %199 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %198)
  %200 = icmp eq i32 %189, %199
  br i1 %200, label %201, label %374

201:                                              ; preds = %197
  %202 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %203 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %204 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %203, i32 0)
  %205 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %202, i32 %204)
  %206 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %205) #12, !srcloc !66
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %210

208:                                              ; preds = %201
  %209 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %210

210:                                              ; preds = %208, %201
  %211 = phi i32 [ %209, %208 ], [ 0, %201 ]
  %212 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %211)
  %213 = icmp eq i32 %212, 65792
  br i1 %213, label %296, label %214

214:                                              ; preds = %210
  br i1 %207, label %215, label %224

215:                                              ; preds = %214
  %216 = load atomic i64, i64 addrspace(1)* %49 syncscope("agent-one-as") monotonic, align 8
  %217 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %218 = sub i64 %217, %216
  %219 = icmp ugt i64 %218, 29999
  br i1 %219, label %220, label %224

220:                                              ; preds = %215
  %221 = cmpxchg i64 addrspace(1)* %49, i64 %216, i64 %217 syncscope("agent-one-as") monotonic monotonic, align 8
  %222 = extractvalue { i64, i1 } %221, 1
  %223 = select i1 %222, i32 2, i32 1
  br label %224

224:                                              ; preds = %220, %215, %214
  %225 = phi i32 [ 1, %214 ], [ 1, %215 ], [ %223, %220 ]
  %226 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %225)
  %227 = icmp eq i32 %226, 1
  br i1 %227, label %296, label %228

228:                                              ; preds = %224
  br i1 %207, label %229, label %235

229:                                              ; preds = %228
  %230 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %231 = inttoptr i64 %230 to i8 addrspace(1)*
  %232 = addrspacecast i8 addrspace(1)* %231 to i8*
  %233 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %232, i64 noundef 0, i64 noundef 6144) #12
  %234 = extractelement <2 x i64> %233, i64 0
  br label %235

235:                                              ; preds = %229, %228
  %236 = phi i64 [ %234, %229 ], [ 0, %228 ]
  %237 = trunc i64 %236 to i32
  %238 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %237)
  %239 = insertelement <2 x i32> undef, i32 %238, i64 0
  %240 = lshr i64 %236, 32
  %241 = trunc i64 %240 to i32
  %242 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %241)
  %243 = insertelement <2 x i32> %239, i32 %242, i64 1
  %244 = bitcast <2 x i32> %243 to i64
  %245 = icmp eq i64 %244, 0
  br i1 %245, label %296, label %246

246:                                              ; preds = %235
  %247 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %248 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %249 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %248, i32 0)
  %250 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %247, i32 %249)
  %251 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %252 = tail call i64 @llvm.ctpop.i64(i64 %251), !range !38
  %253 = trunc i64 %252 to i32
  %254 = inttoptr i64 %244 to i64 addrspace(1)*
  %255 = icmp ult i32 %250, 768
  br i1 %255, label %256, label %262

256:                                              ; preds = %246, %256
  %257 = phi i32 [ %260, %256 ], [ %250, %246 ]
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds i64, i64 addrspace(1)* %254, i64 %258
  store i64 0, i64 addrspace(1)* %259, align 8, !tbaa !31
  %260 = add i32 %257, %253
  %261 = icmp ult i32 %260, 768
  br i1 %261, label %256, label %262

262:                                              ; preds = %256, %246
  br label %263

263:                                              ; preds = %262, %295
  %264 = phi i32 [ %293, %295 ], [ %226, %262 ]
  %265 = phi i32 [ %273, %295 ], [ %212, %262 ]
  %266 = phi i32 [ %267, %295 ], [ %206, %262 ]
  %267 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %266) #12, !srcloc !66
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %269, label %271

269:                                              ; preds = %263
  %270 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %271

271:                                              ; preds = %269, %263
  %272 = phi i32 [ %270, %269 ], [ %265, %263 ]
  %273 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %272)
  %274 = icmp eq i32 %273, 65792
  br i1 %274, label %275, label %281

275:                                              ; preds = %271
  br i1 %268, label %276, label %296

276:                                              ; preds = %275
  %277 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %278 = inttoptr i64 %277 to i8 addrspace(1)*
  %279 = addrspacecast i8 addrspace(1)* %278 to i8*
  %280 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %279, i64 noundef %244, i64 noundef 0) #12
  br label %296

281:                                              ; preds = %271
  br i1 %268, label %282, label %291

282:                                              ; preds = %281
  %283 = add i32 %273, -256
  %284 = lshr i32 %283, 8
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %285, i32 0
  %287 = cmpxchg i64 addrspace(1)* %286, i64 0, i64 %244 syncscope("agent-one-as") monotonic monotonic, align 8
  %288 = extractvalue { i64, i1 } %287, 1
  br i1 %288, label %289, label %291

289:                                              ; preds = %282
  %290 = atomicrmw add i32 addrspace(1)* %48, i32 256 syncscope("agent-one-as") release, align 4
  br label %291

291:                                              ; preds = %289, %282, %281
  %292 = phi i32 [ %264, %281 ], [ 0, %289 ], [ %264, %282 ]
  %293 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %292)
  %294 = icmp eq i32 %293, 0
  br i1 %294, label %296, label %295

295:                                              ; preds = %291
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %263

296:                                              ; preds = %291, %276, %275, %235, %224, %210
  %297 = phi i32 [ 2, %210 ], [ 1, %224 ], [ %226, %235 ], [ %264, %276 ], [ %264, %275 ], [ 0, %291 ]
  %298 = icmp eq i32 %297, 0
  br i1 %298, label %372, label %299

299:                                              ; preds = %296
  %300 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %301 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %302 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %301, i32 0)
  %303 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %300, i32 %302)
  %304 = icmp eq i32 %303, 0
  br i1 %304, label %305, label %369

305:                                              ; preds = %299
  %306 = load atomic i64, i64 addrspace(1)* %49 syncscope("agent-one-as") monotonic, align 8
  %307 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %308 = sub i64 %307, %306
  %309 = icmp ult i64 %308, 30000
  br i1 %309, label %310, label %369

310:                                              ; preds = %305
  %311 = trunc i64 %308 to i32
  %312 = sub nuw nsw i32 30000, %311
  %313 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %314 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %312)
  %315 = sext i32 %314 to i64
  %316 = add i64 %313, %315
  %317 = add i64 %313, 1625
  %318 = icmp ugt i64 %316, %317
  br i1 %318, label %323, label %319

319:                                              ; preds = %323, %310
  %320 = phi i64 [ %313, %310 ], [ %324, %323 ]
  %321 = add i64 %320, 806
  %322 = icmp ugt i64 %316, %321
  br i1 %322, label %331, label %327

323:                                              ; preds = %310, %323
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %324 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %325 = add i64 %324, 1625
  %326 = icmp ugt i64 %316, %325
  br i1 %326, label %323, label %319

327:                                              ; preds = %331, %319
  %328 = phi i64 [ %320, %319 ], [ %332, %331 ]
  %329 = add i64 %328, 396
  %330 = icmp ugt i64 %316, %329
  br i1 %330, label %335, label %339

331:                                              ; preds = %319, %331
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %332 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %333 = add i64 %332, 806
  %334 = icmp ugt i64 %316, %333
  br i1 %334, label %331, label %327

335:                                              ; preds = %327, %335
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %336 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %337 = add i64 %336, 396
  %338 = icmp ugt i64 %316, %337
  br i1 %338, label %335, label %339

339:                                              ; preds = %335, %327
  %340 = phi i64 [ %328, %327 ], [ %336, %335 ]
  %341 = add i64 %340, 192
  %342 = icmp ugt i64 %316, %341
  br i1 %342, label %347, label %343

343:                                              ; preds = %347, %339
  %344 = phi i64 [ %340, %339 ], [ %348, %347 ]
  %345 = add i64 %344, 89
  %346 = icmp ugt i64 %316, %345
  br i1 %346, label %355, label %351

347:                                              ; preds = %339, %347
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %348 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %349 = add i64 %348, 192
  %350 = icmp ugt i64 %316, %349
  br i1 %350, label %347, label %343

351:                                              ; preds = %355, %343
  %352 = phi i64 [ %344, %343 ], [ %356, %355 ]
  %353 = add i64 %352, 38
  %354 = icmp ugt i64 %316, %353
  br i1 %354, label %362, label %359

355:                                              ; preds = %343, %355
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %356 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %357 = add i64 %356, 89
  %358 = icmp ugt i64 %316, %357
  br i1 %358, label %355, label %351

359:                                              ; preds = %362, %351
  %360 = phi i64 [ %352, %351 ], [ %363, %362 ]
  %361 = icmp ugt i64 %316, %360
  br i1 %361, label %366, label %369

362:                                              ; preds = %351, %362
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %363 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %364 = add i64 %363, 38
  %365 = icmp ugt i64 %316, %364
  br i1 %365, label %362, label %359

366:                                              ; preds = %359, %366
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %367 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %368 = icmp ugt i64 %316, %367
  br i1 %368, label %366, label %369

369:                                              ; preds = %366, %359, %305, %299
  %370 = icmp eq i32 %297, 2
  %371 = select i1 %370, %3 addrspace(1)* null, %3 addrspace(1)* inttoptr (i64 1 to %3 addrspace(1)*)
  br label %372

372:                                              ; preds = %369, %296
  %373 = phi %3 addrspace(1)* [ %371, %369 ], [ %182, %296 ]
  br i1 %298, label %374, label %548

374:                                              ; preds = %372, %197
  %375 = phi %3 addrspace(1)* [ %373, %372 ], [ %182, %197 ]
  br i1 %184, label %376, label %385

376:                                              ; preds = %374
  %377 = load atomic i64, i64 addrspace(1)* %50 syncscope("agent-one-as") monotonic, align 8
  %378 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %379 = sub i64 %378, %377
  %380 = icmp ugt i64 %379, 19999
  br i1 %380, label %381, label %385

381:                                              ; preds = %376
  %382 = cmpxchg i64 addrspace(1)* %50, i64 %377, i64 %378 syncscope("agent-one-as") monotonic monotonic, align 8
  %383 = extractvalue { i64, i1 } %382, 1
  %384 = select i1 %383, i8 addrspace(1)* null, i8 addrspace(1)* inttoptr (i64 1 to i8 addrspace(1)*)
  br label %385

385:                                              ; preds = %381, %376, %374
  %386 = phi i8 addrspace(1)* [ inttoptr (i64 1 to i8 addrspace(1)*), %374 ], [ inttoptr (i64 1 to i8 addrspace(1)*), %376 ], [ %384, %381 ]
  %387 = ptrtoint i8 addrspace(1)* %386 to i64
  %388 = trunc i64 %387 to i32
  %389 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %388)
  %390 = insertelement <2 x i32> undef, i32 %389, i64 0
  %391 = lshr i64 %387, 32
  %392 = trunc i64 %391 to i32
  %393 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %392)
  %394 = insertelement <2 x i32> %390, i32 %393, i64 1
  %395 = bitcast <2 x i32> %394 to i64
  %396 = icmp eq i64 %395, 0
  br i1 %396, label %399, label %397

397:                                              ; preds = %385
  %398 = inttoptr i64 %395 to %3 addrspace(1)*
  br label %548

399:                                              ; preds = %385
  br i1 %184, label %400, label %413

400:                                              ; preds = %399
  %401 = load atomic i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6) syncscope("agent-one-as") monotonic, align 8
  %402 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !68
  %403 = icmp ult i64 %401, %402
  br i1 %403, label %404, label %407

404:                                              ; preds = %400
  %405 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %406 = icmp ult i64 %405, %402
  br i1 %406, label %413, label %407

407:                                              ; preds = %404, %400
  %408 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %409 = inttoptr i64 %408 to i8 addrspace(1)*
  %410 = addrspacecast i8 addrspace(1)* %409 to i8*
  %411 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %410, i64 noundef 0, i64 noundef 2097152) #12
  %412 = extractelement <2 x i64> %411, i64 0
  br label %413

413:                                              ; preds = %407, %404, %399
  %414 = phi i64 [ 0, %399 ], [ %412, %407 ], [ %405, %404 ]
  %415 = trunc i64 %414 to i32
  %416 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %415)
  %417 = insertelement <2 x i32> undef, i32 %416, i64 0
  %418 = lshr i64 %414, 32
  %419 = trunc i64 %418 to i32
  %420 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %419)
  %421 = insertelement <2 x i32> %417, i32 %420, i64 1
  %422 = bitcast <2 x i32> %421 to i64
  %423 = icmp eq i64 %422, 0
  br i1 %423, label %548, label %424

424:                                              ; preds = %413
  %425 = inttoptr i64 %422 to %5 addrspace(1)*
  %426 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %427 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %428 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %427, i32 0)
  %429 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %426, i32 %428)
  %430 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %429) #12, !srcloc !66
  %431 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %432 = tail call i64 @llvm.ctpop.i64(i64 %431), !range !38
  %433 = trunc i64 %432 to i32
  %434 = load i32, i32 addrspace(4)* %51, align 4, !tbaa !70
  %435 = load i32, i32 addrspace(4)* %52, align 4, !tbaa !71
  %436 = add i32 %435, 31
  %437 = lshr i32 %436, 5
  br i1 %55, label %461, label %438

438:                                              ; preds = %424
  %439 = icmp ult i32 %430, %437
  br i1 %439, label %446, label %440

440:                                              ; preds = %446, %438
  %441 = mul i32 %434, %433
  %442 = load i32, i32 addrspace(4)* %56, align 4, !tbaa !72
  %443 = mul i32 %434, %430
  %444 = add i32 %442, %443
  %445 = icmp ult i32 %444, %435
  br i1 %445, label %452, label %470

446:                                              ; preds = %438, %446
  %447 = phi i32 [ %450, %446 ], [ %430, %438 ]
  %448 = zext i32 %447 to i64
  %449 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %448
  store i32 0, i32 addrspace(1)* %449, align 4, !tbaa !49
  %450 = add i32 %447, %433
  %451 = icmp ult i32 %450, %437
  br i1 %451, label %446, label %440

452:                                              ; preds = %440, %452
  %453 = phi i32 [ %459, %452 ], [ %444, %440 ]
  %454 = and i32 %453, 31
  %455 = shl nuw i32 1, %454
  %456 = lshr i32 %453, 5
  %457 = zext i32 %456 to i64
  %458 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %457
  store i32 %455, i32 addrspace(1)* %458, align 4, !tbaa !49
  %459 = add i32 %453, %441
  %460 = icmp ult i32 %459, %435
  br i1 %460, label %452, label %470

461:                                              ; preds = %424
  %462 = load i32, i32 addrspace(4)* %57, align 4, !tbaa !73
  %463 = icmp ult i32 %430, %437
  br i1 %463, label %464, label %470

464:                                              ; preds = %461, %464
  %465 = phi i32 [ %468, %464 ], [ %430, %461 ]
  %466 = zext i32 %465 to i64
  %467 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %466
  store i32 %462, i32 addrspace(1)* %467, align 4, !tbaa !49
  %468 = add i32 %465, %433
  %469 = icmp ult i32 %468, %437
  br i1 %469, label %464, label %470

470:                                              ; preds = %452, %464, %461, %440
  %471 = icmp eq i32 %430, 0
  br i1 %471, label %472, label %483

472:                                              ; preds = %470
  br i1 %58, label %481, label %473

473:                                              ; preds = %472
  %474 = and i32 %435, 31
  %475 = shl nsw i32 -1, %474
  %476 = add nsw i32 %437, -1
  %477 = zext i32 %476 to i64
  %478 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 4, i64 %477
  %479 = load i32, i32 addrspace(1)* %478, align 4, !tbaa !49
  %480 = or i32 %479, %475
  store i32 %480, i32 addrspace(1)* %478, align 4, !tbaa !49
  br label %481

481:                                              ; preds = %473, %472
  %482 = inttoptr i64 %422 to <4 x i32> addrspace(1)*
  store <4 x i32> %59, <4 x i32> addrspace(1)* %482, align 16, !tbaa !64
  br label %483

483:                                              ; preds = %481, %470
  %484 = getelementptr inbounds %5, %5 addrspace(1)* %425, i64 0, i32 1
  br label %485

485:                                              ; preds = %547, %483
  %486 = phi i32 [ %199, %483 ], [ %502, %547 ]
  %487 = phi i32 [ %189, %483 ], [ %495, %547 ]
  %488 = phi i32 [ %183, %483 ], [ %489, %547 ]
  %489 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %488) #12, !srcloc !66
  %490 = icmp eq i32 %489, 0
  br i1 %490, label %491, label %493

491:                                              ; preds = %485
  %492 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %493

493:                                              ; preds = %491, %485
  %494 = phi i32 [ %492, %491 ], [ %487, %485 ]
  %495 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %494)
  %496 = icmp eq i32 %495, 65792
  br i1 %496, label %548, label %497

497:                                              ; preds = %493
  br i1 %490, label %498, label %500

498:                                              ; preds = %497
  %499 = load atomic i32, i32 addrspace(1)* %48 syncscope("agent-one-as") monotonic, align 8
  br label %500

500:                                              ; preds = %498, %497
  %501 = phi i32 [ %499, %498 ], [ %486, %497 ]
  %502 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %501)
  %503 = icmp eq i32 %495, %502
  br i1 %503, label %504, label %510

504:                                              ; preds = %500
  br i1 %490, label %505, label %548

505:                                              ; preds = %504
  %506 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %507 = inttoptr i64 %506 to i8 addrspace(1)*
  %508 = addrspacecast i8 addrspace(1)* %507 to i8*
  %509 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %508, i64 noundef %422, i64 noundef 0) #12
  br label %548

510:                                              ; preds = %500
  br i1 %490, label %511, label %533

511:                                              ; preds = %510
  %512 = icmp ugt i32 %495, 255
  br i1 %512, label %513, label %523

513:                                              ; preds = %511
  %514 = add i32 %495, -256
  %515 = lshr i32 %514, 8
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %516, i32 0
  %518 = load atomic i64, i64 addrspace(1)* %517 syncscope("agent-one-as") monotonic, align 8
  %519 = inttoptr i64 %518 to %3 addrspace(1)*
  %520 = and i32 %495, 255
  %521 = zext i32 %520 to i64
  %522 = getelementptr inbounds %3, %3 addrspace(1)* %519, i64 %521
  br label %526

523:                                              ; preds = %511
  %524 = zext i32 %495 to i64
  %525 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %44, i64 %524
  br label %526

526:                                              ; preds = %523, %513
  %527 = phi %3 addrspace(1)* [ %522, %513 ], [ %525, %523 ]
  store i32 %495, i32 addrspace(1)* %484, align 4, !tbaa !42
  %528 = getelementptr inbounds %3, %3 addrspace(1)* %527, i64 0, i32 1
  %529 = cmpxchg i64 addrspace(1)* %528, i64 0, i64 %422 syncscope("agent-one-as") monotonic monotonic, align 8
  %530 = extractvalue { i64, i1 } %529, 1
  br i1 %530, label %531, label %533

531:                                              ; preds = %526
  %532 = atomicrmw add i32 addrspace(1)* %45, i32 1 syncscope("agent-one-as") release, align 4
  br label %533

533:                                              ; preds = %531, %526, %510
  %534 = phi %3 addrspace(1)* [ null, %510 ], [ %527, %531 ], [ null, %526 ]
  %535 = ptrtoint %3 addrspace(1)* %534 to i64
  %536 = trunc i64 %535 to i32
  %537 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %536)
  %538 = insertelement <2 x i32> undef, i32 %537, i64 0
  %539 = lshr i64 %535, 32
  %540 = trunc i64 %539 to i32
  %541 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %540)
  %542 = insertelement <2 x i32> %538, i32 %541, i64 1
  %543 = bitcast <2 x i32> %542 to i64
  %544 = icmp eq i64 %543, 0
  br i1 %544, label %547, label %545

545:                                              ; preds = %533
  %546 = inttoptr i64 %543 to %3 addrspace(1)*
  br label %548

547:                                              ; preds = %533
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %485

548:                                              ; preds = %493, %545, %505, %504, %413, %397, %372, %187
  %549 = phi i1 [ false, %397 ], [ true, %505 ], [ true, %504 ], [ false, %413 ], [ false, %545 ], [ false, %187 ], [ false, %372 ], [ false, %493 ]
  %550 = phi i32 [ %183, %397 ], [ 0, %505 ], [ %489, %504 ], [ %183, %413 ], [ %489, %545 ], [ %183, %187 ], [ %183, %372 ], [ %489, %493 ]
  %551 = phi %3 addrspace(1)* [ %398, %397 ], [ %375, %505 ], [ %375, %504 ], [ null, %413 ], [ %546, %545 ], [ null, %187 ], [ %373, %372 ], [ null, %493 ]
  br i1 %549, label %180, label %552

552:                                              ; preds = %548
  %553 = icmp eq %3 addrspace(1)* %551, inttoptr (i64 1 to %3 addrspace(1)*)
  br i1 %553, label %554, label %631

554:                                              ; preds = %552
  %555 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %556 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %557 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %556, i32 0)
  %558 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %555, i32 %557)
  %559 = icmp eq i32 %558, 0
  br i1 %559, label %560, label %624

560:                                              ; preds = %554
  %561 = load atomic i64, i64 addrspace(1)* %50 syncscope("agent-one-as") monotonic, align 8
  %562 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %563 = sub i64 %562, %561
  %564 = icmp ult i64 %563, 20000
  br i1 %564, label %565, label %624

565:                                              ; preds = %560
  %566 = trunc i64 %563 to i32
  %567 = sub nuw nsw i32 20000, %566
  %568 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %569 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %567)
  %570 = sext i32 %569 to i64
  %571 = add i64 %568, %570
  %572 = add i64 %568, 1625
  %573 = icmp ugt i64 %571, %572
  br i1 %573, label %578, label %574

574:                                              ; preds = %578, %565
  %575 = phi i64 [ %568, %565 ], [ %579, %578 ]
  %576 = add i64 %575, 806
  %577 = icmp ugt i64 %571, %576
  br i1 %577, label %586, label %582

578:                                              ; preds = %565, %578
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %579 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %580 = add i64 %579, 1625
  %581 = icmp ugt i64 %571, %580
  br i1 %581, label %578, label %574

582:                                              ; preds = %586, %574
  %583 = phi i64 [ %575, %574 ], [ %587, %586 ]
  %584 = add i64 %583, 396
  %585 = icmp ugt i64 %571, %584
  br i1 %585, label %590, label %594

586:                                              ; preds = %574, %586
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %587 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %588 = add i64 %587, 806
  %589 = icmp ugt i64 %571, %588
  br i1 %589, label %586, label %582

590:                                              ; preds = %582, %590
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %591 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %592 = add i64 %591, 396
  %593 = icmp ugt i64 %571, %592
  br i1 %593, label %590, label %594

594:                                              ; preds = %590, %582
  %595 = phi i64 [ %583, %582 ], [ %591, %590 ]
  %596 = add i64 %595, 192
  %597 = icmp ugt i64 %571, %596
  br i1 %597, label %602, label %598

598:                                              ; preds = %602, %594
  %599 = phi i64 [ %595, %594 ], [ %603, %602 ]
  %600 = add i64 %599, 89
  %601 = icmp ugt i64 %571, %600
  br i1 %601, label %610, label %606

602:                                              ; preds = %594, %602
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %603 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %604 = add i64 %603, 192
  %605 = icmp ugt i64 %571, %604
  br i1 %605, label %602, label %598

606:                                              ; preds = %610, %598
  %607 = phi i64 [ %599, %598 ], [ %611, %610 ]
  %608 = add i64 %607, 38
  %609 = icmp ugt i64 %571, %608
  br i1 %609, label %617, label %614

610:                                              ; preds = %598, %610
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %611 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %612 = add i64 %611, 89
  %613 = icmp ugt i64 %571, %612
  br i1 %613, label %610, label %606

614:                                              ; preds = %617, %606
  %615 = phi i64 [ %607, %606 ], [ %618, %617 ]
  %616 = icmp ugt i64 %571, %615
  br i1 %616, label %621, label %624

617:                                              ; preds = %606, %617
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %618 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %619 = add i64 %618, 38
  %620 = icmp ugt i64 %571, %619
  br i1 %620, label %617, label %614

621:                                              ; preds = %614, %621
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %622 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %623 = icmp ugt i64 %571, %622
  br i1 %623, label %621, label %624

624:                                              ; preds = %621, %614, %560, %554
  %625 = icmp eq i32 %102, 0
  br i1 %625, label %626, label %628

626:                                              ; preds = %624
  %627 = load atomic i32, i32 addrspace(1)* %45 syncscope("agent-one-as") monotonic, align 8
  br label %628

628:                                              ; preds = %626, %624
  %629 = phi i32 [ %627, %626 ], [ %100, %624 ]
  %630 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %629)
  br label %631

631:                                              ; preds = %628, %552
  %632 = phi i32 [ %630, %628 ], [ %100, %552 ]
  %633 = phi %3 addrspace(1)* [ %175, %628 ], [ %551, %552 ]
  br i1 %553, label %98, label %1299

634:                                              ; preds = %86
  %635 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %636 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %637 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %636, i32 0)
  %638 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %635, i32 %637)
  %639 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %640 = tail call i64 @llvm.ctpop.i64(i64 %639), !range !38
  %641 = trunc i64 %640 to i32
  br label %642

642:                                              ; preds = %1295, %634
  %643 = phi i32 [ %43, %634 ], [ %1297, %1295 ]
  %644 = phi i32 [ %638, %634 ], [ %646, %1295 ]
  %645 = phi %3 addrspace(1)* [ undef, %634 ], [ %1298, %1295 ]
  %646 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %644) #12, !srcloc !66
  %647 = zext i32 %643 to i64
  %648 = icmp eq i32 %646, 0
  br i1 %648, label %649, label %652

649:                                              ; preds = %642
  %650 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %647, i32 0
  %651 = load atomic i32, i32 addrspace(1)* %650 syncscope("agent-one-as") monotonic, align 8
  br label %652

652:                                              ; preds = %649, %642
  %653 = phi i32 [ %651, %649 ], [ 0, %642 ]
  %654 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %653)
  %655 = add i32 %654, %646
  %656 = urem i32 %655, 65792
  %657 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %647, i32 1
  %658 = load i32, i32 addrspace(4)* %657, align 4, !tbaa !74
  %659 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %647, i32 0
  br label %660

660:                                              ; preds = %718, %652
  %661 = phi i32 [ %656, %652 ], [ %715, %718 ]
  %662 = phi i32 [ 65792, %652 ], [ %716, %718 ]
  %663 = phi %3 addrspace(1)* [ %645, %652 ], [ %717, %718 ]
  %664 = icmp ugt i32 %661, 255
  br i1 %664, label %665, label %675

665:                                              ; preds = %660
  %666 = add i32 %661, -256
  %667 = lshr i32 %666, 8
  %668 = zext i32 %667 to i64
  %669 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %668, i32 0
  %670 = load atomic i64, i64 addrspace(1)* %669 syncscope("agent-one-as") monotonic, align 8
  %671 = inttoptr i64 %670 to %3 addrspace(1)*
  %672 = and i32 %661, 255
  %673 = zext i32 %672 to i64
  %674 = getelementptr inbounds %3, %3 addrspace(1)* %671, i64 %673
  br label %678

675:                                              ; preds = %660
  %676 = zext i32 %661 to i64
  %677 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %676
  br label %678

678:                                              ; preds = %675, %665
  %679 = phi %3 addrspace(1)* [ %674, %665 ], [ %677, %675 ]
  %680 = getelementptr inbounds %3, %3 addrspace(1)* %679, i64 0, i32 2
  %681 = load atomic i32, i32 addrspace(1)* %680 syncscope("agent-one-as") monotonic, align 8
  %682 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %681, i32 %658, i32 36)
  %683 = icmp eq i64 %682, 0
  br i1 %683, label %689, label %684

684:                                              ; preds = %678
  %685 = tail call i64 @llvm.cttz.i64(i64 %682, i1 true), !range !38
  %686 = trunc i64 %685 to i32
  %687 = shl nuw nsw i32 %686, 2
  %688 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %687, i32 %661)
  br label %689

689:                                              ; preds = %684, %678
  %690 = phi i32 [ %688, %684 ], [ -1, %678 ]
  %691 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %690)
  %692 = icmp eq i32 %691, -1
  br i1 %692, label %708, label %693

693:                                              ; preds = %689
  %694 = icmp ugt i32 %691, 255
  br i1 %694, label %695, label %705

695:                                              ; preds = %693
  %696 = add i32 %691, -256
  %697 = lshr i32 %696, 8
  %698 = zext i32 %697 to i64
  %699 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %698, i32 0
  %700 = load atomic i64, i64 addrspace(1)* %699 syncscope("agent-one-as") monotonic, align 8
  %701 = inttoptr i64 %700 to %3 addrspace(1)*
  %702 = and i32 %691, 255
  %703 = zext i32 %702 to i64
  %704 = getelementptr inbounds %3, %3 addrspace(1)* %701, i64 %703
  br label %714

705:                                              ; preds = %693
  %706 = zext i32 %691 to i64
  %707 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %647, i64 %706
  br label %714

708:                                              ; preds = %689
  %709 = add i32 %661, %641
  %710 = urem i32 %709, 65792
  br i1 %648, label %711, label %712

711:                                              ; preds = %708
  store atomic i32 %710, i32 addrspace(1)* %659 syncscope("agent-one-as") monotonic, align 8
  br label %712

712:                                              ; preds = %711, %708
  %713 = sub i32 %662, %641
  br label %714

714:                                              ; preds = %712, %705, %695
  %715 = phi i32 [ %710, %712 ], [ %661, %695 ], [ %661, %705 ]
  %716 = phi i32 [ %713, %712 ], [ %662, %695 ], [ %662, %705 ]
  %717 = phi %3 addrspace(1)* [ %663, %712 ], [ %704, %695 ], [ %707, %705 ]
  br i1 %692, label %718, label %1295

718:                                              ; preds = %714
  %719 = icmp sgt i32 %716, 0
  br i1 %719, label %660, label %720

720:                                              ; preds = %718
  %721 = and i32 %643, -2
  %722 = add i32 %721, 2
  %723 = icmp ne i32 %643, %43
  %724 = icmp ugt i32 %722, 15
  %725 = select i1 %723, i1 true, i1 %724
  br i1 %725, label %1295, label %726

726:                                              ; preds = %720
  br i1 %648, label %727, label %731

727:                                              ; preds = %726
  %728 = zext i32 %722 to i64
  %729 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %728, i32 0
  %730 = load atomic i32, i32 addrspace(1)* %729 syncscope("agent-one-as") monotonic, align 8
  br label %731

731:                                              ; preds = %727, %726
  %732 = phi i32 [ %730, %727 ], [ 0, %726 ]
  %733 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %732)
  %734 = icmp ult i32 %733, 65792
  br i1 %734, label %735, label %1295

735:                                              ; preds = %731
  %736 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %737 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %738 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %737, i32 0)
  %739 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %736, i32 %738)
  %740 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %741 = tail call i64 @llvm.ctpop.i64(i64 %740), !range !38
  %742 = trunc i64 %741 to i32
  %743 = zext i32 %722 to i64
  %744 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 0, i64 %743, i32 0
  %745 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 2
  %746 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 1, i64 %743, i32 0
  %747 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 2, i64 %743, i32 0
  %748 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 4, i64 %743, i32 0
  %749 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 3, i64 %743, i32 0
  %750 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 5
  %751 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 0
  %752 = lshr i64 191, %743
  %753 = and i64 %752, 1
  %754 = icmp eq i64 %753, 0
  %755 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 4
  %756 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %743, i32 6
  %757 = icmp eq i32 %721, 0
  %758 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %722, i64 0
  br label %759

759:                                              ; preds = %1292, %735
  %760 = phi i32 [ %739, %735 ], [ %763, %1292 ]
  %761 = phi i32 [ %733, %735 ], [ %1293, %1292 ]
  %762 = phi %3 addrspace(1)* [ undef, %735 ], [ %1294, %1292 ]
  %763 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %760) #12, !srcloc !66
  %764 = icmp eq i32 %761, 0
  br i1 %764, label %835, label %765

765:                                              ; preds = %759
  %766 = icmp eq i32 %763, 0
  br i1 %766, label %767, label %769

767:                                              ; preds = %765
  %768 = load atomic i32, i32 addrspace(1)* %744 syncscope("agent-one-as") monotonic, align 8
  br label %769

769:                                              ; preds = %767, %765
  %770 = phi i32 [ %768, %767 ], [ 0, %765 ]
  %771 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %770)
  %772 = add i32 %771, %763
  %773 = urem i32 %772, %761
  %774 = load i32, i32 addrspace(4)* %745, align 4, !tbaa !67
  br label %775

775:                                              ; preds = %833, %769
  %776 = phi i32 [ %773, %769 ], [ %830, %833 ]
  %777 = phi i32 [ %761, %769 ], [ %831, %833 ]
  %778 = phi %3 addrspace(1)* [ %762, %769 ], [ %832, %833 ]
  %779 = icmp ugt i32 %776, 255
  br i1 %779, label %780, label %790

780:                                              ; preds = %775
  %781 = add i32 %776, -256
  %782 = lshr i32 %781, 8
  %783 = zext i32 %782 to i64
  %784 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %783, i32 0
  %785 = load atomic i64, i64 addrspace(1)* %784 syncscope("agent-one-as") monotonic, align 8
  %786 = inttoptr i64 %785 to %3 addrspace(1)*
  %787 = and i32 %776, 255
  %788 = zext i32 %787 to i64
  %789 = getelementptr inbounds %3, %3 addrspace(1)* %786, i64 %788
  br label %793

790:                                              ; preds = %775
  %791 = zext i32 %776 to i64
  %792 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %791
  br label %793

793:                                              ; preds = %790, %780
  %794 = phi %3 addrspace(1)* [ %789, %780 ], [ %792, %790 ]
  %795 = getelementptr inbounds %3, %3 addrspace(1)* %794, i64 0, i32 2
  %796 = load atomic i32, i32 addrspace(1)* %795 syncscope("agent-one-as") monotonic, align 8
  %797 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 %796, i32 %774, i32 36)
  %798 = icmp eq i64 %797, 0
  br i1 %798, label %804, label %799

799:                                              ; preds = %793
  %800 = tail call i64 @llvm.cttz.i64(i64 %797, i1 true), !range !38
  %801 = trunc i64 %800 to i32
  %802 = shl nuw nsw i32 %801, 2
  %803 = tail call i32 @llvm.amdgcn.ds.bpermute(i32 %802, i32 %776)
  br label %804

804:                                              ; preds = %799, %793
  %805 = phi i32 [ %803, %799 ], [ -1, %793 ]
  %806 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %805)
  %807 = icmp eq i32 %806, -1
  br i1 %807, label %823, label %808

808:                                              ; preds = %804
  %809 = icmp ugt i32 %806, 255
  br i1 %809, label %810, label %820

810:                                              ; preds = %808
  %811 = add i32 %806, -256
  %812 = lshr i32 %811, 8
  %813 = zext i32 %812 to i64
  %814 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %813, i32 0
  %815 = load atomic i64, i64 addrspace(1)* %814 syncscope("agent-one-as") monotonic, align 8
  %816 = inttoptr i64 %815 to %3 addrspace(1)*
  %817 = and i32 %806, 255
  %818 = zext i32 %817 to i64
  %819 = getelementptr inbounds %3, %3 addrspace(1)* %816, i64 %818
  br label %829

820:                                              ; preds = %808
  %821 = zext i32 %806 to i64
  %822 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %821
  br label %829

823:                                              ; preds = %804
  %824 = add i32 %776, %742
  %825 = urem i32 %824, %761
  br i1 %766, label %826, label %827

826:                                              ; preds = %823
  store atomic i32 %825, i32 addrspace(1)* %744 syncscope("agent-one-as") monotonic, align 8
  br label %827

827:                                              ; preds = %826, %823
  %828 = sub i32 %777, %742
  br label %829

829:                                              ; preds = %827, %820, %810
  %830 = phi i32 [ %825, %827 ], [ %776, %810 ], [ %776, %820 ]
  %831 = phi i32 [ %828, %827 ], [ %777, %810 ], [ %777, %820 ]
  %832 = phi %3 addrspace(1)* [ %778, %827 ], [ %819, %810 ], [ %822, %820 ]
  br i1 %807, label %833, label %1295

833:                                              ; preds = %829
  %834 = icmp sgt i32 %831, 0
  br i1 %834, label %775, label %835

835:                                              ; preds = %833, %759
  %836 = phi %3 addrspace(1)* [ %762, %759 ], [ %832, %833 ]
  %837 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %838 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %839 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %838, i32 0)
  %840 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %837, i32 %839)
  br label %841

841:                                              ; preds = %1209, %835
  %842 = phi i32 [ %840, %835 ], [ %1211, %1209 ]
  %843 = phi %3 addrspace(1)* [ undef, %835 ], [ %1212, %1209 ]
  %844 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %842) #12, !srcloc !66
  %845 = icmp eq i32 %844, 0
  br i1 %845, label %846, label %848

846:                                              ; preds = %841
  %847 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %848

848:                                              ; preds = %846, %841
  %849 = phi i32 [ %847, %846 ], [ 0, %841 ]
  %850 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %849)
  %851 = icmp eq i32 %850, 65792
  br i1 %851, label %1209, label %852

852:                                              ; preds = %848
  br i1 %845, label %853, label %858

853:                                              ; preds = %852
  %854 = cmpxchg i32 addrspace(1)* %747, i32 0, i32 256 syncscope("agent-one-as") monotonic monotonic, align 4
  %855 = extractvalue { i32, i1 } %854, 1
  %856 = extractvalue { i32, i1 } %854, 0
  %857 = select i1 %855, i32 256, i32 %856
  br label %858

858:                                              ; preds = %853, %852
  %859 = phi i32 [ %857, %853 ], [ 0, %852 ]
  %860 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %859)
  %861 = icmp eq i32 %850, %860
  br i1 %861, label %862, label %1035

862:                                              ; preds = %858
  %863 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %864 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %865 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %864, i32 0)
  %866 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %863, i32 %865)
  %867 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %866) #12, !srcloc !66
  %868 = icmp eq i32 %867, 0
  br i1 %868, label %869, label %871

869:                                              ; preds = %862
  %870 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %871

871:                                              ; preds = %869, %862
  %872 = phi i32 [ %870, %869 ], [ 0, %862 ]
  %873 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %872)
  %874 = icmp eq i32 %873, 65792
  br i1 %874, label %957, label %875

875:                                              ; preds = %871
  br i1 %868, label %876, label %885

876:                                              ; preds = %875
  %877 = load atomic i64, i64 addrspace(1)* %748 syncscope("agent-one-as") monotonic, align 8
  %878 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %879 = sub i64 %878, %877
  %880 = icmp ugt i64 %879, 29999
  br i1 %880, label %881, label %885

881:                                              ; preds = %876
  %882 = cmpxchg i64 addrspace(1)* %748, i64 %877, i64 %878 syncscope("agent-one-as") monotonic monotonic, align 8
  %883 = extractvalue { i64, i1 } %882, 1
  %884 = select i1 %883, i32 2, i32 1
  br label %885

885:                                              ; preds = %881, %876, %875
  %886 = phi i32 [ 1, %875 ], [ 1, %876 ], [ %884, %881 ]
  %887 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %886)
  %888 = icmp eq i32 %887, 1
  br i1 %888, label %957, label %889

889:                                              ; preds = %885
  br i1 %868, label %890, label %896

890:                                              ; preds = %889
  %891 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %892 = inttoptr i64 %891 to i8 addrspace(1)*
  %893 = addrspacecast i8 addrspace(1)* %892 to i8*
  %894 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %893, i64 noundef 0, i64 noundef 6144) #12
  %895 = extractelement <2 x i64> %894, i64 0
  br label %896

896:                                              ; preds = %890, %889
  %897 = phi i64 [ %895, %890 ], [ 0, %889 ]
  %898 = trunc i64 %897 to i32
  %899 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %898)
  %900 = insertelement <2 x i32> undef, i32 %899, i64 0
  %901 = lshr i64 %897, 32
  %902 = trunc i64 %901 to i32
  %903 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %902)
  %904 = insertelement <2 x i32> %900, i32 %903, i64 1
  %905 = bitcast <2 x i32> %904 to i64
  %906 = icmp eq i64 %905, 0
  br i1 %906, label %957, label %907

907:                                              ; preds = %896
  %908 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %909 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %910 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %909, i32 0)
  %911 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %908, i32 %910)
  %912 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %913 = tail call i64 @llvm.ctpop.i64(i64 %912), !range !38
  %914 = trunc i64 %913 to i32
  %915 = inttoptr i64 %905 to i64 addrspace(1)*
  %916 = icmp ult i32 %911, 768
  br i1 %916, label %917, label %923

917:                                              ; preds = %907, %917
  %918 = phi i32 [ %921, %917 ], [ %911, %907 ]
  %919 = zext i32 %918 to i64
  %920 = getelementptr inbounds i64, i64 addrspace(1)* %915, i64 %919
  store i64 0, i64 addrspace(1)* %920, align 8, !tbaa !31
  %921 = add i32 %918, %914
  %922 = icmp ult i32 %921, 768
  br i1 %922, label %917, label %923

923:                                              ; preds = %917, %907
  br label %924

924:                                              ; preds = %923, %956
  %925 = phi i32 [ %954, %956 ], [ %887, %923 ]
  %926 = phi i32 [ %934, %956 ], [ %873, %923 ]
  %927 = phi i32 [ %928, %956 ], [ %867, %923 ]
  %928 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %927) #12, !srcloc !66
  %929 = icmp eq i32 %928, 0
  br i1 %929, label %930, label %932

930:                                              ; preds = %924
  %931 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %932

932:                                              ; preds = %930, %924
  %933 = phi i32 [ %931, %930 ], [ %926, %924 ]
  %934 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %933)
  %935 = icmp eq i32 %934, 65792
  br i1 %935, label %936, label %942

936:                                              ; preds = %932
  br i1 %929, label %937, label %957

937:                                              ; preds = %936
  %938 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %939 = inttoptr i64 %938 to i8 addrspace(1)*
  %940 = addrspacecast i8 addrspace(1)* %939 to i8*
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %940, i64 noundef %905, i64 noundef 0) #12
  br label %957

942:                                              ; preds = %932
  br i1 %929, label %943, label %952

943:                                              ; preds = %942
  %944 = add i32 %934, -256
  %945 = lshr i32 %944, 8
  %946 = zext i32 %945 to i64
  %947 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %946, i32 0
  %948 = cmpxchg i64 addrspace(1)* %947, i64 0, i64 %905 syncscope("agent-one-as") monotonic monotonic, align 8
  %949 = extractvalue { i64, i1 } %948, 1
  br i1 %949, label %950, label %952

950:                                              ; preds = %943
  %951 = atomicrmw add i32 addrspace(1)* %747, i32 256 syncscope("agent-one-as") release, align 4
  br label %952

952:                                              ; preds = %950, %943, %942
  %953 = phi i32 [ %925, %942 ], [ 0, %950 ], [ %925, %943 ]
  %954 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %953)
  %955 = icmp eq i32 %954, 0
  br i1 %955, label %957, label %956

956:                                              ; preds = %952
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %924

957:                                              ; preds = %952, %937, %936, %896, %885, %871
  %958 = phi i32 [ 2, %871 ], [ 1, %885 ], [ %887, %896 ], [ %925, %937 ], [ %925, %936 ], [ 0, %952 ]
  %959 = icmp eq i32 %958, 0
  br i1 %959, label %1033, label %960

960:                                              ; preds = %957
  %961 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %962 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %963 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %962, i32 0)
  %964 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %961, i32 %963)
  %965 = icmp eq i32 %964, 0
  br i1 %965, label %966, label %1030

966:                                              ; preds = %960
  %967 = load atomic i64, i64 addrspace(1)* %748 syncscope("agent-one-as") monotonic, align 8
  %968 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %969 = sub i64 %968, %967
  %970 = icmp ult i64 %969, 30000
  br i1 %970, label %971, label %1030

971:                                              ; preds = %966
  %972 = trunc i64 %969 to i32
  %973 = sub nuw nsw i32 30000, %972
  %974 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %975 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %973)
  %976 = sext i32 %975 to i64
  %977 = add i64 %974, %976
  %978 = add i64 %974, 1625
  %979 = icmp ugt i64 %977, %978
  br i1 %979, label %984, label %980

980:                                              ; preds = %984, %971
  %981 = phi i64 [ %974, %971 ], [ %985, %984 ]
  %982 = add i64 %981, 806
  %983 = icmp ugt i64 %977, %982
  br i1 %983, label %992, label %988

984:                                              ; preds = %971, %984
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %985 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %986 = add i64 %985, 1625
  %987 = icmp ugt i64 %977, %986
  br i1 %987, label %984, label %980

988:                                              ; preds = %992, %980
  %989 = phi i64 [ %981, %980 ], [ %993, %992 ]
  %990 = add i64 %989, 396
  %991 = icmp ugt i64 %977, %990
  br i1 %991, label %996, label %1000

992:                                              ; preds = %980, %992
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %993 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %994 = add i64 %993, 806
  %995 = icmp ugt i64 %977, %994
  br i1 %995, label %992, label %988

996:                                              ; preds = %988, %996
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %997 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %998 = add i64 %997, 396
  %999 = icmp ugt i64 %977, %998
  br i1 %999, label %996, label %1000

1000:                                             ; preds = %996, %988
  %1001 = phi i64 [ %989, %988 ], [ %997, %996 ]
  %1002 = add i64 %1001, 192
  %1003 = icmp ugt i64 %977, %1002
  br i1 %1003, label %1008, label %1004

1004:                                             ; preds = %1008, %1000
  %1005 = phi i64 [ %1001, %1000 ], [ %1009, %1008 ]
  %1006 = add i64 %1005, 89
  %1007 = icmp ugt i64 %977, %1006
  br i1 %1007, label %1016, label %1012

1008:                                             ; preds = %1000, %1008
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %1009 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1010 = add i64 %1009, 192
  %1011 = icmp ugt i64 %977, %1010
  br i1 %1011, label %1008, label %1004

1012:                                             ; preds = %1016, %1004
  %1013 = phi i64 [ %1005, %1004 ], [ %1017, %1016 ]
  %1014 = add i64 %1013, 38
  %1015 = icmp ugt i64 %977, %1014
  br i1 %1015, label %1023, label %1020

1016:                                             ; preds = %1004, %1016
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %1017 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1018 = add i64 %1017, 89
  %1019 = icmp ugt i64 %977, %1018
  br i1 %1019, label %1016, label %1012

1020:                                             ; preds = %1023, %1012
  %1021 = phi i64 [ %1013, %1012 ], [ %1024, %1023 ]
  %1022 = icmp ugt i64 %977, %1021
  br i1 %1022, label %1027, label %1030

1023:                                             ; preds = %1012, %1023
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %1024 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1025 = add i64 %1024, 38
  %1026 = icmp ugt i64 %977, %1025
  br i1 %1026, label %1023, label %1020

1027:                                             ; preds = %1020, %1027
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %1028 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1029 = icmp ugt i64 %977, %1028
  br i1 %1029, label %1027, label %1030

1030:                                             ; preds = %1027, %1020, %966, %960
  %1031 = icmp eq i32 %958, 2
  %1032 = select i1 %1031, %3 addrspace(1)* null, %3 addrspace(1)* inttoptr (i64 1 to %3 addrspace(1)*)
  br label %1033

1033:                                             ; preds = %1030, %957
  %1034 = phi %3 addrspace(1)* [ %1032, %1030 ], [ %843, %957 ]
  br i1 %959, label %1035, label %1209

1035:                                             ; preds = %1033, %858
  %1036 = phi %3 addrspace(1)* [ %1034, %1033 ], [ %843, %858 ]
  br i1 %845, label %1037, label %1046

1037:                                             ; preds = %1035
  %1038 = load atomic i64, i64 addrspace(1)* %749 syncscope("agent-one-as") monotonic, align 8
  %1039 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1040 = sub i64 %1039, %1038
  %1041 = icmp ugt i64 %1040, 19999
  br i1 %1041, label %1042, label %1046

1042:                                             ; preds = %1037
  %1043 = cmpxchg i64 addrspace(1)* %749, i64 %1038, i64 %1039 syncscope("agent-one-as") monotonic monotonic, align 8
  %1044 = extractvalue { i64, i1 } %1043, 1
  %1045 = select i1 %1044, i8 addrspace(1)* null, i8 addrspace(1)* inttoptr (i64 1 to i8 addrspace(1)*)
  br label %1046

1046:                                             ; preds = %1042, %1037, %1035
  %1047 = phi i8 addrspace(1)* [ inttoptr (i64 1 to i8 addrspace(1)*), %1035 ], [ inttoptr (i64 1 to i8 addrspace(1)*), %1037 ], [ %1045, %1042 ]
  %1048 = ptrtoint i8 addrspace(1)* %1047 to i64
  %1049 = trunc i64 %1048 to i32
  %1050 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1049)
  %1051 = insertelement <2 x i32> undef, i32 %1050, i64 0
  %1052 = lshr i64 %1048, 32
  %1053 = trunc i64 %1052 to i32
  %1054 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1053)
  %1055 = insertelement <2 x i32> %1051, i32 %1054, i64 1
  %1056 = bitcast <2 x i32> %1055 to i64
  %1057 = icmp eq i64 %1056, 0
  br i1 %1057, label %1060, label %1058

1058:                                             ; preds = %1046
  %1059 = inttoptr i64 %1056 to %3 addrspace(1)*
  br label %1209

1060:                                             ; preds = %1046
  br i1 %845, label %1061, label %1074

1061:                                             ; preds = %1060
  %1062 = load atomic i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6) syncscope("agent-one-as") monotonic, align 8
  %1063 = load i64, i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 7), align 8, !tbaa !68
  %1064 = icmp ult i64 %1062, %1063
  br i1 %1064, label %1065, label %1068

1065:                                             ; preds = %1061
  %1066 = atomicrmw add i64 addrspace(1)* getelementptr inbounds (%0, %0 addrspace(1)* @0, i64 0, i32 6), i64 2097152 syncscope("agent-one-as") monotonic, align 8
  %1067 = icmp ult i64 %1066, %1063
  br i1 %1067, label %1074, label %1068

1068:                                             ; preds = %1065, %1061
  %1069 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %1070 = inttoptr i64 %1069 to i8 addrspace(1)*
  %1071 = addrspacecast i8 addrspace(1)* %1070 to i8*
  %1072 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1071, i64 noundef 0, i64 noundef 2097152) #12
  %1073 = extractelement <2 x i64> %1072, i64 0
  br label %1074

1074:                                             ; preds = %1068, %1065, %1060
  %1075 = phi i64 [ 0, %1060 ], [ %1073, %1068 ], [ %1066, %1065 ]
  %1076 = trunc i64 %1075 to i32
  %1077 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1076)
  %1078 = insertelement <2 x i32> undef, i32 %1077, i64 0
  %1079 = lshr i64 %1075, 32
  %1080 = trunc i64 %1079 to i32
  %1081 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1080)
  %1082 = insertelement <2 x i32> %1078, i32 %1081, i64 1
  %1083 = bitcast <2 x i32> %1082 to i64
  %1084 = icmp eq i64 %1083, 0
  br i1 %1084, label %1209, label %1085

1085:                                             ; preds = %1074
  %1086 = inttoptr i64 %1083 to %5 addrspace(1)*
  %1087 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %1088 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %1089 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1088, i32 0)
  %1090 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1087, i32 %1089)
  %1091 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1090) #12, !srcloc !66
  %1092 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %1093 = tail call i64 @llvm.ctpop.i64(i64 %1092), !range !38
  %1094 = trunc i64 %1093 to i32
  %1095 = load i32, i32 addrspace(4)* %750, align 4, !tbaa !70
  %1096 = load i32, i32 addrspace(4)* %751, align 4, !tbaa !71
  %1097 = add i32 %1096, 31
  %1098 = lshr i32 %1097, 5
  br i1 %754, label %1122, label %1099

1099:                                             ; preds = %1085
  %1100 = icmp ult i32 %1091, %1098
  br i1 %1100, label %1107, label %1101

1101:                                             ; preds = %1107, %1099
  %1102 = mul i32 %1095, %1094
  %1103 = load i32, i32 addrspace(4)* %755, align 4, !tbaa !72
  %1104 = mul i32 %1095, %1091
  %1105 = add i32 %1103, %1104
  %1106 = icmp ult i32 %1105, %1096
  br i1 %1106, label %1113, label %1131

1107:                                             ; preds = %1099, %1107
  %1108 = phi i32 [ %1111, %1107 ], [ %1091, %1099 ]
  %1109 = zext i32 %1108 to i64
  %1110 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1109
  store i32 0, i32 addrspace(1)* %1110, align 4, !tbaa !49
  %1111 = add i32 %1108, %1094
  %1112 = icmp ult i32 %1111, %1098
  br i1 %1112, label %1107, label %1101

1113:                                             ; preds = %1101, %1113
  %1114 = phi i32 [ %1120, %1113 ], [ %1105, %1101 ]
  %1115 = and i32 %1114, 31
  %1116 = shl nuw i32 1, %1115
  %1117 = lshr i32 %1114, 5
  %1118 = zext i32 %1117 to i64
  %1119 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1118
  store i32 %1116, i32 addrspace(1)* %1119, align 4, !tbaa !49
  %1120 = add i32 %1114, %1102
  %1121 = icmp ult i32 %1120, %1096
  br i1 %1121, label %1113, label %1131

1122:                                             ; preds = %1085
  %1123 = load i32, i32 addrspace(4)* %756, align 4, !tbaa !73
  %1124 = icmp ult i32 %1091, %1098
  br i1 %1124, label %1125, label %1131

1125:                                             ; preds = %1122, %1125
  %1126 = phi i32 [ %1129, %1125 ], [ %1091, %1122 ]
  %1127 = zext i32 %1126 to i64
  %1128 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1127
  store i32 %1123, i32 addrspace(1)* %1128, align 4, !tbaa !49
  %1129 = add i32 %1126, %1094
  %1130 = icmp ult i32 %1129, %1098
  br i1 %1130, label %1125, label %1131

1131:                                             ; preds = %1113, %1125, %1122, %1101
  %1132 = icmp eq i32 %1091, 0
  br i1 %1132, label %1133, label %1144

1133:                                             ; preds = %1131
  br i1 %757, label %1142, label %1134

1134:                                             ; preds = %1133
  %1135 = and i32 %1096, 31
  %1136 = shl nsw i32 -1, %1135
  %1137 = add nsw i32 %1098, -1
  %1138 = zext i32 %1137 to i64
  %1139 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 4, i64 %1138
  %1140 = load i32, i32 addrspace(1)* %1139, align 4, !tbaa !49
  %1141 = or i32 %1140, %1136
  store i32 %1141, i32 addrspace(1)* %1139, align 4, !tbaa !49
  br label %1142

1142:                                             ; preds = %1134, %1133
  %1143 = inttoptr i64 %1083 to <4 x i32> addrspace(1)*
  store <4 x i32> %758, <4 x i32> addrspace(1)* %1143, align 16, !tbaa !64
  br label %1144

1144:                                             ; preds = %1142, %1131
  %1145 = getelementptr inbounds %5, %5 addrspace(1)* %1086, i64 0, i32 1
  br label %1146

1146:                                             ; preds = %1208, %1144
  %1147 = phi i32 [ %860, %1144 ], [ %1163, %1208 ]
  %1148 = phi i32 [ %850, %1144 ], [ %1156, %1208 ]
  %1149 = phi i32 [ %844, %1144 ], [ %1150, %1208 ]
  %1150 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1149) #12, !srcloc !66
  %1151 = icmp eq i32 %1150, 0
  br i1 %1151, label %1152, label %1154

1152:                                             ; preds = %1146
  %1153 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %1154

1154:                                             ; preds = %1152, %1146
  %1155 = phi i32 [ %1153, %1152 ], [ %1148, %1146 ]
  %1156 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1155)
  %1157 = icmp eq i32 %1156, 65792
  br i1 %1157, label %1209, label %1158

1158:                                             ; preds = %1154
  br i1 %1151, label %1159, label %1161

1159:                                             ; preds = %1158
  %1160 = load atomic i32, i32 addrspace(1)* %747 syncscope("agent-one-as") monotonic, align 8
  br label %1161

1161:                                             ; preds = %1159, %1158
  %1162 = phi i32 [ %1160, %1159 ], [ %1147, %1158 ]
  %1163 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1162)
  %1164 = icmp eq i32 %1156, %1163
  br i1 %1164, label %1165, label %1171

1165:                                             ; preds = %1161
  br i1 %1151, label %1166, label %1209

1166:                                             ; preds = %1165
  %1167 = load i64, i64 addrspace(4)* %62, align 8, !tbaa !31
  %1168 = inttoptr i64 %1167 to i8 addrspace(1)*
  %1169 = addrspacecast i8 addrspace(1)* %1168 to i8*
  %1170 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1169, i64 noundef %1083, i64 noundef 0) #12
  br label %1209

1171:                                             ; preds = %1161
  br i1 %1151, label %1172, label %1194

1172:                                             ; preds = %1171
  %1173 = icmp ugt i32 %1156, 255
  br i1 %1173, label %1174, label %1184

1174:                                             ; preds = %1172
  %1175 = add i32 %1156, -256
  %1176 = lshr i32 %1175, 8
  %1177 = zext i32 %1176 to i64
  %1178 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %1177, i32 0
  %1179 = load atomic i64, i64 addrspace(1)* %1178 syncscope("agent-one-as") monotonic, align 8
  %1180 = inttoptr i64 %1179 to %3 addrspace(1)*
  %1181 = and i32 %1156, 255
  %1182 = zext i32 %1181 to i64
  %1183 = getelementptr inbounds %3, %3 addrspace(1)* %1180, i64 %1182
  br label %1187

1184:                                             ; preds = %1172
  %1185 = zext i32 %1156 to i64
  %1186 = getelementptr inbounds %0, %0 addrspace(1)* @0, i64 0, i32 5, i64 %743, i64 %1185
  br label %1187

1187:                                             ; preds = %1184, %1174
  %1188 = phi %3 addrspace(1)* [ %1183, %1174 ], [ %1186, %1184 ]
  store i32 %1156, i32 addrspace(1)* %1145, align 4, !tbaa !42
  %1189 = getelementptr inbounds %3, %3 addrspace(1)* %1188, i64 0, i32 1
  %1190 = cmpxchg i64 addrspace(1)* %1189, i64 0, i64 %1083 syncscope("agent-one-as") monotonic monotonic, align 8
  %1191 = extractvalue { i64, i1 } %1190, 1
  br i1 %1191, label %1192, label %1194

1192:                                             ; preds = %1187
  %1193 = atomicrmw add i32 addrspace(1)* %746, i32 1 syncscope("agent-one-as") release, align 4
  br label %1194

1194:                                             ; preds = %1192, %1187, %1171
  %1195 = phi %3 addrspace(1)* [ null, %1171 ], [ %1188, %1192 ], [ null, %1187 ]
  %1196 = ptrtoint %3 addrspace(1)* %1195 to i64
  %1197 = trunc i64 %1196 to i32
  %1198 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1197)
  %1199 = insertelement <2 x i32> undef, i32 %1198, i64 0
  %1200 = lshr i64 %1196, 32
  %1201 = trunc i64 %1200 to i32
  %1202 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1201)
  %1203 = insertelement <2 x i32> %1199, i32 %1202, i64 1
  %1204 = bitcast <2 x i32> %1203 to i64
  %1205 = icmp eq i64 %1204, 0
  br i1 %1205, label %1208, label %1206

1206:                                             ; preds = %1194
  %1207 = inttoptr i64 %1204 to %3 addrspace(1)*
  br label %1209

1208:                                             ; preds = %1194
  tail call void @llvm.amdgcn.s.sleep(i32 2)
  br label %1146

1209:                                             ; preds = %1154, %1206, %1166, %1165, %1074, %1058, %1033, %848
  %1210 = phi i1 [ false, %1058 ], [ true, %1166 ], [ true, %1165 ], [ false, %1074 ], [ false, %1206 ], [ false, %848 ], [ false, %1033 ], [ false, %1154 ]
  %1211 = phi i32 [ %844, %1058 ], [ 0, %1166 ], [ %1150, %1165 ], [ %844, %1074 ], [ %1150, %1206 ], [ %844, %848 ], [ %844, %1033 ], [ %1150, %1154 ]
  %1212 = phi %3 addrspace(1)* [ %1059, %1058 ], [ %1036, %1166 ], [ %1036, %1165 ], [ null, %1074 ], [ %1207, %1206 ], [ null, %848 ], [ %1034, %1033 ], [ null, %1154 ]
  br i1 %1210, label %841, label %1213

1213:                                             ; preds = %1209
  %1214 = icmp eq %3 addrspace(1)* %1212, inttoptr (i64 1 to %3 addrspace(1)*)
  br i1 %1214, label %1215, label %1292

1215:                                             ; preds = %1213
  %1216 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %1217 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %1218 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1217, i32 0)
  %1219 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1216, i32 %1218)
  %1220 = icmp eq i32 %1219, 0
  br i1 %1220, label %1221, label %1285

1221:                                             ; preds = %1215
  %1222 = load atomic i64, i64 addrspace(1)* %749 syncscope("agent-one-as") monotonic, align 8
  %1223 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1224 = sub i64 %1223, %1222
  %1225 = icmp ult i64 %1224, 20000
  br i1 %1225, label %1226, label %1285

1226:                                             ; preds = %1221
  %1227 = trunc i64 %1224 to i32
  %1228 = sub nuw nsw i32 20000, %1227
  %1229 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1230 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1228)
  %1231 = sext i32 %1230 to i64
  %1232 = add i64 %1229, %1231
  %1233 = add i64 %1229, 1625
  %1234 = icmp ugt i64 %1232, %1233
  br i1 %1234, label %1239, label %1235

1235:                                             ; preds = %1239, %1226
  %1236 = phi i64 [ %1229, %1226 ], [ %1240, %1239 ]
  %1237 = add i64 %1236, 806
  %1238 = icmp ugt i64 %1232, %1237
  br i1 %1238, label %1247, label %1243

1239:                                             ; preds = %1226, %1239
  tail call void @llvm.amdgcn.s.sleep(i32 127)
  %1240 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1241 = add i64 %1240, 1625
  %1242 = icmp ugt i64 %1232, %1241
  br i1 %1242, label %1239, label %1235

1243:                                             ; preds = %1247, %1235
  %1244 = phi i64 [ %1236, %1235 ], [ %1248, %1247 ]
  %1245 = add i64 %1244, 396
  %1246 = icmp ugt i64 %1232, %1245
  br i1 %1246, label %1251, label %1255

1247:                                             ; preds = %1235, %1247
  tail call void @llvm.amdgcn.s.sleep(i32 63)
  %1248 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1249 = add i64 %1248, 806
  %1250 = icmp ugt i64 %1232, %1249
  br i1 %1250, label %1247, label %1243

1251:                                             ; preds = %1243, %1251
  tail call void @llvm.amdgcn.s.sleep(i32 31)
  %1252 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1253 = add i64 %1252, 396
  %1254 = icmp ugt i64 %1232, %1253
  br i1 %1254, label %1251, label %1255

1255:                                             ; preds = %1251, %1243
  %1256 = phi i64 [ %1244, %1243 ], [ %1252, %1251 ]
  %1257 = add i64 %1256, 192
  %1258 = icmp ugt i64 %1232, %1257
  br i1 %1258, label %1263, label %1259

1259:                                             ; preds = %1263, %1255
  %1260 = phi i64 [ %1256, %1255 ], [ %1264, %1263 ]
  %1261 = add i64 %1260, 89
  %1262 = icmp ugt i64 %1232, %1261
  br i1 %1262, label %1271, label %1267

1263:                                             ; preds = %1255, %1263
  tail call void @llvm.amdgcn.s.sleep(i32 15)
  %1264 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1265 = add i64 %1264, 192
  %1266 = icmp ugt i64 %1232, %1265
  br i1 %1266, label %1263, label %1259

1267:                                             ; preds = %1271, %1259
  %1268 = phi i64 [ %1260, %1259 ], [ %1272, %1271 ]
  %1269 = add i64 %1268, 38
  %1270 = icmp ugt i64 %1232, %1269
  br i1 %1270, label %1278, label %1275

1271:                                             ; preds = %1259, %1271
  tail call void @llvm.amdgcn.s.sleep(i32 7)
  %1272 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1273 = add i64 %1272, 89
  %1274 = icmp ugt i64 %1232, %1273
  br i1 %1274, label %1271, label %1267

1275:                                             ; preds = %1278, %1267
  %1276 = phi i64 [ %1268, %1267 ], [ %1279, %1278 ]
  %1277 = icmp ugt i64 %1232, %1276
  br i1 %1277, label %1282, label %1285

1278:                                             ; preds = %1267, %1278
  tail call void @llvm.amdgcn.s.sleep(i32 3)
  %1279 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1280 = add i64 %1279, 38
  %1281 = icmp ugt i64 %1232, %1280
  br i1 %1281, label %1278, label %1275

1282:                                             ; preds = %1275, %1282
  tail call void @llvm.amdgcn.s.sleep(i32 1)
  %1283 = tail call i64 @llvm.amdgcn.s.memrealtime()
  %1284 = icmp ugt i64 %1232, %1283
  br i1 %1284, label %1282, label %1285

1285:                                             ; preds = %1282, %1275, %1221, %1215
  %1286 = icmp eq i32 %763, 0
  br i1 %1286, label %1287, label %1289

1287:                                             ; preds = %1285
  %1288 = load atomic i32, i32 addrspace(1)* %746 syncscope("agent-one-as") monotonic, align 8
  br label %1289

1289:                                             ; preds = %1287, %1285
  %1290 = phi i32 [ %1288, %1287 ], [ %761, %1285 ]
  %1291 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1290)
  br label %1292

1292:                                             ; preds = %1289, %1213
  %1293 = phi i32 [ %1291, %1289 ], [ %761, %1213 ]
  %1294 = phi %3 addrspace(1)* [ %836, %1289 ], [ %1212, %1213 ]
  br i1 %1214, label %759, label %1295

1295:                                             ; preds = %714, %1292, %829, %731, %720
  %1296 = phi i1 [ false, %720 ], [ true, %731 ], [ false, %829 ], [ false, %1292 ], [ false, %714 ]
  %1297 = phi i32 [ %643, %720 ], [ %722, %731 ], [ %43, %829 ], [ %43, %1292 ], [ %643, %714 ]
  %1298 = phi %3 addrspace(1)* [ null, %720 ], [ %717, %731 ], [ %832, %829 ], [ %1294, %1292 ], [ %717, %714 ]
  br i1 %1296, label %642, label %1299

1299:                                             ; preds = %1295, %631, %168
  %1300 = phi %3 addrspace(1)* [ %171, %168 ], [ %633, %631 ], [ %1298, %1295 ]
  %1301 = ptrtoint %3 addrspace(1)* %1300 to i64
  %1302 = trunc i64 %1301 to i32
  %1303 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1302)
  %1304 = insertelement <2 x i32> undef, i32 %1303, i64 0
  %1305 = lshr i64 %1301, 32
  %1306 = trunc i64 %1305 to i32
  %1307 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1306)
  %1308 = insertelement <2 x i32> %1304, i32 %1307, i64 1
  %1309 = bitcast <2 x i32> %1308 to i64
  %1310 = icmp eq i64 %1309, 0
  br i1 %1310, label %1410, label %1311

1311:                                             ; preds = %1299
  %1312 = inttoptr i64 %1309 to %3 addrspace(1)*
  %1313 = tail call i32 @llvm.read_register.i32(metadata !35) #14
  %1314 = tail call i32 @llvm.read_register.i32(metadata !36) #14
  %1315 = tail call i32 @llvm.amdgcn.mbcnt.lo(i32 %1314, i32 0)
  %1316 = tail call i32 @llvm.amdgcn.mbcnt.hi(i32 %1313, i32 %1315)
  %1317 = tail call i32 asm sideeffect "; O0 $0", "=v,0"(i32 %1316) #12, !srcloc !66
  %1318 = tail call i64 @llvm.read_register.i64(metadata !37) #14
  %1319 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 1
  %1320 = load atomic i64, i64 addrspace(1)* %1319 seq_cst, align 8, !tbaa !75
  %1321 = inttoptr i64 %1320 to %5 addrspace(1)*
  %1322 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 0
  %1323 = load i32, i32 addrspace(1)* %1322, align 4, !tbaa !39
  %1324 = icmp eq i32 %1317, 0
  br i1 %1324, label %1325, label %1330

1325:                                             ; preds = %1311
  %1326 = tail call i64 @llvm.ctpop.i64(i64 %1318), !range !38
  %1327 = trunc i64 %1326 to i32
  %1328 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 2
  %1329 = atomicrmw add i32 addrspace(1)* %1328, i32 %1327 syncscope("agent-one-as") monotonic, align 4
  br label %1330

1330:                                             ; preds = %1325, %1311
  %1331 = phi i32 [ %1329, %1325 ], [ 0, %1311 ]
  %1332 = tail call i32 @llvm.amdgcn.readfirstlane(i32 %1331)
  %1333 = zext i32 %1323 to i64
  %1334 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 0
  %1335 = load i32, i32 addrspace(4)* %1334, align 4, !tbaa !71
  %1336 = add i32 %1335, 31
  %1337 = lshr i32 %1336, 5
  %1338 = icmp ult i32 %1336, 32
  br i1 %1338, label %1397, label %1339

1339:                                             ; preds = %1330
  %1340 = add i32 %1332, %1317
  %1341 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 7
  %1342 = load i32, i32 addrspace(4)* %1341, align 4, !tbaa !77
  %1343 = mul i32 %1342, %1340
  %1344 = urem i32 %1343, %1335
  %1345 = lshr i32 %1344, 5
  %1346 = inttoptr i64 %1320 to i8 addrspace(1)*
  %1347 = getelementptr inbounds [16 x %4], [16 x %4] addrspace(4)* @1, i64 0, i64 %1333, i32 3
  %1348 = lshr i32 %1323, 1
  %1349 = add nuw i32 %1348, 4
  %1350 = and i32 %1349, 31
  %1351 = shl nuw i32 1, %1350
  %1352 = and i32 %1323, 1
  %1353 = icmp eq i32 %1352, 0
  %1354 = lshr i32 %1351, 1
  %1355 = select i1 %1353, i32 0, i32 %1354
  %1356 = add nuw i32 %1355, %1351
  br label %1357

1357:                                             ; preds = %1389, %1339
  %1358 = phi i32 [ %1345, %1339 ], [ %1392, %1389 ]
  %1359 = phi i8 addrspace(1)* [ null, %1339 ], [ %1391, %1389 ]
  %1360 = phi i32 [ 0, %1339 ], [ %1394, %1389 ]
  %1361 = zext i32 %1358 to i64
  %1362 = getelementptr inbounds %5, %5 addrspace(1)* %1321, i64 0, i32 4, i64 %1361
  %1363 = load atomic i32, i32 addrspace(1)* %1362 syncscope("agent-one-as") monotonic, align 4
  %1364 = icmp eq i32 %1363, -1
  br i1 %1364, label %1385, label %1365

1365:                                             ; preds = %1357
  %1366 = xor i32 %1363, -1
  %1367 = tail call i32 @llvm.cttz.i32(i32 %1366, i1 false), !range !65
  %1368 = and i32 %1367, 31
  %1369 = shl nuw i32 1, %1368
  %1370 = atomicrmw or i32 addrspace(1)* %1362, i32 %1369 syncscope("agent-one-as") monotonic, align 4
  %1371 = and i32 %1370, %1369
  %1372 = icmp eq i32 %1371, 0
  br i1 %1372, label %1373, label %1382

1373:                                             ; preds = %1365
  %1374 = shl i32 %1358, 5
  %1375 = add i32 %1367, %1374
  %1376 = load i32, i32 addrspace(4)* %1347, align 4, !tbaa !44
  %1377 = zext i32 %1376 to i64
  %1378 = getelementptr inbounds i8, i8 addrspace(1)* %1346, i64 %1377
  %1379 = mul i32 %1375, %1356
  %1380 = zext i32 %1379 to i64
  %1381 = getelementptr inbounds i8, i8 addrspace(1)* %1378, i64 %1380
  br label %1382

1382:                                             ; preds = %1373, %1365
  %1383 = phi i32 [ 2, %1373 ], [ 0, %1365 ]
  %1384 = phi i8 addrspace(1)* [ %1381, %1373 ], [ %1359, %1365 ]
  br i1 %1372, label %1389, label %1385

1385:                                             ; preds = %1382, %1357
  %1386 = phi i8 addrspace(1)* [ %1384, %1382 ], [ %1359, %1357 ]
  %1387 = add i32 %1358, 1
  %1388 = urem i32 %1387, %1337
  br label %1389

1389:                                             ; preds = %1385, %1382
  %1390 = phi i32 [ 0, %1385 ], [ %1383, %1382 ]
  %1391 = phi i8 addrspace(1)* [ %1386, %1385 ], [ %1384, %1382 ]
  %1392 = phi i32 [ %1388, %1385 ], [ %1358, %1382 ]
  %1393 = icmp eq i32 %1390, 0
  %1394 = add nuw nsw i32 %1360, 1
  %1395 = icmp ult i32 %1394, %1337
  %1396 = select i1 %1393, i1 %1395, i1 false
  br i1 %1396, label %1357, label %1397

1397:                                             ; preds = %1389, %1330
  %1398 = phi i8 addrspace(1)* [ null, %1330 ], [ %1391, %1389 ]
  %1399 = ptrtoint i8 addrspace(1)* %1398 to i64
  %1400 = tail call i64 @llvm.amdgcn.icmp.i64.i64(i64 noundef %1399, i64 noundef 0, i32 noundef 33) #15
  br i1 %1324, label %1401, label %1406

1401:                                             ; preds = %1397
  %1402 = tail call i64 @llvm.ctpop.i64(i64 %1400), !range !38
  %1403 = trunc i64 %1402 to i32
  %1404 = getelementptr inbounds %3, %3 addrspace(1)* %1312, i64 0, i32 2
  %1405 = atomicrmw add i32 addrspace(1)* %1404, i32 %1403 syncscope("agent-one-as") monotonic, align 4
  br label %1406

1406:                                             ; preds = %1401, %1397
  %1407 = icmp eq i8 addrspace(1)* %1398, null
  %1408 = select i1 %1407, i32 %72, i32 0
  %1409 = select i1 %1407, i32 %75, i32 0
  br label %1410

1410:                                             ; preds = %1406, %1299, %71
  %1411 = phi i32 [ %72, %71 ], [ %1408, %1406 ], [ 0, %1299 ]
  %1412 = phi i32 [ 0, %71 ], [ %1409, %1406 ], [ 0, %1299 ]
  %1413 = phi i8 addrspace(1)* [ %74, %71 ], [ %1398, %1406 ], [ %74, %1299 ]
  %1414 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1412) #12, !srcloc !46
  %1415 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1414, i32 noundef 0, i32 noundef 33) #15
  %1416 = icmp eq i64 %1415, 0
  br i1 %1416, label %1417, label %71

1417:                                             ; preds = %1410, %68, %63
  %1418 = phi i32 [ 0, %63 ], [ %66, %68 ], [ %1411, %1410 ]
  %1419 = phi i8 addrspace(1)* [ %65, %63 ], [ %65, %68 ], [ %1413, %1410 ]
  %1420 = tail call i32 asm sideeffect "; ockl ballot hoisting hack $0", "=v,0"(i32 %1418) #12, !srcloc !46
  %1421 = tail call i64 @llvm.amdgcn.icmp.i64.i32(i32 noundef %1420, i32 noundef 0, i32 noundef 33) #15
  %1422 = icmp eq i64 %1421, 0
  br i1 %1422, label %1423, label %63

1423:                                             ; preds = %1417, %25, %1
  %1424 = phi i8 addrspace(1)* [ %26, %25 ], [ null, %1 ], [ %1419, %1417 ]
  ret i8 addrspace(1)* %1424
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.ds.bpermute(i32, i32) #6

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i64 @llvm.amdgcn.icmp.i64.i64(i64, i64, i32 immarg) #6

; Function Attrs: mustprogress nounwind willreturn
declare i64 @llvm.amdgcn.s.memrealtime() #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.cttz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.cttz.i64(i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { nofree nounwind readonly }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #8 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #9 = { mustprogress nounwind willreturn }
attributes #10 = { nounwind }
attributes #11 = { convergent noinline norecurse nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { convergent nounwind }
attributes #13 = { readnone }
attributes #14 = { convergent }
attributes #15 = { convergent nounwind readnone willreturn }

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
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !14}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !9, i64 0}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !14}
!24 = distinct !{!24, !14}
!25 = distinct !{!25, !14}
!26 = distinct !{!26, !12}
!27 = distinct !{!27, !14}
!28 = distinct !{!28, !14}
!29 = distinct !{!29, !14}
!30 = distinct !{!30, !14}
!31 = !{!32, !32, i64 0}
!32 = !{!"long", !33, i64 0}
!33 = !{!"omnipotent char", !34, i64 0}
!34 = !{!"Simple C/C++ TBAA"}
!35 = !{!"exec_hi"}
!36 = !{!"exec_lo"}
!37 = !{!"exec"}
!38 = !{i64 0, i64 65}
!39 = !{!40, !41, i64 0}
!40 = !{!"slab_s", !41, i64 0, !41, i64 4, !33, i64 8, !41, i64 12, !33, i64 16}
!41 = !{!"int", !33, i64 0}
!42 = !{!40, !41, i64 4}
!43 = !{i64 7014}
!44 = !{!45, !41, i64 12}
!45 = !{!"kind_info_s", !41, i64 0, !41, i64 4, !41, i64 8, !41, i64 12, !41, i64 16, !41, i64 20, !41, i64 24, !41, i64 28}
!46 = !{i64 751}
!47 = !{!48, !48, i64 0}
!48 = !{!"any pointer", !33, i64 0}
!49 = !{!41, !41, i64 0}
!50 = !{i64 2662}
!51 = !{!52, !48, i64 0}
!52 = !{!"", !48, i64 0, !48, i64 8, !53, i64 16, !32, i64 24, !32, i64 32, !32, i64 40}
!53 = !{!"hsa_signal_s", !32, i64 0}
!54 = !{!52, !32, i64 40}
!55 = !{!52, !48, i64 8}
!56 = !{!57, !41, i64 16}
!57 = !{!"", !32, i64 0, !32, i64 8, !41, i64 16, !41, i64 20}
!58 = !{!57, !32, i64 8}
!59 = !{!57, !41, i64 20}
!60 = !{!57, !32, i64 0}
!61 = !{!62, !32, i64 16}
!62 = !{!"amd_signal_s", !32, i64 0, !33, i64 8, !32, i64 16, !41, i64 24, !41, i64 28, !32, i64 32, !32, i64 40, !33, i64 48, !33, i64 56}
!63 = !{!62, !41, i64 24}
!64 = !{!33, !33, i64 0}
!65 = !{i32 0, i32 33}
!66 = !{i64 7137}
!67 = !{!45, !41, i64 8}
!68 = !{!69, !32, i64 108552}
!69 = !{!"heap_s", !33, i64 0, !33, i64 2048, !33, i64 4096, !33, i64 6144, !33, i64 8192, !33, i64 10240, !33, i64 108544, !32, i64 108552, !33, i64 108560, !33, i64 108672}
!70 = !{!45, !41, i64 20}
!71 = !{!45, !41, i64 0}
!72 = !{!45, !41, i64 16}
!73 = !{!45, !41, i64 24}
!74 = !{!45, !41, i64 4}
!75 = !{!76, !33, i64 8}
!76 = !{!"sdata_s", !33, i64 0, !33, i64 8, !33, i64 16}
!77 = !{!45, !41, i64 28}
