; ModuleID = '../data/hip_kernels/7697/1/main.cu'
source_filename = "../data/hip_kernels/7697/1/main.cu"
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
%union.anon = type { <4 x i8> }

@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"Hilo: %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [35 x i8] c"KERNEL PAANIC R: %d, G: %d, B: %d\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [9 x i8] c"WHAAAA?\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z7boxBlurP15HIP_vector_typeIhLj4EES1_iii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #1 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 24
  %9 = bitcast i8 addrspace(4)* %8 to i64 addrspace(4)*
  %10 = load i64, i64 addrspace(4)* %9, align 8, !tbaa !5
  %11 = inttoptr i64 %10 to i8 addrspace(1)*
  %12 = addrspacecast i8 addrspace(1)* %11 to i8*
  %13 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %14 = extractelement <2 x i64> %13, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %15, label %19

15:                                               ; preds = %5
  %16 = and i64 %14, -225
  %17 = or i64 %16, 32
  %18 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %17, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %460

19:                                               ; preds = %5
  %20 = and i64 %14, 2
  %21 = and i64 %14, -3
  %22 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %21, i64 0
  br label %23

23:                                               ; preds = %449, %19
  %24 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 9) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([10 x i8]* addrspacecast ([10 x i8] addrspace(4)* @.str to [10 x i8]*) to i64)), i64 1))), %19 ], [ %457, %449 ]
  %25 = phi i8 addrspace(4)* [ getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0), %19 ], [ %458, %449 ]
  %26 = phi <2 x i64> [ %22, %19 ], [ %456, %449 ]
  %27 = icmp ugt i64 %24, 56
  %28 = extractelement <2 x i64> %26, i64 0
  %29 = or i64 %28, %20
  %30 = insertelement <2 x i64> poison, i64 %29, i64 0
  %31 = select i1 %27, <2 x i64> %26, <2 x i64> %30
  %32 = tail call i64 @llvm.umin.i64(i64 %24, i64 56)
  %33 = trunc i64 %32 to i32
  %34 = extractelement <2 x i64> %31, i64 0
  %35 = icmp ugt i32 %33, 7
  br i1 %35, label %38, label %36

36:                                               ; preds = %23
  %37 = icmp eq i32 %33, 0
  br i1 %37, label %91, label %78

38:                                               ; preds = %23
  %39 = load i8, i8 addrspace(4)* %25, align 1, !tbaa !9
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 1
  %42 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !9
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 8
  %45 = or i64 %44, %40
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 2
  %47 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !9
  %48 = zext i8 %47 to i64
  %49 = shl nuw nsw i64 %48, 16
  %50 = or i64 %45, %49
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 3
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !9
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 24
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 4
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !9
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 32
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 5
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !9
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 40
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 6
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !9
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 48
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 7
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !9
  %73 = zext i8 %72 to i64
  %74 = shl nuw i64 %73, 56
  %75 = or i64 %70, %74
  %76 = add nsw i32 %33, -8
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 8
  br label %91

78:                                               ; preds = %36, %78
  %79 = phi i32 [ %89, %78 ], [ 0, %36 ]
  %80 = phi i64 [ %88, %78 ], [ 0, %36 ]
  %81 = zext i32 %79 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 %81
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !9
  %84 = zext i8 %83 to i64
  %85 = shl i32 %79, 3
  %86 = zext i32 %85 to i64
  %87 = shl nuw i64 %84, %86
  %88 = or i64 %87, %80
  %89 = add nuw nsw i32 %79, 1
  %90 = icmp eq i32 %89, %33
  br i1 %90, label %91, label %78, !llvm.loop !10

91:                                               ; preds = %78, %38, %36
  %92 = phi i8 addrspace(4)* [ %77, %38 ], [ %25, %36 ], [ %25, %78 ]
  %93 = phi i32 [ %76, %38 ], [ 0, %36 ], [ 0, %78 ]
  %94 = phi i64 [ %75, %38 ], [ 0, %36 ], [ %88, %78 ]
  %95 = icmp ugt i32 %93, 7
  br i1 %95, label %98, label %96

96:                                               ; preds = %91
  %97 = icmp eq i32 %93, 0
  br i1 %97, label %151, label %138

98:                                               ; preds = %91
  %99 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !9
  %100 = zext i8 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 1
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !9
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 8
  %105 = or i64 %104, %100
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 2
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !9
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 16
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 3
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !9
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 24
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 4
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !9
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 32
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 5
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !9
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 40
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 6
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !9
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 48
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 7
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !9
  %133 = zext i8 %132 to i64
  %134 = shl nuw i64 %133, 56
  %135 = or i64 %130, %134
  %136 = add nsw i32 %93, -8
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 8
  br label %151

138:                                              ; preds = %96, %138
  %139 = phi i32 [ %149, %138 ], [ 0, %96 ]
  %140 = phi i64 [ %148, %138 ], [ 0, %96 ]
  %141 = zext i32 %139 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 %141
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !9
  %144 = zext i8 %143 to i64
  %145 = shl i32 %139, 3
  %146 = zext i32 %145 to i64
  %147 = shl nuw i64 %144, %146
  %148 = or i64 %147, %140
  %149 = add nuw nsw i32 %139, 1
  %150 = icmp eq i32 %149, %93
  br i1 %150, label %151, label %138

151:                                              ; preds = %138, %98, %96
  %152 = phi i8 addrspace(4)* [ %137, %98 ], [ %92, %96 ], [ %92, %138 ]
  %153 = phi i32 [ %136, %98 ], [ 0, %96 ], [ 0, %138 ]
  %154 = phi i64 [ %135, %98 ], [ 0, %96 ], [ %148, %138 ]
  %155 = icmp ugt i32 %153, 7
  br i1 %155, label %158, label %156

156:                                              ; preds = %151
  %157 = icmp eq i32 %153, 0
  br i1 %157, label %211, label %198

158:                                              ; preds = %151
  %159 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !9
  %160 = zext i8 %159 to i64
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 1
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !9
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 8
  %165 = or i64 %164, %160
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 2
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !9
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 16
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 3
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !9
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 24
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 4
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !9
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 32
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 5
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !9
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 40
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 6
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !9
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 48
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 7
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !9
  %193 = zext i8 %192 to i64
  %194 = shl nuw i64 %193, 56
  %195 = or i64 %190, %194
  %196 = add nsw i32 %153, -8
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 8
  br label %211

198:                                              ; preds = %156, %198
  %199 = phi i32 [ %209, %198 ], [ 0, %156 ]
  %200 = phi i64 [ %208, %198 ], [ 0, %156 ]
  %201 = zext i32 %199 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 %201
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !9
  %204 = zext i8 %203 to i64
  %205 = shl i32 %199, 3
  %206 = zext i32 %205 to i64
  %207 = shl nuw i64 %204, %206
  %208 = or i64 %207, %200
  %209 = add nuw nsw i32 %199, 1
  %210 = icmp eq i32 %209, %153
  br i1 %210, label %211, label %198

211:                                              ; preds = %198, %158, %156
  %212 = phi i8 addrspace(4)* [ %197, %158 ], [ %152, %156 ], [ %152, %198 ]
  %213 = phi i32 [ %196, %158 ], [ 0, %156 ], [ 0, %198 ]
  %214 = phi i64 [ %195, %158 ], [ 0, %156 ], [ %208, %198 ]
  %215 = icmp ugt i32 %213, 7
  br i1 %215, label %218, label %216

216:                                              ; preds = %211
  %217 = icmp eq i32 %213, 0
  br i1 %217, label %271, label %258

218:                                              ; preds = %211
  %219 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !9
  %220 = zext i8 %219 to i64
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 1
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !9
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 8
  %225 = or i64 %224, %220
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 2
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !9
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 16
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 3
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !9
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 24
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 4
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !9
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 32
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 5
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !9
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 40
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 6
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !9
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 48
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 7
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !9
  %253 = zext i8 %252 to i64
  %254 = shl nuw i64 %253, 56
  %255 = or i64 %250, %254
  %256 = add nsw i32 %213, -8
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 8
  br label %271

258:                                              ; preds = %216, %258
  %259 = phi i32 [ %269, %258 ], [ 0, %216 ]
  %260 = phi i64 [ %268, %258 ], [ 0, %216 ]
  %261 = zext i32 %259 to i64
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 %261
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !9
  %264 = zext i8 %263 to i64
  %265 = shl i32 %259, 3
  %266 = zext i32 %265 to i64
  %267 = shl nuw i64 %264, %266
  %268 = or i64 %267, %260
  %269 = add nuw nsw i32 %259, 1
  %270 = icmp eq i32 %269, %213
  br i1 %270, label %271, label %258

271:                                              ; preds = %258, %218, %216
  %272 = phi i8 addrspace(4)* [ %257, %218 ], [ %212, %216 ], [ %212, %258 ]
  %273 = phi i32 [ %256, %218 ], [ 0, %216 ], [ 0, %258 ]
  %274 = phi i64 [ %255, %218 ], [ 0, %216 ], [ %268, %258 ]
  %275 = icmp ugt i32 %273, 7
  br i1 %275, label %278, label %276

276:                                              ; preds = %271
  %277 = icmp eq i32 %273, 0
  br i1 %277, label %331, label %318

278:                                              ; preds = %271
  %279 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !9
  %280 = zext i8 %279 to i64
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 1
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !9
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 8
  %285 = or i64 %284, %280
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 2
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !9
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 16
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 3
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !9
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 24
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 4
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !9
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 32
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 5
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !9
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 40
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 6
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !9
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 48
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 7
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !9
  %313 = zext i8 %312 to i64
  %314 = shl nuw i64 %313, 56
  %315 = or i64 %310, %314
  %316 = add nsw i32 %273, -8
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 8
  br label %331

318:                                              ; preds = %276, %318
  %319 = phi i32 [ %329, %318 ], [ 0, %276 ]
  %320 = phi i64 [ %328, %318 ], [ 0, %276 ]
  %321 = zext i32 %319 to i64
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 %321
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !9
  %324 = zext i8 %323 to i64
  %325 = shl i32 %319, 3
  %326 = zext i32 %325 to i64
  %327 = shl nuw i64 %324, %326
  %328 = or i64 %327, %320
  %329 = add nuw nsw i32 %319, 1
  %330 = icmp eq i32 %329, %273
  br i1 %330, label %331, label %318

331:                                              ; preds = %318, %278, %276
  %332 = phi i8 addrspace(4)* [ %317, %278 ], [ %272, %276 ], [ %272, %318 ]
  %333 = phi i32 [ %316, %278 ], [ 0, %276 ], [ 0, %318 ]
  %334 = phi i64 [ %315, %278 ], [ 0, %276 ], [ %328, %318 ]
  %335 = icmp ugt i32 %333, 7
  br i1 %335, label %338, label %336

336:                                              ; preds = %331
  %337 = icmp eq i32 %333, 0
  br i1 %337, label %391, label %378

338:                                              ; preds = %331
  %339 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !9
  %340 = zext i8 %339 to i64
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 1
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !9
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 8
  %345 = or i64 %344, %340
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 2
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !9
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 16
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 3
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !9
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 24
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 4
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !9
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 32
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 5
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !9
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 40
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 6
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !9
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 48
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 7
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !9
  %373 = zext i8 %372 to i64
  %374 = shl nuw i64 %373, 56
  %375 = or i64 %370, %374
  %376 = add nsw i32 %333, -8
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 8
  br label %391

378:                                              ; preds = %336, %378
  %379 = phi i32 [ %389, %378 ], [ 0, %336 ]
  %380 = phi i64 [ %388, %378 ], [ 0, %336 ]
  %381 = zext i32 %379 to i64
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 %381
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !9
  %384 = zext i8 %383 to i64
  %385 = shl i32 %379, 3
  %386 = zext i32 %385 to i64
  %387 = shl nuw i64 %384, %386
  %388 = or i64 %387, %380
  %389 = add nuw nsw i32 %379, 1
  %390 = icmp eq i32 %389, %333
  br i1 %390, label %391, label %378

391:                                              ; preds = %378, %338, %336
  %392 = phi i8 addrspace(4)* [ %377, %338 ], [ %332, %336 ], [ %332, %378 ]
  %393 = phi i32 [ %376, %338 ], [ 0, %336 ], [ 0, %378 ]
  %394 = phi i64 [ %375, %338 ], [ 0, %336 ], [ %388, %378 ]
  %395 = icmp ugt i32 %393, 7
  br i1 %395, label %398, label %396

396:                                              ; preds = %391
  %397 = icmp eq i32 %393, 0
  br i1 %397, label %449, label %436

398:                                              ; preds = %391
  %399 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !9
  %400 = zext i8 %399 to i64
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 1
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !9
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 8
  %405 = or i64 %404, %400
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 2
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !9
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 16
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 3
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !9
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 24
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 4
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !9
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 32
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 5
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !9
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 40
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 6
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !9
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 48
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 7
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !9
  %433 = zext i8 %432 to i64
  %434 = shl nuw i64 %433, 56
  %435 = or i64 %430, %434
  br label %449

436:                                              ; preds = %396, %436
  %437 = phi i32 [ %447, %436 ], [ 0, %396 ]
  %438 = phi i64 [ %446, %436 ], [ 0, %396 ]
  %439 = zext i32 %437 to i64
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 %439
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !9
  %442 = zext i8 %441 to i64
  %443 = shl i32 %437, 3
  %444 = zext i32 %443 to i64
  %445 = shl nuw i64 %442, %444
  %446 = or i64 %445, %438
  %447 = add nuw nsw i32 %437, 1
  %448 = icmp eq i32 %447, %393
  br i1 %448, label %449, label %436

449:                                              ; preds = %436, %398, %396
  %450 = phi i64 [ %435, %398 ], [ 0, %396 ], [ %446, %436 ]
  %451 = shl nuw nsw i64 %32, 2
  %452 = add nuw nsw i64 %451, 28
  %453 = and i64 %452, 480
  %454 = and i64 %34, -225
  %455 = or i64 %454, %453
  %456 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %455, i64 noundef %94, i64 noundef %154, i64 noundef %214, i64 noundef %274, i64 noundef %334, i64 noundef %394, i64 noundef %450) #10
  %457 = sub i64 %24, %32
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 %32
  %459 = icmp eq i64 %457, 0
  br i1 %459, label %460, label %23

460:                                              ; preds = %449, %15
  %461 = phi <2 x i64> [ %18, %15 ], [ %456, %449 ]
  %462 = extractelement <2 x i64> %461, i64 0
  %463 = zext i32 %6 to i64
  %464 = and i64 %462, -227
  %465 = or i64 %464, 34
  %466 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %465, i64 noundef %463, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %467 = mul nsw i32 %3, 69
  %468 = add nsw i32 %467, 45
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %469, i32 0, i32 0, i32 0, i64 0
  %471 = load i8, i8 addrspace(1)* %470, align 4, !tbaa !12
  %472 = add nsw i32 %3, 7
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %473, i32 0, i32 0, i32 0, i64 1
  %475 = load i8, i8 addrspace(1)* %474, align 1, !tbaa !12
  %476 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %473, i32 0, i32 0, i32 0, i64 2
  %477 = load i8, i8 addrspace(1)* %476, align 2, !tbaa !12
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %479 = extractelement <2 x i64> %478, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %480, label %484

480:                                              ; preds = %460
  %481 = and i64 %479, -225
  %482 = or i64 %481, 32
  %483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %482, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %925

484:                                              ; preds = %460
  %485 = and i64 %479, 2
  %486 = and i64 %479, -3
  %487 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %486, i64 0
  br label %488

488:                                              ; preds = %914, %484
  %489 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 34) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([35 x i8]* addrspacecast ([35 x i8] addrspace(4)* @.str.1 to [35 x i8]*) to i64)), i64 1))), %484 ], [ %922, %914 ]
  %490 = phi i8 addrspace(4)* [ getelementptr inbounds ([35 x i8], [35 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %484 ], [ %923, %914 ]
  %491 = phi <2 x i64> [ %487, %484 ], [ %921, %914 ]
  %492 = icmp ugt i64 %489, 56
  %493 = extractelement <2 x i64> %491, i64 0
  %494 = or i64 %493, %485
  %495 = insertelement <2 x i64> poison, i64 %494, i64 0
  %496 = select i1 %492, <2 x i64> %491, <2 x i64> %495
  %497 = tail call i64 @llvm.umin.i64(i64 %489, i64 56)
  %498 = trunc i64 %497 to i32
  %499 = extractelement <2 x i64> %496, i64 0
  %500 = icmp ugt i32 %498, 7
  br i1 %500, label %503, label %501

501:                                              ; preds = %488
  %502 = icmp eq i32 %498, 0
  br i1 %502, label %556, label %543

503:                                              ; preds = %488
  %504 = load i8, i8 addrspace(4)* %490, align 1, !tbaa !9
  %505 = zext i8 %504 to i64
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 1
  %507 = load i8, i8 addrspace(4)* %506, align 1, !tbaa !9
  %508 = zext i8 %507 to i64
  %509 = shl nuw nsw i64 %508, 8
  %510 = or i64 %509, %505
  %511 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 2
  %512 = load i8, i8 addrspace(4)* %511, align 1, !tbaa !9
  %513 = zext i8 %512 to i64
  %514 = shl nuw nsw i64 %513, 16
  %515 = or i64 %510, %514
  %516 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 3
  %517 = load i8, i8 addrspace(4)* %516, align 1, !tbaa !9
  %518 = zext i8 %517 to i64
  %519 = shl nuw nsw i64 %518, 24
  %520 = or i64 %515, %519
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 4
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !9
  %523 = zext i8 %522 to i64
  %524 = shl nuw nsw i64 %523, 32
  %525 = or i64 %520, %524
  %526 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 5
  %527 = load i8, i8 addrspace(4)* %526, align 1, !tbaa !9
  %528 = zext i8 %527 to i64
  %529 = shl nuw nsw i64 %528, 40
  %530 = or i64 %525, %529
  %531 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 6
  %532 = load i8, i8 addrspace(4)* %531, align 1, !tbaa !9
  %533 = zext i8 %532 to i64
  %534 = shl nuw nsw i64 %533, 48
  %535 = or i64 %530, %534
  %536 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 7
  %537 = load i8, i8 addrspace(4)* %536, align 1, !tbaa !9
  %538 = zext i8 %537 to i64
  %539 = shl nuw i64 %538, 56
  %540 = or i64 %535, %539
  %541 = add nsw i32 %498, -8
  %542 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 8
  br label %556

543:                                              ; preds = %501, %543
  %544 = phi i32 [ %554, %543 ], [ 0, %501 ]
  %545 = phi i64 [ %553, %543 ], [ 0, %501 ]
  %546 = zext i32 %544 to i64
  %547 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 %546
  %548 = load i8, i8 addrspace(4)* %547, align 1, !tbaa !9
  %549 = zext i8 %548 to i64
  %550 = shl i32 %544, 3
  %551 = zext i32 %550 to i64
  %552 = shl nuw i64 %549, %551
  %553 = or i64 %552, %545
  %554 = add nuw nsw i32 %544, 1
  %555 = icmp eq i32 %554, %498
  br i1 %555, label %556, label %543, !llvm.loop !10

556:                                              ; preds = %543, %503, %501
  %557 = phi i8 addrspace(4)* [ %542, %503 ], [ %490, %501 ], [ %490, %543 ]
  %558 = phi i32 [ %541, %503 ], [ 0, %501 ], [ 0, %543 ]
  %559 = phi i64 [ %540, %503 ], [ 0, %501 ], [ %553, %543 ]
  %560 = icmp ugt i32 %558, 7
  br i1 %560, label %563, label %561

561:                                              ; preds = %556
  %562 = icmp eq i32 %558, 0
  br i1 %562, label %616, label %603

563:                                              ; preds = %556
  %564 = load i8, i8 addrspace(4)* %557, align 1, !tbaa !9
  %565 = zext i8 %564 to i64
  %566 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 1
  %567 = load i8, i8 addrspace(4)* %566, align 1, !tbaa !9
  %568 = zext i8 %567 to i64
  %569 = shl nuw nsw i64 %568, 8
  %570 = or i64 %569, %565
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 2
  %572 = load i8, i8 addrspace(4)* %571, align 1, !tbaa !9
  %573 = zext i8 %572 to i64
  %574 = shl nuw nsw i64 %573, 16
  %575 = or i64 %570, %574
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 3
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !9
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 24
  %580 = or i64 %575, %579
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 4
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !9
  %583 = zext i8 %582 to i64
  %584 = shl nuw nsw i64 %583, 32
  %585 = or i64 %580, %584
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 5
  %587 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !9
  %588 = zext i8 %587 to i64
  %589 = shl nuw nsw i64 %588, 40
  %590 = or i64 %585, %589
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 6
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !9
  %593 = zext i8 %592 to i64
  %594 = shl nuw nsw i64 %593, 48
  %595 = or i64 %590, %594
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 7
  %597 = load i8, i8 addrspace(4)* %596, align 1, !tbaa !9
  %598 = zext i8 %597 to i64
  %599 = shl nuw i64 %598, 56
  %600 = or i64 %595, %599
  %601 = add nsw i32 %558, -8
  %602 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 8
  br label %616

603:                                              ; preds = %561, %603
  %604 = phi i32 [ %614, %603 ], [ 0, %561 ]
  %605 = phi i64 [ %613, %603 ], [ 0, %561 ]
  %606 = zext i32 %604 to i64
  %607 = getelementptr inbounds i8, i8 addrspace(4)* %557, i64 %606
  %608 = load i8, i8 addrspace(4)* %607, align 1, !tbaa !9
  %609 = zext i8 %608 to i64
  %610 = shl i32 %604, 3
  %611 = zext i32 %610 to i64
  %612 = shl nuw i64 %609, %611
  %613 = or i64 %612, %605
  %614 = add nuw nsw i32 %604, 1
  %615 = icmp eq i32 %614, %558
  br i1 %615, label %616, label %603

616:                                              ; preds = %603, %563, %561
  %617 = phi i8 addrspace(4)* [ %602, %563 ], [ %557, %561 ], [ %557, %603 ]
  %618 = phi i32 [ %601, %563 ], [ 0, %561 ], [ 0, %603 ]
  %619 = phi i64 [ %600, %563 ], [ 0, %561 ], [ %613, %603 ]
  %620 = icmp ugt i32 %618, 7
  br i1 %620, label %623, label %621

621:                                              ; preds = %616
  %622 = icmp eq i32 %618, 0
  br i1 %622, label %676, label %663

623:                                              ; preds = %616
  %624 = load i8, i8 addrspace(4)* %617, align 1, !tbaa !9
  %625 = zext i8 %624 to i64
  %626 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 1
  %627 = load i8, i8 addrspace(4)* %626, align 1, !tbaa !9
  %628 = zext i8 %627 to i64
  %629 = shl nuw nsw i64 %628, 8
  %630 = or i64 %629, %625
  %631 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 2
  %632 = load i8, i8 addrspace(4)* %631, align 1, !tbaa !9
  %633 = zext i8 %632 to i64
  %634 = shl nuw nsw i64 %633, 16
  %635 = or i64 %630, %634
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 3
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !9
  %638 = zext i8 %637 to i64
  %639 = shl nuw nsw i64 %638, 24
  %640 = or i64 %635, %639
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 4
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !9
  %643 = zext i8 %642 to i64
  %644 = shl nuw nsw i64 %643, 32
  %645 = or i64 %640, %644
  %646 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 5
  %647 = load i8, i8 addrspace(4)* %646, align 1, !tbaa !9
  %648 = zext i8 %647 to i64
  %649 = shl nuw nsw i64 %648, 40
  %650 = or i64 %645, %649
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 6
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !9
  %653 = zext i8 %652 to i64
  %654 = shl nuw nsw i64 %653, 48
  %655 = or i64 %650, %654
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 7
  %657 = load i8, i8 addrspace(4)* %656, align 1, !tbaa !9
  %658 = zext i8 %657 to i64
  %659 = shl nuw i64 %658, 56
  %660 = or i64 %655, %659
  %661 = add nsw i32 %618, -8
  %662 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 8
  br label %676

663:                                              ; preds = %621, %663
  %664 = phi i32 [ %674, %663 ], [ 0, %621 ]
  %665 = phi i64 [ %673, %663 ], [ 0, %621 ]
  %666 = zext i32 %664 to i64
  %667 = getelementptr inbounds i8, i8 addrspace(4)* %617, i64 %666
  %668 = load i8, i8 addrspace(4)* %667, align 1, !tbaa !9
  %669 = zext i8 %668 to i64
  %670 = shl i32 %664, 3
  %671 = zext i32 %670 to i64
  %672 = shl nuw i64 %669, %671
  %673 = or i64 %672, %665
  %674 = add nuw nsw i32 %664, 1
  %675 = icmp eq i32 %674, %618
  br i1 %675, label %676, label %663

676:                                              ; preds = %663, %623, %621
  %677 = phi i8 addrspace(4)* [ %662, %623 ], [ %617, %621 ], [ %617, %663 ]
  %678 = phi i32 [ %661, %623 ], [ 0, %621 ], [ 0, %663 ]
  %679 = phi i64 [ %660, %623 ], [ 0, %621 ], [ %673, %663 ]
  %680 = icmp ugt i32 %678, 7
  br i1 %680, label %683, label %681

681:                                              ; preds = %676
  %682 = icmp eq i32 %678, 0
  br i1 %682, label %736, label %723

683:                                              ; preds = %676
  %684 = load i8, i8 addrspace(4)* %677, align 1, !tbaa !9
  %685 = zext i8 %684 to i64
  %686 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 1
  %687 = load i8, i8 addrspace(4)* %686, align 1, !tbaa !9
  %688 = zext i8 %687 to i64
  %689 = shl nuw nsw i64 %688, 8
  %690 = or i64 %689, %685
  %691 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 2
  %692 = load i8, i8 addrspace(4)* %691, align 1, !tbaa !9
  %693 = zext i8 %692 to i64
  %694 = shl nuw nsw i64 %693, 16
  %695 = or i64 %690, %694
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 3
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !9
  %698 = zext i8 %697 to i64
  %699 = shl nuw nsw i64 %698, 24
  %700 = or i64 %695, %699
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 4
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !9
  %703 = zext i8 %702 to i64
  %704 = shl nuw nsw i64 %703, 32
  %705 = or i64 %700, %704
  %706 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 5
  %707 = load i8, i8 addrspace(4)* %706, align 1, !tbaa !9
  %708 = zext i8 %707 to i64
  %709 = shl nuw nsw i64 %708, 40
  %710 = or i64 %705, %709
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 6
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !9
  %713 = zext i8 %712 to i64
  %714 = shl nuw nsw i64 %713, 48
  %715 = or i64 %710, %714
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 7
  %717 = load i8, i8 addrspace(4)* %716, align 1, !tbaa !9
  %718 = zext i8 %717 to i64
  %719 = shl nuw i64 %718, 56
  %720 = or i64 %715, %719
  %721 = add nsw i32 %678, -8
  %722 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 8
  br label %736

723:                                              ; preds = %681, %723
  %724 = phi i32 [ %734, %723 ], [ 0, %681 ]
  %725 = phi i64 [ %733, %723 ], [ 0, %681 ]
  %726 = zext i32 %724 to i64
  %727 = getelementptr inbounds i8, i8 addrspace(4)* %677, i64 %726
  %728 = load i8, i8 addrspace(4)* %727, align 1, !tbaa !9
  %729 = zext i8 %728 to i64
  %730 = shl i32 %724, 3
  %731 = zext i32 %730 to i64
  %732 = shl nuw i64 %729, %731
  %733 = or i64 %732, %725
  %734 = add nuw nsw i32 %724, 1
  %735 = icmp eq i32 %734, %678
  br i1 %735, label %736, label %723

736:                                              ; preds = %723, %683, %681
  %737 = phi i8 addrspace(4)* [ %722, %683 ], [ %677, %681 ], [ %677, %723 ]
  %738 = phi i32 [ %721, %683 ], [ 0, %681 ], [ 0, %723 ]
  %739 = phi i64 [ %720, %683 ], [ 0, %681 ], [ %733, %723 ]
  %740 = icmp ugt i32 %738, 7
  br i1 %740, label %743, label %741

741:                                              ; preds = %736
  %742 = icmp eq i32 %738, 0
  br i1 %742, label %796, label %783

743:                                              ; preds = %736
  %744 = load i8, i8 addrspace(4)* %737, align 1, !tbaa !9
  %745 = zext i8 %744 to i64
  %746 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 1
  %747 = load i8, i8 addrspace(4)* %746, align 1, !tbaa !9
  %748 = zext i8 %747 to i64
  %749 = shl nuw nsw i64 %748, 8
  %750 = or i64 %749, %745
  %751 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 2
  %752 = load i8, i8 addrspace(4)* %751, align 1, !tbaa !9
  %753 = zext i8 %752 to i64
  %754 = shl nuw nsw i64 %753, 16
  %755 = or i64 %750, %754
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 3
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !9
  %758 = zext i8 %757 to i64
  %759 = shl nuw nsw i64 %758, 24
  %760 = or i64 %755, %759
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 4
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !9
  %763 = zext i8 %762 to i64
  %764 = shl nuw nsw i64 %763, 32
  %765 = or i64 %760, %764
  %766 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 5
  %767 = load i8, i8 addrspace(4)* %766, align 1, !tbaa !9
  %768 = zext i8 %767 to i64
  %769 = shl nuw nsw i64 %768, 40
  %770 = or i64 %765, %769
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 6
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !9
  %773 = zext i8 %772 to i64
  %774 = shl nuw nsw i64 %773, 48
  %775 = or i64 %770, %774
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 7
  %777 = load i8, i8 addrspace(4)* %776, align 1, !tbaa !9
  %778 = zext i8 %777 to i64
  %779 = shl nuw i64 %778, 56
  %780 = or i64 %775, %779
  %781 = add nsw i32 %738, -8
  %782 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 8
  br label %796

783:                                              ; preds = %741, %783
  %784 = phi i32 [ %794, %783 ], [ 0, %741 ]
  %785 = phi i64 [ %793, %783 ], [ 0, %741 ]
  %786 = zext i32 %784 to i64
  %787 = getelementptr inbounds i8, i8 addrspace(4)* %737, i64 %786
  %788 = load i8, i8 addrspace(4)* %787, align 1, !tbaa !9
  %789 = zext i8 %788 to i64
  %790 = shl i32 %784, 3
  %791 = zext i32 %790 to i64
  %792 = shl nuw i64 %789, %791
  %793 = or i64 %792, %785
  %794 = add nuw nsw i32 %784, 1
  %795 = icmp eq i32 %794, %738
  br i1 %795, label %796, label %783

796:                                              ; preds = %783, %743, %741
  %797 = phi i8 addrspace(4)* [ %782, %743 ], [ %737, %741 ], [ %737, %783 ]
  %798 = phi i32 [ %781, %743 ], [ 0, %741 ], [ 0, %783 ]
  %799 = phi i64 [ %780, %743 ], [ 0, %741 ], [ %793, %783 ]
  %800 = icmp ugt i32 %798, 7
  br i1 %800, label %803, label %801

801:                                              ; preds = %796
  %802 = icmp eq i32 %798, 0
  br i1 %802, label %856, label %843

803:                                              ; preds = %796
  %804 = load i8, i8 addrspace(4)* %797, align 1, !tbaa !9
  %805 = zext i8 %804 to i64
  %806 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 1
  %807 = load i8, i8 addrspace(4)* %806, align 1, !tbaa !9
  %808 = zext i8 %807 to i64
  %809 = shl nuw nsw i64 %808, 8
  %810 = or i64 %809, %805
  %811 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 2
  %812 = load i8, i8 addrspace(4)* %811, align 1, !tbaa !9
  %813 = zext i8 %812 to i64
  %814 = shl nuw nsw i64 %813, 16
  %815 = or i64 %810, %814
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 3
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !9
  %818 = zext i8 %817 to i64
  %819 = shl nuw nsw i64 %818, 24
  %820 = or i64 %815, %819
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 4
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !9
  %823 = zext i8 %822 to i64
  %824 = shl nuw nsw i64 %823, 32
  %825 = or i64 %820, %824
  %826 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 5
  %827 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !9
  %828 = zext i8 %827 to i64
  %829 = shl nuw nsw i64 %828, 40
  %830 = or i64 %825, %829
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 6
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !9
  %833 = zext i8 %832 to i64
  %834 = shl nuw nsw i64 %833, 48
  %835 = or i64 %830, %834
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 7
  %837 = load i8, i8 addrspace(4)* %836, align 1, !tbaa !9
  %838 = zext i8 %837 to i64
  %839 = shl nuw i64 %838, 56
  %840 = or i64 %835, %839
  %841 = add nsw i32 %798, -8
  %842 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 8
  br label %856

843:                                              ; preds = %801, %843
  %844 = phi i32 [ %854, %843 ], [ 0, %801 ]
  %845 = phi i64 [ %853, %843 ], [ 0, %801 ]
  %846 = zext i32 %844 to i64
  %847 = getelementptr inbounds i8, i8 addrspace(4)* %797, i64 %846
  %848 = load i8, i8 addrspace(4)* %847, align 1, !tbaa !9
  %849 = zext i8 %848 to i64
  %850 = shl i32 %844, 3
  %851 = zext i32 %850 to i64
  %852 = shl nuw i64 %849, %851
  %853 = or i64 %852, %845
  %854 = add nuw nsw i32 %844, 1
  %855 = icmp eq i32 %854, %798
  br i1 %855, label %856, label %843

856:                                              ; preds = %843, %803, %801
  %857 = phi i8 addrspace(4)* [ %842, %803 ], [ %797, %801 ], [ %797, %843 ]
  %858 = phi i32 [ %841, %803 ], [ 0, %801 ], [ 0, %843 ]
  %859 = phi i64 [ %840, %803 ], [ 0, %801 ], [ %853, %843 ]
  %860 = icmp ugt i32 %858, 7
  br i1 %860, label %863, label %861

861:                                              ; preds = %856
  %862 = icmp eq i32 %858, 0
  br i1 %862, label %914, label %901

863:                                              ; preds = %856
  %864 = load i8, i8 addrspace(4)* %857, align 1, !tbaa !9
  %865 = zext i8 %864 to i64
  %866 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 1
  %867 = load i8, i8 addrspace(4)* %866, align 1, !tbaa !9
  %868 = zext i8 %867 to i64
  %869 = shl nuw nsw i64 %868, 8
  %870 = or i64 %869, %865
  %871 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 2
  %872 = load i8, i8 addrspace(4)* %871, align 1, !tbaa !9
  %873 = zext i8 %872 to i64
  %874 = shl nuw nsw i64 %873, 16
  %875 = or i64 %870, %874
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 3
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !9
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 24
  %880 = or i64 %875, %879
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 4
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !9
  %883 = zext i8 %882 to i64
  %884 = shl nuw nsw i64 %883, 32
  %885 = or i64 %880, %884
  %886 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 5
  %887 = load i8, i8 addrspace(4)* %886, align 1, !tbaa !9
  %888 = zext i8 %887 to i64
  %889 = shl nuw nsw i64 %888, 40
  %890 = or i64 %885, %889
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 6
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !9
  %893 = zext i8 %892 to i64
  %894 = shl nuw nsw i64 %893, 48
  %895 = or i64 %890, %894
  %896 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 7
  %897 = load i8, i8 addrspace(4)* %896, align 1, !tbaa !9
  %898 = zext i8 %897 to i64
  %899 = shl nuw i64 %898, 56
  %900 = or i64 %895, %899
  br label %914

901:                                              ; preds = %861, %901
  %902 = phi i32 [ %912, %901 ], [ 0, %861 ]
  %903 = phi i64 [ %911, %901 ], [ 0, %861 ]
  %904 = zext i32 %902 to i64
  %905 = getelementptr inbounds i8, i8 addrspace(4)* %857, i64 %904
  %906 = load i8, i8 addrspace(4)* %905, align 1, !tbaa !9
  %907 = zext i8 %906 to i64
  %908 = shl i32 %902, 3
  %909 = zext i32 %908 to i64
  %910 = shl nuw i64 %907, %909
  %911 = or i64 %910, %903
  %912 = add nuw nsw i32 %902, 1
  %913 = icmp eq i32 %912, %858
  br i1 %913, label %914, label %901

914:                                              ; preds = %901, %863, %861
  %915 = phi i64 [ %900, %863 ], [ 0, %861 ], [ %911, %901 ]
  %916 = shl nuw nsw i64 %497, 2
  %917 = add nuw nsw i64 %916, 28
  %918 = and i64 %917, 480
  %919 = and i64 %499, -225
  %920 = or i64 %919, %918
  %921 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %920, i64 noundef %559, i64 noundef %619, i64 noundef %679, i64 noundef %739, i64 noundef %799, i64 noundef %859, i64 noundef %915) #10
  %922 = sub i64 %489, %497
  %923 = getelementptr inbounds i8, i8 addrspace(4)* %490, i64 %497
  %924 = icmp eq i64 %922, 0
  br i1 %924, label %925, label %488

925:                                              ; preds = %914, %480
  %926 = phi <2 x i64> [ %483, %480 ], [ %921, %914 ]
  %927 = extractelement <2 x i64> %926, i64 0
  %928 = zext i8 %471 to i64
  %929 = and i64 %927, -225
  %930 = or i64 %929, 32
  %931 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %930, i64 noundef %928, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %932 = extractelement <2 x i64> %931, i64 0
  %933 = zext i8 %475 to i64
  %934 = and i64 %932, -225
  %935 = or i64 %934, 32
  %936 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %935, i64 noundef %933, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %937 = extractelement <2 x i64> %936, i64 0
  %938 = zext i8 %477 to i64
  %939 = and i64 %937, -227
  %940 = or i64 %939, 34
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %940, i64 noundef %938, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %942 = icmp slt i32 %6, %2
  br i1 %942, label %943, label %962

943:                                              ; preds = %925
  %944 = icmp sgt i32 %3, 0
  %945 = and i32 %4, 1
  %946 = xor i32 %945, -1
  %947 = add nsw i32 %946, %4
  %948 = sdiv i32 %947, 2
  %949 = icmp sgt i32 %4, 0
  %950 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %951 = getelementptr i8, i8 addrspace(4)* %950, i64 4
  %952 = bitcast i8 addrspace(4)* %951 to i16 addrspace(4)*
  %953 = and i32 %4, 1
  %954 = icmp eq i32 %4, 1
  %955 = and i32 %4, -2
  %956 = icmp eq i32 %953, 0
  br label %957

957:                                              ; preds = %943, %963
  %958 = phi i32 [ %6, %943 ], [ %966, %963 ]
  br i1 %944, label %959, label %963

959:                                              ; preds = %957
  %960 = mul nsw i32 %958, %3
  %961 = sub nsw i32 %958, %948
  br label %968

962:                                              ; preds = %963, %925
  ret void

963:                                              ; preds = %1553, %957
  %964 = load i16, i16 addrspace(4)* %952, align 4, !range !15, !invariant.load !16
  %965 = zext i16 %964 to i32
  %966 = add i32 %958, %965
  %967 = icmp slt i32 %966, %2
  br i1 %967, label %957, label %962, !llvm.loop !17

968:                                              ; preds = %959, %1553
  %969 = phi i32 [ 0, %959 ], [ %1563, %1553 ]
  %970 = add nsw i32 %969, %960
  %971 = sext i32 %970 to i64
  %972 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %971, i32 0, i32 0, i32 0, i64 0
  %973 = load i8, i8 addrspace(1)* %972, align 4
  %974 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %971, i32 0, i32 0, i32 0, i64 1
  %975 = load i8, i8 addrspace(1)* %974, align 1
  %976 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %971, i32 0, i32 0, i32 0, i64 2
  %977 = load i8, i8 addrspace(1)* %976, align 2
  %978 = sub nsw i32 %969, %948
  br i1 %949, label %979, label %990

979:                                              ; preds = %968, %1028
  %980 = phi i32 [ %1032, %1028 ], [ 0, %968 ]
  %981 = phi i32 [ %1031, %1028 ], [ 0, %968 ]
  %982 = phi i32 [ %1030, %1028 ], [ 0, %968 ]
  %983 = phi i32 [ %1029, %1028 ], [ 0, %968 ]
  %984 = phi i32 [ %1033, %1028 ], [ 0, %968 ]
  %985 = add nsw i32 %984, %961
  %986 = icmp sgt i32 %985, -1
  %987 = icmp slt i32 %985, %2
  %988 = select i1 %986, i1 %987, i1 false
  %989 = mul nsw i32 %985, %3
  br i1 %954, label %996, label %1035

990:                                              ; preds = %1028, %968
  %991 = phi i32 [ 0, %968 ], [ %1029, %1028 ]
  %992 = phi i32 [ 0, %968 ], [ %1030, %1028 ]
  %993 = phi i32 [ 0, %968 ], [ %1031, %1028 ]
  %994 = phi i32 [ 0, %968 ], [ %1032, %1028 ]
  %995 = icmp eq i32 %994, 0
  br i1 %995, label %1098, label %1549

996:                                              ; preds = %1090, %979
  %997 = phi i32 [ undef, %979 ], [ %1091, %1090 ]
  %998 = phi i32 [ undef, %979 ], [ %1092, %1090 ]
  %999 = phi i32 [ undef, %979 ], [ %1093, %1090 ]
  %1000 = phi i32 [ undef, %979 ], [ %1094, %1090 ]
  %1001 = phi i32 [ %980, %979 ], [ %1094, %1090 ]
  %1002 = phi i32 [ %981, %979 ], [ %1093, %1090 ]
  %1003 = phi i32 [ %982, %979 ], [ %1092, %1090 ]
  %1004 = phi i32 [ %983, %979 ], [ %1091, %1090 ]
  %1005 = phi i32 [ 0, %979 ], [ %1095, %1090 ]
  br i1 %956, label %1028, label %1006

1006:                                             ; preds = %996
  br i1 %988, label %1007, label %1028

1007:                                             ; preds = %1006
  %1008 = add nsw i32 %1005, %978
  %1009 = icmp sgt i32 %1008, -1
  %1010 = icmp slt i32 %1008, %3
  %1011 = select i1 %1009, i1 %1010, i1 false
  br i1 %1011, label %1012, label %1028

1012:                                             ; preds = %1007
  %1013 = add nsw i32 %1008, %989
  %1014 = sext i32 %1013 to i64
  %1015 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1014, i32 0, i32 0, i32 0, i64 0
  %1016 = load i8, i8 addrspace(1)* %1015, align 4
  %1017 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1014, i32 0, i32 0, i32 0, i64 1
  %1018 = load i8, i8 addrspace(1)* %1017, align 1
  %1019 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1014, i32 0, i32 0, i32 0, i64 2
  %1020 = load i8, i8 addrspace(1)* %1019, align 2
  %1021 = zext i8 %1016 to i32
  %1022 = add nsw i32 %1002, %1021
  %1023 = zext i8 %1018 to i32
  %1024 = add nsw i32 %1003, %1023
  %1025 = zext i8 %1020 to i32
  %1026 = add nsw i32 %1004, %1025
  %1027 = add nsw i32 %1001, 1
  br label %1028

1028:                                             ; preds = %1006, %1007, %1012, %996
  %1029 = phi i32 [ %997, %996 ], [ %1026, %1012 ], [ %1004, %1007 ], [ %1004, %1006 ]
  %1030 = phi i32 [ %998, %996 ], [ %1024, %1012 ], [ %1003, %1007 ], [ %1003, %1006 ]
  %1031 = phi i32 [ %999, %996 ], [ %1022, %1012 ], [ %1002, %1007 ], [ %1002, %1006 ]
  %1032 = phi i32 [ %1000, %996 ], [ %1027, %1012 ], [ %1001, %1007 ], [ %1001, %1006 ]
  %1033 = add nuw nsw i32 %984, 1
  %1034 = icmp eq i32 %1033, %4
  br i1 %1034, label %990, label %979, !llvm.loop !19

1035:                                             ; preds = %979, %1090
  %1036 = phi i32 [ %1094, %1090 ], [ %980, %979 ]
  %1037 = phi i32 [ %1093, %1090 ], [ %981, %979 ]
  %1038 = phi i32 [ %1092, %1090 ], [ %982, %979 ]
  %1039 = phi i32 [ %1091, %1090 ], [ %983, %979 ]
  %1040 = phi i32 [ %1095, %1090 ], [ 0, %979 ]
  %1041 = phi i32 [ %1096, %1090 ], [ 0, %979 ]
  br i1 %988, label %1042, label %1063

1042:                                             ; preds = %1035
  %1043 = add nsw i32 %1040, %978
  %1044 = icmp sgt i32 %1043, -1
  %1045 = icmp slt i32 %1043, %3
  %1046 = select i1 %1044, i1 %1045, i1 false
  br i1 %1046, label %1047, label %1063

1047:                                             ; preds = %1042
  %1048 = add nsw i32 %1043, %989
  %1049 = sext i32 %1048 to i64
  %1050 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1049, i32 0, i32 0, i32 0, i64 0
  %1051 = load i8, i8 addrspace(1)* %1050, align 4
  %1052 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1049, i32 0, i32 0, i32 0, i64 1
  %1053 = load i8, i8 addrspace(1)* %1052, align 1
  %1054 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1049, i32 0, i32 0, i32 0, i64 2
  %1055 = load i8, i8 addrspace(1)* %1054, align 2
  %1056 = zext i8 %1051 to i32
  %1057 = add nsw i32 %1037, %1056
  %1058 = zext i8 %1053 to i32
  %1059 = add nsw i32 %1038, %1058
  %1060 = zext i8 %1055 to i32
  %1061 = add nsw i32 %1039, %1060
  %1062 = add nsw i32 %1036, 1
  br label %1063

1063:                                             ; preds = %1035, %1042, %1047
  %1064 = phi i32 [ %1061, %1047 ], [ %1039, %1042 ], [ %1039, %1035 ]
  %1065 = phi i32 [ %1059, %1047 ], [ %1038, %1042 ], [ %1038, %1035 ]
  %1066 = phi i32 [ %1057, %1047 ], [ %1037, %1042 ], [ %1037, %1035 ]
  %1067 = phi i32 [ %1062, %1047 ], [ %1036, %1042 ], [ %1036, %1035 ]
  br i1 %988, label %1068, label %1090

1068:                                             ; preds = %1063
  %1069 = or i32 %1040, 1
  %1070 = add nsw i32 %1069, %978
  %1071 = icmp sgt i32 %1070, -1
  %1072 = icmp slt i32 %1070, %3
  %1073 = select i1 %1071, i1 %1072, i1 false
  br i1 %1073, label %1074, label %1090

1074:                                             ; preds = %1068
  %1075 = add nsw i32 %1070, %989
  %1076 = sext i32 %1075 to i64
  %1077 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1076, i32 0, i32 0, i32 0, i64 0
  %1078 = load i8, i8 addrspace(1)* %1077, align 4
  %1079 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1076, i32 0, i32 0, i32 0, i64 1
  %1080 = load i8, i8 addrspace(1)* %1079, align 1
  %1081 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %1076, i32 0, i32 0, i32 0, i64 2
  %1082 = load i8, i8 addrspace(1)* %1081, align 2
  %1083 = zext i8 %1078 to i32
  %1084 = add nsw i32 %1066, %1083
  %1085 = zext i8 %1080 to i32
  %1086 = add nsw i32 %1065, %1085
  %1087 = zext i8 %1082 to i32
  %1088 = add nsw i32 %1064, %1087
  %1089 = add nsw i32 %1067, 1
  br label %1090

1090:                                             ; preds = %1074, %1068, %1063
  %1091 = phi i32 [ %1088, %1074 ], [ %1064, %1068 ], [ %1064, %1063 ]
  %1092 = phi i32 [ %1086, %1074 ], [ %1065, %1068 ], [ %1065, %1063 ]
  %1093 = phi i32 [ %1084, %1074 ], [ %1066, %1068 ], [ %1066, %1063 ]
  %1094 = phi i32 [ %1089, %1074 ], [ %1067, %1068 ], [ %1067, %1063 ]
  %1095 = add nuw nsw i32 %1040, 2
  %1096 = add i32 %1041, 2
  %1097 = icmp eq i32 %1096, %955
  br i1 %1097, label %996, label %1035, !llvm.loop !20

1098:                                             ; preds = %990
  %1099 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1100 = extractelement <2 x i64> %1099, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %1101, label %1105

1101:                                             ; preds = %1098
  %1102 = and i64 %1100, -227
  %1103 = or i64 %1102, 34
  %1104 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1103, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1545

1105:                                             ; preds = %1098
  %1106 = and i64 %1100, -3
  %1107 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1106, i64 0
  br label %1108

1108:                                             ; preds = %1534, %1105
  %1109 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.2, i64 0, i64 8) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([9 x i8]* addrspacecast ([9 x i8] addrspace(4)* @.str.2 to [9 x i8]*) to i64)), i64 1))), %1105 ], [ %1542, %1534 ]
  %1110 = phi i8 addrspace(4)* [ getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %1105 ], [ %1543, %1534 ]
  %1111 = phi <2 x i64> [ %1107, %1105 ], [ %1541, %1534 ]
  %1112 = icmp ugt i64 %1109, 56
  %1113 = extractelement <2 x i64> %1111, i64 0
  %1114 = or i64 %1113, 2
  %1115 = insertelement <2 x i64> poison, i64 %1114, i64 0
  %1116 = select i1 %1112, <2 x i64> %1111, <2 x i64> %1115
  %1117 = tail call i64 @llvm.umin.i64(i64 %1109, i64 56)
  %1118 = trunc i64 %1117 to i32
  %1119 = extractelement <2 x i64> %1116, i64 0
  %1120 = icmp ugt i32 %1118, 7
  br i1 %1120, label %1123, label %1121

1121:                                             ; preds = %1108
  %1122 = icmp eq i32 %1118, 0
  br i1 %1122, label %1176, label %1163

1123:                                             ; preds = %1108
  %1124 = load i8, i8 addrspace(4)* %1110, align 1, !tbaa !9
  %1125 = zext i8 %1124 to i64
  %1126 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 1
  %1127 = load i8, i8 addrspace(4)* %1126, align 1, !tbaa !9
  %1128 = zext i8 %1127 to i64
  %1129 = shl nuw nsw i64 %1128, 8
  %1130 = or i64 %1129, %1125
  %1131 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 2
  %1132 = load i8, i8 addrspace(4)* %1131, align 1, !tbaa !9
  %1133 = zext i8 %1132 to i64
  %1134 = shl nuw nsw i64 %1133, 16
  %1135 = or i64 %1130, %1134
  %1136 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 3
  %1137 = load i8, i8 addrspace(4)* %1136, align 1, !tbaa !9
  %1138 = zext i8 %1137 to i64
  %1139 = shl nuw nsw i64 %1138, 24
  %1140 = or i64 %1135, %1139
  %1141 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 4
  %1142 = load i8, i8 addrspace(4)* %1141, align 1, !tbaa !9
  %1143 = zext i8 %1142 to i64
  %1144 = shl nuw nsw i64 %1143, 32
  %1145 = or i64 %1140, %1144
  %1146 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 5
  %1147 = load i8, i8 addrspace(4)* %1146, align 1, !tbaa !9
  %1148 = zext i8 %1147 to i64
  %1149 = shl nuw nsw i64 %1148, 40
  %1150 = or i64 %1145, %1149
  %1151 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 6
  %1152 = load i8, i8 addrspace(4)* %1151, align 1, !tbaa !9
  %1153 = zext i8 %1152 to i64
  %1154 = shl nuw nsw i64 %1153, 48
  %1155 = or i64 %1150, %1154
  %1156 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 7
  %1157 = load i8, i8 addrspace(4)* %1156, align 1, !tbaa !9
  %1158 = zext i8 %1157 to i64
  %1159 = shl nuw i64 %1158, 56
  %1160 = or i64 %1155, %1159
  %1161 = add nsw i32 %1118, -8
  %1162 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 8
  br label %1176

1163:                                             ; preds = %1121, %1163
  %1164 = phi i32 [ %1174, %1163 ], [ 0, %1121 ]
  %1165 = phi i64 [ %1173, %1163 ], [ 0, %1121 ]
  %1166 = zext i32 %1164 to i64
  %1167 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 %1166
  %1168 = load i8, i8 addrspace(4)* %1167, align 1, !tbaa !9
  %1169 = zext i8 %1168 to i64
  %1170 = shl i32 %1164, 3
  %1171 = zext i32 %1170 to i64
  %1172 = shl nuw i64 %1169, %1171
  %1173 = or i64 %1172, %1165
  %1174 = add nuw nsw i32 %1164, 1
  %1175 = icmp eq i32 %1174, %1118
  br i1 %1175, label %1176, label %1163, !llvm.loop !10

1176:                                             ; preds = %1163, %1123, %1121
  %1177 = phi i8 addrspace(4)* [ %1162, %1123 ], [ %1110, %1121 ], [ %1110, %1163 ]
  %1178 = phi i32 [ %1161, %1123 ], [ 0, %1121 ], [ 0, %1163 ]
  %1179 = phi i64 [ %1160, %1123 ], [ 0, %1121 ], [ %1173, %1163 ]
  %1180 = icmp ugt i32 %1178, 7
  br i1 %1180, label %1183, label %1181

1181:                                             ; preds = %1176
  %1182 = icmp eq i32 %1178, 0
  br i1 %1182, label %1236, label %1223

1183:                                             ; preds = %1176
  %1184 = load i8, i8 addrspace(4)* %1177, align 1, !tbaa !9
  %1185 = zext i8 %1184 to i64
  %1186 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 1
  %1187 = load i8, i8 addrspace(4)* %1186, align 1, !tbaa !9
  %1188 = zext i8 %1187 to i64
  %1189 = shl nuw nsw i64 %1188, 8
  %1190 = or i64 %1189, %1185
  %1191 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 2
  %1192 = load i8, i8 addrspace(4)* %1191, align 1, !tbaa !9
  %1193 = zext i8 %1192 to i64
  %1194 = shl nuw nsw i64 %1193, 16
  %1195 = or i64 %1190, %1194
  %1196 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 3
  %1197 = load i8, i8 addrspace(4)* %1196, align 1, !tbaa !9
  %1198 = zext i8 %1197 to i64
  %1199 = shl nuw nsw i64 %1198, 24
  %1200 = or i64 %1195, %1199
  %1201 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 4
  %1202 = load i8, i8 addrspace(4)* %1201, align 1, !tbaa !9
  %1203 = zext i8 %1202 to i64
  %1204 = shl nuw nsw i64 %1203, 32
  %1205 = or i64 %1200, %1204
  %1206 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 5
  %1207 = load i8, i8 addrspace(4)* %1206, align 1, !tbaa !9
  %1208 = zext i8 %1207 to i64
  %1209 = shl nuw nsw i64 %1208, 40
  %1210 = or i64 %1205, %1209
  %1211 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 6
  %1212 = load i8, i8 addrspace(4)* %1211, align 1, !tbaa !9
  %1213 = zext i8 %1212 to i64
  %1214 = shl nuw nsw i64 %1213, 48
  %1215 = or i64 %1210, %1214
  %1216 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 7
  %1217 = load i8, i8 addrspace(4)* %1216, align 1, !tbaa !9
  %1218 = zext i8 %1217 to i64
  %1219 = shl nuw i64 %1218, 56
  %1220 = or i64 %1215, %1219
  %1221 = add nsw i32 %1178, -8
  %1222 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 8
  br label %1236

1223:                                             ; preds = %1181, %1223
  %1224 = phi i32 [ %1234, %1223 ], [ 0, %1181 ]
  %1225 = phi i64 [ %1233, %1223 ], [ 0, %1181 ]
  %1226 = zext i32 %1224 to i64
  %1227 = getelementptr inbounds i8, i8 addrspace(4)* %1177, i64 %1226
  %1228 = load i8, i8 addrspace(4)* %1227, align 1, !tbaa !9
  %1229 = zext i8 %1228 to i64
  %1230 = shl i32 %1224, 3
  %1231 = zext i32 %1230 to i64
  %1232 = shl nuw i64 %1229, %1231
  %1233 = or i64 %1232, %1225
  %1234 = add nuw nsw i32 %1224, 1
  %1235 = icmp eq i32 %1234, %1178
  br i1 %1235, label %1236, label %1223

1236:                                             ; preds = %1223, %1183, %1181
  %1237 = phi i8 addrspace(4)* [ %1222, %1183 ], [ %1177, %1181 ], [ %1177, %1223 ]
  %1238 = phi i32 [ %1221, %1183 ], [ 0, %1181 ], [ 0, %1223 ]
  %1239 = phi i64 [ %1220, %1183 ], [ 0, %1181 ], [ %1233, %1223 ]
  %1240 = icmp ugt i32 %1238, 7
  br i1 %1240, label %1243, label %1241

1241:                                             ; preds = %1236
  %1242 = icmp eq i32 %1238, 0
  br i1 %1242, label %1296, label %1283

1243:                                             ; preds = %1236
  %1244 = load i8, i8 addrspace(4)* %1237, align 1, !tbaa !9
  %1245 = zext i8 %1244 to i64
  %1246 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 1
  %1247 = load i8, i8 addrspace(4)* %1246, align 1, !tbaa !9
  %1248 = zext i8 %1247 to i64
  %1249 = shl nuw nsw i64 %1248, 8
  %1250 = or i64 %1249, %1245
  %1251 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 2
  %1252 = load i8, i8 addrspace(4)* %1251, align 1, !tbaa !9
  %1253 = zext i8 %1252 to i64
  %1254 = shl nuw nsw i64 %1253, 16
  %1255 = or i64 %1250, %1254
  %1256 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 3
  %1257 = load i8, i8 addrspace(4)* %1256, align 1, !tbaa !9
  %1258 = zext i8 %1257 to i64
  %1259 = shl nuw nsw i64 %1258, 24
  %1260 = or i64 %1255, %1259
  %1261 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 4
  %1262 = load i8, i8 addrspace(4)* %1261, align 1, !tbaa !9
  %1263 = zext i8 %1262 to i64
  %1264 = shl nuw nsw i64 %1263, 32
  %1265 = or i64 %1260, %1264
  %1266 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 5
  %1267 = load i8, i8 addrspace(4)* %1266, align 1, !tbaa !9
  %1268 = zext i8 %1267 to i64
  %1269 = shl nuw nsw i64 %1268, 40
  %1270 = or i64 %1265, %1269
  %1271 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 6
  %1272 = load i8, i8 addrspace(4)* %1271, align 1, !tbaa !9
  %1273 = zext i8 %1272 to i64
  %1274 = shl nuw nsw i64 %1273, 48
  %1275 = or i64 %1270, %1274
  %1276 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 7
  %1277 = load i8, i8 addrspace(4)* %1276, align 1, !tbaa !9
  %1278 = zext i8 %1277 to i64
  %1279 = shl nuw i64 %1278, 56
  %1280 = or i64 %1275, %1279
  %1281 = add nsw i32 %1238, -8
  %1282 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 8
  br label %1296

1283:                                             ; preds = %1241, %1283
  %1284 = phi i32 [ %1294, %1283 ], [ 0, %1241 ]
  %1285 = phi i64 [ %1293, %1283 ], [ 0, %1241 ]
  %1286 = zext i32 %1284 to i64
  %1287 = getelementptr inbounds i8, i8 addrspace(4)* %1237, i64 %1286
  %1288 = load i8, i8 addrspace(4)* %1287, align 1, !tbaa !9
  %1289 = zext i8 %1288 to i64
  %1290 = shl i32 %1284, 3
  %1291 = zext i32 %1290 to i64
  %1292 = shl nuw i64 %1289, %1291
  %1293 = or i64 %1292, %1285
  %1294 = add nuw nsw i32 %1284, 1
  %1295 = icmp eq i32 %1294, %1238
  br i1 %1295, label %1296, label %1283

1296:                                             ; preds = %1283, %1243, %1241
  %1297 = phi i8 addrspace(4)* [ %1282, %1243 ], [ %1237, %1241 ], [ %1237, %1283 ]
  %1298 = phi i32 [ %1281, %1243 ], [ 0, %1241 ], [ 0, %1283 ]
  %1299 = phi i64 [ %1280, %1243 ], [ 0, %1241 ], [ %1293, %1283 ]
  %1300 = icmp ugt i32 %1298, 7
  br i1 %1300, label %1303, label %1301

1301:                                             ; preds = %1296
  %1302 = icmp eq i32 %1298, 0
  br i1 %1302, label %1356, label %1343

1303:                                             ; preds = %1296
  %1304 = load i8, i8 addrspace(4)* %1297, align 1, !tbaa !9
  %1305 = zext i8 %1304 to i64
  %1306 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 1
  %1307 = load i8, i8 addrspace(4)* %1306, align 1, !tbaa !9
  %1308 = zext i8 %1307 to i64
  %1309 = shl nuw nsw i64 %1308, 8
  %1310 = or i64 %1309, %1305
  %1311 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 2
  %1312 = load i8, i8 addrspace(4)* %1311, align 1, !tbaa !9
  %1313 = zext i8 %1312 to i64
  %1314 = shl nuw nsw i64 %1313, 16
  %1315 = or i64 %1310, %1314
  %1316 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 3
  %1317 = load i8, i8 addrspace(4)* %1316, align 1, !tbaa !9
  %1318 = zext i8 %1317 to i64
  %1319 = shl nuw nsw i64 %1318, 24
  %1320 = or i64 %1315, %1319
  %1321 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 4
  %1322 = load i8, i8 addrspace(4)* %1321, align 1, !tbaa !9
  %1323 = zext i8 %1322 to i64
  %1324 = shl nuw nsw i64 %1323, 32
  %1325 = or i64 %1320, %1324
  %1326 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 5
  %1327 = load i8, i8 addrspace(4)* %1326, align 1, !tbaa !9
  %1328 = zext i8 %1327 to i64
  %1329 = shl nuw nsw i64 %1328, 40
  %1330 = or i64 %1325, %1329
  %1331 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 6
  %1332 = load i8, i8 addrspace(4)* %1331, align 1, !tbaa !9
  %1333 = zext i8 %1332 to i64
  %1334 = shl nuw nsw i64 %1333, 48
  %1335 = or i64 %1330, %1334
  %1336 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 7
  %1337 = load i8, i8 addrspace(4)* %1336, align 1, !tbaa !9
  %1338 = zext i8 %1337 to i64
  %1339 = shl nuw i64 %1338, 56
  %1340 = or i64 %1335, %1339
  %1341 = add nsw i32 %1298, -8
  %1342 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 8
  br label %1356

1343:                                             ; preds = %1301, %1343
  %1344 = phi i32 [ %1354, %1343 ], [ 0, %1301 ]
  %1345 = phi i64 [ %1353, %1343 ], [ 0, %1301 ]
  %1346 = zext i32 %1344 to i64
  %1347 = getelementptr inbounds i8, i8 addrspace(4)* %1297, i64 %1346
  %1348 = load i8, i8 addrspace(4)* %1347, align 1, !tbaa !9
  %1349 = zext i8 %1348 to i64
  %1350 = shl i32 %1344, 3
  %1351 = zext i32 %1350 to i64
  %1352 = shl nuw i64 %1349, %1351
  %1353 = or i64 %1352, %1345
  %1354 = add nuw nsw i32 %1344, 1
  %1355 = icmp eq i32 %1354, %1298
  br i1 %1355, label %1356, label %1343

1356:                                             ; preds = %1343, %1303, %1301
  %1357 = phi i8 addrspace(4)* [ %1342, %1303 ], [ %1297, %1301 ], [ %1297, %1343 ]
  %1358 = phi i32 [ %1341, %1303 ], [ 0, %1301 ], [ 0, %1343 ]
  %1359 = phi i64 [ %1340, %1303 ], [ 0, %1301 ], [ %1353, %1343 ]
  %1360 = icmp ugt i32 %1358, 7
  br i1 %1360, label %1363, label %1361

1361:                                             ; preds = %1356
  %1362 = icmp eq i32 %1358, 0
  br i1 %1362, label %1416, label %1403

1363:                                             ; preds = %1356
  %1364 = load i8, i8 addrspace(4)* %1357, align 1, !tbaa !9
  %1365 = zext i8 %1364 to i64
  %1366 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 1
  %1367 = load i8, i8 addrspace(4)* %1366, align 1, !tbaa !9
  %1368 = zext i8 %1367 to i64
  %1369 = shl nuw nsw i64 %1368, 8
  %1370 = or i64 %1369, %1365
  %1371 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 2
  %1372 = load i8, i8 addrspace(4)* %1371, align 1, !tbaa !9
  %1373 = zext i8 %1372 to i64
  %1374 = shl nuw nsw i64 %1373, 16
  %1375 = or i64 %1370, %1374
  %1376 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 3
  %1377 = load i8, i8 addrspace(4)* %1376, align 1, !tbaa !9
  %1378 = zext i8 %1377 to i64
  %1379 = shl nuw nsw i64 %1378, 24
  %1380 = or i64 %1375, %1379
  %1381 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 4
  %1382 = load i8, i8 addrspace(4)* %1381, align 1, !tbaa !9
  %1383 = zext i8 %1382 to i64
  %1384 = shl nuw nsw i64 %1383, 32
  %1385 = or i64 %1380, %1384
  %1386 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 5
  %1387 = load i8, i8 addrspace(4)* %1386, align 1, !tbaa !9
  %1388 = zext i8 %1387 to i64
  %1389 = shl nuw nsw i64 %1388, 40
  %1390 = or i64 %1385, %1389
  %1391 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 6
  %1392 = load i8, i8 addrspace(4)* %1391, align 1, !tbaa !9
  %1393 = zext i8 %1392 to i64
  %1394 = shl nuw nsw i64 %1393, 48
  %1395 = or i64 %1390, %1394
  %1396 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 7
  %1397 = load i8, i8 addrspace(4)* %1396, align 1, !tbaa !9
  %1398 = zext i8 %1397 to i64
  %1399 = shl nuw i64 %1398, 56
  %1400 = or i64 %1395, %1399
  %1401 = add nsw i32 %1358, -8
  %1402 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 8
  br label %1416

1403:                                             ; preds = %1361, %1403
  %1404 = phi i32 [ %1414, %1403 ], [ 0, %1361 ]
  %1405 = phi i64 [ %1413, %1403 ], [ 0, %1361 ]
  %1406 = zext i32 %1404 to i64
  %1407 = getelementptr inbounds i8, i8 addrspace(4)* %1357, i64 %1406
  %1408 = load i8, i8 addrspace(4)* %1407, align 1, !tbaa !9
  %1409 = zext i8 %1408 to i64
  %1410 = shl i32 %1404, 3
  %1411 = zext i32 %1410 to i64
  %1412 = shl nuw i64 %1409, %1411
  %1413 = or i64 %1412, %1405
  %1414 = add nuw nsw i32 %1404, 1
  %1415 = icmp eq i32 %1414, %1358
  br i1 %1415, label %1416, label %1403

1416:                                             ; preds = %1403, %1363, %1361
  %1417 = phi i8 addrspace(4)* [ %1402, %1363 ], [ %1357, %1361 ], [ %1357, %1403 ]
  %1418 = phi i32 [ %1401, %1363 ], [ 0, %1361 ], [ 0, %1403 ]
  %1419 = phi i64 [ %1400, %1363 ], [ 0, %1361 ], [ %1413, %1403 ]
  %1420 = icmp ugt i32 %1418, 7
  br i1 %1420, label %1423, label %1421

1421:                                             ; preds = %1416
  %1422 = icmp eq i32 %1418, 0
  br i1 %1422, label %1476, label %1463

1423:                                             ; preds = %1416
  %1424 = load i8, i8 addrspace(4)* %1417, align 1, !tbaa !9
  %1425 = zext i8 %1424 to i64
  %1426 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 1
  %1427 = load i8, i8 addrspace(4)* %1426, align 1, !tbaa !9
  %1428 = zext i8 %1427 to i64
  %1429 = shl nuw nsw i64 %1428, 8
  %1430 = or i64 %1429, %1425
  %1431 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 2
  %1432 = load i8, i8 addrspace(4)* %1431, align 1, !tbaa !9
  %1433 = zext i8 %1432 to i64
  %1434 = shl nuw nsw i64 %1433, 16
  %1435 = or i64 %1430, %1434
  %1436 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 3
  %1437 = load i8, i8 addrspace(4)* %1436, align 1, !tbaa !9
  %1438 = zext i8 %1437 to i64
  %1439 = shl nuw nsw i64 %1438, 24
  %1440 = or i64 %1435, %1439
  %1441 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 4
  %1442 = load i8, i8 addrspace(4)* %1441, align 1, !tbaa !9
  %1443 = zext i8 %1442 to i64
  %1444 = shl nuw nsw i64 %1443, 32
  %1445 = or i64 %1440, %1444
  %1446 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 5
  %1447 = load i8, i8 addrspace(4)* %1446, align 1, !tbaa !9
  %1448 = zext i8 %1447 to i64
  %1449 = shl nuw nsw i64 %1448, 40
  %1450 = or i64 %1445, %1449
  %1451 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 6
  %1452 = load i8, i8 addrspace(4)* %1451, align 1, !tbaa !9
  %1453 = zext i8 %1452 to i64
  %1454 = shl nuw nsw i64 %1453, 48
  %1455 = or i64 %1450, %1454
  %1456 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 7
  %1457 = load i8, i8 addrspace(4)* %1456, align 1, !tbaa !9
  %1458 = zext i8 %1457 to i64
  %1459 = shl nuw i64 %1458, 56
  %1460 = or i64 %1455, %1459
  %1461 = add nsw i32 %1418, -8
  %1462 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 8
  br label %1476

1463:                                             ; preds = %1421, %1463
  %1464 = phi i32 [ %1474, %1463 ], [ 0, %1421 ]
  %1465 = phi i64 [ %1473, %1463 ], [ 0, %1421 ]
  %1466 = zext i32 %1464 to i64
  %1467 = getelementptr inbounds i8, i8 addrspace(4)* %1417, i64 %1466
  %1468 = load i8, i8 addrspace(4)* %1467, align 1, !tbaa !9
  %1469 = zext i8 %1468 to i64
  %1470 = shl i32 %1464, 3
  %1471 = zext i32 %1470 to i64
  %1472 = shl nuw i64 %1469, %1471
  %1473 = or i64 %1472, %1465
  %1474 = add nuw nsw i32 %1464, 1
  %1475 = icmp eq i32 %1474, %1418
  br i1 %1475, label %1476, label %1463

1476:                                             ; preds = %1463, %1423, %1421
  %1477 = phi i8 addrspace(4)* [ %1462, %1423 ], [ %1417, %1421 ], [ %1417, %1463 ]
  %1478 = phi i32 [ %1461, %1423 ], [ 0, %1421 ], [ 0, %1463 ]
  %1479 = phi i64 [ %1460, %1423 ], [ 0, %1421 ], [ %1473, %1463 ]
  %1480 = icmp ugt i32 %1478, 7
  br i1 %1480, label %1483, label %1481

1481:                                             ; preds = %1476
  %1482 = icmp eq i32 %1478, 0
  br i1 %1482, label %1534, label %1521

1483:                                             ; preds = %1476
  %1484 = load i8, i8 addrspace(4)* %1477, align 1, !tbaa !9
  %1485 = zext i8 %1484 to i64
  %1486 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 1
  %1487 = load i8, i8 addrspace(4)* %1486, align 1, !tbaa !9
  %1488 = zext i8 %1487 to i64
  %1489 = shl nuw nsw i64 %1488, 8
  %1490 = or i64 %1489, %1485
  %1491 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 2
  %1492 = load i8, i8 addrspace(4)* %1491, align 1, !tbaa !9
  %1493 = zext i8 %1492 to i64
  %1494 = shl nuw nsw i64 %1493, 16
  %1495 = or i64 %1490, %1494
  %1496 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 3
  %1497 = load i8, i8 addrspace(4)* %1496, align 1, !tbaa !9
  %1498 = zext i8 %1497 to i64
  %1499 = shl nuw nsw i64 %1498, 24
  %1500 = or i64 %1495, %1499
  %1501 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 4
  %1502 = load i8, i8 addrspace(4)* %1501, align 1, !tbaa !9
  %1503 = zext i8 %1502 to i64
  %1504 = shl nuw nsw i64 %1503, 32
  %1505 = or i64 %1500, %1504
  %1506 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 5
  %1507 = load i8, i8 addrspace(4)* %1506, align 1, !tbaa !9
  %1508 = zext i8 %1507 to i64
  %1509 = shl nuw nsw i64 %1508, 40
  %1510 = or i64 %1505, %1509
  %1511 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 6
  %1512 = load i8, i8 addrspace(4)* %1511, align 1, !tbaa !9
  %1513 = zext i8 %1512 to i64
  %1514 = shl nuw nsw i64 %1513, 48
  %1515 = or i64 %1510, %1514
  %1516 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 7
  %1517 = load i8, i8 addrspace(4)* %1516, align 1, !tbaa !9
  %1518 = zext i8 %1517 to i64
  %1519 = shl nuw i64 %1518, 56
  %1520 = or i64 %1515, %1519
  br label %1534

1521:                                             ; preds = %1481, %1521
  %1522 = phi i32 [ %1532, %1521 ], [ 0, %1481 ]
  %1523 = phi i64 [ %1531, %1521 ], [ 0, %1481 ]
  %1524 = zext i32 %1522 to i64
  %1525 = getelementptr inbounds i8, i8 addrspace(4)* %1477, i64 %1524
  %1526 = load i8, i8 addrspace(4)* %1525, align 1, !tbaa !9
  %1527 = zext i8 %1526 to i64
  %1528 = shl i32 %1522, 3
  %1529 = zext i32 %1528 to i64
  %1530 = shl nuw i64 %1527, %1529
  %1531 = or i64 %1530, %1523
  %1532 = add nuw nsw i32 %1522, 1
  %1533 = icmp eq i32 %1532, %1478
  br i1 %1533, label %1534, label %1521

1534:                                             ; preds = %1521, %1483, %1481
  %1535 = phi i64 [ %1520, %1483 ], [ 0, %1481 ], [ %1531, %1521 ]
  %1536 = shl nuw nsw i64 %1117, 2
  %1537 = add nuw nsw i64 %1536, 28
  %1538 = and i64 %1537, 480
  %1539 = and i64 %1119, -225
  %1540 = or i64 %1539, %1538
  %1541 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1540, i64 noundef %1179, i64 noundef %1239, i64 noundef %1299, i64 noundef %1359, i64 noundef %1419, i64 noundef %1479, i64 noundef %1535) #10
  %1542 = sub i64 %1109, %1117
  %1543 = getelementptr inbounds i8, i8 addrspace(4)* %1110, i64 %1117
  %1544 = icmp eq i64 %1542, 0
  br i1 %1544, label %1545, label %1108

1545:                                             ; preds = %1534, %1101
  %1546 = zext i8 %973 to i32
  %1547 = zext i8 %975 to i32
  %1548 = zext i8 %977 to i32
  br label %1553

1549:                                             ; preds = %990
  %1550 = sdiv i32 %993, %994
  %1551 = sdiv i32 %992, %994
  %1552 = sdiv i32 %991, %994
  br label %1553

1553:                                             ; preds = %1549, %1545
  %1554 = phi i32 [ %1548, %1545 ], [ %1552, %1549 ]
  %1555 = phi i32 [ %1547, %1545 ], [ %1551, %1549 ]
  %1556 = phi i32 [ %1546, %1545 ], [ %1550, %1549 ]
  %1557 = trunc i32 %1556 to i8
  %1558 = trunc i32 %1555 to i8
  %1559 = trunc i32 %1554 to i8
  %1560 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %971, i32 0, i32 0, i32 0, i64 0
  store i8 %1557, i8 addrspace(1)* %1560, align 4
  %1561 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %971, i32 0, i32 0, i32 0, i64 1
  store i8 %1558, i8 addrspace(1)* %1561, align 1
  %1562 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %971, i32 0, i32 0, i32 0, i64 2
  store i8 %1559, i8 addrspace(1)* %1562, align 2
  %1563 = add nuw nsw i32 %969, 1
  %1564 = icmp eq i32 %1563, %3
  br i1 %1564, label %963, label %968, !llvm.loop !21
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !22
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !24
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !5
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !5
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !5
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !5
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !5
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !5
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !5
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !5
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !24
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !26
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !24
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !24
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !30
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !5
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !27
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !30
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !31
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !30
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !24
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !5
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !5
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !5
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !5
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !5
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !5
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !5
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !5
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %110 = call i64 @llvm.read_register.i64(metadata !32) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !33
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !35
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !36
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !5
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !5
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !5
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !5
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !5
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !5
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !5
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !5
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !27
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !30
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !37
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !37
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !38
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !40
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !5
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !5
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !9
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !30
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !27
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !37
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !37
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !9
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
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{i16 1, i16 1025}
!16 = !{}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = distinct !{!19, !18}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !7, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !7, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !23, i64 0}
!28 = !{!"", !23, i64 0, !23, i64 8, !29, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!29 = !{!"hsa_signal_s", !6, i64 0}
!30 = !{!28, !6, i64 40}
!31 = !{!28, !23, i64 8}
!32 = !{!"exec"}
!33 = !{!34, !25, i64 16}
!34 = !{!"", !6, i64 0, !6, i64 8, !25, i64 16, !25, i64 20}
!35 = !{!34, !6, i64 8}
!36 = !{!34, !25, i64 20}
!37 = !{!34, !6, i64 0}
!38 = !{!39, !6, i64 16}
!39 = !{!"amd_signal_s", !6, i64 0, !7, i64 8, !6, i64 16, !25, i64 24, !25, i64 28, !6, i64 32, !6, i64 40, !7, i64 48, !7, i64 56}
!40 = !{!39, !25, i64 24}
