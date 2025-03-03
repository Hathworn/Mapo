; ModuleID = '../data/hip_kernels/14768/1/main.cu'
source_filename = "../data/hip_kernels/14768/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [7 x i8] c"\0A%d\09%d\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [15 x i8] c"\0AIndex val:%d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9matrixAddPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %14 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 2, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %13, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = add i32 %18, %19
  %21 = mul nsw i32 %20, 100
  %22 = add nsw i32 %21, %12
  %23 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 24
  %25 = bitcast i8 addrspace(4)* %24 to i64 addrspace(4)*
  %26 = load i64, i64 addrspace(4)* %25, align 8, !tbaa !7
  %27 = inttoptr i64 %26 to i8 addrspace(1)*
  %28 = addrspacecast i8 addrspace(1)* %27 to i8*
  %29 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %30 = extractelement <2 x i64> %29, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %31, label %35

31:                                               ; preds = %3
  %32 = and i64 %30, -225
  %33 = or i64 %32, 32
  %34 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %476

35:                                               ; preds = %3
  %36 = and i64 %30, 2
  %37 = and i64 %30, -3
  %38 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %37, i64 0
  br label %39

39:                                               ; preds = %465, %35
  %40 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 6) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([7 x i8]* addrspacecast ([7 x i8] addrspace(4)* @.str to [7 x i8]*) to i64)), i64 1))), %35 ], [ %473, %465 ]
  %41 = phi i8 addrspace(4)* [ getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0), %35 ], [ %474, %465 ]
  %42 = phi <2 x i64> [ %38, %35 ], [ %472, %465 ]
  %43 = icmp ugt i64 %40, 56
  %44 = extractelement <2 x i64> %42, i64 0
  %45 = or i64 %44, %36
  %46 = insertelement <2 x i64> poison, i64 %45, i64 0
  %47 = select i1 %43, <2 x i64> %42, <2 x i64> %46
  %48 = tail call i64 @llvm.umin.i64(i64 %40, i64 56)
  %49 = trunc i64 %48 to i32
  %50 = extractelement <2 x i64> %47, i64 0
  %51 = icmp ugt i32 %49, 7
  br i1 %51, label %54, label %52

52:                                               ; preds = %39
  %53 = icmp eq i32 %49, 0
  br i1 %53, label %107, label %94

54:                                               ; preds = %39
  %55 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !11
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 1
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !11
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 8
  %61 = or i64 %60, %56
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 2
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !11
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 16
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 3
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !11
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 24
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 4
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !11
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 32
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 5
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !11
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 40
  %81 = or i64 %76, %80
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 6
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !11
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 48
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 7
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !11
  %89 = zext i8 %88 to i64
  %90 = shl nuw i64 %89, 56
  %91 = or i64 %86, %90
  %92 = add nsw i32 %49, -8
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 8
  br label %107

94:                                               ; preds = %52, %94
  %95 = phi i32 [ %105, %94 ], [ 0, %52 ]
  %96 = phi i64 [ %104, %94 ], [ 0, %52 ]
  %97 = zext i32 %95 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 %97
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !11
  %100 = zext i8 %99 to i64
  %101 = shl i32 %95, 3
  %102 = zext i32 %101 to i64
  %103 = shl nuw i64 %100, %102
  %104 = or i64 %103, %96
  %105 = add nuw nsw i32 %95, 1
  %106 = icmp eq i32 %105, %49
  br i1 %106, label %107, label %94, !llvm.loop !12

107:                                              ; preds = %94, %54, %52
  %108 = phi i8 addrspace(4)* [ %93, %54 ], [ %41, %52 ], [ %41, %94 ]
  %109 = phi i32 [ %92, %54 ], [ 0, %52 ], [ 0, %94 ]
  %110 = phi i64 [ %91, %54 ], [ 0, %52 ], [ %104, %94 ]
  %111 = icmp ugt i32 %109, 7
  br i1 %111, label %114, label %112

112:                                              ; preds = %107
  %113 = icmp eq i32 %109, 0
  br i1 %113, label %167, label %154

114:                                              ; preds = %107
  %115 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !11
  %116 = zext i8 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 1
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !11
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 8
  %121 = or i64 %120, %116
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 2
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !11
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 16
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 3
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !11
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 24
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 4
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !11
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 32
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 5
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !11
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 40
  %141 = or i64 %136, %140
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 6
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !11
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 48
  %146 = or i64 %141, %145
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 7
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !11
  %149 = zext i8 %148 to i64
  %150 = shl nuw i64 %149, 56
  %151 = or i64 %146, %150
  %152 = add nsw i32 %109, -8
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 8
  br label %167

154:                                              ; preds = %112, %154
  %155 = phi i32 [ %165, %154 ], [ 0, %112 ]
  %156 = phi i64 [ %164, %154 ], [ 0, %112 ]
  %157 = zext i32 %155 to i64
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 %157
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !11
  %160 = zext i8 %159 to i64
  %161 = shl i32 %155, 3
  %162 = zext i32 %161 to i64
  %163 = shl nuw i64 %160, %162
  %164 = or i64 %163, %156
  %165 = add nuw nsw i32 %155, 1
  %166 = icmp eq i32 %165, %109
  br i1 %166, label %167, label %154

167:                                              ; preds = %154, %114, %112
  %168 = phi i8 addrspace(4)* [ %153, %114 ], [ %108, %112 ], [ %108, %154 ]
  %169 = phi i32 [ %152, %114 ], [ 0, %112 ], [ 0, %154 ]
  %170 = phi i64 [ %151, %114 ], [ 0, %112 ], [ %164, %154 ]
  %171 = icmp ugt i32 %169, 7
  br i1 %171, label %174, label %172

172:                                              ; preds = %167
  %173 = icmp eq i32 %169, 0
  br i1 %173, label %227, label %214

174:                                              ; preds = %167
  %175 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !11
  %176 = zext i8 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 1
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !11
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 8
  %181 = or i64 %180, %176
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 2
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !11
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 16
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 3
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !11
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 24
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 4
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !11
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 32
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 5
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !11
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 40
  %201 = or i64 %196, %200
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 6
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !11
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 48
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 7
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !11
  %209 = zext i8 %208 to i64
  %210 = shl nuw i64 %209, 56
  %211 = or i64 %206, %210
  %212 = add nsw i32 %169, -8
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 8
  br label %227

214:                                              ; preds = %172, %214
  %215 = phi i32 [ %225, %214 ], [ 0, %172 ]
  %216 = phi i64 [ %224, %214 ], [ 0, %172 ]
  %217 = zext i32 %215 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 %217
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !11
  %220 = zext i8 %219 to i64
  %221 = shl i32 %215, 3
  %222 = zext i32 %221 to i64
  %223 = shl nuw i64 %220, %222
  %224 = or i64 %223, %216
  %225 = add nuw nsw i32 %215, 1
  %226 = icmp eq i32 %225, %169
  br i1 %226, label %227, label %214

227:                                              ; preds = %214, %174, %172
  %228 = phi i8 addrspace(4)* [ %213, %174 ], [ %168, %172 ], [ %168, %214 ]
  %229 = phi i32 [ %212, %174 ], [ 0, %172 ], [ 0, %214 ]
  %230 = phi i64 [ %211, %174 ], [ 0, %172 ], [ %224, %214 ]
  %231 = icmp ugt i32 %229, 7
  br i1 %231, label %234, label %232

232:                                              ; preds = %227
  %233 = icmp eq i32 %229, 0
  br i1 %233, label %287, label %274

234:                                              ; preds = %227
  %235 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !11
  %236 = zext i8 %235 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 1
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !11
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 8
  %241 = or i64 %240, %236
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 2
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !11
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 16
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 3
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !11
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 24
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 4
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !11
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 32
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 5
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !11
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 40
  %261 = or i64 %256, %260
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 6
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !11
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 48
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 7
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !11
  %269 = zext i8 %268 to i64
  %270 = shl nuw i64 %269, 56
  %271 = or i64 %266, %270
  %272 = add nsw i32 %229, -8
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 8
  br label %287

274:                                              ; preds = %232, %274
  %275 = phi i32 [ %285, %274 ], [ 0, %232 ]
  %276 = phi i64 [ %284, %274 ], [ 0, %232 ]
  %277 = zext i32 %275 to i64
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 %277
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !11
  %280 = zext i8 %279 to i64
  %281 = shl i32 %275, 3
  %282 = zext i32 %281 to i64
  %283 = shl nuw i64 %280, %282
  %284 = or i64 %283, %276
  %285 = add nuw nsw i32 %275, 1
  %286 = icmp eq i32 %285, %229
  br i1 %286, label %287, label %274

287:                                              ; preds = %274, %234, %232
  %288 = phi i8 addrspace(4)* [ %273, %234 ], [ %228, %232 ], [ %228, %274 ]
  %289 = phi i32 [ %272, %234 ], [ 0, %232 ], [ 0, %274 ]
  %290 = phi i64 [ %271, %234 ], [ 0, %232 ], [ %284, %274 ]
  %291 = icmp ugt i32 %289, 7
  br i1 %291, label %294, label %292

292:                                              ; preds = %287
  %293 = icmp eq i32 %289, 0
  br i1 %293, label %347, label %334

294:                                              ; preds = %287
  %295 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !11
  %296 = zext i8 %295 to i64
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 1
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !11
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 8
  %301 = or i64 %300, %296
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 2
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !11
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 16
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 3
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !11
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 24
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 4
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !11
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 32
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 5
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !11
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 40
  %321 = or i64 %316, %320
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 6
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !11
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 48
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 7
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !11
  %329 = zext i8 %328 to i64
  %330 = shl nuw i64 %329, 56
  %331 = or i64 %326, %330
  %332 = add nsw i32 %289, -8
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 8
  br label %347

334:                                              ; preds = %292, %334
  %335 = phi i32 [ %345, %334 ], [ 0, %292 ]
  %336 = phi i64 [ %344, %334 ], [ 0, %292 ]
  %337 = zext i32 %335 to i64
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 %337
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !11
  %340 = zext i8 %339 to i64
  %341 = shl i32 %335, 3
  %342 = zext i32 %341 to i64
  %343 = shl nuw i64 %340, %342
  %344 = or i64 %343, %336
  %345 = add nuw nsw i32 %335, 1
  %346 = icmp eq i32 %345, %289
  br i1 %346, label %347, label %334

347:                                              ; preds = %334, %294, %292
  %348 = phi i8 addrspace(4)* [ %333, %294 ], [ %288, %292 ], [ %288, %334 ]
  %349 = phi i32 [ %332, %294 ], [ 0, %292 ], [ 0, %334 ]
  %350 = phi i64 [ %331, %294 ], [ 0, %292 ], [ %344, %334 ]
  %351 = icmp ugt i32 %349, 7
  br i1 %351, label %354, label %352

352:                                              ; preds = %347
  %353 = icmp eq i32 %349, 0
  br i1 %353, label %407, label %394

354:                                              ; preds = %347
  %355 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !11
  %356 = zext i8 %355 to i64
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 1
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !11
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 8
  %361 = or i64 %360, %356
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 2
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !11
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 16
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 3
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !11
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 24
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 4
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !11
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 32
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 5
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !11
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 40
  %381 = or i64 %376, %380
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 6
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !11
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 48
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 7
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !11
  %389 = zext i8 %388 to i64
  %390 = shl nuw i64 %389, 56
  %391 = or i64 %386, %390
  %392 = add nsw i32 %349, -8
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 8
  br label %407

394:                                              ; preds = %352, %394
  %395 = phi i32 [ %405, %394 ], [ 0, %352 ]
  %396 = phi i64 [ %404, %394 ], [ 0, %352 ]
  %397 = zext i32 %395 to i64
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 %397
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !11
  %400 = zext i8 %399 to i64
  %401 = shl i32 %395, 3
  %402 = zext i32 %401 to i64
  %403 = shl nuw i64 %400, %402
  %404 = or i64 %403, %396
  %405 = add nuw nsw i32 %395, 1
  %406 = icmp eq i32 %405, %349
  br i1 %406, label %407, label %394

407:                                              ; preds = %394, %354, %352
  %408 = phi i8 addrspace(4)* [ %393, %354 ], [ %348, %352 ], [ %348, %394 ]
  %409 = phi i32 [ %392, %354 ], [ 0, %352 ], [ 0, %394 ]
  %410 = phi i64 [ %391, %354 ], [ 0, %352 ], [ %404, %394 ]
  %411 = icmp ugt i32 %409, 7
  br i1 %411, label %414, label %412

412:                                              ; preds = %407
  %413 = icmp eq i32 %409, 0
  br i1 %413, label %465, label %452

414:                                              ; preds = %407
  %415 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !11
  %416 = zext i8 %415 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 1
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !11
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 8
  %421 = or i64 %420, %416
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 2
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !11
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 16
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 3
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !11
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 24
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 4
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !11
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 32
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 5
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !11
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 40
  %441 = or i64 %436, %440
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 6
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !11
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 48
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 7
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !11
  %449 = zext i8 %448 to i64
  %450 = shl nuw i64 %449, 56
  %451 = or i64 %446, %450
  br label %465

452:                                              ; preds = %412, %452
  %453 = phi i32 [ %463, %452 ], [ 0, %412 ]
  %454 = phi i64 [ %462, %452 ], [ 0, %412 ]
  %455 = zext i32 %453 to i64
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 %455
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !11
  %458 = zext i8 %457 to i64
  %459 = shl i32 %453, 3
  %460 = zext i32 %459 to i64
  %461 = shl nuw i64 %458, %460
  %462 = or i64 %461, %454
  %463 = add nuw nsw i32 %453, 1
  %464 = icmp eq i32 %463, %409
  br i1 %464, label %465, label %452

465:                                              ; preds = %452, %414, %412
  %466 = phi i64 [ %451, %414 ], [ 0, %412 ], [ %462, %452 ]
  %467 = shl nuw nsw i64 %48, 2
  %468 = add nuw nsw i64 %467, 28
  %469 = and i64 %468, 480
  %470 = and i64 %50, -225
  %471 = or i64 %470, %469
  %472 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %471, i64 noundef %110, i64 noundef %170, i64 noundef %230, i64 noundef %290, i64 noundef %350, i64 noundef %410, i64 noundef %466) #10
  %473 = sub i64 %40, %48
  %474 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 %48
  %475 = icmp eq i64 %473, 0
  br i1 %475, label %476, label %39

476:                                              ; preds = %465, %31
  %477 = phi <2 x i64> [ %34, %31 ], [ %472, %465 ]
  %478 = extractelement <2 x i64> %477, i64 0
  %479 = zext i32 %11 to i64
  %480 = and i64 %478, -225
  %481 = or i64 %480, 32
  %482 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %481, i64 noundef %479, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %483 = extractelement <2 x i64> %482, i64 0
  %484 = zext i32 %19 to i64
  %485 = and i64 %483, -227
  %486 = or i64 %485, 34
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %486, i64 noundef %484, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %489 = extractelement <2 x i64> %488, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %490, label %494

490:                                              ; preds = %476
  %491 = and i64 %489, -225
  %492 = or i64 %491, 32
  %493 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %492, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %935

494:                                              ; preds = %476
  %495 = and i64 %489, 2
  %496 = and i64 %489, -3
  %497 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %496, i64 0
  br label %498

498:                                              ; preds = %924, %494
  %499 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.1 to [15 x i8]*) to i64)), i64 1))), %494 ], [ %932, %924 ]
  %500 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %494 ], [ %933, %924 ]
  %501 = phi <2 x i64> [ %497, %494 ], [ %931, %924 ]
  %502 = icmp ugt i64 %499, 56
  %503 = extractelement <2 x i64> %501, i64 0
  %504 = or i64 %503, %495
  %505 = insertelement <2 x i64> poison, i64 %504, i64 0
  %506 = select i1 %502, <2 x i64> %501, <2 x i64> %505
  %507 = tail call i64 @llvm.umin.i64(i64 %499, i64 56)
  %508 = trunc i64 %507 to i32
  %509 = extractelement <2 x i64> %506, i64 0
  %510 = icmp ugt i32 %508, 7
  br i1 %510, label %513, label %511

511:                                              ; preds = %498
  %512 = icmp eq i32 %508, 0
  br i1 %512, label %566, label %553

513:                                              ; preds = %498
  %514 = load i8, i8 addrspace(4)* %500, align 1, !tbaa !11
  %515 = zext i8 %514 to i64
  %516 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 1
  %517 = load i8, i8 addrspace(4)* %516, align 1, !tbaa !11
  %518 = zext i8 %517 to i64
  %519 = shl nuw nsw i64 %518, 8
  %520 = or i64 %519, %515
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 2
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !11
  %523 = zext i8 %522 to i64
  %524 = shl nuw nsw i64 %523, 16
  %525 = or i64 %520, %524
  %526 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 3
  %527 = load i8, i8 addrspace(4)* %526, align 1, !tbaa !11
  %528 = zext i8 %527 to i64
  %529 = shl nuw nsw i64 %528, 24
  %530 = or i64 %525, %529
  %531 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 4
  %532 = load i8, i8 addrspace(4)* %531, align 1, !tbaa !11
  %533 = zext i8 %532 to i64
  %534 = shl nuw nsw i64 %533, 32
  %535 = or i64 %530, %534
  %536 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 5
  %537 = load i8, i8 addrspace(4)* %536, align 1, !tbaa !11
  %538 = zext i8 %537 to i64
  %539 = shl nuw nsw i64 %538, 40
  %540 = or i64 %535, %539
  %541 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 6
  %542 = load i8, i8 addrspace(4)* %541, align 1, !tbaa !11
  %543 = zext i8 %542 to i64
  %544 = shl nuw nsw i64 %543, 48
  %545 = or i64 %540, %544
  %546 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 7
  %547 = load i8, i8 addrspace(4)* %546, align 1, !tbaa !11
  %548 = zext i8 %547 to i64
  %549 = shl nuw i64 %548, 56
  %550 = or i64 %545, %549
  %551 = add nsw i32 %508, -8
  %552 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 8
  br label %566

553:                                              ; preds = %511, %553
  %554 = phi i32 [ %564, %553 ], [ 0, %511 ]
  %555 = phi i64 [ %563, %553 ], [ 0, %511 ]
  %556 = zext i32 %554 to i64
  %557 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 %556
  %558 = load i8, i8 addrspace(4)* %557, align 1, !tbaa !11
  %559 = zext i8 %558 to i64
  %560 = shl i32 %554, 3
  %561 = zext i32 %560 to i64
  %562 = shl nuw i64 %559, %561
  %563 = or i64 %562, %555
  %564 = add nuw nsw i32 %554, 1
  %565 = icmp eq i32 %564, %508
  br i1 %565, label %566, label %553, !llvm.loop !12

566:                                              ; preds = %553, %513, %511
  %567 = phi i8 addrspace(4)* [ %552, %513 ], [ %500, %511 ], [ %500, %553 ]
  %568 = phi i32 [ %551, %513 ], [ 0, %511 ], [ 0, %553 ]
  %569 = phi i64 [ %550, %513 ], [ 0, %511 ], [ %563, %553 ]
  %570 = icmp ugt i32 %568, 7
  br i1 %570, label %573, label %571

571:                                              ; preds = %566
  %572 = icmp eq i32 %568, 0
  br i1 %572, label %626, label %613

573:                                              ; preds = %566
  %574 = load i8, i8 addrspace(4)* %567, align 1, !tbaa !11
  %575 = zext i8 %574 to i64
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 1
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !11
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 8
  %580 = or i64 %579, %575
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 2
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !11
  %583 = zext i8 %582 to i64
  %584 = shl nuw nsw i64 %583, 16
  %585 = or i64 %580, %584
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 3
  %587 = load i8, i8 addrspace(4)* %586, align 1, !tbaa !11
  %588 = zext i8 %587 to i64
  %589 = shl nuw nsw i64 %588, 24
  %590 = or i64 %585, %589
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 4
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !11
  %593 = zext i8 %592 to i64
  %594 = shl nuw nsw i64 %593, 32
  %595 = or i64 %590, %594
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 5
  %597 = load i8, i8 addrspace(4)* %596, align 1, !tbaa !11
  %598 = zext i8 %597 to i64
  %599 = shl nuw nsw i64 %598, 40
  %600 = or i64 %595, %599
  %601 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 6
  %602 = load i8, i8 addrspace(4)* %601, align 1, !tbaa !11
  %603 = zext i8 %602 to i64
  %604 = shl nuw nsw i64 %603, 48
  %605 = or i64 %600, %604
  %606 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 7
  %607 = load i8, i8 addrspace(4)* %606, align 1, !tbaa !11
  %608 = zext i8 %607 to i64
  %609 = shl nuw i64 %608, 56
  %610 = or i64 %605, %609
  %611 = add nsw i32 %568, -8
  %612 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 8
  br label %626

613:                                              ; preds = %571, %613
  %614 = phi i32 [ %624, %613 ], [ 0, %571 ]
  %615 = phi i64 [ %623, %613 ], [ 0, %571 ]
  %616 = zext i32 %614 to i64
  %617 = getelementptr inbounds i8, i8 addrspace(4)* %567, i64 %616
  %618 = load i8, i8 addrspace(4)* %617, align 1, !tbaa !11
  %619 = zext i8 %618 to i64
  %620 = shl i32 %614, 3
  %621 = zext i32 %620 to i64
  %622 = shl nuw i64 %619, %621
  %623 = or i64 %622, %615
  %624 = add nuw nsw i32 %614, 1
  %625 = icmp eq i32 %624, %568
  br i1 %625, label %626, label %613

626:                                              ; preds = %613, %573, %571
  %627 = phi i8 addrspace(4)* [ %612, %573 ], [ %567, %571 ], [ %567, %613 ]
  %628 = phi i32 [ %611, %573 ], [ 0, %571 ], [ 0, %613 ]
  %629 = phi i64 [ %610, %573 ], [ 0, %571 ], [ %623, %613 ]
  %630 = icmp ugt i32 %628, 7
  br i1 %630, label %633, label %631

631:                                              ; preds = %626
  %632 = icmp eq i32 %628, 0
  br i1 %632, label %686, label %673

633:                                              ; preds = %626
  %634 = load i8, i8 addrspace(4)* %627, align 1, !tbaa !11
  %635 = zext i8 %634 to i64
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 1
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !11
  %638 = zext i8 %637 to i64
  %639 = shl nuw nsw i64 %638, 8
  %640 = or i64 %639, %635
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 2
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !11
  %643 = zext i8 %642 to i64
  %644 = shl nuw nsw i64 %643, 16
  %645 = or i64 %640, %644
  %646 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 3
  %647 = load i8, i8 addrspace(4)* %646, align 1, !tbaa !11
  %648 = zext i8 %647 to i64
  %649 = shl nuw nsw i64 %648, 24
  %650 = or i64 %645, %649
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 4
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !11
  %653 = zext i8 %652 to i64
  %654 = shl nuw nsw i64 %653, 32
  %655 = or i64 %650, %654
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 5
  %657 = load i8, i8 addrspace(4)* %656, align 1, !tbaa !11
  %658 = zext i8 %657 to i64
  %659 = shl nuw nsw i64 %658, 40
  %660 = or i64 %655, %659
  %661 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 6
  %662 = load i8, i8 addrspace(4)* %661, align 1, !tbaa !11
  %663 = zext i8 %662 to i64
  %664 = shl nuw nsw i64 %663, 48
  %665 = or i64 %660, %664
  %666 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 7
  %667 = load i8, i8 addrspace(4)* %666, align 1, !tbaa !11
  %668 = zext i8 %667 to i64
  %669 = shl nuw i64 %668, 56
  %670 = or i64 %665, %669
  %671 = add nsw i32 %628, -8
  %672 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 8
  br label %686

673:                                              ; preds = %631, %673
  %674 = phi i32 [ %684, %673 ], [ 0, %631 ]
  %675 = phi i64 [ %683, %673 ], [ 0, %631 ]
  %676 = zext i32 %674 to i64
  %677 = getelementptr inbounds i8, i8 addrspace(4)* %627, i64 %676
  %678 = load i8, i8 addrspace(4)* %677, align 1, !tbaa !11
  %679 = zext i8 %678 to i64
  %680 = shl i32 %674, 3
  %681 = zext i32 %680 to i64
  %682 = shl nuw i64 %679, %681
  %683 = or i64 %682, %675
  %684 = add nuw nsw i32 %674, 1
  %685 = icmp eq i32 %684, %628
  br i1 %685, label %686, label %673

686:                                              ; preds = %673, %633, %631
  %687 = phi i8 addrspace(4)* [ %672, %633 ], [ %627, %631 ], [ %627, %673 ]
  %688 = phi i32 [ %671, %633 ], [ 0, %631 ], [ 0, %673 ]
  %689 = phi i64 [ %670, %633 ], [ 0, %631 ], [ %683, %673 ]
  %690 = icmp ugt i32 %688, 7
  br i1 %690, label %693, label %691

691:                                              ; preds = %686
  %692 = icmp eq i32 %688, 0
  br i1 %692, label %746, label %733

693:                                              ; preds = %686
  %694 = load i8, i8 addrspace(4)* %687, align 1, !tbaa !11
  %695 = zext i8 %694 to i64
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 1
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !11
  %698 = zext i8 %697 to i64
  %699 = shl nuw nsw i64 %698, 8
  %700 = or i64 %699, %695
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 2
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !11
  %703 = zext i8 %702 to i64
  %704 = shl nuw nsw i64 %703, 16
  %705 = or i64 %700, %704
  %706 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 3
  %707 = load i8, i8 addrspace(4)* %706, align 1, !tbaa !11
  %708 = zext i8 %707 to i64
  %709 = shl nuw nsw i64 %708, 24
  %710 = or i64 %705, %709
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 4
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !11
  %713 = zext i8 %712 to i64
  %714 = shl nuw nsw i64 %713, 32
  %715 = or i64 %710, %714
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 5
  %717 = load i8, i8 addrspace(4)* %716, align 1, !tbaa !11
  %718 = zext i8 %717 to i64
  %719 = shl nuw nsw i64 %718, 40
  %720 = or i64 %715, %719
  %721 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 6
  %722 = load i8, i8 addrspace(4)* %721, align 1, !tbaa !11
  %723 = zext i8 %722 to i64
  %724 = shl nuw nsw i64 %723, 48
  %725 = or i64 %720, %724
  %726 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 7
  %727 = load i8, i8 addrspace(4)* %726, align 1, !tbaa !11
  %728 = zext i8 %727 to i64
  %729 = shl nuw i64 %728, 56
  %730 = or i64 %725, %729
  %731 = add nsw i32 %688, -8
  %732 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 8
  br label %746

733:                                              ; preds = %691, %733
  %734 = phi i32 [ %744, %733 ], [ 0, %691 ]
  %735 = phi i64 [ %743, %733 ], [ 0, %691 ]
  %736 = zext i32 %734 to i64
  %737 = getelementptr inbounds i8, i8 addrspace(4)* %687, i64 %736
  %738 = load i8, i8 addrspace(4)* %737, align 1, !tbaa !11
  %739 = zext i8 %738 to i64
  %740 = shl i32 %734, 3
  %741 = zext i32 %740 to i64
  %742 = shl nuw i64 %739, %741
  %743 = or i64 %742, %735
  %744 = add nuw nsw i32 %734, 1
  %745 = icmp eq i32 %744, %688
  br i1 %745, label %746, label %733

746:                                              ; preds = %733, %693, %691
  %747 = phi i8 addrspace(4)* [ %732, %693 ], [ %687, %691 ], [ %687, %733 ]
  %748 = phi i32 [ %731, %693 ], [ 0, %691 ], [ 0, %733 ]
  %749 = phi i64 [ %730, %693 ], [ 0, %691 ], [ %743, %733 ]
  %750 = icmp ugt i32 %748, 7
  br i1 %750, label %753, label %751

751:                                              ; preds = %746
  %752 = icmp eq i32 %748, 0
  br i1 %752, label %806, label %793

753:                                              ; preds = %746
  %754 = load i8, i8 addrspace(4)* %747, align 1, !tbaa !11
  %755 = zext i8 %754 to i64
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 1
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !11
  %758 = zext i8 %757 to i64
  %759 = shl nuw nsw i64 %758, 8
  %760 = or i64 %759, %755
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 2
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !11
  %763 = zext i8 %762 to i64
  %764 = shl nuw nsw i64 %763, 16
  %765 = or i64 %760, %764
  %766 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 3
  %767 = load i8, i8 addrspace(4)* %766, align 1, !tbaa !11
  %768 = zext i8 %767 to i64
  %769 = shl nuw nsw i64 %768, 24
  %770 = or i64 %765, %769
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 4
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !11
  %773 = zext i8 %772 to i64
  %774 = shl nuw nsw i64 %773, 32
  %775 = or i64 %770, %774
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 5
  %777 = load i8, i8 addrspace(4)* %776, align 1, !tbaa !11
  %778 = zext i8 %777 to i64
  %779 = shl nuw nsw i64 %778, 40
  %780 = or i64 %775, %779
  %781 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 6
  %782 = load i8, i8 addrspace(4)* %781, align 1, !tbaa !11
  %783 = zext i8 %782 to i64
  %784 = shl nuw nsw i64 %783, 48
  %785 = or i64 %780, %784
  %786 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 7
  %787 = load i8, i8 addrspace(4)* %786, align 1, !tbaa !11
  %788 = zext i8 %787 to i64
  %789 = shl nuw i64 %788, 56
  %790 = or i64 %785, %789
  %791 = add nsw i32 %748, -8
  %792 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 8
  br label %806

793:                                              ; preds = %751, %793
  %794 = phi i32 [ %804, %793 ], [ 0, %751 ]
  %795 = phi i64 [ %803, %793 ], [ 0, %751 ]
  %796 = zext i32 %794 to i64
  %797 = getelementptr inbounds i8, i8 addrspace(4)* %747, i64 %796
  %798 = load i8, i8 addrspace(4)* %797, align 1, !tbaa !11
  %799 = zext i8 %798 to i64
  %800 = shl i32 %794, 3
  %801 = zext i32 %800 to i64
  %802 = shl nuw i64 %799, %801
  %803 = or i64 %802, %795
  %804 = add nuw nsw i32 %794, 1
  %805 = icmp eq i32 %804, %748
  br i1 %805, label %806, label %793

806:                                              ; preds = %793, %753, %751
  %807 = phi i8 addrspace(4)* [ %792, %753 ], [ %747, %751 ], [ %747, %793 ]
  %808 = phi i32 [ %791, %753 ], [ 0, %751 ], [ 0, %793 ]
  %809 = phi i64 [ %790, %753 ], [ 0, %751 ], [ %803, %793 ]
  %810 = icmp ugt i32 %808, 7
  br i1 %810, label %813, label %811

811:                                              ; preds = %806
  %812 = icmp eq i32 %808, 0
  br i1 %812, label %866, label %853

813:                                              ; preds = %806
  %814 = load i8, i8 addrspace(4)* %807, align 1, !tbaa !11
  %815 = zext i8 %814 to i64
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 1
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !11
  %818 = zext i8 %817 to i64
  %819 = shl nuw nsw i64 %818, 8
  %820 = or i64 %819, %815
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 2
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !11
  %823 = zext i8 %822 to i64
  %824 = shl nuw nsw i64 %823, 16
  %825 = or i64 %820, %824
  %826 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 3
  %827 = load i8, i8 addrspace(4)* %826, align 1, !tbaa !11
  %828 = zext i8 %827 to i64
  %829 = shl nuw nsw i64 %828, 24
  %830 = or i64 %825, %829
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 4
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !11
  %833 = zext i8 %832 to i64
  %834 = shl nuw nsw i64 %833, 32
  %835 = or i64 %830, %834
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 5
  %837 = load i8, i8 addrspace(4)* %836, align 1, !tbaa !11
  %838 = zext i8 %837 to i64
  %839 = shl nuw nsw i64 %838, 40
  %840 = or i64 %835, %839
  %841 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 6
  %842 = load i8, i8 addrspace(4)* %841, align 1, !tbaa !11
  %843 = zext i8 %842 to i64
  %844 = shl nuw nsw i64 %843, 48
  %845 = or i64 %840, %844
  %846 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 7
  %847 = load i8, i8 addrspace(4)* %846, align 1, !tbaa !11
  %848 = zext i8 %847 to i64
  %849 = shl nuw i64 %848, 56
  %850 = or i64 %845, %849
  %851 = add nsw i32 %808, -8
  %852 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 8
  br label %866

853:                                              ; preds = %811, %853
  %854 = phi i32 [ %864, %853 ], [ 0, %811 ]
  %855 = phi i64 [ %863, %853 ], [ 0, %811 ]
  %856 = zext i32 %854 to i64
  %857 = getelementptr inbounds i8, i8 addrspace(4)* %807, i64 %856
  %858 = load i8, i8 addrspace(4)* %857, align 1, !tbaa !11
  %859 = zext i8 %858 to i64
  %860 = shl i32 %854, 3
  %861 = zext i32 %860 to i64
  %862 = shl nuw i64 %859, %861
  %863 = or i64 %862, %855
  %864 = add nuw nsw i32 %854, 1
  %865 = icmp eq i32 %864, %808
  br i1 %865, label %866, label %853

866:                                              ; preds = %853, %813, %811
  %867 = phi i8 addrspace(4)* [ %852, %813 ], [ %807, %811 ], [ %807, %853 ]
  %868 = phi i32 [ %851, %813 ], [ 0, %811 ], [ 0, %853 ]
  %869 = phi i64 [ %850, %813 ], [ 0, %811 ], [ %863, %853 ]
  %870 = icmp ugt i32 %868, 7
  br i1 %870, label %873, label %871

871:                                              ; preds = %866
  %872 = icmp eq i32 %868, 0
  br i1 %872, label %924, label %911

873:                                              ; preds = %866
  %874 = load i8, i8 addrspace(4)* %867, align 1, !tbaa !11
  %875 = zext i8 %874 to i64
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 1
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !11
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 8
  %880 = or i64 %879, %875
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 2
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !11
  %883 = zext i8 %882 to i64
  %884 = shl nuw nsw i64 %883, 16
  %885 = or i64 %880, %884
  %886 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 3
  %887 = load i8, i8 addrspace(4)* %886, align 1, !tbaa !11
  %888 = zext i8 %887 to i64
  %889 = shl nuw nsw i64 %888, 24
  %890 = or i64 %885, %889
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 4
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !11
  %893 = zext i8 %892 to i64
  %894 = shl nuw nsw i64 %893, 32
  %895 = or i64 %890, %894
  %896 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 5
  %897 = load i8, i8 addrspace(4)* %896, align 1, !tbaa !11
  %898 = zext i8 %897 to i64
  %899 = shl nuw nsw i64 %898, 40
  %900 = or i64 %895, %899
  %901 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 6
  %902 = load i8, i8 addrspace(4)* %901, align 1, !tbaa !11
  %903 = zext i8 %902 to i64
  %904 = shl nuw nsw i64 %903, 48
  %905 = or i64 %900, %904
  %906 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 7
  %907 = load i8, i8 addrspace(4)* %906, align 1, !tbaa !11
  %908 = zext i8 %907 to i64
  %909 = shl nuw i64 %908, 56
  %910 = or i64 %905, %909
  br label %924

911:                                              ; preds = %871, %911
  %912 = phi i32 [ %922, %911 ], [ 0, %871 ]
  %913 = phi i64 [ %921, %911 ], [ 0, %871 ]
  %914 = zext i32 %912 to i64
  %915 = getelementptr inbounds i8, i8 addrspace(4)* %867, i64 %914
  %916 = load i8, i8 addrspace(4)* %915, align 1, !tbaa !11
  %917 = zext i8 %916 to i64
  %918 = shl i32 %912, 3
  %919 = zext i32 %918 to i64
  %920 = shl nuw i64 %917, %919
  %921 = or i64 %920, %913
  %922 = add nuw nsw i32 %912, 1
  %923 = icmp eq i32 %922, %868
  br i1 %923, label %924, label %911

924:                                              ; preds = %911, %873, %871
  %925 = phi i64 [ %910, %873 ], [ 0, %871 ], [ %921, %911 ]
  %926 = shl nuw nsw i64 %507, 2
  %927 = add nuw nsw i64 %926, 28
  %928 = and i64 %927, 480
  %929 = and i64 %509, -225
  %930 = or i64 %929, %928
  %931 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %930, i64 noundef %569, i64 noundef %629, i64 noundef %689, i64 noundef %749, i64 noundef %809, i64 noundef %869, i64 noundef %925) #10
  %932 = sub i64 %499, %507
  %933 = getelementptr inbounds i8, i8 addrspace(4)* %500, i64 %507
  %934 = icmp eq i64 %932, 0
  br i1 %934, label %935, label %498

935:                                              ; preds = %924, %490
  %936 = phi <2 x i64> [ %493, %490 ], [ %931, %924 ]
  %937 = extractelement <2 x i64> %936, i64 0
  %938 = zext i32 %22 to i64
  %939 = and i64 %937, -227
  %940 = or i64 %939, 34
  %941 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %940, i64 noundef %938, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %942 = icmp slt i32 %12, 100
  %943 = icmp slt i32 %20, 100
  %944 = select i1 %942, i1 %943, i1 false
  br i1 %944, label %945, label %953

945:                                              ; preds = %935
  %946 = sext i32 %22 to i64
  %947 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %946
  %948 = load i32, i32 addrspace(1)* %947, align 4, !tbaa !14
  %949 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %946
  %950 = load i32, i32 addrspace(1)* %949, align 4, !tbaa !14
  %951 = add nsw i32 %950, %948
  %952 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %946
  store i32 %951, i32 addrspace(1)* %952, align 4, !tbaa !14
  br label %953

953:                                              ; preds = %945, %935
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !26
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !27
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !26
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !20
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %110 = call i64 @llvm.read_register.i64(metadata !28) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !29
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !32
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !26
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !33
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !33
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !34
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !36
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !26
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
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !33
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !33
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
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !9, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !9, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!25 = !{!"hsa_signal_s", !8, i64 0}
!26 = !{!24, !8, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !8, i64 0, !8, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !8, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !8, i64 0}
!34 = !{!35, !8, i64 16}
!35 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !21, i64 24, !21, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!36 = !{!35, !21, i64 24}
