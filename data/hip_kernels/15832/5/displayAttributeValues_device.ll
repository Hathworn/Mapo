; ModuleID = '../data/hip_kernels/15832/5/main.cu'
source_filename = "../data/hip_kernels/15832/5/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [216 x i8] c"\0AthreadIdx.x : %d,  threadIdx.y : %d,  threadIdx.z : %d,  blockIdx.x : %d,  blockIdx.y : %d,  blockIdx.z : %d,  blockDim.x : %d,  blockDim.y : %d,  blockDim.z : %d,  gridDim.x : %d,  gridDim.y : %d,  gridDim.z : %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z22displayAttributeValuesv() local_unnamed_addr #1 {
  %1 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %2 = getelementptr i8, i8 addrspace(4)* %1, i64 4
  %3 = bitcast i8 addrspace(4)* %2 to i16 addrspace(4)*
  %4 = load i16, i16 addrspace(4)* %3, align 4, !range !4, !invariant.load !5
  %5 = zext i16 %4 to i32
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !6
  %9 = getelementptr i8, i8 addrspace(4)* %1, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 16
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 8, !tbaa !15
  %16 = getelementptr i8, i8 addrspace(4)* %1, i64 8
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %1, i64 20
  %21 = bitcast i8 addrspace(4)* %20 to i32 addrspace(4)*
  %22 = load i32, i32 addrspace(4)* %21, align 4, !tbaa !16
  %23 = udiv i32 %8, %5
  %24 = udiv i32 %15, %12
  %25 = udiv i32 %22, %19
  %26 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %26, i64 24
  %28 = bitcast i8 addrspace(4)* %27 to i64 addrspace(4)*
  %29 = load i64, i64 addrspace(4)* %28, align 8, !tbaa !17
  %30 = inttoptr i64 %29 to i8 addrspace(1)*
  %31 = addrspacecast i8 addrspace(1)* %30 to i8*
  %32 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %33 = extractelement <2 x i64> %32, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([216 x i8], [216 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %43, label %34

34:                                               ; preds = %0, %34
  %35 = phi i8 addrspace(4)* [ %36, %34 ], [ getelementptr inbounds ([216 x i8], [216 x i8] addrspace(4)* @.str, i64 0, i64 0), %0 ]
  %36 = getelementptr i8, i8 addrspace(4)* %35, i64 1
  %37 = load i8, i8 addrspace(4)* %35, align 1
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %39, label %34

39:                                               ; preds = %34
  %40 = addrspacecast i8 addrspace(4)* %35 to i8*
  %41 = ptrtoint i8* %40 to i64
  %42 = add i64 %41, add (i64 sub (i64 0, i64 ptrtoint ([216 x i8]* addrspacecast ([216 x i8] addrspace(4)* @.str to [216 x i8]*) to i64)), i64 1)
  br label %43

43:                                               ; preds = %39, %0
  %44 = phi i64 [ %42, %39 ], [ 0, %0 ]
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([216 x i8], [216 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %45, label %49

45:                                               ; preds = %43
  %46 = and i64 %33, -225
  %47 = or i64 %46, 32
  %48 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %47, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %490

49:                                               ; preds = %43
  %50 = and i64 %33, 2
  %51 = and i64 %33, -3
  %52 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %51, i64 0
  br label %53

53:                                               ; preds = %479, %49
  %54 = phi i64 [ %44, %49 ], [ %487, %479 ]
  %55 = phi i8 addrspace(4)* [ getelementptr inbounds ([216 x i8], [216 x i8] addrspace(4)* @.str, i64 0, i64 0), %49 ], [ %488, %479 ]
  %56 = phi <2 x i64> [ %52, %49 ], [ %486, %479 ]
  %57 = icmp ugt i64 %54, 56
  %58 = extractelement <2 x i64> %56, i64 0
  %59 = or i64 %58, %50
  %60 = insertelement <2 x i64> poison, i64 %59, i64 0
  %61 = select i1 %57, <2 x i64> %56, <2 x i64> %60
  %62 = tail call i64 @llvm.umin.i64(i64 %54, i64 56)
  %63 = trunc i64 %62 to i32
  %64 = extractelement <2 x i64> %61, i64 0
  %65 = icmp ugt i32 %63, 7
  br i1 %65, label %68, label %66

66:                                               ; preds = %53
  %67 = icmp eq i32 %63, 0
  br i1 %67, label %121, label %108

68:                                               ; preds = %53
  %69 = load i8, i8 addrspace(4)* %55, align 1, !tbaa !18
  %70 = zext i8 %69 to i64
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 1
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !18
  %73 = zext i8 %72 to i64
  %74 = shl nuw nsw i64 %73, 8
  %75 = or i64 %74, %70
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 2
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !18
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 16
  %80 = or i64 %75, %79
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 3
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !18
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 24
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 4
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !18
  %88 = zext i8 %87 to i64
  %89 = shl nuw nsw i64 %88, 32
  %90 = or i64 %85, %89
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 5
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !18
  %93 = zext i8 %92 to i64
  %94 = shl nuw nsw i64 %93, 40
  %95 = or i64 %90, %94
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 6
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !18
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 48
  %100 = or i64 %95, %99
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 7
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !18
  %103 = zext i8 %102 to i64
  %104 = shl nuw i64 %103, 56
  %105 = or i64 %100, %104
  %106 = add nsw i32 %63, -8
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 8
  br label %121

108:                                              ; preds = %66, %108
  %109 = phi i32 [ %119, %108 ], [ 0, %66 ]
  %110 = phi i64 [ %118, %108 ], [ 0, %66 ]
  %111 = zext i32 %109 to i64
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 %111
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !18
  %114 = zext i8 %113 to i64
  %115 = shl i32 %109, 3
  %116 = zext i32 %115 to i64
  %117 = shl nuw i64 %114, %116
  %118 = or i64 %117, %110
  %119 = add nuw nsw i32 %109, 1
  %120 = icmp eq i32 %119, %63
  br i1 %120, label %121, label %108, !llvm.loop !19

121:                                              ; preds = %108, %68, %66
  %122 = phi i8 addrspace(4)* [ %107, %68 ], [ %55, %66 ], [ %55, %108 ]
  %123 = phi i32 [ %106, %68 ], [ 0, %66 ], [ 0, %108 ]
  %124 = phi i64 [ %105, %68 ], [ 0, %66 ], [ %118, %108 ]
  %125 = icmp ugt i32 %123, 7
  br i1 %125, label %128, label %126

126:                                              ; preds = %121
  %127 = icmp eq i32 %123, 0
  br i1 %127, label %181, label %168

128:                                              ; preds = %121
  %129 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !18
  %130 = zext i8 %129 to i64
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 1
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !18
  %133 = zext i8 %132 to i64
  %134 = shl nuw nsw i64 %133, 8
  %135 = or i64 %134, %130
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 2
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !18
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 16
  %140 = or i64 %135, %139
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 3
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !18
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 24
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 4
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !18
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 32
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 5
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !18
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 40
  %155 = or i64 %150, %154
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 6
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !18
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 48
  %160 = or i64 %155, %159
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 7
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !18
  %163 = zext i8 %162 to i64
  %164 = shl nuw i64 %163, 56
  %165 = or i64 %160, %164
  %166 = add nsw i32 %123, -8
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 8
  br label %181

168:                                              ; preds = %126, %168
  %169 = phi i32 [ %179, %168 ], [ 0, %126 ]
  %170 = phi i64 [ %178, %168 ], [ 0, %126 ]
  %171 = zext i32 %169 to i64
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %122, i64 %171
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !18
  %174 = zext i8 %173 to i64
  %175 = shl i32 %169, 3
  %176 = zext i32 %175 to i64
  %177 = shl nuw i64 %174, %176
  %178 = or i64 %177, %170
  %179 = add nuw nsw i32 %169, 1
  %180 = icmp eq i32 %179, %123
  br i1 %180, label %181, label %168

181:                                              ; preds = %168, %128, %126
  %182 = phi i8 addrspace(4)* [ %167, %128 ], [ %122, %126 ], [ %122, %168 ]
  %183 = phi i32 [ %166, %128 ], [ 0, %126 ], [ 0, %168 ]
  %184 = phi i64 [ %165, %128 ], [ 0, %126 ], [ %178, %168 ]
  %185 = icmp ugt i32 %183, 7
  br i1 %185, label %188, label %186

186:                                              ; preds = %181
  %187 = icmp eq i32 %183, 0
  br i1 %187, label %241, label %228

188:                                              ; preds = %181
  %189 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !18
  %190 = zext i8 %189 to i64
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 1
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !18
  %193 = zext i8 %192 to i64
  %194 = shl nuw nsw i64 %193, 8
  %195 = or i64 %194, %190
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 2
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !18
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 16
  %200 = or i64 %195, %199
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 3
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !18
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 24
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 4
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !18
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 32
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 5
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !18
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 40
  %215 = or i64 %210, %214
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 6
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !18
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 48
  %220 = or i64 %215, %219
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 7
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !18
  %223 = zext i8 %222 to i64
  %224 = shl nuw i64 %223, 56
  %225 = or i64 %220, %224
  %226 = add nsw i32 %183, -8
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 8
  br label %241

228:                                              ; preds = %186, %228
  %229 = phi i32 [ %239, %228 ], [ 0, %186 ]
  %230 = phi i64 [ %238, %228 ], [ 0, %186 ]
  %231 = zext i32 %229 to i64
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %182, i64 %231
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !18
  %234 = zext i8 %233 to i64
  %235 = shl i32 %229, 3
  %236 = zext i32 %235 to i64
  %237 = shl nuw i64 %234, %236
  %238 = or i64 %237, %230
  %239 = add nuw nsw i32 %229, 1
  %240 = icmp eq i32 %239, %183
  br i1 %240, label %241, label %228

241:                                              ; preds = %228, %188, %186
  %242 = phi i8 addrspace(4)* [ %227, %188 ], [ %182, %186 ], [ %182, %228 ]
  %243 = phi i32 [ %226, %188 ], [ 0, %186 ], [ 0, %228 ]
  %244 = phi i64 [ %225, %188 ], [ 0, %186 ], [ %238, %228 ]
  %245 = icmp ugt i32 %243, 7
  br i1 %245, label %248, label %246

246:                                              ; preds = %241
  %247 = icmp eq i32 %243, 0
  br i1 %247, label %301, label %288

248:                                              ; preds = %241
  %249 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !18
  %250 = zext i8 %249 to i64
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 1
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !18
  %253 = zext i8 %252 to i64
  %254 = shl nuw nsw i64 %253, 8
  %255 = or i64 %254, %250
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 2
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !18
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 16
  %260 = or i64 %255, %259
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 3
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !18
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 24
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 4
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !18
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 32
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 5
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !18
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 40
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 6
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !18
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 48
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 7
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !18
  %283 = zext i8 %282 to i64
  %284 = shl nuw i64 %283, 56
  %285 = or i64 %280, %284
  %286 = add nsw i32 %243, -8
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 8
  br label %301

288:                                              ; preds = %246, %288
  %289 = phi i32 [ %299, %288 ], [ 0, %246 ]
  %290 = phi i64 [ %298, %288 ], [ 0, %246 ]
  %291 = zext i32 %289 to i64
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %242, i64 %291
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !18
  %294 = zext i8 %293 to i64
  %295 = shl i32 %289, 3
  %296 = zext i32 %295 to i64
  %297 = shl nuw i64 %294, %296
  %298 = or i64 %297, %290
  %299 = add nuw nsw i32 %289, 1
  %300 = icmp eq i32 %299, %243
  br i1 %300, label %301, label %288

301:                                              ; preds = %288, %248, %246
  %302 = phi i8 addrspace(4)* [ %287, %248 ], [ %242, %246 ], [ %242, %288 ]
  %303 = phi i32 [ %286, %248 ], [ 0, %246 ], [ 0, %288 ]
  %304 = phi i64 [ %285, %248 ], [ 0, %246 ], [ %298, %288 ]
  %305 = icmp ugt i32 %303, 7
  br i1 %305, label %308, label %306

306:                                              ; preds = %301
  %307 = icmp eq i32 %303, 0
  br i1 %307, label %361, label %348

308:                                              ; preds = %301
  %309 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !18
  %310 = zext i8 %309 to i64
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 1
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !18
  %313 = zext i8 %312 to i64
  %314 = shl nuw nsw i64 %313, 8
  %315 = or i64 %314, %310
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 2
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !18
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 16
  %320 = or i64 %315, %319
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 3
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !18
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 24
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 4
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !18
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 32
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 5
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !18
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 40
  %335 = or i64 %330, %334
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 6
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !18
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 48
  %340 = or i64 %335, %339
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 7
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !18
  %343 = zext i8 %342 to i64
  %344 = shl nuw i64 %343, 56
  %345 = or i64 %340, %344
  %346 = add nsw i32 %303, -8
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 8
  br label %361

348:                                              ; preds = %306, %348
  %349 = phi i32 [ %359, %348 ], [ 0, %306 ]
  %350 = phi i64 [ %358, %348 ], [ 0, %306 ]
  %351 = zext i32 %349 to i64
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %302, i64 %351
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !18
  %354 = zext i8 %353 to i64
  %355 = shl i32 %349, 3
  %356 = zext i32 %355 to i64
  %357 = shl nuw i64 %354, %356
  %358 = or i64 %357, %350
  %359 = add nuw nsw i32 %349, 1
  %360 = icmp eq i32 %359, %303
  br i1 %360, label %361, label %348

361:                                              ; preds = %348, %308, %306
  %362 = phi i8 addrspace(4)* [ %347, %308 ], [ %302, %306 ], [ %302, %348 ]
  %363 = phi i32 [ %346, %308 ], [ 0, %306 ], [ 0, %348 ]
  %364 = phi i64 [ %345, %308 ], [ 0, %306 ], [ %358, %348 ]
  %365 = icmp ugt i32 %363, 7
  br i1 %365, label %368, label %366

366:                                              ; preds = %361
  %367 = icmp eq i32 %363, 0
  br i1 %367, label %421, label %408

368:                                              ; preds = %361
  %369 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !18
  %370 = zext i8 %369 to i64
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 1
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !18
  %373 = zext i8 %372 to i64
  %374 = shl nuw nsw i64 %373, 8
  %375 = or i64 %374, %370
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 2
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !18
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 16
  %380 = or i64 %375, %379
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 3
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !18
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 24
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 4
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !18
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 32
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 5
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !18
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 40
  %395 = or i64 %390, %394
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 6
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !18
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 48
  %400 = or i64 %395, %399
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 7
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !18
  %403 = zext i8 %402 to i64
  %404 = shl nuw i64 %403, 56
  %405 = or i64 %400, %404
  %406 = add nsw i32 %363, -8
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 8
  br label %421

408:                                              ; preds = %366, %408
  %409 = phi i32 [ %419, %408 ], [ 0, %366 ]
  %410 = phi i64 [ %418, %408 ], [ 0, %366 ]
  %411 = zext i32 %409 to i64
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %362, i64 %411
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !18
  %414 = zext i8 %413 to i64
  %415 = shl i32 %409, 3
  %416 = zext i32 %415 to i64
  %417 = shl nuw i64 %414, %416
  %418 = or i64 %417, %410
  %419 = add nuw nsw i32 %409, 1
  %420 = icmp eq i32 %419, %363
  br i1 %420, label %421, label %408

421:                                              ; preds = %408, %368, %366
  %422 = phi i8 addrspace(4)* [ %407, %368 ], [ %362, %366 ], [ %362, %408 ]
  %423 = phi i32 [ %406, %368 ], [ 0, %366 ], [ 0, %408 ]
  %424 = phi i64 [ %405, %368 ], [ 0, %366 ], [ %418, %408 ]
  %425 = icmp ugt i32 %423, 7
  br i1 %425, label %428, label %426

426:                                              ; preds = %421
  %427 = icmp eq i32 %423, 0
  br i1 %427, label %479, label %466

428:                                              ; preds = %421
  %429 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !18
  %430 = zext i8 %429 to i64
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 1
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !18
  %433 = zext i8 %432 to i64
  %434 = shl nuw nsw i64 %433, 8
  %435 = or i64 %434, %430
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 2
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !18
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 16
  %440 = or i64 %435, %439
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 3
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !18
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 24
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 4
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !18
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 32
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 5
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !18
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 40
  %455 = or i64 %450, %454
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 6
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !18
  %458 = zext i8 %457 to i64
  %459 = shl nuw nsw i64 %458, 48
  %460 = or i64 %455, %459
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 7
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !18
  %463 = zext i8 %462 to i64
  %464 = shl nuw i64 %463, 56
  %465 = or i64 %460, %464
  br label %479

466:                                              ; preds = %426, %466
  %467 = phi i32 [ %477, %466 ], [ 0, %426 ]
  %468 = phi i64 [ %476, %466 ], [ 0, %426 ]
  %469 = zext i32 %467 to i64
  %470 = getelementptr inbounds i8, i8 addrspace(4)* %422, i64 %469
  %471 = load i8, i8 addrspace(4)* %470, align 1, !tbaa !18
  %472 = zext i8 %471 to i64
  %473 = shl i32 %467, 3
  %474 = zext i32 %473 to i64
  %475 = shl nuw i64 %472, %474
  %476 = or i64 %475, %468
  %477 = add nuw nsw i32 %467, 1
  %478 = icmp eq i32 %477, %423
  br i1 %478, label %479, label %466

479:                                              ; preds = %466, %428, %426
  %480 = phi i64 [ %465, %428 ], [ 0, %426 ], [ %476, %466 ]
  %481 = shl nuw nsw i64 %62, 2
  %482 = add nuw nsw i64 %481, 28
  %483 = and i64 %482, 480
  %484 = and i64 %64, -225
  %485 = or i64 %484, %483
  %486 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %485, i64 noundef %124, i64 noundef %184, i64 noundef %244, i64 noundef %304, i64 noundef %364, i64 noundef %424, i64 noundef %480) #10
  %487 = sub i64 %54, %62
  %488 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 %62
  %489 = icmp eq i64 %487, 0
  br i1 %489, label %490, label %53

490:                                              ; preds = %479, %45
  %491 = phi <2 x i64> [ %48, %45 ], [ %486, %479 ]
  %492 = mul i32 %25, %19
  %493 = icmp ugt i32 %22, %492
  %494 = zext i1 %493 to i32
  %495 = add i32 %25, %494
  %496 = mul i32 %24, %12
  %497 = icmp ugt i32 %15, %496
  %498 = zext i1 %497 to i32
  %499 = add i32 %24, %498
  %500 = mul i32 %23, %5
  %501 = icmp ugt i32 %8, %500
  %502 = zext i1 %501 to i32
  %503 = add i32 %23, %502
  %504 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %505 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %506 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %507 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !21
  %508 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !21
  %509 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !21
  %510 = extractelement <2 x i64> %491, i64 0
  %511 = zext i32 %509 to i64
  %512 = and i64 %510, -225
  %513 = or i64 %512, 32
  %514 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %513, i64 noundef %511, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %515 = extractelement <2 x i64> %514, i64 0
  %516 = zext i32 %508 to i64
  %517 = and i64 %515, -225
  %518 = or i64 %517, 32
  %519 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %518, i64 noundef %516, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %520 = extractelement <2 x i64> %519, i64 0
  %521 = zext i32 %507 to i64
  %522 = and i64 %520, -225
  %523 = or i64 %522, 32
  %524 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %523, i64 noundef %521, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %525 = extractelement <2 x i64> %524, i64 0
  %526 = zext i32 %506 to i64
  %527 = and i64 %525, -225
  %528 = or i64 %527, 32
  %529 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %528, i64 noundef %526, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %530 = extractelement <2 x i64> %529, i64 0
  %531 = zext i32 %505 to i64
  %532 = and i64 %530, -225
  %533 = or i64 %532, 32
  %534 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %533, i64 noundef %531, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %535 = extractelement <2 x i64> %534, i64 0
  %536 = zext i32 %504 to i64
  %537 = and i64 %535, -225
  %538 = or i64 %537, 32
  %539 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %538, i64 noundef %536, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %540 = extractelement <2 x i64> %539, i64 0
  %541 = zext i16 %4 to i64
  %542 = and i64 %540, -225
  %543 = or i64 %542, 32
  %544 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %543, i64 noundef %541, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %545 = extractelement <2 x i64> %544, i64 0
  %546 = zext i16 %11 to i64
  %547 = and i64 %545, -225
  %548 = or i64 %547, 32
  %549 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %548, i64 noundef %546, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %550 = extractelement <2 x i64> %549, i64 0
  %551 = zext i16 %18 to i64
  %552 = and i64 %550, -225
  %553 = or i64 %552, 32
  %554 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %553, i64 noundef %551, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %555 = extractelement <2 x i64> %554, i64 0
  %556 = zext i32 %503 to i64
  %557 = and i64 %555, -225
  %558 = or i64 %557, 32
  %559 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %558, i64 noundef %556, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %560 = extractelement <2 x i64> %559, i64 0
  %561 = zext i32 %499 to i64
  %562 = and i64 %560, -225
  %563 = or i64 %562, 32
  %564 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %563, i64 noundef %561, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %565 = extractelement <2 x i64> %564, i64 0
  %566 = zext i32 %495 to i64
  %567 = and i64 %565, -227
  %568 = or i64 %567, 34
  %569 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %31, i64 noundef %568, i64 noundef %566, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !23
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !17
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !17
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !17
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !17
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !17
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !17
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !17
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !17
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !23
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !23
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !23
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !22
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !27
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !27
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !17
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !27
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !28
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !27
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !22
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !22
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !23
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !17
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !17
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !17
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !17
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !17
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !17
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !17
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !17
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %110 = call i64 @llvm.read_register.i64(metadata !29) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !30
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !32
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !33
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !17
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !17
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !17
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !17
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !17
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !17
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !17
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !17
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !27
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !34
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !34
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !35
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !37
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !17
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !17
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !17
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !23
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !23
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !27
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !25
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !34
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !34
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !18
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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{!7, !11, i64 16}
!16 = !{!7, !11, i64 20}
!17 = !{!12, !12, i64 0}
!18 = !{!9, !9, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = !{i32 0, i32 1024}
!22 = !{!13, !13, i64 0}
!23 = !{!11, !11, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !13, i64 0}
!26 = !{!"", !13, i64 0, !13, i64 8, !14, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!27 = !{!26, !12, i64 40}
!28 = !{!26, !13, i64 8}
!29 = !{!"exec"}
!30 = !{!31, !11, i64 16}
!31 = !{!"", !12, i64 0, !12, i64 8, !11, i64 16, !11, i64 20}
!32 = !{!31, !12, i64 8}
!33 = !{!31, !11, i64 20}
!34 = !{!31, !12, i64 0}
!35 = !{!36, !12, i64 16}
!36 = !{!"amd_signal_s", !12, i64 0, !9, i64 8, !12, i64 16, !11, i64 24, !11, i64 28, !12, i64 32, !12, i64 40, !9, i64 48, !9, i64 56}
!37 = !{!36, !11, i64 24}
