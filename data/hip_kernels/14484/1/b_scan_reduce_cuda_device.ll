; ModuleID = '../data/hip_kernels/14484/1/main.cu'
source_filename = "../data/hip_kernels/14484/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [23 x i8] c"Block %d nb_here = %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [32 x i8] c"threshold = %d && next_th = %d\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [29 x i8] c"Thread %d : values[%d] = %d\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [2 x i8] c"\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z18b_scan_reduce_cudaPiS_m(i32 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #1 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = zext i32 %10 to i64
  %14 = sub i64 %2, %13
  %15 = zext i16 %7 to i64
  %16 = icmp ult i64 %14, %15
  %17 = trunc i64 %2 to i32
  %18 = sub i32 %17, %10
  %19 = select i1 %16, i32 %18, i32 %8
  %20 = icmp eq i32 %11, 0
  br i1 %20, label %21, label %487

21:                                               ; preds = %3
  %22 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 24
  %24 = bitcast i8 addrspace(4)* %23 to i64 addrspace(4)*
  %25 = load i64, i64 addrspace(4)* %24, align 8, !tbaa !7
  %26 = inttoptr i64 %25 to i8 addrspace(1)*
  %27 = addrspacecast i8 addrspace(1)* %26 to i8*
  %28 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %27, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %29 = extractelement <2 x i64> %28, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %30, label %34

30:                                               ; preds = %21
  %31 = and i64 %29, -225
  %32 = or i64 %31, 32
  %33 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %27, i64 noundef %32, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %475

34:                                               ; preds = %21
  %35 = and i64 %29, 2
  %36 = and i64 %29, -3
  %37 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %36, i64 0
  br label %38

38:                                               ; preds = %464, %34
  %39 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 22) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([23 x i8]* addrspacecast ([23 x i8] addrspace(4)* @.str to [23 x i8]*) to i64)), i64 1))), %34 ], [ %472, %464 ]
  %40 = phi i8 addrspace(4)* [ getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str, i64 0, i64 0), %34 ], [ %473, %464 ]
  %41 = phi <2 x i64> [ %37, %34 ], [ %471, %464 ]
  %42 = icmp ugt i64 %39, 56
  %43 = extractelement <2 x i64> %41, i64 0
  %44 = or i64 %43, %35
  %45 = insertelement <2 x i64> poison, i64 %44, i64 0
  %46 = select i1 %42, <2 x i64> %41, <2 x i64> %45
  %47 = tail call i64 @llvm.umin.i64(i64 %39, i64 56)
  %48 = trunc i64 %47 to i32
  %49 = extractelement <2 x i64> %46, i64 0
  %50 = icmp ugt i32 %48, 7
  br i1 %50, label %53, label %51

51:                                               ; preds = %38
  %52 = icmp eq i32 %48, 0
  br i1 %52, label %106, label %93

53:                                               ; preds = %38
  %54 = load i8, i8 addrspace(4)* %40, align 1, !tbaa !11
  %55 = zext i8 %54 to i64
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 1
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !11
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 8
  %60 = or i64 %59, %55
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 2
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !11
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 16
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 3
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !11
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 24
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 4
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !11
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 32
  %75 = or i64 %70, %74
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 5
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !11
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 40
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 6
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !11
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 48
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 7
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !11
  %88 = zext i8 %87 to i64
  %89 = shl nuw i64 %88, 56
  %90 = or i64 %85, %89
  %91 = add nsw i32 %48, -8
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 8
  br label %106

93:                                               ; preds = %51, %93
  %94 = phi i32 [ %104, %93 ], [ 0, %51 ]
  %95 = phi i64 [ %103, %93 ], [ 0, %51 ]
  %96 = zext i32 %94 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 %96
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !11
  %99 = zext i8 %98 to i64
  %100 = shl i32 %94, 3
  %101 = zext i32 %100 to i64
  %102 = shl nuw i64 %99, %101
  %103 = or i64 %102, %95
  %104 = add nuw nsw i32 %94, 1
  %105 = icmp eq i32 %104, %48
  br i1 %105, label %106, label %93, !llvm.loop !12

106:                                              ; preds = %93, %53, %51
  %107 = phi i8 addrspace(4)* [ %92, %53 ], [ %40, %51 ], [ %40, %93 ]
  %108 = phi i32 [ %91, %53 ], [ 0, %51 ], [ 0, %93 ]
  %109 = phi i64 [ %90, %53 ], [ 0, %51 ], [ %103, %93 ]
  %110 = icmp ugt i32 %108, 7
  br i1 %110, label %113, label %111

111:                                              ; preds = %106
  %112 = icmp eq i32 %108, 0
  br i1 %112, label %166, label %153

113:                                              ; preds = %106
  %114 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !11
  %115 = zext i8 %114 to i64
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 1
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !11
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 8
  %120 = or i64 %119, %115
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 2
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !11
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 16
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 3
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !11
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 24
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 4
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !11
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 32
  %135 = or i64 %130, %134
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 5
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !11
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 40
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 6
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !11
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 48
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 7
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !11
  %148 = zext i8 %147 to i64
  %149 = shl nuw i64 %148, 56
  %150 = or i64 %145, %149
  %151 = add nsw i32 %108, -8
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 8
  br label %166

153:                                              ; preds = %111, %153
  %154 = phi i32 [ %164, %153 ], [ 0, %111 ]
  %155 = phi i64 [ %163, %153 ], [ 0, %111 ]
  %156 = zext i32 %154 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %107, i64 %156
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !11
  %159 = zext i8 %158 to i64
  %160 = shl i32 %154, 3
  %161 = zext i32 %160 to i64
  %162 = shl nuw i64 %159, %161
  %163 = or i64 %162, %155
  %164 = add nuw nsw i32 %154, 1
  %165 = icmp eq i32 %164, %108
  br i1 %165, label %166, label %153

166:                                              ; preds = %153, %113, %111
  %167 = phi i8 addrspace(4)* [ %152, %113 ], [ %107, %111 ], [ %107, %153 ]
  %168 = phi i32 [ %151, %113 ], [ 0, %111 ], [ 0, %153 ]
  %169 = phi i64 [ %150, %113 ], [ 0, %111 ], [ %163, %153 ]
  %170 = icmp ugt i32 %168, 7
  br i1 %170, label %173, label %171

171:                                              ; preds = %166
  %172 = icmp eq i32 %168, 0
  br i1 %172, label %226, label %213

173:                                              ; preds = %166
  %174 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !11
  %175 = zext i8 %174 to i64
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 1
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !11
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 8
  %180 = or i64 %179, %175
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 2
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !11
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 16
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 3
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !11
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 24
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 4
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !11
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 32
  %195 = or i64 %190, %194
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 5
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !11
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 40
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 6
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !11
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 48
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 7
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !11
  %208 = zext i8 %207 to i64
  %209 = shl nuw i64 %208, 56
  %210 = or i64 %205, %209
  %211 = add nsw i32 %168, -8
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 8
  br label %226

213:                                              ; preds = %171, %213
  %214 = phi i32 [ %224, %213 ], [ 0, %171 ]
  %215 = phi i64 [ %223, %213 ], [ 0, %171 ]
  %216 = zext i32 %214 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %167, i64 %216
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !11
  %219 = zext i8 %218 to i64
  %220 = shl i32 %214, 3
  %221 = zext i32 %220 to i64
  %222 = shl nuw i64 %219, %221
  %223 = or i64 %222, %215
  %224 = add nuw nsw i32 %214, 1
  %225 = icmp eq i32 %224, %168
  br i1 %225, label %226, label %213

226:                                              ; preds = %213, %173, %171
  %227 = phi i8 addrspace(4)* [ %212, %173 ], [ %167, %171 ], [ %167, %213 ]
  %228 = phi i32 [ %211, %173 ], [ 0, %171 ], [ 0, %213 ]
  %229 = phi i64 [ %210, %173 ], [ 0, %171 ], [ %223, %213 ]
  %230 = icmp ugt i32 %228, 7
  br i1 %230, label %233, label %231

231:                                              ; preds = %226
  %232 = icmp eq i32 %228, 0
  br i1 %232, label %286, label %273

233:                                              ; preds = %226
  %234 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !11
  %235 = zext i8 %234 to i64
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 1
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !11
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 8
  %240 = or i64 %239, %235
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 2
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !11
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 16
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 3
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !11
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 24
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 4
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !11
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 32
  %255 = or i64 %250, %254
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 5
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !11
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 40
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 6
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !11
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 48
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 7
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !11
  %268 = zext i8 %267 to i64
  %269 = shl nuw i64 %268, 56
  %270 = or i64 %265, %269
  %271 = add nsw i32 %228, -8
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 8
  br label %286

273:                                              ; preds = %231, %273
  %274 = phi i32 [ %284, %273 ], [ 0, %231 ]
  %275 = phi i64 [ %283, %273 ], [ 0, %231 ]
  %276 = zext i32 %274 to i64
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %227, i64 %276
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !11
  %279 = zext i8 %278 to i64
  %280 = shl i32 %274, 3
  %281 = zext i32 %280 to i64
  %282 = shl nuw i64 %279, %281
  %283 = or i64 %282, %275
  %284 = add nuw nsw i32 %274, 1
  %285 = icmp eq i32 %284, %228
  br i1 %285, label %286, label %273

286:                                              ; preds = %273, %233, %231
  %287 = phi i8 addrspace(4)* [ %272, %233 ], [ %227, %231 ], [ %227, %273 ]
  %288 = phi i32 [ %271, %233 ], [ 0, %231 ], [ 0, %273 ]
  %289 = phi i64 [ %270, %233 ], [ 0, %231 ], [ %283, %273 ]
  %290 = icmp ugt i32 %288, 7
  br i1 %290, label %293, label %291

291:                                              ; preds = %286
  %292 = icmp eq i32 %288, 0
  br i1 %292, label %346, label %333

293:                                              ; preds = %286
  %294 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !11
  %295 = zext i8 %294 to i64
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 1
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !11
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 8
  %300 = or i64 %299, %295
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 2
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !11
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 16
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 3
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !11
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 24
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 4
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !11
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 32
  %315 = or i64 %310, %314
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 5
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !11
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 40
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 6
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !11
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 48
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 7
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !11
  %328 = zext i8 %327 to i64
  %329 = shl nuw i64 %328, 56
  %330 = or i64 %325, %329
  %331 = add nsw i32 %288, -8
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 8
  br label %346

333:                                              ; preds = %291, %333
  %334 = phi i32 [ %344, %333 ], [ 0, %291 ]
  %335 = phi i64 [ %343, %333 ], [ 0, %291 ]
  %336 = zext i32 %334 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %287, i64 %336
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !11
  %339 = zext i8 %338 to i64
  %340 = shl i32 %334, 3
  %341 = zext i32 %340 to i64
  %342 = shl nuw i64 %339, %341
  %343 = or i64 %342, %335
  %344 = add nuw nsw i32 %334, 1
  %345 = icmp eq i32 %344, %288
  br i1 %345, label %346, label %333

346:                                              ; preds = %333, %293, %291
  %347 = phi i8 addrspace(4)* [ %332, %293 ], [ %287, %291 ], [ %287, %333 ]
  %348 = phi i32 [ %331, %293 ], [ 0, %291 ], [ 0, %333 ]
  %349 = phi i64 [ %330, %293 ], [ 0, %291 ], [ %343, %333 ]
  %350 = icmp ugt i32 %348, 7
  br i1 %350, label %353, label %351

351:                                              ; preds = %346
  %352 = icmp eq i32 %348, 0
  br i1 %352, label %406, label %393

353:                                              ; preds = %346
  %354 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !11
  %355 = zext i8 %354 to i64
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 1
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !11
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 8
  %360 = or i64 %359, %355
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 2
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !11
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 16
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 3
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !11
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 24
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 4
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !11
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 32
  %375 = or i64 %370, %374
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 5
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !11
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 40
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 6
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !11
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 48
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 7
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !11
  %388 = zext i8 %387 to i64
  %389 = shl nuw i64 %388, 56
  %390 = or i64 %385, %389
  %391 = add nsw i32 %348, -8
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 8
  br label %406

393:                                              ; preds = %351, %393
  %394 = phi i32 [ %404, %393 ], [ 0, %351 ]
  %395 = phi i64 [ %403, %393 ], [ 0, %351 ]
  %396 = zext i32 %394 to i64
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %347, i64 %396
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !11
  %399 = zext i8 %398 to i64
  %400 = shl i32 %394, 3
  %401 = zext i32 %400 to i64
  %402 = shl nuw i64 %399, %401
  %403 = or i64 %402, %395
  %404 = add nuw nsw i32 %394, 1
  %405 = icmp eq i32 %404, %348
  br i1 %405, label %406, label %393

406:                                              ; preds = %393, %353, %351
  %407 = phi i8 addrspace(4)* [ %392, %353 ], [ %347, %351 ], [ %347, %393 ]
  %408 = phi i32 [ %391, %353 ], [ 0, %351 ], [ 0, %393 ]
  %409 = phi i64 [ %390, %353 ], [ 0, %351 ], [ %403, %393 ]
  %410 = icmp ugt i32 %408, 7
  br i1 %410, label %413, label %411

411:                                              ; preds = %406
  %412 = icmp eq i32 %408, 0
  br i1 %412, label %464, label %451

413:                                              ; preds = %406
  %414 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !11
  %415 = zext i8 %414 to i64
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 1
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !11
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 8
  %420 = or i64 %419, %415
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 2
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !11
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 16
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 3
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !11
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 24
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 4
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !11
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 32
  %435 = or i64 %430, %434
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 5
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !11
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 40
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 6
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !11
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 48
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 7
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !11
  %448 = zext i8 %447 to i64
  %449 = shl nuw i64 %448, 56
  %450 = or i64 %445, %449
  br label %464

451:                                              ; preds = %411, %451
  %452 = phi i32 [ %462, %451 ], [ 0, %411 ]
  %453 = phi i64 [ %461, %451 ], [ 0, %411 ]
  %454 = zext i32 %452 to i64
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %407, i64 %454
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !11
  %457 = zext i8 %456 to i64
  %458 = shl i32 %452, 3
  %459 = zext i32 %458 to i64
  %460 = shl nuw i64 %457, %459
  %461 = or i64 %460, %453
  %462 = add nuw nsw i32 %452, 1
  %463 = icmp eq i32 %462, %408
  br i1 %463, label %464, label %451

464:                                              ; preds = %451, %413, %411
  %465 = phi i64 [ %450, %413 ], [ 0, %411 ], [ %461, %451 ]
  %466 = shl nuw nsw i64 %47, 2
  %467 = add nuw nsw i64 %466, 28
  %468 = and i64 %467, 480
  %469 = and i64 %49, -225
  %470 = or i64 %469, %468
  %471 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %27, i64 noundef %470, i64 noundef %109, i64 noundef %169, i64 noundef %229, i64 noundef %289, i64 noundef %349, i64 noundef %409, i64 noundef %465) #11
  %472 = sub i64 %39, %47
  %473 = getelementptr inbounds i8, i8 addrspace(4)* %40, i64 %47
  %474 = icmp eq i64 %472, 0
  br i1 %474, label %475, label %38

475:                                              ; preds = %464, %30
  %476 = phi <2 x i64> [ %33, %30 ], [ %471, %464 ]
  %477 = extractelement <2 x i64> %476, i64 0
  %478 = zext i32 %9 to i64
  %479 = and i64 %477, -225
  %480 = or i64 %479, 32
  %481 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %27, i64 noundef %480, i64 noundef %478, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %482 = extractelement <2 x i64> %481, i64 0
  %483 = zext i32 %19 to i64
  %484 = and i64 %482, -227
  %485 = or i64 %484, 34
  %486 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %27, i64 noundef %485, i64 noundef %483, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %487

487:                                              ; preds = %475, %3
  %488 = lshr i32 %8, 1
  %489 = icmp ugt i16 %7, 3
  br i1 %489, label %490, label %496

490:                                              ; preds = %487
  %491 = icmp sge i32 %11, %19
  %492 = xor i32 %11, -1
  %493 = add i32 %19, %492
  %494 = sext i32 %12 to i64
  %495 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %494
  br label %513

496:                                              ; preds = %529, %487
  %497 = add nsw i32 %19, -1
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %498
  store i32 0, i32 addrspace(1)* %499, align 4, !tbaa !14
  %500 = icmp sgt i32 %19, 1
  br i1 %500, label %503, label %501

501:                                              ; preds = %496
  %502 = sext i32 %12 to i64
  br label %533

503:                                              ; preds = %496
  %504 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %504, i64 24
  %506 = bitcast i8 addrspace(4)* %505 to i64 addrspace(4)*
  %507 = icmp sge i32 %11, %19
  %508 = sub nsw i32 %497, %11
  %509 = sext i32 %12 to i64
  %510 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %509
  %511 = zext i32 %11 to i64
  %512 = zext i32 %12 to i64
  br label %538

513:                                              ; preds = %490, %529
  %514 = phi i32 [ 2, %490 ], [ %530, %529 ]
  %515 = phi i32 [ 1, %490 ], [ %531, %529 ]
  %516 = icmp slt i32 %11, %515
  %517 = select i1 %491, i1 true, i1 %516
  br i1 %517, label %529, label %518

518:                                              ; preds = %513
  %519 = add i32 %514, -1
  %520 = and i32 %519, %493
  %521 = icmp eq i32 %520, 0
  br i1 %521, label %522, label %529

522:                                              ; preds = %518
  %523 = load i32, i32 addrspace(1)* %495, align 4, !tbaa !14
  %524 = sub nsw i32 %12, %515
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %525
  %527 = load i32, i32 addrspace(1)* %526, align 4, !tbaa !14
  %528 = add nsw i32 %527, %523
  store i32 %528, i32 addrspace(1)* %495, align 4, !tbaa !14
  br label %529

529:                                              ; preds = %522, %518, %513
  %530 = shl i32 %514, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %531 = shl i32 %515, 1
  %532 = icmp ult i32 %531, %488
  br i1 %532, label %513, label %496, !llvm.loop !18

533:                                              ; preds = %2403, %501
  %534 = phi i64 [ %502, %501 ], [ %509, %2403 ]
  %535 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %534
  %536 = load i32, i32 addrspace(1)* %535, align 4, !tbaa !14
  %537 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %534
  store i32 %536, i32 addrspace(1)* %537, align 4, !tbaa !14
  ret void

538:                                              ; preds = %503, %2403
  %539 = phi i32 [ %19, %503 ], [ %541, %2403 ]
  %540 = phi i32 [ %19, %503 ], [ %2404, %2403 ]
  %541 = ashr i32 %539, 1
  br i1 %20, label %542, label %1005

542:                                              ; preds = %538
  %543 = load i64, i64 addrspace(4)* %506, align 8, !tbaa !7
  %544 = inttoptr i64 %543 to i8 addrspace(1)*
  %545 = addrspacecast i8 addrspace(1)* %544 to i8*
  %546 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %545, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %547 = extractelement <2 x i64> %546, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %548, label %552

548:                                              ; preds = %542
  %549 = and i64 %547, -225
  %550 = or i64 %549, 32
  %551 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %545, i64 noundef %550, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %993

552:                                              ; preds = %542
  %553 = and i64 %547, 2
  %554 = and i64 %547, -3
  %555 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %554, i64 0
  br label %556

556:                                              ; preds = %982, %552
  %557 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str.1, i64 0, i64 31) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([32 x i8]* addrspacecast ([32 x i8] addrspace(4)* @.str.1 to [32 x i8]*) to i64)), i64 1))), %552 ], [ %990, %982 ]
  %558 = phi i8 addrspace(4)* [ getelementptr inbounds ([32 x i8], [32 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %552 ], [ %991, %982 ]
  %559 = phi <2 x i64> [ %555, %552 ], [ %989, %982 ]
  %560 = icmp ugt i64 %557, 56
  %561 = extractelement <2 x i64> %559, i64 0
  %562 = or i64 %561, %553
  %563 = insertelement <2 x i64> poison, i64 %562, i64 0
  %564 = select i1 %560, <2 x i64> %559, <2 x i64> %563
  %565 = tail call i64 @llvm.umin.i64(i64 %557, i64 56)
  %566 = trunc i64 %565 to i32
  %567 = extractelement <2 x i64> %564, i64 0
  %568 = icmp ugt i32 %566, 7
  br i1 %568, label %571, label %569

569:                                              ; preds = %556
  %570 = icmp eq i32 %566, 0
  br i1 %570, label %624, label %611

571:                                              ; preds = %556
  %572 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !11
  %573 = zext i8 %572 to i64
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 1
  %575 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !11
  %576 = zext i8 %575 to i64
  %577 = shl nuw nsw i64 %576, 8
  %578 = or i64 %577, %573
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 2
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !11
  %581 = zext i8 %580 to i64
  %582 = shl nuw nsw i64 %581, 16
  %583 = or i64 %578, %582
  %584 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 3
  %585 = load i8, i8 addrspace(4)* %584, align 1, !tbaa !11
  %586 = zext i8 %585 to i64
  %587 = shl nuw nsw i64 %586, 24
  %588 = or i64 %583, %587
  %589 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 4
  %590 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !11
  %591 = zext i8 %590 to i64
  %592 = shl nuw nsw i64 %591, 32
  %593 = or i64 %588, %592
  %594 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 5
  %595 = load i8, i8 addrspace(4)* %594, align 1, !tbaa !11
  %596 = zext i8 %595 to i64
  %597 = shl nuw nsw i64 %596, 40
  %598 = or i64 %593, %597
  %599 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 6
  %600 = load i8, i8 addrspace(4)* %599, align 1, !tbaa !11
  %601 = zext i8 %600 to i64
  %602 = shl nuw nsw i64 %601, 48
  %603 = or i64 %598, %602
  %604 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 7
  %605 = load i8, i8 addrspace(4)* %604, align 1, !tbaa !11
  %606 = zext i8 %605 to i64
  %607 = shl nuw i64 %606, 56
  %608 = or i64 %603, %607
  %609 = add nsw i32 %566, -8
  %610 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 8
  br label %624

611:                                              ; preds = %569, %611
  %612 = phi i32 [ %622, %611 ], [ 0, %569 ]
  %613 = phi i64 [ %621, %611 ], [ 0, %569 ]
  %614 = zext i32 %612 to i64
  %615 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 %614
  %616 = load i8, i8 addrspace(4)* %615, align 1, !tbaa !11
  %617 = zext i8 %616 to i64
  %618 = shl i32 %612, 3
  %619 = zext i32 %618 to i64
  %620 = shl nuw i64 %617, %619
  %621 = or i64 %620, %613
  %622 = add nuw nsw i32 %612, 1
  %623 = icmp eq i32 %622, %566
  br i1 %623, label %624, label %611, !llvm.loop !12

624:                                              ; preds = %611, %571, %569
  %625 = phi i8 addrspace(4)* [ %610, %571 ], [ %558, %569 ], [ %558, %611 ]
  %626 = phi i32 [ %609, %571 ], [ 0, %569 ], [ 0, %611 ]
  %627 = phi i64 [ %608, %571 ], [ 0, %569 ], [ %621, %611 ]
  %628 = icmp ugt i32 %626, 7
  br i1 %628, label %631, label %629

629:                                              ; preds = %624
  %630 = icmp eq i32 %626, 0
  br i1 %630, label %684, label %671

631:                                              ; preds = %624
  %632 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !11
  %633 = zext i8 %632 to i64
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 1
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !11
  %636 = zext i8 %635 to i64
  %637 = shl nuw nsw i64 %636, 8
  %638 = or i64 %637, %633
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 2
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !11
  %641 = zext i8 %640 to i64
  %642 = shl nuw nsw i64 %641, 16
  %643 = or i64 %638, %642
  %644 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 3
  %645 = load i8, i8 addrspace(4)* %644, align 1, !tbaa !11
  %646 = zext i8 %645 to i64
  %647 = shl nuw nsw i64 %646, 24
  %648 = or i64 %643, %647
  %649 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 4
  %650 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !11
  %651 = zext i8 %650 to i64
  %652 = shl nuw nsw i64 %651, 32
  %653 = or i64 %648, %652
  %654 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 5
  %655 = load i8, i8 addrspace(4)* %654, align 1, !tbaa !11
  %656 = zext i8 %655 to i64
  %657 = shl nuw nsw i64 %656, 40
  %658 = or i64 %653, %657
  %659 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 6
  %660 = load i8, i8 addrspace(4)* %659, align 1, !tbaa !11
  %661 = zext i8 %660 to i64
  %662 = shl nuw nsw i64 %661, 48
  %663 = or i64 %658, %662
  %664 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 7
  %665 = load i8, i8 addrspace(4)* %664, align 1, !tbaa !11
  %666 = zext i8 %665 to i64
  %667 = shl nuw i64 %666, 56
  %668 = or i64 %663, %667
  %669 = add nsw i32 %626, -8
  %670 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 8
  br label %684

671:                                              ; preds = %629, %671
  %672 = phi i32 [ %682, %671 ], [ 0, %629 ]
  %673 = phi i64 [ %681, %671 ], [ 0, %629 ]
  %674 = zext i32 %672 to i64
  %675 = getelementptr inbounds i8, i8 addrspace(4)* %625, i64 %674
  %676 = load i8, i8 addrspace(4)* %675, align 1, !tbaa !11
  %677 = zext i8 %676 to i64
  %678 = shl i32 %672, 3
  %679 = zext i32 %678 to i64
  %680 = shl nuw i64 %677, %679
  %681 = or i64 %680, %673
  %682 = add nuw nsw i32 %672, 1
  %683 = icmp eq i32 %682, %626
  br i1 %683, label %684, label %671

684:                                              ; preds = %671, %631, %629
  %685 = phi i8 addrspace(4)* [ %670, %631 ], [ %625, %629 ], [ %625, %671 ]
  %686 = phi i32 [ %669, %631 ], [ 0, %629 ], [ 0, %671 ]
  %687 = phi i64 [ %668, %631 ], [ 0, %629 ], [ %681, %671 ]
  %688 = icmp ugt i32 %686, 7
  br i1 %688, label %691, label %689

689:                                              ; preds = %684
  %690 = icmp eq i32 %686, 0
  br i1 %690, label %744, label %731

691:                                              ; preds = %684
  %692 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !11
  %693 = zext i8 %692 to i64
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 1
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !11
  %696 = zext i8 %695 to i64
  %697 = shl nuw nsw i64 %696, 8
  %698 = or i64 %697, %693
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 2
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !11
  %701 = zext i8 %700 to i64
  %702 = shl nuw nsw i64 %701, 16
  %703 = or i64 %698, %702
  %704 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 3
  %705 = load i8, i8 addrspace(4)* %704, align 1, !tbaa !11
  %706 = zext i8 %705 to i64
  %707 = shl nuw nsw i64 %706, 24
  %708 = or i64 %703, %707
  %709 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 4
  %710 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !11
  %711 = zext i8 %710 to i64
  %712 = shl nuw nsw i64 %711, 32
  %713 = or i64 %708, %712
  %714 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 5
  %715 = load i8, i8 addrspace(4)* %714, align 1, !tbaa !11
  %716 = zext i8 %715 to i64
  %717 = shl nuw nsw i64 %716, 40
  %718 = or i64 %713, %717
  %719 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 6
  %720 = load i8, i8 addrspace(4)* %719, align 1, !tbaa !11
  %721 = zext i8 %720 to i64
  %722 = shl nuw nsw i64 %721, 48
  %723 = or i64 %718, %722
  %724 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 7
  %725 = load i8, i8 addrspace(4)* %724, align 1, !tbaa !11
  %726 = zext i8 %725 to i64
  %727 = shl nuw i64 %726, 56
  %728 = or i64 %723, %727
  %729 = add nsw i32 %686, -8
  %730 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 8
  br label %744

731:                                              ; preds = %689, %731
  %732 = phi i32 [ %742, %731 ], [ 0, %689 ]
  %733 = phi i64 [ %741, %731 ], [ 0, %689 ]
  %734 = zext i32 %732 to i64
  %735 = getelementptr inbounds i8, i8 addrspace(4)* %685, i64 %734
  %736 = load i8, i8 addrspace(4)* %735, align 1, !tbaa !11
  %737 = zext i8 %736 to i64
  %738 = shl i32 %732, 3
  %739 = zext i32 %738 to i64
  %740 = shl nuw i64 %737, %739
  %741 = or i64 %740, %733
  %742 = add nuw nsw i32 %732, 1
  %743 = icmp eq i32 %742, %686
  br i1 %743, label %744, label %731

744:                                              ; preds = %731, %691, %689
  %745 = phi i8 addrspace(4)* [ %730, %691 ], [ %685, %689 ], [ %685, %731 ]
  %746 = phi i32 [ %729, %691 ], [ 0, %689 ], [ 0, %731 ]
  %747 = phi i64 [ %728, %691 ], [ 0, %689 ], [ %741, %731 ]
  %748 = icmp ugt i32 %746, 7
  br i1 %748, label %751, label %749

749:                                              ; preds = %744
  %750 = icmp eq i32 %746, 0
  br i1 %750, label %804, label %791

751:                                              ; preds = %744
  %752 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !11
  %753 = zext i8 %752 to i64
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 1
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !11
  %756 = zext i8 %755 to i64
  %757 = shl nuw nsw i64 %756, 8
  %758 = or i64 %757, %753
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 2
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !11
  %761 = zext i8 %760 to i64
  %762 = shl nuw nsw i64 %761, 16
  %763 = or i64 %758, %762
  %764 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 3
  %765 = load i8, i8 addrspace(4)* %764, align 1, !tbaa !11
  %766 = zext i8 %765 to i64
  %767 = shl nuw nsw i64 %766, 24
  %768 = or i64 %763, %767
  %769 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 4
  %770 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !11
  %771 = zext i8 %770 to i64
  %772 = shl nuw nsw i64 %771, 32
  %773 = or i64 %768, %772
  %774 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 5
  %775 = load i8, i8 addrspace(4)* %774, align 1, !tbaa !11
  %776 = zext i8 %775 to i64
  %777 = shl nuw nsw i64 %776, 40
  %778 = or i64 %773, %777
  %779 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 6
  %780 = load i8, i8 addrspace(4)* %779, align 1, !tbaa !11
  %781 = zext i8 %780 to i64
  %782 = shl nuw nsw i64 %781, 48
  %783 = or i64 %778, %782
  %784 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 7
  %785 = load i8, i8 addrspace(4)* %784, align 1, !tbaa !11
  %786 = zext i8 %785 to i64
  %787 = shl nuw i64 %786, 56
  %788 = or i64 %783, %787
  %789 = add nsw i32 %746, -8
  %790 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 8
  br label %804

791:                                              ; preds = %749, %791
  %792 = phi i32 [ %802, %791 ], [ 0, %749 ]
  %793 = phi i64 [ %801, %791 ], [ 0, %749 ]
  %794 = zext i32 %792 to i64
  %795 = getelementptr inbounds i8, i8 addrspace(4)* %745, i64 %794
  %796 = load i8, i8 addrspace(4)* %795, align 1, !tbaa !11
  %797 = zext i8 %796 to i64
  %798 = shl i32 %792, 3
  %799 = zext i32 %798 to i64
  %800 = shl nuw i64 %797, %799
  %801 = or i64 %800, %793
  %802 = add nuw nsw i32 %792, 1
  %803 = icmp eq i32 %802, %746
  br i1 %803, label %804, label %791

804:                                              ; preds = %791, %751, %749
  %805 = phi i8 addrspace(4)* [ %790, %751 ], [ %745, %749 ], [ %745, %791 ]
  %806 = phi i32 [ %789, %751 ], [ 0, %749 ], [ 0, %791 ]
  %807 = phi i64 [ %788, %751 ], [ 0, %749 ], [ %801, %791 ]
  %808 = icmp ugt i32 %806, 7
  br i1 %808, label %811, label %809

809:                                              ; preds = %804
  %810 = icmp eq i32 %806, 0
  br i1 %810, label %864, label %851

811:                                              ; preds = %804
  %812 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !11
  %813 = zext i8 %812 to i64
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 1
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !11
  %816 = zext i8 %815 to i64
  %817 = shl nuw nsw i64 %816, 8
  %818 = or i64 %817, %813
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 2
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !11
  %821 = zext i8 %820 to i64
  %822 = shl nuw nsw i64 %821, 16
  %823 = or i64 %818, %822
  %824 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 3
  %825 = load i8, i8 addrspace(4)* %824, align 1, !tbaa !11
  %826 = zext i8 %825 to i64
  %827 = shl nuw nsw i64 %826, 24
  %828 = or i64 %823, %827
  %829 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 4
  %830 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !11
  %831 = zext i8 %830 to i64
  %832 = shl nuw nsw i64 %831, 32
  %833 = or i64 %828, %832
  %834 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 5
  %835 = load i8, i8 addrspace(4)* %834, align 1, !tbaa !11
  %836 = zext i8 %835 to i64
  %837 = shl nuw nsw i64 %836, 40
  %838 = or i64 %833, %837
  %839 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 6
  %840 = load i8, i8 addrspace(4)* %839, align 1, !tbaa !11
  %841 = zext i8 %840 to i64
  %842 = shl nuw nsw i64 %841, 48
  %843 = or i64 %838, %842
  %844 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 7
  %845 = load i8, i8 addrspace(4)* %844, align 1, !tbaa !11
  %846 = zext i8 %845 to i64
  %847 = shl nuw i64 %846, 56
  %848 = or i64 %843, %847
  %849 = add nsw i32 %806, -8
  %850 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 8
  br label %864

851:                                              ; preds = %809, %851
  %852 = phi i32 [ %862, %851 ], [ 0, %809 ]
  %853 = phi i64 [ %861, %851 ], [ 0, %809 ]
  %854 = zext i32 %852 to i64
  %855 = getelementptr inbounds i8, i8 addrspace(4)* %805, i64 %854
  %856 = load i8, i8 addrspace(4)* %855, align 1, !tbaa !11
  %857 = zext i8 %856 to i64
  %858 = shl i32 %852, 3
  %859 = zext i32 %858 to i64
  %860 = shl nuw i64 %857, %859
  %861 = or i64 %860, %853
  %862 = add nuw nsw i32 %852, 1
  %863 = icmp eq i32 %862, %806
  br i1 %863, label %864, label %851

864:                                              ; preds = %851, %811, %809
  %865 = phi i8 addrspace(4)* [ %850, %811 ], [ %805, %809 ], [ %805, %851 ]
  %866 = phi i32 [ %849, %811 ], [ 0, %809 ], [ 0, %851 ]
  %867 = phi i64 [ %848, %811 ], [ 0, %809 ], [ %861, %851 ]
  %868 = icmp ugt i32 %866, 7
  br i1 %868, label %871, label %869

869:                                              ; preds = %864
  %870 = icmp eq i32 %866, 0
  br i1 %870, label %924, label %911

871:                                              ; preds = %864
  %872 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !11
  %873 = zext i8 %872 to i64
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 1
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !11
  %876 = zext i8 %875 to i64
  %877 = shl nuw nsw i64 %876, 8
  %878 = or i64 %877, %873
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 2
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !11
  %881 = zext i8 %880 to i64
  %882 = shl nuw nsw i64 %881, 16
  %883 = or i64 %878, %882
  %884 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 3
  %885 = load i8, i8 addrspace(4)* %884, align 1, !tbaa !11
  %886 = zext i8 %885 to i64
  %887 = shl nuw nsw i64 %886, 24
  %888 = or i64 %883, %887
  %889 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 4
  %890 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !11
  %891 = zext i8 %890 to i64
  %892 = shl nuw nsw i64 %891, 32
  %893 = or i64 %888, %892
  %894 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 5
  %895 = load i8, i8 addrspace(4)* %894, align 1, !tbaa !11
  %896 = zext i8 %895 to i64
  %897 = shl nuw nsw i64 %896, 40
  %898 = or i64 %893, %897
  %899 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 6
  %900 = load i8, i8 addrspace(4)* %899, align 1, !tbaa !11
  %901 = zext i8 %900 to i64
  %902 = shl nuw nsw i64 %901, 48
  %903 = or i64 %898, %902
  %904 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 7
  %905 = load i8, i8 addrspace(4)* %904, align 1, !tbaa !11
  %906 = zext i8 %905 to i64
  %907 = shl nuw i64 %906, 56
  %908 = or i64 %903, %907
  %909 = add nsw i32 %866, -8
  %910 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 8
  br label %924

911:                                              ; preds = %869, %911
  %912 = phi i32 [ %922, %911 ], [ 0, %869 ]
  %913 = phi i64 [ %921, %911 ], [ 0, %869 ]
  %914 = zext i32 %912 to i64
  %915 = getelementptr inbounds i8, i8 addrspace(4)* %865, i64 %914
  %916 = load i8, i8 addrspace(4)* %915, align 1, !tbaa !11
  %917 = zext i8 %916 to i64
  %918 = shl i32 %912, 3
  %919 = zext i32 %918 to i64
  %920 = shl nuw i64 %917, %919
  %921 = or i64 %920, %913
  %922 = add nuw nsw i32 %912, 1
  %923 = icmp eq i32 %922, %866
  br i1 %923, label %924, label %911

924:                                              ; preds = %911, %871, %869
  %925 = phi i8 addrspace(4)* [ %910, %871 ], [ %865, %869 ], [ %865, %911 ]
  %926 = phi i32 [ %909, %871 ], [ 0, %869 ], [ 0, %911 ]
  %927 = phi i64 [ %908, %871 ], [ 0, %869 ], [ %921, %911 ]
  %928 = icmp ugt i32 %926, 7
  br i1 %928, label %931, label %929

929:                                              ; preds = %924
  %930 = icmp eq i32 %926, 0
  br i1 %930, label %982, label %969

931:                                              ; preds = %924
  %932 = load i8, i8 addrspace(4)* %925, align 1, !tbaa !11
  %933 = zext i8 %932 to i64
  %934 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 1
  %935 = load i8, i8 addrspace(4)* %934, align 1, !tbaa !11
  %936 = zext i8 %935 to i64
  %937 = shl nuw nsw i64 %936, 8
  %938 = or i64 %937, %933
  %939 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 2
  %940 = load i8, i8 addrspace(4)* %939, align 1, !tbaa !11
  %941 = zext i8 %940 to i64
  %942 = shl nuw nsw i64 %941, 16
  %943 = or i64 %938, %942
  %944 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 3
  %945 = load i8, i8 addrspace(4)* %944, align 1, !tbaa !11
  %946 = zext i8 %945 to i64
  %947 = shl nuw nsw i64 %946, 24
  %948 = or i64 %943, %947
  %949 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 4
  %950 = load i8, i8 addrspace(4)* %949, align 1, !tbaa !11
  %951 = zext i8 %950 to i64
  %952 = shl nuw nsw i64 %951, 32
  %953 = or i64 %948, %952
  %954 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 5
  %955 = load i8, i8 addrspace(4)* %954, align 1, !tbaa !11
  %956 = zext i8 %955 to i64
  %957 = shl nuw nsw i64 %956, 40
  %958 = or i64 %953, %957
  %959 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 6
  %960 = load i8, i8 addrspace(4)* %959, align 1, !tbaa !11
  %961 = zext i8 %960 to i64
  %962 = shl nuw nsw i64 %961, 48
  %963 = or i64 %958, %962
  %964 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 7
  %965 = load i8, i8 addrspace(4)* %964, align 1, !tbaa !11
  %966 = zext i8 %965 to i64
  %967 = shl nuw i64 %966, 56
  %968 = or i64 %963, %967
  br label %982

969:                                              ; preds = %929, %969
  %970 = phi i32 [ %980, %969 ], [ 0, %929 ]
  %971 = phi i64 [ %979, %969 ], [ 0, %929 ]
  %972 = zext i32 %970 to i64
  %973 = getelementptr inbounds i8, i8 addrspace(4)* %925, i64 %972
  %974 = load i8, i8 addrspace(4)* %973, align 1, !tbaa !11
  %975 = zext i8 %974 to i64
  %976 = shl i32 %970, 3
  %977 = zext i32 %976 to i64
  %978 = shl nuw i64 %975, %977
  %979 = or i64 %978, %971
  %980 = add nuw nsw i32 %970, 1
  %981 = icmp eq i32 %980, %926
  br i1 %981, label %982, label %969

982:                                              ; preds = %969, %931, %929
  %983 = phi i64 [ %968, %931 ], [ 0, %929 ], [ %979, %969 ]
  %984 = shl nuw nsw i64 %565, 2
  %985 = add nuw nsw i64 %984, 28
  %986 = and i64 %985, 480
  %987 = and i64 %567, -225
  %988 = or i64 %987, %986
  %989 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %545, i64 noundef %988, i64 noundef %627, i64 noundef %687, i64 noundef %747, i64 noundef %807, i64 noundef %867, i64 noundef %927, i64 noundef %983) #11
  %990 = sub i64 %557, %565
  %991 = getelementptr inbounds i8, i8 addrspace(4)* %558, i64 %565
  %992 = icmp eq i64 %990, 0
  br i1 %992, label %993, label %556

993:                                              ; preds = %982, %548
  %994 = phi <2 x i64> [ %551, %548 ], [ %989, %982 ]
  %995 = extractelement <2 x i64> %994, i64 0
  %996 = zext i32 %540 to i64
  %997 = and i64 %995, -225
  %998 = or i64 %997, 32
  %999 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %545, i64 noundef %998, i64 noundef %996, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1000 = extractelement <2 x i64> %999, i64 0
  %1001 = zext i32 %541 to i64
  %1002 = and i64 %1000, -227
  %1003 = or i64 %1002, 34
  %1004 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %545, i64 noundef %1003, i64 noundef %1001, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1005

1005:                                             ; preds = %993, %538
  %1006 = icmp slt i32 %11, %541
  %1007 = select i1 %507, i1 true, i1 %1006
  br i1 %1007, label %1952, label %1008

1008:                                             ; preds = %1005
  %1009 = srem i32 %508, %540
  %1010 = icmp eq i32 %1009, 0
  br i1 %1010, label %1011, label %1952

1011:                                             ; preds = %1008
  %1012 = load i32, i32 addrspace(1)* %510, align 4, !tbaa !14
  %1013 = sub nsw i32 %12, %540
  %1014 = sext i32 %1013 to i64
  %1015 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1014
  %1016 = load i32, i32 addrspace(1)* %1015, align 4, !tbaa !14
  %1017 = add nsw i32 %1016, %1012
  %1018 = load i64, i64 addrspace(4)* %506, align 8, !tbaa !7
  %1019 = inttoptr i64 %1018 to i8 addrspace(1)*
  %1020 = addrspacecast i8 addrspace(1)* %1019 to i8*
  %1021 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1022 = extractelement <2 x i64> %1021, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1023, label %1027

1023:                                             ; preds = %1011
  %1024 = and i64 %1022, -225
  %1025 = or i64 %1024, 32
  %1026 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1025, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1468

1027:                                             ; preds = %1011
  %1028 = and i64 %1022, 2
  %1029 = and i64 %1022, -3
  %1030 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1029, i64 0
  br label %1031

1031:                                             ; preds = %1457, %1027
  %1032 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 28) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([29 x i8]* addrspacecast ([29 x i8] addrspace(4)* @.str.2 to [29 x i8]*) to i64)), i64 1))), %1027 ], [ %1465, %1457 ]
  %1033 = phi i8 addrspace(4)* [ getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1027 ], [ %1466, %1457 ]
  %1034 = phi <2 x i64> [ %1030, %1027 ], [ %1464, %1457 ]
  %1035 = icmp ugt i64 %1032, 56
  %1036 = extractelement <2 x i64> %1034, i64 0
  %1037 = or i64 %1036, %1028
  %1038 = insertelement <2 x i64> poison, i64 %1037, i64 0
  %1039 = select i1 %1035, <2 x i64> %1034, <2 x i64> %1038
  %1040 = tail call i64 @llvm.umin.i64(i64 %1032, i64 56)
  %1041 = trunc i64 %1040 to i32
  %1042 = extractelement <2 x i64> %1039, i64 0
  %1043 = icmp ugt i32 %1041, 7
  br i1 %1043, label %1046, label %1044

1044:                                             ; preds = %1031
  %1045 = icmp eq i32 %1041, 0
  br i1 %1045, label %1099, label %1086

1046:                                             ; preds = %1031
  %1047 = load i8, i8 addrspace(4)* %1033, align 1, !tbaa !11
  %1048 = zext i8 %1047 to i64
  %1049 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 1
  %1050 = load i8, i8 addrspace(4)* %1049, align 1, !tbaa !11
  %1051 = zext i8 %1050 to i64
  %1052 = shl nuw nsw i64 %1051, 8
  %1053 = or i64 %1052, %1048
  %1054 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 2
  %1055 = load i8, i8 addrspace(4)* %1054, align 1, !tbaa !11
  %1056 = zext i8 %1055 to i64
  %1057 = shl nuw nsw i64 %1056, 16
  %1058 = or i64 %1053, %1057
  %1059 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 3
  %1060 = load i8, i8 addrspace(4)* %1059, align 1, !tbaa !11
  %1061 = zext i8 %1060 to i64
  %1062 = shl nuw nsw i64 %1061, 24
  %1063 = or i64 %1058, %1062
  %1064 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 4
  %1065 = load i8, i8 addrspace(4)* %1064, align 1, !tbaa !11
  %1066 = zext i8 %1065 to i64
  %1067 = shl nuw nsw i64 %1066, 32
  %1068 = or i64 %1063, %1067
  %1069 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 5
  %1070 = load i8, i8 addrspace(4)* %1069, align 1, !tbaa !11
  %1071 = zext i8 %1070 to i64
  %1072 = shl nuw nsw i64 %1071, 40
  %1073 = or i64 %1068, %1072
  %1074 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 6
  %1075 = load i8, i8 addrspace(4)* %1074, align 1, !tbaa !11
  %1076 = zext i8 %1075 to i64
  %1077 = shl nuw nsw i64 %1076, 48
  %1078 = or i64 %1073, %1077
  %1079 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 7
  %1080 = load i8, i8 addrspace(4)* %1079, align 1, !tbaa !11
  %1081 = zext i8 %1080 to i64
  %1082 = shl nuw i64 %1081, 56
  %1083 = or i64 %1078, %1082
  %1084 = add nsw i32 %1041, -8
  %1085 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 8
  br label %1099

1086:                                             ; preds = %1044, %1086
  %1087 = phi i32 [ %1097, %1086 ], [ 0, %1044 ]
  %1088 = phi i64 [ %1096, %1086 ], [ 0, %1044 ]
  %1089 = zext i32 %1087 to i64
  %1090 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 %1089
  %1091 = load i8, i8 addrspace(4)* %1090, align 1, !tbaa !11
  %1092 = zext i8 %1091 to i64
  %1093 = shl i32 %1087, 3
  %1094 = zext i32 %1093 to i64
  %1095 = shl nuw i64 %1092, %1094
  %1096 = or i64 %1095, %1088
  %1097 = add nuw nsw i32 %1087, 1
  %1098 = icmp eq i32 %1097, %1041
  br i1 %1098, label %1099, label %1086, !llvm.loop !12

1099:                                             ; preds = %1086, %1046, %1044
  %1100 = phi i8 addrspace(4)* [ %1085, %1046 ], [ %1033, %1044 ], [ %1033, %1086 ]
  %1101 = phi i32 [ %1084, %1046 ], [ 0, %1044 ], [ 0, %1086 ]
  %1102 = phi i64 [ %1083, %1046 ], [ 0, %1044 ], [ %1096, %1086 ]
  %1103 = icmp ugt i32 %1101, 7
  br i1 %1103, label %1106, label %1104

1104:                                             ; preds = %1099
  %1105 = icmp eq i32 %1101, 0
  br i1 %1105, label %1159, label %1146

1106:                                             ; preds = %1099
  %1107 = load i8, i8 addrspace(4)* %1100, align 1, !tbaa !11
  %1108 = zext i8 %1107 to i64
  %1109 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 1
  %1110 = load i8, i8 addrspace(4)* %1109, align 1, !tbaa !11
  %1111 = zext i8 %1110 to i64
  %1112 = shl nuw nsw i64 %1111, 8
  %1113 = or i64 %1112, %1108
  %1114 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 2
  %1115 = load i8, i8 addrspace(4)* %1114, align 1, !tbaa !11
  %1116 = zext i8 %1115 to i64
  %1117 = shl nuw nsw i64 %1116, 16
  %1118 = or i64 %1113, %1117
  %1119 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 3
  %1120 = load i8, i8 addrspace(4)* %1119, align 1, !tbaa !11
  %1121 = zext i8 %1120 to i64
  %1122 = shl nuw nsw i64 %1121, 24
  %1123 = or i64 %1118, %1122
  %1124 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 4
  %1125 = load i8, i8 addrspace(4)* %1124, align 1, !tbaa !11
  %1126 = zext i8 %1125 to i64
  %1127 = shl nuw nsw i64 %1126, 32
  %1128 = or i64 %1123, %1127
  %1129 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 5
  %1130 = load i8, i8 addrspace(4)* %1129, align 1, !tbaa !11
  %1131 = zext i8 %1130 to i64
  %1132 = shl nuw nsw i64 %1131, 40
  %1133 = or i64 %1128, %1132
  %1134 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 6
  %1135 = load i8, i8 addrspace(4)* %1134, align 1, !tbaa !11
  %1136 = zext i8 %1135 to i64
  %1137 = shl nuw nsw i64 %1136, 48
  %1138 = or i64 %1133, %1137
  %1139 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 7
  %1140 = load i8, i8 addrspace(4)* %1139, align 1, !tbaa !11
  %1141 = zext i8 %1140 to i64
  %1142 = shl nuw i64 %1141, 56
  %1143 = or i64 %1138, %1142
  %1144 = add nsw i32 %1101, -8
  %1145 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 8
  br label %1159

1146:                                             ; preds = %1104, %1146
  %1147 = phi i32 [ %1157, %1146 ], [ 0, %1104 ]
  %1148 = phi i64 [ %1156, %1146 ], [ 0, %1104 ]
  %1149 = zext i32 %1147 to i64
  %1150 = getelementptr inbounds i8, i8 addrspace(4)* %1100, i64 %1149
  %1151 = load i8, i8 addrspace(4)* %1150, align 1, !tbaa !11
  %1152 = zext i8 %1151 to i64
  %1153 = shl i32 %1147, 3
  %1154 = zext i32 %1153 to i64
  %1155 = shl nuw i64 %1152, %1154
  %1156 = or i64 %1155, %1148
  %1157 = add nuw nsw i32 %1147, 1
  %1158 = icmp eq i32 %1157, %1101
  br i1 %1158, label %1159, label %1146

1159:                                             ; preds = %1146, %1106, %1104
  %1160 = phi i8 addrspace(4)* [ %1145, %1106 ], [ %1100, %1104 ], [ %1100, %1146 ]
  %1161 = phi i32 [ %1144, %1106 ], [ 0, %1104 ], [ 0, %1146 ]
  %1162 = phi i64 [ %1143, %1106 ], [ 0, %1104 ], [ %1156, %1146 ]
  %1163 = icmp ugt i32 %1161, 7
  br i1 %1163, label %1166, label %1164

1164:                                             ; preds = %1159
  %1165 = icmp eq i32 %1161, 0
  br i1 %1165, label %1219, label %1206

1166:                                             ; preds = %1159
  %1167 = load i8, i8 addrspace(4)* %1160, align 1, !tbaa !11
  %1168 = zext i8 %1167 to i64
  %1169 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 1
  %1170 = load i8, i8 addrspace(4)* %1169, align 1, !tbaa !11
  %1171 = zext i8 %1170 to i64
  %1172 = shl nuw nsw i64 %1171, 8
  %1173 = or i64 %1172, %1168
  %1174 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 2
  %1175 = load i8, i8 addrspace(4)* %1174, align 1, !tbaa !11
  %1176 = zext i8 %1175 to i64
  %1177 = shl nuw nsw i64 %1176, 16
  %1178 = or i64 %1173, %1177
  %1179 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 3
  %1180 = load i8, i8 addrspace(4)* %1179, align 1, !tbaa !11
  %1181 = zext i8 %1180 to i64
  %1182 = shl nuw nsw i64 %1181, 24
  %1183 = or i64 %1178, %1182
  %1184 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 4
  %1185 = load i8, i8 addrspace(4)* %1184, align 1, !tbaa !11
  %1186 = zext i8 %1185 to i64
  %1187 = shl nuw nsw i64 %1186, 32
  %1188 = or i64 %1183, %1187
  %1189 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 5
  %1190 = load i8, i8 addrspace(4)* %1189, align 1, !tbaa !11
  %1191 = zext i8 %1190 to i64
  %1192 = shl nuw nsw i64 %1191, 40
  %1193 = or i64 %1188, %1192
  %1194 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 6
  %1195 = load i8, i8 addrspace(4)* %1194, align 1, !tbaa !11
  %1196 = zext i8 %1195 to i64
  %1197 = shl nuw nsw i64 %1196, 48
  %1198 = or i64 %1193, %1197
  %1199 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 7
  %1200 = load i8, i8 addrspace(4)* %1199, align 1, !tbaa !11
  %1201 = zext i8 %1200 to i64
  %1202 = shl nuw i64 %1201, 56
  %1203 = or i64 %1198, %1202
  %1204 = add nsw i32 %1161, -8
  %1205 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 8
  br label %1219

1206:                                             ; preds = %1164, %1206
  %1207 = phi i32 [ %1217, %1206 ], [ 0, %1164 ]
  %1208 = phi i64 [ %1216, %1206 ], [ 0, %1164 ]
  %1209 = zext i32 %1207 to i64
  %1210 = getelementptr inbounds i8, i8 addrspace(4)* %1160, i64 %1209
  %1211 = load i8, i8 addrspace(4)* %1210, align 1, !tbaa !11
  %1212 = zext i8 %1211 to i64
  %1213 = shl i32 %1207, 3
  %1214 = zext i32 %1213 to i64
  %1215 = shl nuw i64 %1212, %1214
  %1216 = or i64 %1215, %1208
  %1217 = add nuw nsw i32 %1207, 1
  %1218 = icmp eq i32 %1217, %1161
  br i1 %1218, label %1219, label %1206

1219:                                             ; preds = %1206, %1166, %1164
  %1220 = phi i8 addrspace(4)* [ %1205, %1166 ], [ %1160, %1164 ], [ %1160, %1206 ]
  %1221 = phi i32 [ %1204, %1166 ], [ 0, %1164 ], [ 0, %1206 ]
  %1222 = phi i64 [ %1203, %1166 ], [ 0, %1164 ], [ %1216, %1206 ]
  %1223 = icmp ugt i32 %1221, 7
  br i1 %1223, label %1226, label %1224

1224:                                             ; preds = %1219
  %1225 = icmp eq i32 %1221, 0
  br i1 %1225, label %1279, label %1266

1226:                                             ; preds = %1219
  %1227 = load i8, i8 addrspace(4)* %1220, align 1, !tbaa !11
  %1228 = zext i8 %1227 to i64
  %1229 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 1
  %1230 = load i8, i8 addrspace(4)* %1229, align 1, !tbaa !11
  %1231 = zext i8 %1230 to i64
  %1232 = shl nuw nsw i64 %1231, 8
  %1233 = or i64 %1232, %1228
  %1234 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 2
  %1235 = load i8, i8 addrspace(4)* %1234, align 1, !tbaa !11
  %1236 = zext i8 %1235 to i64
  %1237 = shl nuw nsw i64 %1236, 16
  %1238 = or i64 %1233, %1237
  %1239 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 3
  %1240 = load i8, i8 addrspace(4)* %1239, align 1, !tbaa !11
  %1241 = zext i8 %1240 to i64
  %1242 = shl nuw nsw i64 %1241, 24
  %1243 = or i64 %1238, %1242
  %1244 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 4
  %1245 = load i8, i8 addrspace(4)* %1244, align 1, !tbaa !11
  %1246 = zext i8 %1245 to i64
  %1247 = shl nuw nsw i64 %1246, 32
  %1248 = or i64 %1243, %1247
  %1249 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 5
  %1250 = load i8, i8 addrspace(4)* %1249, align 1, !tbaa !11
  %1251 = zext i8 %1250 to i64
  %1252 = shl nuw nsw i64 %1251, 40
  %1253 = or i64 %1248, %1252
  %1254 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 6
  %1255 = load i8, i8 addrspace(4)* %1254, align 1, !tbaa !11
  %1256 = zext i8 %1255 to i64
  %1257 = shl nuw nsw i64 %1256, 48
  %1258 = or i64 %1253, %1257
  %1259 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 7
  %1260 = load i8, i8 addrspace(4)* %1259, align 1, !tbaa !11
  %1261 = zext i8 %1260 to i64
  %1262 = shl nuw i64 %1261, 56
  %1263 = or i64 %1258, %1262
  %1264 = add nsw i32 %1221, -8
  %1265 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 8
  br label %1279

1266:                                             ; preds = %1224, %1266
  %1267 = phi i32 [ %1277, %1266 ], [ 0, %1224 ]
  %1268 = phi i64 [ %1276, %1266 ], [ 0, %1224 ]
  %1269 = zext i32 %1267 to i64
  %1270 = getelementptr inbounds i8, i8 addrspace(4)* %1220, i64 %1269
  %1271 = load i8, i8 addrspace(4)* %1270, align 1, !tbaa !11
  %1272 = zext i8 %1271 to i64
  %1273 = shl i32 %1267, 3
  %1274 = zext i32 %1273 to i64
  %1275 = shl nuw i64 %1272, %1274
  %1276 = or i64 %1275, %1268
  %1277 = add nuw nsw i32 %1267, 1
  %1278 = icmp eq i32 %1277, %1221
  br i1 %1278, label %1279, label %1266

1279:                                             ; preds = %1266, %1226, %1224
  %1280 = phi i8 addrspace(4)* [ %1265, %1226 ], [ %1220, %1224 ], [ %1220, %1266 ]
  %1281 = phi i32 [ %1264, %1226 ], [ 0, %1224 ], [ 0, %1266 ]
  %1282 = phi i64 [ %1263, %1226 ], [ 0, %1224 ], [ %1276, %1266 ]
  %1283 = icmp ugt i32 %1281, 7
  br i1 %1283, label %1286, label %1284

1284:                                             ; preds = %1279
  %1285 = icmp eq i32 %1281, 0
  br i1 %1285, label %1339, label %1326

1286:                                             ; preds = %1279
  %1287 = load i8, i8 addrspace(4)* %1280, align 1, !tbaa !11
  %1288 = zext i8 %1287 to i64
  %1289 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 1
  %1290 = load i8, i8 addrspace(4)* %1289, align 1, !tbaa !11
  %1291 = zext i8 %1290 to i64
  %1292 = shl nuw nsw i64 %1291, 8
  %1293 = or i64 %1292, %1288
  %1294 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 2
  %1295 = load i8, i8 addrspace(4)* %1294, align 1, !tbaa !11
  %1296 = zext i8 %1295 to i64
  %1297 = shl nuw nsw i64 %1296, 16
  %1298 = or i64 %1293, %1297
  %1299 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 3
  %1300 = load i8, i8 addrspace(4)* %1299, align 1, !tbaa !11
  %1301 = zext i8 %1300 to i64
  %1302 = shl nuw nsw i64 %1301, 24
  %1303 = or i64 %1298, %1302
  %1304 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 4
  %1305 = load i8, i8 addrspace(4)* %1304, align 1, !tbaa !11
  %1306 = zext i8 %1305 to i64
  %1307 = shl nuw nsw i64 %1306, 32
  %1308 = or i64 %1303, %1307
  %1309 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 5
  %1310 = load i8, i8 addrspace(4)* %1309, align 1, !tbaa !11
  %1311 = zext i8 %1310 to i64
  %1312 = shl nuw nsw i64 %1311, 40
  %1313 = or i64 %1308, %1312
  %1314 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 6
  %1315 = load i8, i8 addrspace(4)* %1314, align 1, !tbaa !11
  %1316 = zext i8 %1315 to i64
  %1317 = shl nuw nsw i64 %1316, 48
  %1318 = or i64 %1313, %1317
  %1319 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 7
  %1320 = load i8, i8 addrspace(4)* %1319, align 1, !tbaa !11
  %1321 = zext i8 %1320 to i64
  %1322 = shl nuw i64 %1321, 56
  %1323 = or i64 %1318, %1322
  %1324 = add nsw i32 %1281, -8
  %1325 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 8
  br label %1339

1326:                                             ; preds = %1284, %1326
  %1327 = phi i32 [ %1337, %1326 ], [ 0, %1284 ]
  %1328 = phi i64 [ %1336, %1326 ], [ 0, %1284 ]
  %1329 = zext i32 %1327 to i64
  %1330 = getelementptr inbounds i8, i8 addrspace(4)* %1280, i64 %1329
  %1331 = load i8, i8 addrspace(4)* %1330, align 1, !tbaa !11
  %1332 = zext i8 %1331 to i64
  %1333 = shl i32 %1327, 3
  %1334 = zext i32 %1333 to i64
  %1335 = shl nuw i64 %1332, %1334
  %1336 = or i64 %1335, %1328
  %1337 = add nuw nsw i32 %1327, 1
  %1338 = icmp eq i32 %1337, %1281
  br i1 %1338, label %1339, label %1326

1339:                                             ; preds = %1326, %1286, %1284
  %1340 = phi i8 addrspace(4)* [ %1325, %1286 ], [ %1280, %1284 ], [ %1280, %1326 ]
  %1341 = phi i32 [ %1324, %1286 ], [ 0, %1284 ], [ 0, %1326 ]
  %1342 = phi i64 [ %1323, %1286 ], [ 0, %1284 ], [ %1336, %1326 ]
  %1343 = icmp ugt i32 %1341, 7
  br i1 %1343, label %1346, label %1344

1344:                                             ; preds = %1339
  %1345 = icmp eq i32 %1341, 0
  br i1 %1345, label %1399, label %1386

1346:                                             ; preds = %1339
  %1347 = load i8, i8 addrspace(4)* %1340, align 1, !tbaa !11
  %1348 = zext i8 %1347 to i64
  %1349 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 1
  %1350 = load i8, i8 addrspace(4)* %1349, align 1, !tbaa !11
  %1351 = zext i8 %1350 to i64
  %1352 = shl nuw nsw i64 %1351, 8
  %1353 = or i64 %1352, %1348
  %1354 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 2
  %1355 = load i8, i8 addrspace(4)* %1354, align 1, !tbaa !11
  %1356 = zext i8 %1355 to i64
  %1357 = shl nuw nsw i64 %1356, 16
  %1358 = or i64 %1353, %1357
  %1359 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 3
  %1360 = load i8, i8 addrspace(4)* %1359, align 1, !tbaa !11
  %1361 = zext i8 %1360 to i64
  %1362 = shl nuw nsw i64 %1361, 24
  %1363 = or i64 %1358, %1362
  %1364 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 4
  %1365 = load i8, i8 addrspace(4)* %1364, align 1, !tbaa !11
  %1366 = zext i8 %1365 to i64
  %1367 = shl nuw nsw i64 %1366, 32
  %1368 = or i64 %1363, %1367
  %1369 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 5
  %1370 = load i8, i8 addrspace(4)* %1369, align 1, !tbaa !11
  %1371 = zext i8 %1370 to i64
  %1372 = shl nuw nsw i64 %1371, 40
  %1373 = or i64 %1368, %1372
  %1374 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 6
  %1375 = load i8, i8 addrspace(4)* %1374, align 1, !tbaa !11
  %1376 = zext i8 %1375 to i64
  %1377 = shl nuw nsw i64 %1376, 48
  %1378 = or i64 %1373, %1377
  %1379 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 7
  %1380 = load i8, i8 addrspace(4)* %1379, align 1, !tbaa !11
  %1381 = zext i8 %1380 to i64
  %1382 = shl nuw i64 %1381, 56
  %1383 = or i64 %1378, %1382
  %1384 = add nsw i32 %1341, -8
  %1385 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 8
  br label %1399

1386:                                             ; preds = %1344, %1386
  %1387 = phi i32 [ %1397, %1386 ], [ 0, %1344 ]
  %1388 = phi i64 [ %1396, %1386 ], [ 0, %1344 ]
  %1389 = zext i32 %1387 to i64
  %1390 = getelementptr inbounds i8, i8 addrspace(4)* %1340, i64 %1389
  %1391 = load i8, i8 addrspace(4)* %1390, align 1, !tbaa !11
  %1392 = zext i8 %1391 to i64
  %1393 = shl i32 %1387, 3
  %1394 = zext i32 %1393 to i64
  %1395 = shl nuw i64 %1392, %1394
  %1396 = or i64 %1395, %1388
  %1397 = add nuw nsw i32 %1387, 1
  %1398 = icmp eq i32 %1397, %1341
  br i1 %1398, label %1399, label %1386

1399:                                             ; preds = %1386, %1346, %1344
  %1400 = phi i8 addrspace(4)* [ %1385, %1346 ], [ %1340, %1344 ], [ %1340, %1386 ]
  %1401 = phi i32 [ %1384, %1346 ], [ 0, %1344 ], [ 0, %1386 ]
  %1402 = phi i64 [ %1383, %1346 ], [ 0, %1344 ], [ %1396, %1386 ]
  %1403 = icmp ugt i32 %1401, 7
  br i1 %1403, label %1406, label %1404

1404:                                             ; preds = %1399
  %1405 = icmp eq i32 %1401, 0
  br i1 %1405, label %1457, label %1444

1406:                                             ; preds = %1399
  %1407 = load i8, i8 addrspace(4)* %1400, align 1, !tbaa !11
  %1408 = zext i8 %1407 to i64
  %1409 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 1
  %1410 = load i8, i8 addrspace(4)* %1409, align 1, !tbaa !11
  %1411 = zext i8 %1410 to i64
  %1412 = shl nuw nsw i64 %1411, 8
  %1413 = or i64 %1412, %1408
  %1414 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 2
  %1415 = load i8, i8 addrspace(4)* %1414, align 1, !tbaa !11
  %1416 = zext i8 %1415 to i64
  %1417 = shl nuw nsw i64 %1416, 16
  %1418 = or i64 %1413, %1417
  %1419 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 3
  %1420 = load i8, i8 addrspace(4)* %1419, align 1, !tbaa !11
  %1421 = zext i8 %1420 to i64
  %1422 = shl nuw nsw i64 %1421, 24
  %1423 = or i64 %1418, %1422
  %1424 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 4
  %1425 = load i8, i8 addrspace(4)* %1424, align 1, !tbaa !11
  %1426 = zext i8 %1425 to i64
  %1427 = shl nuw nsw i64 %1426, 32
  %1428 = or i64 %1423, %1427
  %1429 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 5
  %1430 = load i8, i8 addrspace(4)* %1429, align 1, !tbaa !11
  %1431 = zext i8 %1430 to i64
  %1432 = shl nuw nsw i64 %1431, 40
  %1433 = or i64 %1428, %1432
  %1434 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 6
  %1435 = load i8, i8 addrspace(4)* %1434, align 1, !tbaa !11
  %1436 = zext i8 %1435 to i64
  %1437 = shl nuw nsw i64 %1436, 48
  %1438 = or i64 %1433, %1437
  %1439 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 7
  %1440 = load i8, i8 addrspace(4)* %1439, align 1, !tbaa !11
  %1441 = zext i8 %1440 to i64
  %1442 = shl nuw i64 %1441, 56
  %1443 = or i64 %1438, %1442
  br label %1457

1444:                                             ; preds = %1404, %1444
  %1445 = phi i32 [ %1455, %1444 ], [ 0, %1404 ]
  %1446 = phi i64 [ %1454, %1444 ], [ 0, %1404 ]
  %1447 = zext i32 %1445 to i64
  %1448 = getelementptr inbounds i8, i8 addrspace(4)* %1400, i64 %1447
  %1449 = load i8, i8 addrspace(4)* %1448, align 1, !tbaa !11
  %1450 = zext i8 %1449 to i64
  %1451 = shl i32 %1445, 3
  %1452 = zext i32 %1451 to i64
  %1453 = shl nuw i64 %1450, %1452
  %1454 = or i64 %1453, %1446
  %1455 = add nuw nsw i32 %1445, 1
  %1456 = icmp eq i32 %1455, %1401
  br i1 %1456, label %1457, label %1444

1457:                                             ; preds = %1444, %1406, %1404
  %1458 = phi i64 [ %1443, %1406 ], [ 0, %1404 ], [ %1454, %1444 ]
  %1459 = shl nuw nsw i64 %1040, 2
  %1460 = add nuw nsw i64 %1459, 28
  %1461 = and i64 %1460, 480
  %1462 = and i64 %1042, -225
  %1463 = or i64 %1462, %1461
  %1464 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1463, i64 noundef %1102, i64 noundef %1162, i64 noundef %1222, i64 noundef %1282, i64 noundef %1342, i64 noundef %1402, i64 noundef %1458) #11
  %1465 = sub i64 %1032, %1040
  %1466 = getelementptr inbounds i8, i8 addrspace(4)* %1033, i64 %1040
  %1467 = icmp eq i64 %1465, 0
  br i1 %1467, label %1468, label %1031

1468:                                             ; preds = %1457, %1023
  %1469 = phi <2 x i64> [ %1026, %1023 ], [ %1464, %1457 ]
  %1470 = extractelement <2 x i64> %1469, i64 0
  %1471 = and i64 %1470, -225
  %1472 = or i64 %1471, 32
  %1473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1472, i64 noundef %511, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1474 = extractelement <2 x i64> %1473, i64 0
  %1475 = and i64 %1474, -225
  %1476 = or i64 %1475, 32
  %1477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1476, i64 noundef %512, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1478 = extractelement <2 x i64> %1477, i64 0
  %1479 = zext i32 %1017 to i64
  %1480 = and i64 %1478, -227
  %1481 = or i64 %1480, 34
  %1482 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1481, i64 noundef %1479, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1484 = extractelement <2 x i64> %1483, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1485, label %1489

1485:                                             ; preds = %1468
  %1486 = and i64 %1484, -225
  %1487 = or i64 %1486, 32
  %1488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1487, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1930

1489:                                             ; preds = %1468
  %1490 = and i64 %1484, 2
  %1491 = and i64 %1484, -3
  %1492 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1491, i64 0
  br label %1493

1493:                                             ; preds = %1919, %1489
  %1494 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 28) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([29 x i8]* addrspacecast ([29 x i8] addrspace(4)* @.str.2 to [29 x i8]*) to i64)), i64 1))), %1489 ], [ %1927, %1919 ]
  %1495 = phi i8 addrspace(4)* [ getelementptr inbounds ([29 x i8], [29 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1489 ], [ %1928, %1919 ]
  %1496 = phi <2 x i64> [ %1492, %1489 ], [ %1926, %1919 ]
  %1497 = icmp ugt i64 %1494, 56
  %1498 = extractelement <2 x i64> %1496, i64 0
  %1499 = or i64 %1498, %1490
  %1500 = insertelement <2 x i64> poison, i64 %1499, i64 0
  %1501 = select i1 %1497, <2 x i64> %1496, <2 x i64> %1500
  %1502 = tail call i64 @llvm.umin.i64(i64 %1494, i64 56)
  %1503 = trunc i64 %1502 to i32
  %1504 = extractelement <2 x i64> %1501, i64 0
  %1505 = icmp ugt i32 %1503, 7
  br i1 %1505, label %1508, label %1506

1506:                                             ; preds = %1493
  %1507 = icmp eq i32 %1503, 0
  br i1 %1507, label %1561, label %1548

1508:                                             ; preds = %1493
  %1509 = load i8, i8 addrspace(4)* %1495, align 1, !tbaa !11
  %1510 = zext i8 %1509 to i64
  %1511 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 1
  %1512 = load i8, i8 addrspace(4)* %1511, align 1, !tbaa !11
  %1513 = zext i8 %1512 to i64
  %1514 = shl nuw nsw i64 %1513, 8
  %1515 = or i64 %1514, %1510
  %1516 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 2
  %1517 = load i8, i8 addrspace(4)* %1516, align 1, !tbaa !11
  %1518 = zext i8 %1517 to i64
  %1519 = shl nuw nsw i64 %1518, 16
  %1520 = or i64 %1515, %1519
  %1521 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 3
  %1522 = load i8, i8 addrspace(4)* %1521, align 1, !tbaa !11
  %1523 = zext i8 %1522 to i64
  %1524 = shl nuw nsw i64 %1523, 24
  %1525 = or i64 %1520, %1524
  %1526 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 4
  %1527 = load i8, i8 addrspace(4)* %1526, align 1, !tbaa !11
  %1528 = zext i8 %1527 to i64
  %1529 = shl nuw nsw i64 %1528, 32
  %1530 = or i64 %1525, %1529
  %1531 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 5
  %1532 = load i8, i8 addrspace(4)* %1531, align 1, !tbaa !11
  %1533 = zext i8 %1532 to i64
  %1534 = shl nuw nsw i64 %1533, 40
  %1535 = or i64 %1530, %1534
  %1536 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 6
  %1537 = load i8, i8 addrspace(4)* %1536, align 1, !tbaa !11
  %1538 = zext i8 %1537 to i64
  %1539 = shl nuw nsw i64 %1538, 48
  %1540 = or i64 %1535, %1539
  %1541 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 7
  %1542 = load i8, i8 addrspace(4)* %1541, align 1, !tbaa !11
  %1543 = zext i8 %1542 to i64
  %1544 = shl nuw i64 %1543, 56
  %1545 = or i64 %1540, %1544
  %1546 = add nsw i32 %1503, -8
  %1547 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 8
  br label %1561

1548:                                             ; preds = %1506, %1548
  %1549 = phi i32 [ %1559, %1548 ], [ 0, %1506 ]
  %1550 = phi i64 [ %1558, %1548 ], [ 0, %1506 ]
  %1551 = zext i32 %1549 to i64
  %1552 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 %1551
  %1553 = load i8, i8 addrspace(4)* %1552, align 1, !tbaa !11
  %1554 = zext i8 %1553 to i64
  %1555 = shl i32 %1549, 3
  %1556 = zext i32 %1555 to i64
  %1557 = shl nuw i64 %1554, %1556
  %1558 = or i64 %1557, %1550
  %1559 = add nuw nsw i32 %1549, 1
  %1560 = icmp eq i32 %1559, %1503
  br i1 %1560, label %1561, label %1548, !llvm.loop !12

1561:                                             ; preds = %1548, %1508, %1506
  %1562 = phi i8 addrspace(4)* [ %1547, %1508 ], [ %1495, %1506 ], [ %1495, %1548 ]
  %1563 = phi i32 [ %1546, %1508 ], [ 0, %1506 ], [ 0, %1548 ]
  %1564 = phi i64 [ %1545, %1508 ], [ 0, %1506 ], [ %1558, %1548 ]
  %1565 = icmp ugt i32 %1563, 7
  br i1 %1565, label %1568, label %1566

1566:                                             ; preds = %1561
  %1567 = icmp eq i32 %1563, 0
  br i1 %1567, label %1621, label %1608

1568:                                             ; preds = %1561
  %1569 = load i8, i8 addrspace(4)* %1562, align 1, !tbaa !11
  %1570 = zext i8 %1569 to i64
  %1571 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 1
  %1572 = load i8, i8 addrspace(4)* %1571, align 1, !tbaa !11
  %1573 = zext i8 %1572 to i64
  %1574 = shl nuw nsw i64 %1573, 8
  %1575 = or i64 %1574, %1570
  %1576 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 2
  %1577 = load i8, i8 addrspace(4)* %1576, align 1, !tbaa !11
  %1578 = zext i8 %1577 to i64
  %1579 = shl nuw nsw i64 %1578, 16
  %1580 = or i64 %1575, %1579
  %1581 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 3
  %1582 = load i8, i8 addrspace(4)* %1581, align 1, !tbaa !11
  %1583 = zext i8 %1582 to i64
  %1584 = shl nuw nsw i64 %1583, 24
  %1585 = or i64 %1580, %1584
  %1586 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 4
  %1587 = load i8, i8 addrspace(4)* %1586, align 1, !tbaa !11
  %1588 = zext i8 %1587 to i64
  %1589 = shl nuw nsw i64 %1588, 32
  %1590 = or i64 %1585, %1589
  %1591 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 5
  %1592 = load i8, i8 addrspace(4)* %1591, align 1, !tbaa !11
  %1593 = zext i8 %1592 to i64
  %1594 = shl nuw nsw i64 %1593, 40
  %1595 = or i64 %1590, %1594
  %1596 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 6
  %1597 = load i8, i8 addrspace(4)* %1596, align 1, !tbaa !11
  %1598 = zext i8 %1597 to i64
  %1599 = shl nuw nsw i64 %1598, 48
  %1600 = or i64 %1595, %1599
  %1601 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 7
  %1602 = load i8, i8 addrspace(4)* %1601, align 1, !tbaa !11
  %1603 = zext i8 %1602 to i64
  %1604 = shl nuw i64 %1603, 56
  %1605 = or i64 %1600, %1604
  %1606 = add nsw i32 %1563, -8
  %1607 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 8
  br label %1621

1608:                                             ; preds = %1566, %1608
  %1609 = phi i32 [ %1619, %1608 ], [ 0, %1566 ]
  %1610 = phi i64 [ %1618, %1608 ], [ 0, %1566 ]
  %1611 = zext i32 %1609 to i64
  %1612 = getelementptr inbounds i8, i8 addrspace(4)* %1562, i64 %1611
  %1613 = load i8, i8 addrspace(4)* %1612, align 1, !tbaa !11
  %1614 = zext i8 %1613 to i64
  %1615 = shl i32 %1609, 3
  %1616 = zext i32 %1615 to i64
  %1617 = shl nuw i64 %1614, %1616
  %1618 = or i64 %1617, %1610
  %1619 = add nuw nsw i32 %1609, 1
  %1620 = icmp eq i32 %1619, %1563
  br i1 %1620, label %1621, label %1608

1621:                                             ; preds = %1608, %1568, %1566
  %1622 = phi i8 addrspace(4)* [ %1607, %1568 ], [ %1562, %1566 ], [ %1562, %1608 ]
  %1623 = phi i32 [ %1606, %1568 ], [ 0, %1566 ], [ 0, %1608 ]
  %1624 = phi i64 [ %1605, %1568 ], [ 0, %1566 ], [ %1618, %1608 ]
  %1625 = icmp ugt i32 %1623, 7
  br i1 %1625, label %1628, label %1626

1626:                                             ; preds = %1621
  %1627 = icmp eq i32 %1623, 0
  br i1 %1627, label %1681, label %1668

1628:                                             ; preds = %1621
  %1629 = load i8, i8 addrspace(4)* %1622, align 1, !tbaa !11
  %1630 = zext i8 %1629 to i64
  %1631 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 1
  %1632 = load i8, i8 addrspace(4)* %1631, align 1, !tbaa !11
  %1633 = zext i8 %1632 to i64
  %1634 = shl nuw nsw i64 %1633, 8
  %1635 = or i64 %1634, %1630
  %1636 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 2
  %1637 = load i8, i8 addrspace(4)* %1636, align 1, !tbaa !11
  %1638 = zext i8 %1637 to i64
  %1639 = shl nuw nsw i64 %1638, 16
  %1640 = or i64 %1635, %1639
  %1641 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 3
  %1642 = load i8, i8 addrspace(4)* %1641, align 1, !tbaa !11
  %1643 = zext i8 %1642 to i64
  %1644 = shl nuw nsw i64 %1643, 24
  %1645 = or i64 %1640, %1644
  %1646 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 4
  %1647 = load i8, i8 addrspace(4)* %1646, align 1, !tbaa !11
  %1648 = zext i8 %1647 to i64
  %1649 = shl nuw nsw i64 %1648, 32
  %1650 = or i64 %1645, %1649
  %1651 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 5
  %1652 = load i8, i8 addrspace(4)* %1651, align 1, !tbaa !11
  %1653 = zext i8 %1652 to i64
  %1654 = shl nuw nsw i64 %1653, 40
  %1655 = or i64 %1650, %1654
  %1656 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 6
  %1657 = load i8, i8 addrspace(4)* %1656, align 1, !tbaa !11
  %1658 = zext i8 %1657 to i64
  %1659 = shl nuw nsw i64 %1658, 48
  %1660 = or i64 %1655, %1659
  %1661 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 7
  %1662 = load i8, i8 addrspace(4)* %1661, align 1, !tbaa !11
  %1663 = zext i8 %1662 to i64
  %1664 = shl nuw i64 %1663, 56
  %1665 = or i64 %1660, %1664
  %1666 = add nsw i32 %1623, -8
  %1667 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 8
  br label %1681

1668:                                             ; preds = %1626, %1668
  %1669 = phi i32 [ %1679, %1668 ], [ 0, %1626 ]
  %1670 = phi i64 [ %1678, %1668 ], [ 0, %1626 ]
  %1671 = zext i32 %1669 to i64
  %1672 = getelementptr inbounds i8, i8 addrspace(4)* %1622, i64 %1671
  %1673 = load i8, i8 addrspace(4)* %1672, align 1, !tbaa !11
  %1674 = zext i8 %1673 to i64
  %1675 = shl i32 %1669, 3
  %1676 = zext i32 %1675 to i64
  %1677 = shl nuw i64 %1674, %1676
  %1678 = or i64 %1677, %1670
  %1679 = add nuw nsw i32 %1669, 1
  %1680 = icmp eq i32 %1679, %1623
  br i1 %1680, label %1681, label %1668

1681:                                             ; preds = %1668, %1628, %1626
  %1682 = phi i8 addrspace(4)* [ %1667, %1628 ], [ %1622, %1626 ], [ %1622, %1668 ]
  %1683 = phi i32 [ %1666, %1628 ], [ 0, %1626 ], [ 0, %1668 ]
  %1684 = phi i64 [ %1665, %1628 ], [ 0, %1626 ], [ %1678, %1668 ]
  %1685 = icmp ugt i32 %1683, 7
  br i1 %1685, label %1688, label %1686

1686:                                             ; preds = %1681
  %1687 = icmp eq i32 %1683, 0
  br i1 %1687, label %1741, label %1728

1688:                                             ; preds = %1681
  %1689 = load i8, i8 addrspace(4)* %1682, align 1, !tbaa !11
  %1690 = zext i8 %1689 to i64
  %1691 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 1
  %1692 = load i8, i8 addrspace(4)* %1691, align 1, !tbaa !11
  %1693 = zext i8 %1692 to i64
  %1694 = shl nuw nsw i64 %1693, 8
  %1695 = or i64 %1694, %1690
  %1696 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 2
  %1697 = load i8, i8 addrspace(4)* %1696, align 1, !tbaa !11
  %1698 = zext i8 %1697 to i64
  %1699 = shl nuw nsw i64 %1698, 16
  %1700 = or i64 %1695, %1699
  %1701 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 3
  %1702 = load i8, i8 addrspace(4)* %1701, align 1, !tbaa !11
  %1703 = zext i8 %1702 to i64
  %1704 = shl nuw nsw i64 %1703, 24
  %1705 = or i64 %1700, %1704
  %1706 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 4
  %1707 = load i8, i8 addrspace(4)* %1706, align 1, !tbaa !11
  %1708 = zext i8 %1707 to i64
  %1709 = shl nuw nsw i64 %1708, 32
  %1710 = or i64 %1705, %1709
  %1711 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 5
  %1712 = load i8, i8 addrspace(4)* %1711, align 1, !tbaa !11
  %1713 = zext i8 %1712 to i64
  %1714 = shl nuw nsw i64 %1713, 40
  %1715 = or i64 %1710, %1714
  %1716 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 6
  %1717 = load i8, i8 addrspace(4)* %1716, align 1, !tbaa !11
  %1718 = zext i8 %1717 to i64
  %1719 = shl nuw nsw i64 %1718, 48
  %1720 = or i64 %1715, %1719
  %1721 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 7
  %1722 = load i8, i8 addrspace(4)* %1721, align 1, !tbaa !11
  %1723 = zext i8 %1722 to i64
  %1724 = shl nuw i64 %1723, 56
  %1725 = or i64 %1720, %1724
  %1726 = add nsw i32 %1683, -8
  %1727 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 8
  br label %1741

1728:                                             ; preds = %1686, %1728
  %1729 = phi i32 [ %1739, %1728 ], [ 0, %1686 ]
  %1730 = phi i64 [ %1738, %1728 ], [ 0, %1686 ]
  %1731 = zext i32 %1729 to i64
  %1732 = getelementptr inbounds i8, i8 addrspace(4)* %1682, i64 %1731
  %1733 = load i8, i8 addrspace(4)* %1732, align 1, !tbaa !11
  %1734 = zext i8 %1733 to i64
  %1735 = shl i32 %1729, 3
  %1736 = zext i32 %1735 to i64
  %1737 = shl nuw i64 %1734, %1736
  %1738 = or i64 %1737, %1730
  %1739 = add nuw nsw i32 %1729, 1
  %1740 = icmp eq i32 %1739, %1683
  br i1 %1740, label %1741, label %1728

1741:                                             ; preds = %1728, %1688, %1686
  %1742 = phi i8 addrspace(4)* [ %1727, %1688 ], [ %1682, %1686 ], [ %1682, %1728 ]
  %1743 = phi i32 [ %1726, %1688 ], [ 0, %1686 ], [ 0, %1728 ]
  %1744 = phi i64 [ %1725, %1688 ], [ 0, %1686 ], [ %1738, %1728 ]
  %1745 = icmp ugt i32 %1743, 7
  br i1 %1745, label %1748, label %1746

1746:                                             ; preds = %1741
  %1747 = icmp eq i32 %1743, 0
  br i1 %1747, label %1801, label %1788

1748:                                             ; preds = %1741
  %1749 = load i8, i8 addrspace(4)* %1742, align 1, !tbaa !11
  %1750 = zext i8 %1749 to i64
  %1751 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 1
  %1752 = load i8, i8 addrspace(4)* %1751, align 1, !tbaa !11
  %1753 = zext i8 %1752 to i64
  %1754 = shl nuw nsw i64 %1753, 8
  %1755 = or i64 %1754, %1750
  %1756 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 2
  %1757 = load i8, i8 addrspace(4)* %1756, align 1, !tbaa !11
  %1758 = zext i8 %1757 to i64
  %1759 = shl nuw nsw i64 %1758, 16
  %1760 = or i64 %1755, %1759
  %1761 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 3
  %1762 = load i8, i8 addrspace(4)* %1761, align 1, !tbaa !11
  %1763 = zext i8 %1762 to i64
  %1764 = shl nuw nsw i64 %1763, 24
  %1765 = or i64 %1760, %1764
  %1766 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 4
  %1767 = load i8, i8 addrspace(4)* %1766, align 1, !tbaa !11
  %1768 = zext i8 %1767 to i64
  %1769 = shl nuw nsw i64 %1768, 32
  %1770 = or i64 %1765, %1769
  %1771 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 5
  %1772 = load i8, i8 addrspace(4)* %1771, align 1, !tbaa !11
  %1773 = zext i8 %1772 to i64
  %1774 = shl nuw nsw i64 %1773, 40
  %1775 = or i64 %1770, %1774
  %1776 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 6
  %1777 = load i8, i8 addrspace(4)* %1776, align 1, !tbaa !11
  %1778 = zext i8 %1777 to i64
  %1779 = shl nuw nsw i64 %1778, 48
  %1780 = or i64 %1775, %1779
  %1781 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 7
  %1782 = load i8, i8 addrspace(4)* %1781, align 1, !tbaa !11
  %1783 = zext i8 %1782 to i64
  %1784 = shl nuw i64 %1783, 56
  %1785 = or i64 %1780, %1784
  %1786 = add nsw i32 %1743, -8
  %1787 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 8
  br label %1801

1788:                                             ; preds = %1746, %1788
  %1789 = phi i32 [ %1799, %1788 ], [ 0, %1746 ]
  %1790 = phi i64 [ %1798, %1788 ], [ 0, %1746 ]
  %1791 = zext i32 %1789 to i64
  %1792 = getelementptr inbounds i8, i8 addrspace(4)* %1742, i64 %1791
  %1793 = load i8, i8 addrspace(4)* %1792, align 1, !tbaa !11
  %1794 = zext i8 %1793 to i64
  %1795 = shl i32 %1789, 3
  %1796 = zext i32 %1795 to i64
  %1797 = shl nuw i64 %1794, %1796
  %1798 = or i64 %1797, %1790
  %1799 = add nuw nsw i32 %1789, 1
  %1800 = icmp eq i32 %1799, %1743
  br i1 %1800, label %1801, label %1788

1801:                                             ; preds = %1788, %1748, %1746
  %1802 = phi i8 addrspace(4)* [ %1787, %1748 ], [ %1742, %1746 ], [ %1742, %1788 ]
  %1803 = phi i32 [ %1786, %1748 ], [ 0, %1746 ], [ 0, %1788 ]
  %1804 = phi i64 [ %1785, %1748 ], [ 0, %1746 ], [ %1798, %1788 ]
  %1805 = icmp ugt i32 %1803, 7
  br i1 %1805, label %1808, label %1806

1806:                                             ; preds = %1801
  %1807 = icmp eq i32 %1803, 0
  br i1 %1807, label %1861, label %1848

1808:                                             ; preds = %1801
  %1809 = load i8, i8 addrspace(4)* %1802, align 1, !tbaa !11
  %1810 = zext i8 %1809 to i64
  %1811 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 1
  %1812 = load i8, i8 addrspace(4)* %1811, align 1, !tbaa !11
  %1813 = zext i8 %1812 to i64
  %1814 = shl nuw nsw i64 %1813, 8
  %1815 = or i64 %1814, %1810
  %1816 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 2
  %1817 = load i8, i8 addrspace(4)* %1816, align 1, !tbaa !11
  %1818 = zext i8 %1817 to i64
  %1819 = shl nuw nsw i64 %1818, 16
  %1820 = or i64 %1815, %1819
  %1821 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 3
  %1822 = load i8, i8 addrspace(4)* %1821, align 1, !tbaa !11
  %1823 = zext i8 %1822 to i64
  %1824 = shl nuw nsw i64 %1823, 24
  %1825 = or i64 %1820, %1824
  %1826 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 4
  %1827 = load i8, i8 addrspace(4)* %1826, align 1, !tbaa !11
  %1828 = zext i8 %1827 to i64
  %1829 = shl nuw nsw i64 %1828, 32
  %1830 = or i64 %1825, %1829
  %1831 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 5
  %1832 = load i8, i8 addrspace(4)* %1831, align 1, !tbaa !11
  %1833 = zext i8 %1832 to i64
  %1834 = shl nuw nsw i64 %1833, 40
  %1835 = or i64 %1830, %1834
  %1836 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 6
  %1837 = load i8, i8 addrspace(4)* %1836, align 1, !tbaa !11
  %1838 = zext i8 %1837 to i64
  %1839 = shl nuw nsw i64 %1838, 48
  %1840 = or i64 %1835, %1839
  %1841 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 7
  %1842 = load i8, i8 addrspace(4)* %1841, align 1, !tbaa !11
  %1843 = zext i8 %1842 to i64
  %1844 = shl nuw i64 %1843, 56
  %1845 = or i64 %1840, %1844
  %1846 = add nsw i32 %1803, -8
  %1847 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 8
  br label %1861

1848:                                             ; preds = %1806, %1848
  %1849 = phi i32 [ %1859, %1848 ], [ 0, %1806 ]
  %1850 = phi i64 [ %1858, %1848 ], [ 0, %1806 ]
  %1851 = zext i32 %1849 to i64
  %1852 = getelementptr inbounds i8, i8 addrspace(4)* %1802, i64 %1851
  %1853 = load i8, i8 addrspace(4)* %1852, align 1, !tbaa !11
  %1854 = zext i8 %1853 to i64
  %1855 = shl i32 %1849, 3
  %1856 = zext i32 %1855 to i64
  %1857 = shl nuw i64 %1854, %1856
  %1858 = or i64 %1857, %1850
  %1859 = add nuw nsw i32 %1849, 1
  %1860 = icmp eq i32 %1859, %1803
  br i1 %1860, label %1861, label %1848

1861:                                             ; preds = %1848, %1808, %1806
  %1862 = phi i8 addrspace(4)* [ %1847, %1808 ], [ %1802, %1806 ], [ %1802, %1848 ]
  %1863 = phi i32 [ %1846, %1808 ], [ 0, %1806 ], [ 0, %1848 ]
  %1864 = phi i64 [ %1845, %1808 ], [ 0, %1806 ], [ %1858, %1848 ]
  %1865 = icmp ugt i32 %1863, 7
  br i1 %1865, label %1868, label %1866

1866:                                             ; preds = %1861
  %1867 = icmp eq i32 %1863, 0
  br i1 %1867, label %1919, label %1906

1868:                                             ; preds = %1861
  %1869 = load i8, i8 addrspace(4)* %1862, align 1, !tbaa !11
  %1870 = zext i8 %1869 to i64
  %1871 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 1
  %1872 = load i8, i8 addrspace(4)* %1871, align 1, !tbaa !11
  %1873 = zext i8 %1872 to i64
  %1874 = shl nuw nsw i64 %1873, 8
  %1875 = or i64 %1874, %1870
  %1876 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 2
  %1877 = load i8, i8 addrspace(4)* %1876, align 1, !tbaa !11
  %1878 = zext i8 %1877 to i64
  %1879 = shl nuw nsw i64 %1878, 16
  %1880 = or i64 %1875, %1879
  %1881 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 3
  %1882 = load i8, i8 addrspace(4)* %1881, align 1, !tbaa !11
  %1883 = zext i8 %1882 to i64
  %1884 = shl nuw nsw i64 %1883, 24
  %1885 = or i64 %1880, %1884
  %1886 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 4
  %1887 = load i8, i8 addrspace(4)* %1886, align 1, !tbaa !11
  %1888 = zext i8 %1887 to i64
  %1889 = shl nuw nsw i64 %1888, 32
  %1890 = or i64 %1885, %1889
  %1891 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 5
  %1892 = load i8, i8 addrspace(4)* %1891, align 1, !tbaa !11
  %1893 = zext i8 %1892 to i64
  %1894 = shl nuw nsw i64 %1893, 40
  %1895 = or i64 %1890, %1894
  %1896 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 6
  %1897 = load i8, i8 addrspace(4)* %1896, align 1, !tbaa !11
  %1898 = zext i8 %1897 to i64
  %1899 = shl nuw nsw i64 %1898, 48
  %1900 = or i64 %1895, %1899
  %1901 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 7
  %1902 = load i8, i8 addrspace(4)* %1901, align 1, !tbaa !11
  %1903 = zext i8 %1902 to i64
  %1904 = shl nuw i64 %1903, 56
  %1905 = or i64 %1900, %1904
  br label %1919

1906:                                             ; preds = %1866, %1906
  %1907 = phi i32 [ %1917, %1906 ], [ 0, %1866 ]
  %1908 = phi i64 [ %1916, %1906 ], [ 0, %1866 ]
  %1909 = zext i32 %1907 to i64
  %1910 = getelementptr inbounds i8, i8 addrspace(4)* %1862, i64 %1909
  %1911 = load i8, i8 addrspace(4)* %1910, align 1, !tbaa !11
  %1912 = zext i8 %1911 to i64
  %1913 = shl i32 %1907, 3
  %1914 = zext i32 %1913 to i64
  %1915 = shl nuw i64 %1912, %1914
  %1916 = or i64 %1915, %1908
  %1917 = add nuw nsw i32 %1907, 1
  %1918 = icmp eq i32 %1917, %1863
  br i1 %1918, label %1919, label %1906

1919:                                             ; preds = %1906, %1868, %1866
  %1920 = phi i64 [ %1905, %1868 ], [ 0, %1866 ], [ %1916, %1906 ]
  %1921 = shl nuw nsw i64 %1502, 2
  %1922 = add nuw nsw i64 %1921, 28
  %1923 = and i64 %1922, 480
  %1924 = and i64 %1504, -225
  %1925 = or i64 %1924, %1923
  %1926 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1925, i64 noundef %1564, i64 noundef %1624, i64 noundef %1684, i64 noundef %1744, i64 noundef %1804, i64 noundef %1864, i64 noundef %1920) #11
  %1927 = sub i64 %1494, %1502
  %1928 = getelementptr inbounds i8, i8 addrspace(4)* %1495, i64 %1502
  %1929 = icmp eq i64 %1927, 0
  br i1 %1929, label %1930, label %1493

1930:                                             ; preds = %1919, %1485
  %1931 = phi <2 x i64> [ %1488, %1485 ], [ %1926, %1919 ]
  %1932 = extractelement <2 x i64> %1931, i64 0
  %1933 = and i64 %1932, -225
  %1934 = or i64 %1933, 32
  %1935 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1934, i64 noundef %511, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1936 = extractelement <2 x i64> %1935, i64 0
  %1937 = zext i32 %1013 to i64
  %1938 = and i64 %1936, -225
  %1939 = or i64 %1938, 32
  %1940 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1939, i64 noundef %1937, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1941 = extractelement <2 x i64> %1940, i64 0
  %1942 = zext i32 %1012 to i64
  %1943 = and i64 %1941, -227
  %1944 = or i64 %1943, 34
  %1945 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1020, i64 noundef %1944, i64 noundef %1942, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1946 = sub nsw i32 %12, %541
  %1947 = sext i32 %1946 to i64
  %1948 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %1947
  %1949 = load i32, i32 addrspace(1)* %1948, align 4, !tbaa !14
  %1950 = load i32, i32 addrspace(1)* %510, align 4, !tbaa !14
  %1951 = add nsw i32 %1950, %1949
  store i32 %1951, i32 addrspace(1)* %510, align 4, !tbaa !14
  store i32 %1012, i32 addrspace(1)* %1948, align 4, !tbaa !14
  br label %1952

1952:                                             ; preds = %1930, %1008, %1005
  br i1 %20, label %1953, label %2403

1953:                                             ; preds = %1952
  %1954 = load i64, i64 addrspace(4)* %506, align 8, !tbaa !7
  %1955 = inttoptr i64 %1954 to i8 addrspace(1)*
  %1956 = addrspacecast i8 addrspace(1)* %1955 to i8*
  %1957 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1956, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1958 = extractelement <2 x i64> %1957, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1959, label %1963

1959:                                             ; preds = %1953
  %1960 = and i64 %1958, -227
  %1961 = or i64 %1960, 34
  %1962 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1956, i64 noundef %1961, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %2403

1963:                                             ; preds = %1953
  %1964 = and i64 %1958, -3
  %1965 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1964, i64 0
  br label %1966

1966:                                             ; preds = %2392, %1963
  %1967 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.3, i64 0, i64 1) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([2 x i8]* addrspacecast ([2 x i8] addrspace(4)* @.str.3 to [2 x i8]*) to i64)), i64 1))), %1963 ], [ %2400, %2392 ]
  %1968 = phi i8 addrspace(4)* [ getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1963 ], [ %2401, %2392 ]
  %1969 = phi <2 x i64> [ %1965, %1963 ], [ %2399, %2392 ]
  %1970 = icmp ugt i64 %1967, 56
  %1971 = extractelement <2 x i64> %1969, i64 0
  %1972 = or i64 %1971, 2
  %1973 = insertelement <2 x i64> poison, i64 %1972, i64 0
  %1974 = select i1 %1970, <2 x i64> %1969, <2 x i64> %1973
  %1975 = tail call i64 @llvm.umin.i64(i64 %1967, i64 56)
  %1976 = trunc i64 %1975 to i32
  %1977 = extractelement <2 x i64> %1974, i64 0
  %1978 = icmp ugt i32 %1976, 7
  br i1 %1978, label %1981, label %1979

1979:                                             ; preds = %1966
  %1980 = icmp eq i32 %1976, 0
  br i1 %1980, label %2034, label %2021

1981:                                             ; preds = %1966
  %1982 = load i8, i8 addrspace(4)* %1968, align 1, !tbaa !11
  %1983 = zext i8 %1982 to i64
  %1984 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 1
  %1985 = load i8, i8 addrspace(4)* %1984, align 1, !tbaa !11
  %1986 = zext i8 %1985 to i64
  %1987 = shl nuw nsw i64 %1986, 8
  %1988 = or i64 %1987, %1983
  %1989 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 2
  %1990 = load i8, i8 addrspace(4)* %1989, align 1, !tbaa !11
  %1991 = zext i8 %1990 to i64
  %1992 = shl nuw nsw i64 %1991, 16
  %1993 = or i64 %1988, %1992
  %1994 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 3
  %1995 = load i8, i8 addrspace(4)* %1994, align 1, !tbaa !11
  %1996 = zext i8 %1995 to i64
  %1997 = shl nuw nsw i64 %1996, 24
  %1998 = or i64 %1993, %1997
  %1999 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 4
  %2000 = load i8, i8 addrspace(4)* %1999, align 1, !tbaa !11
  %2001 = zext i8 %2000 to i64
  %2002 = shl nuw nsw i64 %2001, 32
  %2003 = or i64 %1998, %2002
  %2004 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 5
  %2005 = load i8, i8 addrspace(4)* %2004, align 1, !tbaa !11
  %2006 = zext i8 %2005 to i64
  %2007 = shl nuw nsw i64 %2006, 40
  %2008 = or i64 %2003, %2007
  %2009 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 6
  %2010 = load i8, i8 addrspace(4)* %2009, align 1, !tbaa !11
  %2011 = zext i8 %2010 to i64
  %2012 = shl nuw nsw i64 %2011, 48
  %2013 = or i64 %2008, %2012
  %2014 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 7
  %2015 = load i8, i8 addrspace(4)* %2014, align 1, !tbaa !11
  %2016 = zext i8 %2015 to i64
  %2017 = shl nuw i64 %2016, 56
  %2018 = or i64 %2013, %2017
  %2019 = add nsw i32 %1976, -8
  %2020 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 8
  br label %2034

2021:                                             ; preds = %1979, %2021
  %2022 = phi i32 [ %2032, %2021 ], [ 0, %1979 ]
  %2023 = phi i64 [ %2031, %2021 ], [ 0, %1979 ]
  %2024 = zext i32 %2022 to i64
  %2025 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 %2024
  %2026 = load i8, i8 addrspace(4)* %2025, align 1, !tbaa !11
  %2027 = zext i8 %2026 to i64
  %2028 = shl i32 %2022, 3
  %2029 = zext i32 %2028 to i64
  %2030 = shl nuw i64 %2027, %2029
  %2031 = or i64 %2030, %2023
  %2032 = add nuw nsw i32 %2022, 1
  %2033 = icmp eq i32 %2032, %1976
  br i1 %2033, label %2034, label %2021, !llvm.loop !12

2034:                                             ; preds = %2021, %1981, %1979
  %2035 = phi i8 addrspace(4)* [ %2020, %1981 ], [ %1968, %1979 ], [ %1968, %2021 ]
  %2036 = phi i32 [ %2019, %1981 ], [ 0, %1979 ], [ 0, %2021 ]
  %2037 = phi i64 [ %2018, %1981 ], [ 0, %1979 ], [ %2031, %2021 ]
  %2038 = icmp ugt i32 %2036, 7
  br i1 %2038, label %2041, label %2039

2039:                                             ; preds = %2034
  %2040 = icmp eq i32 %2036, 0
  br i1 %2040, label %2094, label %2081

2041:                                             ; preds = %2034
  %2042 = load i8, i8 addrspace(4)* %2035, align 1, !tbaa !11
  %2043 = zext i8 %2042 to i64
  %2044 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 1
  %2045 = load i8, i8 addrspace(4)* %2044, align 1, !tbaa !11
  %2046 = zext i8 %2045 to i64
  %2047 = shl nuw nsw i64 %2046, 8
  %2048 = or i64 %2047, %2043
  %2049 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 2
  %2050 = load i8, i8 addrspace(4)* %2049, align 1, !tbaa !11
  %2051 = zext i8 %2050 to i64
  %2052 = shl nuw nsw i64 %2051, 16
  %2053 = or i64 %2048, %2052
  %2054 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 3
  %2055 = load i8, i8 addrspace(4)* %2054, align 1, !tbaa !11
  %2056 = zext i8 %2055 to i64
  %2057 = shl nuw nsw i64 %2056, 24
  %2058 = or i64 %2053, %2057
  %2059 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 4
  %2060 = load i8, i8 addrspace(4)* %2059, align 1, !tbaa !11
  %2061 = zext i8 %2060 to i64
  %2062 = shl nuw nsw i64 %2061, 32
  %2063 = or i64 %2058, %2062
  %2064 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 5
  %2065 = load i8, i8 addrspace(4)* %2064, align 1, !tbaa !11
  %2066 = zext i8 %2065 to i64
  %2067 = shl nuw nsw i64 %2066, 40
  %2068 = or i64 %2063, %2067
  %2069 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 6
  %2070 = load i8, i8 addrspace(4)* %2069, align 1, !tbaa !11
  %2071 = zext i8 %2070 to i64
  %2072 = shl nuw nsw i64 %2071, 48
  %2073 = or i64 %2068, %2072
  %2074 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 7
  %2075 = load i8, i8 addrspace(4)* %2074, align 1, !tbaa !11
  %2076 = zext i8 %2075 to i64
  %2077 = shl nuw i64 %2076, 56
  %2078 = or i64 %2073, %2077
  %2079 = add nsw i32 %2036, -8
  %2080 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 8
  br label %2094

2081:                                             ; preds = %2039, %2081
  %2082 = phi i32 [ %2092, %2081 ], [ 0, %2039 ]
  %2083 = phi i64 [ %2091, %2081 ], [ 0, %2039 ]
  %2084 = zext i32 %2082 to i64
  %2085 = getelementptr inbounds i8, i8 addrspace(4)* %2035, i64 %2084
  %2086 = load i8, i8 addrspace(4)* %2085, align 1, !tbaa !11
  %2087 = zext i8 %2086 to i64
  %2088 = shl i32 %2082, 3
  %2089 = zext i32 %2088 to i64
  %2090 = shl nuw i64 %2087, %2089
  %2091 = or i64 %2090, %2083
  %2092 = add nuw nsw i32 %2082, 1
  %2093 = icmp eq i32 %2092, %2036
  br i1 %2093, label %2094, label %2081

2094:                                             ; preds = %2081, %2041, %2039
  %2095 = phi i8 addrspace(4)* [ %2080, %2041 ], [ %2035, %2039 ], [ %2035, %2081 ]
  %2096 = phi i32 [ %2079, %2041 ], [ 0, %2039 ], [ 0, %2081 ]
  %2097 = phi i64 [ %2078, %2041 ], [ 0, %2039 ], [ %2091, %2081 ]
  %2098 = icmp ugt i32 %2096, 7
  br i1 %2098, label %2101, label %2099

2099:                                             ; preds = %2094
  %2100 = icmp eq i32 %2096, 0
  br i1 %2100, label %2154, label %2141

2101:                                             ; preds = %2094
  %2102 = load i8, i8 addrspace(4)* %2095, align 1, !tbaa !11
  %2103 = zext i8 %2102 to i64
  %2104 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 1
  %2105 = load i8, i8 addrspace(4)* %2104, align 1, !tbaa !11
  %2106 = zext i8 %2105 to i64
  %2107 = shl nuw nsw i64 %2106, 8
  %2108 = or i64 %2107, %2103
  %2109 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 2
  %2110 = load i8, i8 addrspace(4)* %2109, align 1, !tbaa !11
  %2111 = zext i8 %2110 to i64
  %2112 = shl nuw nsw i64 %2111, 16
  %2113 = or i64 %2108, %2112
  %2114 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 3
  %2115 = load i8, i8 addrspace(4)* %2114, align 1, !tbaa !11
  %2116 = zext i8 %2115 to i64
  %2117 = shl nuw nsw i64 %2116, 24
  %2118 = or i64 %2113, %2117
  %2119 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 4
  %2120 = load i8, i8 addrspace(4)* %2119, align 1, !tbaa !11
  %2121 = zext i8 %2120 to i64
  %2122 = shl nuw nsw i64 %2121, 32
  %2123 = or i64 %2118, %2122
  %2124 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 5
  %2125 = load i8, i8 addrspace(4)* %2124, align 1, !tbaa !11
  %2126 = zext i8 %2125 to i64
  %2127 = shl nuw nsw i64 %2126, 40
  %2128 = or i64 %2123, %2127
  %2129 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 6
  %2130 = load i8, i8 addrspace(4)* %2129, align 1, !tbaa !11
  %2131 = zext i8 %2130 to i64
  %2132 = shl nuw nsw i64 %2131, 48
  %2133 = or i64 %2128, %2132
  %2134 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 7
  %2135 = load i8, i8 addrspace(4)* %2134, align 1, !tbaa !11
  %2136 = zext i8 %2135 to i64
  %2137 = shl nuw i64 %2136, 56
  %2138 = or i64 %2133, %2137
  %2139 = add nsw i32 %2096, -8
  %2140 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 8
  br label %2154

2141:                                             ; preds = %2099, %2141
  %2142 = phi i32 [ %2152, %2141 ], [ 0, %2099 ]
  %2143 = phi i64 [ %2151, %2141 ], [ 0, %2099 ]
  %2144 = zext i32 %2142 to i64
  %2145 = getelementptr inbounds i8, i8 addrspace(4)* %2095, i64 %2144
  %2146 = load i8, i8 addrspace(4)* %2145, align 1, !tbaa !11
  %2147 = zext i8 %2146 to i64
  %2148 = shl i32 %2142, 3
  %2149 = zext i32 %2148 to i64
  %2150 = shl nuw i64 %2147, %2149
  %2151 = or i64 %2150, %2143
  %2152 = add nuw nsw i32 %2142, 1
  %2153 = icmp eq i32 %2152, %2096
  br i1 %2153, label %2154, label %2141

2154:                                             ; preds = %2141, %2101, %2099
  %2155 = phi i8 addrspace(4)* [ %2140, %2101 ], [ %2095, %2099 ], [ %2095, %2141 ]
  %2156 = phi i32 [ %2139, %2101 ], [ 0, %2099 ], [ 0, %2141 ]
  %2157 = phi i64 [ %2138, %2101 ], [ 0, %2099 ], [ %2151, %2141 ]
  %2158 = icmp ugt i32 %2156, 7
  br i1 %2158, label %2161, label %2159

2159:                                             ; preds = %2154
  %2160 = icmp eq i32 %2156, 0
  br i1 %2160, label %2214, label %2201

2161:                                             ; preds = %2154
  %2162 = load i8, i8 addrspace(4)* %2155, align 1, !tbaa !11
  %2163 = zext i8 %2162 to i64
  %2164 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 1
  %2165 = load i8, i8 addrspace(4)* %2164, align 1, !tbaa !11
  %2166 = zext i8 %2165 to i64
  %2167 = shl nuw nsw i64 %2166, 8
  %2168 = or i64 %2167, %2163
  %2169 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 2
  %2170 = load i8, i8 addrspace(4)* %2169, align 1, !tbaa !11
  %2171 = zext i8 %2170 to i64
  %2172 = shl nuw nsw i64 %2171, 16
  %2173 = or i64 %2168, %2172
  %2174 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 3
  %2175 = load i8, i8 addrspace(4)* %2174, align 1, !tbaa !11
  %2176 = zext i8 %2175 to i64
  %2177 = shl nuw nsw i64 %2176, 24
  %2178 = or i64 %2173, %2177
  %2179 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 4
  %2180 = load i8, i8 addrspace(4)* %2179, align 1, !tbaa !11
  %2181 = zext i8 %2180 to i64
  %2182 = shl nuw nsw i64 %2181, 32
  %2183 = or i64 %2178, %2182
  %2184 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 5
  %2185 = load i8, i8 addrspace(4)* %2184, align 1, !tbaa !11
  %2186 = zext i8 %2185 to i64
  %2187 = shl nuw nsw i64 %2186, 40
  %2188 = or i64 %2183, %2187
  %2189 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 6
  %2190 = load i8, i8 addrspace(4)* %2189, align 1, !tbaa !11
  %2191 = zext i8 %2190 to i64
  %2192 = shl nuw nsw i64 %2191, 48
  %2193 = or i64 %2188, %2192
  %2194 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 7
  %2195 = load i8, i8 addrspace(4)* %2194, align 1, !tbaa !11
  %2196 = zext i8 %2195 to i64
  %2197 = shl nuw i64 %2196, 56
  %2198 = or i64 %2193, %2197
  %2199 = add nsw i32 %2156, -8
  %2200 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 8
  br label %2214

2201:                                             ; preds = %2159, %2201
  %2202 = phi i32 [ %2212, %2201 ], [ 0, %2159 ]
  %2203 = phi i64 [ %2211, %2201 ], [ 0, %2159 ]
  %2204 = zext i32 %2202 to i64
  %2205 = getelementptr inbounds i8, i8 addrspace(4)* %2155, i64 %2204
  %2206 = load i8, i8 addrspace(4)* %2205, align 1, !tbaa !11
  %2207 = zext i8 %2206 to i64
  %2208 = shl i32 %2202, 3
  %2209 = zext i32 %2208 to i64
  %2210 = shl nuw i64 %2207, %2209
  %2211 = or i64 %2210, %2203
  %2212 = add nuw nsw i32 %2202, 1
  %2213 = icmp eq i32 %2212, %2156
  br i1 %2213, label %2214, label %2201

2214:                                             ; preds = %2201, %2161, %2159
  %2215 = phi i8 addrspace(4)* [ %2200, %2161 ], [ %2155, %2159 ], [ %2155, %2201 ]
  %2216 = phi i32 [ %2199, %2161 ], [ 0, %2159 ], [ 0, %2201 ]
  %2217 = phi i64 [ %2198, %2161 ], [ 0, %2159 ], [ %2211, %2201 ]
  %2218 = icmp ugt i32 %2216, 7
  br i1 %2218, label %2221, label %2219

2219:                                             ; preds = %2214
  %2220 = icmp eq i32 %2216, 0
  br i1 %2220, label %2274, label %2261

2221:                                             ; preds = %2214
  %2222 = load i8, i8 addrspace(4)* %2215, align 1, !tbaa !11
  %2223 = zext i8 %2222 to i64
  %2224 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 1
  %2225 = load i8, i8 addrspace(4)* %2224, align 1, !tbaa !11
  %2226 = zext i8 %2225 to i64
  %2227 = shl nuw nsw i64 %2226, 8
  %2228 = or i64 %2227, %2223
  %2229 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 2
  %2230 = load i8, i8 addrspace(4)* %2229, align 1, !tbaa !11
  %2231 = zext i8 %2230 to i64
  %2232 = shl nuw nsw i64 %2231, 16
  %2233 = or i64 %2228, %2232
  %2234 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 3
  %2235 = load i8, i8 addrspace(4)* %2234, align 1, !tbaa !11
  %2236 = zext i8 %2235 to i64
  %2237 = shl nuw nsw i64 %2236, 24
  %2238 = or i64 %2233, %2237
  %2239 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 4
  %2240 = load i8, i8 addrspace(4)* %2239, align 1, !tbaa !11
  %2241 = zext i8 %2240 to i64
  %2242 = shl nuw nsw i64 %2241, 32
  %2243 = or i64 %2238, %2242
  %2244 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 5
  %2245 = load i8, i8 addrspace(4)* %2244, align 1, !tbaa !11
  %2246 = zext i8 %2245 to i64
  %2247 = shl nuw nsw i64 %2246, 40
  %2248 = or i64 %2243, %2247
  %2249 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 6
  %2250 = load i8, i8 addrspace(4)* %2249, align 1, !tbaa !11
  %2251 = zext i8 %2250 to i64
  %2252 = shl nuw nsw i64 %2251, 48
  %2253 = or i64 %2248, %2252
  %2254 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 7
  %2255 = load i8, i8 addrspace(4)* %2254, align 1, !tbaa !11
  %2256 = zext i8 %2255 to i64
  %2257 = shl nuw i64 %2256, 56
  %2258 = or i64 %2253, %2257
  %2259 = add nsw i32 %2216, -8
  %2260 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 8
  br label %2274

2261:                                             ; preds = %2219, %2261
  %2262 = phi i32 [ %2272, %2261 ], [ 0, %2219 ]
  %2263 = phi i64 [ %2271, %2261 ], [ 0, %2219 ]
  %2264 = zext i32 %2262 to i64
  %2265 = getelementptr inbounds i8, i8 addrspace(4)* %2215, i64 %2264
  %2266 = load i8, i8 addrspace(4)* %2265, align 1, !tbaa !11
  %2267 = zext i8 %2266 to i64
  %2268 = shl i32 %2262, 3
  %2269 = zext i32 %2268 to i64
  %2270 = shl nuw i64 %2267, %2269
  %2271 = or i64 %2270, %2263
  %2272 = add nuw nsw i32 %2262, 1
  %2273 = icmp eq i32 %2272, %2216
  br i1 %2273, label %2274, label %2261

2274:                                             ; preds = %2261, %2221, %2219
  %2275 = phi i8 addrspace(4)* [ %2260, %2221 ], [ %2215, %2219 ], [ %2215, %2261 ]
  %2276 = phi i32 [ %2259, %2221 ], [ 0, %2219 ], [ 0, %2261 ]
  %2277 = phi i64 [ %2258, %2221 ], [ 0, %2219 ], [ %2271, %2261 ]
  %2278 = icmp ugt i32 %2276, 7
  br i1 %2278, label %2281, label %2279

2279:                                             ; preds = %2274
  %2280 = icmp eq i32 %2276, 0
  br i1 %2280, label %2334, label %2321

2281:                                             ; preds = %2274
  %2282 = load i8, i8 addrspace(4)* %2275, align 1, !tbaa !11
  %2283 = zext i8 %2282 to i64
  %2284 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 1
  %2285 = load i8, i8 addrspace(4)* %2284, align 1, !tbaa !11
  %2286 = zext i8 %2285 to i64
  %2287 = shl nuw nsw i64 %2286, 8
  %2288 = or i64 %2287, %2283
  %2289 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 2
  %2290 = load i8, i8 addrspace(4)* %2289, align 1, !tbaa !11
  %2291 = zext i8 %2290 to i64
  %2292 = shl nuw nsw i64 %2291, 16
  %2293 = or i64 %2288, %2292
  %2294 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 3
  %2295 = load i8, i8 addrspace(4)* %2294, align 1, !tbaa !11
  %2296 = zext i8 %2295 to i64
  %2297 = shl nuw nsw i64 %2296, 24
  %2298 = or i64 %2293, %2297
  %2299 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 4
  %2300 = load i8, i8 addrspace(4)* %2299, align 1, !tbaa !11
  %2301 = zext i8 %2300 to i64
  %2302 = shl nuw nsw i64 %2301, 32
  %2303 = or i64 %2298, %2302
  %2304 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 5
  %2305 = load i8, i8 addrspace(4)* %2304, align 1, !tbaa !11
  %2306 = zext i8 %2305 to i64
  %2307 = shl nuw nsw i64 %2306, 40
  %2308 = or i64 %2303, %2307
  %2309 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 6
  %2310 = load i8, i8 addrspace(4)* %2309, align 1, !tbaa !11
  %2311 = zext i8 %2310 to i64
  %2312 = shl nuw nsw i64 %2311, 48
  %2313 = or i64 %2308, %2312
  %2314 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 7
  %2315 = load i8, i8 addrspace(4)* %2314, align 1, !tbaa !11
  %2316 = zext i8 %2315 to i64
  %2317 = shl nuw i64 %2316, 56
  %2318 = or i64 %2313, %2317
  %2319 = add nsw i32 %2276, -8
  %2320 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 8
  br label %2334

2321:                                             ; preds = %2279, %2321
  %2322 = phi i32 [ %2332, %2321 ], [ 0, %2279 ]
  %2323 = phi i64 [ %2331, %2321 ], [ 0, %2279 ]
  %2324 = zext i32 %2322 to i64
  %2325 = getelementptr inbounds i8, i8 addrspace(4)* %2275, i64 %2324
  %2326 = load i8, i8 addrspace(4)* %2325, align 1, !tbaa !11
  %2327 = zext i8 %2326 to i64
  %2328 = shl i32 %2322, 3
  %2329 = zext i32 %2328 to i64
  %2330 = shl nuw i64 %2327, %2329
  %2331 = or i64 %2330, %2323
  %2332 = add nuw nsw i32 %2322, 1
  %2333 = icmp eq i32 %2332, %2276
  br i1 %2333, label %2334, label %2321

2334:                                             ; preds = %2321, %2281, %2279
  %2335 = phi i8 addrspace(4)* [ %2320, %2281 ], [ %2275, %2279 ], [ %2275, %2321 ]
  %2336 = phi i32 [ %2319, %2281 ], [ 0, %2279 ], [ 0, %2321 ]
  %2337 = phi i64 [ %2318, %2281 ], [ 0, %2279 ], [ %2331, %2321 ]
  %2338 = icmp ugt i32 %2336, 7
  br i1 %2338, label %2341, label %2339

2339:                                             ; preds = %2334
  %2340 = icmp eq i32 %2336, 0
  br i1 %2340, label %2392, label %2379

2341:                                             ; preds = %2334
  %2342 = load i8, i8 addrspace(4)* %2335, align 1, !tbaa !11
  %2343 = zext i8 %2342 to i64
  %2344 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 1
  %2345 = load i8, i8 addrspace(4)* %2344, align 1, !tbaa !11
  %2346 = zext i8 %2345 to i64
  %2347 = shl nuw nsw i64 %2346, 8
  %2348 = or i64 %2347, %2343
  %2349 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 2
  %2350 = load i8, i8 addrspace(4)* %2349, align 1, !tbaa !11
  %2351 = zext i8 %2350 to i64
  %2352 = shl nuw nsw i64 %2351, 16
  %2353 = or i64 %2348, %2352
  %2354 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 3
  %2355 = load i8, i8 addrspace(4)* %2354, align 1, !tbaa !11
  %2356 = zext i8 %2355 to i64
  %2357 = shl nuw nsw i64 %2356, 24
  %2358 = or i64 %2353, %2357
  %2359 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 4
  %2360 = load i8, i8 addrspace(4)* %2359, align 1, !tbaa !11
  %2361 = zext i8 %2360 to i64
  %2362 = shl nuw nsw i64 %2361, 32
  %2363 = or i64 %2358, %2362
  %2364 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 5
  %2365 = load i8, i8 addrspace(4)* %2364, align 1, !tbaa !11
  %2366 = zext i8 %2365 to i64
  %2367 = shl nuw nsw i64 %2366, 40
  %2368 = or i64 %2363, %2367
  %2369 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 6
  %2370 = load i8, i8 addrspace(4)* %2369, align 1, !tbaa !11
  %2371 = zext i8 %2370 to i64
  %2372 = shl nuw nsw i64 %2371, 48
  %2373 = or i64 %2368, %2372
  %2374 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 7
  %2375 = load i8, i8 addrspace(4)* %2374, align 1, !tbaa !11
  %2376 = zext i8 %2375 to i64
  %2377 = shl nuw i64 %2376, 56
  %2378 = or i64 %2373, %2377
  br label %2392

2379:                                             ; preds = %2339, %2379
  %2380 = phi i32 [ %2390, %2379 ], [ 0, %2339 ]
  %2381 = phi i64 [ %2389, %2379 ], [ 0, %2339 ]
  %2382 = zext i32 %2380 to i64
  %2383 = getelementptr inbounds i8, i8 addrspace(4)* %2335, i64 %2382
  %2384 = load i8, i8 addrspace(4)* %2383, align 1, !tbaa !11
  %2385 = zext i8 %2384 to i64
  %2386 = shl i32 %2380, 3
  %2387 = zext i32 %2386 to i64
  %2388 = shl nuw i64 %2385, %2387
  %2389 = or i64 %2388, %2381
  %2390 = add nuw nsw i32 %2380, 1
  %2391 = icmp eq i32 %2390, %2336
  br i1 %2391, label %2392, label %2379

2392:                                             ; preds = %2379, %2341, %2339
  %2393 = phi i64 [ %2378, %2341 ], [ 0, %2339 ], [ %2389, %2379 ]
  %2394 = shl nuw nsw i64 %1975, 2
  %2395 = add nuw nsw i64 %2394, 28
  %2396 = and i64 %2395, 480
  %2397 = and i64 %1977, -225
  %2398 = or i64 %2397, %2396
  %2399 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %1956, i64 noundef %2398, i64 noundef %2037, i64 noundef %2097, i64 noundef %2157, i64 noundef %2217, i64 noundef %2277, i64 noundef %2337, i64 noundef %2393) #11
  %2400 = sub i64 %1967, %1975
  %2401 = getelementptr inbounds i8, i8 addrspace(4)* %1968, i64 %1975
  %2402 = icmp eq i64 %2400, 0
  br i1 %2402, label %2403, label %1966

2403:                                             ; preds = %2392, %1959, %1952
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %2404 = ashr i32 %540, 1
  %2405 = icmp sgt i32 %540, 3
  br i1 %2405, label %538, label %533, !llvm.loop !20
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !21
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !7
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !7
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !7
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !7
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !7
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !7
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !7
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !7
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !25
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !21
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !26
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !29
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !26
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !30
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !29
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !31) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !32
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !34
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !35
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !26
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !29
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !36
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !36
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !37
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !39
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !21
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !29
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !26
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !36
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !36
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { convergent nounwind }
attributes #12 = { convergent }

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
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !9, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !9, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!28 = !{!"hsa_signal_s", !8, i64 0}
!29 = !{!27, !8, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !8, i64 0, !8, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !8, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !8, i64 0}
!37 = !{!38, !8, i64 16}
!38 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !24, i64 24, !24, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!39 = !{!38, !24, i64 24}
