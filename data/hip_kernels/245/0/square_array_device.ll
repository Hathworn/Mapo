; ModuleID = '../data/hip_kernels/245/0/main.cu'
source_filename = "../data/hip_kernels/245/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [18 x i8] c"idx = %d, a = %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z12square_arrayPdi(double addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = icmp slt i32 %11, %1
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds double, double addrspace(1)* %0, i64 %13
  br i1 %12, label %18, label %15

15:                                               ; preds = %2
  %16 = bitcast double addrspace(1)* %14 to i64 addrspace(1)*
  %17 = load i64, i64 addrspace(1)* %16, align 8, !tbaa !7
  br label %22

18:                                               ; preds = %2
  %19 = load double, double addrspace(1)* %14, align 8, !tbaa !7, !amdgpu.noclobber !5
  %20 = fmul contract double %19, %19
  store double %20, double addrspace(1)* %14, align 8, !tbaa !7
  %21 = bitcast double %20 to i64
  br label %22

22:                                               ; preds = %15, %18
  %23 = phi i64 [ %17, %15 ], [ %21, %18 ]
  %24 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %25 = getelementptr inbounds i8, i8 addrspace(4)* %24, i64 24
  %26 = bitcast i8 addrspace(4)* %25 to i64 addrspace(4)*
  %27 = load i64, i64 addrspace(4)* %26, align 8, !tbaa !11
  %28 = inttoptr i64 %27 to i8 addrspace(1)*
  %29 = addrspacecast i8 addrspace(1)* %28 to i8*
  %30 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %29, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %31 = extractelement <2 x i64> %30, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %32, label %36

32:                                               ; preds = %22
  %33 = and i64 %31, -225
  %34 = or i64 %33, 32
  %35 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %29, i64 noundef %34, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %477

36:                                               ; preds = %22
  %37 = and i64 %31, 2
  %38 = and i64 %31, -3
  %39 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %38, i64 0
  br label %40

40:                                               ; preds = %466, %36
  %41 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 17) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([18 x i8]* addrspacecast ([18 x i8] addrspace(4)* @.str to [18 x i8]*) to i64)), i64 1))), %36 ], [ %474, %466 ]
  %42 = phi i8 addrspace(4)* [ getelementptr inbounds ([18 x i8], [18 x i8] addrspace(4)* @.str, i64 0, i64 0), %36 ], [ %475, %466 ]
  %43 = phi <2 x i64> [ %39, %36 ], [ %473, %466 ]
  %44 = icmp ugt i64 %41, 56
  %45 = extractelement <2 x i64> %43, i64 0
  %46 = or i64 %45, %37
  %47 = insertelement <2 x i64> poison, i64 %46, i64 0
  %48 = select i1 %44, <2 x i64> %43, <2 x i64> %47
  %49 = tail call i64 @llvm.umin.i64(i64 %41, i64 56)
  %50 = trunc i64 %49 to i32
  %51 = extractelement <2 x i64> %48, i64 0
  %52 = icmp ugt i32 %50, 7
  br i1 %52, label %55, label %53

53:                                               ; preds = %40
  %54 = icmp eq i32 %50, 0
  br i1 %54, label %108, label %95

55:                                               ; preds = %40
  %56 = load i8, i8 addrspace(4)* %42, align 1, !tbaa !15
  %57 = zext i8 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 1
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !15
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 8
  %62 = or i64 %61, %57
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 2
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !15
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 16
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 3
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !15
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 24
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 4
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !15
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 32
  %77 = or i64 %72, %76
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 5
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !15
  %80 = zext i8 %79 to i64
  %81 = shl nuw nsw i64 %80, 40
  %82 = or i64 %77, %81
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 6
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !15
  %85 = zext i8 %84 to i64
  %86 = shl nuw nsw i64 %85, 48
  %87 = or i64 %82, %86
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 7
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !15
  %90 = zext i8 %89 to i64
  %91 = shl nuw i64 %90, 56
  %92 = or i64 %87, %91
  %93 = add nsw i32 %50, -8
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 8
  br label %108

95:                                               ; preds = %53, %95
  %96 = phi i32 [ %106, %95 ], [ 0, %53 ]
  %97 = phi i64 [ %105, %95 ], [ 0, %53 ]
  %98 = zext i32 %96 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 %98
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !15
  %101 = zext i8 %100 to i64
  %102 = shl i32 %96, 3
  %103 = zext i32 %102 to i64
  %104 = shl nuw i64 %101, %103
  %105 = or i64 %104, %97
  %106 = add nuw nsw i32 %96, 1
  %107 = icmp eq i32 %106, %50
  br i1 %107, label %108, label %95, !llvm.loop !16

108:                                              ; preds = %95, %55, %53
  %109 = phi i8 addrspace(4)* [ %94, %55 ], [ %42, %53 ], [ %42, %95 ]
  %110 = phi i32 [ %93, %55 ], [ 0, %53 ], [ 0, %95 ]
  %111 = phi i64 [ %92, %55 ], [ 0, %53 ], [ %105, %95 ]
  %112 = icmp ugt i32 %110, 7
  br i1 %112, label %115, label %113

113:                                              ; preds = %108
  %114 = icmp eq i32 %110, 0
  br i1 %114, label %168, label %155

115:                                              ; preds = %108
  %116 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !15
  %117 = zext i8 %116 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 1
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !15
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 8
  %122 = or i64 %121, %117
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 2
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !15
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 16
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 3
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !15
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 24
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 4
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !15
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 32
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 5
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !15
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 40
  %142 = or i64 %137, %141
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 6
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !15
  %145 = zext i8 %144 to i64
  %146 = shl nuw nsw i64 %145, 48
  %147 = or i64 %142, %146
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 7
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !15
  %150 = zext i8 %149 to i64
  %151 = shl nuw i64 %150, 56
  %152 = or i64 %147, %151
  %153 = add nsw i32 %110, -8
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 8
  br label %168

155:                                              ; preds = %113, %155
  %156 = phi i32 [ %166, %155 ], [ 0, %113 ]
  %157 = phi i64 [ %165, %155 ], [ 0, %113 ]
  %158 = zext i32 %156 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %109, i64 %158
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !15
  %161 = zext i8 %160 to i64
  %162 = shl i32 %156, 3
  %163 = zext i32 %162 to i64
  %164 = shl nuw i64 %161, %163
  %165 = or i64 %164, %157
  %166 = add nuw nsw i32 %156, 1
  %167 = icmp eq i32 %166, %110
  br i1 %167, label %168, label %155

168:                                              ; preds = %155, %115, %113
  %169 = phi i8 addrspace(4)* [ %154, %115 ], [ %109, %113 ], [ %109, %155 ]
  %170 = phi i32 [ %153, %115 ], [ 0, %113 ], [ 0, %155 ]
  %171 = phi i64 [ %152, %115 ], [ 0, %113 ], [ %165, %155 ]
  %172 = icmp ugt i32 %170, 7
  br i1 %172, label %175, label %173

173:                                              ; preds = %168
  %174 = icmp eq i32 %170, 0
  br i1 %174, label %228, label %215

175:                                              ; preds = %168
  %176 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !15
  %177 = zext i8 %176 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 1
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !15
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 8
  %182 = or i64 %181, %177
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 2
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !15
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 16
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 3
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !15
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 24
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 4
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !15
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 32
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 5
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !15
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 40
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 6
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !15
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 48
  %207 = or i64 %202, %206
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 7
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !15
  %210 = zext i8 %209 to i64
  %211 = shl nuw i64 %210, 56
  %212 = or i64 %207, %211
  %213 = add nsw i32 %170, -8
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 8
  br label %228

215:                                              ; preds = %173, %215
  %216 = phi i32 [ %226, %215 ], [ 0, %173 ]
  %217 = phi i64 [ %225, %215 ], [ 0, %173 ]
  %218 = zext i32 %216 to i64
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %169, i64 %218
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !15
  %221 = zext i8 %220 to i64
  %222 = shl i32 %216, 3
  %223 = zext i32 %222 to i64
  %224 = shl nuw i64 %221, %223
  %225 = or i64 %224, %217
  %226 = add nuw nsw i32 %216, 1
  %227 = icmp eq i32 %226, %170
  br i1 %227, label %228, label %215

228:                                              ; preds = %215, %175, %173
  %229 = phi i8 addrspace(4)* [ %214, %175 ], [ %169, %173 ], [ %169, %215 ]
  %230 = phi i32 [ %213, %175 ], [ 0, %173 ], [ 0, %215 ]
  %231 = phi i64 [ %212, %175 ], [ 0, %173 ], [ %225, %215 ]
  %232 = icmp ugt i32 %230, 7
  br i1 %232, label %235, label %233

233:                                              ; preds = %228
  %234 = icmp eq i32 %230, 0
  br i1 %234, label %288, label %275

235:                                              ; preds = %228
  %236 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !15
  %237 = zext i8 %236 to i64
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 1
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !15
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 8
  %242 = or i64 %241, %237
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 2
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !15
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 16
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 3
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !15
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 24
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 4
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !15
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 32
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 5
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !15
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 40
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 6
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !15
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 48
  %267 = or i64 %262, %266
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 7
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !15
  %270 = zext i8 %269 to i64
  %271 = shl nuw i64 %270, 56
  %272 = or i64 %267, %271
  %273 = add nsw i32 %230, -8
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 8
  br label %288

275:                                              ; preds = %233, %275
  %276 = phi i32 [ %286, %275 ], [ 0, %233 ]
  %277 = phi i64 [ %285, %275 ], [ 0, %233 ]
  %278 = zext i32 %276 to i64
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %229, i64 %278
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !15
  %281 = zext i8 %280 to i64
  %282 = shl i32 %276, 3
  %283 = zext i32 %282 to i64
  %284 = shl nuw i64 %281, %283
  %285 = or i64 %284, %277
  %286 = add nuw nsw i32 %276, 1
  %287 = icmp eq i32 %286, %230
  br i1 %287, label %288, label %275

288:                                              ; preds = %275, %235, %233
  %289 = phi i8 addrspace(4)* [ %274, %235 ], [ %229, %233 ], [ %229, %275 ]
  %290 = phi i32 [ %273, %235 ], [ 0, %233 ], [ 0, %275 ]
  %291 = phi i64 [ %272, %235 ], [ 0, %233 ], [ %285, %275 ]
  %292 = icmp ugt i32 %290, 7
  br i1 %292, label %295, label %293

293:                                              ; preds = %288
  %294 = icmp eq i32 %290, 0
  br i1 %294, label %348, label %335

295:                                              ; preds = %288
  %296 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !15
  %297 = zext i8 %296 to i64
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 1
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !15
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 8
  %302 = or i64 %301, %297
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 2
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !15
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 16
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 3
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !15
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 24
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 4
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !15
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 32
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 5
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !15
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 40
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 6
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !15
  %325 = zext i8 %324 to i64
  %326 = shl nuw nsw i64 %325, 48
  %327 = or i64 %322, %326
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 7
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !15
  %330 = zext i8 %329 to i64
  %331 = shl nuw i64 %330, 56
  %332 = or i64 %327, %331
  %333 = add nsw i32 %290, -8
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 8
  br label %348

335:                                              ; preds = %293, %335
  %336 = phi i32 [ %346, %335 ], [ 0, %293 ]
  %337 = phi i64 [ %345, %335 ], [ 0, %293 ]
  %338 = zext i32 %336 to i64
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %289, i64 %338
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !15
  %341 = zext i8 %340 to i64
  %342 = shl i32 %336, 3
  %343 = zext i32 %342 to i64
  %344 = shl nuw i64 %341, %343
  %345 = or i64 %344, %337
  %346 = add nuw nsw i32 %336, 1
  %347 = icmp eq i32 %346, %290
  br i1 %347, label %348, label %335

348:                                              ; preds = %335, %295, %293
  %349 = phi i8 addrspace(4)* [ %334, %295 ], [ %289, %293 ], [ %289, %335 ]
  %350 = phi i32 [ %333, %295 ], [ 0, %293 ], [ 0, %335 ]
  %351 = phi i64 [ %332, %295 ], [ 0, %293 ], [ %345, %335 ]
  %352 = icmp ugt i32 %350, 7
  br i1 %352, label %355, label %353

353:                                              ; preds = %348
  %354 = icmp eq i32 %350, 0
  br i1 %354, label %408, label %395

355:                                              ; preds = %348
  %356 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !15
  %357 = zext i8 %356 to i64
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 1
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !15
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 8
  %362 = or i64 %361, %357
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 2
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !15
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 16
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 3
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !15
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 24
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 4
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !15
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 32
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 5
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !15
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 40
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 6
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !15
  %385 = zext i8 %384 to i64
  %386 = shl nuw nsw i64 %385, 48
  %387 = or i64 %382, %386
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 7
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !15
  %390 = zext i8 %389 to i64
  %391 = shl nuw i64 %390, 56
  %392 = or i64 %387, %391
  %393 = add nsw i32 %350, -8
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 8
  br label %408

395:                                              ; preds = %353, %395
  %396 = phi i32 [ %406, %395 ], [ 0, %353 ]
  %397 = phi i64 [ %405, %395 ], [ 0, %353 ]
  %398 = zext i32 %396 to i64
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %349, i64 %398
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !15
  %401 = zext i8 %400 to i64
  %402 = shl i32 %396, 3
  %403 = zext i32 %402 to i64
  %404 = shl nuw i64 %401, %403
  %405 = or i64 %404, %397
  %406 = add nuw nsw i32 %396, 1
  %407 = icmp eq i32 %406, %350
  br i1 %407, label %408, label %395

408:                                              ; preds = %395, %355, %353
  %409 = phi i8 addrspace(4)* [ %394, %355 ], [ %349, %353 ], [ %349, %395 ]
  %410 = phi i32 [ %393, %355 ], [ 0, %353 ], [ 0, %395 ]
  %411 = phi i64 [ %392, %355 ], [ 0, %353 ], [ %405, %395 ]
  %412 = icmp ugt i32 %410, 7
  br i1 %412, label %415, label %413

413:                                              ; preds = %408
  %414 = icmp eq i32 %410, 0
  br i1 %414, label %466, label %453

415:                                              ; preds = %408
  %416 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !15
  %417 = zext i8 %416 to i64
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 1
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !15
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 8
  %422 = or i64 %421, %417
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 2
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !15
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 16
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 3
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !15
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 24
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 4
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !15
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 32
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 5
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !15
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 40
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 6
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !15
  %445 = zext i8 %444 to i64
  %446 = shl nuw nsw i64 %445, 48
  %447 = or i64 %442, %446
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 7
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !15
  %450 = zext i8 %449 to i64
  %451 = shl nuw i64 %450, 56
  %452 = or i64 %447, %451
  br label %466

453:                                              ; preds = %413, %453
  %454 = phi i32 [ %464, %453 ], [ 0, %413 ]
  %455 = phi i64 [ %463, %453 ], [ 0, %413 ]
  %456 = zext i32 %454 to i64
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %409, i64 %456
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !15
  %459 = zext i8 %458 to i64
  %460 = shl i32 %454, 3
  %461 = zext i32 %460 to i64
  %462 = shl nuw i64 %459, %461
  %463 = or i64 %462, %455
  %464 = add nuw nsw i32 %454, 1
  %465 = icmp eq i32 %464, %410
  br i1 %465, label %466, label %453

466:                                              ; preds = %453, %415, %413
  %467 = phi i64 [ %452, %415 ], [ 0, %413 ], [ %463, %453 ]
  %468 = shl nuw nsw i64 %49, 2
  %469 = add nuw nsw i64 %468, 28
  %470 = and i64 %469, 480
  %471 = and i64 %51, -225
  %472 = or i64 %471, %470
  %473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %29, i64 noundef %472, i64 noundef %111, i64 noundef %171, i64 noundef %231, i64 noundef %291, i64 noundef %351, i64 noundef %411, i64 noundef %467) #10
  %474 = sub i64 %41, %49
  %475 = getelementptr inbounds i8, i8 addrspace(4)* %42, i64 %49
  %476 = icmp eq i64 %474, 0
  br i1 %476, label %477, label %40

477:                                              ; preds = %466, %32
  %478 = phi <2 x i64> [ %35, %32 ], [ %473, %466 ]
  %479 = extractelement <2 x i64> %478, i64 0
  %480 = zext i32 %11 to i64
  %481 = and i64 %479, -225
  %482 = or i64 %481, 32
  %483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %29, i64 noundef %482, i64 noundef %480, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %484 = extractelement <2 x i64> %483, i64 0
  %485 = and i64 %484, -227
  %486 = or i64 %485, 34
  %487 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %29, i64 noundef %486, i64 noundef %23, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
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
