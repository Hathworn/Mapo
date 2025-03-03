; ModuleID = '../data/hip_kernels/4525/3/main.cu'
source_filename = "../data/hip_kernels/4525/3/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [44 x i8] c"Thread{%d,%d,%d}, Block{%d,%d,%d}, tid{%d}\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z25print_unique_thread_id_1Dv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %2 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %3 = getelementptr i8, i8 addrspace(4)* %2, i64 4
  %4 = bitcast i8 addrspace(4)* %3 to i16 addrspace(4)*
  %5 = load i16, i16 addrspace(4)* %4, align 4, !range !4, !invariant.load !5
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %7 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 24
  %9 = bitcast i8 addrspace(4)* %8 to i64 addrspace(4)*
  %10 = load i64, i64 addrspace(4)* %9, align 8, !tbaa !7
  %11 = inttoptr i64 %10 to i8 addrspace(1)*
  %12 = addrspacecast i8 addrspace(1)* %11 to i8*
  %13 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %14 = extractelement <2 x i64> %13, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %15, label %19

15:                                               ; preds = %0
  %16 = and i64 %14, -225
  %17 = or i64 %16, 32
  %18 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %17, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %460

19:                                               ; preds = %0
  %20 = and i64 %14, 2
  %21 = and i64 %14, -3
  %22 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %21, i64 0
  br label %23

23:                                               ; preds = %449, %19
  %24 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 43) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([44 x i8]* addrspacecast ([44 x i8] addrspace(4)* @.str to [44 x i8]*) to i64)), i64 1))), %19 ], [ %457, %449 ]
  %25 = phi i8 addrspace(4)* [ getelementptr inbounds ([44 x i8], [44 x i8] addrspace(4)* @.str, i64 0, i64 0), %19 ], [ %458, %449 ]
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
  %39 = load i8, i8 addrspace(4)* %25, align 1, !tbaa !11
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 1
  %42 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !11
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 8
  %45 = or i64 %44, %40
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 2
  %47 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !11
  %48 = zext i8 %47 to i64
  %49 = shl nuw nsw i64 %48, 16
  %50 = or i64 %45, %49
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 3
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !11
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 24
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 4
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !11
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 32
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 5
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !11
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 40
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 6
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !11
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 48
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 7
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !11
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
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !11
  %84 = zext i8 %83 to i64
  %85 = shl i32 %79, 3
  %86 = zext i32 %85 to i64
  %87 = shl nuw i64 %84, %86
  %88 = or i64 %87, %80
  %89 = add nuw nsw i32 %79, 1
  %90 = icmp eq i32 %89, %33
  br i1 %90, label %91, label %78, !llvm.loop !12

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
  %99 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !11
  %100 = zext i8 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 1
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !11
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 8
  %105 = or i64 %104, %100
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 2
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !11
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 16
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 3
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !11
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 24
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 4
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !11
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 32
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 5
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !11
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 40
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 6
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !11
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 48
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 7
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !11
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
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !11
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
  %159 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !11
  %160 = zext i8 %159 to i64
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 1
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !11
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 8
  %165 = or i64 %164, %160
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 2
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !11
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 16
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 3
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !11
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 24
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 4
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !11
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 32
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 5
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !11
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 40
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 6
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !11
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 48
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 7
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !11
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
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !11
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
  %219 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !11
  %220 = zext i8 %219 to i64
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 1
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !11
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 8
  %225 = or i64 %224, %220
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 2
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !11
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 16
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 3
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !11
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 24
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 4
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !11
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 32
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 5
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !11
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 40
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 6
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !11
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 48
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 7
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !11
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
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !11
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
  %279 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !11
  %280 = zext i8 %279 to i64
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 1
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !11
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 8
  %285 = or i64 %284, %280
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 2
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !11
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 16
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 3
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !11
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 24
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 4
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !11
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 32
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 5
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !11
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 40
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 6
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !11
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 48
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 7
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !11
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
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !11
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
  %339 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !11
  %340 = zext i8 %339 to i64
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 1
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !11
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 8
  %345 = or i64 %344, %340
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 2
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !11
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 16
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 3
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !11
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 24
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 4
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !11
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 32
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 5
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !11
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 40
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 6
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !11
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 48
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 7
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !11
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
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !11
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
  %399 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !11
  %400 = zext i8 %399 to i64
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 1
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !11
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 8
  %405 = or i64 %404, %400
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 2
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !11
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 16
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 3
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !11
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 24
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 4
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !11
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 32
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 5
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !11
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 40
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 6
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !11
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 48
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 7
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !11
  %433 = zext i8 %432 to i64
  %434 = shl nuw i64 %433, 56
  %435 = or i64 %430, %434
  br label %449

436:                                              ; preds = %396, %436
  %437 = phi i32 [ %447, %436 ], [ 0, %396 ]
  %438 = phi i64 [ %446, %436 ], [ 0, %396 ]
  %439 = zext i32 %437 to i64
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 %439
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !11
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
  %462 = zext i16 %5 to i32
  %463 = mul i32 %1, %462
  %464 = add i32 %463, %6
  %465 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %466 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %467 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %468 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %469 = extractelement <2 x i64> %461, i64 0
  %470 = zext i32 %6 to i64
  %471 = and i64 %469, -225
  %472 = or i64 %471, 32
  %473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %472, i64 noundef %470, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %474 = extractelement <2 x i64> %473, i64 0
  %475 = zext i32 %468 to i64
  %476 = and i64 %474, -225
  %477 = or i64 %476, 32
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %477, i64 noundef %475, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %479 = extractelement <2 x i64> %478, i64 0
  %480 = zext i32 %467 to i64
  %481 = and i64 %479, -225
  %482 = or i64 %481, 32
  %483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %482, i64 noundef %480, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %484 = extractelement <2 x i64> %483, i64 0
  %485 = zext i32 %1 to i64
  %486 = and i64 %484, -225
  %487 = or i64 %486, 32
  %488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %487, i64 noundef %485, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %489 = extractelement <2 x i64> %488, i64 0
  %490 = zext i32 %466 to i64
  %491 = and i64 %489, -225
  %492 = or i64 %491, 32
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %492, i64 noundef %490, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %494 = extractelement <2 x i64> %493, i64 0
  %495 = zext i32 %465 to i64
  %496 = and i64 %494, -225
  %497 = or i64 %496, 32
  %498 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %497, i64 noundef %495, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %499 = extractelement <2 x i64> %498, i64 0
  %500 = zext i32 %464 to i64
  %501 = and i64 %499, -227
  %502 = or i64 %501, 34
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %502, i64 noundef %500, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !16
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !18
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !16
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !16
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !16
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !14
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !14
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
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
  %110 = call i64 @llvm.read_register.i64(metadata !24) #11
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
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
!6 = !{i32 0, i32 1024}
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
