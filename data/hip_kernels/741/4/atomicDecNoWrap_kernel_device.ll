; ModuleID = '../data/hip_kernels/741/4/main.cu'
source_filename = "../data/hip_kernels/741/4/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [21 x i8] c"d_quantity[%u] = %u\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [25 x i8] c"tid %u: iter %d, old %u\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z22atomicDecNoWrap_kerneljjPfPjS0_(i32 %0, i32 %1, float addrspace(1)* nocapture readnone %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #1 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp ult i32 %14, %1
  br i1 %15, label %16, label %981

16:                                               ; preds = %5
  %17 = icmp eq i32 %14, 0
  br i1 %17, label %18, label %484

18:                                               ; preds = %16
  %19 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 24
  %22 = bitcast i8 addrspace(4)* %21 to i64 addrspace(4)*
  %23 = load i64, i64 addrspace(4)* %22, align 8, !tbaa !11
  %24 = inttoptr i64 %23 to i8 addrspace(1)*
  %25 = addrspacecast i8 addrspace(1)* %24 to i8*
  %26 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %27 = extractelement <2 x i64> %26, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %28, label %32

28:                                               ; preds = %18
  %29 = and i64 %27, -225
  %30 = or i64 %29, 32
  %31 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef %30, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %473

32:                                               ; preds = %18
  %33 = and i64 %27, 2
  %34 = and i64 %27, -3
  %35 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %34, i64 0
  br label %36

36:                                               ; preds = %462, %32
  %37 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 20) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([21 x i8]* addrspacecast ([21 x i8] addrspace(4)* @.str to [21 x i8]*) to i64)), i64 1))), %32 ], [ %470, %462 ]
  %38 = phi i8 addrspace(4)* [ getelementptr inbounds ([21 x i8], [21 x i8] addrspace(4)* @.str, i64 0, i64 0), %32 ], [ %471, %462 ]
  %39 = phi <2 x i64> [ %35, %32 ], [ %469, %462 ]
  %40 = icmp ugt i64 %37, 56
  %41 = extractelement <2 x i64> %39, i64 0
  %42 = or i64 %41, %33
  %43 = insertelement <2 x i64> poison, i64 %42, i64 0
  %44 = select i1 %40, <2 x i64> %39, <2 x i64> %43
  %45 = tail call i64 @llvm.umin.i64(i64 %37, i64 56)
  %46 = trunc i64 %45 to i32
  %47 = extractelement <2 x i64> %44, i64 0
  %48 = icmp ugt i32 %46, 7
  br i1 %48, label %51, label %49

49:                                               ; preds = %36
  %50 = icmp eq i32 %46, 0
  br i1 %50, label %104, label %91

51:                                               ; preds = %36
  %52 = load i8, i8 addrspace(4)* %38, align 1, !tbaa !15
  %53 = zext i8 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 1
  %55 = load i8, i8 addrspace(4)* %54, align 1, !tbaa !15
  %56 = zext i8 %55 to i64
  %57 = shl nuw nsw i64 %56, 8
  %58 = or i64 %57, %53
  %59 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 2
  %60 = load i8, i8 addrspace(4)* %59, align 1, !tbaa !15
  %61 = zext i8 %60 to i64
  %62 = shl nuw nsw i64 %61, 16
  %63 = or i64 %58, %62
  %64 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 3
  %65 = load i8, i8 addrspace(4)* %64, align 1, !tbaa !15
  %66 = zext i8 %65 to i64
  %67 = shl nuw nsw i64 %66, 24
  %68 = or i64 %63, %67
  %69 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 4
  %70 = load i8, i8 addrspace(4)* %69, align 1, !tbaa !15
  %71 = zext i8 %70 to i64
  %72 = shl nuw nsw i64 %71, 32
  %73 = or i64 %68, %72
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 5
  %75 = load i8, i8 addrspace(4)* %74, align 1, !tbaa !15
  %76 = zext i8 %75 to i64
  %77 = shl nuw nsw i64 %76, 40
  %78 = or i64 %73, %77
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 6
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !15
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 48
  %83 = or i64 %78, %82
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 7
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !15
  %86 = zext i8 %85 to i64
  %87 = shl nuw i64 %86, 56
  %88 = or i64 %83, %87
  %89 = add nsw i32 %46, -8
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 8
  br label %104

91:                                               ; preds = %49, %91
  %92 = phi i32 [ %102, %91 ], [ 0, %49 ]
  %93 = phi i64 [ %101, %91 ], [ 0, %49 ]
  %94 = zext i32 %92 to i64
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 %94
  %96 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !15
  %97 = zext i8 %96 to i64
  %98 = shl i32 %92, 3
  %99 = zext i32 %98 to i64
  %100 = shl nuw i64 %97, %99
  %101 = or i64 %100, %93
  %102 = add nuw nsw i32 %92, 1
  %103 = icmp eq i32 %102, %46
  br i1 %103, label %104, label %91, !llvm.loop !16

104:                                              ; preds = %91, %51, %49
  %105 = phi i8 addrspace(4)* [ %90, %51 ], [ %38, %49 ], [ %38, %91 ]
  %106 = phi i32 [ %89, %51 ], [ 0, %49 ], [ 0, %91 ]
  %107 = phi i64 [ %88, %51 ], [ 0, %49 ], [ %101, %91 ]
  %108 = icmp ugt i32 %106, 7
  br i1 %108, label %111, label %109

109:                                              ; preds = %104
  %110 = icmp eq i32 %106, 0
  br i1 %110, label %164, label %151

111:                                              ; preds = %104
  %112 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !15
  %113 = zext i8 %112 to i64
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 1
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !15
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 8
  %118 = or i64 %117, %113
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 2
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !15
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 16
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 3
  %125 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !15
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 24
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 4
  %130 = load i8, i8 addrspace(4)* %129, align 1, !tbaa !15
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 32
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 5
  %135 = load i8, i8 addrspace(4)* %134, align 1, !tbaa !15
  %136 = zext i8 %135 to i64
  %137 = shl nuw nsw i64 %136, 40
  %138 = or i64 %133, %137
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 6
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !15
  %141 = zext i8 %140 to i64
  %142 = shl nuw nsw i64 %141, 48
  %143 = or i64 %138, %142
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 7
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !15
  %146 = zext i8 %145 to i64
  %147 = shl nuw i64 %146, 56
  %148 = or i64 %143, %147
  %149 = add nsw i32 %106, -8
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 8
  br label %164

151:                                              ; preds = %109, %151
  %152 = phi i32 [ %162, %151 ], [ 0, %109 ]
  %153 = phi i64 [ %161, %151 ], [ 0, %109 ]
  %154 = zext i32 %152 to i64
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %105, i64 %154
  %156 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !15
  %157 = zext i8 %156 to i64
  %158 = shl i32 %152, 3
  %159 = zext i32 %158 to i64
  %160 = shl nuw i64 %157, %159
  %161 = or i64 %160, %153
  %162 = add nuw nsw i32 %152, 1
  %163 = icmp eq i32 %162, %106
  br i1 %163, label %164, label %151

164:                                              ; preds = %151, %111, %109
  %165 = phi i8 addrspace(4)* [ %150, %111 ], [ %105, %109 ], [ %105, %151 ]
  %166 = phi i32 [ %149, %111 ], [ 0, %109 ], [ 0, %151 ]
  %167 = phi i64 [ %148, %111 ], [ 0, %109 ], [ %161, %151 ]
  %168 = icmp ugt i32 %166, 7
  br i1 %168, label %171, label %169

169:                                              ; preds = %164
  %170 = icmp eq i32 %166, 0
  br i1 %170, label %224, label %211

171:                                              ; preds = %164
  %172 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !15
  %173 = zext i8 %172 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 1
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !15
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 8
  %178 = or i64 %177, %173
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 2
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !15
  %181 = zext i8 %180 to i64
  %182 = shl nuw nsw i64 %181, 16
  %183 = or i64 %178, %182
  %184 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 3
  %185 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !15
  %186 = zext i8 %185 to i64
  %187 = shl nuw nsw i64 %186, 24
  %188 = or i64 %183, %187
  %189 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 4
  %190 = load i8, i8 addrspace(4)* %189, align 1, !tbaa !15
  %191 = zext i8 %190 to i64
  %192 = shl nuw nsw i64 %191, 32
  %193 = or i64 %188, %192
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 5
  %195 = load i8, i8 addrspace(4)* %194, align 1, !tbaa !15
  %196 = zext i8 %195 to i64
  %197 = shl nuw nsw i64 %196, 40
  %198 = or i64 %193, %197
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 6
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !15
  %201 = zext i8 %200 to i64
  %202 = shl nuw nsw i64 %201, 48
  %203 = or i64 %198, %202
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 7
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !15
  %206 = zext i8 %205 to i64
  %207 = shl nuw i64 %206, 56
  %208 = or i64 %203, %207
  %209 = add nsw i32 %166, -8
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 8
  br label %224

211:                                              ; preds = %169, %211
  %212 = phi i32 [ %222, %211 ], [ 0, %169 ]
  %213 = phi i64 [ %221, %211 ], [ 0, %169 ]
  %214 = zext i32 %212 to i64
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %165, i64 %214
  %216 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !15
  %217 = zext i8 %216 to i64
  %218 = shl i32 %212, 3
  %219 = zext i32 %218 to i64
  %220 = shl nuw i64 %217, %219
  %221 = or i64 %220, %213
  %222 = add nuw nsw i32 %212, 1
  %223 = icmp eq i32 %222, %166
  br i1 %223, label %224, label %211

224:                                              ; preds = %211, %171, %169
  %225 = phi i8 addrspace(4)* [ %210, %171 ], [ %165, %169 ], [ %165, %211 ]
  %226 = phi i32 [ %209, %171 ], [ 0, %169 ], [ 0, %211 ]
  %227 = phi i64 [ %208, %171 ], [ 0, %169 ], [ %221, %211 ]
  %228 = icmp ugt i32 %226, 7
  br i1 %228, label %231, label %229

229:                                              ; preds = %224
  %230 = icmp eq i32 %226, 0
  br i1 %230, label %284, label %271

231:                                              ; preds = %224
  %232 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !15
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 1
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !15
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 8
  %238 = or i64 %237, %233
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 2
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !15
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 16
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 3
  %245 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !15
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 24
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 4
  %250 = load i8, i8 addrspace(4)* %249, align 1, !tbaa !15
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 32
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 5
  %255 = load i8, i8 addrspace(4)* %254, align 1, !tbaa !15
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 40
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 6
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !15
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 48
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 7
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !15
  %266 = zext i8 %265 to i64
  %267 = shl nuw i64 %266, 56
  %268 = or i64 %263, %267
  %269 = add nsw i32 %226, -8
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 8
  br label %284

271:                                              ; preds = %229, %271
  %272 = phi i32 [ %282, %271 ], [ 0, %229 ]
  %273 = phi i64 [ %281, %271 ], [ 0, %229 ]
  %274 = zext i32 %272 to i64
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %225, i64 %274
  %276 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !15
  %277 = zext i8 %276 to i64
  %278 = shl i32 %272, 3
  %279 = zext i32 %278 to i64
  %280 = shl nuw i64 %277, %279
  %281 = or i64 %280, %273
  %282 = add nuw nsw i32 %272, 1
  %283 = icmp eq i32 %282, %226
  br i1 %283, label %284, label %271

284:                                              ; preds = %271, %231, %229
  %285 = phi i8 addrspace(4)* [ %270, %231 ], [ %225, %229 ], [ %225, %271 ]
  %286 = phi i32 [ %269, %231 ], [ 0, %229 ], [ 0, %271 ]
  %287 = phi i64 [ %268, %231 ], [ 0, %229 ], [ %281, %271 ]
  %288 = icmp ugt i32 %286, 7
  br i1 %288, label %291, label %289

289:                                              ; preds = %284
  %290 = icmp eq i32 %286, 0
  br i1 %290, label %344, label %331

291:                                              ; preds = %284
  %292 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !15
  %293 = zext i8 %292 to i64
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 1
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !15
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 8
  %298 = or i64 %297, %293
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 2
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !15
  %301 = zext i8 %300 to i64
  %302 = shl nuw nsw i64 %301, 16
  %303 = or i64 %298, %302
  %304 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 3
  %305 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !15
  %306 = zext i8 %305 to i64
  %307 = shl nuw nsw i64 %306, 24
  %308 = or i64 %303, %307
  %309 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 4
  %310 = load i8, i8 addrspace(4)* %309, align 1, !tbaa !15
  %311 = zext i8 %310 to i64
  %312 = shl nuw nsw i64 %311, 32
  %313 = or i64 %308, %312
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 5
  %315 = load i8, i8 addrspace(4)* %314, align 1, !tbaa !15
  %316 = zext i8 %315 to i64
  %317 = shl nuw nsw i64 %316, 40
  %318 = or i64 %313, %317
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 6
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !15
  %321 = zext i8 %320 to i64
  %322 = shl nuw nsw i64 %321, 48
  %323 = or i64 %318, %322
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 7
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !15
  %326 = zext i8 %325 to i64
  %327 = shl nuw i64 %326, 56
  %328 = or i64 %323, %327
  %329 = add nsw i32 %286, -8
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 8
  br label %344

331:                                              ; preds = %289, %331
  %332 = phi i32 [ %342, %331 ], [ 0, %289 ]
  %333 = phi i64 [ %341, %331 ], [ 0, %289 ]
  %334 = zext i32 %332 to i64
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %285, i64 %334
  %336 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !15
  %337 = zext i8 %336 to i64
  %338 = shl i32 %332, 3
  %339 = zext i32 %338 to i64
  %340 = shl nuw i64 %337, %339
  %341 = or i64 %340, %333
  %342 = add nuw nsw i32 %332, 1
  %343 = icmp eq i32 %342, %286
  br i1 %343, label %344, label %331

344:                                              ; preds = %331, %291, %289
  %345 = phi i8 addrspace(4)* [ %330, %291 ], [ %285, %289 ], [ %285, %331 ]
  %346 = phi i32 [ %329, %291 ], [ 0, %289 ], [ 0, %331 ]
  %347 = phi i64 [ %328, %291 ], [ 0, %289 ], [ %341, %331 ]
  %348 = icmp ugt i32 %346, 7
  br i1 %348, label %351, label %349

349:                                              ; preds = %344
  %350 = icmp eq i32 %346, 0
  br i1 %350, label %404, label %391

351:                                              ; preds = %344
  %352 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !15
  %353 = zext i8 %352 to i64
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 1
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !15
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 8
  %358 = or i64 %357, %353
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 2
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !15
  %361 = zext i8 %360 to i64
  %362 = shl nuw nsw i64 %361, 16
  %363 = or i64 %358, %362
  %364 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 3
  %365 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !15
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 24
  %368 = or i64 %363, %367
  %369 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 4
  %370 = load i8, i8 addrspace(4)* %369, align 1, !tbaa !15
  %371 = zext i8 %370 to i64
  %372 = shl nuw nsw i64 %371, 32
  %373 = or i64 %368, %372
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 5
  %375 = load i8, i8 addrspace(4)* %374, align 1, !tbaa !15
  %376 = zext i8 %375 to i64
  %377 = shl nuw nsw i64 %376, 40
  %378 = or i64 %373, %377
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 6
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !15
  %381 = zext i8 %380 to i64
  %382 = shl nuw nsw i64 %381, 48
  %383 = or i64 %378, %382
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 7
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !15
  %386 = zext i8 %385 to i64
  %387 = shl nuw i64 %386, 56
  %388 = or i64 %383, %387
  %389 = add nsw i32 %346, -8
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 8
  br label %404

391:                                              ; preds = %349, %391
  %392 = phi i32 [ %402, %391 ], [ 0, %349 ]
  %393 = phi i64 [ %401, %391 ], [ 0, %349 ]
  %394 = zext i32 %392 to i64
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %345, i64 %394
  %396 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !15
  %397 = zext i8 %396 to i64
  %398 = shl i32 %392, 3
  %399 = zext i32 %398 to i64
  %400 = shl nuw i64 %397, %399
  %401 = or i64 %400, %393
  %402 = add nuw nsw i32 %392, 1
  %403 = icmp eq i32 %402, %346
  br i1 %403, label %404, label %391

404:                                              ; preds = %391, %351, %349
  %405 = phi i8 addrspace(4)* [ %390, %351 ], [ %345, %349 ], [ %345, %391 ]
  %406 = phi i32 [ %389, %351 ], [ 0, %349 ], [ 0, %391 ]
  %407 = phi i64 [ %388, %351 ], [ 0, %349 ], [ %401, %391 ]
  %408 = icmp ugt i32 %406, 7
  br i1 %408, label %411, label %409

409:                                              ; preds = %404
  %410 = icmp eq i32 %406, 0
  br i1 %410, label %462, label %449

411:                                              ; preds = %404
  %412 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !15
  %413 = zext i8 %412 to i64
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 1
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !15
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 8
  %418 = or i64 %417, %413
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 2
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !15
  %421 = zext i8 %420 to i64
  %422 = shl nuw nsw i64 %421, 16
  %423 = or i64 %418, %422
  %424 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 3
  %425 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !15
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 24
  %428 = or i64 %423, %427
  %429 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 4
  %430 = load i8, i8 addrspace(4)* %429, align 1, !tbaa !15
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 32
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 5
  %435 = load i8, i8 addrspace(4)* %434, align 1, !tbaa !15
  %436 = zext i8 %435 to i64
  %437 = shl nuw nsw i64 %436, 40
  %438 = or i64 %433, %437
  %439 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 6
  %440 = load i8, i8 addrspace(4)* %439, align 1, !tbaa !15
  %441 = zext i8 %440 to i64
  %442 = shl nuw nsw i64 %441, 48
  %443 = or i64 %438, %442
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 7
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !15
  %446 = zext i8 %445 to i64
  %447 = shl nuw i64 %446, 56
  %448 = or i64 %443, %447
  br label %462

449:                                              ; preds = %409, %449
  %450 = phi i32 [ %460, %449 ], [ 0, %409 ]
  %451 = phi i64 [ %459, %449 ], [ 0, %409 ]
  %452 = zext i32 %450 to i64
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %405, i64 %452
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !15
  %455 = zext i8 %454 to i64
  %456 = shl i32 %450, 3
  %457 = zext i32 %456 to i64
  %458 = shl nuw i64 %455, %457
  %459 = or i64 %458, %451
  %460 = add nuw nsw i32 %450, 1
  %461 = icmp eq i32 %460, %406
  br i1 %461, label %462, label %449

462:                                              ; preds = %449, %411, %409
  %463 = phi i64 [ %448, %411 ], [ 0, %409 ], [ %459, %449 ]
  %464 = shl nuw nsw i64 %45, 2
  %465 = add nuw nsw i64 %464, 28
  %466 = and i64 %465, 480
  %467 = and i64 %47, -225
  %468 = or i64 %467, %466
  %469 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef %468, i64 noundef %107, i64 noundef %167, i64 noundef %227, i64 noundef %287, i64 noundef %347, i64 noundef %407, i64 noundef %463) #10
  %470 = sub i64 %37, %45
  %471 = getelementptr inbounds i8, i8 addrspace(4)* %38, i64 %45
  %472 = icmp eq i64 %470, 0
  br i1 %472, label %473, label %36

473:                                              ; preds = %462, %28
  %474 = phi <2 x i64> [ %31, %28 ], [ %469, %462 ]
  %475 = extractelement <2 x i64> %474, i64 0
  %476 = and i64 %475, -225
  %477 = or i64 %476, 32
  %478 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef %477, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %479 = extractelement <2 x i64> %478, i64 0
  %480 = zext i32 %19 to i64
  %481 = and i64 %479, -227
  %482 = or i64 %481, 34
  %483 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %25, i64 noundef %482, i64 noundef %480, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %484

484:                                              ; preds = %473, %16
  %485 = icmp eq i32 %0, 0
  br i1 %485, label %981, label %486

486:                                              ; preds = %484
  %487 = zext i32 %14 to i64
  %488 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %487
  %489 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %490 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 24
  %491 = bitcast i8 addrspace(4)* %490 to i64 addrspace(4)*
  %492 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %487
  br label %493

493:                                              ; preds = %486, %978
  %494 = phi i32 [ 0, %486 ], [ %979, %978 ]
  %495 = load i32, i32 addrspace(1)* %488, align 4, !tbaa !7
  br label %496

496:                                              ; preds = %496, %493
  %497 = phi i32 [ %495, %493 ], [ %503, %496 ]
  %498 = add i32 %497, -1
  %499 = icmp ult i32 %498, 10
  %500 = sext i1 %499 to i32
  %501 = add i32 %497, %500
  %502 = cmpxchg i32 addrspace(1)* %488, i32 %497, i32 %501 syncscope("agent-one-as") monotonic monotonic, align 4
  %503 = extractvalue { i32, i1 } %502, 0
  %504 = icmp eq i32 %497, %503
  br i1 %504, label %505, label %496, !llvm.loop !18

505:                                              ; preds = %496
  br i1 %17, label %506, label %973

506:                                              ; preds = %505
  %507 = load i64, i64 addrspace(4)* %491, align 8, !tbaa !11
  %508 = inttoptr i64 %507 to i8 addrspace(1)*
  %509 = addrspacecast i8 addrspace(1)* %508 to i8*
  %510 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %509, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %511 = extractelement <2 x i64> %510, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %512, label %516

512:                                              ; preds = %506
  %513 = and i64 %511, -225
  %514 = or i64 %513, 32
  %515 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %509, i64 noundef %514, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %957

516:                                              ; preds = %506
  %517 = and i64 %511, 2
  %518 = and i64 %511, -3
  %519 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %518, i64 0
  br label %520

520:                                              ; preds = %946, %516
  %521 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str.1, i64 0, i64 24) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([25 x i8]* addrspacecast ([25 x i8] addrspace(4)* @.str.1 to [25 x i8]*) to i64)), i64 1))), %516 ], [ %954, %946 ]
  %522 = phi i8 addrspace(4)* [ getelementptr inbounds ([25 x i8], [25 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %516 ], [ %955, %946 ]
  %523 = phi <2 x i64> [ %519, %516 ], [ %953, %946 ]
  %524 = icmp ugt i64 %521, 56
  %525 = extractelement <2 x i64> %523, i64 0
  %526 = or i64 %525, %517
  %527 = insertelement <2 x i64> poison, i64 %526, i64 0
  %528 = select i1 %524, <2 x i64> %523, <2 x i64> %527
  %529 = tail call i64 @llvm.umin.i64(i64 %521, i64 56)
  %530 = trunc i64 %529 to i32
  %531 = extractelement <2 x i64> %528, i64 0
  %532 = icmp ugt i32 %530, 7
  br i1 %532, label %535, label %533

533:                                              ; preds = %520
  %534 = icmp eq i32 %530, 0
  br i1 %534, label %588, label %575

535:                                              ; preds = %520
  %536 = load i8, i8 addrspace(4)* %522, align 1, !tbaa !15
  %537 = zext i8 %536 to i64
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 1
  %539 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !15
  %540 = zext i8 %539 to i64
  %541 = shl nuw nsw i64 %540, 8
  %542 = or i64 %541, %537
  %543 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 2
  %544 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !15
  %545 = zext i8 %544 to i64
  %546 = shl nuw nsw i64 %545, 16
  %547 = or i64 %542, %546
  %548 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 3
  %549 = load i8, i8 addrspace(4)* %548, align 1, !tbaa !15
  %550 = zext i8 %549 to i64
  %551 = shl nuw nsw i64 %550, 24
  %552 = or i64 %547, %551
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 4
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !15
  %555 = zext i8 %554 to i64
  %556 = shl nuw nsw i64 %555, 32
  %557 = or i64 %552, %556
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 5
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !15
  %560 = zext i8 %559 to i64
  %561 = shl nuw nsw i64 %560, 40
  %562 = or i64 %557, %561
  %563 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 6
  %564 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !15
  %565 = zext i8 %564 to i64
  %566 = shl nuw nsw i64 %565, 48
  %567 = or i64 %562, %566
  %568 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 7
  %569 = load i8, i8 addrspace(4)* %568, align 1, !tbaa !15
  %570 = zext i8 %569 to i64
  %571 = shl nuw i64 %570, 56
  %572 = or i64 %567, %571
  %573 = add nsw i32 %530, -8
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 8
  br label %588

575:                                              ; preds = %533, %575
  %576 = phi i32 [ %586, %575 ], [ 0, %533 ]
  %577 = phi i64 [ %585, %575 ], [ 0, %533 ]
  %578 = zext i32 %576 to i64
  %579 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 %578
  %580 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !15
  %581 = zext i8 %580 to i64
  %582 = shl i32 %576, 3
  %583 = zext i32 %582 to i64
  %584 = shl nuw i64 %581, %583
  %585 = or i64 %584, %577
  %586 = add nuw nsw i32 %576, 1
  %587 = icmp eq i32 %586, %530
  br i1 %587, label %588, label %575, !llvm.loop !16

588:                                              ; preds = %575, %535, %533
  %589 = phi i8 addrspace(4)* [ %574, %535 ], [ %522, %533 ], [ %522, %575 ]
  %590 = phi i32 [ %573, %535 ], [ 0, %533 ], [ 0, %575 ]
  %591 = phi i64 [ %572, %535 ], [ 0, %533 ], [ %585, %575 ]
  %592 = icmp ugt i32 %590, 7
  br i1 %592, label %595, label %593

593:                                              ; preds = %588
  %594 = icmp eq i32 %590, 0
  br i1 %594, label %648, label %635

595:                                              ; preds = %588
  %596 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !15
  %597 = zext i8 %596 to i64
  %598 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 1
  %599 = load i8, i8 addrspace(4)* %598, align 1, !tbaa !15
  %600 = zext i8 %599 to i64
  %601 = shl nuw nsw i64 %600, 8
  %602 = or i64 %601, %597
  %603 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 2
  %604 = load i8, i8 addrspace(4)* %603, align 1, !tbaa !15
  %605 = zext i8 %604 to i64
  %606 = shl nuw nsw i64 %605, 16
  %607 = or i64 %602, %606
  %608 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 3
  %609 = load i8, i8 addrspace(4)* %608, align 1, !tbaa !15
  %610 = zext i8 %609 to i64
  %611 = shl nuw nsw i64 %610, 24
  %612 = or i64 %607, %611
  %613 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 4
  %614 = load i8, i8 addrspace(4)* %613, align 1, !tbaa !15
  %615 = zext i8 %614 to i64
  %616 = shl nuw nsw i64 %615, 32
  %617 = or i64 %612, %616
  %618 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 5
  %619 = load i8, i8 addrspace(4)* %618, align 1, !tbaa !15
  %620 = zext i8 %619 to i64
  %621 = shl nuw nsw i64 %620, 40
  %622 = or i64 %617, %621
  %623 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 6
  %624 = load i8, i8 addrspace(4)* %623, align 1, !tbaa !15
  %625 = zext i8 %624 to i64
  %626 = shl nuw nsw i64 %625, 48
  %627 = or i64 %622, %626
  %628 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 7
  %629 = load i8, i8 addrspace(4)* %628, align 1, !tbaa !15
  %630 = zext i8 %629 to i64
  %631 = shl nuw i64 %630, 56
  %632 = or i64 %627, %631
  %633 = add nsw i32 %590, -8
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 8
  br label %648

635:                                              ; preds = %593, %635
  %636 = phi i32 [ %646, %635 ], [ 0, %593 ]
  %637 = phi i64 [ %645, %635 ], [ 0, %593 ]
  %638 = zext i32 %636 to i64
  %639 = getelementptr inbounds i8, i8 addrspace(4)* %589, i64 %638
  %640 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !15
  %641 = zext i8 %640 to i64
  %642 = shl i32 %636, 3
  %643 = zext i32 %642 to i64
  %644 = shl nuw i64 %641, %643
  %645 = or i64 %644, %637
  %646 = add nuw nsw i32 %636, 1
  %647 = icmp eq i32 %646, %590
  br i1 %647, label %648, label %635

648:                                              ; preds = %635, %595, %593
  %649 = phi i8 addrspace(4)* [ %634, %595 ], [ %589, %593 ], [ %589, %635 ]
  %650 = phi i32 [ %633, %595 ], [ 0, %593 ], [ 0, %635 ]
  %651 = phi i64 [ %632, %595 ], [ 0, %593 ], [ %645, %635 ]
  %652 = icmp ugt i32 %650, 7
  br i1 %652, label %655, label %653

653:                                              ; preds = %648
  %654 = icmp eq i32 %650, 0
  br i1 %654, label %708, label %695

655:                                              ; preds = %648
  %656 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !15
  %657 = zext i8 %656 to i64
  %658 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 1
  %659 = load i8, i8 addrspace(4)* %658, align 1, !tbaa !15
  %660 = zext i8 %659 to i64
  %661 = shl nuw nsw i64 %660, 8
  %662 = or i64 %661, %657
  %663 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 2
  %664 = load i8, i8 addrspace(4)* %663, align 1, !tbaa !15
  %665 = zext i8 %664 to i64
  %666 = shl nuw nsw i64 %665, 16
  %667 = or i64 %662, %666
  %668 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 3
  %669 = load i8, i8 addrspace(4)* %668, align 1, !tbaa !15
  %670 = zext i8 %669 to i64
  %671 = shl nuw nsw i64 %670, 24
  %672 = or i64 %667, %671
  %673 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 4
  %674 = load i8, i8 addrspace(4)* %673, align 1, !tbaa !15
  %675 = zext i8 %674 to i64
  %676 = shl nuw nsw i64 %675, 32
  %677 = or i64 %672, %676
  %678 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 5
  %679 = load i8, i8 addrspace(4)* %678, align 1, !tbaa !15
  %680 = zext i8 %679 to i64
  %681 = shl nuw nsw i64 %680, 40
  %682 = or i64 %677, %681
  %683 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 6
  %684 = load i8, i8 addrspace(4)* %683, align 1, !tbaa !15
  %685 = zext i8 %684 to i64
  %686 = shl nuw nsw i64 %685, 48
  %687 = or i64 %682, %686
  %688 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 7
  %689 = load i8, i8 addrspace(4)* %688, align 1, !tbaa !15
  %690 = zext i8 %689 to i64
  %691 = shl nuw i64 %690, 56
  %692 = or i64 %687, %691
  %693 = add nsw i32 %650, -8
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 8
  br label %708

695:                                              ; preds = %653, %695
  %696 = phi i32 [ %706, %695 ], [ 0, %653 ]
  %697 = phi i64 [ %705, %695 ], [ 0, %653 ]
  %698 = zext i32 %696 to i64
  %699 = getelementptr inbounds i8, i8 addrspace(4)* %649, i64 %698
  %700 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !15
  %701 = zext i8 %700 to i64
  %702 = shl i32 %696, 3
  %703 = zext i32 %702 to i64
  %704 = shl nuw i64 %701, %703
  %705 = or i64 %704, %697
  %706 = add nuw nsw i32 %696, 1
  %707 = icmp eq i32 %706, %650
  br i1 %707, label %708, label %695

708:                                              ; preds = %695, %655, %653
  %709 = phi i8 addrspace(4)* [ %694, %655 ], [ %649, %653 ], [ %649, %695 ]
  %710 = phi i32 [ %693, %655 ], [ 0, %653 ], [ 0, %695 ]
  %711 = phi i64 [ %692, %655 ], [ 0, %653 ], [ %705, %695 ]
  %712 = icmp ugt i32 %710, 7
  br i1 %712, label %715, label %713

713:                                              ; preds = %708
  %714 = icmp eq i32 %710, 0
  br i1 %714, label %768, label %755

715:                                              ; preds = %708
  %716 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !15
  %717 = zext i8 %716 to i64
  %718 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 1
  %719 = load i8, i8 addrspace(4)* %718, align 1, !tbaa !15
  %720 = zext i8 %719 to i64
  %721 = shl nuw nsw i64 %720, 8
  %722 = or i64 %721, %717
  %723 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 2
  %724 = load i8, i8 addrspace(4)* %723, align 1, !tbaa !15
  %725 = zext i8 %724 to i64
  %726 = shl nuw nsw i64 %725, 16
  %727 = or i64 %722, %726
  %728 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 3
  %729 = load i8, i8 addrspace(4)* %728, align 1, !tbaa !15
  %730 = zext i8 %729 to i64
  %731 = shl nuw nsw i64 %730, 24
  %732 = or i64 %727, %731
  %733 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 4
  %734 = load i8, i8 addrspace(4)* %733, align 1, !tbaa !15
  %735 = zext i8 %734 to i64
  %736 = shl nuw nsw i64 %735, 32
  %737 = or i64 %732, %736
  %738 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 5
  %739 = load i8, i8 addrspace(4)* %738, align 1, !tbaa !15
  %740 = zext i8 %739 to i64
  %741 = shl nuw nsw i64 %740, 40
  %742 = or i64 %737, %741
  %743 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 6
  %744 = load i8, i8 addrspace(4)* %743, align 1, !tbaa !15
  %745 = zext i8 %744 to i64
  %746 = shl nuw nsw i64 %745, 48
  %747 = or i64 %742, %746
  %748 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 7
  %749 = load i8, i8 addrspace(4)* %748, align 1, !tbaa !15
  %750 = zext i8 %749 to i64
  %751 = shl nuw i64 %750, 56
  %752 = or i64 %747, %751
  %753 = add nsw i32 %710, -8
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 8
  br label %768

755:                                              ; preds = %713, %755
  %756 = phi i32 [ %766, %755 ], [ 0, %713 ]
  %757 = phi i64 [ %765, %755 ], [ 0, %713 ]
  %758 = zext i32 %756 to i64
  %759 = getelementptr inbounds i8, i8 addrspace(4)* %709, i64 %758
  %760 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !15
  %761 = zext i8 %760 to i64
  %762 = shl i32 %756, 3
  %763 = zext i32 %762 to i64
  %764 = shl nuw i64 %761, %763
  %765 = or i64 %764, %757
  %766 = add nuw nsw i32 %756, 1
  %767 = icmp eq i32 %766, %710
  br i1 %767, label %768, label %755

768:                                              ; preds = %755, %715, %713
  %769 = phi i8 addrspace(4)* [ %754, %715 ], [ %709, %713 ], [ %709, %755 ]
  %770 = phi i32 [ %753, %715 ], [ 0, %713 ], [ 0, %755 ]
  %771 = phi i64 [ %752, %715 ], [ 0, %713 ], [ %765, %755 ]
  %772 = icmp ugt i32 %770, 7
  br i1 %772, label %775, label %773

773:                                              ; preds = %768
  %774 = icmp eq i32 %770, 0
  br i1 %774, label %828, label %815

775:                                              ; preds = %768
  %776 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !15
  %777 = zext i8 %776 to i64
  %778 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 1
  %779 = load i8, i8 addrspace(4)* %778, align 1, !tbaa !15
  %780 = zext i8 %779 to i64
  %781 = shl nuw nsw i64 %780, 8
  %782 = or i64 %781, %777
  %783 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 2
  %784 = load i8, i8 addrspace(4)* %783, align 1, !tbaa !15
  %785 = zext i8 %784 to i64
  %786 = shl nuw nsw i64 %785, 16
  %787 = or i64 %782, %786
  %788 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 3
  %789 = load i8, i8 addrspace(4)* %788, align 1, !tbaa !15
  %790 = zext i8 %789 to i64
  %791 = shl nuw nsw i64 %790, 24
  %792 = or i64 %787, %791
  %793 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 4
  %794 = load i8, i8 addrspace(4)* %793, align 1, !tbaa !15
  %795 = zext i8 %794 to i64
  %796 = shl nuw nsw i64 %795, 32
  %797 = or i64 %792, %796
  %798 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 5
  %799 = load i8, i8 addrspace(4)* %798, align 1, !tbaa !15
  %800 = zext i8 %799 to i64
  %801 = shl nuw nsw i64 %800, 40
  %802 = or i64 %797, %801
  %803 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 6
  %804 = load i8, i8 addrspace(4)* %803, align 1, !tbaa !15
  %805 = zext i8 %804 to i64
  %806 = shl nuw nsw i64 %805, 48
  %807 = or i64 %802, %806
  %808 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 7
  %809 = load i8, i8 addrspace(4)* %808, align 1, !tbaa !15
  %810 = zext i8 %809 to i64
  %811 = shl nuw i64 %810, 56
  %812 = or i64 %807, %811
  %813 = add nsw i32 %770, -8
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 8
  br label %828

815:                                              ; preds = %773, %815
  %816 = phi i32 [ %826, %815 ], [ 0, %773 ]
  %817 = phi i64 [ %825, %815 ], [ 0, %773 ]
  %818 = zext i32 %816 to i64
  %819 = getelementptr inbounds i8, i8 addrspace(4)* %769, i64 %818
  %820 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !15
  %821 = zext i8 %820 to i64
  %822 = shl i32 %816, 3
  %823 = zext i32 %822 to i64
  %824 = shl nuw i64 %821, %823
  %825 = or i64 %824, %817
  %826 = add nuw nsw i32 %816, 1
  %827 = icmp eq i32 %826, %770
  br i1 %827, label %828, label %815

828:                                              ; preds = %815, %775, %773
  %829 = phi i8 addrspace(4)* [ %814, %775 ], [ %769, %773 ], [ %769, %815 ]
  %830 = phi i32 [ %813, %775 ], [ 0, %773 ], [ 0, %815 ]
  %831 = phi i64 [ %812, %775 ], [ 0, %773 ], [ %825, %815 ]
  %832 = icmp ugt i32 %830, 7
  br i1 %832, label %835, label %833

833:                                              ; preds = %828
  %834 = icmp eq i32 %830, 0
  br i1 %834, label %888, label %875

835:                                              ; preds = %828
  %836 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !15
  %837 = zext i8 %836 to i64
  %838 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 1
  %839 = load i8, i8 addrspace(4)* %838, align 1, !tbaa !15
  %840 = zext i8 %839 to i64
  %841 = shl nuw nsw i64 %840, 8
  %842 = or i64 %841, %837
  %843 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 2
  %844 = load i8, i8 addrspace(4)* %843, align 1, !tbaa !15
  %845 = zext i8 %844 to i64
  %846 = shl nuw nsw i64 %845, 16
  %847 = or i64 %842, %846
  %848 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 3
  %849 = load i8, i8 addrspace(4)* %848, align 1, !tbaa !15
  %850 = zext i8 %849 to i64
  %851 = shl nuw nsw i64 %850, 24
  %852 = or i64 %847, %851
  %853 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 4
  %854 = load i8, i8 addrspace(4)* %853, align 1, !tbaa !15
  %855 = zext i8 %854 to i64
  %856 = shl nuw nsw i64 %855, 32
  %857 = or i64 %852, %856
  %858 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 5
  %859 = load i8, i8 addrspace(4)* %858, align 1, !tbaa !15
  %860 = zext i8 %859 to i64
  %861 = shl nuw nsw i64 %860, 40
  %862 = or i64 %857, %861
  %863 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 6
  %864 = load i8, i8 addrspace(4)* %863, align 1, !tbaa !15
  %865 = zext i8 %864 to i64
  %866 = shl nuw nsw i64 %865, 48
  %867 = or i64 %862, %866
  %868 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 7
  %869 = load i8, i8 addrspace(4)* %868, align 1, !tbaa !15
  %870 = zext i8 %869 to i64
  %871 = shl nuw i64 %870, 56
  %872 = or i64 %867, %871
  %873 = add nsw i32 %830, -8
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 8
  br label %888

875:                                              ; preds = %833, %875
  %876 = phi i32 [ %886, %875 ], [ 0, %833 ]
  %877 = phi i64 [ %885, %875 ], [ 0, %833 ]
  %878 = zext i32 %876 to i64
  %879 = getelementptr inbounds i8, i8 addrspace(4)* %829, i64 %878
  %880 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !15
  %881 = zext i8 %880 to i64
  %882 = shl i32 %876, 3
  %883 = zext i32 %882 to i64
  %884 = shl nuw i64 %881, %883
  %885 = or i64 %884, %877
  %886 = add nuw nsw i32 %876, 1
  %887 = icmp eq i32 %886, %830
  br i1 %887, label %888, label %875

888:                                              ; preds = %875, %835, %833
  %889 = phi i8 addrspace(4)* [ %874, %835 ], [ %829, %833 ], [ %829, %875 ]
  %890 = phi i32 [ %873, %835 ], [ 0, %833 ], [ 0, %875 ]
  %891 = phi i64 [ %872, %835 ], [ 0, %833 ], [ %885, %875 ]
  %892 = icmp ugt i32 %890, 7
  br i1 %892, label %895, label %893

893:                                              ; preds = %888
  %894 = icmp eq i32 %890, 0
  br i1 %894, label %946, label %933

895:                                              ; preds = %888
  %896 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !15
  %897 = zext i8 %896 to i64
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 1
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !15
  %900 = zext i8 %899 to i64
  %901 = shl nuw nsw i64 %900, 8
  %902 = or i64 %901, %897
  %903 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 2
  %904 = load i8, i8 addrspace(4)* %903, align 1, !tbaa !15
  %905 = zext i8 %904 to i64
  %906 = shl nuw nsw i64 %905, 16
  %907 = or i64 %902, %906
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 3
  %909 = load i8, i8 addrspace(4)* %908, align 1, !tbaa !15
  %910 = zext i8 %909 to i64
  %911 = shl nuw nsw i64 %910, 24
  %912 = or i64 %907, %911
  %913 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 4
  %914 = load i8, i8 addrspace(4)* %913, align 1, !tbaa !15
  %915 = zext i8 %914 to i64
  %916 = shl nuw nsw i64 %915, 32
  %917 = or i64 %912, %916
  %918 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 5
  %919 = load i8, i8 addrspace(4)* %918, align 1, !tbaa !15
  %920 = zext i8 %919 to i64
  %921 = shl nuw nsw i64 %920, 40
  %922 = or i64 %917, %921
  %923 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 6
  %924 = load i8, i8 addrspace(4)* %923, align 1, !tbaa !15
  %925 = zext i8 %924 to i64
  %926 = shl nuw nsw i64 %925, 48
  %927 = or i64 %922, %926
  %928 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 7
  %929 = load i8, i8 addrspace(4)* %928, align 1, !tbaa !15
  %930 = zext i8 %929 to i64
  %931 = shl nuw i64 %930, 56
  %932 = or i64 %927, %931
  br label %946

933:                                              ; preds = %893, %933
  %934 = phi i32 [ %944, %933 ], [ 0, %893 ]
  %935 = phi i64 [ %943, %933 ], [ 0, %893 ]
  %936 = zext i32 %934 to i64
  %937 = getelementptr inbounds i8, i8 addrspace(4)* %889, i64 %936
  %938 = load i8, i8 addrspace(4)* %937, align 1, !tbaa !15
  %939 = zext i8 %938 to i64
  %940 = shl i32 %934, 3
  %941 = zext i32 %940 to i64
  %942 = shl nuw i64 %939, %941
  %943 = or i64 %942, %935
  %944 = add nuw nsw i32 %934, 1
  %945 = icmp eq i32 %944, %890
  br i1 %945, label %946, label %933

946:                                              ; preds = %933, %895, %893
  %947 = phi i64 [ %932, %895 ], [ 0, %893 ], [ %943, %933 ]
  %948 = shl nuw nsw i64 %529, 2
  %949 = add nuw nsw i64 %948, 28
  %950 = and i64 %949, 480
  %951 = and i64 %531, -225
  %952 = or i64 %951, %950
  %953 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %509, i64 noundef %952, i64 noundef %591, i64 noundef %651, i64 noundef %711, i64 noundef %771, i64 noundef %831, i64 noundef %891, i64 noundef %947) #10
  %954 = sub i64 %521, %529
  %955 = getelementptr inbounds i8, i8 addrspace(4)* %522, i64 %529
  %956 = icmp eq i64 %954, 0
  br i1 %956, label %957, label %520

957:                                              ; preds = %946, %512
  %958 = phi <2 x i64> [ %515, %512 ], [ %953, %946 ]
  %959 = extractelement <2 x i64> %958, i64 0
  %960 = and i64 %959, -225
  %961 = or i64 %960, 32
  %962 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %509, i64 noundef %961, i64 noundef %487, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %963 = extractelement <2 x i64> %962, i64 0
  %964 = zext i32 %494 to i64
  %965 = and i64 %963, -225
  %966 = or i64 %965, 32
  %967 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %509, i64 noundef %966, i64 noundef %964, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %968 = extractelement <2 x i64> %967, i64 0
  %969 = zext i32 %497 to i64
  %970 = and i64 %968, -227
  %971 = or i64 %970, 34
  %972 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %509, i64 noundef %971, i64 noundef %969, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %973

973:                                              ; preds = %957, %505
  %974 = icmp eq i32 %497, 0
  br i1 %974, label %978, label %975

975:                                              ; preds = %973
  %976 = load i32, i32 addrspace(1)* %492, align 4, !tbaa !7
  %977 = add i32 %976, 1
  store i32 %977, i32 addrspace(1)* %492, align 4, !tbaa !7
  br label %978

978:                                              ; preds = %975, %973
  %979 = add nuw i32 %494, 1
  %980 = icmp eq i32 %979, %0
  br i1 %980, label %981, label %493, !llvm.loop !20

981:                                              ; preds = %978, %484, %5
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !21
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !25
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !21
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !26
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !21
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !31) #11
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !21
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = distinct !{!20, !19}
!21 = !{!22, !22, i64 0}
!22 = !{!"any pointer", !13, i64 0}
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !13, i64 0}
!25 = !{i64 2662}
!26 = !{!27, !22, i64 0}
!27 = !{!"", !22, i64 0, !22, i64 8, !28, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!28 = !{!"hsa_signal_s", !12, i64 0}
!29 = !{!27, !12, i64 40}
!30 = !{!27, !22, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !24, i64 16}
!33 = !{!"", !12, i64 0, !12, i64 8, !24, i64 16, !24, i64 20}
!34 = !{!33, !12, i64 8}
!35 = !{!33, !24, i64 20}
!36 = !{!33, !12, i64 0}
!37 = !{!38, !12, i64 16}
!38 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !24, i64 24, !24, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!39 = !{!38, !24, i64 24}
