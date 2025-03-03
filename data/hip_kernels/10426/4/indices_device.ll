; ModuleID = '../data/hip_kernels/10426/4/main.cu'
source_filename = "../data/hip_kernels/10426/4/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [74 x i8] c"blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id:  %d raiz: %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z7indicesv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %5 = bitcast i8 addrspace(4)* %4 to i16 addrspace(4)*
  %6 = load i16, i16 addrspace(4)* %5, align 4, !range !5, !invariant.load !6
  %7 = zext i16 %6 to i32
  %8 = mul i32 %2, %7
  %9 = add i32 %8, %1
  %10 = getelementptr i8, i8 addrspace(4)* %3, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !5, !invariant.load !6
  %13 = sitofp i32 %9 to double
  %14 = icmp slt i32 %9, 1
  %15 = select i1 %14, double 0x4FF0000000000000, double 1.000000e+00
  %16 = fmul double %15, %13
  %17 = tail call double @llvm.amdgcn.rsq.f64(double %16)
  %18 = fmul double %16, %17
  %19 = fmul double %17, 5.000000e-01
  %20 = fneg double %19
  %21 = tail call double @llvm.fma.f64(double %20, double %18, double 5.000000e-01)
  %22 = tail call double @llvm.fma.f64(double %19, double %21, double %19)
  %23 = tail call double @llvm.fma.f64(double %18, double %21, double %18)
  %24 = fneg double %23
  %25 = tail call double @llvm.fma.f64(double %24, double %23, double %16)
  %26 = tail call double @llvm.fma.f64(double %25, double %22, double %23)
  %27 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 24
  %29 = bitcast i8 addrspace(4)* %28 to i64 addrspace(4)*
  %30 = load i64, i64 addrspace(4)* %29, align 8, !tbaa !7
  %31 = inttoptr i64 %30 to i8 addrspace(1)*
  %32 = addrspacecast i8 addrspace(1)* %31 to i8*
  %33 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %34 = extractelement <2 x i64> %33, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %35, label %39

35:                                               ; preds = %0
  %36 = and i64 %34, -225
  %37 = or i64 %36, 32
  %38 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %37, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %480

39:                                               ; preds = %0
  %40 = and i64 %34, 2
  %41 = and i64 %34, -3
  %42 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %41, i64 0
  br label %43

43:                                               ; preds = %469, %39
  %44 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str, i64 0, i64 73) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([74 x i8]* addrspacecast ([74 x i8] addrspace(4)* @.str to [74 x i8]*) to i64)), i64 1))), %39 ], [ %477, %469 ]
  %45 = phi i8 addrspace(4)* [ getelementptr inbounds ([74 x i8], [74 x i8] addrspace(4)* @.str, i64 0, i64 0), %39 ], [ %478, %469 ]
  %46 = phi <2 x i64> [ %42, %39 ], [ %476, %469 ]
  %47 = icmp ugt i64 %44, 56
  %48 = extractelement <2 x i64> %46, i64 0
  %49 = or i64 %48, %40
  %50 = insertelement <2 x i64> poison, i64 %49, i64 0
  %51 = select i1 %47, <2 x i64> %46, <2 x i64> %50
  %52 = tail call i64 @llvm.umin.i64(i64 %44, i64 56)
  %53 = trunc i64 %52 to i32
  %54 = extractelement <2 x i64> %51, i64 0
  %55 = icmp ugt i32 %53, 7
  br i1 %55, label %58, label %56

56:                                               ; preds = %43
  %57 = icmp eq i32 %53, 0
  br i1 %57, label %111, label %98

58:                                               ; preds = %43
  %59 = load i8, i8 addrspace(4)* %45, align 1, !tbaa !11
  %60 = zext i8 %59 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 1
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !11
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 8
  %65 = or i64 %64, %60
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 2
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !11
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 16
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 3
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !11
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 24
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 4
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !11
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 32
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 5
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !11
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 40
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 6
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !11
  %88 = zext i8 %87 to i64
  %89 = shl nuw nsw i64 %88, 48
  %90 = or i64 %85, %89
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 7
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !11
  %93 = zext i8 %92 to i64
  %94 = shl nuw i64 %93, 56
  %95 = or i64 %90, %94
  %96 = add nsw i32 %53, -8
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 8
  br label %111

98:                                               ; preds = %56, %98
  %99 = phi i32 [ %109, %98 ], [ 0, %56 ]
  %100 = phi i64 [ %108, %98 ], [ 0, %56 ]
  %101 = zext i32 %99 to i64
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 %101
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !11
  %104 = zext i8 %103 to i64
  %105 = shl i32 %99, 3
  %106 = zext i32 %105 to i64
  %107 = shl nuw i64 %104, %106
  %108 = or i64 %107, %100
  %109 = add nuw nsw i32 %99, 1
  %110 = icmp eq i32 %109, %53
  br i1 %110, label %111, label %98, !llvm.loop !12

111:                                              ; preds = %98, %58, %56
  %112 = phi i8 addrspace(4)* [ %97, %58 ], [ %45, %56 ], [ %45, %98 ]
  %113 = phi i32 [ %96, %58 ], [ 0, %56 ], [ 0, %98 ]
  %114 = phi i64 [ %95, %58 ], [ 0, %56 ], [ %108, %98 ]
  %115 = icmp ugt i32 %113, 7
  br i1 %115, label %118, label %116

116:                                              ; preds = %111
  %117 = icmp eq i32 %113, 0
  br i1 %117, label %171, label %158

118:                                              ; preds = %111
  %119 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !11
  %120 = zext i8 %119 to i64
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 1
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !11
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 8
  %125 = or i64 %124, %120
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 2
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !11
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 16
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 3
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !11
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 24
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 4
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !11
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 32
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 5
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !11
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 40
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 6
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !11
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 48
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 7
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !11
  %153 = zext i8 %152 to i64
  %154 = shl nuw i64 %153, 56
  %155 = or i64 %150, %154
  %156 = add nsw i32 %113, -8
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 8
  br label %171

158:                                              ; preds = %116, %158
  %159 = phi i32 [ %169, %158 ], [ 0, %116 ]
  %160 = phi i64 [ %168, %158 ], [ 0, %116 ]
  %161 = zext i32 %159 to i64
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %112, i64 %161
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !11
  %164 = zext i8 %163 to i64
  %165 = shl i32 %159, 3
  %166 = zext i32 %165 to i64
  %167 = shl nuw i64 %164, %166
  %168 = or i64 %167, %160
  %169 = add nuw nsw i32 %159, 1
  %170 = icmp eq i32 %169, %113
  br i1 %170, label %171, label %158

171:                                              ; preds = %158, %118, %116
  %172 = phi i8 addrspace(4)* [ %157, %118 ], [ %112, %116 ], [ %112, %158 ]
  %173 = phi i32 [ %156, %118 ], [ 0, %116 ], [ 0, %158 ]
  %174 = phi i64 [ %155, %118 ], [ 0, %116 ], [ %168, %158 ]
  %175 = icmp ugt i32 %173, 7
  br i1 %175, label %178, label %176

176:                                              ; preds = %171
  %177 = icmp eq i32 %173, 0
  br i1 %177, label %231, label %218

178:                                              ; preds = %171
  %179 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !11
  %180 = zext i8 %179 to i64
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 1
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !11
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 8
  %185 = or i64 %184, %180
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 2
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !11
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 16
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 3
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !11
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 24
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 4
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !11
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 32
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 5
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !11
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 40
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 6
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !11
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 48
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 7
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !11
  %213 = zext i8 %212 to i64
  %214 = shl nuw i64 %213, 56
  %215 = or i64 %210, %214
  %216 = add nsw i32 %173, -8
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 8
  br label %231

218:                                              ; preds = %176, %218
  %219 = phi i32 [ %229, %218 ], [ 0, %176 ]
  %220 = phi i64 [ %228, %218 ], [ 0, %176 ]
  %221 = zext i32 %219 to i64
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %172, i64 %221
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !11
  %224 = zext i8 %223 to i64
  %225 = shl i32 %219, 3
  %226 = zext i32 %225 to i64
  %227 = shl nuw i64 %224, %226
  %228 = or i64 %227, %220
  %229 = add nuw nsw i32 %219, 1
  %230 = icmp eq i32 %229, %173
  br i1 %230, label %231, label %218

231:                                              ; preds = %218, %178, %176
  %232 = phi i8 addrspace(4)* [ %217, %178 ], [ %172, %176 ], [ %172, %218 ]
  %233 = phi i32 [ %216, %178 ], [ 0, %176 ], [ 0, %218 ]
  %234 = phi i64 [ %215, %178 ], [ 0, %176 ], [ %228, %218 ]
  %235 = icmp ugt i32 %233, 7
  br i1 %235, label %238, label %236

236:                                              ; preds = %231
  %237 = icmp eq i32 %233, 0
  br i1 %237, label %291, label %278

238:                                              ; preds = %231
  %239 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !11
  %240 = zext i8 %239 to i64
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 1
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !11
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 8
  %245 = or i64 %244, %240
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 2
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !11
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 16
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 3
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !11
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 24
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 4
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !11
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 32
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 5
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !11
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 40
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 6
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !11
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 48
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 7
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !11
  %273 = zext i8 %272 to i64
  %274 = shl nuw i64 %273, 56
  %275 = or i64 %270, %274
  %276 = add nsw i32 %233, -8
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 8
  br label %291

278:                                              ; preds = %236, %278
  %279 = phi i32 [ %289, %278 ], [ 0, %236 ]
  %280 = phi i64 [ %288, %278 ], [ 0, %236 ]
  %281 = zext i32 %279 to i64
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %232, i64 %281
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !11
  %284 = zext i8 %283 to i64
  %285 = shl i32 %279, 3
  %286 = zext i32 %285 to i64
  %287 = shl nuw i64 %284, %286
  %288 = or i64 %287, %280
  %289 = add nuw nsw i32 %279, 1
  %290 = icmp eq i32 %289, %233
  br i1 %290, label %291, label %278

291:                                              ; preds = %278, %238, %236
  %292 = phi i8 addrspace(4)* [ %277, %238 ], [ %232, %236 ], [ %232, %278 ]
  %293 = phi i32 [ %276, %238 ], [ 0, %236 ], [ 0, %278 ]
  %294 = phi i64 [ %275, %238 ], [ 0, %236 ], [ %288, %278 ]
  %295 = icmp ugt i32 %293, 7
  br i1 %295, label %298, label %296

296:                                              ; preds = %291
  %297 = icmp eq i32 %293, 0
  br i1 %297, label %351, label %338

298:                                              ; preds = %291
  %299 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !11
  %300 = zext i8 %299 to i64
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 1
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !11
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 8
  %305 = or i64 %304, %300
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 2
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !11
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 16
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 3
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !11
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 24
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 4
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !11
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 32
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 5
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !11
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 40
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 6
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !11
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 48
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 7
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !11
  %333 = zext i8 %332 to i64
  %334 = shl nuw i64 %333, 56
  %335 = or i64 %330, %334
  %336 = add nsw i32 %293, -8
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 8
  br label %351

338:                                              ; preds = %296, %338
  %339 = phi i32 [ %349, %338 ], [ 0, %296 ]
  %340 = phi i64 [ %348, %338 ], [ 0, %296 ]
  %341 = zext i32 %339 to i64
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %292, i64 %341
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !11
  %344 = zext i8 %343 to i64
  %345 = shl i32 %339, 3
  %346 = zext i32 %345 to i64
  %347 = shl nuw i64 %344, %346
  %348 = or i64 %347, %340
  %349 = add nuw nsw i32 %339, 1
  %350 = icmp eq i32 %349, %293
  br i1 %350, label %351, label %338

351:                                              ; preds = %338, %298, %296
  %352 = phi i8 addrspace(4)* [ %337, %298 ], [ %292, %296 ], [ %292, %338 ]
  %353 = phi i32 [ %336, %298 ], [ 0, %296 ], [ 0, %338 ]
  %354 = phi i64 [ %335, %298 ], [ 0, %296 ], [ %348, %338 ]
  %355 = icmp ugt i32 %353, 7
  br i1 %355, label %358, label %356

356:                                              ; preds = %351
  %357 = icmp eq i32 %353, 0
  br i1 %357, label %411, label %398

358:                                              ; preds = %351
  %359 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !11
  %360 = zext i8 %359 to i64
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 1
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !11
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 8
  %365 = or i64 %364, %360
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 2
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !11
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 16
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 3
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !11
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 24
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 4
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !11
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 32
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 5
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !11
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 40
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 6
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !11
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 48
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 7
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !11
  %393 = zext i8 %392 to i64
  %394 = shl nuw i64 %393, 56
  %395 = or i64 %390, %394
  %396 = add nsw i32 %353, -8
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 8
  br label %411

398:                                              ; preds = %356, %398
  %399 = phi i32 [ %409, %398 ], [ 0, %356 ]
  %400 = phi i64 [ %408, %398 ], [ 0, %356 ]
  %401 = zext i32 %399 to i64
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %352, i64 %401
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !11
  %404 = zext i8 %403 to i64
  %405 = shl i32 %399, 3
  %406 = zext i32 %405 to i64
  %407 = shl nuw i64 %404, %406
  %408 = or i64 %407, %400
  %409 = add nuw nsw i32 %399, 1
  %410 = icmp eq i32 %409, %353
  br i1 %410, label %411, label %398

411:                                              ; preds = %398, %358, %356
  %412 = phi i8 addrspace(4)* [ %397, %358 ], [ %352, %356 ], [ %352, %398 ]
  %413 = phi i32 [ %396, %358 ], [ 0, %356 ], [ 0, %398 ]
  %414 = phi i64 [ %395, %358 ], [ 0, %356 ], [ %408, %398 ]
  %415 = icmp ugt i32 %413, 7
  br i1 %415, label %418, label %416

416:                                              ; preds = %411
  %417 = icmp eq i32 %413, 0
  br i1 %417, label %469, label %456

418:                                              ; preds = %411
  %419 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !11
  %420 = zext i8 %419 to i64
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 1
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !11
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 8
  %425 = or i64 %424, %420
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 2
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !11
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 16
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 3
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !11
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 24
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 4
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !11
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 32
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 5
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !11
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 40
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 6
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !11
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 48
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 7
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !11
  %453 = zext i8 %452 to i64
  %454 = shl nuw i64 %453, 56
  %455 = or i64 %450, %454
  br label %469

456:                                              ; preds = %416, %456
  %457 = phi i32 [ %467, %456 ], [ 0, %416 ]
  %458 = phi i64 [ %466, %456 ], [ 0, %416 ]
  %459 = zext i32 %457 to i64
  %460 = getelementptr inbounds i8, i8 addrspace(4)* %412, i64 %459
  %461 = load i8, i8 addrspace(4)* %460, align 1, !tbaa !11
  %462 = zext i8 %461 to i64
  %463 = shl i32 %457, 3
  %464 = zext i32 %463 to i64
  %465 = shl nuw i64 %462, %464
  %466 = or i64 %465, %458
  %467 = add nuw nsw i32 %457, 1
  %468 = icmp eq i32 %467, %413
  br i1 %468, label %469, label %456

469:                                              ; preds = %456, %418, %416
  %470 = phi i64 [ %455, %418 ], [ 0, %416 ], [ %466, %456 ]
  %471 = shl nuw nsw i64 %52, 2
  %472 = add nuw nsw i64 %471, 28
  %473 = and i64 %472, 480
  %474 = and i64 %54, -225
  %475 = or i64 %474, %473
  %476 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %475, i64 noundef %114, i64 noundef %174, i64 noundef %234, i64 noundef %294, i64 noundef %354, i64 noundef %414, i64 noundef %470) #11
  %477 = sub i64 %44, %52
  %478 = getelementptr inbounds i8, i8 addrspace(4)* %45, i64 %52
  %479 = icmp eq i64 %477, 0
  br i1 %479, label %480, label %43

480:                                              ; preds = %469, %35
  %481 = phi <2 x i64> [ %38, %35 ], [ %476, %469 ]
  %482 = fcmp oeq double %16, 0.000000e+00
  %483 = fcmp oeq double %16, 0x7FF0000000000000
  %484 = or i1 %482, %483
  %485 = select i1 %14, double 0x37F0000000000000, double 1.000000e+00
  %486 = fneg double %26
  %487 = tail call double @llvm.fma.f64(double %486, double %26, double %16)
  %488 = tail call double @llvm.fma.f64(double %487, double %22, double %26)
  %489 = fmul double %485, %488
  %490 = select i1 %484, double %16, double %489
  %491 = extractelement <2 x i64> %481, i64 0
  %492 = zext i16 %12 to i64
  %493 = and i64 %491, -225
  %494 = or i64 %493, 32
  %495 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %494, i64 noundef %492, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %496 = extractelement <2 x i64> %495, i64 0
  %497 = zext i32 %1 to i64
  %498 = and i64 %496, -225
  %499 = or i64 %498, 32
  %500 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %499, i64 noundef %497, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %501 = extractelement <2 x i64> %500, i64 0
  %502 = zext i32 %2 to i64
  %503 = and i64 %501, -225
  %504 = or i64 %503, 32
  %505 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %504, i64 noundef %502, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %506 = extractelement <2 x i64> %505, i64 0
  %507 = zext i16 %6 to i64
  %508 = and i64 %506, -225
  %509 = or i64 %508, 32
  %510 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %509, i64 noundef %507, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %511 = extractelement <2 x i64> %510, i64 0
  %512 = zext i32 %9 to i64
  %513 = and i64 %511, -225
  %514 = or i64 %513, 32
  %515 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %514, i64 noundef %512, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %516 = extractelement <2 x i64> %515, i64 0
  %517 = bitcast double %490 to i64
  %518 = and i64 %516, -227
  %519 = or i64 %518, 34
  %520 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %519, i64 noundef %517, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rsq.f64(double) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #5 {
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !14
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !16
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #8
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !16
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !18
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !16
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #8
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !16
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #8
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !14
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #8
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !19
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !22
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !19
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !22
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #8
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !19
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !22
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #8
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !23
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !22
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !16
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %110 = call i64 @llvm.read_register.i64(metadata !24) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !25
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !27
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !28
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !19
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !22
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !29
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !29
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !30
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !32
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #8
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !14
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !14
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !16
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !22
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !19
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !29
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !29
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #8
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #8
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #8
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #8
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #8
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #8
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #8
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #7

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #8

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { nofree nounwind readonly }
attributes #10 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

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
!8 = !{!"long", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !9, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !9, i64 0}
!18 = !{i64 2662}
!19 = !{!20, !15, i64 0}
!20 = !{!"", !15, i64 0, !15, i64 8, !21, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!21 = !{!"hsa_signal_s", !8, i64 0}
!22 = !{!20, !8, i64 40}
!23 = !{!20, !15, i64 8}
!24 = !{!"exec"}
!25 = !{!26, !17, i64 16}
!26 = !{!"", !8, i64 0, !8, i64 8, !17, i64 16, !17, i64 20}
!27 = !{!26, !8, i64 8}
!28 = !{!26, !17, i64 20}
!29 = !{!26, !8, i64 0}
!30 = !{!31, !8, i64 16}
!31 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !17, i64 24, !17, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!32 = !{!31, !17, i64 24}
