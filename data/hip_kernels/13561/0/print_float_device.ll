; ModuleID = '../data/hip_kernels/13561/0/main.cu'
source_filename = "../data/hip_kernels/13561/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [4 x i8] c"%f,\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11print_floatPfi(float addrspace(1)* nocapture readonly %0, i32 %1) local_unnamed_addr #1 {
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
  br i1 %12, label %13, label %478

13:                                               ; preds = %2
  %14 = sext i32 %11 to i64
  %15 = getelementptr inbounds float, float addrspace(1)* %0, i64 %14
  %16 = load float, float addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !5
  %17 = fpext float %16 to double
  %18 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 24
  %20 = bitcast i8 addrspace(4)* %19 to i64 addrspace(4)*
  %21 = load i64, i64 addrspace(4)* %20, align 8, !tbaa !11
  %22 = inttoptr i64 %21 to i8 addrspace(1)*
  %23 = addrspacecast i8 addrspace(1)* %22 to i8*
  %24 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %25 = extractelement <2 x i64> %24, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %26, label %30

26:                                               ; preds = %13
  %27 = and i64 %25, -225
  %28 = or i64 %27, 32
  %29 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %28, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %471

30:                                               ; preds = %13
  %31 = and i64 %25, 2
  %32 = and i64 %25, -3
  %33 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %32, i64 0
  br label %34

34:                                               ; preds = %460, %30
  %35 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 3) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([4 x i8]* addrspacecast ([4 x i8] addrspace(4)* @.str to [4 x i8]*) to i64)), i64 1))), %30 ], [ %468, %460 ]
  %36 = phi i8 addrspace(4)* [ getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0), %30 ], [ %469, %460 ]
  %37 = phi <2 x i64> [ %33, %30 ], [ %467, %460 ]
  %38 = icmp ugt i64 %35, 56
  %39 = extractelement <2 x i64> %37, i64 0
  %40 = or i64 %39, %31
  %41 = insertelement <2 x i64> poison, i64 %40, i64 0
  %42 = select i1 %38, <2 x i64> %37, <2 x i64> %41
  %43 = tail call i64 @llvm.umin.i64(i64 %35, i64 56)
  %44 = trunc i64 %43 to i32
  %45 = extractelement <2 x i64> %42, i64 0
  %46 = icmp ugt i32 %44, 7
  br i1 %46, label %49, label %47

47:                                               ; preds = %34
  %48 = icmp eq i32 %44, 0
  br i1 %48, label %102, label %89

49:                                               ; preds = %34
  %50 = load i8, i8 addrspace(4)* %36, align 1, !tbaa !15
  %51 = zext i8 %50 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 1
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !15
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 8
  %56 = or i64 %55, %51
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 2
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !15
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 16
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 3
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !15
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 24
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 4
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !15
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 32
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 5
  %73 = load i8, i8 addrspace(4)* %72, align 1, !tbaa !15
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 40
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 6
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !15
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 48
  %81 = or i64 %76, %80
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 7
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !15
  %84 = zext i8 %83 to i64
  %85 = shl nuw i64 %84, 56
  %86 = or i64 %81, %85
  %87 = add nsw i32 %44, -8
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 8
  br label %102

89:                                               ; preds = %47, %89
  %90 = phi i32 [ %100, %89 ], [ 0, %47 ]
  %91 = phi i64 [ %99, %89 ], [ 0, %47 ]
  %92 = zext i32 %90 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 %92
  %94 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !15
  %95 = zext i8 %94 to i64
  %96 = shl i32 %90, 3
  %97 = zext i32 %96 to i64
  %98 = shl nuw i64 %95, %97
  %99 = or i64 %98, %91
  %100 = add nuw nsw i32 %90, 1
  %101 = icmp eq i32 %100, %44
  br i1 %101, label %102, label %89, !llvm.loop !16

102:                                              ; preds = %89, %49, %47
  %103 = phi i8 addrspace(4)* [ %88, %49 ], [ %36, %47 ], [ %36, %89 ]
  %104 = phi i32 [ %87, %49 ], [ 0, %47 ], [ 0, %89 ]
  %105 = phi i64 [ %86, %49 ], [ 0, %47 ], [ %99, %89 ]
  %106 = icmp ugt i32 %104, 7
  br i1 %106, label %109, label %107

107:                                              ; preds = %102
  %108 = icmp eq i32 %104, 0
  br i1 %108, label %162, label %149

109:                                              ; preds = %102
  %110 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !15
  %111 = zext i8 %110 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 1
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !15
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 8
  %116 = or i64 %115, %111
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 2
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !15
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 16
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 3
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !15
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 24
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 4
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !15
  %129 = zext i8 %128 to i64
  %130 = shl nuw nsw i64 %129, 32
  %131 = or i64 %126, %130
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 5
  %133 = load i8, i8 addrspace(4)* %132, align 1, !tbaa !15
  %134 = zext i8 %133 to i64
  %135 = shl nuw nsw i64 %134, 40
  %136 = or i64 %131, %135
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 6
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !15
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 48
  %141 = or i64 %136, %140
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 7
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !15
  %144 = zext i8 %143 to i64
  %145 = shl nuw i64 %144, 56
  %146 = or i64 %141, %145
  %147 = add nsw i32 %104, -8
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 8
  br label %162

149:                                              ; preds = %107, %149
  %150 = phi i32 [ %160, %149 ], [ 0, %107 ]
  %151 = phi i64 [ %159, %149 ], [ 0, %107 ]
  %152 = zext i32 %150 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %103, i64 %152
  %154 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !15
  %155 = zext i8 %154 to i64
  %156 = shl i32 %150, 3
  %157 = zext i32 %156 to i64
  %158 = shl nuw i64 %155, %157
  %159 = or i64 %158, %151
  %160 = add nuw nsw i32 %150, 1
  %161 = icmp eq i32 %160, %104
  br i1 %161, label %162, label %149

162:                                              ; preds = %149, %109, %107
  %163 = phi i8 addrspace(4)* [ %148, %109 ], [ %103, %107 ], [ %103, %149 ]
  %164 = phi i32 [ %147, %109 ], [ 0, %107 ], [ 0, %149 ]
  %165 = phi i64 [ %146, %109 ], [ 0, %107 ], [ %159, %149 ]
  %166 = icmp ugt i32 %164, 7
  br i1 %166, label %169, label %167

167:                                              ; preds = %162
  %168 = icmp eq i32 %164, 0
  br i1 %168, label %222, label %209

169:                                              ; preds = %162
  %170 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !15
  %171 = zext i8 %170 to i64
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 1
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !15
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 8
  %176 = or i64 %175, %171
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 2
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !15
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 16
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 3
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !15
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 24
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 4
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !15
  %189 = zext i8 %188 to i64
  %190 = shl nuw nsw i64 %189, 32
  %191 = or i64 %186, %190
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 5
  %193 = load i8, i8 addrspace(4)* %192, align 1, !tbaa !15
  %194 = zext i8 %193 to i64
  %195 = shl nuw nsw i64 %194, 40
  %196 = or i64 %191, %195
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 6
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !15
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 48
  %201 = or i64 %196, %200
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 7
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !15
  %204 = zext i8 %203 to i64
  %205 = shl nuw i64 %204, 56
  %206 = or i64 %201, %205
  %207 = add nsw i32 %164, -8
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 8
  br label %222

209:                                              ; preds = %167, %209
  %210 = phi i32 [ %220, %209 ], [ 0, %167 ]
  %211 = phi i64 [ %219, %209 ], [ 0, %167 ]
  %212 = zext i32 %210 to i64
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %163, i64 %212
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !15
  %215 = zext i8 %214 to i64
  %216 = shl i32 %210, 3
  %217 = zext i32 %216 to i64
  %218 = shl nuw i64 %215, %217
  %219 = or i64 %218, %211
  %220 = add nuw nsw i32 %210, 1
  %221 = icmp eq i32 %220, %164
  br i1 %221, label %222, label %209

222:                                              ; preds = %209, %169, %167
  %223 = phi i8 addrspace(4)* [ %208, %169 ], [ %163, %167 ], [ %163, %209 ]
  %224 = phi i32 [ %207, %169 ], [ 0, %167 ], [ 0, %209 ]
  %225 = phi i64 [ %206, %169 ], [ 0, %167 ], [ %219, %209 ]
  %226 = icmp ugt i32 %224, 7
  br i1 %226, label %229, label %227

227:                                              ; preds = %222
  %228 = icmp eq i32 %224, 0
  br i1 %228, label %282, label %269

229:                                              ; preds = %222
  %230 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !15
  %231 = zext i8 %230 to i64
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 1
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !15
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 8
  %236 = or i64 %235, %231
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 2
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !15
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 16
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 3
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !15
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 24
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 4
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !15
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 32
  %251 = or i64 %246, %250
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 5
  %253 = load i8, i8 addrspace(4)* %252, align 1, !tbaa !15
  %254 = zext i8 %253 to i64
  %255 = shl nuw nsw i64 %254, 40
  %256 = or i64 %251, %255
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 6
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !15
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 48
  %261 = or i64 %256, %260
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 7
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !15
  %264 = zext i8 %263 to i64
  %265 = shl nuw i64 %264, 56
  %266 = or i64 %261, %265
  %267 = add nsw i32 %224, -8
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 8
  br label %282

269:                                              ; preds = %227, %269
  %270 = phi i32 [ %280, %269 ], [ 0, %227 ]
  %271 = phi i64 [ %279, %269 ], [ 0, %227 ]
  %272 = zext i32 %270 to i64
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %223, i64 %272
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !15
  %275 = zext i8 %274 to i64
  %276 = shl i32 %270, 3
  %277 = zext i32 %276 to i64
  %278 = shl nuw i64 %275, %277
  %279 = or i64 %278, %271
  %280 = add nuw nsw i32 %270, 1
  %281 = icmp eq i32 %280, %224
  br i1 %281, label %282, label %269

282:                                              ; preds = %269, %229, %227
  %283 = phi i8 addrspace(4)* [ %268, %229 ], [ %223, %227 ], [ %223, %269 ]
  %284 = phi i32 [ %267, %229 ], [ 0, %227 ], [ 0, %269 ]
  %285 = phi i64 [ %266, %229 ], [ 0, %227 ], [ %279, %269 ]
  %286 = icmp ugt i32 %284, 7
  br i1 %286, label %289, label %287

287:                                              ; preds = %282
  %288 = icmp eq i32 %284, 0
  br i1 %288, label %342, label %329

289:                                              ; preds = %282
  %290 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !15
  %291 = zext i8 %290 to i64
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 1
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !15
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 8
  %296 = or i64 %295, %291
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 2
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !15
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 16
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 3
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !15
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 24
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 4
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !15
  %309 = zext i8 %308 to i64
  %310 = shl nuw nsw i64 %309, 32
  %311 = or i64 %306, %310
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 5
  %313 = load i8, i8 addrspace(4)* %312, align 1, !tbaa !15
  %314 = zext i8 %313 to i64
  %315 = shl nuw nsw i64 %314, 40
  %316 = or i64 %311, %315
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 6
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !15
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 48
  %321 = or i64 %316, %320
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 7
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !15
  %324 = zext i8 %323 to i64
  %325 = shl nuw i64 %324, 56
  %326 = or i64 %321, %325
  %327 = add nsw i32 %284, -8
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 8
  br label %342

329:                                              ; preds = %287, %329
  %330 = phi i32 [ %340, %329 ], [ 0, %287 ]
  %331 = phi i64 [ %339, %329 ], [ 0, %287 ]
  %332 = zext i32 %330 to i64
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %283, i64 %332
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !15
  %335 = zext i8 %334 to i64
  %336 = shl i32 %330, 3
  %337 = zext i32 %336 to i64
  %338 = shl nuw i64 %335, %337
  %339 = or i64 %338, %331
  %340 = add nuw nsw i32 %330, 1
  %341 = icmp eq i32 %340, %284
  br i1 %341, label %342, label %329

342:                                              ; preds = %329, %289, %287
  %343 = phi i8 addrspace(4)* [ %328, %289 ], [ %283, %287 ], [ %283, %329 ]
  %344 = phi i32 [ %327, %289 ], [ 0, %287 ], [ 0, %329 ]
  %345 = phi i64 [ %326, %289 ], [ 0, %287 ], [ %339, %329 ]
  %346 = icmp ugt i32 %344, 7
  br i1 %346, label %349, label %347

347:                                              ; preds = %342
  %348 = icmp eq i32 %344, 0
  br i1 %348, label %402, label %389

349:                                              ; preds = %342
  %350 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !15
  %351 = zext i8 %350 to i64
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 1
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !15
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 8
  %356 = or i64 %355, %351
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 2
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !15
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 16
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 3
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !15
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 24
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 4
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !15
  %369 = zext i8 %368 to i64
  %370 = shl nuw nsw i64 %369, 32
  %371 = or i64 %366, %370
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 5
  %373 = load i8, i8 addrspace(4)* %372, align 1, !tbaa !15
  %374 = zext i8 %373 to i64
  %375 = shl nuw nsw i64 %374, 40
  %376 = or i64 %371, %375
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 6
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !15
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 48
  %381 = or i64 %376, %380
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 7
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !15
  %384 = zext i8 %383 to i64
  %385 = shl nuw i64 %384, 56
  %386 = or i64 %381, %385
  %387 = add nsw i32 %344, -8
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 8
  br label %402

389:                                              ; preds = %347, %389
  %390 = phi i32 [ %400, %389 ], [ 0, %347 ]
  %391 = phi i64 [ %399, %389 ], [ 0, %347 ]
  %392 = zext i32 %390 to i64
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %343, i64 %392
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !15
  %395 = zext i8 %394 to i64
  %396 = shl i32 %390, 3
  %397 = zext i32 %396 to i64
  %398 = shl nuw i64 %395, %397
  %399 = or i64 %398, %391
  %400 = add nuw nsw i32 %390, 1
  %401 = icmp eq i32 %400, %344
  br i1 %401, label %402, label %389

402:                                              ; preds = %389, %349, %347
  %403 = phi i8 addrspace(4)* [ %388, %349 ], [ %343, %347 ], [ %343, %389 ]
  %404 = phi i32 [ %387, %349 ], [ 0, %347 ], [ 0, %389 ]
  %405 = phi i64 [ %386, %349 ], [ 0, %347 ], [ %399, %389 ]
  %406 = icmp ugt i32 %404, 7
  br i1 %406, label %409, label %407

407:                                              ; preds = %402
  %408 = icmp eq i32 %404, 0
  br i1 %408, label %460, label %447

409:                                              ; preds = %402
  %410 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !15
  %411 = zext i8 %410 to i64
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 1
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !15
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 8
  %416 = or i64 %415, %411
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 2
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !15
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 16
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 3
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !15
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 24
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 4
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !15
  %429 = zext i8 %428 to i64
  %430 = shl nuw nsw i64 %429, 32
  %431 = or i64 %426, %430
  %432 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 5
  %433 = load i8, i8 addrspace(4)* %432, align 1, !tbaa !15
  %434 = zext i8 %433 to i64
  %435 = shl nuw nsw i64 %434, 40
  %436 = or i64 %431, %435
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 6
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !15
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 48
  %441 = or i64 %436, %440
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 7
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !15
  %444 = zext i8 %443 to i64
  %445 = shl nuw i64 %444, 56
  %446 = or i64 %441, %445
  br label %460

447:                                              ; preds = %407, %447
  %448 = phi i32 [ %458, %447 ], [ 0, %407 ]
  %449 = phi i64 [ %457, %447 ], [ 0, %407 ]
  %450 = zext i32 %448 to i64
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %403, i64 %450
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !15
  %453 = zext i8 %452 to i64
  %454 = shl i32 %448, 3
  %455 = zext i32 %454 to i64
  %456 = shl nuw i64 %453, %455
  %457 = or i64 %456, %449
  %458 = add nuw nsw i32 %448, 1
  %459 = icmp eq i32 %458, %404
  br i1 %459, label %460, label %447

460:                                              ; preds = %447, %409, %407
  %461 = phi i64 [ %446, %409 ], [ 0, %407 ], [ %457, %447 ]
  %462 = shl nuw nsw i64 %43, 2
  %463 = add nuw nsw i64 %462, 28
  %464 = and i64 %463, 480
  %465 = and i64 %45, -225
  %466 = or i64 %465, %464
  %467 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %466, i64 noundef %105, i64 noundef %165, i64 noundef %225, i64 noundef %285, i64 noundef %345, i64 noundef %405, i64 noundef %461) #10
  %468 = sub i64 %35, %43
  %469 = getelementptr inbounds i8, i8 addrspace(4)* %36, i64 %43
  %470 = icmp eq i64 %468, 0
  br i1 %470, label %471, label %34

471:                                              ; preds = %460, %26
  %472 = phi <2 x i64> [ %29, %26 ], [ %467, %460 ]
  %473 = extractelement <2 x i64> %472, i64 0
  %474 = bitcast double %17 to i64
  %475 = and i64 %473, -227
  %476 = or i64 %475, 34
  %477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %23, i64 noundef %476, i64 noundef %474, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %478

478:                                              ; preds = %471, %2
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
!8 = !{!"float", !9, i64 0}
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
