; ModuleID = '../data/hip_kernels/10553/5/main.cu'
source_filename = "../data/hip_kernels/10553/5/main.cu"
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
%struct.chromosome = type <{ i64, i64, [100003 x i8], [5 x i8] }>

@.str = private unnamed_addr addrspace(4) constant [48 x i8] c"                    %d                        \0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z17bitonic_sort_stepP10chromosomeii(%struct.chromosome addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #1 {
  %4 = alloca [100024 x i8], align 8, addrspace(5)
  %5 = getelementptr inbounds [100024 x i8], [100024 x i8] addrspace(5)* %4, i32 0, i32 0
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = xor i32 %14, %1
  %16 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 24
  %18 = bitcast i8 addrspace(4)* %17 to i64 addrspace(4)*
  %19 = load i64, i64 addrspace(4)* %18, align 8, !tbaa !7
  %20 = inttoptr i64 %19 to i8 addrspace(1)*
  %21 = addrspacecast i8 addrspace(1)* %20 to i8*
  %22 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %21, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %23 = extractelement <2 x i64> %22, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([48 x i8], [48 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %24, label %28

24:                                               ; preds = %3
  %25 = and i64 %23, -225
  %26 = or i64 %25, 32
  %27 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %21, i64 noundef %26, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %469

28:                                               ; preds = %3
  %29 = and i64 %23, 2
  %30 = and i64 %23, -3
  %31 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %30, i64 0
  br label %32

32:                                               ; preds = %458, %28
  %33 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([48 x i8], [48 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([48 x i8], [48 x i8] addrspace(4)* @.str, i64 0, i64 47) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([48 x i8]* addrspacecast ([48 x i8] addrspace(4)* @.str to [48 x i8]*) to i64)), i64 1))), %28 ], [ %466, %458 ]
  %34 = phi i8 addrspace(4)* [ getelementptr inbounds ([48 x i8], [48 x i8] addrspace(4)* @.str, i64 0, i64 0), %28 ], [ %467, %458 ]
  %35 = phi <2 x i64> [ %31, %28 ], [ %465, %458 ]
  %36 = icmp ugt i64 %33, 56
  %37 = extractelement <2 x i64> %35, i64 0
  %38 = or i64 %37, %29
  %39 = insertelement <2 x i64> poison, i64 %38, i64 0
  %40 = select i1 %36, <2 x i64> %35, <2 x i64> %39
  %41 = tail call i64 @llvm.umin.i64(i64 %33, i64 56)
  %42 = trunc i64 %41 to i32
  %43 = extractelement <2 x i64> %40, i64 0
  %44 = icmp ugt i32 %42, 7
  br i1 %44, label %47, label %45

45:                                               ; preds = %32
  %46 = icmp eq i32 %42, 0
  br i1 %46, label %100, label %87

47:                                               ; preds = %32
  %48 = load i8, i8 addrspace(4)* %34, align 1, !tbaa !11
  %49 = zext i8 %48 to i64
  %50 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 1
  %51 = load i8, i8 addrspace(4)* %50, align 1, !tbaa !11
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 8
  %54 = or i64 %53, %49
  %55 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 2
  %56 = load i8, i8 addrspace(4)* %55, align 1, !tbaa !11
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 16
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 3
  %61 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !11
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 24
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 4
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !11
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 32
  %69 = or i64 %64, %68
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 5
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !11
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 40
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 6
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !11
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 48
  %79 = or i64 %74, %78
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 7
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !11
  %82 = zext i8 %81 to i64
  %83 = shl nuw i64 %82, 56
  %84 = or i64 %79, %83
  %85 = add nsw i32 %42, -8
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 8
  br label %100

87:                                               ; preds = %45, %87
  %88 = phi i32 [ %98, %87 ], [ 0, %45 ]
  %89 = phi i64 [ %97, %87 ], [ 0, %45 ]
  %90 = zext i32 %88 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 %90
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !11
  %93 = zext i8 %92 to i64
  %94 = shl i32 %88, 3
  %95 = zext i32 %94 to i64
  %96 = shl nuw i64 %93, %95
  %97 = or i64 %96, %89
  %98 = add nuw nsw i32 %88, 1
  %99 = icmp eq i32 %98, %42
  br i1 %99, label %100, label %87, !llvm.loop !12

100:                                              ; preds = %87, %47, %45
  %101 = phi i8 addrspace(4)* [ %86, %47 ], [ %34, %45 ], [ %34, %87 ]
  %102 = phi i32 [ %85, %47 ], [ 0, %45 ], [ 0, %87 ]
  %103 = phi i64 [ %84, %47 ], [ 0, %45 ], [ %97, %87 ]
  %104 = icmp ugt i32 %102, 7
  br i1 %104, label %107, label %105

105:                                              ; preds = %100
  %106 = icmp eq i32 %102, 0
  br i1 %106, label %160, label %147

107:                                              ; preds = %100
  %108 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !11
  %109 = zext i8 %108 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 1
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !11
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 8
  %114 = or i64 %113, %109
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 2
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !11
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 16
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 3
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !11
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 24
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 4
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !11
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 32
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 5
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !11
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 40
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 6
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !11
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 48
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 7
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !11
  %142 = zext i8 %141 to i64
  %143 = shl nuw i64 %142, 56
  %144 = or i64 %139, %143
  %145 = add nsw i32 %102, -8
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 8
  br label %160

147:                                              ; preds = %105, %147
  %148 = phi i32 [ %158, %147 ], [ 0, %105 ]
  %149 = phi i64 [ %157, %147 ], [ 0, %105 ]
  %150 = zext i32 %148 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %101, i64 %150
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !11
  %153 = zext i8 %152 to i64
  %154 = shl i32 %148, 3
  %155 = zext i32 %154 to i64
  %156 = shl nuw i64 %153, %155
  %157 = or i64 %156, %149
  %158 = add nuw nsw i32 %148, 1
  %159 = icmp eq i32 %158, %102
  br i1 %159, label %160, label %147

160:                                              ; preds = %147, %107, %105
  %161 = phi i8 addrspace(4)* [ %146, %107 ], [ %101, %105 ], [ %101, %147 ]
  %162 = phi i32 [ %145, %107 ], [ 0, %105 ], [ 0, %147 ]
  %163 = phi i64 [ %144, %107 ], [ 0, %105 ], [ %157, %147 ]
  %164 = icmp ugt i32 %162, 7
  br i1 %164, label %167, label %165

165:                                              ; preds = %160
  %166 = icmp eq i32 %162, 0
  br i1 %166, label %220, label %207

167:                                              ; preds = %160
  %168 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !11
  %169 = zext i8 %168 to i64
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 1
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !11
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 8
  %174 = or i64 %173, %169
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 2
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !11
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 16
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 3
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !11
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 24
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 4
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !11
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 32
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 5
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !11
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 40
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 6
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !11
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 48
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 7
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !11
  %202 = zext i8 %201 to i64
  %203 = shl nuw i64 %202, 56
  %204 = or i64 %199, %203
  %205 = add nsw i32 %162, -8
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 8
  br label %220

207:                                              ; preds = %165, %207
  %208 = phi i32 [ %218, %207 ], [ 0, %165 ]
  %209 = phi i64 [ %217, %207 ], [ 0, %165 ]
  %210 = zext i32 %208 to i64
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %161, i64 %210
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !11
  %213 = zext i8 %212 to i64
  %214 = shl i32 %208, 3
  %215 = zext i32 %214 to i64
  %216 = shl nuw i64 %213, %215
  %217 = or i64 %216, %209
  %218 = add nuw nsw i32 %208, 1
  %219 = icmp eq i32 %218, %162
  br i1 %219, label %220, label %207

220:                                              ; preds = %207, %167, %165
  %221 = phi i8 addrspace(4)* [ %206, %167 ], [ %161, %165 ], [ %161, %207 ]
  %222 = phi i32 [ %205, %167 ], [ 0, %165 ], [ 0, %207 ]
  %223 = phi i64 [ %204, %167 ], [ 0, %165 ], [ %217, %207 ]
  %224 = icmp ugt i32 %222, 7
  br i1 %224, label %227, label %225

225:                                              ; preds = %220
  %226 = icmp eq i32 %222, 0
  br i1 %226, label %280, label %267

227:                                              ; preds = %220
  %228 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !11
  %229 = zext i8 %228 to i64
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 1
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !11
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 8
  %234 = or i64 %233, %229
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 2
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !11
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 16
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 3
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !11
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 24
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 4
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !11
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 32
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 5
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !11
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 40
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 6
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !11
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 48
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 7
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !11
  %262 = zext i8 %261 to i64
  %263 = shl nuw i64 %262, 56
  %264 = or i64 %259, %263
  %265 = add nsw i32 %222, -8
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 8
  br label %280

267:                                              ; preds = %225, %267
  %268 = phi i32 [ %278, %267 ], [ 0, %225 ]
  %269 = phi i64 [ %277, %267 ], [ 0, %225 ]
  %270 = zext i32 %268 to i64
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %221, i64 %270
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !11
  %273 = zext i8 %272 to i64
  %274 = shl i32 %268, 3
  %275 = zext i32 %274 to i64
  %276 = shl nuw i64 %273, %275
  %277 = or i64 %276, %269
  %278 = add nuw nsw i32 %268, 1
  %279 = icmp eq i32 %278, %222
  br i1 %279, label %280, label %267

280:                                              ; preds = %267, %227, %225
  %281 = phi i8 addrspace(4)* [ %266, %227 ], [ %221, %225 ], [ %221, %267 ]
  %282 = phi i32 [ %265, %227 ], [ 0, %225 ], [ 0, %267 ]
  %283 = phi i64 [ %264, %227 ], [ 0, %225 ], [ %277, %267 ]
  %284 = icmp ugt i32 %282, 7
  br i1 %284, label %287, label %285

285:                                              ; preds = %280
  %286 = icmp eq i32 %282, 0
  br i1 %286, label %340, label %327

287:                                              ; preds = %280
  %288 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !11
  %289 = zext i8 %288 to i64
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 1
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !11
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 8
  %294 = or i64 %293, %289
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 2
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !11
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 16
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 3
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !11
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 24
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 4
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !11
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 32
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 5
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !11
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 40
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 6
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !11
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 48
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 7
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !11
  %322 = zext i8 %321 to i64
  %323 = shl nuw i64 %322, 56
  %324 = or i64 %319, %323
  %325 = add nsw i32 %282, -8
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 8
  br label %340

327:                                              ; preds = %285, %327
  %328 = phi i32 [ %338, %327 ], [ 0, %285 ]
  %329 = phi i64 [ %337, %327 ], [ 0, %285 ]
  %330 = zext i32 %328 to i64
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %281, i64 %330
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !11
  %333 = zext i8 %332 to i64
  %334 = shl i32 %328, 3
  %335 = zext i32 %334 to i64
  %336 = shl nuw i64 %333, %335
  %337 = or i64 %336, %329
  %338 = add nuw nsw i32 %328, 1
  %339 = icmp eq i32 %338, %282
  br i1 %339, label %340, label %327

340:                                              ; preds = %327, %287, %285
  %341 = phi i8 addrspace(4)* [ %326, %287 ], [ %281, %285 ], [ %281, %327 ]
  %342 = phi i32 [ %325, %287 ], [ 0, %285 ], [ 0, %327 ]
  %343 = phi i64 [ %324, %287 ], [ 0, %285 ], [ %337, %327 ]
  %344 = icmp ugt i32 %342, 7
  br i1 %344, label %347, label %345

345:                                              ; preds = %340
  %346 = icmp eq i32 %342, 0
  br i1 %346, label %400, label %387

347:                                              ; preds = %340
  %348 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !11
  %349 = zext i8 %348 to i64
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 1
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !11
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 8
  %354 = or i64 %353, %349
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 2
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !11
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 16
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 3
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !11
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 24
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 4
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !11
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 32
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 5
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !11
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 40
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 6
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !11
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 48
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 7
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !11
  %382 = zext i8 %381 to i64
  %383 = shl nuw i64 %382, 56
  %384 = or i64 %379, %383
  %385 = add nsw i32 %342, -8
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 8
  br label %400

387:                                              ; preds = %345, %387
  %388 = phi i32 [ %398, %387 ], [ 0, %345 ]
  %389 = phi i64 [ %397, %387 ], [ 0, %345 ]
  %390 = zext i32 %388 to i64
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %341, i64 %390
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !11
  %393 = zext i8 %392 to i64
  %394 = shl i32 %388, 3
  %395 = zext i32 %394 to i64
  %396 = shl nuw i64 %393, %395
  %397 = or i64 %396, %389
  %398 = add nuw nsw i32 %388, 1
  %399 = icmp eq i32 %398, %342
  br i1 %399, label %400, label %387

400:                                              ; preds = %387, %347, %345
  %401 = phi i8 addrspace(4)* [ %386, %347 ], [ %341, %345 ], [ %341, %387 ]
  %402 = phi i32 [ %385, %347 ], [ 0, %345 ], [ 0, %387 ]
  %403 = phi i64 [ %384, %347 ], [ 0, %345 ], [ %397, %387 ]
  %404 = icmp ugt i32 %402, 7
  br i1 %404, label %407, label %405

405:                                              ; preds = %400
  %406 = icmp eq i32 %402, 0
  br i1 %406, label %458, label %445

407:                                              ; preds = %400
  %408 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !11
  %409 = zext i8 %408 to i64
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 1
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !11
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 8
  %414 = or i64 %413, %409
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 2
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !11
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 16
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 3
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !11
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 24
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 4
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !11
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 32
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 5
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !11
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 40
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 6
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !11
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 48
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 7
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !11
  %442 = zext i8 %441 to i64
  %443 = shl nuw i64 %442, 56
  %444 = or i64 %439, %443
  br label %458

445:                                              ; preds = %405, %445
  %446 = phi i32 [ %456, %445 ], [ 0, %405 ]
  %447 = phi i64 [ %455, %445 ], [ 0, %405 ]
  %448 = zext i32 %446 to i64
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %401, i64 %448
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !11
  %451 = zext i8 %450 to i64
  %452 = shl i32 %446, 3
  %453 = zext i32 %452 to i64
  %454 = shl nuw i64 %451, %453
  %455 = or i64 %454, %447
  %456 = add nuw nsw i32 %446, 1
  %457 = icmp eq i32 %456, %402
  br i1 %457, label %458, label %445

458:                                              ; preds = %445, %407, %405
  %459 = phi i64 [ %444, %407 ], [ 0, %405 ], [ %455, %445 ]
  %460 = shl nuw nsw i64 %41, 2
  %461 = add nuw nsw i64 %460, 28
  %462 = and i64 %461, 480
  %463 = and i64 %43, -225
  %464 = or i64 %463, %462
  %465 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %21, i64 noundef %464, i64 noundef %103, i64 noundef %163, i64 noundef %223, i64 noundef %283, i64 noundef %343, i64 noundef %403, i64 noundef %459) #11
  %466 = sub i64 %33, %41
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %34, i64 %41
  %468 = icmp eq i64 %466, 0
  br i1 %468, label %469, label %32

469:                                              ; preds = %458, %24
  %470 = phi <2 x i64> [ %27, %24 ], [ %465, %458 ]
  %471 = extractelement <2 x i64> %470, i64 0
  %472 = zext i32 %14 to i64
  %473 = and i64 %471, -227
  %474 = or i64 %473, 34
  %475 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %21, i64 noundef %474, i64 noundef %472, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %476 = icmp ule i32 %15, %14
  %477 = and i32 %14, %2
  %478 = icmp eq i32 %477, 0
  %479 = select i1 %476, i1 true, i1 %478
  br i1 %479, label %492, label %480

480:                                              ; preds = %469
  %481 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %472, i32 1
  %482 = load i64, i64 addrspace(1)* %481, align 8, !tbaa !14
  %483 = zext i32 %15 to i64
  %484 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %483, i32 1
  %485 = load i64, i64 addrspace(1)* %484, align 8, !tbaa !14
  %486 = icmp slt i64 %482, %485
  br i1 %486, label %487, label %492

487:                                              ; preds = %480
  %488 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %483
  %489 = getelementptr inbounds %struct.chromosome, %struct.chromosome addrspace(1)* %0, i64 %472
  call void @llvm.lifetime.start.p5i8(i64 100024, i8 addrspace(5)* %5)
  %490 = bitcast %struct.chromosome addrspace(1)* %489 to i8 addrspace(1)*
  call void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noundef align 8 dereferenceable(100024) %5, i8 addrspace(1)* noundef align 8 dereferenceable(100024) %490, i64 100024, i1 false), !tbaa.struct !19
  %491 = bitcast %struct.chromosome addrspace(1)* %488 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 8 dereferenceable(100019) %490, i8 addrspace(1)* noundef align 8 dereferenceable(100019) %491, i64 100019, i1 false), !tbaa.struct !19
  call void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noundef align 8 dereferenceable(100019) %491, i8 addrspace(5)* noundef align 8 dereferenceable(100019) %5, i64 100019, i1 false), !tbaa.struct !19
  call void @llvm.lifetime.end.p5i8(i64 100024, i8 addrspace(5)* %5)
  br label %492

492:                                              ; preds = %487, %480, %469
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !22
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !24
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !24
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !26
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !7
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !24
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !24
  %110 = call i64 @llvm.read_register.i64(metadata !32) #12
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !7
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !7
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !11
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
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

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #10

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #10

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(5)* noalias nocapture readonly, i64, i1 immarg) #10

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
attributes #10 = { argmemonly nocallback nofree nounwind willreturn }
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
!14 = !{!15, !16, i64 8}
!15 = !{!"_ZTS10chromosome", !16, i64 0, !16, i64 8, !17, i64 16}
!16 = !{!"long long", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{i64 0, i64 8, !20, i64 8, i64 8, !20, i64 16, i64 100003, !21}
!20 = !{!16, !16, i64 0}
!21 = !{!17, !17, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !9, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"int", !9, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !23, i64 0}
!28 = !{!"", !23, i64 0, !23, i64 8, !29, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!29 = !{!"hsa_signal_s", !8, i64 0}
!30 = !{!28, !8, i64 40}
!31 = !{!28, !23, i64 8}
!32 = !{!"exec"}
!33 = !{!34, !25, i64 16}
!34 = !{!"", !8, i64 0, !8, i64 8, !25, i64 16, !25, i64 20}
!35 = !{!34, !8, i64 8}
!36 = !{!34, !25, i64 20}
!37 = !{!34, !8, i64 0}
!38 = !{!39, !8, i64 16}
!39 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !25, i64 24, !25, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!40 = !{!39, !25, i64 24}
