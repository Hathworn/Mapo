; ModuleID = '../data/hip_kernels/16057/20/main.cu'
source_filename = "../data/hip_kernels/16057/20/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [15 x i8] c"Index : %d %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z5Div45PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #1 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %22 = add i32 %20, %21
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %14, %23
  %25 = icmp sgt i32 %2, 1
  br i1 %25, label %26, label %39

26:                                               ; preds = %5
  %27 = add nsw i32 %24, %2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = add nsw i32 %24, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %34 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 24
  %35 = bitcast i8 addrspace(4)* %34 to i64 addrspace(4)*
  %36 = zext i32 %27 to i64
  %37 = zext i32 %30 to i64
  %38 = add i32 %2, -2
  br label %40

39:                                               ; preds = %517, %5
  ret void

40:                                               ; preds = %26, %517
  %41 = phi i32 [ 0, %26 ], [ %44, %517 ]
  %42 = mul nsw i32 %41, %2
  %43 = icmp slt i32 %24, %42
  %44 = add nuw nsw i32 %41, 1
  br i1 %43, label %517, label %45

45:                                               ; preds = %40
  %46 = mul nsw i32 %44, %2
  %47 = add nsw i32 %46, -1
  %48 = icmp slt i32 %24, %47
  br i1 %48, label %49, label %517

49:                                               ; preds = %45
  %50 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7
  %51 = mul nsw i32 %50, %2
  %52 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %53 = add nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  %56 = atomicrmw add i32 addrspace(1)* %55, i32 1 syncscope("agent-one-as") monotonic, align 4
  %57 = load i64, i64 addrspace(4)* %35, align 8, !tbaa !11
  %58 = inttoptr i64 %57 to i8 addrspace(1)*
  %59 = addrspacecast i8 addrspace(1)* %58 to i8*
  %60 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %59, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %61 = extractelement <2 x i64> %60, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %62, label %66

62:                                               ; preds = %49
  %63 = and i64 %61, -225
  %64 = or i64 %63, 32
  %65 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %59, i64 noundef %64, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %507

66:                                               ; preds = %49
  %67 = and i64 %61, 2
  %68 = and i64 %61, -3
  %69 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %68, i64 0
  br label %70

70:                                               ; preds = %496, %66
  %71 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str to [15 x i8]*) to i64)), i64 1))), %66 ], [ %504, %496 ]
  %72 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str, i64 0, i64 0), %66 ], [ %505, %496 ]
  %73 = phi <2 x i64> [ %69, %66 ], [ %503, %496 ]
  %74 = icmp ugt i64 %71, 56
  %75 = extractelement <2 x i64> %73, i64 0
  %76 = or i64 %75, %67
  %77 = insertelement <2 x i64> poison, i64 %76, i64 0
  %78 = select i1 %74, <2 x i64> %73, <2 x i64> %77
  %79 = tail call i64 @llvm.umin.i64(i64 %71, i64 56)
  %80 = trunc i64 %79 to i32
  %81 = extractelement <2 x i64> %78, i64 0
  %82 = icmp ugt i32 %80, 7
  br i1 %82, label %85, label %83

83:                                               ; preds = %70
  %84 = icmp eq i32 %80, 0
  br i1 %84, label %138, label %125

85:                                               ; preds = %70
  %86 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !15
  %87 = zext i8 %86 to i64
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 1
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !15
  %90 = zext i8 %89 to i64
  %91 = shl nuw nsw i64 %90, 8
  %92 = or i64 %91, %87
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 2
  %94 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !15
  %95 = zext i8 %94 to i64
  %96 = shl nuw nsw i64 %95, 16
  %97 = or i64 %92, %96
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 3
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !15
  %100 = zext i8 %99 to i64
  %101 = shl nuw nsw i64 %100, 24
  %102 = or i64 %97, %101
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 4
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !15
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 32
  %107 = or i64 %102, %106
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 5
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !15
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 40
  %112 = or i64 %107, %111
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 6
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !15
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 48
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 7
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !15
  %120 = zext i8 %119 to i64
  %121 = shl nuw i64 %120, 56
  %122 = or i64 %117, %121
  %123 = add nsw i32 %80, -8
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 8
  br label %138

125:                                              ; preds = %83, %125
  %126 = phi i32 [ %136, %125 ], [ 0, %83 ]
  %127 = phi i64 [ %135, %125 ], [ 0, %83 ]
  %128 = zext i32 %126 to i64
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 %128
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !15
  %131 = zext i8 %130 to i64
  %132 = shl i32 %126, 3
  %133 = zext i32 %132 to i64
  %134 = shl nuw i64 %131, %133
  %135 = or i64 %134, %127
  %136 = add nuw nsw i32 %126, 1
  %137 = icmp eq i32 %136, %80
  br i1 %137, label %138, label %125, !llvm.loop !16

138:                                              ; preds = %125, %85, %83
  %139 = phi i8 addrspace(4)* [ %124, %85 ], [ %72, %83 ], [ %72, %125 ]
  %140 = phi i32 [ %123, %85 ], [ 0, %83 ], [ 0, %125 ]
  %141 = phi i64 [ %122, %85 ], [ 0, %83 ], [ %135, %125 ]
  %142 = icmp ugt i32 %140, 7
  br i1 %142, label %145, label %143

143:                                              ; preds = %138
  %144 = icmp eq i32 %140, 0
  br i1 %144, label %198, label %185

145:                                              ; preds = %138
  %146 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !15
  %147 = zext i8 %146 to i64
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 1
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !15
  %150 = zext i8 %149 to i64
  %151 = shl nuw nsw i64 %150, 8
  %152 = or i64 %151, %147
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 2
  %154 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !15
  %155 = zext i8 %154 to i64
  %156 = shl nuw nsw i64 %155, 16
  %157 = or i64 %152, %156
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 3
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !15
  %160 = zext i8 %159 to i64
  %161 = shl nuw nsw i64 %160, 24
  %162 = or i64 %157, %161
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 4
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !15
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 32
  %167 = or i64 %162, %166
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 5
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !15
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 40
  %172 = or i64 %167, %171
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 6
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !15
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 48
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 7
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !15
  %180 = zext i8 %179 to i64
  %181 = shl nuw i64 %180, 56
  %182 = or i64 %177, %181
  %183 = add nsw i32 %140, -8
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 8
  br label %198

185:                                              ; preds = %143, %185
  %186 = phi i32 [ %196, %185 ], [ 0, %143 ]
  %187 = phi i64 [ %195, %185 ], [ 0, %143 ]
  %188 = zext i32 %186 to i64
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %139, i64 %188
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !15
  %191 = zext i8 %190 to i64
  %192 = shl i32 %186, 3
  %193 = zext i32 %192 to i64
  %194 = shl nuw i64 %191, %193
  %195 = or i64 %194, %187
  %196 = add nuw nsw i32 %186, 1
  %197 = icmp eq i32 %196, %140
  br i1 %197, label %198, label %185

198:                                              ; preds = %185, %145, %143
  %199 = phi i8 addrspace(4)* [ %184, %145 ], [ %139, %143 ], [ %139, %185 ]
  %200 = phi i32 [ %183, %145 ], [ 0, %143 ], [ 0, %185 ]
  %201 = phi i64 [ %182, %145 ], [ 0, %143 ], [ %195, %185 ]
  %202 = icmp ugt i32 %200, 7
  br i1 %202, label %205, label %203

203:                                              ; preds = %198
  %204 = icmp eq i32 %200, 0
  br i1 %204, label %258, label %245

205:                                              ; preds = %198
  %206 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !15
  %207 = zext i8 %206 to i64
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 1
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !15
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 8
  %212 = or i64 %211, %207
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 2
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !15
  %215 = zext i8 %214 to i64
  %216 = shl nuw nsw i64 %215, 16
  %217 = or i64 %212, %216
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 3
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !15
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 24
  %222 = or i64 %217, %221
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 4
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !15
  %225 = zext i8 %224 to i64
  %226 = shl nuw nsw i64 %225, 32
  %227 = or i64 %222, %226
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 5
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !15
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 40
  %232 = or i64 %227, %231
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 6
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !15
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 48
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 7
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !15
  %240 = zext i8 %239 to i64
  %241 = shl nuw i64 %240, 56
  %242 = or i64 %237, %241
  %243 = add nsw i32 %200, -8
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 8
  br label %258

245:                                              ; preds = %203, %245
  %246 = phi i32 [ %256, %245 ], [ 0, %203 ]
  %247 = phi i64 [ %255, %245 ], [ 0, %203 ]
  %248 = zext i32 %246 to i64
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %199, i64 %248
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !15
  %251 = zext i8 %250 to i64
  %252 = shl i32 %246, 3
  %253 = zext i32 %252 to i64
  %254 = shl nuw i64 %251, %253
  %255 = or i64 %254, %247
  %256 = add nuw nsw i32 %246, 1
  %257 = icmp eq i32 %256, %200
  br i1 %257, label %258, label %245

258:                                              ; preds = %245, %205, %203
  %259 = phi i8 addrspace(4)* [ %244, %205 ], [ %199, %203 ], [ %199, %245 ]
  %260 = phi i32 [ %243, %205 ], [ 0, %203 ], [ 0, %245 ]
  %261 = phi i64 [ %242, %205 ], [ 0, %203 ], [ %255, %245 ]
  %262 = icmp ugt i32 %260, 7
  br i1 %262, label %265, label %263

263:                                              ; preds = %258
  %264 = icmp eq i32 %260, 0
  br i1 %264, label %318, label %305

265:                                              ; preds = %258
  %266 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !15
  %267 = zext i8 %266 to i64
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 1
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !15
  %270 = zext i8 %269 to i64
  %271 = shl nuw nsw i64 %270, 8
  %272 = or i64 %271, %267
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 2
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !15
  %275 = zext i8 %274 to i64
  %276 = shl nuw nsw i64 %275, 16
  %277 = or i64 %272, %276
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 3
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !15
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 24
  %282 = or i64 %277, %281
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 4
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !15
  %285 = zext i8 %284 to i64
  %286 = shl nuw nsw i64 %285, 32
  %287 = or i64 %282, %286
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 5
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !15
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 40
  %292 = or i64 %287, %291
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 6
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !15
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 48
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 7
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !15
  %300 = zext i8 %299 to i64
  %301 = shl nuw i64 %300, 56
  %302 = or i64 %297, %301
  %303 = add nsw i32 %260, -8
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 8
  br label %318

305:                                              ; preds = %263, %305
  %306 = phi i32 [ %316, %305 ], [ 0, %263 ]
  %307 = phi i64 [ %315, %305 ], [ 0, %263 ]
  %308 = zext i32 %306 to i64
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %259, i64 %308
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !15
  %311 = zext i8 %310 to i64
  %312 = shl i32 %306, 3
  %313 = zext i32 %312 to i64
  %314 = shl nuw i64 %311, %313
  %315 = or i64 %314, %307
  %316 = add nuw nsw i32 %306, 1
  %317 = icmp eq i32 %316, %260
  br i1 %317, label %318, label %305

318:                                              ; preds = %305, %265, %263
  %319 = phi i8 addrspace(4)* [ %304, %265 ], [ %259, %263 ], [ %259, %305 ]
  %320 = phi i32 [ %303, %265 ], [ 0, %263 ], [ 0, %305 ]
  %321 = phi i64 [ %302, %265 ], [ 0, %263 ], [ %315, %305 ]
  %322 = icmp ugt i32 %320, 7
  br i1 %322, label %325, label %323

323:                                              ; preds = %318
  %324 = icmp eq i32 %320, 0
  br i1 %324, label %378, label %365

325:                                              ; preds = %318
  %326 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !15
  %327 = zext i8 %326 to i64
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 1
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !15
  %330 = zext i8 %329 to i64
  %331 = shl nuw nsw i64 %330, 8
  %332 = or i64 %331, %327
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 2
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !15
  %335 = zext i8 %334 to i64
  %336 = shl nuw nsw i64 %335, 16
  %337 = or i64 %332, %336
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 3
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !15
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 24
  %342 = or i64 %337, %341
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 4
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !15
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 32
  %347 = or i64 %342, %346
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 5
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !15
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 40
  %352 = or i64 %347, %351
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 6
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !15
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 48
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 7
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !15
  %360 = zext i8 %359 to i64
  %361 = shl nuw i64 %360, 56
  %362 = or i64 %357, %361
  %363 = add nsw i32 %320, -8
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 8
  br label %378

365:                                              ; preds = %323, %365
  %366 = phi i32 [ %376, %365 ], [ 0, %323 ]
  %367 = phi i64 [ %375, %365 ], [ 0, %323 ]
  %368 = zext i32 %366 to i64
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %319, i64 %368
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !15
  %371 = zext i8 %370 to i64
  %372 = shl i32 %366, 3
  %373 = zext i32 %372 to i64
  %374 = shl nuw i64 %371, %373
  %375 = or i64 %374, %367
  %376 = add nuw nsw i32 %366, 1
  %377 = icmp eq i32 %376, %320
  br i1 %377, label %378, label %365

378:                                              ; preds = %365, %325, %323
  %379 = phi i8 addrspace(4)* [ %364, %325 ], [ %319, %323 ], [ %319, %365 ]
  %380 = phi i32 [ %363, %325 ], [ 0, %323 ], [ 0, %365 ]
  %381 = phi i64 [ %362, %325 ], [ 0, %323 ], [ %375, %365 ]
  %382 = icmp ugt i32 %380, 7
  br i1 %382, label %385, label %383

383:                                              ; preds = %378
  %384 = icmp eq i32 %380, 0
  br i1 %384, label %438, label %425

385:                                              ; preds = %378
  %386 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !15
  %387 = zext i8 %386 to i64
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 1
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !15
  %390 = zext i8 %389 to i64
  %391 = shl nuw nsw i64 %390, 8
  %392 = or i64 %391, %387
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 2
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !15
  %395 = zext i8 %394 to i64
  %396 = shl nuw nsw i64 %395, 16
  %397 = or i64 %392, %396
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 3
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !15
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 24
  %402 = or i64 %397, %401
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 4
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !15
  %405 = zext i8 %404 to i64
  %406 = shl nuw nsw i64 %405, 32
  %407 = or i64 %402, %406
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 5
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !15
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 40
  %412 = or i64 %407, %411
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 6
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !15
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 48
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 7
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !15
  %420 = zext i8 %419 to i64
  %421 = shl nuw i64 %420, 56
  %422 = or i64 %417, %421
  %423 = add nsw i32 %380, -8
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 8
  br label %438

425:                                              ; preds = %383, %425
  %426 = phi i32 [ %436, %425 ], [ 0, %383 ]
  %427 = phi i64 [ %435, %425 ], [ 0, %383 ]
  %428 = zext i32 %426 to i64
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %379, i64 %428
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !15
  %431 = zext i8 %430 to i64
  %432 = shl i32 %426, 3
  %433 = zext i32 %432 to i64
  %434 = shl nuw i64 %431, %433
  %435 = or i64 %434, %427
  %436 = add nuw nsw i32 %426, 1
  %437 = icmp eq i32 %436, %380
  br i1 %437, label %438, label %425

438:                                              ; preds = %425, %385, %383
  %439 = phi i8 addrspace(4)* [ %424, %385 ], [ %379, %383 ], [ %379, %425 ]
  %440 = phi i32 [ %423, %385 ], [ 0, %383 ], [ 0, %425 ]
  %441 = phi i64 [ %422, %385 ], [ 0, %383 ], [ %435, %425 ]
  %442 = icmp ugt i32 %440, 7
  br i1 %442, label %445, label %443

443:                                              ; preds = %438
  %444 = icmp eq i32 %440, 0
  br i1 %444, label %496, label %483

445:                                              ; preds = %438
  %446 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !15
  %447 = zext i8 %446 to i64
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 1
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !15
  %450 = zext i8 %449 to i64
  %451 = shl nuw nsw i64 %450, 8
  %452 = or i64 %451, %447
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 2
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !15
  %455 = zext i8 %454 to i64
  %456 = shl nuw nsw i64 %455, 16
  %457 = or i64 %452, %456
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 3
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !15
  %460 = zext i8 %459 to i64
  %461 = shl nuw nsw i64 %460, 24
  %462 = or i64 %457, %461
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 4
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !15
  %465 = zext i8 %464 to i64
  %466 = shl nuw nsw i64 %465, 32
  %467 = or i64 %462, %466
  %468 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 5
  %469 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !15
  %470 = zext i8 %469 to i64
  %471 = shl nuw nsw i64 %470, 40
  %472 = or i64 %467, %471
  %473 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 6
  %474 = load i8, i8 addrspace(4)* %473, align 1, !tbaa !15
  %475 = zext i8 %474 to i64
  %476 = shl nuw nsw i64 %475, 48
  %477 = or i64 %472, %476
  %478 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 7
  %479 = load i8, i8 addrspace(4)* %478, align 1, !tbaa !15
  %480 = zext i8 %479 to i64
  %481 = shl nuw i64 %480, 56
  %482 = or i64 %477, %481
  br label %496

483:                                              ; preds = %443, %483
  %484 = phi i32 [ %494, %483 ], [ 0, %443 ]
  %485 = phi i64 [ %493, %483 ], [ 0, %443 ]
  %486 = zext i32 %484 to i64
  %487 = getelementptr inbounds i8, i8 addrspace(4)* %439, i64 %486
  %488 = load i8, i8 addrspace(4)* %487, align 1, !tbaa !15
  %489 = zext i8 %488 to i64
  %490 = shl i32 %484, 3
  %491 = zext i32 %490 to i64
  %492 = shl nuw i64 %489, %491
  %493 = or i64 %492, %485
  %494 = add nuw nsw i32 %484, 1
  %495 = icmp eq i32 %494, %440
  br i1 %495, label %496, label %483

496:                                              ; preds = %483, %445, %443
  %497 = phi i64 [ %482, %445 ], [ 0, %443 ], [ %493, %483 ]
  %498 = shl nuw nsw i64 %79, 2
  %499 = add nuw nsw i64 %498, 28
  %500 = and i64 %499, 480
  %501 = and i64 %81, -225
  %502 = or i64 %501, %500
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %59, i64 noundef %502, i64 noundef %141, i64 noundef %201, i64 noundef %261, i64 noundef %321, i64 noundef %381, i64 noundef %441, i64 noundef %497) #10
  %504 = sub i64 %71, %79
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %72, i64 %79
  %506 = icmp eq i64 %504, 0
  br i1 %506, label %507, label %70

507:                                              ; preds = %496, %62
  %508 = phi <2 x i64> [ %65, %62 ], [ %503, %496 ]
  %509 = extractelement <2 x i64> %508, i64 0
  %510 = and i64 %509, -225
  %511 = or i64 %510, 32
  %512 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %59, i64 noundef %511, i64 noundef %36, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %513 = extractelement <2 x i64> %512, i64 0
  %514 = and i64 %513, -227
  %515 = or i64 %514, 34
  %516 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %59, i64 noundef %515, i64 noundef %37, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %517

517:                                              ; preds = %40, %45, %507
  %518 = icmp eq i32 %41, %38
  br i1 %518, label %39, label %40, !llvm.loop !18
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
!8 = !{!"int", !9, i64 0}
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
