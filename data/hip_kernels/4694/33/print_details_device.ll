; ModuleID = '../data/hip_kernels/4694/33/main.cu'
source_filename = "../data/hip_kernels/4694/33/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [117 x i8] c"blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, blockDim.x : %d, blockDim.y : %d, gridDim.x : %d, gridDim.y :%d \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13print_detailsv() local_unnamed_addr #1 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %3 = bitcast i8 addrspace(4)* %2 to i16 addrspace(4)*
  %4 = load i16, i16 addrspace(4)* %3, align 4, !range !4, !invariant.load !5
  %5 = zext i16 %4 to i32
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !6
  %9 = getelementptr i8, i8 addrspace(4)* %1, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 16
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !15
  %16 = udiv i32 %8, %5
  %17 = udiv i32 %15, %12
  %18 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 24
  %20 = bitcast i8 addrspace(4)* %19 to i64 addrspace(4)*
  %21 = load i64, i64 addrspace(4)* %20, align 8, !tbaa !16
  %22 = inttoptr i64 %21 to i8 addrspace(1)*
  %23 = addrspacecast i8 addrspace(1)* %22 to i8*
  %24 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %25 = extractelement <2 x i64> %24, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([117 x i8], [117 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %35, label %26

26:                                               ; preds = %0, %26
  %27 = phi i8 addrspace(4)* [ %28, %26 ], [ getelementptr inbounds ([117 x i8], [117 x i8] addrspace(4)* @.str, i64 0, i64 0), %0 ]
  %28 = getelementptr i8, i8 addrspace(4)* %27, i64 1
  %29 = load i8, i8 addrspace(4)* %27, align 1
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %31, label %26

31:                                               ; preds = %26
  %32 = addrspacecast i8 addrspace(4)* %27 to i8*
  %33 = ptrtoint i8* %32 to i64
  %34 = add i64 %33, add (i64 sub (i64 0, i64 ptrtoint ([117 x i8]* addrspacecast ([117 x i8] addrspace(4)* @.str to [117 x i8]*) to i64)), i64 1)
  br label %35

35:                                               ; preds = %31, %0
  %36 = phi i64 [ %34, %31 ], [ 0, %0 ]
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([117 x i8], [117 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %37, label %41

37:                                               ; preds = %35
  %38 = and i64 %25, -225
  %39 = or i64 %38, 32
  %40 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %39, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %482

41:                                               ; preds = %35
  %42 = and i64 %25, 2
  %43 = and i64 %25, -3
  %44 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %43, i64 0
  br label %45

45:                                               ; preds = %471, %41
  %46 = phi i64 [ %36, %41 ], [ %479, %471 ]
  %47 = phi i8 addrspace(4)* [ getelementptr inbounds ([117 x i8], [117 x i8] addrspace(4)* @.str, i64 0, i64 0), %41 ], [ %480, %471 ]
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
  %61 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !17
  %62 = zext i8 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 1
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !17
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 8
  %67 = or i64 %66, %62
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 2
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !17
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 16
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 3
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !17
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 24
  %77 = or i64 %72, %76
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 4
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !17
  %80 = zext i8 %79 to i64
  %81 = shl nuw nsw i64 %80, 32
  %82 = or i64 %77, %81
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 5
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !17
  %85 = zext i8 %84 to i64
  %86 = shl nuw nsw i64 %85, 40
  %87 = or i64 %82, %86
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 6
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !17
  %90 = zext i8 %89 to i64
  %91 = shl nuw nsw i64 %90, 48
  %92 = or i64 %87, %91
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 7
  %94 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !17
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
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !17
  %106 = zext i8 %105 to i64
  %107 = shl i32 %101, 3
  %108 = zext i32 %107 to i64
  %109 = shl nuw i64 %106, %108
  %110 = or i64 %109, %102
  %111 = add nuw nsw i32 %101, 1
  %112 = icmp eq i32 %111, %55
  br i1 %112, label %113, label %100, !llvm.loop !18

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
  %121 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !17
  %122 = zext i8 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 1
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !17
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 8
  %127 = or i64 %126, %122
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 2
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !17
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 16
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 3
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !17
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 24
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 4
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !17
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 32
  %142 = or i64 %137, %141
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 5
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !17
  %145 = zext i8 %144 to i64
  %146 = shl nuw nsw i64 %145, 40
  %147 = or i64 %142, %146
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 6
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !17
  %150 = zext i8 %149 to i64
  %151 = shl nuw nsw i64 %150, 48
  %152 = or i64 %147, %151
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %114, i64 7
  %154 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !17
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
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !17
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
  %181 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !17
  %182 = zext i8 %181 to i64
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 1
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !17
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 8
  %187 = or i64 %186, %182
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 2
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !17
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 16
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 3
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !17
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 24
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 4
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !17
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 32
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 5
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !17
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 40
  %207 = or i64 %202, %206
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 6
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !17
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 48
  %212 = or i64 %207, %211
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %174, i64 7
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !17
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
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !17
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
  %241 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !17
  %242 = zext i8 %241 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 1
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !17
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 8
  %247 = or i64 %246, %242
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 2
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !17
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 16
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 3
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !17
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 24
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 4
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !17
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 32
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 5
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !17
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 40
  %267 = or i64 %262, %266
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 6
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !17
  %270 = zext i8 %269 to i64
  %271 = shl nuw nsw i64 %270, 48
  %272 = or i64 %267, %271
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %234, i64 7
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !17
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
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !17
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
  %301 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !17
  %302 = zext i8 %301 to i64
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 1
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !17
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 8
  %307 = or i64 %306, %302
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 2
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !17
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 16
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 3
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !17
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 24
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 4
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !17
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 32
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 5
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !17
  %325 = zext i8 %324 to i64
  %326 = shl nuw nsw i64 %325, 40
  %327 = or i64 %322, %326
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 6
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !17
  %330 = zext i8 %329 to i64
  %331 = shl nuw nsw i64 %330, 48
  %332 = or i64 %327, %331
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %294, i64 7
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !17
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
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !17
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
  %361 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !17
  %362 = zext i8 %361 to i64
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 1
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !17
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 8
  %367 = or i64 %366, %362
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 2
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !17
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 16
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 3
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !17
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 24
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 4
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !17
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 32
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 5
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !17
  %385 = zext i8 %384 to i64
  %386 = shl nuw nsw i64 %385, 40
  %387 = or i64 %382, %386
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 6
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !17
  %390 = zext i8 %389 to i64
  %391 = shl nuw nsw i64 %390, 48
  %392 = or i64 %387, %391
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %354, i64 7
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !17
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
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !17
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
  %421 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !17
  %422 = zext i8 %421 to i64
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 1
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !17
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 8
  %427 = or i64 %426, %422
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 2
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !17
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 16
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 3
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !17
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 24
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 4
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !17
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 32
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 5
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !17
  %445 = zext i8 %444 to i64
  %446 = shl nuw nsw i64 %445, 40
  %447 = or i64 %442, %446
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 6
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !17
  %450 = zext i8 %449 to i64
  %451 = shl nuw nsw i64 %450, 48
  %452 = or i64 %447, %451
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 7
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !17
  %455 = zext i8 %454 to i64
  %456 = shl nuw i64 %455, 56
  %457 = or i64 %452, %456
  br label %471

458:                                              ; preds = %418, %458
  %459 = phi i32 [ %469, %458 ], [ 0, %418 ]
  %460 = phi i64 [ %468, %458 ], [ 0, %418 ]
  %461 = zext i32 %459 to i64
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %414, i64 %461
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !17
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
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %477, i64 noundef %116, i64 noundef %176, i64 noundef %236, i64 noundef %296, i64 noundef %356, i64 noundef %416, i64 noundef %472) #10
  %479 = sub i64 %46, %54
  %480 = getelementptr inbounds i8, i8 addrspace(4)* %47, i64 %54
  %481 = icmp eq i64 %479, 0
  br i1 %481, label %482, label %45

482:                                              ; preds = %471, %37
  %483 = phi <2 x i64> [ %40, %37 ], [ %478, %471 ]
  %484 = mul i32 %17, %12
  %485 = icmp ugt i32 %15, %484
  %486 = zext i1 %485 to i32
  %487 = add i32 %17, %486
  %488 = mul i32 %16, %5
  %489 = icmp ugt i32 %8, %488
  %490 = zext i1 %489 to i32
  %491 = add i32 %16, %490
  %492 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %493 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %494 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %495 = extractelement <2 x i64> %483, i64 0
  %496 = zext i32 %494 to i64
  %497 = and i64 %495, -225
  %498 = or i64 %497, 32
  %499 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %498, i64 noundef %496, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %500 = extractelement <2 x i64> %499, i64 0
  %501 = zext i32 %493 to i64
  %502 = and i64 %500, -225
  %503 = or i64 %502, 32
  %504 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %503, i64 noundef %501, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %505 = extractelement <2 x i64> %504, i64 0
  %506 = zext i32 %492 to i64
  %507 = and i64 %505, -225
  %508 = or i64 %507, 32
  %509 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %508, i64 noundef %506, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %510 = extractelement <2 x i64> %509, i64 0
  %511 = zext i16 %4 to i64
  %512 = and i64 %510, -225
  %513 = or i64 %512, 32
  %514 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %513, i64 noundef %511, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %515 = extractelement <2 x i64> %514, i64 0
  %516 = zext i16 %11 to i64
  %517 = and i64 %515, -225
  %518 = or i64 %517, 32
  %519 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %518, i64 noundef %516, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %520 = extractelement <2 x i64> %519, i64 0
  %521 = zext i32 %491 to i64
  %522 = and i64 %520, -225
  %523 = or i64 %522, 32
  %524 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %523, i64 noundef %521, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %525 = extractelement <2 x i64> %524, i64 0
  %526 = zext i32 %487 to i64
  %527 = and i64 %525, -227
  %528 = or i64 %527, 34
  %529 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %528, i64 noundef %526, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !20
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !21
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !16
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !16
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !16
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !16
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !16
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !16
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !16
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !16
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !21
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !21
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !21
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !16
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !21
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !16
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !16
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !16
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !16
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !16
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !16
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !16
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !16
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !16
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !16
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !16
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !16
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !16
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !16
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !16
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
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
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !16
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !16
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !23
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{!7, !11, i64 16}
!16 = !{!12, !12, i64 0}
!17 = !{!9, !9, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = !{!13, !13, i64 0}
!21 = !{!11, !11, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !13, i64 0}
!24 = !{!"", !13, i64 0, !13, i64 8, !14, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!25 = !{!24, !12, i64 40}
!26 = !{!24, !13, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !11, i64 16}
!29 = !{!"", !12, i64 0, !12, i64 8, !11, i64 16, !11, i64 20}
!30 = !{!29, !12, i64 8}
!31 = !{!29, !11, i64 20}
!32 = !{!29, !12, i64 0}
!33 = !{!34, !12, i64 16}
!34 = !{!"amd_signal_s", !12, i64 0, !9, i64 8, !12, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 40, !9, i64 48, !9, i64 56}
!35 = !{!34, !11, i64 24}
