; ModuleID = '../data/hip_kernels/8919/1/main.cu'
source_filename = "../data/hip_kernels/8919/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [41 x i8] c"thread id %d , warp Id %d , block id %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9addKernelPiPKiS1_(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = lshr i32 %4, 6
  %14 = icmp ult i32 %12, 524799
  br i1 %14, label %15, label %492

15:                                               ; preds = %3
  %16 = zext i32 %12 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %16
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = add nsw i32 %20, %18
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  store i32 %21, i32 addrspace(1)* %22, align 4, !tbaa !7
  %23 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %23, i64 24
  %25 = bitcast i8 addrspace(4)* %24 to i64 addrspace(4)*
  %26 = load i64, i64 addrspace(4)* %25, align 8, !tbaa !11
  %27 = inttoptr i64 %26 to i8 addrspace(1)*
  %28 = addrspacecast i8 addrspace(1)* %27 to i8*
  %29 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %30 = extractelement <2 x i64> %29, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %31, label %35

31:                                               ; preds = %15
  %32 = and i64 %30, -225
  %33 = or i64 %32, 32
  %34 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %476

35:                                               ; preds = %15
  %36 = and i64 %30, 2
  %37 = and i64 %30, -3
  %38 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %37, i64 0
  br label %39

39:                                               ; preds = %465, %35
  %40 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str, i64 0, i64 40) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([41 x i8]* addrspacecast ([41 x i8] addrspace(4)* @.str to [41 x i8]*) to i64)), i64 1))), %35 ], [ %473, %465 ]
  %41 = phi i8 addrspace(4)* [ getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str, i64 0, i64 0), %35 ], [ %474, %465 ]
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
  %55 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !15
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 1
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !15
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 8
  %61 = or i64 %60, %56
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 2
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !15
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 16
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 3
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !15
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 24
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 4
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !15
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 32
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 5
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !15
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 40
  %81 = or i64 %76, %80
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 6
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !15
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 48
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %41, i64 7
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !15
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
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !15
  %100 = zext i8 %99 to i64
  %101 = shl i32 %95, 3
  %102 = zext i32 %101 to i64
  %103 = shl nuw i64 %100, %102
  %104 = or i64 %103, %96
  %105 = add nuw nsw i32 %95, 1
  %106 = icmp eq i32 %105, %49
  br i1 %106, label %107, label %94, !llvm.loop !16

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
  %115 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !15
  %116 = zext i8 %115 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 1
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !15
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 8
  %121 = or i64 %120, %116
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 2
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !15
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 16
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 3
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !15
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 24
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 4
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !15
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 32
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 5
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !15
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 40
  %141 = or i64 %136, %140
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 6
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !15
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 48
  %146 = or i64 %141, %145
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %108, i64 7
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !15
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
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !15
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
  %175 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !15
  %176 = zext i8 %175 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 1
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !15
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 8
  %181 = or i64 %180, %176
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 2
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !15
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 16
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 3
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !15
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 24
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 4
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !15
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 32
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 5
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !15
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 40
  %201 = or i64 %196, %200
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 6
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !15
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 48
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %168, i64 7
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !15
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
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !15
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
  %235 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !15
  %236 = zext i8 %235 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 1
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !15
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 8
  %241 = or i64 %240, %236
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 2
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !15
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 16
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 3
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !15
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 24
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 4
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !15
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 32
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 5
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !15
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 40
  %261 = or i64 %256, %260
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 6
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !15
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 48
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %228, i64 7
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !15
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
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !15
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
  %295 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !15
  %296 = zext i8 %295 to i64
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 1
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !15
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 8
  %301 = or i64 %300, %296
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 2
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !15
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 16
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 3
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !15
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 24
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 4
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !15
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 32
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 5
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !15
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 40
  %321 = or i64 %316, %320
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 6
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !15
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 48
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %288, i64 7
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !15
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
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !15
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
  %355 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !15
  %356 = zext i8 %355 to i64
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 1
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !15
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 8
  %361 = or i64 %360, %356
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 2
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !15
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 16
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 3
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !15
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 24
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 4
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !15
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 32
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 5
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !15
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 40
  %381 = or i64 %376, %380
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 6
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !15
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 48
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %348, i64 7
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !15
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
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !15
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
  %415 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !15
  %416 = zext i8 %415 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 1
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !15
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 8
  %421 = or i64 %420, %416
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 2
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !15
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 16
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 3
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !15
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 24
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 4
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !15
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 32
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 5
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !15
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 40
  %441 = or i64 %436, %440
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 6
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !15
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 48
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 7
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !15
  %449 = zext i8 %448 to i64
  %450 = shl nuw i64 %449, 56
  %451 = or i64 %446, %450
  br label %465

452:                                              ; preds = %412, %452
  %453 = phi i32 [ %463, %452 ], [ 0, %412 ]
  %454 = phi i64 [ %462, %452 ], [ 0, %412 ]
  %455 = zext i32 %453 to i64
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %408, i64 %455
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !15
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
  %479 = and i64 %478, -225
  %480 = or i64 %479, 32
  %481 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %480, i64 noundef %16, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %482 = extractelement <2 x i64> %481, i64 0
  %483 = zext i32 %13 to i64
  %484 = and i64 %482, -225
  %485 = or i64 %484, 32
  %486 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %485, i64 noundef %483, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %487 = extractelement <2 x i64> %486, i64 0
  %488 = zext i32 %10 to i64
  %489 = and i64 %487, -227
  %490 = or i64 %489, 34
  %491 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %28, i64 noundef %490, i64 noundef %488, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %492

492:                                              ; preds = %476, %3
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !13, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !13, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!25 = !{!"hsa_signal_s", !12, i64 0}
!26 = !{!24, !12, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !12, i64 0, !12, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !12, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !12, i64 0}
!34 = !{!35, !12, i64 16}
!35 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !21, i64 24, !21, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!36 = !{!35, !21, i64 24}
