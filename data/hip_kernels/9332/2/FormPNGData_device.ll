; ModuleID = '../data/hip_kernels/9332/2/main.cu'
source_filename = "../data/hip_kernels/9332/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%0 = type { %1 addrspace(1)*, %2 addrspace(1)*, %3, i64, i64, i64 }
%1 = type { i64, i64, i32, i32 }
%2 = type { [64 x [8 x i64]] }
%3 = type { i64 }
%4 = type { i64, %3, i64, i32, i32, i64, i64, %5, [2 x i32] }
%5 = type { %6 addrspace(1)* }
%6 = type { %7, [4 x i32], i64, i32, i32, i32, i32, i64, i32, [9 x i32], i64, i32, i32, [4 x i32], i64, i64, i32, i32, [2 x i32], %3, [14 x i32] }
%7 = type { i32, i32, i8 addrspace(1)*, %3, i32, i32, i64 }
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }

@.str = private unnamed_addr addrspace(4) constant [60 x i8] c"BAD: Out of colors[] boundary in FormPNGData, %d , max: %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [62 x i8] c"BAD: Out of pixelData[] boundary in FormPNGData, %d, max: %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11FormPNGDataP15HIP_vector_typeIfLj3EEPhjj(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %2
  %23 = add i32 %13, %22
  %24 = shl nsw i32 %23, 2
  %25 = mul i32 %3, %2
  %26 = shl i32 %25, 2
  %27 = icmp ult i32 %24, %26
  br i1 %27, label %494, label %28

28:                                               ; preds = %4
  %29 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %30 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 24
  %31 = bitcast i8 addrspace(4)* %30 to i64 addrspace(4)*
  %32 = load i64, i64 addrspace(4)* %31, align 8, !tbaa !7
  %33 = inttoptr i64 %32 to i8 addrspace(1)*
  %34 = addrspacecast i8 addrspace(1)* %33 to i8*
  %35 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %36 = extractelement <2 x i64> %35, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([60 x i8], [60 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %37, label %41

37:                                               ; preds = %28
  %38 = and i64 %36, -225
  %39 = or i64 %38, 32
  %40 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %39, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %482

41:                                               ; preds = %28
  %42 = and i64 %36, 2
  %43 = and i64 %36, -3
  %44 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %43, i64 0
  br label %45

45:                                               ; preds = %471, %41
  %46 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([60 x i8], [60 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([60 x i8], [60 x i8] addrspace(4)* @.str, i64 0, i64 59) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([60 x i8]* addrspacecast ([60 x i8] addrspace(4)* @.str to [60 x i8]*) to i64)), i64 1))), %41 ], [ %479, %471 ]
  %47 = phi i8 addrspace(4)* [ getelementptr inbounds ([60 x i8], [60 x i8] addrspace(4)* @.str, i64 0, i64 0), %41 ], [ %480, %471 ]
  %48 = phi <2 x i64> [ %44, %41 ], [ %478, %471 ]
  %49 = icmp ugt i64 %46, 56
  %50 = extractelement <2 x i64> %48, i64 0
  %51 = or i64 %50, %42
  %52 = insertelement <2 x i64> poison, i64 %51, i64 0
  %53 = select i1 %49, <2 x i64> %48, <2 x i64> %52
  %54 = tail call i64 @llvm.umin.i64(i64 %46, i64 56)
  %55 = trunc i64 %54 to i32
  %56 = extractelement <2 x i64> %53, i64 0
  %57 = icmp ugt i32 %55, 7
  br i1 %57, label %60, label %58

58:                                               ; preds = %45
  %59 = icmp eq i32 %55, 0
  br i1 %59, label %113, label %100

60:                                               ; preds = %45
  %61 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !11
  %62 = zext i8 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 1
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !11
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 8
  %67 = or i64 %66, %62
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 2
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !11
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 16
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 3
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !11
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 24
  %77 = or i64 %72, %76
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 4
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !11
  %80 = zext i8 %79 to i64
  %81 = shl nuw nsw i64 %80, 32
  %82 = or i64 %77, %81
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 5
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !11
  %85 = zext i8 %84 to i64
  %86 = shl nuw nsw i64 %85, 40
  %87 = or i64 %82, %86
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 6
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !11
  %90 = zext i8 %89 to i64
  %91 = shl nuw nsw i64 %90, 48
  %92 = or i64 %87, %91
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 7
  %94 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !11
  %95 = zext i8 %94 to i64
  %96 = shl nuw i64 %95, 56
  %97 = or i64 %92, %96
  %98 = add nsw i32 %55, -8
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 8
  br label %113

100:                                              ; preds = %58, %100
  %101 = phi i32 [ %111, %100 ], [ 0, %58 ]
  %102 = phi i64 [ %110, %100 ], [ 0, %58 ]
  %103 = zext i32 %101 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 %103
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !11
  %106 = zext i8 %105 to i64
  %107 = shl i32 %101, 3
  %108 = zext i32 %107 to i64
  %109 = shl nuw i64 %106, %108
  %110 = or i64 %109, %102
  %111 = add nuw nsw i32 %101, 1
  %112 = icmp eq i32 %111, %55
  br i1 %112, label %113, label %100, !llvm.loop !12

113:                                              ; preds = %100, %60, %58
  %114 = phi i8 addrspace(4)* [ %99, %60 ], [ %47, %58 ], [ %47, %100 ]
  %115 = phi i32 [ %98, %60 ], [ 0, %58 ], [ 0, %100 ]
  %116 = phi i64 [ %97, %60 ], [ 0, %58 ], [ %110, %100 ]
  %117 = icmp ugt i32 %115, 7
  br i1 %117, label %120, label %118

118:                                              ; preds = %113
  %119 = icmp eq i32 %115, 0
  br i1 %119, label %173, label %160

120:                                              ; preds = %113
  %121 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !11
  %122 = zext i8 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 1
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !11
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 8
  %127 = or i64 %126, %122
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 2
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !11
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 16
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 3
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !11
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 24
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 4
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !11
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 32
  %142 = or i64 %137, %141
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 5
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !11
  %145 = zext i8 %144 to i64
  %146 = shl nuw nsw i64 %145, 40
  %147 = or i64 %142, %146
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 6
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !11
  %150 = zext i8 %149 to i64
  %151 = shl nuw nsw i64 %150, 48
  %152 = or i64 %147, %151
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 7
  %154 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !11
  %155 = zext i8 %154 to i64
  %156 = shl nuw i64 %155, 56
  %157 = or i64 %152, %156
  %158 = add nsw i32 %115, -8
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 8
  br label %173

160:                                              ; preds = %118, %160
  %161 = phi i32 [ %171, %160 ], [ 0, %118 ]
  %162 = phi i64 [ %170, %160 ], [ 0, %118 ]
  %163 = zext i32 %161 to i64
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 %163
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !11
  %166 = zext i8 %165 to i64
  %167 = shl i32 %161, 3
  %168 = zext i32 %167 to i64
  %169 = shl nuw i64 %166, %168
  %170 = or i64 %169, %162
  %171 = add nuw nsw i32 %161, 1
  %172 = icmp eq i32 %171, %115
  br i1 %172, label %173, label %160

173:                                              ; preds = %160, %120, %118
  %174 = phi i8 addrspace(4)* [ %159, %120 ], [ %114, %118 ], [ %114, %160 ]
  %175 = phi i32 [ %158, %120 ], [ 0, %118 ], [ 0, %160 ]
  %176 = phi i64 [ %157, %120 ], [ 0, %118 ], [ %170, %160 ]
  %177 = icmp ugt i32 %175, 7
  br i1 %177, label %180, label %178

178:                                              ; preds = %173
  %179 = icmp eq i32 %175, 0
  br i1 %179, label %233, label %220

180:                                              ; preds = %173
  %181 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !11
  %182 = zext i8 %181 to i64
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 1
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !11
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 8
  %187 = or i64 %186, %182
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 2
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !11
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 16
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 3
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !11
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 24
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 4
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !11
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 32
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 5
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !11
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 40
  %207 = or i64 %202, %206
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 6
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !11
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 48
  %212 = or i64 %207, %211
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 7
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !11
  %215 = zext i8 %214 to i64
  %216 = shl nuw i64 %215, 56
  %217 = or i64 %212, %216
  %218 = add nsw i32 %175, -8
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 8
  br label %233

220:                                              ; preds = %178, %220
  %221 = phi i32 [ %231, %220 ], [ 0, %178 ]
  %222 = phi i64 [ %230, %220 ], [ 0, %178 ]
  %223 = zext i32 %221 to i64
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 %223
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !11
  %226 = zext i8 %225 to i64
  %227 = shl i32 %221, 3
  %228 = zext i32 %227 to i64
  %229 = shl nuw i64 %226, %228
  %230 = or i64 %229, %222
  %231 = add nuw nsw i32 %221, 1
  %232 = icmp eq i32 %231, %175
  br i1 %232, label %233, label %220

233:                                              ; preds = %220, %180, %178
  %234 = phi i8 addrspace(4)* [ %219, %180 ], [ %174, %178 ], [ %174, %220 ]
  %235 = phi i32 [ %218, %180 ], [ 0, %178 ], [ 0, %220 ]
  %236 = phi i64 [ %217, %180 ], [ 0, %178 ], [ %230, %220 ]
  %237 = icmp ugt i32 %235, 7
  br i1 %237, label %240, label %238

238:                                              ; preds = %233
  %239 = icmp eq i32 %235, 0
  br i1 %239, label %293, label %280

240:                                              ; preds = %233
  %241 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !11
  %242 = zext i8 %241 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 1
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !11
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 8
  %247 = or i64 %246, %242
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 2
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !11
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 16
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 3
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !11
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 24
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 4
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !11
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 32
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 5
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !11
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 40
  %267 = or i64 %262, %266
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 6
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !11
  %270 = zext i8 %269 to i64
  %271 = shl nuw nsw i64 %270, 48
  %272 = or i64 %267, %271
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 7
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !11
  %275 = zext i8 %274 to i64
  %276 = shl nuw i64 %275, 56
  %277 = or i64 %272, %276
  %278 = add nsw i32 %235, -8
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 8
  br label %293

280:                                              ; preds = %238, %280
  %281 = phi i32 [ %291, %280 ], [ 0, %238 ]
  %282 = phi i64 [ %290, %280 ], [ 0, %238 ]
  %283 = zext i32 %281 to i64
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 %283
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !11
  %286 = zext i8 %285 to i64
  %287 = shl i32 %281, 3
  %288 = zext i32 %287 to i64
  %289 = shl nuw i64 %286, %288
  %290 = or i64 %289, %282
  %291 = add nuw nsw i32 %281, 1
  %292 = icmp eq i32 %291, %235
  br i1 %292, label %293, label %280

293:                                              ; preds = %280, %240, %238
  %294 = phi i8 addrspace(4)* [ %279, %240 ], [ %234, %238 ], [ %234, %280 ]
  %295 = phi i32 [ %278, %240 ], [ 0, %238 ], [ 0, %280 ]
  %296 = phi i64 [ %277, %240 ], [ 0, %238 ], [ %290, %280 ]
  %297 = icmp ugt i32 %295, 7
  br i1 %297, label %300, label %298

298:                                              ; preds = %293
  %299 = icmp eq i32 %295, 0
  br i1 %299, label %353, label %340

300:                                              ; preds = %293
  %301 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !11
  %302 = zext i8 %301 to i64
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 1
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !11
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 8
  %307 = or i64 %306, %302
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 2
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !11
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 16
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 3
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !11
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 24
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 4
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !11
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 32
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 5
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !11
  %325 = zext i8 %324 to i64
  %326 = shl nuw nsw i64 %325, 40
  %327 = or i64 %322, %326
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 6
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !11
  %330 = zext i8 %329 to i64
  %331 = shl nuw nsw i64 %330, 48
  %332 = or i64 %327, %331
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 7
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !11
  %335 = zext i8 %334 to i64
  %336 = shl nuw i64 %335, 56
  %337 = or i64 %332, %336
  %338 = add nsw i32 %295, -8
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 8
  br label %353

340:                                              ; preds = %298, %340
  %341 = phi i32 [ %351, %340 ], [ 0, %298 ]
  %342 = phi i64 [ %350, %340 ], [ 0, %298 ]
  %343 = zext i32 %341 to i64
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 %343
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !11
  %346 = zext i8 %345 to i64
  %347 = shl i32 %341, 3
  %348 = zext i32 %347 to i64
  %349 = shl nuw i64 %346, %348
  %350 = or i64 %349, %342
  %351 = add nuw nsw i32 %341, 1
  %352 = icmp eq i32 %351, %295
  br i1 %352, label %353, label %340

353:                                              ; preds = %340, %300, %298
  %354 = phi i8 addrspace(4)* [ %339, %300 ], [ %294, %298 ], [ %294, %340 ]
  %355 = phi i32 [ %338, %300 ], [ 0, %298 ], [ 0, %340 ]
  %356 = phi i64 [ %337, %300 ], [ 0, %298 ], [ %350, %340 ]
  %357 = icmp ugt i32 %355, 7
  br i1 %357, label %360, label %358

358:                                              ; preds = %353
  %359 = icmp eq i32 %355, 0
  br i1 %359, label %413, label %400

360:                                              ; preds = %353
  %361 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !11
  %362 = zext i8 %361 to i64
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 1
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !11
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 8
  %367 = or i64 %366, %362
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 2
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !11
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 16
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 3
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !11
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 24
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 4
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !11
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 32
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 5
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !11
  %385 = zext i8 %384 to i64
  %386 = shl nuw nsw i64 %385, 40
  %387 = or i64 %382, %386
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 6
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !11
  %390 = zext i8 %389 to i64
  %391 = shl nuw nsw i64 %390, 48
  %392 = or i64 %387, %391
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 7
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !11
  %395 = zext i8 %394 to i64
  %396 = shl nuw i64 %395, 56
  %397 = or i64 %392, %396
  %398 = add nsw i32 %355, -8
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 8
  br label %413

400:                                              ; preds = %358, %400
  %401 = phi i32 [ %411, %400 ], [ 0, %358 ]
  %402 = phi i64 [ %410, %400 ], [ 0, %358 ]
  %403 = zext i32 %401 to i64
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 %403
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !11
  %406 = zext i8 %405 to i64
  %407 = shl i32 %401, 3
  %408 = zext i32 %407 to i64
  %409 = shl nuw i64 %406, %408
  %410 = or i64 %409, %402
  %411 = add nuw nsw i32 %401, 1
  %412 = icmp eq i32 %411, %355
  br i1 %412, label %413, label %400

413:                                              ; preds = %400, %360, %358
  %414 = phi i8 addrspace(4)* [ %399, %360 ], [ %354, %358 ], [ %354, %400 ]
  %415 = phi i32 [ %398, %360 ], [ 0, %358 ], [ 0, %400 ]
  %416 = phi i64 [ %397, %360 ], [ 0, %358 ], [ %410, %400 ]
  %417 = icmp ugt i32 %415, 7
  br i1 %417, label %420, label %418

418:                                              ; preds = %413
  %419 = icmp eq i32 %415, 0
  br i1 %419, label %471, label %458

420:                                              ; preds = %413
  %421 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !11
  %422 = zext i8 %421 to i64
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 1
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !11
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 8
  %427 = or i64 %426, %422
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 2
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !11
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 16
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 3
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !11
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 24
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 4
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !11
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 32
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 5
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !11
  %445 = zext i8 %444 to i64
  %446 = shl nuw nsw i64 %445, 40
  %447 = or i64 %442, %446
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 6
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !11
  %450 = zext i8 %449 to i64
  %451 = shl nuw nsw i64 %450, 48
  %452 = or i64 %447, %451
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 7
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !11
  %455 = zext i8 %454 to i64
  %456 = shl nuw i64 %455, 56
  %457 = or i64 %452, %456
  br label %471

458:                                              ; preds = %418, %458
  %459 = phi i32 [ %469, %458 ], [ 0, %418 ]
  %460 = phi i64 [ %468, %458 ], [ 0, %418 ]
  %461 = zext i32 %459 to i64
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 %461
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !11
  %464 = zext i8 %463 to i64
  %465 = shl i32 %459, 3
  %466 = zext i32 %465 to i64
  %467 = shl nuw i64 %464, %466
  %468 = or i64 %467, %460
  %469 = add nuw nsw i32 %459, 1
  %470 = icmp eq i32 %469, %415
  br i1 %470, label %471, label %458

471:                                              ; preds = %458, %420, %418
  %472 = phi i64 [ %457, %420 ], [ 0, %418 ], [ %468, %458 ]
  %473 = shl nuw nsw i64 %54, 2
  %474 = add nuw nsw i64 %473, 28
  %475 = and i64 %474, 480
  %476 = and i64 %56, -225
  %477 = or i64 %476, %475
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %477, i64 noundef %116, i64 noundef %176, i64 noundef %236, i64 noundef %296, i64 noundef %356, i64 noundef %416, i64 noundef %472) #10
  %479 = sub i64 %46, %54
  %480 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 %54
  %481 = icmp eq i64 %479, 0
  br i1 %481, label %482, label %45

482:                                              ; preds = %471, %37
  %483 = phi <2 x i64> [ %40, %37 ], [ %478, %471 ]
  %484 = extractelement <2 x i64> %483, i64 0
  %485 = zext i32 %24 to i64
  %486 = and i64 %484, -225
  %487 = or i64 %486, 32
  %488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %487, i64 noundef %485, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %489 = extractelement <2 x i64> %488, i64 0
  %490 = zext i32 %26 to i64
  %491 = and i64 %489, -227
  %492 = or i64 %491, 34
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %492, i64 noundef %490, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %494

494:                                              ; preds = %482, %4
  %495 = mul nsw i32 %23, 3
  %496 = add nsw i32 %495, 2
  %497 = mul i32 %25, 3
  %498 = icmp ult i32 %496, %497
  br i1 %498, label %965, label %499

499:                                              ; preds = %494
  %500 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %501 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 24
  %502 = bitcast i8 addrspace(4)* %501 to i64 addrspace(4)*
  %503 = load i64, i64 addrspace(4)* %502, align 8, !tbaa !7
  %504 = inttoptr i64 %503 to i8 addrspace(1)*
  %505 = addrspacecast i8 addrspace(1)* %504 to i8*
  %506 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %505, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %507 = extractelement <2 x i64> %506, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([62 x i8], [62 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %508, label %512

508:                                              ; preds = %499
  %509 = and i64 %507, -225
  %510 = or i64 %509, 32
  %511 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %505, i64 noundef %510, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %953

512:                                              ; preds = %499
  %513 = and i64 %507, 2
  %514 = and i64 %507, -3
  %515 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %514, i64 0
  br label %516

516:                                              ; preds = %942, %512
  %517 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([62 x i8], [62 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([62 x i8], [62 x i8] addrspace(4)* @.str.1, i64 0, i64 61) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([62 x i8]* addrspacecast ([62 x i8] addrspace(4)* @.str.1 to [62 x i8]*) to i64)), i64 1))), %512 ], [ %950, %942 ]
  %518 = phi i8 addrspace(4)* [ getelementptr inbounds ([62 x i8], [62 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %512 ], [ %951, %942 ]
  %519 = phi <2 x i64> [ %515, %512 ], [ %949, %942 ]
  %520 = icmp ugt i64 %517, 56
  %521 = extractelement <2 x i64> %519, i64 0
  %522 = or i64 %521, %513
  %523 = insertelement <2 x i64> poison, i64 %522, i64 0
  %524 = select i1 %520, <2 x i64> %519, <2 x i64> %523
  %525 = tail call i64 @llvm.umin.i64(i64 %517, i64 56)
  %526 = trunc i64 %525 to i32
  %527 = extractelement <2 x i64> %524, i64 0
  %528 = icmp ugt i32 %526, 7
  br i1 %528, label %531, label %529

529:                                              ; preds = %516
  %530 = icmp eq i32 %526, 0
  br i1 %530, label %584, label %571

531:                                              ; preds = %516
  %532 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !11
  %533 = zext i8 %532 to i64
  %534 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 1
  %535 = load i8, i8 addrspace(4)* %534, align 1, !tbaa !11
  %536 = zext i8 %535 to i64
  %537 = shl nuw nsw i64 %536, 8
  %538 = or i64 %537, %533
  %539 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 2
  %540 = load i8, i8 addrspace(4)* %539, align 1, !tbaa !11
  %541 = zext i8 %540 to i64
  %542 = shl nuw nsw i64 %541, 16
  %543 = or i64 %538, %542
  %544 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 3
  %545 = load i8, i8 addrspace(4)* %544, align 1, !tbaa !11
  %546 = zext i8 %545 to i64
  %547 = shl nuw nsw i64 %546, 24
  %548 = or i64 %543, %547
  %549 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 4
  %550 = load i8, i8 addrspace(4)* %549, align 1, !tbaa !11
  %551 = zext i8 %550 to i64
  %552 = shl nuw nsw i64 %551, 32
  %553 = or i64 %548, %552
  %554 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 5
  %555 = load i8, i8 addrspace(4)* %554, align 1, !tbaa !11
  %556 = zext i8 %555 to i64
  %557 = shl nuw nsw i64 %556, 40
  %558 = or i64 %553, %557
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 6
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !11
  %561 = zext i8 %560 to i64
  %562 = shl nuw nsw i64 %561, 48
  %563 = or i64 %558, %562
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 7
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !11
  %566 = zext i8 %565 to i64
  %567 = shl nuw i64 %566, 56
  %568 = or i64 %563, %567
  %569 = add nsw i32 %526, -8
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 8
  br label %584

571:                                              ; preds = %529, %571
  %572 = phi i32 [ %582, %571 ], [ 0, %529 ]
  %573 = phi i64 [ %581, %571 ], [ 0, %529 ]
  %574 = zext i32 %572 to i64
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 %574
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !11
  %577 = zext i8 %576 to i64
  %578 = shl i32 %572, 3
  %579 = zext i32 %578 to i64
  %580 = shl nuw i64 %577, %579
  %581 = or i64 %580, %573
  %582 = add nuw nsw i32 %572, 1
  %583 = icmp eq i32 %582, %526
  br i1 %583, label %584, label %571, !llvm.loop !12

584:                                              ; preds = %571, %531, %529
  %585 = phi i8 addrspace(4)* [ %570, %531 ], [ %518, %529 ], [ %518, %571 ]
  %586 = phi i32 [ %569, %531 ], [ 0, %529 ], [ 0, %571 ]
  %587 = phi i64 [ %568, %531 ], [ 0, %529 ], [ %581, %571 ]
  %588 = icmp ugt i32 %586, 7
  br i1 %588, label %591, label %589

589:                                              ; preds = %584
  %590 = icmp eq i32 %586, 0
  br i1 %590, label %644, label %631

591:                                              ; preds = %584
  %592 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !11
  %593 = zext i8 %592 to i64
  %594 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 1
  %595 = load i8, i8 addrspace(4)* %594, align 1, !tbaa !11
  %596 = zext i8 %595 to i64
  %597 = shl nuw nsw i64 %596, 8
  %598 = or i64 %597, %593
  %599 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 2
  %600 = load i8, i8 addrspace(4)* %599, align 1, !tbaa !11
  %601 = zext i8 %600 to i64
  %602 = shl nuw nsw i64 %601, 16
  %603 = or i64 %598, %602
  %604 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 3
  %605 = load i8, i8 addrspace(4)* %604, align 1, !tbaa !11
  %606 = zext i8 %605 to i64
  %607 = shl nuw nsw i64 %606, 24
  %608 = or i64 %603, %607
  %609 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 4
  %610 = load i8, i8 addrspace(4)* %609, align 1, !tbaa !11
  %611 = zext i8 %610 to i64
  %612 = shl nuw nsw i64 %611, 32
  %613 = or i64 %608, %612
  %614 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 5
  %615 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !11
  %616 = zext i8 %615 to i64
  %617 = shl nuw nsw i64 %616, 40
  %618 = or i64 %613, %617
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 6
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !11
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 48
  %623 = or i64 %618, %622
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 7
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !11
  %626 = zext i8 %625 to i64
  %627 = shl nuw i64 %626, 56
  %628 = or i64 %623, %627
  %629 = add nsw i32 %586, -8
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 8
  br label %644

631:                                              ; preds = %589, %631
  %632 = phi i32 [ %642, %631 ], [ 0, %589 ]
  %633 = phi i64 [ %641, %631 ], [ 0, %589 ]
  %634 = zext i32 %632 to i64
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %585, i64 %634
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !11
  %637 = zext i8 %636 to i64
  %638 = shl i32 %632, 3
  %639 = zext i32 %638 to i64
  %640 = shl nuw i64 %637, %639
  %641 = or i64 %640, %633
  %642 = add nuw nsw i32 %632, 1
  %643 = icmp eq i32 %642, %586
  br i1 %643, label %644, label %631

644:                                              ; preds = %631, %591, %589
  %645 = phi i8 addrspace(4)* [ %630, %591 ], [ %585, %589 ], [ %585, %631 ]
  %646 = phi i32 [ %629, %591 ], [ 0, %589 ], [ 0, %631 ]
  %647 = phi i64 [ %628, %591 ], [ 0, %589 ], [ %641, %631 ]
  %648 = icmp ugt i32 %646, 7
  br i1 %648, label %651, label %649

649:                                              ; preds = %644
  %650 = icmp eq i32 %646, 0
  br i1 %650, label %704, label %691

651:                                              ; preds = %644
  %652 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !11
  %653 = zext i8 %652 to i64
  %654 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 1
  %655 = load i8, i8 addrspace(4)* %654, align 1, !tbaa !11
  %656 = zext i8 %655 to i64
  %657 = shl nuw nsw i64 %656, 8
  %658 = or i64 %657, %653
  %659 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 2
  %660 = load i8, i8 addrspace(4)* %659, align 1, !tbaa !11
  %661 = zext i8 %660 to i64
  %662 = shl nuw nsw i64 %661, 16
  %663 = or i64 %658, %662
  %664 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 3
  %665 = load i8, i8 addrspace(4)* %664, align 1, !tbaa !11
  %666 = zext i8 %665 to i64
  %667 = shl nuw nsw i64 %666, 24
  %668 = or i64 %663, %667
  %669 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 4
  %670 = load i8, i8 addrspace(4)* %669, align 1, !tbaa !11
  %671 = zext i8 %670 to i64
  %672 = shl nuw nsw i64 %671, 32
  %673 = or i64 %668, %672
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 5
  %675 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !11
  %676 = zext i8 %675 to i64
  %677 = shl nuw nsw i64 %676, 40
  %678 = or i64 %673, %677
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 6
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !11
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 48
  %683 = or i64 %678, %682
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 7
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !11
  %686 = zext i8 %685 to i64
  %687 = shl nuw i64 %686, 56
  %688 = or i64 %683, %687
  %689 = add nsw i32 %646, -8
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 8
  br label %704

691:                                              ; preds = %649, %691
  %692 = phi i32 [ %702, %691 ], [ 0, %649 ]
  %693 = phi i64 [ %701, %691 ], [ 0, %649 ]
  %694 = zext i32 %692 to i64
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %645, i64 %694
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !11
  %697 = zext i8 %696 to i64
  %698 = shl i32 %692, 3
  %699 = zext i32 %698 to i64
  %700 = shl nuw i64 %697, %699
  %701 = or i64 %700, %693
  %702 = add nuw nsw i32 %692, 1
  %703 = icmp eq i32 %702, %646
  br i1 %703, label %704, label %691

704:                                              ; preds = %691, %651, %649
  %705 = phi i8 addrspace(4)* [ %690, %651 ], [ %645, %649 ], [ %645, %691 ]
  %706 = phi i32 [ %689, %651 ], [ 0, %649 ], [ 0, %691 ]
  %707 = phi i64 [ %688, %651 ], [ 0, %649 ], [ %701, %691 ]
  %708 = icmp ugt i32 %706, 7
  br i1 %708, label %711, label %709

709:                                              ; preds = %704
  %710 = icmp eq i32 %706, 0
  br i1 %710, label %764, label %751

711:                                              ; preds = %704
  %712 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !11
  %713 = zext i8 %712 to i64
  %714 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 1
  %715 = load i8, i8 addrspace(4)* %714, align 1, !tbaa !11
  %716 = zext i8 %715 to i64
  %717 = shl nuw nsw i64 %716, 8
  %718 = or i64 %717, %713
  %719 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 2
  %720 = load i8, i8 addrspace(4)* %719, align 1, !tbaa !11
  %721 = zext i8 %720 to i64
  %722 = shl nuw nsw i64 %721, 16
  %723 = or i64 %718, %722
  %724 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 3
  %725 = load i8, i8 addrspace(4)* %724, align 1, !tbaa !11
  %726 = zext i8 %725 to i64
  %727 = shl nuw nsw i64 %726, 24
  %728 = or i64 %723, %727
  %729 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 4
  %730 = load i8, i8 addrspace(4)* %729, align 1, !tbaa !11
  %731 = zext i8 %730 to i64
  %732 = shl nuw nsw i64 %731, 32
  %733 = or i64 %728, %732
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 5
  %735 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !11
  %736 = zext i8 %735 to i64
  %737 = shl nuw nsw i64 %736, 40
  %738 = or i64 %733, %737
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 6
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !11
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 48
  %743 = or i64 %738, %742
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 7
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !11
  %746 = zext i8 %745 to i64
  %747 = shl nuw i64 %746, 56
  %748 = or i64 %743, %747
  %749 = add nsw i32 %706, -8
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 8
  br label %764

751:                                              ; preds = %709, %751
  %752 = phi i32 [ %762, %751 ], [ 0, %709 ]
  %753 = phi i64 [ %761, %751 ], [ 0, %709 ]
  %754 = zext i32 %752 to i64
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %705, i64 %754
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !11
  %757 = zext i8 %756 to i64
  %758 = shl i32 %752, 3
  %759 = zext i32 %758 to i64
  %760 = shl nuw i64 %757, %759
  %761 = or i64 %760, %753
  %762 = add nuw nsw i32 %752, 1
  %763 = icmp eq i32 %762, %706
  br i1 %763, label %764, label %751

764:                                              ; preds = %751, %711, %709
  %765 = phi i8 addrspace(4)* [ %750, %711 ], [ %705, %709 ], [ %705, %751 ]
  %766 = phi i32 [ %749, %711 ], [ 0, %709 ], [ 0, %751 ]
  %767 = phi i64 [ %748, %711 ], [ 0, %709 ], [ %761, %751 ]
  %768 = icmp ugt i32 %766, 7
  br i1 %768, label %771, label %769

769:                                              ; preds = %764
  %770 = icmp eq i32 %766, 0
  br i1 %770, label %824, label %811

771:                                              ; preds = %764
  %772 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !11
  %773 = zext i8 %772 to i64
  %774 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 1
  %775 = load i8, i8 addrspace(4)* %774, align 1, !tbaa !11
  %776 = zext i8 %775 to i64
  %777 = shl nuw nsw i64 %776, 8
  %778 = or i64 %777, %773
  %779 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 2
  %780 = load i8, i8 addrspace(4)* %779, align 1, !tbaa !11
  %781 = zext i8 %780 to i64
  %782 = shl nuw nsw i64 %781, 16
  %783 = or i64 %778, %782
  %784 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 3
  %785 = load i8, i8 addrspace(4)* %784, align 1, !tbaa !11
  %786 = zext i8 %785 to i64
  %787 = shl nuw nsw i64 %786, 24
  %788 = or i64 %783, %787
  %789 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 4
  %790 = load i8, i8 addrspace(4)* %789, align 1, !tbaa !11
  %791 = zext i8 %790 to i64
  %792 = shl nuw nsw i64 %791, 32
  %793 = or i64 %788, %792
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 5
  %795 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !11
  %796 = zext i8 %795 to i64
  %797 = shl nuw nsw i64 %796, 40
  %798 = or i64 %793, %797
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 6
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !11
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 48
  %803 = or i64 %798, %802
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 7
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !11
  %806 = zext i8 %805 to i64
  %807 = shl nuw i64 %806, 56
  %808 = or i64 %803, %807
  %809 = add nsw i32 %766, -8
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 8
  br label %824

811:                                              ; preds = %769, %811
  %812 = phi i32 [ %822, %811 ], [ 0, %769 ]
  %813 = phi i64 [ %821, %811 ], [ 0, %769 ]
  %814 = zext i32 %812 to i64
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %765, i64 %814
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !11
  %817 = zext i8 %816 to i64
  %818 = shl i32 %812, 3
  %819 = zext i32 %818 to i64
  %820 = shl nuw i64 %817, %819
  %821 = or i64 %820, %813
  %822 = add nuw nsw i32 %812, 1
  %823 = icmp eq i32 %822, %766
  br i1 %823, label %824, label %811

824:                                              ; preds = %811, %771, %769
  %825 = phi i8 addrspace(4)* [ %810, %771 ], [ %765, %769 ], [ %765, %811 ]
  %826 = phi i32 [ %809, %771 ], [ 0, %769 ], [ 0, %811 ]
  %827 = phi i64 [ %808, %771 ], [ 0, %769 ], [ %821, %811 ]
  %828 = icmp ugt i32 %826, 7
  br i1 %828, label %831, label %829

829:                                              ; preds = %824
  %830 = icmp eq i32 %826, 0
  br i1 %830, label %884, label %871

831:                                              ; preds = %824
  %832 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !11
  %833 = zext i8 %832 to i64
  %834 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 1
  %835 = load i8, i8 addrspace(4)* %834, align 1, !tbaa !11
  %836 = zext i8 %835 to i64
  %837 = shl nuw nsw i64 %836, 8
  %838 = or i64 %837, %833
  %839 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 2
  %840 = load i8, i8 addrspace(4)* %839, align 1, !tbaa !11
  %841 = zext i8 %840 to i64
  %842 = shl nuw nsw i64 %841, 16
  %843 = or i64 %838, %842
  %844 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 3
  %845 = load i8, i8 addrspace(4)* %844, align 1, !tbaa !11
  %846 = zext i8 %845 to i64
  %847 = shl nuw nsw i64 %846, 24
  %848 = or i64 %843, %847
  %849 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 4
  %850 = load i8, i8 addrspace(4)* %849, align 1, !tbaa !11
  %851 = zext i8 %850 to i64
  %852 = shl nuw nsw i64 %851, 32
  %853 = or i64 %848, %852
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 5
  %855 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !11
  %856 = zext i8 %855 to i64
  %857 = shl nuw nsw i64 %856, 40
  %858 = or i64 %853, %857
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 6
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !11
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 48
  %863 = or i64 %858, %862
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 7
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !11
  %866 = zext i8 %865 to i64
  %867 = shl nuw i64 %866, 56
  %868 = or i64 %863, %867
  %869 = add nsw i32 %826, -8
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 8
  br label %884

871:                                              ; preds = %829, %871
  %872 = phi i32 [ %882, %871 ], [ 0, %829 ]
  %873 = phi i64 [ %881, %871 ], [ 0, %829 ]
  %874 = zext i32 %872 to i64
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %825, i64 %874
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !11
  %877 = zext i8 %876 to i64
  %878 = shl i32 %872, 3
  %879 = zext i32 %878 to i64
  %880 = shl nuw i64 %877, %879
  %881 = or i64 %880, %873
  %882 = add nuw nsw i32 %872, 1
  %883 = icmp eq i32 %882, %826
  br i1 %883, label %884, label %871

884:                                              ; preds = %871, %831, %829
  %885 = phi i8 addrspace(4)* [ %870, %831 ], [ %825, %829 ], [ %825, %871 ]
  %886 = phi i32 [ %869, %831 ], [ 0, %829 ], [ 0, %871 ]
  %887 = phi i64 [ %868, %831 ], [ 0, %829 ], [ %881, %871 ]
  %888 = icmp ugt i32 %886, 7
  br i1 %888, label %891, label %889

889:                                              ; preds = %884
  %890 = icmp eq i32 %886, 0
  br i1 %890, label %942, label %929

891:                                              ; preds = %884
  %892 = load i8, i8 addrspace(4)* %885, align 1, !tbaa !11
  %893 = zext i8 %892 to i64
  %894 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 1
  %895 = load i8, i8 addrspace(4)* %894, align 1, !tbaa !11
  %896 = zext i8 %895 to i64
  %897 = shl nuw nsw i64 %896, 8
  %898 = or i64 %897, %893
  %899 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 2
  %900 = load i8, i8 addrspace(4)* %899, align 1, !tbaa !11
  %901 = zext i8 %900 to i64
  %902 = shl nuw nsw i64 %901, 16
  %903 = or i64 %898, %902
  %904 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 3
  %905 = load i8, i8 addrspace(4)* %904, align 1, !tbaa !11
  %906 = zext i8 %905 to i64
  %907 = shl nuw nsw i64 %906, 24
  %908 = or i64 %903, %907
  %909 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 4
  %910 = load i8, i8 addrspace(4)* %909, align 1, !tbaa !11
  %911 = zext i8 %910 to i64
  %912 = shl nuw nsw i64 %911, 32
  %913 = or i64 %908, %912
  %914 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 5
  %915 = load i8, i8 addrspace(4)* %914, align 1, !tbaa !11
  %916 = zext i8 %915 to i64
  %917 = shl nuw nsw i64 %916, 40
  %918 = or i64 %913, %917
  %919 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 6
  %920 = load i8, i8 addrspace(4)* %919, align 1, !tbaa !11
  %921 = zext i8 %920 to i64
  %922 = shl nuw nsw i64 %921, 48
  %923 = or i64 %918, %922
  %924 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 7
  %925 = load i8, i8 addrspace(4)* %924, align 1, !tbaa !11
  %926 = zext i8 %925 to i64
  %927 = shl nuw i64 %926, 56
  %928 = or i64 %923, %927
  br label %942

929:                                              ; preds = %889, %929
  %930 = phi i32 [ %940, %929 ], [ 0, %889 ]
  %931 = phi i64 [ %939, %929 ], [ 0, %889 ]
  %932 = zext i32 %930 to i64
  %933 = getelementptr inbounds i8, i8 addrspace(4)* %885, i64 %932
  %934 = load i8, i8 addrspace(4)* %933, align 1, !tbaa !11
  %935 = zext i8 %934 to i64
  %936 = shl i32 %930, 3
  %937 = zext i32 %936 to i64
  %938 = shl nuw i64 %935, %937
  %939 = or i64 %938, %931
  %940 = add nuw nsw i32 %930, 1
  %941 = icmp eq i32 %940, %886
  br i1 %941, label %942, label %929

942:                                              ; preds = %929, %891, %889
  %943 = phi i64 [ %928, %891 ], [ 0, %889 ], [ %939, %929 ]
  %944 = shl nuw nsw i64 %525, 2
  %945 = add nuw nsw i64 %944, 28
  %946 = and i64 %945, 480
  %947 = and i64 %527, -225
  %948 = or i64 %947, %946
  %949 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %505, i64 noundef %948, i64 noundef %587, i64 noundef %647, i64 noundef %707, i64 noundef %767, i64 noundef %827, i64 noundef %887, i64 noundef %943) #10
  %950 = sub i64 %517, %525
  %951 = getelementptr inbounds i8, i8 addrspace(4)* %518, i64 %525
  %952 = icmp eq i64 %950, 0
  br i1 %952, label %953, label %516

953:                                              ; preds = %942, %508
  %954 = phi <2 x i64> [ %511, %508 ], [ %949, %942 ]
  %955 = extractelement <2 x i64> %954, i64 0
  %956 = zext i32 %496 to i64
  %957 = and i64 %955, -225
  %958 = or i64 %957, 32
  %959 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %505, i64 noundef %958, i64 noundef %956, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %960 = extractelement <2 x i64> %959, i64 0
  %961 = zext i32 %497 to i64
  %962 = and i64 %960, -227
  %963 = or i64 %962, 34
  %964 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %505, i64 noundef %963, i64 noundef %961, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %965

965:                                              ; preds = %953, %494
  %966 = sext i32 %24 to i64
  %967 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %966, i32 0, i32 0, i32 0, i32 0, i64 0
  %968 = load float, float addrspace(1)* %967, align 4, !tbaa !14
  %969 = fmul contract float %968, 2.550000e+02
  %970 = fptoui float %969 to i8
  %971 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %966, i32 0, i32 0, i32 0, i32 0, i64 1
  %972 = load float, float addrspace(1)* %971, align 4, !tbaa !14
  %973 = fmul contract float %972, 2.550000e+02
  %974 = fptoui float %973 to i8
  %975 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %966, i32 0, i32 0, i32 0, i32 0, i64 2
  %976 = load float, float addrspace(1)* %975, align 4, !tbaa !14
  %977 = fmul contract float %976, 2.550000e+02
  %978 = fptoui float %977 to i8
  %979 = sext i32 %495 to i64
  %980 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %979
  store i8 %970, i8 addrspace(1)* %980, align 1, !tbaa !14
  %981 = add nsw i32 %495, 1
  %982 = sext i32 %981 to i64
  %983 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %982
  store i8 %974, i8 addrspace(1)* %983, align 1, !tbaa !14
  %984 = sext i32 %496 to i64
  %985 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %984
  store i8 %978, i8 addrspace(1)* %985, align 1, !tbaa !14
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #3 {
  %10 = alloca i8*, align 8, addrspace(5)
  %11 = alloca i32, align 4, addrspace(5)
  %12 = alloca i64, align 8, addrspace(5)
  %13 = alloca i64, align 8, addrspace(5)
  %14 = alloca i64, align 8, addrspace(5)
  %15 = alloca i64, align 8, addrspace(5)
  %16 = alloca i64, align 8, addrspace(5)
  %17 = alloca i64, align 8, addrspace(5)
  %18 = alloca i64, align 8, addrspace(5)
  %19 = alloca i64, align 8, addrspace(5)
  %20 = alloca i32, align 4, addrspace(5)
  %21 = alloca i32, align 4, addrspace(5)
  %22 = alloca %0 addrspace(1)*, align 8, addrspace(5)
  %23 = alloca i64, align 8, addrspace(5)
  %24 = alloca %1 addrspace(1)*, align 8, addrspace(5)
  %25 = alloca %2 addrspace(1)*, align 8, addrspace(5)
  %26 = alloca <2 x i64>, align 16, addrspace(5)
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !17
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !19
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !19
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !21
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !19
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !19
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !17
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
  %50 = and i64 %49, %45
  %51 = getelementptr inbounds %1, %1 addrspace(1)* %48, i64 %50, i32 0
  %52 = load atomic i64, i64 addrspace(1)* %51 syncscope("one-as") monotonic, align 8
  %53 = cmpxchg i64 addrspace(1)* %44, i64 %45, i64 %52 syncscope("one-as") acquire monotonic, align 8
  %54 = extractvalue { i64, i1 } %53, 1
  br i1 %54, label %65, label %55

55:                                               ; preds = %55, %43
  %56 = phi { i64, i1 } [ %63, %55 ], [ %53, %43 ]
  %57 = extractvalue { i64, i1 } %56, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
  %60 = and i64 %59, %57
  %61 = getelementptr inbounds %1, %1 addrspace(1)* %58, i64 %60, i32 0
  %62 = load atomic i64, i64 addrspace(1)* %61 syncscope("one-as") monotonic, align 8
  %63 = cmpxchg i64 addrspace(1)* %44, i64 %57, i64 %62 syncscope("one-as") acquire monotonic, align 8
  %64 = extractvalue { i64, i1 } %63, 1
  br i1 %64, label %65, label %55

65:                                               ; preds = %55, %43
  %66 = phi { i64, i1 } [ %53, %43 ], [ %63, %55 ]
  %67 = extractvalue { i64, i1 } %66, 0
  br label %68

68:                                               ; preds = %9, %65
  %69 = phi i64 [ %67, %65 ], [ 0, %9 ]
  %70 = trunc i64 %69 to i32
  %71 = lshr i64 %69, 32
  %72 = trunc i64 %71 to i32
  %73 = call i32 @llvm.amdgcn.readfirstlane(i32 %70)
  %74 = call i32 @llvm.amdgcn.readfirstlane(i32 %72)
  %75 = zext i32 %74 to i64
  %76 = shl nuw i64 %75, 32
  %77 = zext i32 %73 to i64
  %78 = or i64 %76, %77
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !7
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !22
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !19
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %110 = call i64 @llvm.read_register.i64(metadata !27) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !28
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !30
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !31
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !7
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !7
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !7
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !7
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !7
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !7
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !7
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !7
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !22
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !25
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !32
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !32
  %145 = cmpxchg i64 addrspace(1)* %132, i64 %144, i64 %127 syncscope("one-as") release monotonic, align 8
  %146 = extractvalue { i64, i1 } %145, 1
  br i1 %146, label %147, label %142

147:                                              ; preds = %142, %131
  %148 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 2, i32 0
  %149 = load i64, i64 addrspace(1)* %148, align 8
  %150 = inttoptr i64 %149 to %4 addrspace(1)*
  %151 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 1, i32 0
  %152 = atomicrmw add i64 addrspace(1)* %151, i64 1 syncscope("one-as") release, align 8
  %153 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 2
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !33
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !35
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %169 = icmp eq i32 %167, %168
  %170 = getelementptr inbounds %1, %1 addrspace(1)* %165, i64 0, i32 3
  br label %171

171:                                              ; preds = %179, %163
  br i1 %169, label %172, label %175

172:                                              ; preds = %171
  %173 = load atomic i32, i32 addrspace(1)* %170 syncscope("one-as") acquire, align 4
  %174 = and i32 %173, 1
  br label %175

175:                                              ; preds = %172, %171
  %176 = phi i32 [ %174, %172 ], [ 1, %171 ]
  %177 = call i32 @llvm.amdgcn.readfirstlane(i32 %176)
  %178 = icmp eq i32 %177, 0
  br i1 %178, label %180, label %179

179:                                              ; preds = %175
  call void @llvm.amdgcn.s.sleep(i32 1)
  br label %171

180:                                              ; preds = %175
  %181 = zext i32 %167 to i64
  %182 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 0
  %183 = getelementptr inbounds %2, %2 addrspace(1)* %166, i64 0, i32 0, i64 %181, i64 1
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !7
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !7
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !25
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !22
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !32
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !32
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #6
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #6
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #6
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #6
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #6
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #6
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #6
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #4

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #5

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #6

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #7

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #4 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #5 = { mustprogress nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind readonly }
attributes #8 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #9 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { convergent nounwind }
attributes #11 = { convergent }

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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C++ TBAA"}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !9, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !9, i64 0}
!21 = !{i64 2662}
!22 = !{!23, !18, i64 0}
!23 = !{!"", !18, i64 0, !18, i64 8, !24, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!24 = !{!"hsa_signal_s", !8, i64 0}
!25 = !{!23, !8, i64 40}
!26 = !{!23, !18, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !20, i64 16}
!29 = !{!"", !8, i64 0, !8, i64 8, !20, i64 16, !20, i64 20}
!30 = !{!29, !8, i64 8}
!31 = !{!29, !20, i64 20}
!32 = !{!29, !8, i64 0}
!33 = !{!34, !8, i64 16}
!34 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !20, i64 24, !20, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!35 = !{!34, !20, i64 24}
