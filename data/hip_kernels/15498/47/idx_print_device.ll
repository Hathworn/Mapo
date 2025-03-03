; ModuleID = '../data/hip_kernels/15498/47/main.cu'
source_filename = "../data/hip_kernels/15498/47/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [19 x i8] c" %5d\09%5d\09 %2d\09%2d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9idx_printv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %2 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %3 = getelementptr i8, i8 addrspace(4)* %2, i64 4
  %4 = bitcast i8 addrspace(4)* %3 to i16 addrspace(4)*
  %5 = load i16, i16 addrspace(4)* %4, align 4, !range !4, !invariant.load !5
  %6 = zext i16 %5 to i32
  %7 = mul i32 %1, %6
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %9 = add i32 %7, %8
  %10 = lshr i32 %8, 6
  %11 = and i32 %8, 63
  %12 = and i32 %8, 31
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %490

14:                                               ; preds = %0
  %15 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %16 = getelementptr inbounds i8, i8 addrspace(4)* %15, i64 24
  %17 = bitcast i8 addrspace(4)* %16 to i64 addrspace(4)*
  %18 = load i64, i64 addrspace(4)* %17, align 8, !tbaa !7
  %19 = inttoptr i64 %18 to i8 addrspace(1)*
  %20 = addrspacecast i8 addrspace(1)* %19 to i8*
  %21 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %22 = extractelement <2 x i64> %21, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %23, label %27

23:                                               ; preds = %14
  %24 = and i64 %22, -225
  %25 = or i64 %24, 32
  %26 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef %25, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %468

27:                                               ; preds = %14
  %28 = and i64 %22, 2
  %29 = and i64 %22, -3
  %30 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %29, i64 0
  br label %31

31:                                               ; preds = %457, %27
  %32 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 18) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([19 x i8]* addrspacecast ([19 x i8] addrspace(4)* @.str to [19 x i8]*) to i64)), i64 1))), %27 ], [ %465, %457 ]
  %33 = phi i8 addrspace(4)* [ getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str, i64 0, i64 0), %27 ], [ %466, %457 ]
  %34 = phi <2 x i64> [ %30, %27 ], [ %464, %457 ]
  %35 = icmp ugt i64 %32, 56
  %36 = extractelement <2 x i64> %34, i64 0
  %37 = or i64 %36, %28
  %38 = insertelement <2 x i64> poison, i64 %37, i64 0
  %39 = select i1 %35, <2 x i64> %34, <2 x i64> %38
  %40 = tail call i64 @llvm.umin.i64(i64 %32, i64 56)
  %41 = trunc i64 %40 to i32
  %42 = extractelement <2 x i64> %39, i64 0
  %43 = icmp ugt i32 %41, 7
  br i1 %43, label %46, label %44

44:                                               ; preds = %31
  %45 = icmp eq i32 %41, 0
  br i1 %45, label %99, label %86

46:                                               ; preds = %31
  %47 = load i8, i8 addrspace(4)* %33, align 1, !tbaa !11
  %48 = zext i8 %47 to i64
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 1
  %50 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !11
  %51 = zext i8 %50 to i64
  %52 = shl nuw nsw i64 %51, 8
  %53 = or i64 %52, %48
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 2
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !11
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 16
  %58 = or i64 %53, %57
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 3
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !11
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 24
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 4
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !11
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 32
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 5
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !11
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 40
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 6
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !11
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 48
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 7
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !11
  %81 = zext i8 %80 to i64
  %82 = shl nuw i64 %81, 56
  %83 = or i64 %78, %82
  %84 = add nsw i32 %41, -8
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 8
  br label %99

86:                                               ; preds = %44, %86
  %87 = phi i32 [ %97, %86 ], [ 0, %44 ]
  %88 = phi i64 [ %96, %86 ], [ 0, %44 ]
  %89 = zext i32 %87 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 %89
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !11
  %92 = zext i8 %91 to i64
  %93 = shl i32 %87, 3
  %94 = zext i32 %93 to i64
  %95 = shl nuw i64 %92, %94
  %96 = or i64 %95, %88
  %97 = add nuw nsw i32 %87, 1
  %98 = icmp eq i32 %97, %41
  br i1 %98, label %99, label %86, !llvm.loop !12

99:                                               ; preds = %86, %46, %44
  %100 = phi i8 addrspace(4)* [ %85, %46 ], [ %33, %44 ], [ %33, %86 ]
  %101 = phi i32 [ %84, %46 ], [ 0, %44 ], [ 0, %86 ]
  %102 = phi i64 [ %83, %46 ], [ 0, %44 ], [ %96, %86 ]
  %103 = icmp ugt i32 %101, 7
  br i1 %103, label %106, label %104

104:                                              ; preds = %99
  %105 = icmp eq i32 %101, 0
  br i1 %105, label %159, label %146

106:                                              ; preds = %99
  %107 = load i8, i8 addrspace(4)* %100, align 1, !tbaa !11
  %108 = zext i8 %107 to i64
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 1
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !11
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 8
  %113 = or i64 %112, %108
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 2
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !11
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 16
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 3
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !11
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 24
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 4
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !11
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 32
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 5
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !11
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 40
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 6
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !11
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 48
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 7
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !11
  %141 = zext i8 %140 to i64
  %142 = shl nuw i64 %141, 56
  %143 = or i64 %138, %142
  %144 = add nsw i32 %101, -8
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 8
  br label %159

146:                                              ; preds = %104, %146
  %147 = phi i32 [ %157, %146 ], [ 0, %104 ]
  %148 = phi i64 [ %156, %146 ], [ 0, %104 ]
  %149 = zext i32 %147 to i64
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %100, i64 %149
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !11
  %152 = zext i8 %151 to i64
  %153 = shl i32 %147, 3
  %154 = zext i32 %153 to i64
  %155 = shl nuw i64 %152, %154
  %156 = or i64 %155, %148
  %157 = add nuw nsw i32 %147, 1
  %158 = icmp eq i32 %157, %101
  br i1 %158, label %159, label %146

159:                                              ; preds = %146, %106, %104
  %160 = phi i8 addrspace(4)* [ %145, %106 ], [ %100, %104 ], [ %100, %146 ]
  %161 = phi i32 [ %144, %106 ], [ 0, %104 ], [ 0, %146 ]
  %162 = phi i64 [ %143, %106 ], [ 0, %104 ], [ %156, %146 ]
  %163 = icmp ugt i32 %161, 7
  br i1 %163, label %166, label %164

164:                                              ; preds = %159
  %165 = icmp eq i32 %161, 0
  br i1 %165, label %219, label %206

166:                                              ; preds = %159
  %167 = load i8, i8 addrspace(4)* %160, align 1, !tbaa !11
  %168 = zext i8 %167 to i64
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 1
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !11
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 8
  %173 = or i64 %172, %168
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 2
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !11
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 16
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 3
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !11
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 24
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 4
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !11
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 32
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 5
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !11
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 40
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 6
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !11
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 48
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 7
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !11
  %201 = zext i8 %200 to i64
  %202 = shl nuw i64 %201, 56
  %203 = or i64 %198, %202
  %204 = add nsw i32 %161, -8
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 8
  br label %219

206:                                              ; preds = %164, %206
  %207 = phi i32 [ %217, %206 ], [ 0, %164 ]
  %208 = phi i64 [ %216, %206 ], [ 0, %164 ]
  %209 = zext i32 %207 to i64
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %160, i64 %209
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !11
  %212 = zext i8 %211 to i64
  %213 = shl i32 %207, 3
  %214 = zext i32 %213 to i64
  %215 = shl nuw i64 %212, %214
  %216 = or i64 %215, %208
  %217 = add nuw nsw i32 %207, 1
  %218 = icmp eq i32 %217, %161
  br i1 %218, label %219, label %206

219:                                              ; preds = %206, %166, %164
  %220 = phi i8 addrspace(4)* [ %205, %166 ], [ %160, %164 ], [ %160, %206 ]
  %221 = phi i32 [ %204, %166 ], [ 0, %164 ], [ 0, %206 ]
  %222 = phi i64 [ %203, %166 ], [ 0, %164 ], [ %216, %206 ]
  %223 = icmp ugt i32 %221, 7
  br i1 %223, label %226, label %224

224:                                              ; preds = %219
  %225 = icmp eq i32 %221, 0
  br i1 %225, label %279, label %266

226:                                              ; preds = %219
  %227 = load i8, i8 addrspace(4)* %220, align 1, !tbaa !11
  %228 = zext i8 %227 to i64
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 1
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !11
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 8
  %233 = or i64 %232, %228
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 2
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !11
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 16
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 3
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !11
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 24
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 4
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !11
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 32
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 5
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !11
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 40
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 6
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !11
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 48
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 7
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !11
  %261 = zext i8 %260 to i64
  %262 = shl nuw i64 %261, 56
  %263 = or i64 %258, %262
  %264 = add nsw i32 %221, -8
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 8
  br label %279

266:                                              ; preds = %224, %266
  %267 = phi i32 [ %277, %266 ], [ 0, %224 ]
  %268 = phi i64 [ %276, %266 ], [ 0, %224 ]
  %269 = zext i32 %267 to i64
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %220, i64 %269
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !11
  %272 = zext i8 %271 to i64
  %273 = shl i32 %267, 3
  %274 = zext i32 %273 to i64
  %275 = shl nuw i64 %272, %274
  %276 = or i64 %275, %268
  %277 = add nuw nsw i32 %267, 1
  %278 = icmp eq i32 %277, %221
  br i1 %278, label %279, label %266

279:                                              ; preds = %266, %226, %224
  %280 = phi i8 addrspace(4)* [ %265, %226 ], [ %220, %224 ], [ %220, %266 ]
  %281 = phi i32 [ %264, %226 ], [ 0, %224 ], [ 0, %266 ]
  %282 = phi i64 [ %263, %226 ], [ 0, %224 ], [ %276, %266 ]
  %283 = icmp ugt i32 %281, 7
  br i1 %283, label %286, label %284

284:                                              ; preds = %279
  %285 = icmp eq i32 %281, 0
  br i1 %285, label %339, label %326

286:                                              ; preds = %279
  %287 = load i8, i8 addrspace(4)* %280, align 1, !tbaa !11
  %288 = zext i8 %287 to i64
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 1
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !11
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 8
  %293 = or i64 %292, %288
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 2
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !11
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 16
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 3
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !11
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 24
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 4
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !11
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 32
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 5
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !11
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 40
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 6
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !11
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 48
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 7
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !11
  %321 = zext i8 %320 to i64
  %322 = shl nuw i64 %321, 56
  %323 = or i64 %318, %322
  %324 = add nsw i32 %281, -8
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 8
  br label %339

326:                                              ; preds = %284, %326
  %327 = phi i32 [ %337, %326 ], [ 0, %284 ]
  %328 = phi i64 [ %336, %326 ], [ 0, %284 ]
  %329 = zext i32 %327 to i64
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %280, i64 %329
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !11
  %332 = zext i8 %331 to i64
  %333 = shl i32 %327, 3
  %334 = zext i32 %333 to i64
  %335 = shl nuw i64 %332, %334
  %336 = or i64 %335, %328
  %337 = add nuw nsw i32 %327, 1
  %338 = icmp eq i32 %337, %281
  br i1 %338, label %339, label %326

339:                                              ; preds = %326, %286, %284
  %340 = phi i8 addrspace(4)* [ %325, %286 ], [ %280, %284 ], [ %280, %326 ]
  %341 = phi i32 [ %324, %286 ], [ 0, %284 ], [ 0, %326 ]
  %342 = phi i64 [ %323, %286 ], [ 0, %284 ], [ %336, %326 ]
  %343 = icmp ugt i32 %341, 7
  br i1 %343, label %346, label %344

344:                                              ; preds = %339
  %345 = icmp eq i32 %341, 0
  br i1 %345, label %399, label %386

346:                                              ; preds = %339
  %347 = load i8, i8 addrspace(4)* %340, align 1, !tbaa !11
  %348 = zext i8 %347 to i64
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 1
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !11
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 8
  %353 = or i64 %352, %348
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 2
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !11
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 16
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 3
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !11
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 24
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 4
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !11
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 32
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 5
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !11
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 40
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 6
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !11
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 48
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 7
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !11
  %381 = zext i8 %380 to i64
  %382 = shl nuw i64 %381, 56
  %383 = or i64 %378, %382
  %384 = add nsw i32 %341, -8
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 8
  br label %399

386:                                              ; preds = %344, %386
  %387 = phi i32 [ %397, %386 ], [ 0, %344 ]
  %388 = phi i64 [ %396, %386 ], [ 0, %344 ]
  %389 = zext i32 %387 to i64
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %340, i64 %389
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !11
  %392 = zext i8 %391 to i64
  %393 = shl i32 %387, 3
  %394 = zext i32 %393 to i64
  %395 = shl nuw i64 %392, %394
  %396 = or i64 %395, %388
  %397 = add nuw nsw i32 %387, 1
  %398 = icmp eq i32 %397, %341
  br i1 %398, label %399, label %386

399:                                              ; preds = %386, %346, %344
  %400 = phi i8 addrspace(4)* [ %385, %346 ], [ %340, %344 ], [ %340, %386 ]
  %401 = phi i32 [ %384, %346 ], [ 0, %344 ], [ 0, %386 ]
  %402 = phi i64 [ %383, %346 ], [ 0, %344 ], [ %396, %386 ]
  %403 = icmp ugt i32 %401, 7
  br i1 %403, label %406, label %404

404:                                              ; preds = %399
  %405 = icmp eq i32 %401, 0
  br i1 %405, label %457, label %444

406:                                              ; preds = %399
  %407 = load i8, i8 addrspace(4)* %400, align 1, !tbaa !11
  %408 = zext i8 %407 to i64
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 1
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !11
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 8
  %413 = or i64 %412, %408
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 2
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !11
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 16
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 3
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !11
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 24
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 4
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !11
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 32
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 5
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !11
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 40
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 6
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !11
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 48
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 7
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !11
  %441 = zext i8 %440 to i64
  %442 = shl nuw i64 %441, 56
  %443 = or i64 %438, %442
  br label %457

444:                                              ; preds = %404, %444
  %445 = phi i32 [ %455, %444 ], [ 0, %404 ]
  %446 = phi i64 [ %454, %444 ], [ 0, %404 ]
  %447 = zext i32 %445 to i64
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %400, i64 %447
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !11
  %450 = zext i8 %449 to i64
  %451 = shl i32 %445, 3
  %452 = zext i32 %451 to i64
  %453 = shl nuw i64 %450, %452
  %454 = or i64 %453, %446
  %455 = add nuw nsw i32 %445, 1
  %456 = icmp eq i32 %455, %401
  br i1 %456, label %457, label %444

457:                                              ; preds = %444, %406, %404
  %458 = phi i64 [ %443, %406 ], [ 0, %404 ], [ %454, %444 ]
  %459 = shl nuw nsw i64 %40, 2
  %460 = add nuw nsw i64 %459, 28
  %461 = and i64 %460, 480
  %462 = and i64 %42, -225
  %463 = or i64 %462, %461
  %464 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef %463, i64 noundef %102, i64 noundef %162, i64 noundef %222, i64 noundef %282, i64 noundef %342, i64 noundef %402, i64 noundef %458) #10
  %465 = sub i64 %32, %40
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %33, i64 %40
  %467 = icmp eq i64 %465, 0
  br i1 %467, label %468, label %31

468:                                              ; preds = %457, %23
  %469 = phi <2 x i64> [ %26, %23 ], [ %464, %457 ]
  %470 = extractelement <2 x i64> %469, i64 0
  %471 = zext i32 %9 to i64
  %472 = and i64 %470, -225
  %473 = or i64 %472, 32
  %474 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef %473, i64 noundef %471, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %475 = extractelement <2 x i64> %474, i64 0
  %476 = zext i32 %1 to i64
  %477 = and i64 %475, -225
  %478 = or i64 %477, 32
  %479 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef %478, i64 noundef %476, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %480 = extractelement <2 x i64> %479, i64 0
  %481 = zext i32 %10 to i64
  %482 = and i64 %480, -225
  %483 = or i64 %482, 32
  %484 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef %483, i64 noundef %481, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %485 = extractelement <2 x i64> %484, i64 0
  %486 = zext i32 %11 to i64
  %487 = and i64 %485, -227
  %488 = or i64 %487, 34
  %489 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %20, i64 noundef %488, i64 noundef %486, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %490

490:                                              ; preds = %468, %0
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
