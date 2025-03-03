; ModuleID = '../data/hip_kernels/873/1/main.cu'
source_filename = "../data/hip_kernels/873/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [29 x i8] c"found dN_pTdpTdphidy_d nan \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z14blockReductionPdii(double addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = zext i32 %12 to i64
  %14 = sext i32 %1 to i64
  %15 = icmp slt i64 %13, %14
  %16 = icmp ne i32 %2, 1
  %17 = select i1 %15, i1 %16, i1 false
  %18 = icmp sgt i32 %2, 1
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %488

20:                                               ; preds = %3
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %13
  %22 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 24
  %24 = bitcast i8 addrspace(4)* %23 to i64 addrspace(4)*
  br label %25

25:                                               ; preds = %20, %485
  %26 = phi i32 [ 1, %20 ], [ %486, %485 ]
  %27 = mul nsw i32 %26, %1
  %28 = sext i32 %27 to i64
  %29 = add nsw i64 %28, %13
  %30 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %32 = load double, double addrspace(1)* %21, align 8, !tbaa !7
  %33 = fadd contract double %31, %32
  store double %33, double addrspace(1)* %21, align 8, !tbaa !7
  %34 = fcmp uno double %33, 0.000000e+00
  br i1 %34, label %35, label %485

35:                                               ; preds = %25
  %36 = load i64, i64 addrspace(4)* %24, align 8, !tbaa !11
  %37 = inttoptr i64 %36 to i8 addrspace(1)*
  %38 = addrspacecast i8 addrspace(1)* %37 to i8*
  %39 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %38, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %40 = extractelement <2 x i64> %39, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %41, label %45

41:                                               ; preds = %35
  %42 = and i64 %40, -227
  %43 = or i64 %42, 34
  %44 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %38, i64 noundef %43, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %485

45:                                               ; preds = %35
  %46 = and i64 %40, -3
  %47 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %46, i64 0
  br label %48

48:                                               ; preds = %474, %45
  %49 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str, i64 0, i64 28) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([29 x i8]* addrspacecast ([29 x i8] addrspace(4)* @.str to [29 x i8]*) to i64)), i64 1))), %45 ], [ %482, %474 ]
  %50 = phi i8 addrspace(4)* [ getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str, i64 0, i64 0), %45 ], [ %483, %474 ]
  %51 = phi <2 x i64> [ %47, %45 ], [ %481, %474 ]
  %52 = icmp ugt i64 %49, 56
  %53 = extractelement <2 x i64> %51, i64 0
  %54 = or i64 %53, 2
  %55 = insertelement <2 x i64> poison, i64 %54, i64 0
  %56 = select i1 %52, <2 x i64> %51, <2 x i64> %55
  %57 = tail call i64 @llvm.umin.i64(i64 %49, i64 56)
  %58 = trunc i64 %57 to i32
  %59 = extractelement <2 x i64> %56, i64 0
  %60 = icmp ugt i32 %58, 7
  br i1 %60, label %63, label %61

61:                                               ; preds = %48
  %62 = icmp eq i32 %58, 0
  br i1 %62, label %116, label %103

63:                                               ; preds = %48
  %64 = load i8, i8 addrspace(4)* %50, align 1, !tbaa !15
  %65 = zext i8 %64 to i64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 1
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !15
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 8
  %70 = or i64 %69, %65
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 2
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !15
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 16
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 3
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !15
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 24
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 4
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !15
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 32
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 5
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !15
  %88 = zext i8 %87 to i64
  %89 = shl nuw nsw i64 %88, 40
  %90 = or i64 %85, %89
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 6
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !15
  %93 = zext i8 %92 to i64
  %94 = shl nuw nsw i64 %93, 48
  %95 = or i64 %90, %94
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 7
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !15
  %98 = zext i8 %97 to i64
  %99 = shl nuw i64 %98, 56
  %100 = or i64 %95, %99
  %101 = add nsw i32 %58, -8
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 8
  br label %116

103:                                              ; preds = %61, %103
  %104 = phi i32 [ %114, %103 ], [ 0, %61 ]
  %105 = phi i64 [ %113, %103 ], [ 0, %61 ]
  %106 = zext i32 %104 to i64
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 %106
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !15
  %109 = zext i8 %108 to i64
  %110 = shl i32 %104, 3
  %111 = zext i32 %110 to i64
  %112 = shl nuw i64 %109, %111
  %113 = or i64 %112, %105
  %114 = add nuw nsw i32 %104, 1
  %115 = icmp eq i32 %114, %58
  br i1 %115, label %116, label %103, !llvm.loop !16

116:                                              ; preds = %103, %63, %61
  %117 = phi i8 addrspace(4)* [ %102, %63 ], [ %50, %61 ], [ %50, %103 ]
  %118 = phi i32 [ %101, %63 ], [ 0, %61 ], [ 0, %103 ]
  %119 = phi i64 [ %100, %63 ], [ 0, %61 ], [ %113, %103 ]
  %120 = icmp ugt i32 %118, 7
  br i1 %120, label %123, label %121

121:                                              ; preds = %116
  %122 = icmp eq i32 %118, 0
  br i1 %122, label %176, label %163

123:                                              ; preds = %116
  %124 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !15
  %125 = zext i8 %124 to i64
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 1
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !15
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 8
  %130 = or i64 %129, %125
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 2
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !15
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 16
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 3
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !15
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 24
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 4
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !15
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 32
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 5
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !15
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 40
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 6
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !15
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 48
  %155 = or i64 %150, %154
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 7
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !15
  %158 = zext i8 %157 to i64
  %159 = shl nuw i64 %158, 56
  %160 = or i64 %155, %159
  %161 = add nsw i32 %118, -8
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 8
  br label %176

163:                                              ; preds = %121, %163
  %164 = phi i32 [ %174, %163 ], [ 0, %121 ]
  %165 = phi i64 [ %173, %163 ], [ 0, %121 ]
  %166 = zext i32 %164 to i64
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %117, i64 %166
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !15
  %169 = zext i8 %168 to i64
  %170 = shl i32 %164, 3
  %171 = zext i32 %170 to i64
  %172 = shl nuw i64 %169, %171
  %173 = or i64 %172, %165
  %174 = add nuw nsw i32 %164, 1
  %175 = icmp eq i32 %174, %118
  br i1 %175, label %176, label %163

176:                                              ; preds = %163, %123, %121
  %177 = phi i8 addrspace(4)* [ %162, %123 ], [ %117, %121 ], [ %117, %163 ]
  %178 = phi i32 [ %161, %123 ], [ 0, %121 ], [ 0, %163 ]
  %179 = phi i64 [ %160, %123 ], [ 0, %121 ], [ %173, %163 ]
  %180 = icmp ugt i32 %178, 7
  br i1 %180, label %183, label %181

181:                                              ; preds = %176
  %182 = icmp eq i32 %178, 0
  br i1 %182, label %236, label %223

183:                                              ; preds = %176
  %184 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !15
  %185 = zext i8 %184 to i64
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 1
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !15
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 8
  %190 = or i64 %189, %185
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 2
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !15
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 16
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 3
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !15
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 24
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 4
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !15
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 32
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 5
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !15
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 40
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 6
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !15
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 48
  %215 = or i64 %210, %214
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 7
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !15
  %218 = zext i8 %217 to i64
  %219 = shl nuw i64 %218, 56
  %220 = or i64 %215, %219
  %221 = add nsw i32 %178, -8
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 8
  br label %236

223:                                              ; preds = %181, %223
  %224 = phi i32 [ %234, %223 ], [ 0, %181 ]
  %225 = phi i64 [ %233, %223 ], [ 0, %181 ]
  %226 = zext i32 %224 to i64
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %177, i64 %226
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !15
  %229 = zext i8 %228 to i64
  %230 = shl i32 %224, 3
  %231 = zext i32 %230 to i64
  %232 = shl nuw i64 %229, %231
  %233 = or i64 %232, %225
  %234 = add nuw nsw i32 %224, 1
  %235 = icmp eq i32 %234, %178
  br i1 %235, label %236, label %223

236:                                              ; preds = %223, %183, %181
  %237 = phi i8 addrspace(4)* [ %222, %183 ], [ %177, %181 ], [ %177, %223 ]
  %238 = phi i32 [ %221, %183 ], [ 0, %181 ], [ 0, %223 ]
  %239 = phi i64 [ %220, %183 ], [ 0, %181 ], [ %233, %223 ]
  %240 = icmp ugt i32 %238, 7
  br i1 %240, label %243, label %241

241:                                              ; preds = %236
  %242 = icmp eq i32 %238, 0
  br i1 %242, label %296, label %283

243:                                              ; preds = %236
  %244 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !15
  %245 = zext i8 %244 to i64
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 1
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !15
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 8
  %250 = or i64 %249, %245
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 2
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !15
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 16
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 3
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !15
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 24
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 4
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !15
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 32
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 5
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !15
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 40
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 6
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !15
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 48
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 7
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !15
  %278 = zext i8 %277 to i64
  %279 = shl nuw i64 %278, 56
  %280 = or i64 %275, %279
  %281 = add nsw i32 %238, -8
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 8
  br label %296

283:                                              ; preds = %241, %283
  %284 = phi i32 [ %294, %283 ], [ 0, %241 ]
  %285 = phi i64 [ %293, %283 ], [ 0, %241 ]
  %286 = zext i32 %284 to i64
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %237, i64 %286
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !15
  %289 = zext i8 %288 to i64
  %290 = shl i32 %284, 3
  %291 = zext i32 %290 to i64
  %292 = shl nuw i64 %289, %291
  %293 = or i64 %292, %285
  %294 = add nuw nsw i32 %284, 1
  %295 = icmp eq i32 %294, %238
  br i1 %295, label %296, label %283

296:                                              ; preds = %283, %243, %241
  %297 = phi i8 addrspace(4)* [ %282, %243 ], [ %237, %241 ], [ %237, %283 ]
  %298 = phi i32 [ %281, %243 ], [ 0, %241 ], [ 0, %283 ]
  %299 = phi i64 [ %280, %243 ], [ 0, %241 ], [ %293, %283 ]
  %300 = icmp ugt i32 %298, 7
  br i1 %300, label %303, label %301

301:                                              ; preds = %296
  %302 = icmp eq i32 %298, 0
  br i1 %302, label %356, label %343

303:                                              ; preds = %296
  %304 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !15
  %305 = zext i8 %304 to i64
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 1
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !15
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 8
  %310 = or i64 %309, %305
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 2
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !15
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 16
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 3
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !15
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 24
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 4
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !15
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 32
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 5
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !15
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 40
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 6
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !15
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 48
  %335 = or i64 %330, %334
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 7
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !15
  %338 = zext i8 %337 to i64
  %339 = shl nuw i64 %338, 56
  %340 = or i64 %335, %339
  %341 = add nsw i32 %298, -8
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 8
  br label %356

343:                                              ; preds = %301, %343
  %344 = phi i32 [ %354, %343 ], [ 0, %301 ]
  %345 = phi i64 [ %353, %343 ], [ 0, %301 ]
  %346 = zext i32 %344 to i64
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %297, i64 %346
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !15
  %349 = zext i8 %348 to i64
  %350 = shl i32 %344, 3
  %351 = zext i32 %350 to i64
  %352 = shl nuw i64 %349, %351
  %353 = or i64 %352, %345
  %354 = add nuw nsw i32 %344, 1
  %355 = icmp eq i32 %354, %298
  br i1 %355, label %356, label %343

356:                                              ; preds = %343, %303, %301
  %357 = phi i8 addrspace(4)* [ %342, %303 ], [ %297, %301 ], [ %297, %343 ]
  %358 = phi i32 [ %341, %303 ], [ 0, %301 ], [ 0, %343 ]
  %359 = phi i64 [ %340, %303 ], [ 0, %301 ], [ %353, %343 ]
  %360 = icmp ugt i32 %358, 7
  br i1 %360, label %363, label %361

361:                                              ; preds = %356
  %362 = icmp eq i32 %358, 0
  br i1 %362, label %416, label %403

363:                                              ; preds = %356
  %364 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !15
  %365 = zext i8 %364 to i64
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 1
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !15
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 8
  %370 = or i64 %369, %365
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 2
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !15
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 16
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 3
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !15
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 24
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 4
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !15
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 32
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 5
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !15
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 40
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 6
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !15
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 48
  %395 = or i64 %390, %394
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 7
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !15
  %398 = zext i8 %397 to i64
  %399 = shl nuw i64 %398, 56
  %400 = or i64 %395, %399
  %401 = add nsw i32 %358, -8
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 8
  br label %416

403:                                              ; preds = %361, %403
  %404 = phi i32 [ %414, %403 ], [ 0, %361 ]
  %405 = phi i64 [ %413, %403 ], [ 0, %361 ]
  %406 = zext i32 %404 to i64
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %357, i64 %406
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !15
  %409 = zext i8 %408 to i64
  %410 = shl i32 %404, 3
  %411 = zext i32 %410 to i64
  %412 = shl nuw i64 %409, %411
  %413 = or i64 %412, %405
  %414 = add nuw nsw i32 %404, 1
  %415 = icmp eq i32 %414, %358
  br i1 %415, label %416, label %403

416:                                              ; preds = %403, %363, %361
  %417 = phi i8 addrspace(4)* [ %402, %363 ], [ %357, %361 ], [ %357, %403 ]
  %418 = phi i32 [ %401, %363 ], [ 0, %361 ], [ 0, %403 ]
  %419 = phi i64 [ %400, %363 ], [ 0, %361 ], [ %413, %403 ]
  %420 = icmp ugt i32 %418, 7
  br i1 %420, label %423, label %421

421:                                              ; preds = %416
  %422 = icmp eq i32 %418, 0
  br i1 %422, label %474, label %461

423:                                              ; preds = %416
  %424 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !15
  %425 = zext i8 %424 to i64
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 1
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !15
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 8
  %430 = or i64 %429, %425
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 2
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !15
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 16
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 3
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !15
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 24
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 4
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !15
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 32
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 5
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !15
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 40
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 6
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !15
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 48
  %455 = or i64 %450, %454
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 7
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !15
  %458 = zext i8 %457 to i64
  %459 = shl nuw i64 %458, 56
  %460 = or i64 %455, %459
  br label %474

461:                                              ; preds = %421, %461
  %462 = phi i32 [ %472, %461 ], [ 0, %421 ]
  %463 = phi i64 [ %471, %461 ], [ 0, %421 ]
  %464 = zext i32 %462 to i64
  %465 = getelementptr inbounds i8, i8 addrspace(4)* %417, i64 %464
  %466 = load i8, i8 addrspace(4)* %465, align 1, !tbaa !15
  %467 = zext i8 %466 to i64
  %468 = shl i32 %462, 3
  %469 = zext i32 %468 to i64
  %470 = shl nuw i64 %467, %469
  %471 = or i64 %470, %463
  %472 = add nuw nsw i32 %462, 1
  %473 = icmp eq i32 %472, %418
  br i1 %473, label %474, label %461

474:                                              ; preds = %461, %423, %421
  %475 = phi i64 [ %460, %423 ], [ 0, %421 ], [ %471, %461 ]
  %476 = shl nuw nsw i64 %57, 2
  %477 = add nuw nsw i64 %476, 28
  %478 = and i64 %477, 480
  %479 = and i64 %59, -225
  %480 = or i64 %479, %478
  %481 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %38, i64 noundef %480, i64 noundef %119, i64 noundef %179, i64 noundef %239, i64 noundef %299, i64 noundef %359, i64 noundef %419, i64 noundef %475) #10
  %482 = sub i64 %49, %57
  %483 = getelementptr inbounds i8, i8 addrspace(4)* %50, i64 %57
  %484 = icmp eq i64 %482, 0
  br i1 %484, label %485, label %48

485:                                              ; preds = %474, %41, %25
  %486 = add nuw nsw i32 %26, 1
  %487 = icmp eq i32 %486, %2
  br i1 %487, label %488, label %25, !llvm.loop !18

488:                                              ; preds = %485, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !22
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !11
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !11
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !11
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !11
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !11
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !11
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !11
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !11
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !28
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !29
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !28
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !22
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %110 = call i64 @llvm.read_register.i64(metadata !30) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !31
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !33
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !34
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !11
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !11
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !11
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !11
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !11
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !11
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !11
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !11
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !28
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !35
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !35
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !36
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !38
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
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !28
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !25
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !35
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !35
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!13, !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !13, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !13, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!27 = !{!"hsa_signal_s", !12, i64 0}
!28 = !{!26, !12, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !12, i64 0, !12, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !12, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !12, i64 0}
!36 = !{!37, !12, i64 16}
!37 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !23, i64 24, !23, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!38 = !{!37, !23, i64 24}
