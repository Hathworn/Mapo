; ModuleID = '../data/hip_kernels/829/25/main.cu'
source_filename = "../data/hip_kernels/829/25/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [39 x i8] c"\0A %d -- 1) b %.5f -- s %.5f -- r %.5f \00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [39 x i8] c"\0A %d -- 2) b %.5f -- s %.5f -- r %.5f \00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [39 x i8] c"\0A %d -- 3) b %.5f -- s %.5f -- r %.5f \00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z5PrintPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #1 {
  %5 = load float, float addrspace(1)* %0, align 4, !tbaa !4, !amdgpu.noclobber !8
  %6 = fpext float %5 to double
  %7 = load float, float addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %8 = fpext float %7 to double
  %9 = load float, float addrspace(1)* %2, align 4, !tbaa !4, !amdgpu.noclobber !8
  %10 = fpext float %9 to double
  %11 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 24
  %13 = bitcast i8 addrspace(4)* %12 to i64 addrspace(4)*
  %14 = load i64, i64 addrspace(4)* %13, align 8, !tbaa !9
  %15 = inttoptr i64 %14 to i8 addrspace(1)*
  %16 = addrspacecast i8 addrspace(1)* %15 to i8*
  %17 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %18 = extractelement <2 x i64> %17, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %19, label %23

19:                                               ; preds = %4
  %20 = and i64 %18, -225
  %21 = or i64 %20, 32
  %22 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %21, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %464

23:                                               ; preds = %4
  %24 = and i64 %18, 2
  %25 = and i64 %18, -3
  %26 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %25, i64 0
  br label %27

27:                                               ; preds = %453, %23
  %28 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 38) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([39 x i8]* addrspacecast ([39 x i8] addrspace(4)* @.str to [39 x i8]*) to i64)), i64 1))), %23 ], [ %461, %453 ]
  %29 = phi i8 addrspace(4)* [ getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str, i64 0, i64 0), %23 ], [ %462, %453 ]
  %30 = phi <2 x i64> [ %26, %23 ], [ %460, %453 ]
  %31 = icmp ugt i64 %28, 56
  %32 = extractelement <2 x i64> %30, i64 0
  %33 = or i64 %32, %24
  %34 = insertelement <2 x i64> poison, i64 %33, i64 0
  %35 = select i1 %31, <2 x i64> %30, <2 x i64> %34
  %36 = tail call i64 @llvm.umin.i64(i64 %28, i64 56)
  %37 = trunc i64 %36 to i32
  %38 = extractelement <2 x i64> %35, i64 0
  %39 = icmp ugt i32 %37, 7
  br i1 %39, label %42, label %40

40:                                               ; preds = %27
  %41 = icmp eq i32 %37, 0
  br i1 %41, label %95, label %82

42:                                               ; preds = %27
  %43 = load i8, i8 addrspace(4)* %29, align 1, !tbaa !13
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 1
  %46 = load i8, i8 addrspace(4)* %45, align 1, !tbaa !13
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 8
  %49 = or i64 %48, %44
  %50 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 2
  %51 = load i8, i8 addrspace(4)* %50, align 1, !tbaa !13
  %52 = zext i8 %51 to i64
  %53 = shl nuw nsw i64 %52, 16
  %54 = or i64 %49, %53
  %55 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 3
  %56 = load i8, i8 addrspace(4)* %55, align 1, !tbaa !13
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 24
  %59 = or i64 %54, %58
  %60 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 4
  %61 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !13
  %62 = zext i8 %61 to i64
  %63 = shl nuw nsw i64 %62, 32
  %64 = or i64 %59, %63
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 5
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !13
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 40
  %69 = or i64 %64, %68
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 6
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !13
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 48
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 7
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !13
  %77 = zext i8 %76 to i64
  %78 = shl nuw i64 %77, 56
  %79 = or i64 %74, %78
  %80 = add nsw i32 %37, -8
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 8
  br label %95

82:                                               ; preds = %40, %82
  %83 = phi i32 [ %93, %82 ], [ 0, %40 ]
  %84 = phi i64 [ %92, %82 ], [ 0, %40 ]
  %85 = zext i32 %83 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 %85
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !13
  %88 = zext i8 %87 to i64
  %89 = shl i32 %83, 3
  %90 = zext i32 %89 to i64
  %91 = shl nuw i64 %88, %90
  %92 = or i64 %91, %84
  %93 = add nuw nsw i32 %83, 1
  %94 = icmp eq i32 %93, %37
  br i1 %94, label %95, label %82, !llvm.loop !14

95:                                               ; preds = %82, %42, %40
  %96 = phi i8 addrspace(4)* [ %81, %42 ], [ %29, %40 ], [ %29, %82 ]
  %97 = phi i32 [ %80, %42 ], [ 0, %40 ], [ 0, %82 ]
  %98 = phi i64 [ %79, %42 ], [ 0, %40 ], [ %92, %82 ]
  %99 = icmp ugt i32 %97, 7
  br i1 %99, label %102, label %100

100:                                              ; preds = %95
  %101 = icmp eq i32 %97, 0
  br i1 %101, label %155, label %142

102:                                              ; preds = %95
  %103 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !13
  %104 = zext i8 %103 to i64
  %105 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 1
  %106 = load i8, i8 addrspace(4)* %105, align 1, !tbaa !13
  %107 = zext i8 %106 to i64
  %108 = shl nuw nsw i64 %107, 8
  %109 = or i64 %108, %104
  %110 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 2
  %111 = load i8, i8 addrspace(4)* %110, align 1, !tbaa !13
  %112 = zext i8 %111 to i64
  %113 = shl nuw nsw i64 %112, 16
  %114 = or i64 %109, %113
  %115 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 3
  %116 = load i8, i8 addrspace(4)* %115, align 1, !tbaa !13
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 24
  %119 = or i64 %114, %118
  %120 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 4
  %121 = load i8, i8 addrspace(4)* %120, align 1, !tbaa !13
  %122 = zext i8 %121 to i64
  %123 = shl nuw nsw i64 %122, 32
  %124 = or i64 %119, %123
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 5
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !13
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 40
  %129 = or i64 %124, %128
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 6
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !13
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 48
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 7
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !13
  %137 = zext i8 %136 to i64
  %138 = shl nuw i64 %137, 56
  %139 = or i64 %134, %138
  %140 = add nsw i32 %97, -8
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 8
  br label %155

142:                                              ; preds = %100, %142
  %143 = phi i32 [ %153, %142 ], [ 0, %100 ]
  %144 = phi i64 [ %152, %142 ], [ 0, %100 ]
  %145 = zext i32 %143 to i64
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %96, i64 %145
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !13
  %148 = zext i8 %147 to i64
  %149 = shl i32 %143, 3
  %150 = zext i32 %149 to i64
  %151 = shl nuw i64 %148, %150
  %152 = or i64 %151, %144
  %153 = add nuw nsw i32 %143, 1
  %154 = icmp eq i32 %153, %97
  br i1 %154, label %155, label %142

155:                                              ; preds = %142, %102, %100
  %156 = phi i8 addrspace(4)* [ %141, %102 ], [ %96, %100 ], [ %96, %142 ]
  %157 = phi i32 [ %140, %102 ], [ 0, %100 ], [ 0, %142 ]
  %158 = phi i64 [ %139, %102 ], [ 0, %100 ], [ %152, %142 ]
  %159 = icmp ugt i32 %157, 7
  br i1 %159, label %162, label %160

160:                                              ; preds = %155
  %161 = icmp eq i32 %157, 0
  br i1 %161, label %215, label %202

162:                                              ; preds = %155
  %163 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !13
  %164 = zext i8 %163 to i64
  %165 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 1
  %166 = load i8, i8 addrspace(4)* %165, align 1, !tbaa !13
  %167 = zext i8 %166 to i64
  %168 = shl nuw nsw i64 %167, 8
  %169 = or i64 %168, %164
  %170 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 2
  %171 = load i8, i8 addrspace(4)* %170, align 1, !tbaa !13
  %172 = zext i8 %171 to i64
  %173 = shl nuw nsw i64 %172, 16
  %174 = or i64 %169, %173
  %175 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 3
  %176 = load i8, i8 addrspace(4)* %175, align 1, !tbaa !13
  %177 = zext i8 %176 to i64
  %178 = shl nuw nsw i64 %177, 24
  %179 = or i64 %174, %178
  %180 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 4
  %181 = load i8, i8 addrspace(4)* %180, align 1, !tbaa !13
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 32
  %184 = or i64 %179, %183
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 5
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !13
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 40
  %189 = or i64 %184, %188
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 6
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !13
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 48
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 7
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !13
  %197 = zext i8 %196 to i64
  %198 = shl nuw i64 %197, 56
  %199 = or i64 %194, %198
  %200 = add nsw i32 %157, -8
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 8
  br label %215

202:                                              ; preds = %160, %202
  %203 = phi i32 [ %213, %202 ], [ 0, %160 ]
  %204 = phi i64 [ %212, %202 ], [ 0, %160 ]
  %205 = zext i32 %203 to i64
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %156, i64 %205
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !13
  %208 = zext i8 %207 to i64
  %209 = shl i32 %203, 3
  %210 = zext i32 %209 to i64
  %211 = shl nuw i64 %208, %210
  %212 = or i64 %211, %204
  %213 = add nuw nsw i32 %203, 1
  %214 = icmp eq i32 %213, %157
  br i1 %214, label %215, label %202

215:                                              ; preds = %202, %162, %160
  %216 = phi i8 addrspace(4)* [ %201, %162 ], [ %156, %160 ], [ %156, %202 ]
  %217 = phi i32 [ %200, %162 ], [ 0, %160 ], [ 0, %202 ]
  %218 = phi i64 [ %199, %162 ], [ 0, %160 ], [ %212, %202 ]
  %219 = icmp ugt i32 %217, 7
  br i1 %219, label %222, label %220

220:                                              ; preds = %215
  %221 = icmp eq i32 %217, 0
  br i1 %221, label %275, label %262

222:                                              ; preds = %215
  %223 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !13
  %224 = zext i8 %223 to i64
  %225 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 1
  %226 = load i8, i8 addrspace(4)* %225, align 1, !tbaa !13
  %227 = zext i8 %226 to i64
  %228 = shl nuw nsw i64 %227, 8
  %229 = or i64 %228, %224
  %230 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 2
  %231 = load i8, i8 addrspace(4)* %230, align 1, !tbaa !13
  %232 = zext i8 %231 to i64
  %233 = shl nuw nsw i64 %232, 16
  %234 = or i64 %229, %233
  %235 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 3
  %236 = load i8, i8 addrspace(4)* %235, align 1, !tbaa !13
  %237 = zext i8 %236 to i64
  %238 = shl nuw nsw i64 %237, 24
  %239 = or i64 %234, %238
  %240 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 4
  %241 = load i8, i8 addrspace(4)* %240, align 1, !tbaa !13
  %242 = zext i8 %241 to i64
  %243 = shl nuw nsw i64 %242, 32
  %244 = or i64 %239, %243
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 5
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !13
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 40
  %249 = or i64 %244, %248
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 6
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !13
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 48
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 7
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !13
  %257 = zext i8 %256 to i64
  %258 = shl nuw i64 %257, 56
  %259 = or i64 %254, %258
  %260 = add nsw i32 %217, -8
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 8
  br label %275

262:                                              ; preds = %220, %262
  %263 = phi i32 [ %273, %262 ], [ 0, %220 ]
  %264 = phi i64 [ %272, %262 ], [ 0, %220 ]
  %265 = zext i32 %263 to i64
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %216, i64 %265
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !13
  %268 = zext i8 %267 to i64
  %269 = shl i32 %263, 3
  %270 = zext i32 %269 to i64
  %271 = shl nuw i64 %268, %270
  %272 = or i64 %271, %264
  %273 = add nuw nsw i32 %263, 1
  %274 = icmp eq i32 %273, %217
  br i1 %274, label %275, label %262

275:                                              ; preds = %262, %222, %220
  %276 = phi i8 addrspace(4)* [ %261, %222 ], [ %216, %220 ], [ %216, %262 ]
  %277 = phi i32 [ %260, %222 ], [ 0, %220 ], [ 0, %262 ]
  %278 = phi i64 [ %259, %222 ], [ 0, %220 ], [ %272, %262 ]
  %279 = icmp ugt i32 %277, 7
  br i1 %279, label %282, label %280

280:                                              ; preds = %275
  %281 = icmp eq i32 %277, 0
  br i1 %281, label %335, label %322

282:                                              ; preds = %275
  %283 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !13
  %284 = zext i8 %283 to i64
  %285 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 1
  %286 = load i8, i8 addrspace(4)* %285, align 1, !tbaa !13
  %287 = zext i8 %286 to i64
  %288 = shl nuw nsw i64 %287, 8
  %289 = or i64 %288, %284
  %290 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 2
  %291 = load i8, i8 addrspace(4)* %290, align 1, !tbaa !13
  %292 = zext i8 %291 to i64
  %293 = shl nuw nsw i64 %292, 16
  %294 = or i64 %289, %293
  %295 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 3
  %296 = load i8, i8 addrspace(4)* %295, align 1, !tbaa !13
  %297 = zext i8 %296 to i64
  %298 = shl nuw nsw i64 %297, 24
  %299 = or i64 %294, %298
  %300 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 4
  %301 = load i8, i8 addrspace(4)* %300, align 1, !tbaa !13
  %302 = zext i8 %301 to i64
  %303 = shl nuw nsw i64 %302, 32
  %304 = or i64 %299, %303
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 5
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !13
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 40
  %309 = or i64 %304, %308
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 6
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !13
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 48
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 7
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !13
  %317 = zext i8 %316 to i64
  %318 = shl nuw i64 %317, 56
  %319 = or i64 %314, %318
  %320 = add nsw i32 %277, -8
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 8
  br label %335

322:                                              ; preds = %280, %322
  %323 = phi i32 [ %333, %322 ], [ 0, %280 ]
  %324 = phi i64 [ %332, %322 ], [ 0, %280 ]
  %325 = zext i32 %323 to i64
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %276, i64 %325
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !13
  %328 = zext i8 %327 to i64
  %329 = shl i32 %323, 3
  %330 = zext i32 %329 to i64
  %331 = shl nuw i64 %328, %330
  %332 = or i64 %331, %324
  %333 = add nuw nsw i32 %323, 1
  %334 = icmp eq i32 %333, %277
  br i1 %334, label %335, label %322

335:                                              ; preds = %322, %282, %280
  %336 = phi i8 addrspace(4)* [ %321, %282 ], [ %276, %280 ], [ %276, %322 ]
  %337 = phi i32 [ %320, %282 ], [ 0, %280 ], [ 0, %322 ]
  %338 = phi i64 [ %319, %282 ], [ 0, %280 ], [ %332, %322 ]
  %339 = icmp ugt i32 %337, 7
  br i1 %339, label %342, label %340

340:                                              ; preds = %335
  %341 = icmp eq i32 %337, 0
  br i1 %341, label %395, label %382

342:                                              ; preds = %335
  %343 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !13
  %344 = zext i8 %343 to i64
  %345 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 1
  %346 = load i8, i8 addrspace(4)* %345, align 1, !tbaa !13
  %347 = zext i8 %346 to i64
  %348 = shl nuw nsw i64 %347, 8
  %349 = or i64 %348, %344
  %350 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 2
  %351 = load i8, i8 addrspace(4)* %350, align 1, !tbaa !13
  %352 = zext i8 %351 to i64
  %353 = shl nuw nsw i64 %352, 16
  %354 = or i64 %349, %353
  %355 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 3
  %356 = load i8, i8 addrspace(4)* %355, align 1, !tbaa !13
  %357 = zext i8 %356 to i64
  %358 = shl nuw nsw i64 %357, 24
  %359 = or i64 %354, %358
  %360 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 4
  %361 = load i8, i8 addrspace(4)* %360, align 1, !tbaa !13
  %362 = zext i8 %361 to i64
  %363 = shl nuw nsw i64 %362, 32
  %364 = or i64 %359, %363
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 5
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !13
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 40
  %369 = or i64 %364, %368
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 6
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !13
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 48
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 7
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !13
  %377 = zext i8 %376 to i64
  %378 = shl nuw i64 %377, 56
  %379 = or i64 %374, %378
  %380 = add nsw i32 %337, -8
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 8
  br label %395

382:                                              ; preds = %340, %382
  %383 = phi i32 [ %393, %382 ], [ 0, %340 ]
  %384 = phi i64 [ %392, %382 ], [ 0, %340 ]
  %385 = zext i32 %383 to i64
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %336, i64 %385
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !13
  %388 = zext i8 %387 to i64
  %389 = shl i32 %383, 3
  %390 = zext i32 %389 to i64
  %391 = shl nuw i64 %388, %390
  %392 = or i64 %391, %384
  %393 = add nuw nsw i32 %383, 1
  %394 = icmp eq i32 %393, %337
  br i1 %394, label %395, label %382

395:                                              ; preds = %382, %342, %340
  %396 = phi i8 addrspace(4)* [ %381, %342 ], [ %336, %340 ], [ %336, %382 ]
  %397 = phi i32 [ %380, %342 ], [ 0, %340 ], [ 0, %382 ]
  %398 = phi i64 [ %379, %342 ], [ 0, %340 ], [ %392, %382 ]
  %399 = icmp ugt i32 %397, 7
  br i1 %399, label %402, label %400

400:                                              ; preds = %395
  %401 = icmp eq i32 %397, 0
  br i1 %401, label %453, label %440

402:                                              ; preds = %395
  %403 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !13
  %404 = zext i8 %403 to i64
  %405 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 1
  %406 = load i8, i8 addrspace(4)* %405, align 1, !tbaa !13
  %407 = zext i8 %406 to i64
  %408 = shl nuw nsw i64 %407, 8
  %409 = or i64 %408, %404
  %410 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 2
  %411 = load i8, i8 addrspace(4)* %410, align 1, !tbaa !13
  %412 = zext i8 %411 to i64
  %413 = shl nuw nsw i64 %412, 16
  %414 = or i64 %409, %413
  %415 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 3
  %416 = load i8, i8 addrspace(4)* %415, align 1, !tbaa !13
  %417 = zext i8 %416 to i64
  %418 = shl nuw nsw i64 %417, 24
  %419 = or i64 %414, %418
  %420 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 4
  %421 = load i8, i8 addrspace(4)* %420, align 1, !tbaa !13
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 32
  %424 = or i64 %419, %423
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 5
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !13
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 40
  %429 = or i64 %424, %428
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 6
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !13
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 48
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 7
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !13
  %437 = zext i8 %436 to i64
  %438 = shl nuw i64 %437, 56
  %439 = or i64 %434, %438
  br label %453

440:                                              ; preds = %400, %440
  %441 = phi i32 [ %451, %440 ], [ 0, %400 ]
  %442 = phi i64 [ %450, %440 ], [ 0, %400 ]
  %443 = zext i32 %441 to i64
  %444 = getelementptr inbounds i8, i8 addrspace(4)* %396, i64 %443
  %445 = load i8, i8 addrspace(4)* %444, align 1, !tbaa !13
  %446 = zext i8 %445 to i64
  %447 = shl i32 %441, 3
  %448 = zext i32 %447 to i64
  %449 = shl nuw i64 %446, %448
  %450 = or i64 %449, %442
  %451 = add nuw nsw i32 %441, 1
  %452 = icmp eq i32 %451, %397
  br i1 %452, label %453, label %440

453:                                              ; preds = %440, %402, %400
  %454 = phi i64 [ %439, %402 ], [ 0, %400 ], [ %450, %440 ]
  %455 = shl nuw nsw i64 %36, 2
  %456 = add nuw nsw i64 %455, 28
  %457 = and i64 %456, 480
  %458 = and i64 %38, -225
  %459 = or i64 %458, %457
  %460 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %459, i64 noundef %98, i64 noundef %158, i64 noundef %218, i64 noundef %278, i64 noundef %338, i64 noundef %398, i64 noundef %454) #10
  %461 = sub i64 %28, %36
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %29, i64 %36
  %463 = icmp eq i64 %461, 0
  br i1 %463, label %464, label %27

464:                                              ; preds = %453, %19
  %465 = phi <2 x i64> [ %22, %19 ], [ %460, %453 ]
  %466 = extractelement <2 x i64> %465, i64 0
  %467 = zext i32 %3 to i64
  %468 = and i64 %466, -225
  %469 = or i64 %468, 32
  %470 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %469, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %471 = extractelement <2 x i64> %470, i64 0
  %472 = bitcast double %6 to i64
  %473 = and i64 %471, -225
  %474 = or i64 %473, 32
  %475 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %474, i64 noundef %472, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %476 = extractelement <2 x i64> %475, i64 0
  %477 = bitcast double %8 to i64
  %478 = and i64 %476, -225
  %479 = or i64 %478, 32
  %480 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %479, i64 noundef %477, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %481 = extractelement <2 x i64> %480, i64 0
  %482 = bitcast double %10 to i64
  %483 = and i64 %481, -227
  %484 = or i64 %483, 34
  %485 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %484, i64 noundef %482, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %486 = getelementptr inbounds float, float addrspace(1)* %0, i64 1
  %487 = load float, float addrspace(1)* %486, align 4, !tbaa !4
  %488 = fpext float %487 to double
  %489 = getelementptr inbounds float, float addrspace(1)* %1, i64 1
  %490 = load float, float addrspace(1)* %489, align 4, !tbaa !4
  %491 = fpext float %490 to double
  %492 = getelementptr inbounds float, float addrspace(1)* %2, i64 1
  %493 = load float, float addrspace(1)* %492, align 4, !tbaa !4
  %494 = fpext float %493 to double
  %495 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %496 = extractelement <2 x i64> %495, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %497, label %501

497:                                              ; preds = %464
  %498 = and i64 %496, -225
  %499 = or i64 %498, 32
  %500 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %499, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %942

501:                                              ; preds = %464
  %502 = and i64 %496, 2
  %503 = and i64 %496, -3
  %504 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %503, i64 0
  br label %505

505:                                              ; preds = %931, %501
  %506 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 38) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([39 x i8]* addrspacecast ([39 x i8] addrspace(4)* @.str.1 to [39 x i8]*) to i64)), i64 1))), %501 ], [ %939, %931 ]
  %507 = phi i8 addrspace(4)* [ getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %501 ], [ %940, %931 ]
  %508 = phi <2 x i64> [ %504, %501 ], [ %938, %931 ]
  %509 = icmp ugt i64 %506, 56
  %510 = extractelement <2 x i64> %508, i64 0
  %511 = or i64 %510, %502
  %512 = insertelement <2 x i64> poison, i64 %511, i64 0
  %513 = select i1 %509, <2 x i64> %508, <2 x i64> %512
  %514 = tail call i64 @llvm.umin.i64(i64 %506, i64 56)
  %515 = trunc i64 %514 to i32
  %516 = extractelement <2 x i64> %513, i64 0
  %517 = icmp ugt i32 %515, 7
  br i1 %517, label %520, label %518

518:                                              ; preds = %505
  %519 = icmp eq i32 %515, 0
  br i1 %519, label %573, label %560

520:                                              ; preds = %505
  %521 = load i8, i8 addrspace(4)* %507, align 1, !tbaa !13
  %522 = zext i8 %521 to i64
  %523 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 1
  %524 = load i8, i8 addrspace(4)* %523, align 1, !tbaa !13
  %525 = zext i8 %524 to i64
  %526 = shl nuw nsw i64 %525, 8
  %527 = or i64 %526, %522
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 2
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !13
  %530 = zext i8 %529 to i64
  %531 = shl nuw nsw i64 %530, 16
  %532 = or i64 %527, %531
  %533 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 3
  %534 = load i8, i8 addrspace(4)* %533, align 1, !tbaa !13
  %535 = zext i8 %534 to i64
  %536 = shl nuw nsw i64 %535, 24
  %537 = or i64 %532, %536
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 4
  %539 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !13
  %540 = zext i8 %539 to i64
  %541 = shl nuw nsw i64 %540, 32
  %542 = or i64 %537, %541
  %543 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 5
  %544 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !13
  %545 = zext i8 %544 to i64
  %546 = shl nuw nsw i64 %545, 40
  %547 = or i64 %542, %546
  %548 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 6
  %549 = load i8, i8 addrspace(4)* %548, align 1, !tbaa !13
  %550 = zext i8 %549 to i64
  %551 = shl nuw nsw i64 %550, 48
  %552 = or i64 %547, %551
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 7
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !13
  %555 = zext i8 %554 to i64
  %556 = shl nuw i64 %555, 56
  %557 = or i64 %552, %556
  %558 = add nsw i32 %515, -8
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 8
  br label %573

560:                                              ; preds = %518, %560
  %561 = phi i32 [ %571, %560 ], [ 0, %518 ]
  %562 = phi i64 [ %570, %560 ], [ 0, %518 ]
  %563 = zext i32 %561 to i64
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 %563
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !13
  %566 = zext i8 %565 to i64
  %567 = shl i32 %561, 3
  %568 = zext i32 %567 to i64
  %569 = shl nuw i64 %566, %568
  %570 = or i64 %569, %562
  %571 = add nuw nsw i32 %561, 1
  %572 = icmp eq i32 %571, %515
  br i1 %572, label %573, label %560, !llvm.loop !14

573:                                              ; preds = %560, %520, %518
  %574 = phi i8 addrspace(4)* [ %559, %520 ], [ %507, %518 ], [ %507, %560 ]
  %575 = phi i32 [ %558, %520 ], [ 0, %518 ], [ 0, %560 ]
  %576 = phi i64 [ %557, %520 ], [ 0, %518 ], [ %570, %560 ]
  %577 = icmp ugt i32 %575, 7
  br i1 %577, label %580, label %578

578:                                              ; preds = %573
  %579 = icmp eq i32 %575, 0
  br i1 %579, label %633, label %620

580:                                              ; preds = %573
  %581 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !13
  %582 = zext i8 %581 to i64
  %583 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 1
  %584 = load i8, i8 addrspace(4)* %583, align 1, !tbaa !13
  %585 = zext i8 %584 to i64
  %586 = shl nuw nsw i64 %585, 8
  %587 = or i64 %586, %582
  %588 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 2
  %589 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !13
  %590 = zext i8 %589 to i64
  %591 = shl nuw nsw i64 %590, 16
  %592 = or i64 %587, %591
  %593 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 3
  %594 = load i8, i8 addrspace(4)* %593, align 1, !tbaa !13
  %595 = zext i8 %594 to i64
  %596 = shl nuw nsw i64 %595, 24
  %597 = or i64 %592, %596
  %598 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 4
  %599 = load i8, i8 addrspace(4)* %598, align 1, !tbaa !13
  %600 = zext i8 %599 to i64
  %601 = shl nuw nsw i64 %600, 32
  %602 = or i64 %597, %601
  %603 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 5
  %604 = load i8, i8 addrspace(4)* %603, align 1, !tbaa !13
  %605 = zext i8 %604 to i64
  %606 = shl nuw nsw i64 %605, 40
  %607 = or i64 %602, %606
  %608 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 6
  %609 = load i8, i8 addrspace(4)* %608, align 1, !tbaa !13
  %610 = zext i8 %609 to i64
  %611 = shl nuw nsw i64 %610, 48
  %612 = or i64 %607, %611
  %613 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 7
  %614 = load i8, i8 addrspace(4)* %613, align 1, !tbaa !13
  %615 = zext i8 %614 to i64
  %616 = shl nuw i64 %615, 56
  %617 = or i64 %612, %616
  %618 = add nsw i32 %575, -8
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 8
  br label %633

620:                                              ; preds = %578, %620
  %621 = phi i32 [ %631, %620 ], [ 0, %578 ]
  %622 = phi i64 [ %630, %620 ], [ 0, %578 ]
  %623 = zext i32 %621 to i64
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %574, i64 %623
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !13
  %626 = zext i8 %625 to i64
  %627 = shl i32 %621, 3
  %628 = zext i32 %627 to i64
  %629 = shl nuw i64 %626, %628
  %630 = or i64 %629, %622
  %631 = add nuw nsw i32 %621, 1
  %632 = icmp eq i32 %631, %575
  br i1 %632, label %633, label %620

633:                                              ; preds = %620, %580, %578
  %634 = phi i8 addrspace(4)* [ %619, %580 ], [ %574, %578 ], [ %574, %620 ]
  %635 = phi i32 [ %618, %580 ], [ 0, %578 ], [ 0, %620 ]
  %636 = phi i64 [ %617, %580 ], [ 0, %578 ], [ %630, %620 ]
  %637 = icmp ugt i32 %635, 7
  br i1 %637, label %640, label %638

638:                                              ; preds = %633
  %639 = icmp eq i32 %635, 0
  br i1 %639, label %693, label %680

640:                                              ; preds = %633
  %641 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !13
  %642 = zext i8 %641 to i64
  %643 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 1
  %644 = load i8, i8 addrspace(4)* %643, align 1, !tbaa !13
  %645 = zext i8 %644 to i64
  %646 = shl nuw nsw i64 %645, 8
  %647 = or i64 %646, %642
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 2
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !13
  %650 = zext i8 %649 to i64
  %651 = shl nuw nsw i64 %650, 16
  %652 = or i64 %647, %651
  %653 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 3
  %654 = load i8, i8 addrspace(4)* %653, align 1, !tbaa !13
  %655 = zext i8 %654 to i64
  %656 = shl nuw nsw i64 %655, 24
  %657 = or i64 %652, %656
  %658 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 4
  %659 = load i8, i8 addrspace(4)* %658, align 1, !tbaa !13
  %660 = zext i8 %659 to i64
  %661 = shl nuw nsw i64 %660, 32
  %662 = or i64 %657, %661
  %663 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 5
  %664 = load i8, i8 addrspace(4)* %663, align 1, !tbaa !13
  %665 = zext i8 %664 to i64
  %666 = shl nuw nsw i64 %665, 40
  %667 = or i64 %662, %666
  %668 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 6
  %669 = load i8, i8 addrspace(4)* %668, align 1, !tbaa !13
  %670 = zext i8 %669 to i64
  %671 = shl nuw nsw i64 %670, 48
  %672 = or i64 %667, %671
  %673 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 7
  %674 = load i8, i8 addrspace(4)* %673, align 1, !tbaa !13
  %675 = zext i8 %674 to i64
  %676 = shl nuw i64 %675, 56
  %677 = or i64 %672, %676
  %678 = add nsw i32 %635, -8
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 8
  br label %693

680:                                              ; preds = %638, %680
  %681 = phi i32 [ %691, %680 ], [ 0, %638 ]
  %682 = phi i64 [ %690, %680 ], [ 0, %638 ]
  %683 = zext i32 %681 to i64
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %634, i64 %683
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !13
  %686 = zext i8 %685 to i64
  %687 = shl i32 %681, 3
  %688 = zext i32 %687 to i64
  %689 = shl nuw i64 %686, %688
  %690 = or i64 %689, %682
  %691 = add nuw nsw i32 %681, 1
  %692 = icmp eq i32 %691, %635
  br i1 %692, label %693, label %680

693:                                              ; preds = %680, %640, %638
  %694 = phi i8 addrspace(4)* [ %679, %640 ], [ %634, %638 ], [ %634, %680 ]
  %695 = phi i32 [ %678, %640 ], [ 0, %638 ], [ 0, %680 ]
  %696 = phi i64 [ %677, %640 ], [ 0, %638 ], [ %690, %680 ]
  %697 = icmp ugt i32 %695, 7
  br i1 %697, label %700, label %698

698:                                              ; preds = %693
  %699 = icmp eq i32 %695, 0
  br i1 %699, label %753, label %740

700:                                              ; preds = %693
  %701 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !13
  %702 = zext i8 %701 to i64
  %703 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 1
  %704 = load i8, i8 addrspace(4)* %703, align 1, !tbaa !13
  %705 = zext i8 %704 to i64
  %706 = shl nuw nsw i64 %705, 8
  %707 = or i64 %706, %702
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 2
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !13
  %710 = zext i8 %709 to i64
  %711 = shl nuw nsw i64 %710, 16
  %712 = or i64 %707, %711
  %713 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 3
  %714 = load i8, i8 addrspace(4)* %713, align 1, !tbaa !13
  %715 = zext i8 %714 to i64
  %716 = shl nuw nsw i64 %715, 24
  %717 = or i64 %712, %716
  %718 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 4
  %719 = load i8, i8 addrspace(4)* %718, align 1, !tbaa !13
  %720 = zext i8 %719 to i64
  %721 = shl nuw nsw i64 %720, 32
  %722 = or i64 %717, %721
  %723 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 5
  %724 = load i8, i8 addrspace(4)* %723, align 1, !tbaa !13
  %725 = zext i8 %724 to i64
  %726 = shl nuw nsw i64 %725, 40
  %727 = or i64 %722, %726
  %728 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 6
  %729 = load i8, i8 addrspace(4)* %728, align 1, !tbaa !13
  %730 = zext i8 %729 to i64
  %731 = shl nuw nsw i64 %730, 48
  %732 = or i64 %727, %731
  %733 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 7
  %734 = load i8, i8 addrspace(4)* %733, align 1, !tbaa !13
  %735 = zext i8 %734 to i64
  %736 = shl nuw i64 %735, 56
  %737 = or i64 %732, %736
  %738 = add nsw i32 %695, -8
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 8
  br label %753

740:                                              ; preds = %698, %740
  %741 = phi i32 [ %751, %740 ], [ 0, %698 ]
  %742 = phi i64 [ %750, %740 ], [ 0, %698 ]
  %743 = zext i32 %741 to i64
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %694, i64 %743
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !13
  %746 = zext i8 %745 to i64
  %747 = shl i32 %741, 3
  %748 = zext i32 %747 to i64
  %749 = shl nuw i64 %746, %748
  %750 = or i64 %749, %742
  %751 = add nuw nsw i32 %741, 1
  %752 = icmp eq i32 %751, %695
  br i1 %752, label %753, label %740

753:                                              ; preds = %740, %700, %698
  %754 = phi i8 addrspace(4)* [ %739, %700 ], [ %694, %698 ], [ %694, %740 ]
  %755 = phi i32 [ %738, %700 ], [ 0, %698 ], [ 0, %740 ]
  %756 = phi i64 [ %737, %700 ], [ 0, %698 ], [ %750, %740 ]
  %757 = icmp ugt i32 %755, 7
  br i1 %757, label %760, label %758

758:                                              ; preds = %753
  %759 = icmp eq i32 %755, 0
  br i1 %759, label %813, label %800

760:                                              ; preds = %753
  %761 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !13
  %762 = zext i8 %761 to i64
  %763 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 1
  %764 = load i8, i8 addrspace(4)* %763, align 1, !tbaa !13
  %765 = zext i8 %764 to i64
  %766 = shl nuw nsw i64 %765, 8
  %767 = or i64 %766, %762
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 2
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !13
  %770 = zext i8 %769 to i64
  %771 = shl nuw nsw i64 %770, 16
  %772 = or i64 %767, %771
  %773 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 3
  %774 = load i8, i8 addrspace(4)* %773, align 1, !tbaa !13
  %775 = zext i8 %774 to i64
  %776 = shl nuw nsw i64 %775, 24
  %777 = or i64 %772, %776
  %778 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 4
  %779 = load i8, i8 addrspace(4)* %778, align 1, !tbaa !13
  %780 = zext i8 %779 to i64
  %781 = shl nuw nsw i64 %780, 32
  %782 = or i64 %777, %781
  %783 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 5
  %784 = load i8, i8 addrspace(4)* %783, align 1, !tbaa !13
  %785 = zext i8 %784 to i64
  %786 = shl nuw nsw i64 %785, 40
  %787 = or i64 %782, %786
  %788 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 6
  %789 = load i8, i8 addrspace(4)* %788, align 1, !tbaa !13
  %790 = zext i8 %789 to i64
  %791 = shl nuw nsw i64 %790, 48
  %792 = or i64 %787, %791
  %793 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 7
  %794 = load i8, i8 addrspace(4)* %793, align 1, !tbaa !13
  %795 = zext i8 %794 to i64
  %796 = shl nuw i64 %795, 56
  %797 = or i64 %792, %796
  %798 = add nsw i32 %755, -8
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 8
  br label %813

800:                                              ; preds = %758, %800
  %801 = phi i32 [ %811, %800 ], [ 0, %758 ]
  %802 = phi i64 [ %810, %800 ], [ 0, %758 ]
  %803 = zext i32 %801 to i64
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %754, i64 %803
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !13
  %806 = zext i8 %805 to i64
  %807 = shl i32 %801, 3
  %808 = zext i32 %807 to i64
  %809 = shl nuw i64 %806, %808
  %810 = or i64 %809, %802
  %811 = add nuw nsw i32 %801, 1
  %812 = icmp eq i32 %811, %755
  br i1 %812, label %813, label %800

813:                                              ; preds = %800, %760, %758
  %814 = phi i8 addrspace(4)* [ %799, %760 ], [ %754, %758 ], [ %754, %800 ]
  %815 = phi i32 [ %798, %760 ], [ 0, %758 ], [ 0, %800 ]
  %816 = phi i64 [ %797, %760 ], [ 0, %758 ], [ %810, %800 ]
  %817 = icmp ugt i32 %815, 7
  br i1 %817, label %820, label %818

818:                                              ; preds = %813
  %819 = icmp eq i32 %815, 0
  br i1 %819, label %873, label %860

820:                                              ; preds = %813
  %821 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !13
  %822 = zext i8 %821 to i64
  %823 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 1
  %824 = load i8, i8 addrspace(4)* %823, align 1, !tbaa !13
  %825 = zext i8 %824 to i64
  %826 = shl nuw nsw i64 %825, 8
  %827 = or i64 %826, %822
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 2
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !13
  %830 = zext i8 %829 to i64
  %831 = shl nuw nsw i64 %830, 16
  %832 = or i64 %827, %831
  %833 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 3
  %834 = load i8, i8 addrspace(4)* %833, align 1, !tbaa !13
  %835 = zext i8 %834 to i64
  %836 = shl nuw nsw i64 %835, 24
  %837 = or i64 %832, %836
  %838 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 4
  %839 = load i8, i8 addrspace(4)* %838, align 1, !tbaa !13
  %840 = zext i8 %839 to i64
  %841 = shl nuw nsw i64 %840, 32
  %842 = or i64 %837, %841
  %843 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 5
  %844 = load i8, i8 addrspace(4)* %843, align 1, !tbaa !13
  %845 = zext i8 %844 to i64
  %846 = shl nuw nsw i64 %845, 40
  %847 = or i64 %842, %846
  %848 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 6
  %849 = load i8, i8 addrspace(4)* %848, align 1, !tbaa !13
  %850 = zext i8 %849 to i64
  %851 = shl nuw nsw i64 %850, 48
  %852 = or i64 %847, %851
  %853 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 7
  %854 = load i8, i8 addrspace(4)* %853, align 1, !tbaa !13
  %855 = zext i8 %854 to i64
  %856 = shl nuw i64 %855, 56
  %857 = or i64 %852, %856
  %858 = add nsw i32 %815, -8
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 8
  br label %873

860:                                              ; preds = %818, %860
  %861 = phi i32 [ %871, %860 ], [ 0, %818 ]
  %862 = phi i64 [ %870, %860 ], [ 0, %818 ]
  %863 = zext i32 %861 to i64
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %814, i64 %863
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !13
  %866 = zext i8 %865 to i64
  %867 = shl i32 %861, 3
  %868 = zext i32 %867 to i64
  %869 = shl nuw i64 %866, %868
  %870 = or i64 %869, %862
  %871 = add nuw nsw i32 %861, 1
  %872 = icmp eq i32 %871, %815
  br i1 %872, label %873, label %860

873:                                              ; preds = %860, %820, %818
  %874 = phi i8 addrspace(4)* [ %859, %820 ], [ %814, %818 ], [ %814, %860 ]
  %875 = phi i32 [ %858, %820 ], [ 0, %818 ], [ 0, %860 ]
  %876 = phi i64 [ %857, %820 ], [ 0, %818 ], [ %870, %860 ]
  %877 = icmp ugt i32 %875, 7
  br i1 %877, label %880, label %878

878:                                              ; preds = %873
  %879 = icmp eq i32 %875, 0
  br i1 %879, label %931, label %918

880:                                              ; preds = %873
  %881 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !13
  %882 = zext i8 %881 to i64
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 1
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !13
  %885 = zext i8 %884 to i64
  %886 = shl nuw nsw i64 %885, 8
  %887 = or i64 %886, %882
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 2
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !13
  %890 = zext i8 %889 to i64
  %891 = shl nuw nsw i64 %890, 16
  %892 = or i64 %887, %891
  %893 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 3
  %894 = load i8, i8 addrspace(4)* %893, align 1, !tbaa !13
  %895 = zext i8 %894 to i64
  %896 = shl nuw nsw i64 %895, 24
  %897 = or i64 %892, %896
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 4
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !13
  %900 = zext i8 %899 to i64
  %901 = shl nuw nsw i64 %900, 32
  %902 = or i64 %897, %901
  %903 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 5
  %904 = load i8, i8 addrspace(4)* %903, align 1, !tbaa !13
  %905 = zext i8 %904 to i64
  %906 = shl nuw nsw i64 %905, 40
  %907 = or i64 %902, %906
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 6
  %909 = load i8, i8 addrspace(4)* %908, align 1, !tbaa !13
  %910 = zext i8 %909 to i64
  %911 = shl nuw nsw i64 %910, 48
  %912 = or i64 %907, %911
  %913 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 7
  %914 = load i8, i8 addrspace(4)* %913, align 1, !tbaa !13
  %915 = zext i8 %914 to i64
  %916 = shl nuw i64 %915, 56
  %917 = or i64 %912, %916
  br label %931

918:                                              ; preds = %878, %918
  %919 = phi i32 [ %929, %918 ], [ 0, %878 ]
  %920 = phi i64 [ %928, %918 ], [ 0, %878 ]
  %921 = zext i32 %919 to i64
  %922 = getelementptr inbounds i8, i8 addrspace(4)* %874, i64 %921
  %923 = load i8, i8 addrspace(4)* %922, align 1, !tbaa !13
  %924 = zext i8 %923 to i64
  %925 = shl i32 %919, 3
  %926 = zext i32 %925 to i64
  %927 = shl nuw i64 %924, %926
  %928 = or i64 %927, %920
  %929 = add nuw nsw i32 %919, 1
  %930 = icmp eq i32 %929, %875
  br i1 %930, label %931, label %918

931:                                              ; preds = %918, %880, %878
  %932 = phi i64 [ %917, %880 ], [ 0, %878 ], [ %928, %918 ]
  %933 = shl nuw nsw i64 %514, 2
  %934 = add nuw nsw i64 %933, 28
  %935 = and i64 %934, 480
  %936 = and i64 %516, -225
  %937 = or i64 %936, %935
  %938 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %937, i64 noundef %576, i64 noundef %636, i64 noundef %696, i64 noundef %756, i64 noundef %816, i64 noundef %876, i64 noundef %932) #10
  %939 = sub i64 %506, %514
  %940 = getelementptr inbounds i8, i8 addrspace(4)* %507, i64 %514
  %941 = icmp eq i64 %939, 0
  br i1 %941, label %942, label %505

942:                                              ; preds = %931, %497
  %943 = phi <2 x i64> [ %500, %497 ], [ %938, %931 ]
  %944 = extractelement <2 x i64> %943, i64 0
  %945 = and i64 %944, -225
  %946 = or i64 %945, 32
  %947 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %946, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %948 = extractelement <2 x i64> %947, i64 0
  %949 = bitcast double %488 to i64
  %950 = and i64 %948, -225
  %951 = or i64 %950, 32
  %952 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %951, i64 noundef %949, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %953 = extractelement <2 x i64> %952, i64 0
  %954 = bitcast double %491 to i64
  %955 = and i64 %953, -225
  %956 = or i64 %955, 32
  %957 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %956, i64 noundef %954, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %958 = extractelement <2 x i64> %957, i64 0
  %959 = bitcast double %494 to i64
  %960 = and i64 %958, -227
  %961 = or i64 %960, 34
  %962 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %961, i64 noundef %959, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %963 = getelementptr inbounds float, float addrspace(1)* %0, i64 2
  %964 = load float, float addrspace(1)* %963, align 4, !tbaa !4
  %965 = getelementptr inbounds float, float addrspace(1)* %1, i64 2
  %966 = load float, float addrspace(1)* %965, align 4, !tbaa !4
  %967 = getelementptr inbounds float, float addrspace(1)* %2, i64 2
  %968 = load float, float addrspace(1)* %967, align 4, !tbaa !4
  %969 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %970 = extractelement <2 x i64> %969, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %971, label %975

971:                                              ; preds = %942
  %972 = and i64 %970, -225
  %973 = or i64 %972, 32
  %974 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %973, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1416

975:                                              ; preds = %942
  %976 = and i64 %970, 2
  %977 = and i64 %970, -3
  %978 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %977, i64 0
  br label %979

979:                                              ; preds = %1405, %975
  %980 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.2, i64 0, i64 38) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([39 x i8]* addrspacecast ([39 x i8] addrspace(4)* @.str.2 to [39 x i8]*) to i64)), i64 1))), %975 ], [ %1413, %1405 ]
  %981 = phi i8 addrspace(4)* [ getelementptr inbounds ([39 x i8], [39 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %975 ], [ %1414, %1405 ]
  %982 = phi <2 x i64> [ %978, %975 ], [ %1412, %1405 ]
  %983 = icmp ugt i64 %980, 56
  %984 = extractelement <2 x i64> %982, i64 0
  %985 = or i64 %984, %976
  %986 = insertelement <2 x i64> poison, i64 %985, i64 0
  %987 = select i1 %983, <2 x i64> %982, <2 x i64> %986
  %988 = tail call i64 @llvm.umin.i64(i64 %980, i64 56)
  %989 = trunc i64 %988 to i32
  %990 = extractelement <2 x i64> %987, i64 0
  %991 = icmp ugt i32 %989, 7
  br i1 %991, label %994, label %992

992:                                              ; preds = %979
  %993 = icmp eq i32 %989, 0
  br i1 %993, label %1047, label %1034

994:                                              ; preds = %979
  %995 = load i8, i8 addrspace(4)* %981, align 1, !tbaa !13
  %996 = zext i8 %995 to i64
  %997 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 1
  %998 = load i8, i8 addrspace(4)* %997, align 1, !tbaa !13
  %999 = zext i8 %998 to i64
  %1000 = shl nuw nsw i64 %999, 8
  %1001 = or i64 %1000, %996
  %1002 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 2
  %1003 = load i8, i8 addrspace(4)* %1002, align 1, !tbaa !13
  %1004 = zext i8 %1003 to i64
  %1005 = shl nuw nsw i64 %1004, 16
  %1006 = or i64 %1001, %1005
  %1007 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 3
  %1008 = load i8, i8 addrspace(4)* %1007, align 1, !tbaa !13
  %1009 = zext i8 %1008 to i64
  %1010 = shl nuw nsw i64 %1009, 24
  %1011 = or i64 %1006, %1010
  %1012 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 4
  %1013 = load i8, i8 addrspace(4)* %1012, align 1, !tbaa !13
  %1014 = zext i8 %1013 to i64
  %1015 = shl nuw nsw i64 %1014, 32
  %1016 = or i64 %1011, %1015
  %1017 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 5
  %1018 = load i8, i8 addrspace(4)* %1017, align 1, !tbaa !13
  %1019 = zext i8 %1018 to i64
  %1020 = shl nuw nsw i64 %1019, 40
  %1021 = or i64 %1016, %1020
  %1022 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 6
  %1023 = load i8, i8 addrspace(4)* %1022, align 1, !tbaa !13
  %1024 = zext i8 %1023 to i64
  %1025 = shl nuw nsw i64 %1024, 48
  %1026 = or i64 %1021, %1025
  %1027 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 7
  %1028 = load i8, i8 addrspace(4)* %1027, align 1, !tbaa !13
  %1029 = zext i8 %1028 to i64
  %1030 = shl nuw i64 %1029, 56
  %1031 = or i64 %1026, %1030
  %1032 = add nsw i32 %989, -8
  %1033 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 8
  br label %1047

1034:                                             ; preds = %992, %1034
  %1035 = phi i32 [ %1045, %1034 ], [ 0, %992 ]
  %1036 = phi i64 [ %1044, %1034 ], [ 0, %992 ]
  %1037 = zext i32 %1035 to i64
  %1038 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 %1037
  %1039 = load i8, i8 addrspace(4)* %1038, align 1, !tbaa !13
  %1040 = zext i8 %1039 to i64
  %1041 = shl i32 %1035, 3
  %1042 = zext i32 %1041 to i64
  %1043 = shl nuw i64 %1040, %1042
  %1044 = or i64 %1043, %1036
  %1045 = add nuw nsw i32 %1035, 1
  %1046 = icmp eq i32 %1045, %989
  br i1 %1046, label %1047, label %1034, !llvm.loop !14

1047:                                             ; preds = %1034, %994, %992
  %1048 = phi i8 addrspace(4)* [ %1033, %994 ], [ %981, %992 ], [ %981, %1034 ]
  %1049 = phi i32 [ %1032, %994 ], [ 0, %992 ], [ 0, %1034 ]
  %1050 = phi i64 [ %1031, %994 ], [ 0, %992 ], [ %1044, %1034 ]
  %1051 = icmp ugt i32 %1049, 7
  br i1 %1051, label %1054, label %1052

1052:                                             ; preds = %1047
  %1053 = icmp eq i32 %1049, 0
  br i1 %1053, label %1107, label %1094

1054:                                             ; preds = %1047
  %1055 = load i8, i8 addrspace(4)* %1048, align 1, !tbaa !13
  %1056 = zext i8 %1055 to i64
  %1057 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 1
  %1058 = load i8, i8 addrspace(4)* %1057, align 1, !tbaa !13
  %1059 = zext i8 %1058 to i64
  %1060 = shl nuw nsw i64 %1059, 8
  %1061 = or i64 %1060, %1056
  %1062 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 2
  %1063 = load i8, i8 addrspace(4)* %1062, align 1, !tbaa !13
  %1064 = zext i8 %1063 to i64
  %1065 = shl nuw nsw i64 %1064, 16
  %1066 = or i64 %1061, %1065
  %1067 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 3
  %1068 = load i8, i8 addrspace(4)* %1067, align 1, !tbaa !13
  %1069 = zext i8 %1068 to i64
  %1070 = shl nuw nsw i64 %1069, 24
  %1071 = or i64 %1066, %1070
  %1072 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 4
  %1073 = load i8, i8 addrspace(4)* %1072, align 1, !tbaa !13
  %1074 = zext i8 %1073 to i64
  %1075 = shl nuw nsw i64 %1074, 32
  %1076 = or i64 %1071, %1075
  %1077 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 5
  %1078 = load i8, i8 addrspace(4)* %1077, align 1, !tbaa !13
  %1079 = zext i8 %1078 to i64
  %1080 = shl nuw nsw i64 %1079, 40
  %1081 = or i64 %1076, %1080
  %1082 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 6
  %1083 = load i8, i8 addrspace(4)* %1082, align 1, !tbaa !13
  %1084 = zext i8 %1083 to i64
  %1085 = shl nuw nsw i64 %1084, 48
  %1086 = or i64 %1081, %1085
  %1087 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 7
  %1088 = load i8, i8 addrspace(4)* %1087, align 1, !tbaa !13
  %1089 = zext i8 %1088 to i64
  %1090 = shl nuw i64 %1089, 56
  %1091 = or i64 %1086, %1090
  %1092 = add nsw i32 %1049, -8
  %1093 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 8
  br label %1107

1094:                                             ; preds = %1052, %1094
  %1095 = phi i32 [ %1105, %1094 ], [ 0, %1052 ]
  %1096 = phi i64 [ %1104, %1094 ], [ 0, %1052 ]
  %1097 = zext i32 %1095 to i64
  %1098 = getelementptr inbounds i8, i8 addrspace(4)* %1048, i64 %1097
  %1099 = load i8, i8 addrspace(4)* %1098, align 1, !tbaa !13
  %1100 = zext i8 %1099 to i64
  %1101 = shl i32 %1095, 3
  %1102 = zext i32 %1101 to i64
  %1103 = shl nuw i64 %1100, %1102
  %1104 = or i64 %1103, %1096
  %1105 = add nuw nsw i32 %1095, 1
  %1106 = icmp eq i32 %1105, %1049
  br i1 %1106, label %1107, label %1094

1107:                                             ; preds = %1094, %1054, %1052
  %1108 = phi i8 addrspace(4)* [ %1093, %1054 ], [ %1048, %1052 ], [ %1048, %1094 ]
  %1109 = phi i32 [ %1092, %1054 ], [ 0, %1052 ], [ 0, %1094 ]
  %1110 = phi i64 [ %1091, %1054 ], [ 0, %1052 ], [ %1104, %1094 ]
  %1111 = icmp ugt i32 %1109, 7
  br i1 %1111, label %1114, label %1112

1112:                                             ; preds = %1107
  %1113 = icmp eq i32 %1109, 0
  br i1 %1113, label %1167, label %1154

1114:                                             ; preds = %1107
  %1115 = load i8, i8 addrspace(4)* %1108, align 1, !tbaa !13
  %1116 = zext i8 %1115 to i64
  %1117 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 1
  %1118 = load i8, i8 addrspace(4)* %1117, align 1, !tbaa !13
  %1119 = zext i8 %1118 to i64
  %1120 = shl nuw nsw i64 %1119, 8
  %1121 = or i64 %1120, %1116
  %1122 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 2
  %1123 = load i8, i8 addrspace(4)* %1122, align 1, !tbaa !13
  %1124 = zext i8 %1123 to i64
  %1125 = shl nuw nsw i64 %1124, 16
  %1126 = or i64 %1121, %1125
  %1127 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 3
  %1128 = load i8, i8 addrspace(4)* %1127, align 1, !tbaa !13
  %1129 = zext i8 %1128 to i64
  %1130 = shl nuw nsw i64 %1129, 24
  %1131 = or i64 %1126, %1130
  %1132 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 4
  %1133 = load i8, i8 addrspace(4)* %1132, align 1, !tbaa !13
  %1134 = zext i8 %1133 to i64
  %1135 = shl nuw nsw i64 %1134, 32
  %1136 = or i64 %1131, %1135
  %1137 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 5
  %1138 = load i8, i8 addrspace(4)* %1137, align 1, !tbaa !13
  %1139 = zext i8 %1138 to i64
  %1140 = shl nuw nsw i64 %1139, 40
  %1141 = or i64 %1136, %1140
  %1142 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 6
  %1143 = load i8, i8 addrspace(4)* %1142, align 1, !tbaa !13
  %1144 = zext i8 %1143 to i64
  %1145 = shl nuw nsw i64 %1144, 48
  %1146 = or i64 %1141, %1145
  %1147 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 7
  %1148 = load i8, i8 addrspace(4)* %1147, align 1, !tbaa !13
  %1149 = zext i8 %1148 to i64
  %1150 = shl nuw i64 %1149, 56
  %1151 = or i64 %1146, %1150
  %1152 = add nsw i32 %1109, -8
  %1153 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 8
  br label %1167

1154:                                             ; preds = %1112, %1154
  %1155 = phi i32 [ %1165, %1154 ], [ 0, %1112 ]
  %1156 = phi i64 [ %1164, %1154 ], [ 0, %1112 ]
  %1157 = zext i32 %1155 to i64
  %1158 = getelementptr inbounds i8, i8 addrspace(4)* %1108, i64 %1157
  %1159 = load i8, i8 addrspace(4)* %1158, align 1, !tbaa !13
  %1160 = zext i8 %1159 to i64
  %1161 = shl i32 %1155, 3
  %1162 = zext i32 %1161 to i64
  %1163 = shl nuw i64 %1160, %1162
  %1164 = or i64 %1163, %1156
  %1165 = add nuw nsw i32 %1155, 1
  %1166 = icmp eq i32 %1165, %1109
  br i1 %1166, label %1167, label %1154

1167:                                             ; preds = %1154, %1114, %1112
  %1168 = phi i8 addrspace(4)* [ %1153, %1114 ], [ %1108, %1112 ], [ %1108, %1154 ]
  %1169 = phi i32 [ %1152, %1114 ], [ 0, %1112 ], [ 0, %1154 ]
  %1170 = phi i64 [ %1151, %1114 ], [ 0, %1112 ], [ %1164, %1154 ]
  %1171 = icmp ugt i32 %1169, 7
  br i1 %1171, label %1174, label %1172

1172:                                             ; preds = %1167
  %1173 = icmp eq i32 %1169, 0
  br i1 %1173, label %1227, label %1214

1174:                                             ; preds = %1167
  %1175 = load i8, i8 addrspace(4)* %1168, align 1, !tbaa !13
  %1176 = zext i8 %1175 to i64
  %1177 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 1
  %1178 = load i8, i8 addrspace(4)* %1177, align 1, !tbaa !13
  %1179 = zext i8 %1178 to i64
  %1180 = shl nuw nsw i64 %1179, 8
  %1181 = or i64 %1180, %1176
  %1182 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 2
  %1183 = load i8, i8 addrspace(4)* %1182, align 1, !tbaa !13
  %1184 = zext i8 %1183 to i64
  %1185 = shl nuw nsw i64 %1184, 16
  %1186 = or i64 %1181, %1185
  %1187 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 3
  %1188 = load i8, i8 addrspace(4)* %1187, align 1, !tbaa !13
  %1189 = zext i8 %1188 to i64
  %1190 = shl nuw nsw i64 %1189, 24
  %1191 = or i64 %1186, %1190
  %1192 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 4
  %1193 = load i8, i8 addrspace(4)* %1192, align 1, !tbaa !13
  %1194 = zext i8 %1193 to i64
  %1195 = shl nuw nsw i64 %1194, 32
  %1196 = or i64 %1191, %1195
  %1197 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 5
  %1198 = load i8, i8 addrspace(4)* %1197, align 1, !tbaa !13
  %1199 = zext i8 %1198 to i64
  %1200 = shl nuw nsw i64 %1199, 40
  %1201 = or i64 %1196, %1200
  %1202 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 6
  %1203 = load i8, i8 addrspace(4)* %1202, align 1, !tbaa !13
  %1204 = zext i8 %1203 to i64
  %1205 = shl nuw nsw i64 %1204, 48
  %1206 = or i64 %1201, %1205
  %1207 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 7
  %1208 = load i8, i8 addrspace(4)* %1207, align 1, !tbaa !13
  %1209 = zext i8 %1208 to i64
  %1210 = shl nuw i64 %1209, 56
  %1211 = or i64 %1206, %1210
  %1212 = add nsw i32 %1169, -8
  %1213 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 8
  br label %1227

1214:                                             ; preds = %1172, %1214
  %1215 = phi i32 [ %1225, %1214 ], [ 0, %1172 ]
  %1216 = phi i64 [ %1224, %1214 ], [ 0, %1172 ]
  %1217 = zext i32 %1215 to i64
  %1218 = getelementptr inbounds i8, i8 addrspace(4)* %1168, i64 %1217
  %1219 = load i8, i8 addrspace(4)* %1218, align 1, !tbaa !13
  %1220 = zext i8 %1219 to i64
  %1221 = shl i32 %1215, 3
  %1222 = zext i32 %1221 to i64
  %1223 = shl nuw i64 %1220, %1222
  %1224 = or i64 %1223, %1216
  %1225 = add nuw nsw i32 %1215, 1
  %1226 = icmp eq i32 %1225, %1169
  br i1 %1226, label %1227, label %1214

1227:                                             ; preds = %1214, %1174, %1172
  %1228 = phi i8 addrspace(4)* [ %1213, %1174 ], [ %1168, %1172 ], [ %1168, %1214 ]
  %1229 = phi i32 [ %1212, %1174 ], [ 0, %1172 ], [ 0, %1214 ]
  %1230 = phi i64 [ %1211, %1174 ], [ 0, %1172 ], [ %1224, %1214 ]
  %1231 = icmp ugt i32 %1229, 7
  br i1 %1231, label %1234, label %1232

1232:                                             ; preds = %1227
  %1233 = icmp eq i32 %1229, 0
  br i1 %1233, label %1287, label %1274

1234:                                             ; preds = %1227
  %1235 = load i8, i8 addrspace(4)* %1228, align 1, !tbaa !13
  %1236 = zext i8 %1235 to i64
  %1237 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 1
  %1238 = load i8, i8 addrspace(4)* %1237, align 1, !tbaa !13
  %1239 = zext i8 %1238 to i64
  %1240 = shl nuw nsw i64 %1239, 8
  %1241 = or i64 %1240, %1236
  %1242 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 2
  %1243 = load i8, i8 addrspace(4)* %1242, align 1, !tbaa !13
  %1244 = zext i8 %1243 to i64
  %1245 = shl nuw nsw i64 %1244, 16
  %1246 = or i64 %1241, %1245
  %1247 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 3
  %1248 = load i8, i8 addrspace(4)* %1247, align 1, !tbaa !13
  %1249 = zext i8 %1248 to i64
  %1250 = shl nuw nsw i64 %1249, 24
  %1251 = or i64 %1246, %1250
  %1252 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 4
  %1253 = load i8, i8 addrspace(4)* %1252, align 1, !tbaa !13
  %1254 = zext i8 %1253 to i64
  %1255 = shl nuw nsw i64 %1254, 32
  %1256 = or i64 %1251, %1255
  %1257 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 5
  %1258 = load i8, i8 addrspace(4)* %1257, align 1, !tbaa !13
  %1259 = zext i8 %1258 to i64
  %1260 = shl nuw nsw i64 %1259, 40
  %1261 = or i64 %1256, %1260
  %1262 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 6
  %1263 = load i8, i8 addrspace(4)* %1262, align 1, !tbaa !13
  %1264 = zext i8 %1263 to i64
  %1265 = shl nuw nsw i64 %1264, 48
  %1266 = or i64 %1261, %1265
  %1267 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 7
  %1268 = load i8, i8 addrspace(4)* %1267, align 1, !tbaa !13
  %1269 = zext i8 %1268 to i64
  %1270 = shl nuw i64 %1269, 56
  %1271 = or i64 %1266, %1270
  %1272 = add nsw i32 %1229, -8
  %1273 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 8
  br label %1287

1274:                                             ; preds = %1232, %1274
  %1275 = phi i32 [ %1285, %1274 ], [ 0, %1232 ]
  %1276 = phi i64 [ %1284, %1274 ], [ 0, %1232 ]
  %1277 = zext i32 %1275 to i64
  %1278 = getelementptr inbounds i8, i8 addrspace(4)* %1228, i64 %1277
  %1279 = load i8, i8 addrspace(4)* %1278, align 1, !tbaa !13
  %1280 = zext i8 %1279 to i64
  %1281 = shl i32 %1275, 3
  %1282 = zext i32 %1281 to i64
  %1283 = shl nuw i64 %1280, %1282
  %1284 = or i64 %1283, %1276
  %1285 = add nuw nsw i32 %1275, 1
  %1286 = icmp eq i32 %1285, %1229
  br i1 %1286, label %1287, label %1274

1287:                                             ; preds = %1274, %1234, %1232
  %1288 = phi i8 addrspace(4)* [ %1273, %1234 ], [ %1228, %1232 ], [ %1228, %1274 ]
  %1289 = phi i32 [ %1272, %1234 ], [ 0, %1232 ], [ 0, %1274 ]
  %1290 = phi i64 [ %1271, %1234 ], [ 0, %1232 ], [ %1284, %1274 ]
  %1291 = icmp ugt i32 %1289, 7
  br i1 %1291, label %1294, label %1292

1292:                                             ; preds = %1287
  %1293 = icmp eq i32 %1289, 0
  br i1 %1293, label %1347, label %1334

1294:                                             ; preds = %1287
  %1295 = load i8, i8 addrspace(4)* %1288, align 1, !tbaa !13
  %1296 = zext i8 %1295 to i64
  %1297 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 1
  %1298 = load i8, i8 addrspace(4)* %1297, align 1, !tbaa !13
  %1299 = zext i8 %1298 to i64
  %1300 = shl nuw nsw i64 %1299, 8
  %1301 = or i64 %1300, %1296
  %1302 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 2
  %1303 = load i8, i8 addrspace(4)* %1302, align 1, !tbaa !13
  %1304 = zext i8 %1303 to i64
  %1305 = shl nuw nsw i64 %1304, 16
  %1306 = or i64 %1301, %1305
  %1307 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 3
  %1308 = load i8, i8 addrspace(4)* %1307, align 1, !tbaa !13
  %1309 = zext i8 %1308 to i64
  %1310 = shl nuw nsw i64 %1309, 24
  %1311 = or i64 %1306, %1310
  %1312 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 4
  %1313 = load i8, i8 addrspace(4)* %1312, align 1, !tbaa !13
  %1314 = zext i8 %1313 to i64
  %1315 = shl nuw nsw i64 %1314, 32
  %1316 = or i64 %1311, %1315
  %1317 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 5
  %1318 = load i8, i8 addrspace(4)* %1317, align 1, !tbaa !13
  %1319 = zext i8 %1318 to i64
  %1320 = shl nuw nsw i64 %1319, 40
  %1321 = or i64 %1316, %1320
  %1322 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 6
  %1323 = load i8, i8 addrspace(4)* %1322, align 1, !tbaa !13
  %1324 = zext i8 %1323 to i64
  %1325 = shl nuw nsw i64 %1324, 48
  %1326 = or i64 %1321, %1325
  %1327 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 7
  %1328 = load i8, i8 addrspace(4)* %1327, align 1, !tbaa !13
  %1329 = zext i8 %1328 to i64
  %1330 = shl nuw i64 %1329, 56
  %1331 = or i64 %1326, %1330
  %1332 = add nsw i32 %1289, -8
  %1333 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 8
  br label %1347

1334:                                             ; preds = %1292, %1334
  %1335 = phi i32 [ %1345, %1334 ], [ 0, %1292 ]
  %1336 = phi i64 [ %1344, %1334 ], [ 0, %1292 ]
  %1337 = zext i32 %1335 to i64
  %1338 = getelementptr inbounds i8, i8 addrspace(4)* %1288, i64 %1337
  %1339 = load i8, i8 addrspace(4)* %1338, align 1, !tbaa !13
  %1340 = zext i8 %1339 to i64
  %1341 = shl i32 %1335, 3
  %1342 = zext i32 %1341 to i64
  %1343 = shl nuw i64 %1340, %1342
  %1344 = or i64 %1343, %1336
  %1345 = add nuw nsw i32 %1335, 1
  %1346 = icmp eq i32 %1345, %1289
  br i1 %1346, label %1347, label %1334

1347:                                             ; preds = %1334, %1294, %1292
  %1348 = phi i8 addrspace(4)* [ %1333, %1294 ], [ %1288, %1292 ], [ %1288, %1334 ]
  %1349 = phi i32 [ %1332, %1294 ], [ 0, %1292 ], [ 0, %1334 ]
  %1350 = phi i64 [ %1331, %1294 ], [ 0, %1292 ], [ %1344, %1334 ]
  %1351 = icmp ugt i32 %1349, 7
  br i1 %1351, label %1354, label %1352

1352:                                             ; preds = %1347
  %1353 = icmp eq i32 %1349, 0
  br i1 %1353, label %1405, label %1392

1354:                                             ; preds = %1347
  %1355 = load i8, i8 addrspace(4)* %1348, align 1, !tbaa !13
  %1356 = zext i8 %1355 to i64
  %1357 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 1
  %1358 = load i8, i8 addrspace(4)* %1357, align 1, !tbaa !13
  %1359 = zext i8 %1358 to i64
  %1360 = shl nuw nsw i64 %1359, 8
  %1361 = or i64 %1360, %1356
  %1362 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 2
  %1363 = load i8, i8 addrspace(4)* %1362, align 1, !tbaa !13
  %1364 = zext i8 %1363 to i64
  %1365 = shl nuw nsw i64 %1364, 16
  %1366 = or i64 %1361, %1365
  %1367 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 3
  %1368 = load i8, i8 addrspace(4)* %1367, align 1, !tbaa !13
  %1369 = zext i8 %1368 to i64
  %1370 = shl nuw nsw i64 %1369, 24
  %1371 = or i64 %1366, %1370
  %1372 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 4
  %1373 = load i8, i8 addrspace(4)* %1372, align 1, !tbaa !13
  %1374 = zext i8 %1373 to i64
  %1375 = shl nuw nsw i64 %1374, 32
  %1376 = or i64 %1371, %1375
  %1377 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 5
  %1378 = load i8, i8 addrspace(4)* %1377, align 1, !tbaa !13
  %1379 = zext i8 %1378 to i64
  %1380 = shl nuw nsw i64 %1379, 40
  %1381 = or i64 %1376, %1380
  %1382 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 6
  %1383 = load i8, i8 addrspace(4)* %1382, align 1, !tbaa !13
  %1384 = zext i8 %1383 to i64
  %1385 = shl nuw nsw i64 %1384, 48
  %1386 = or i64 %1381, %1385
  %1387 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 7
  %1388 = load i8, i8 addrspace(4)* %1387, align 1, !tbaa !13
  %1389 = zext i8 %1388 to i64
  %1390 = shl nuw i64 %1389, 56
  %1391 = or i64 %1386, %1390
  br label %1405

1392:                                             ; preds = %1352, %1392
  %1393 = phi i32 [ %1403, %1392 ], [ 0, %1352 ]
  %1394 = phi i64 [ %1402, %1392 ], [ 0, %1352 ]
  %1395 = zext i32 %1393 to i64
  %1396 = getelementptr inbounds i8, i8 addrspace(4)* %1348, i64 %1395
  %1397 = load i8, i8 addrspace(4)* %1396, align 1, !tbaa !13
  %1398 = zext i8 %1397 to i64
  %1399 = shl i32 %1393, 3
  %1400 = zext i32 %1399 to i64
  %1401 = shl nuw i64 %1398, %1400
  %1402 = or i64 %1401, %1394
  %1403 = add nuw nsw i32 %1393, 1
  %1404 = icmp eq i32 %1403, %1349
  br i1 %1404, label %1405, label %1392

1405:                                             ; preds = %1392, %1354, %1352
  %1406 = phi i64 [ %1391, %1354 ], [ 0, %1352 ], [ %1402, %1392 ]
  %1407 = shl nuw nsw i64 %988, 2
  %1408 = add nuw nsw i64 %1407, 28
  %1409 = and i64 %1408, 480
  %1410 = and i64 %990, -225
  %1411 = or i64 %1410, %1409
  %1412 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %1411, i64 noundef %1050, i64 noundef %1110, i64 noundef %1170, i64 noundef %1230, i64 noundef %1290, i64 noundef %1350, i64 noundef %1406) #10
  %1413 = sub i64 %980, %988
  %1414 = getelementptr inbounds i8, i8 addrspace(4)* %981, i64 %988
  %1415 = icmp eq i64 %1413, 0
  br i1 %1415, label %1416, label %979

1416:                                             ; preds = %1405, %971
  %1417 = phi <2 x i64> [ %974, %971 ], [ %1412, %1405 ]
  %1418 = fpext float %964 to double
  %1419 = fpext float %966 to double
  %1420 = fpext float %968 to double
  %1421 = extractelement <2 x i64> %1417, i64 0
  %1422 = and i64 %1421, -225
  %1423 = or i64 %1422, 32
  %1424 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %1423, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1425 = extractelement <2 x i64> %1424, i64 0
  %1426 = bitcast double %1418 to i64
  %1427 = and i64 %1425, -225
  %1428 = or i64 %1427, 32
  %1429 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %1428, i64 noundef %1426, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1430 = extractelement <2 x i64> %1429, i64 0
  %1431 = bitcast double %1419 to i64
  %1432 = and i64 %1430, -225
  %1433 = or i64 %1432, 32
  %1434 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %1433, i64 noundef %1431, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1435 = extractelement <2 x i64> %1434, i64 0
  %1436 = bitcast double %1420 to i64
  %1437 = and i64 %1435, -227
  %1438 = or i64 %1437, 34
  %1439 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %16, i64 noundef %1438, i64 noundef %1436, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  ret void
}

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !16
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !18
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !9
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !9
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !9
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !9
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !9
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !9
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !9
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !9
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !18
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !20
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !18
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !18
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !16
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !21
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !24
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !21
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !24
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !9
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !9
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !21
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !24
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !16
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !9
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !25
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !24
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !16
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !16
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !16
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !18
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !9
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !9
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !9
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !9
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !9
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !9
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !9
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !9
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %110 = call i64 @llvm.read_register.i64(metadata !26) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !27
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !29
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !30
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !9
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !9
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !9
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !9
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !9
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !9
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !9
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !9
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !9
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !21
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !24
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !31
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !31
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !32
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !34
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !16
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !16
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !9
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !9
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !13
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !16
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !9
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !18
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !18
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !24
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !21
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !31
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !31
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !13
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
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = !{!11, !11, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !11, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"int", !11, i64 0}
!20 = !{i64 2662}
!21 = !{!22, !17, i64 0}
!22 = !{!"", !17, i64 0, !17, i64 8, !23, i64 16, !10, i64 24, !10, i64 32, !10, i64 40}
!23 = !{!"hsa_signal_s", !10, i64 0}
!24 = !{!22, !10, i64 40}
!25 = !{!22, !17, i64 8}
!26 = !{!"exec"}
!27 = !{!28, !19, i64 16}
!28 = !{!"", !10, i64 0, !10, i64 8, !19, i64 16, !19, i64 20}
!29 = !{!28, !10, i64 8}
!30 = !{!28, !19, i64 20}
!31 = !{!28, !10, i64 0}
!32 = !{!33, !10, i64 16}
!33 = !{!"amd_signal_s", !10, i64 0, !11, i64 8, !10, i64 16, !19, i64 24, !19, i64 28, !10, i64 32, !10, i64 40, !11, i64 48, !11, i64 56}
!34 = !{!33, !19, i64 24}
