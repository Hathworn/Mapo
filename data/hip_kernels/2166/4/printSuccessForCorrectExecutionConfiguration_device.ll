; ModuleID = '../data/hip_kernels/2166/4/main.cu'
source_filename = "../data/hip_kernels/2166/4/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [10 x i8] c"Success!\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z44printSuccessForCorrectExecutionConfigurationv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = icmp eq i32 %1, 1023
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = icmp eq i32 %3, 255
  %5 = select i1 %2, i1 %4, i1 false
  br i1 %5, label %6, label %459

6:                                                ; preds = %0
  %7 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 24
  %9 = bitcast i8 addrspace(4)* %8 to i64 addrspace(4)*
  %10 = load i64, i64 addrspace(4)* %9, align 8, !tbaa !5
  %11 = inttoptr i64 %10 to i8 addrspace(1)*
  %12 = addrspacecast i8 addrspace(1)* %11 to i8*
  %13 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %14 = extractelement <2 x i64> %13, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %15, label %19

15:                                               ; preds = %6
  %16 = and i64 %14, -227
  %17 = or i64 %16, 34
  %18 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %17, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %459

19:                                               ; preds = %6
  %20 = and i64 %14, -3
  %21 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %20, i64 0
  br label %22

22:                                               ; preds = %448, %19
  %23 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 9) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([10 x i8]* addrspacecast ([10 x i8] addrspace(4)* @.str to [10 x i8]*) to i64)), i64 1))), %19 ], [ %456, %448 ]
  %24 = phi i8 addrspace(4)* [ getelementptr inbounds ([10 x i8], [10 x i8] addrspace(4)* @.str, i64 0, i64 0), %19 ], [ %457, %448 ]
  %25 = phi <2 x i64> [ %21, %19 ], [ %455, %448 ]
  %26 = icmp ugt i64 %23, 56
  %27 = extractelement <2 x i64> %25, i64 0
  %28 = or i64 %27, 2
  %29 = insertelement <2 x i64> poison, i64 %28, i64 0
  %30 = select i1 %26, <2 x i64> %25, <2 x i64> %29
  %31 = tail call i64 @llvm.umin.i64(i64 %23, i64 56)
  %32 = trunc i64 %31 to i32
  %33 = extractelement <2 x i64> %30, i64 0
  %34 = icmp ugt i32 %32, 7
  br i1 %34, label %37, label %35

35:                                               ; preds = %22
  %36 = icmp eq i32 %32, 0
  br i1 %36, label %90, label %77

37:                                               ; preds = %22
  %38 = load i8, i8 addrspace(4)* %24, align 1, !tbaa !9
  %39 = zext i8 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 1
  %41 = load i8, i8 addrspace(4)* %40, align 1, !tbaa !9
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 8
  %44 = or i64 %43, %39
  %45 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 2
  %46 = load i8, i8 addrspace(4)* %45, align 1, !tbaa !9
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 16
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 3
  %51 = load i8, i8 addrspace(4)* %50, align 1, !tbaa !9
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 24
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 4
  %56 = load i8, i8 addrspace(4)* %55, align 1, !tbaa !9
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 32
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 5
  %61 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !9
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 40
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 6
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !9
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 48
  %69 = or i64 %64, %68
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 7
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !9
  %72 = zext i8 %71 to i64
  %73 = shl nuw i64 %72, 56
  %74 = or i64 %69, %73
  %75 = add nsw i32 %32, -8
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 8
  br label %90

77:                                               ; preds = %35, %77
  %78 = phi i32 [ %88, %77 ], [ 0, %35 ]
  %79 = phi i64 [ %87, %77 ], [ 0, %35 ]
  %80 = zext i32 %78 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 %80
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !9
  %83 = zext i8 %82 to i64
  %84 = shl i32 %78, 3
  %85 = zext i32 %84 to i64
  %86 = shl nuw i64 %83, %85
  %87 = or i64 %86, %79
  %88 = add nuw nsw i32 %78, 1
  %89 = icmp eq i32 %88, %32
  br i1 %89, label %90, label %77, !llvm.loop !10

90:                                               ; preds = %77, %37, %35
  %91 = phi i8 addrspace(4)* [ %76, %37 ], [ %24, %35 ], [ %24, %77 ]
  %92 = phi i32 [ %75, %37 ], [ 0, %35 ], [ 0, %77 ]
  %93 = phi i64 [ %74, %37 ], [ 0, %35 ], [ %87, %77 ]
  %94 = icmp ugt i32 %92, 7
  br i1 %94, label %97, label %95

95:                                               ; preds = %90
  %96 = icmp eq i32 %92, 0
  br i1 %96, label %150, label %137

97:                                               ; preds = %90
  %98 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !9
  %99 = zext i8 %98 to i64
  %100 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 1
  %101 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !9
  %102 = zext i8 %101 to i64
  %103 = shl nuw nsw i64 %102, 8
  %104 = or i64 %103, %99
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 2
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !9
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 16
  %109 = or i64 %104, %108
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 3
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !9
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 24
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 4
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !9
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 32
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 5
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !9
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 40
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 6
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !9
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 48
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 7
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !9
  %132 = zext i8 %131 to i64
  %133 = shl nuw i64 %132, 56
  %134 = or i64 %129, %133
  %135 = add nsw i32 %92, -8
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 8
  br label %150

137:                                              ; preds = %95, %137
  %138 = phi i32 [ %148, %137 ], [ 0, %95 ]
  %139 = phi i64 [ %147, %137 ], [ 0, %95 ]
  %140 = zext i32 %138 to i64
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %91, i64 %140
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !9
  %143 = zext i8 %142 to i64
  %144 = shl i32 %138, 3
  %145 = zext i32 %144 to i64
  %146 = shl nuw i64 %143, %145
  %147 = or i64 %146, %139
  %148 = add nuw nsw i32 %138, 1
  %149 = icmp eq i32 %148, %92
  br i1 %149, label %150, label %137

150:                                              ; preds = %137, %97, %95
  %151 = phi i8 addrspace(4)* [ %136, %97 ], [ %91, %95 ], [ %91, %137 ]
  %152 = phi i32 [ %135, %97 ], [ 0, %95 ], [ 0, %137 ]
  %153 = phi i64 [ %134, %97 ], [ 0, %95 ], [ %147, %137 ]
  %154 = icmp ugt i32 %152, 7
  br i1 %154, label %157, label %155

155:                                              ; preds = %150
  %156 = icmp eq i32 %152, 0
  br i1 %156, label %210, label %197

157:                                              ; preds = %150
  %158 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !9
  %159 = zext i8 %158 to i64
  %160 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 1
  %161 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !9
  %162 = zext i8 %161 to i64
  %163 = shl nuw nsw i64 %162, 8
  %164 = or i64 %163, %159
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 2
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !9
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 16
  %169 = or i64 %164, %168
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 3
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !9
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 24
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 4
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !9
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 32
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 5
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !9
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 40
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 6
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !9
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 48
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 7
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !9
  %192 = zext i8 %191 to i64
  %193 = shl nuw i64 %192, 56
  %194 = or i64 %189, %193
  %195 = add nsw i32 %152, -8
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 8
  br label %210

197:                                              ; preds = %155, %197
  %198 = phi i32 [ %208, %197 ], [ 0, %155 ]
  %199 = phi i64 [ %207, %197 ], [ 0, %155 ]
  %200 = zext i32 %198 to i64
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %151, i64 %200
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !9
  %203 = zext i8 %202 to i64
  %204 = shl i32 %198, 3
  %205 = zext i32 %204 to i64
  %206 = shl nuw i64 %203, %205
  %207 = or i64 %206, %199
  %208 = add nuw nsw i32 %198, 1
  %209 = icmp eq i32 %208, %152
  br i1 %209, label %210, label %197

210:                                              ; preds = %197, %157, %155
  %211 = phi i8 addrspace(4)* [ %196, %157 ], [ %151, %155 ], [ %151, %197 ]
  %212 = phi i32 [ %195, %157 ], [ 0, %155 ], [ 0, %197 ]
  %213 = phi i64 [ %194, %157 ], [ 0, %155 ], [ %207, %197 ]
  %214 = icmp ugt i32 %212, 7
  br i1 %214, label %217, label %215

215:                                              ; preds = %210
  %216 = icmp eq i32 %212, 0
  br i1 %216, label %270, label %257

217:                                              ; preds = %210
  %218 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !9
  %219 = zext i8 %218 to i64
  %220 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 1
  %221 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !9
  %222 = zext i8 %221 to i64
  %223 = shl nuw nsw i64 %222, 8
  %224 = or i64 %223, %219
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 2
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !9
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 16
  %229 = or i64 %224, %228
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 3
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !9
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 24
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 4
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !9
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 32
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 5
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !9
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 40
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 6
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !9
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 48
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 7
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !9
  %252 = zext i8 %251 to i64
  %253 = shl nuw i64 %252, 56
  %254 = or i64 %249, %253
  %255 = add nsw i32 %212, -8
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 8
  br label %270

257:                                              ; preds = %215, %257
  %258 = phi i32 [ %268, %257 ], [ 0, %215 ]
  %259 = phi i64 [ %267, %257 ], [ 0, %215 ]
  %260 = zext i32 %258 to i64
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %211, i64 %260
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !9
  %263 = zext i8 %262 to i64
  %264 = shl i32 %258, 3
  %265 = zext i32 %264 to i64
  %266 = shl nuw i64 %263, %265
  %267 = or i64 %266, %259
  %268 = add nuw nsw i32 %258, 1
  %269 = icmp eq i32 %268, %212
  br i1 %269, label %270, label %257

270:                                              ; preds = %257, %217, %215
  %271 = phi i8 addrspace(4)* [ %256, %217 ], [ %211, %215 ], [ %211, %257 ]
  %272 = phi i32 [ %255, %217 ], [ 0, %215 ], [ 0, %257 ]
  %273 = phi i64 [ %254, %217 ], [ 0, %215 ], [ %267, %257 ]
  %274 = icmp ugt i32 %272, 7
  br i1 %274, label %277, label %275

275:                                              ; preds = %270
  %276 = icmp eq i32 %272, 0
  br i1 %276, label %330, label %317

277:                                              ; preds = %270
  %278 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !9
  %279 = zext i8 %278 to i64
  %280 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 1
  %281 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !9
  %282 = zext i8 %281 to i64
  %283 = shl nuw nsw i64 %282, 8
  %284 = or i64 %283, %279
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 2
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !9
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 16
  %289 = or i64 %284, %288
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 3
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !9
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 24
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 4
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !9
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 32
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 5
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !9
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 40
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 6
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !9
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 48
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 7
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !9
  %312 = zext i8 %311 to i64
  %313 = shl nuw i64 %312, 56
  %314 = or i64 %309, %313
  %315 = add nsw i32 %272, -8
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 8
  br label %330

317:                                              ; preds = %275, %317
  %318 = phi i32 [ %328, %317 ], [ 0, %275 ]
  %319 = phi i64 [ %327, %317 ], [ 0, %275 ]
  %320 = zext i32 %318 to i64
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %271, i64 %320
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !9
  %323 = zext i8 %322 to i64
  %324 = shl i32 %318, 3
  %325 = zext i32 %324 to i64
  %326 = shl nuw i64 %323, %325
  %327 = or i64 %326, %319
  %328 = add nuw nsw i32 %318, 1
  %329 = icmp eq i32 %328, %272
  br i1 %329, label %330, label %317

330:                                              ; preds = %317, %277, %275
  %331 = phi i8 addrspace(4)* [ %316, %277 ], [ %271, %275 ], [ %271, %317 ]
  %332 = phi i32 [ %315, %277 ], [ 0, %275 ], [ 0, %317 ]
  %333 = phi i64 [ %314, %277 ], [ 0, %275 ], [ %327, %317 ]
  %334 = icmp ugt i32 %332, 7
  br i1 %334, label %337, label %335

335:                                              ; preds = %330
  %336 = icmp eq i32 %332, 0
  br i1 %336, label %390, label %377

337:                                              ; preds = %330
  %338 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !9
  %339 = zext i8 %338 to i64
  %340 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 1
  %341 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !9
  %342 = zext i8 %341 to i64
  %343 = shl nuw nsw i64 %342, 8
  %344 = or i64 %343, %339
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 2
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !9
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 16
  %349 = or i64 %344, %348
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 3
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !9
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 24
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 4
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !9
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 32
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 5
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !9
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 40
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 6
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !9
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 48
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 7
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !9
  %372 = zext i8 %371 to i64
  %373 = shl nuw i64 %372, 56
  %374 = or i64 %369, %373
  %375 = add nsw i32 %332, -8
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 8
  br label %390

377:                                              ; preds = %335, %377
  %378 = phi i32 [ %388, %377 ], [ 0, %335 ]
  %379 = phi i64 [ %387, %377 ], [ 0, %335 ]
  %380 = zext i32 %378 to i64
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %331, i64 %380
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !9
  %383 = zext i8 %382 to i64
  %384 = shl i32 %378, 3
  %385 = zext i32 %384 to i64
  %386 = shl nuw i64 %383, %385
  %387 = or i64 %386, %379
  %388 = add nuw nsw i32 %378, 1
  %389 = icmp eq i32 %388, %332
  br i1 %389, label %390, label %377

390:                                              ; preds = %377, %337, %335
  %391 = phi i8 addrspace(4)* [ %376, %337 ], [ %331, %335 ], [ %331, %377 ]
  %392 = phi i32 [ %375, %337 ], [ 0, %335 ], [ 0, %377 ]
  %393 = phi i64 [ %374, %337 ], [ 0, %335 ], [ %387, %377 ]
  %394 = icmp ugt i32 %392, 7
  br i1 %394, label %397, label %395

395:                                              ; preds = %390
  %396 = icmp eq i32 %392, 0
  br i1 %396, label %448, label %435

397:                                              ; preds = %390
  %398 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !9
  %399 = zext i8 %398 to i64
  %400 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 1
  %401 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !9
  %402 = zext i8 %401 to i64
  %403 = shl nuw nsw i64 %402, 8
  %404 = or i64 %403, %399
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 2
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !9
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 16
  %409 = or i64 %404, %408
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 3
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !9
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 24
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 4
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !9
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 32
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 5
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !9
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 40
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 6
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !9
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 48
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 7
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !9
  %432 = zext i8 %431 to i64
  %433 = shl nuw i64 %432, 56
  %434 = or i64 %429, %433
  br label %448

435:                                              ; preds = %395, %435
  %436 = phi i32 [ %446, %435 ], [ 0, %395 ]
  %437 = phi i64 [ %445, %435 ], [ 0, %395 ]
  %438 = zext i32 %436 to i64
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %391, i64 %438
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !9
  %441 = zext i8 %440 to i64
  %442 = shl i32 %436, 3
  %443 = zext i32 %442 to i64
  %444 = shl nuw i64 %441, %443
  %445 = or i64 %444, %437
  %446 = add nuw nsw i32 %436, 1
  %447 = icmp eq i32 %446, %392
  br i1 %447, label %448, label %435

448:                                              ; preds = %435, %397, %395
  %449 = phi i64 [ %434, %397 ], [ 0, %395 ], [ %445, %435 ]
  %450 = shl nuw nsw i64 %31, 2
  %451 = add nuw nsw i64 %450, 28
  %452 = and i64 %451, 480
  %453 = and i64 %33, -225
  %454 = or i64 %453, %452
  %455 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %454, i64 noundef %93, i64 noundef %153, i64 noundef %213, i64 noundef %273, i64 noundef %333, i64 noundef %393, i64 noundef %449) #10
  %456 = sub i64 %23, %31
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 %31
  %458 = icmp eq i64 %456, 0
  br i1 %458, label %459, label %22

459:                                              ; preds = %448, %15, %0
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !12
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !14
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !14
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !16
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !14
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !14
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !12
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !17
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !20
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !17
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !20
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !17
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !20
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !12
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !21
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !20
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !12
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !12
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !12
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !14
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !5
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !5
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !5
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !5
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !5
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !5
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !5
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !5
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %110 = call i64 @llvm.read_register.i64(metadata !22) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !23
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !25
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !26
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !17
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !20
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !27
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !27
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !28
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !30
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !12
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !12
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !12
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !14
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !14
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !20
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !17
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !27
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !27
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
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !7, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !7, i64 0}
!16 = !{i64 2662}
!17 = !{!18, !13, i64 0}
!18 = !{!"", !13, i64 0, !13, i64 8, !19, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!19 = !{!"hsa_signal_s", !6, i64 0}
!20 = !{!18, !6, i64 40}
!21 = !{!18, !13, i64 8}
!22 = !{!"exec"}
!23 = !{!24, !15, i64 16}
!24 = !{!"", !6, i64 0, !6, i64 8, !15, i64 16, !15, i64 20}
!25 = !{!24, !6, i64 8}
!26 = !{!24, !15, i64 20}
!27 = !{!24, !6, i64 0}
!28 = !{!29, !6, i64 16}
!29 = !{!"amd_signal_s", !6, i64 0, !7, i64 8, !6, i64 16, !15, i64 24, !15, i64 28, !6, i64 32, !6, i64 40, !7, i64 48, !7, i64 56}
!30 = !{!29, !15, i64 24}
