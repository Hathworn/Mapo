; ModuleID = '../data/hip_kernels/938/39/main.cu'
source_filename = "../data/hip_kernels/938/39/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [16 x i8] c"Thread %d : %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [19 x i8] c"out location : %p\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [12 x i8] c"in %d : %d\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [13 x i8] c"out %d : %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z10stencil_ldPjS_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %4
  %6 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5, !amdgpu.noclobber !9
  %7 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 24
  %9 = bitcast i8 addrspace(4)* %8 to i64 addrspace(4)*
  %10 = load i64, i64 addrspace(4)* %9, align 8, !tbaa !10
  %11 = inttoptr i64 %10 to i8 addrspace(1)*
  %12 = addrspacecast i8 addrspace(1)* %11 to i8*
  %13 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %14 = extractelement <2 x i64> %13, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %15, label %19

15:                                               ; preds = %2
  %16 = and i64 %14, -225
  %17 = or i64 %16, 32
  %18 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %17, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %460

19:                                               ; preds = %2
  %20 = and i64 %14, 2
  %21 = and i64 %14, -3
  %22 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %21, i64 0
  br label %23

23:                                               ; preds = %449, %19
  %24 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str to [16 x i8]*) to i64)), i64 1))), %19 ], [ %457, %449 ]
  %25 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0), %19 ], [ %458, %449 ]
  %26 = phi <2 x i64> [ %22, %19 ], [ %456, %449 ]
  %27 = icmp ugt i64 %24, 56
  %28 = extractelement <2 x i64> %26, i64 0
  %29 = or i64 %28, %20
  %30 = insertelement <2 x i64> poison, i64 %29, i64 0
  %31 = select i1 %27, <2 x i64> %26, <2 x i64> %30
  %32 = tail call i64 @llvm.umin.i64(i64 %24, i64 56)
  %33 = trunc i64 %32 to i32
  %34 = extractelement <2 x i64> %31, i64 0
  %35 = icmp ugt i32 %33, 7
  br i1 %35, label %38, label %36

36:                                               ; preds = %23
  %37 = icmp eq i32 %33, 0
  br i1 %37, label %91, label %78

38:                                               ; preds = %23
  %39 = load i8, i8 addrspace(4)* %25, align 1, !tbaa !14
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 1
  %42 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !14
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 8
  %45 = or i64 %44, %40
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 2
  %47 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !14
  %48 = zext i8 %47 to i64
  %49 = shl nuw nsw i64 %48, 16
  %50 = or i64 %45, %49
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 3
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !14
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 24
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 4
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !14
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 32
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 5
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !14
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 40
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 6
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !14
  %68 = zext i8 %67 to i64
  %69 = shl nuw nsw i64 %68, 48
  %70 = or i64 %65, %69
  %71 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 7
  %72 = load i8, i8 addrspace(4)* %71, align 1, !tbaa !14
  %73 = zext i8 %72 to i64
  %74 = shl nuw i64 %73, 56
  %75 = or i64 %70, %74
  %76 = add nsw i32 %33, -8
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 8
  br label %91

78:                                               ; preds = %36, %78
  %79 = phi i32 [ %89, %78 ], [ 0, %36 ]
  %80 = phi i64 [ %88, %78 ], [ 0, %36 ]
  %81 = zext i32 %79 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 %81
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !14
  %84 = zext i8 %83 to i64
  %85 = shl i32 %79, 3
  %86 = zext i32 %85 to i64
  %87 = shl nuw i64 %84, %86
  %88 = or i64 %87, %80
  %89 = add nuw nsw i32 %79, 1
  %90 = icmp eq i32 %89, %33
  br i1 %90, label %91, label %78, !llvm.loop !15

91:                                               ; preds = %78, %38, %36
  %92 = phi i8 addrspace(4)* [ %77, %38 ], [ %25, %36 ], [ %25, %78 ]
  %93 = phi i32 [ %76, %38 ], [ 0, %36 ], [ 0, %78 ]
  %94 = phi i64 [ %75, %38 ], [ 0, %36 ], [ %88, %78 ]
  %95 = icmp ugt i32 %93, 7
  br i1 %95, label %98, label %96

96:                                               ; preds = %91
  %97 = icmp eq i32 %93, 0
  br i1 %97, label %151, label %138

98:                                               ; preds = %91
  %99 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !14
  %100 = zext i8 %99 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 1
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !14
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 8
  %105 = or i64 %104, %100
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 2
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !14
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 16
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 3
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !14
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 24
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 4
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !14
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 32
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 5
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !14
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 40
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 6
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !14
  %128 = zext i8 %127 to i64
  %129 = shl nuw nsw i64 %128, 48
  %130 = or i64 %125, %129
  %131 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 7
  %132 = load i8, i8 addrspace(4)* %131, align 1, !tbaa !14
  %133 = zext i8 %132 to i64
  %134 = shl nuw i64 %133, 56
  %135 = or i64 %130, %134
  %136 = add nsw i32 %93, -8
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 8
  br label %151

138:                                              ; preds = %96, %138
  %139 = phi i32 [ %149, %138 ], [ 0, %96 ]
  %140 = phi i64 [ %148, %138 ], [ 0, %96 ]
  %141 = zext i32 %139 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %92, i64 %141
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !14
  %144 = zext i8 %143 to i64
  %145 = shl i32 %139, 3
  %146 = zext i32 %145 to i64
  %147 = shl nuw i64 %144, %146
  %148 = or i64 %147, %140
  %149 = add nuw nsw i32 %139, 1
  %150 = icmp eq i32 %149, %93
  br i1 %150, label %151, label %138

151:                                              ; preds = %138, %98, %96
  %152 = phi i8 addrspace(4)* [ %137, %98 ], [ %92, %96 ], [ %92, %138 ]
  %153 = phi i32 [ %136, %98 ], [ 0, %96 ], [ 0, %138 ]
  %154 = phi i64 [ %135, %98 ], [ 0, %96 ], [ %148, %138 ]
  %155 = icmp ugt i32 %153, 7
  br i1 %155, label %158, label %156

156:                                              ; preds = %151
  %157 = icmp eq i32 %153, 0
  br i1 %157, label %211, label %198

158:                                              ; preds = %151
  %159 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !14
  %160 = zext i8 %159 to i64
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 1
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !14
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 8
  %165 = or i64 %164, %160
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 2
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !14
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 16
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 3
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !14
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 24
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 4
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !14
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 32
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 5
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !14
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 40
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 6
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !14
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 48
  %190 = or i64 %185, %189
  %191 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 7
  %192 = load i8, i8 addrspace(4)* %191, align 1, !tbaa !14
  %193 = zext i8 %192 to i64
  %194 = shl nuw i64 %193, 56
  %195 = or i64 %190, %194
  %196 = add nsw i32 %153, -8
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 8
  br label %211

198:                                              ; preds = %156, %198
  %199 = phi i32 [ %209, %198 ], [ 0, %156 ]
  %200 = phi i64 [ %208, %198 ], [ 0, %156 ]
  %201 = zext i32 %199 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %152, i64 %201
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !14
  %204 = zext i8 %203 to i64
  %205 = shl i32 %199, 3
  %206 = zext i32 %205 to i64
  %207 = shl nuw i64 %204, %206
  %208 = or i64 %207, %200
  %209 = add nuw nsw i32 %199, 1
  %210 = icmp eq i32 %209, %153
  br i1 %210, label %211, label %198

211:                                              ; preds = %198, %158, %156
  %212 = phi i8 addrspace(4)* [ %197, %158 ], [ %152, %156 ], [ %152, %198 ]
  %213 = phi i32 [ %196, %158 ], [ 0, %156 ], [ 0, %198 ]
  %214 = phi i64 [ %195, %158 ], [ 0, %156 ], [ %208, %198 ]
  %215 = icmp ugt i32 %213, 7
  br i1 %215, label %218, label %216

216:                                              ; preds = %211
  %217 = icmp eq i32 %213, 0
  br i1 %217, label %271, label %258

218:                                              ; preds = %211
  %219 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !14
  %220 = zext i8 %219 to i64
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 1
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !14
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 8
  %225 = or i64 %224, %220
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 2
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !14
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 16
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 3
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !14
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 24
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 4
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !14
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 32
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 5
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !14
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 40
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 6
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !14
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 48
  %250 = or i64 %245, %249
  %251 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 7
  %252 = load i8, i8 addrspace(4)* %251, align 1, !tbaa !14
  %253 = zext i8 %252 to i64
  %254 = shl nuw i64 %253, 56
  %255 = or i64 %250, %254
  %256 = add nsw i32 %213, -8
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 8
  br label %271

258:                                              ; preds = %216, %258
  %259 = phi i32 [ %269, %258 ], [ 0, %216 ]
  %260 = phi i64 [ %268, %258 ], [ 0, %216 ]
  %261 = zext i32 %259 to i64
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %212, i64 %261
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !14
  %264 = zext i8 %263 to i64
  %265 = shl i32 %259, 3
  %266 = zext i32 %265 to i64
  %267 = shl nuw i64 %264, %266
  %268 = or i64 %267, %260
  %269 = add nuw nsw i32 %259, 1
  %270 = icmp eq i32 %269, %213
  br i1 %270, label %271, label %258

271:                                              ; preds = %258, %218, %216
  %272 = phi i8 addrspace(4)* [ %257, %218 ], [ %212, %216 ], [ %212, %258 ]
  %273 = phi i32 [ %256, %218 ], [ 0, %216 ], [ 0, %258 ]
  %274 = phi i64 [ %255, %218 ], [ 0, %216 ], [ %268, %258 ]
  %275 = icmp ugt i32 %273, 7
  br i1 %275, label %278, label %276

276:                                              ; preds = %271
  %277 = icmp eq i32 %273, 0
  br i1 %277, label %331, label %318

278:                                              ; preds = %271
  %279 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !14
  %280 = zext i8 %279 to i64
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 1
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !14
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 8
  %285 = or i64 %284, %280
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 2
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !14
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 16
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 3
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !14
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 24
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 4
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !14
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 32
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 5
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !14
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 40
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 6
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !14
  %308 = zext i8 %307 to i64
  %309 = shl nuw nsw i64 %308, 48
  %310 = or i64 %305, %309
  %311 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 7
  %312 = load i8, i8 addrspace(4)* %311, align 1, !tbaa !14
  %313 = zext i8 %312 to i64
  %314 = shl nuw i64 %313, 56
  %315 = or i64 %310, %314
  %316 = add nsw i32 %273, -8
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 8
  br label %331

318:                                              ; preds = %276, %318
  %319 = phi i32 [ %329, %318 ], [ 0, %276 ]
  %320 = phi i64 [ %328, %318 ], [ 0, %276 ]
  %321 = zext i32 %319 to i64
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %272, i64 %321
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !14
  %324 = zext i8 %323 to i64
  %325 = shl i32 %319, 3
  %326 = zext i32 %325 to i64
  %327 = shl nuw i64 %324, %326
  %328 = or i64 %327, %320
  %329 = add nuw nsw i32 %319, 1
  %330 = icmp eq i32 %329, %273
  br i1 %330, label %331, label %318

331:                                              ; preds = %318, %278, %276
  %332 = phi i8 addrspace(4)* [ %317, %278 ], [ %272, %276 ], [ %272, %318 ]
  %333 = phi i32 [ %316, %278 ], [ 0, %276 ], [ 0, %318 ]
  %334 = phi i64 [ %315, %278 ], [ 0, %276 ], [ %328, %318 ]
  %335 = icmp ugt i32 %333, 7
  br i1 %335, label %338, label %336

336:                                              ; preds = %331
  %337 = icmp eq i32 %333, 0
  br i1 %337, label %391, label %378

338:                                              ; preds = %331
  %339 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !14
  %340 = zext i8 %339 to i64
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 1
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !14
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 8
  %345 = or i64 %344, %340
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 2
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !14
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 16
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 3
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !14
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 24
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 4
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !14
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 32
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 5
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !14
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 40
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 6
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !14
  %368 = zext i8 %367 to i64
  %369 = shl nuw nsw i64 %368, 48
  %370 = or i64 %365, %369
  %371 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 7
  %372 = load i8, i8 addrspace(4)* %371, align 1, !tbaa !14
  %373 = zext i8 %372 to i64
  %374 = shl nuw i64 %373, 56
  %375 = or i64 %370, %374
  %376 = add nsw i32 %333, -8
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 8
  br label %391

378:                                              ; preds = %336, %378
  %379 = phi i32 [ %389, %378 ], [ 0, %336 ]
  %380 = phi i64 [ %388, %378 ], [ 0, %336 ]
  %381 = zext i32 %379 to i64
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %332, i64 %381
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !14
  %384 = zext i8 %383 to i64
  %385 = shl i32 %379, 3
  %386 = zext i32 %385 to i64
  %387 = shl nuw i64 %384, %386
  %388 = or i64 %387, %380
  %389 = add nuw nsw i32 %379, 1
  %390 = icmp eq i32 %389, %333
  br i1 %390, label %391, label %378

391:                                              ; preds = %378, %338, %336
  %392 = phi i8 addrspace(4)* [ %377, %338 ], [ %332, %336 ], [ %332, %378 ]
  %393 = phi i32 [ %376, %338 ], [ 0, %336 ], [ 0, %378 ]
  %394 = phi i64 [ %375, %338 ], [ 0, %336 ], [ %388, %378 ]
  %395 = icmp ugt i32 %393, 7
  br i1 %395, label %398, label %396

396:                                              ; preds = %391
  %397 = icmp eq i32 %393, 0
  br i1 %397, label %449, label %436

398:                                              ; preds = %391
  %399 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !14
  %400 = zext i8 %399 to i64
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 1
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !14
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 8
  %405 = or i64 %404, %400
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 2
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !14
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 16
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 3
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !14
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 24
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 4
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !14
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 32
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 5
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !14
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 40
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 6
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !14
  %428 = zext i8 %427 to i64
  %429 = shl nuw nsw i64 %428, 48
  %430 = or i64 %425, %429
  %431 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 7
  %432 = load i8, i8 addrspace(4)* %431, align 1, !tbaa !14
  %433 = zext i8 %432 to i64
  %434 = shl nuw i64 %433, 56
  %435 = or i64 %430, %434
  br label %449

436:                                              ; preds = %396, %436
  %437 = phi i32 [ %447, %436 ], [ 0, %396 ]
  %438 = phi i64 [ %446, %436 ], [ 0, %396 ]
  %439 = zext i32 %437 to i64
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %392, i64 %439
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !14
  %442 = zext i8 %441 to i64
  %443 = shl i32 %437, 3
  %444 = zext i32 %443 to i64
  %445 = shl nuw i64 %442, %444
  %446 = or i64 %445, %438
  %447 = add nuw nsw i32 %437, 1
  %448 = icmp eq i32 %447, %393
  br i1 %448, label %449, label %436

449:                                              ; preds = %436, %398, %396
  %450 = phi i64 [ %435, %398 ], [ 0, %396 ], [ %446, %436 ]
  %451 = shl nuw nsw i64 %32, 2
  %452 = add nuw nsw i64 %451, 28
  %453 = and i64 %452, 480
  %454 = and i64 %34, -225
  %455 = or i64 %454, %453
  %456 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %455, i64 noundef %94, i64 noundef %154, i64 noundef %214, i64 noundef %274, i64 noundef %334, i64 noundef %394, i64 noundef %450) #11
  %457 = sub i64 %24, %32
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %25, i64 %32
  %459 = icmp eq i64 %457, 0
  br i1 %459, label %460, label %23

460:                                              ; preds = %449, %15
  %461 = phi <2 x i64> [ %18, %15 ], [ %456, %449 ]
  %462 = extractelement <2 x i64> %461, i64 0
  %463 = and i64 %462, -225
  %464 = or i64 %463, 32
  %465 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %464, i64 noundef %4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %466 = extractelement <2 x i64> %465, i64 0
  %467 = zext i32 %6 to i64
  %468 = and i64 %466, -227
  %469 = or i64 %468, 34
  %470 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %469, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %471 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5
  %472 = shl i32 %471, 1
  %473 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %4
  store i32 %472, i32 addrspace(1)* %473, align 4, !tbaa !5
  %474 = addrspacecast i32 addrspace(1)* %473 to i32*
  %475 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %476 = extractelement <2 x i64> %475, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %477, label %481

477:                                              ; preds = %460
  %478 = and i64 %476, -225
  %479 = or i64 %478, 32
  %480 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %479, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %922

481:                                              ; preds = %460
  %482 = and i64 %476, 2
  %483 = and i64 %476, -3
  %484 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %483, i64 0
  br label %485

485:                                              ; preds = %911, %481
  %486 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str.1, i64 0, i64 18) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([19 x i8]* addrspacecast ([19 x i8] addrspace(4)* @.str.1 to [19 x i8]*) to i64)), i64 1))), %481 ], [ %919, %911 ]
  %487 = phi i8 addrspace(4)* [ getelementptr inbounds ([19 x i8], [19 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %481 ], [ %920, %911 ]
  %488 = phi <2 x i64> [ %484, %481 ], [ %918, %911 ]
  %489 = icmp ugt i64 %486, 56
  %490 = extractelement <2 x i64> %488, i64 0
  %491 = or i64 %490, %482
  %492 = insertelement <2 x i64> poison, i64 %491, i64 0
  %493 = select i1 %489, <2 x i64> %488, <2 x i64> %492
  %494 = tail call i64 @llvm.umin.i64(i64 %486, i64 56)
  %495 = trunc i64 %494 to i32
  %496 = extractelement <2 x i64> %493, i64 0
  %497 = icmp ugt i32 %495, 7
  br i1 %497, label %500, label %498

498:                                              ; preds = %485
  %499 = icmp eq i32 %495, 0
  br i1 %499, label %553, label %540

500:                                              ; preds = %485
  %501 = load i8, i8 addrspace(4)* %487, align 1, !tbaa !14
  %502 = zext i8 %501 to i64
  %503 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 1
  %504 = load i8, i8 addrspace(4)* %503, align 1, !tbaa !14
  %505 = zext i8 %504 to i64
  %506 = shl nuw nsw i64 %505, 8
  %507 = or i64 %506, %502
  %508 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 2
  %509 = load i8, i8 addrspace(4)* %508, align 1, !tbaa !14
  %510 = zext i8 %509 to i64
  %511 = shl nuw nsw i64 %510, 16
  %512 = or i64 %507, %511
  %513 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 3
  %514 = load i8, i8 addrspace(4)* %513, align 1, !tbaa !14
  %515 = zext i8 %514 to i64
  %516 = shl nuw nsw i64 %515, 24
  %517 = or i64 %512, %516
  %518 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 4
  %519 = load i8, i8 addrspace(4)* %518, align 1, !tbaa !14
  %520 = zext i8 %519 to i64
  %521 = shl nuw nsw i64 %520, 32
  %522 = or i64 %517, %521
  %523 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 5
  %524 = load i8, i8 addrspace(4)* %523, align 1, !tbaa !14
  %525 = zext i8 %524 to i64
  %526 = shl nuw nsw i64 %525, 40
  %527 = or i64 %522, %526
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 6
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !14
  %530 = zext i8 %529 to i64
  %531 = shl nuw nsw i64 %530, 48
  %532 = or i64 %527, %531
  %533 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 7
  %534 = load i8, i8 addrspace(4)* %533, align 1, !tbaa !14
  %535 = zext i8 %534 to i64
  %536 = shl nuw i64 %535, 56
  %537 = or i64 %532, %536
  %538 = add nsw i32 %495, -8
  %539 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 8
  br label %553

540:                                              ; preds = %498, %540
  %541 = phi i32 [ %551, %540 ], [ 0, %498 ]
  %542 = phi i64 [ %550, %540 ], [ 0, %498 ]
  %543 = zext i32 %541 to i64
  %544 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 %543
  %545 = load i8, i8 addrspace(4)* %544, align 1, !tbaa !14
  %546 = zext i8 %545 to i64
  %547 = shl i32 %541, 3
  %548 = zext i32 %547 to i64
  %549 = shl nuw i64 %546, %548
  %550 = or i64 %549, %542
  %551 = add nuw nsw i32 %541, 1
  %552 = icmp eq i32 %551, %495
  br i1 %552, label %553, label %540, !llvm.loop !15

553:                                              ; preds = %540, %500, %498
  %554 = phi i8 addrspace(4)* [ %539, %500 ], [ %487, %498 ], [ %487, %540 ]
  %555 = phi i32 [ %538, %500 ], [ 0, %498 ], [ 0, %540 ]
  %556 = phi i64 [ %537, %500 ], [ 0, %498 ], [ %550, %540 ]
  %557 = icmp ugt i32 %555, 7
  br i1 %557, label %560, label %558

558:                                              ; preds = %553
  %559 = icmp eq i32 %555, 0
  br i1 %559, label %613, label %600

560:                                              ; preds = %553
  %561 = load i8, i8 addrspace(4)* %554, align 1, !tbaa !14
  %562 = zext i8 %561 to i64
  %563 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 1
  %564 = load i8, i8 addrspace(4)* %563, align 1, !tbaa !14
  %565 = zext i8 %564 to i64
  %566 = shl nuw nsw i64 %565, 8
  %567 = or i64 %566, %562
  %568 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 2
  %569 = load i8, i8 addrspace(4)* %568, align 1, !tbaa !14
  %570 = zext i8 %569 to i64
  %571 = shl nuw nsw i64 %570, 16
  %572 = or i64 %567, %571
  %573 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 3
  %574 = load i8, i8 addrspace(4)* %573, align 1, !tbaa !14
  %575 = zext i8 %574 to i64
  %576 = shl nuw nsw i64 %575, 24
  %577 = or i64 %572, %576
  %578 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 4
  %579 = load i8, i8 addrspace(4)* %578, align 1, !tbaa !14
  %580 = zext i8 %579 to i64
  %581 = shl nuw nsw i64 %580, 32
  %582 = or i64 %577, %581
  %583 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 5
  %584 = load i8, i8 addrspace(4)* %583, align 1, !tbaa !14
  %585 = zext i8 %584 to i64
  %586 = shl nuw nsw i64 %585, 40
  %587 = or i64 %582, %586
  %588 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 6
  %589 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !14
  %590 = zext i8 %589 to i64
  %591 = shl nuw nsw i64 %590, 48
  %592 = or i64 %587, %591
  %593 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 7
  %594 = load i8, i8 addrspace(4)* %593, align 1, !tbaa !14
  %595 = zext i8 %594 to i64
  %596 = shl nuw i64 %595, 56
  %597 = or i64 %592, %596
  %598 = add nsw i32 %555, -8
  %599 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 8
  br label %613

600:                                              ; preds = %558, %600
  %601 = phi i32 [ %611, %600 ], [ 0, %558 ]
  %602 = phi i64 [ %610, %600 ], [ 0, %558 ]
  %603 = zext i32 %601 to i64
  %604 = getelementptr inbounds i8, i8 addrspace(4)* %554, i64 %603
  %605 = load i8, i8 addrspace(4)* %604, align 1, !tbaa !14
  %606 = zext i8 %605 to i64
  %607 = shl i32 %601, 3
  %608 = zext i32 %607 to i64
  %609 = shl nuw i64 %606, %608
  %610 = or i64 %609, %602
  %611 = add nuw nsw i32 %601, 1
  %612 = icmp eq i32 %611, %555
  br i1 %612, label %613, label %600

613:                                              ; preds = %600, %560, %558
  %614 = phi i8 addrspace(4)* [ %599, %560 ], [ %554, %558 ], [ %554, %600 ]
  %615 = phi i32 [ %598, %560 ], [ 0, %558 ], [ 0, %600 ]
  %616 = phi i64 [ %597, %560 ], [ 0, %558 ], [ %610, %600 ]
  %617 = icmp ugt i32 %615, 7
  br i1 %617, label %620, label %618

618:                                              ; preds = %613
  %619 = icmp eq i32 %615, 0
  br i1 %619, label %673, label %660

620:                                              ; preds = %613
  %621 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !14
  %622 = zext i8 %621 to i64
  %623 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 1
  %624 = load i8, i8 addrspace(4)* %623, align 1, !tbaa !14
  %625 = zext i8 %624 to i64
  %626 = shl nuw nsw i64 %625, 8
  %627 = or i64 %626, %622
  %628 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 2
  %629 = load i8, i8 addrspace(4)* %628, align 1, !tbaa !14
  %630 = zext i8 %629 to i64
  %631 = shl nuw nsw i64 %630, 16
  %632 = or i64 %627, %631
  %633 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 3
  %634 = load i8, i8 addrspace(4)* %633, align 1, !tbaa !14
  %635 = zext i8 %634 to i64
  %636 = shl nuw nsw i64 %635, 24
  %637 = or i64 %632, %636
  %638 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 4
  %639 = load i8, i8 addrspace(4)* %638, align 1, !tbaa !14
  %640 = zext i8 %639 to i64
  %641 = shl nuw nsw i64 %640, 32
  %642 = or i64 %637, %641
  %643 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 5
  %644 = load i8, i8 addrspace(4)* %643, align 1, !tbaa !14
  %645 = zext i8 %644 to i64
  %646 = shl nuw nsw i64 %645, 40
  %647 = or i64 %642, %646
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 6
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !14
  %650 = zext i8 %649 to i64
  %651 = shl nuw nsw i64 %650, 48
  %652 = or i64 %647, %651
  %653 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 7
  %654 = load i8, i8 addrspace(4)* %653, align 1, !tbaa !14
  %655 = zext i8 %654 to i64
  %656 = shl nuw i64 %655, 56
  %657 = or i64 %652, %656
  %658 = add nsw i32 %615, -8
  %659 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 8
  br label %673

660:                                              ; preds = %618, %660
  %661 = phi i32 [ %671, %660 ], [ 0, %618 ]
  %662 = phi i64 [ %670, %660 ], [ 0, %618 ]
  %663 = zext i32 %661 to i64
  %664 = getelementptr inbounds i8, i8 addrspace(4)* %614, i64 %663
  %665 = load i8, i8 addrspace(4)* %664, align 1, !tbaa !14
  %666 = zext i8 %665 to i64
  %667 = shl i32 %661, 3
  %668 = zext i32 %667 to i64
  %669 = shl nuw i64 %666, %668
  %670 = or i64 %669, %662
  %671 = add nuw nsw i32 %661, 1
  %672 = icmp eq i32 %671, %615
  br i1 %672, label %673, label %660

673:                                              ; preds = %660, %620, %618
  %674 = phi i8 addrspace(4)* [ %659, %620 ], [ %614, %618 ], [ %614, %660 ]
  %675 = phi i32 [ %658, %620 ], [ 0, %618 ], [ 0, %660 ]
  %676 = phi i64 [ %657, %620 ], [ 0, %618 ], [ %670, %660 ]
  %677 = icmp ugt i32 %675, 7
  br i1 %677, label %680, label %678

678:                                              ; preds = %673
  %679 = icmp eq i32 %675, 0
  br i1 %679, label %733, label %720

680:                                              ; preds = %673
  %681 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !14
  %682 = zext i8 %681 to i64
  %683 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 1
  %684 = load i8, i8 addrspace(4)* %683, align 1, !tbaa !14
  %685 = zext i8 %684 to i64
  %686 = shl nuw nsw i64 %685, 8
  %687 = or i64 %686, %682
  %688 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 2
  %689 = load i8, i8 addrspace(4)* %688, align 1, !tbaa !14
  %690 = zext i8 %689 to i64
  %691 = shl nuw nsw i64 %690, 16
  %692 = or i64 %687, %691
  %693 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 3
  %694 = load i8, i8 addrspace(4)* %693, align 1, !tbaa !14
  %695 = zext i8 %694 to i64
  %696 = shl nuw nsw i64 %695, 24
  %697 = or i64 %692, %696
  %698 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 4
  %699 = load i8, i8 addrspace(4)* %698, align 1, !tbaa !14
  %700 = zext i8 %699 to i64
  %701 = shl nuw nsw i64 %700, 32
  %702 = or i64 %697, %701
  %703 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 5
  %704 = load i8, i8 addrspace(4)* %703, align 1, !tbaa !14
  %705 = zext i8 %704 to i64
  %706 = shl nuw nsw i64 %705, 40
  %707 = or i64 %702, %706
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 6
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !14
  %710 = zext i8 %709 to i64
  %711 = shl nuw nsw i64 %710, 48
  %712 = or i64 %707, %711
  %713 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 7
  %714 = load i8, i8 addrspace(4)* %713, align 1, !tbaa !14
  %715 = zext i8 %714 to i64
  %716 = shl nuw i64 %715, 56
  %717 = or i64 %712, %716
  %718 = add nsw i32 %675, -8
  %719 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 8
  br label %733

720:                                              ; preds = %678, %720
  %721 = phi i32 [ %731, %720 ], [ 0, %678 ]
  %722 = phi i64 [ %730, %720 ], [ 0, %678 ]
  %723 = zext i32 %721 to i64
  %724 = getelementptr inbounds i8, i8 addrspace(4)* %674, i64 %723
  %725 = load i8, i8 addrspace(4)* %724, align 1, !tbaa !14
  %726 = zext i8 %725 to i64
  %727 = shl i32 %721, 3
  %728 = zext i32 %727 to i64
  %729 = shl nuw i64 %726, %728
  %730 = or i64 %729, %722
  %731 = add nuw nsw i32 %721, 1
  %732 = icmp eq i32 %731, %675
  br i1 %732, label %733, label %720

733:                                              ; preds = %720, %680, %678
  %734 = phi i8 addrspace(4)* [ %719, %680 ], [ %674, %678 ], [ %674, %720 ]
  %735 = phi i32 [ %718, %680 ], [ 0, %678 ], [ 0, %720 ]
  %736 = phi i64 [ %717, %680 ], [ 0, %678 ], [ %730, %720 ]
  %737 = icmp ugt i32 %735, 7
  br i1 %737, label %740, label %738

738:                                              ; preds = %733
  %739 = icmp eq i32 %735, 0
  br i1 %739, label %793, label %780

740:                                              ; preds = %733
  %741 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !14
  %742 = zext i8 %741 to i64
  %743 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 1
  %744 = load i8, i8 addrspace(4)* %743, align 1, !tbaa !14
  %745 = zext i8 %744 to i64
  %746 = shl nuw nsw i64 %745, 8
  %747 = or i64 %746, %742
  %748 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 2
  %749 = load i8, i8 addrspace(4)* %748, align 1, !tbaa !14
  %750 = zext i8 %749 to i64
  %751 = shl nuw nsw i64 %750, 16
  %752 = or i64 %747, %751
  %753 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 3
  %754 = load i8, i8 addrspace(4)* %753, align 1, !tbaa !14
  %755 = zext i8 %754 to i64
  %756 = shl nuw nsw i64 %755, 24
  %757 = or i64 %752, %756
  %758 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 4
  %759 = load i8, i8 addrspace(4)* %758, align 1, !tbaa !14
  %760 = zext i8 %759 to i64
  %761 = shl nuw nsw i64 %760, 32
  %762 = or i64 %757, %761
  %763 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 5
  %764 = load i8, i8 addrspace(4)* %763, align 1, !tbaa !14
  %765 = zext i8 %764 to i64
  %766 = shl nuw nsw i64 %765, 40
  %767 = or i64 %762, %766
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 6
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !14
  %770 = zext i8 %769 to i64
  %771 = shl nuw nsw i64 %770, 48
  %772 = or i64 %767, %771
  %773 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 7
  %774 = load i8, i8 addrspace(4)* %773, align 1, !tbaa !14
  %775 = zext i8 %774 to i64
  %776 = shl nuw i64 %775, 56
  %777 = or i64 %772, %776
  %778 = add nsw i32 %735, -8
  %779 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 8
  br label %793

780:                                              ; preds = %738, %780
  %781 = phi i32 [ %791, %780 ], [ 0, %738 ]
  %782 = phi i64 [ %790, %780 ], [ 0, %738 ]
  %783 = zext i32 %781 to i64
  %784 = getelementptr inbounds i8, i8 addrspace(4)* %734, i64 %783
  %785 = load i8, i8 addrspace(4)* %784, align 1, !tbaa !14
  %786 = zext i8 %785 to i64
  %787 = shl i32 %781, 3
  %788 = zext i32 %787 to i64
  %789 = shl nuw i64 %786, %788
  %790 = or i64 %789, %782
  %791 = add nuw nsw i32 %781, 1
  %792 = icmp eq i32 %791, %735
  br i1 %792, label %793, label %780

793:                                              ; preds = %780, %740, %738
  %794 = phi i8 addrspace(4)* [ %779, %740 ], [ %734, %738 ], [ %734, %780 ]
  %795 = phi i32 [ %778, %740 ], [ 0, %738 ], [ 0, %780 ]
  %796 = phi i64 [ %777, %740 ], [ 0, %738 ], [ %790, %780 ]
  %797 = icmp ugt i32 %795, 7
  br i1 %797, label %800, label %798

798:                                              ; preds = %793
  %799 = icmp eq i32 %795, 0
  br i1 %799, label %853, label %840

800:                                              ; preds = %793
  %801 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !14
  %802 = zext i8 %801 to i64
  %803 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 1
  %804 = load i8, i8 addrspace(4)* %803, align 1, !tbaa !14
  %805 = zext i8 %804 to i64
  %806 = shl nuw nsw i64 %805, 8
  %807 = or i64 %806, %802
  %808 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 2
  %809 = load i8, i8 addrspace(4)* %808, align 1, !tbaa !14
  %810 = zext i8 %809 to i64
  %811 = shl nuw nsw i64 %810, 16
  %812 = or i64 %807, %811
  %813 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 3
  %814 = load i8, i8 addrspace(4)* %813, align 1, !tbaa !14
  %815 = zext i8 %814 to i64
  %816 = shl nuw nsw i64 %815, 24
  %817 = or i64 %812, %816
  %818 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 4
  %819 = load i8, i8 addrspace(4)* %818, align 1, !tbaa !14
  %820 = zext i8 %819 to i64
  %821 = shl nuw nsw i64 %820, 32
  %822 = or i64 %817, %821
  %823 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 5
  %824 = load i8, i8 addrspace(4)* %823, align 1, !tbaa !14
  %825 = zext i8 %824 to i64
  %826 = shl nuw nsw i64 %825, 40
  %827 = or i64 %822, %826
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 6
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !14
  %830 = zext i8 %829 to i64
  %831 = shl nuw nsw i64 %830, 48
  %832 = or i64 %827, %831
  %833 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 7
  %834 = load i8, i8 addrspace(4)* %833, align 1, !tbaa !14
  %835 = zext i8 %834 to i64
  %836 = shl nuw i64 %835, 56
  %837 = or i64 %832, %836
  %838 = add nsw i32 %795, -8
  %839 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 8
  br label %853

840:                                              ; preds = %798, %840
  %841 = phi i32 [ %851, %840 ], [ 0, %798 ]
  %842 = phi i64 [ %850, %840 ], [ 0, %798 ]
  %843 = zext i32 %841 to i64
  %844 = getelementptr inbounds i8, i8 addrspace(4)* %794, i64 %843
  %845 = load i8, i8 addrspace(4)* %844, align 1, !tbaa !14
  %846 = zext i8 %845 to i64
  %847 = shl i32 %841, 3
  %848 = zext i32 %847 to i64
  %849 = shl nuw i64 %846, %848
  %850 = or i64 %849, %842
  %851 = add nuw nsw i32 %841, 1
  %852 = icmp eq i32 %851, %795
  br i1 %852, label %853, label %840

853:                                              ; preds = %840, %800, %798
  %854 = phi i8 addrspace(4)* [ %839, %800 ], [ %794, %798 ], [ %794, %840 ]
  %855 = phi i32 [ %838, %800 ], [ 0, %798 ], [ 0, %840 ]
  %856 = phi i64 [ %837, %800 ], [ 0, %798 ], [ %850, %840 ]
  %857 = icmp ugt i32 %855, 7
  br i1 %857, label %860, label %858

858:                                              ; preds = %853
  %859 = icmp eq i32 %855, 0
  br i1 %859, label %911, label %898

860:                                              ; preds = %853
  %861 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !14
  %862 = zext i8 %861 to i64
  %863 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 1
  %864 = load i8, i8 addrspace(4)* %863, align 1, !tbaa !14
  %865 = zext i8 %864 to i64
  %866 = shl nuw nsw i64 %865, 8
  %867 = or i64 %866, %862
  %868 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 2
  %869 = load i8, i8 addrspace(4)* %868, align 1, !tbaa !14
  %870 = zext i8 %869 to i64
  %871 = shl nuw nsw i64 %870, 16
  %872 = or i64 %867, %871
  %873 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 3
  %874 = load i8, i8 addrspace(4)* %873, align 1, !tbaa !14
  %875 = zext i8 %874 to i64
  %876 = shl nuw nsw i64 %875, 24
  %877 = or i64 %872, %876
  %878 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 4
  %879 = load i8, i8 addrspace(4)* %878, align 1, !tbaa !14
  %880 = zext i8 %879 to i64
  %881 = shl nuw nsw i64 %880, 32
  %882 = or i64 %877, %881
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 5
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !14
  %885 = zext i8 %884 to i64
  %886 = shl nuw nsw i64 %885, 40
  %887 = or i64 %882, %886
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 6
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !14
  %890 = zext i8 %889 to i64
  %891 = shl nuw nsw i64 %890, 48
  %892 = or i64 %887, %891
  %893 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 7
  %894 = load i8, i8 addrspace(4)* %893, align 1, !tbaa !14
  %895 = zext i8 %894 to i64
  %896 = shl nuw i64 %895, 56
  %897 = or i64 %892, %896
  br label %911

898:                                              ; preds = %858, %898
  %899 = phi i32 [ %909, %898 ], [ 0, %858 ]
  %900 = phi i64 [ %908, %898 ], [ 0, %858 ]
  %901 = zext i32 %899 to i64
  %902 = getelementptr inbounds i8, i8 addrspace(4)* %854, i64 %901
  %903 = load i8, i8 addrspace(4)* %902, align 1, !tbaa !14
  %904 = zext i8 %903 to i64
  %905 = shl i32 %899, 3
  %906 = zext i32 %905 to i64
  %907 = shl nuw i64 %904, %906
  %908 = or i64 %907, %900
  %909 = add nuw nsw i32 %899, 1
  %910 = icmp eq i32 %909, %855
  br i1 %910, label %911, label %898

911:                                              ; preds = %898, %860, %858
  %912 = phi i64 [ %897, %860 ], [ 0, %858 ], [ %908, %898 ]
  %913 = shl nuw nsw i64 %494, 2
  %914 = add nuw nsw i64 %913, 28
  %915 = and i64 %914, 480
  %916 = and i64 %496, -225
  %917 = or i64 %916, %915
  %918 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %917, i64 noundef %556, i64 noundef %616, i64 noundef %676, i64 noundef %736, i64 noundef %796, i64 noundef %856, i64 noundef %912) #11
  %919 = sub i64 %486, %494
  %920 = getelementptr inbounds i8, i8 addrspace(4)* %487, i64 %494
  %921 = icmp eq i64 %919, 0
  br i1 %921, label %922, label %485

922:                                              ; preds = %911, %477
  %923 = phi <2 x i64> [ %480, %477 ], [ %918, %911 ]
  %924 = extractelement <2 x i64> %923, i64 0
  %925 = ptrtoint i32* %474 to i64
  %926 = and i64 %924, -227
  %927 = or i64 %926, 34
  %928 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %927, i64 noundef %925, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %929 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !5
  %930 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %931 = extractelement <2 x i64> %930, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %932, label %936

932:                                              ; preds = %922
  %933 = and i64 %931, -225
  %934 = or i64 %933, 32
  %935 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %934, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1377

936:                                              ; preds = %922
  %937 = and i64 %931, 2
  %938 = and i64 %931, -3
  %939 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %938, i64 0
  br label %940

940:                                              ; preds = %1366, %936
  %941 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.2, i64 0, i64 11) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([12 x i8]* addrspacecast ([12 x i8] addrspace(4)* @.str.2 to [12 x i8]*) to i64)), i64 1))), %936 ], [ %1374, %1366 ]
  %942 = phi i8 addrspace(4)* [ getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %936 ], [ %1375, %1366 ]
  %943 = phi <2 x i64> [ %939, %936 ], [ %1373, %1366 ]
  %944 = icmp ugt i64 %941, 56
  %945 = extractelement <2 x i64> %943, i64 0
  %946 = or i64 %945, %937
  %947 = insertelement <2 x i64> poison, i64 %946, i64 0
  %948 = select i1 %944, <2 x i64> %943, <2 x i64> %947
  %949 = tail call i64 @llvm.umin.i64(i64 %941, i64 56)
  %950 = trunc i64 %949 to i32
  %951 = extractelement <2 x i64> %948, i64 0
  %952 = icmp ugt i32 %950, 7
  br i1 %952, label %955, label %953

953:                                              ; preds = %940
  %954 = icmp eq i32 %950, 0
  br i1 %954, label %1008, label %995

955:                                              ; preds = %940
  %956 = load i8, i8 addrspace(4)* %942, align 1, !tbaa !14
  %957 = zext i8 %956 to i64
  %958 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 1
  %959 = load i8, i8 addrspace(4)* %958, align 1, !tbaa !14
  %960 = zext i8 %959 to i64
  %961 = shl nuw nsw i64 %960, 8
  %962 = or i64 %961, %957
  %963 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 2
  %964 = load i8, i8 addrspace(4)* %963, align 1, !tbaa !14
  %965 = zext i8 %964 to i64
  %966 = shl nuw nsw i64 %965, 16
  %967 = or i64 %962, %966
  %968 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 3
  %969 = load i8, i8 addrspace(4)* %968, align 1, !tbaa !14
  %970 = zext i8 %969 to i64
  %971 = shl nuw nsw i64 %970, 24
  %972 = or i64 %967, %971
  %973 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 4
  %974 = load i8, i8 addrspace(4)* %973, align 1, !tbaa !14
  %975 = zext i8 %974 to i64
  %976 = shl nuw nsw i64 %975, 32
  %977 = or i64 %972, %976
  %978 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 5
  %979 = load i8, i8 addrspace(4)* %978, align 1, !tbaa !14
  %980 = zext i8 %979 to i64
  %981 = shl nuw nsw i64 %980, 40
  %982 = or i64 %977, %981
  %983 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 6
  %984 = load i8, i8 addrspace(4)* %983, align 1, !tbaa !14
  %985 = zext i8 %984 to i64
  %986 = shl nuw nsw i64 %985, 48
  %987 = or i64 %982, %986
  %988 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 7
  %989 = load i8, i8 addrspace(4)* %988, align 1, !tbaa !14
  %990 = zext i8 %989 to i64
  %991 = shl nuw i64 %990, 56
  %992 = or i64 %987, %991
  %993 = add nsw i32 %950, -8
  %994 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 8
  br label %1008

995:                                              ; preds = %953, %995
  %996 = phi i32 [ %1006, %995 ], [ 0, %953 ]
  %997 = phi i64 [ %1005, %995 ], [ 0, %953 ]
  %998 = zext i32 %996 to i64
  %999 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 %998
  %1000 = load i8, i8 addrspace(4)* %999, align 1, !tbaa !14
  %1001 = zext i8 %1000 to i64
  %1002 = shl i32 %996, 3
  %1003 = zext i32 %1002 to i64
  %1004 = shl nuw i64 %1001, %1003
  %1005 = or i64 %1004, %997
  %1006 = add nuw nsw i32 %996, 1
  %1007 = icmp eq i32 %1006, %950
  br i1 %1007, label %1008, label %995, !llvm.loop !15

1008:                                             ; preds = %995, %955, %953
  %1009 = phi i8 addrspace(4)* [ %994, %955 ], [ %942, %953 ], [ %942, %995 ]
  %1010 = phi i32 [ %993, %955 ], [ 0, %953 ], [ 0, %995 ]
  %1011 = phi i64 [ %992, %955 ], [ 0, %953 ], [ %1005, %995 ]
  %1012 = icmp ugt i32 %1010, 7
  br i1 %1012, label %1015, label %1013

1013:                                             ; preds = %1008
  %1014 = icmp eq i32 %1010, 0
  br i1 %1014, label %1068, label %1055

1015:                                             ; preds = %1008
  %1016 = load i8, i8 addrspace(4)* %1009, align 1, !tbaa !14
  %1017 = zext i8 %1016 to i64
  %1018 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 1
  %1019 = load i8, i8 addrspace(4)* %1018, align 1, !tbaa !14
  %1020 = zext i8 %1019 to i64
  %1021 = shl nuw nsw i64 %1020, 8
  %1022 = or i64 %1021, %1017
  %1023 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 2
  %1024 = load i8, i8 addrspace(4)* %1023, align 1, !tbaa !14
  %1025 = zext i8 %1024 to i64
  %1026 = shl nuw nsw i64 %1025, 16
  %1027 = or i64 %1022, %1026
  %1028 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 3
  %1029 = load i8, i8 addrspace(4)* %1028, align 1, !tbaa !14
  %1030 = zext i8 %1029 to i64
  %1031 = shl nuw nsw i64 %1030, 24
  %1032 = or i64 %1027, %1031
  %1033 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 4
  %1034 = load i8, i8 addrspace(4)* %1033, align 1, !tbaa !14
  %1035 = zext i8 %1034 to i64
  %1036 = shl nuw nsw i64 %1035, 32
  %1037 = or i64 %1032, %1036
  %1038 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 5
  %1039 = load i8, i8 addrspace(4)* %1038, align 1, !tbaa !14
  %1040 = zext i8 %1039 to i64
  %1041 = shl nuw nsw i64 %1040, 40
  %1042 = or i64 %1037, %1041
  %1043 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 6
  %1044 = load i8, i8 addrspace(4)* %1043, align 1, !tbaa !14
  %1045 = zext i8 %1044 to i64
  %1046 = shl nuw nsw i64 %1045, 48
  %1047 = or i64 %1042, %1046
  %1048 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 7
  %1049 = load i8, i8 addrspace(4)* %1048, align 1, !tbaa !14
  %1050 = zext i8 %1049 to i64
  %1051 = shl nuw i64 %1050, 56
  %1052 = or i64 %1047, %1051
  %1053 = add nsw i32 %1010, -8
  %1054 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 8
  br label %1068

1055:                                             ; preds = %1013, %1055
  %1056 = phi i32 [ %1066, %1055 ], [ 0, %1013 ]
  %1057 = phi i64 [ %1065, %1055 ], [ 0, %1013 ]
  %1058 = zext i32 %1056 to i64
  %1059 = getelementptr inbounds i8, i8 addrspace(4)* %1009, i64 %1058
  %1060 = load i8, i8 addrspace(4)* %1059, align 1, !tbaa !14
  %1061 = zext i8 %1060 to i64
  %1062 = shl i32 %1056, 3
  %1063 = zext i32 %1062 to i64
  %1064 = shl nuw i64 %1061, %1063
  %1065 = or i64 %1064, %1057
  %1066 = add nuw nsw i32 %1056, 1
  %1067 = icmp eq i32 %1066, %1010
  br i1 %1067, label %1068, label %1055

1068:                                             ; preds = %1055, %1015, %1013
  %1069 = phi i8 addrspace(4)* [ %1054, %1015 ], [ %1009, %1013 ], [ %1009, %1055 ]
  %1070 = phi i32 [ %1053, %1015 ], [ 0, %1013 ], [ 0, %1055 ]
  %1071 = phi i64 [ %1052, %1015 ], [ 0, %1013 ], [ %1065, %1055 ]
  %1072 = icmp ugt i32 %1070, 7
  br i1 %1072, label %1075, label %1073

1073:                                             ; preds = %1068
  %1074 = icmp eq i32 %1070, 0
  br i1 %1074, label %1128, label %1115

1075:                                             ; preds = %1068
  %1076 = load i8, i8 addrspace(4)* %1069, align 1, !tbaa !14
  %1077 = zext i8 %1076 to i64
  %1078 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 1
  %1079 = load i8, i8 addrspace(4)* %1078, align 1, !tbaa !14
  %1080 = zext i8 %1079 to i64
  %1081 = shl nuw nsw i64 %1080, 8
  %1082 = or i64 %1081, %1077
  %1083 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 2
  %1084 = load i8, i8 addrspace(4)* %1083, align 1, !tbaa !14
  %1085 = zext i8 %1084 to i64
  %1086 = shl nuw nsw i64 %1085, 16
  %1087 = or i64 %1082, %1086
  %1088 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 3
  %1089 = load i8, i8 addrspace(4)* %1088, align 1, !tbaa !14
  %1090 = zext i8 %1089 to i64
  %1091 = shl nuw nsw i64 %1090, 24
  %1092 = or i64 %1087, %1091
  %1093 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 4
  %1094 = load i8, i8 addrspace(4)* %1093, align 1, !tbaa !14
  %1095 = zext i8 %1094 to i64
  %1096 = shl nuw nsw i64 %1095, 32
  %1097 = or i64 %1092, %1096
  %1098 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 5
  %1099 = load i8, i8 addrspace(4)* %1098, align 1, !tbaa !14
  %1100 = zext i8 %1099 to i64
  %1101 = shl nuw nsw i64 %1100, 40
  %1102 = or i64 %1097, %1101
  %1103 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 6
  %1104 = load i8, i8 addrspace(4)* %1103, align 1, !tbaa !14
  %1105 = zext i8 %1104 to i64
  %1106 = shl nuw nsw i64 %1105, 48
  %1107 = or i64 %1102, %1106
  %1108 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 7
  %1109 = load i8, i8 addrspace(4)* %1108, align 1, !tbaa !14
  %1110 = zext i8 %1109 to i64
  %1111 = shl nuw i64 %1110, 56
  %1112 = or i64 %1107, %1111
  %1113 = add nsw i32 %1070, -8
  %1114 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 8
  br label %1128

1115:                                             ; preds = %1073, %1115
  %1116 = phi i32 [ %1126, %1115 ], [ 0, %1073 ]
  %1117 = phi i64 [ %1125, %1115 ], [ 0, %1073 ]
  %1118 = zext i32 %1116 to i64
  %1119 = getelementptr inbounds i8, i8 addrspace(4)* %1069, i64 %1118
  %1120 = load i8, i8 addrspace(4)* %1119, align 1, !tbaa !14
  %1121 = zext i8 %1120 to i64
  %1122 = shl i32 %1116, 3
  %1123 = zext i32 %1122 to i64
  %1124 = shl nuw i64 %1121, %1123
  %1125 = or i64 %1124, %1117
  %1126 = add nuw nsw i32 %1116, 1
  %1127 = icmp eq i32 %1126, %1070
  br i1 %1127, label %1128, label %1115

1128:                                             ; preds = %1115, %1075, %1073
  %1129 = phi i8 addrspace(4)* [ %1114, %1075 ], [ %1069, %1073 ], [ %1069, %1115 ]
  %1130 = phi i32 [ %1113, %1075 ], [ 0, %1073 ], [ 0, %1115 ]
  %1131 = phi i64 [ %1112, %1075 ], [ 0, %1073 ], [ %1125, %1115 ]
  %1132 = icmp ugt i32 %1130, 7
  br i1 %1132, label %1135, label %1133

1133:                                             ; preds = %1128
  %1134 = icmp eq i32 %1130, 0
  br i1 %1134, label %1188, label %1175

1135:                                             ; preds = %1128
  %1136 = load i8, i8 addrspace(4)* %1129, align 1, !tbaa !14
  %1137 = zext i8 %1136 to i64
  %1138 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 1
  %1139 = load i8, i8 addrspace(4)* %1138, align 1, !tbaa !14
  %1140 = zext i8 %1139 to i64
  %1141 = shl nuw nsw i64 %1140, 8
  %1142 = or i64 %1141, %1137
  %1143 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 2
  %1144 = load i8, i8 addrspace(4)* %1143, align 1, !tbaa !14
  %1145 = zext i8 %1144 to i64
  %1146 = shl nuw nsw i64 %1145, 16
  %1147 = or i64 %1142, %1146
  %1148 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 3
  %1149 = load i8, i8 addrspace(4)* %1148, align 1, !tbaa !14
  %1150 = zext i8 %1149 to i64
  %1151 = shl nuw nsw i64 %1150, 24
  %1152 = or i64 %1147, %1151
  %1153 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 4
  %1154 = load i8, i8 addrspace(4)* %1153, align 1, !tbaa !14
  %1155 = zext i8 %1154 to i64
  %1156 = shl nuw nsw i64 %1155, 32
  %1157 = or i64 %1152, %1156
  %1158 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 5
  %1159 = load i8, i8 addrspace(4)* %1158, align 1, !tbaa !14
  %1160 = zext i8 %1159 to i64
  %1161 = shl nuw nsw i64 %1160, 40
  %1162 = or i64 %1157, %1161
  %1163 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 6
  %1164 = load i8, i8 addrspace(4)* %1163, align 1, !tbaa !14
  %1165 = zext i8 %1164 to i64
  %1166 = shl nuw nsw i64 %1165, 48
  %1167 = or i64 %1162, %1166
  %1168 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 7
  %1169 = load i8, i8 addrspace(4)* %1168, align 1, !tbaa !14
  %1170 = zext i8 %1169 to i64
  %1171 = shl nuw i64 %1170, 56
  %1172 = or i64 %1167, %1171
  %1173 = add nsw i32 %1130, -8
  %1174 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 8
  br label %1188

1175:                                             ; preds = %1133, %1175
  %1176 = phi i32 [ %1186, %1175 ], [ 0, %1133 ]
  %1177 = phi i64 [ %1185, %1175 ], [ 0, %1133 ]
  %1178 = zext i32 %1176 to i64
  %1179 = getelementptr inbounds i8, i8 addrspace(4)* %1129, i64 %1178
  %1180 = load i8, i8 addrspace(4)* %1179, align 1, !tbaa !14
  %1181 = zext i8 %1180 to i64
  %1182 = shl i32 %1176, 3
  %1183 = zext i32 %1182 to i64
  %1184 = shl nuw i64 %1181, %1183
  %1185 = or i64 %1184, %1177
  %1186 = add nuw nsw i32 %1176, 1
  %1187 = icmp eq i32 %1186, %1130
  br i1 %1187, label %1188, label %1175

1188:                                             ; preds = %1175, %1135, %1133
  %1189 = phi i8 addrspace(4)* [ %1174, %1135 ], [ %1129, %1133 ], [ %1129, %1175 ]
  %1190 = phi i32 [ %1173, %1135 ], [ 0, %1133 ], [ 0, %1175 ]
  %1191 = phi i64 [ %1172, %1135 ], [ 0, %1133 ], [ %1185, %1175 ]
  %1192 = icmp ugt i32 %1190, 7
  br i1 %1192, label %1195, label %1193

1193:                                             ; preds = %1188
  %1194 = icmp eq i32 %1190, 0
  br i1 %1194, label %1248, label %1235

1195:                                             ; preds = %1188
  %1196 = load i8, i8 addrspace(4)* %1189, align 1, !tbaa !14
  %1197 = zext i8 %1196 to i64
  %1198 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 1
  %1199 = load i8, i8 addrspace(4)* %1198, align 1, !tbaa !14
  %1200 = zext i8 %1199 to i64
  %1201 = shl nuw nsw i64 %1200, 8
  %1202 = or i64 %1201, %1197
  %1203 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 2
  %1204 = load i8, i8 addrspace(4)* %1203, align 1, !tbaa !14
  %1205 = zext i8 %1204 to i64
  %1206 = shl nuw nsw i64 %1205, 16
  %1207 = or i64 %1202, %1206
  %1208 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 3
  %1209 = load i8, i8 addrspace(4)* %1208, align 1, !tbaa !14
  %1210 = zext i8 %1209 to i64
  %1211 = shl nuw nsw i64 %1210, 24
  %1212 = or i64 %1207, %1211
  %1213 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 4
  %1214 = load i8, i8 addrspace(4)* %1213, align 1, !tbaa !14
  %1215 = zext i8 %1214 to i64
  %1216 = shl nuw nsw i64 %1215, 32
  %1217 = or i64 %1212, %1216
  %1218 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 5
  %1219 = load i8, i8 addrspace(4)* %1218, align 1, !tbaa !14
  %1220 = zext i8 %1219 to i64
  %1221 = shl nuw nsw i64 %1220, 40
  %1222 = or i64 %1217, %1221
  %1223 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 6
  %1224 = load i8, i8 addrspace(4)* %1223, align 1, !tbaa !14
  %1225 = zext i8 %1224 to i64
  %1226 = shl nuw nsw i64 %1225, 48
  %1227 = or i64 %1222, %1226
  %1228 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 7
  %1229 = load i8, i8 addrspace(4)* %1228, align 1, !tbaa !14
  %1230 = zext i8 %1229 to i64
  %1231 = shl nuw i64 %1230, 56
  %1232 = or i64 %1227, %1231
  %1233 = add nsw i32 %1190, -8
  %1234 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 8
  br label %1248

1235:                                             ; preds = %1193, %1235
  %1236 = phi i32 [ %1246, %1235 ], [ 0, %1193 ]
  %1237 = phi i64 [ %1245, %1235 ], [ 0, %1193 ]
  %1238 = zext i32 %1236 to i64
  %1239 = getelementptr inbounds i8, i8 addrspace(4)* %1189, i64 %1238
  %1240 = load i8, i8 addrspace(4)* %1239, align 1, !tbaa !14
  %1241 = zext i8 %1240 to i64
  %1242 = shl i32 %1236, 3
  %1243 = zext i32 %1242 to i64
  %1244 = shl nuw i64 %1241, %1243
  %1245 = or i64 %1244, %1237
  %1246 = add nuw nsw i32 %1236, 1
  %1247 = icmp eq i32 %1246, %1190
  br i1 %1247, label %1248, label %1235

1248:                                             ; preds = %1235, %1195, %1193
  %1249 = phi i8 addrspace(4)* [ %1234, %1195 ], [ %1189, %1193 ], [ %1189, %1235 ]
  %1250 = phi i32 [ %1233, %1195 ], [ 0, %1193 ], [ 0, %1235 ]
  %1251 = phi i64 [ %1232, %1195 ], [ 0, %1193 ], [ %1245, %1235 ]
  %1252 = icmp ugt i32 %1250, 7
  br i1 %1252, label %1255, label %1253

1253:                                             ; preds = %1248
  %1254 = icmp eq i32 %1250, 0
  br i1 %1254, label %1308, label %1295

1255:                                             ; preds = %1248
  %1256 = load i8, i8 addrspace(4)* %1249, align 1, !tbaa !14
  %1257 = zext i8 %1256 to i64
  %1258 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 1
  %1259 = load i8, i8 addrspace(4)* %1258, align 1, !tbaa !14
  %1260 = zext i8 %1259 to i64
  %1261 = shl nuw nsw i64 %1260, 8
  %1262 = or i64 %1261, %1257
  %1263 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 2
  %1264 = load i8, i8 addrspace(4)* %1263, align 1, !tbaa !14
  %1265 = zext i8 %1264 to i64
  %1266 = shl nuw nsw i64 %1265, 16
  %1267 = or i64 %1262, %1266
  %1268 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 3
  %1269 = load i8, i8 addrspace(4)* %1268, align 1, !tbaa !14
  %1270 = zext i8 %1269 to i64
  %1271 = shl nuw nsw i64 %1270, 24
  %1272 = or i64 %1267, %1271
  %1273 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 4
  %1274 = load i8, i8 addrspace(4)* %1273, align 1, !tbaa !14
  %1275 = zext i8 %1274 to i64
  %1276 = shl nuw nsw i64 %1275, 32
  %1277 = or i64 %1272, %1276
  %1278 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 5
  %1279 = load i8, i8 addrspace(4)* %1278, align 1, !tbaa !14
  %1280 = zext i8 %1279 to i64
  %1281 = shl nuw nsw i64 %1280, 40
  %1282 = or i64 %1277, %1281
  %1283 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 6
  %1284 = load i8, i8 addrspace(4)* %1283, align 1, !tbaa !14
  %1285 = zext i8 %1284 to i64
  %1286 = shl nuw nsw i64 %1285, 48
  %1287 = or i64 %1282, %1286
  %1288 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 7
  %1289 = load i8, i8 addrspace(4)* %1288, align 1, !tbaa !14
  %1290 = zext i8 %1289 to i64
  %1291 = shl nuw i64 %1290, 56
  %1292 = or i64 %1287, %1291
  %1293 = add nsw i32 %1250, -8
  %1294 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 8
  br label %1308

1295:                                             ; preds = %1253, %1295
  %1296 = phi i32 [ %1306, %1295 ], [ 0, %1253 ]
  %1297 = phi i64 [ %1305, %1295 ], [ 0, %1253 ]
  %1298 = zext i32 %1296 to i64
  %1299 = getelementptr inbounds i8, i8 addrspace(4)* %1249, i64 %1298
  %1300 = load i8, i8 addrspace(4)* %1299, align 1, !tbaa !14
  %1301 = zext i8 %1300 to i64
  %1302 = shl i32 %1296, 3
  %1303 = zext i32 %1302 to i64
  %1304 = shl nuw i64 %1301, %1303
  %1305 = or i64 %1304, %1297
  %1306 = add nuw nsw i32 %1296, 1
  %1307 = icmp eq i32 %1306, %1250
  br i1 %1307, label %1308, label %1295

1308:                                             ; preds = %1295, %1255, %1253
  %1309 = phi i8 addrspace(4)* [ %1294, %1255 ], [ %1249, %1253 ], [ %1249, %1295 ]
  %1310 = phi i32 [ %1293, %1255 ], [ 0, %1253 ], [ 0, %1295 ]
  %1311 = phi i64 [ %1292, %1255 ], [ 0, %1253 ], [ %1305, %1295 ]
  %1312 = icmp ugt i32 %1310, 7
  br i1 %1312, label %1315, label %1313

1313:                                             ; preds = %1308
  %1314 = icmp eq i32 %1310, 0
  br i1 %1314, label %1366, label %1353

1315:                                             ; preds = %1308
  %1316 = load i8, i8 addrspace(4)* %1309, align 1, !tbaa !14
  %1317 = zext i8 %1316 to i64
  %1318 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 1
  %1319 = load i8, i8 addrspace(4)* %1318, align 1, !tbaa !14
  %1320 = zext i8 %1319 to i64
  %1321 = shl nuw nsw i64 %1320, 8
  %1322 = or i64 %1321, %1317
  %1323 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 2
  %1324 = load i8, i8 addrspace(4)* %1323, align 1, !tbaa !14
  %1325 = zext i8 %1324 to i64
  %1326 = shl nuw nsw i64 %1325, 16
  %1327 = or i64 %1322, %1326
  %1328 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 3
  %1329 = load i8, i8 addrspace(4)* %1328, align 1, !tbaa !14
  %1330 = zext i8 %1329 to i64
  %1331 = shl nuw nsw i64 %1330, 24
  %1332 = or i64 %1327, %1331
  %1333 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 4
  %1334 = load i8, i8 addrspace(4)* %1333, align 1, !tbaa !14
  %1335 = zext i8 %1334 to i64
  %1336 = shl nuw nsw i64 %1335, 32
  %1337 = or i64 %1332, %1336
  %1338 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 5
  %1339 = load i8, i8 addrspace(4)* %1338, align 1, !tbaa !14
  %1340 = zext i8 %1339 to i64
  %1341 = shl nuw nsw i64 %1340, 40
  %1342 = or i64 %1337, %1341
  %1343 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 6
  %1344 = load i8, i8 addrspace(4)* %1343, align 1, !tbaa !14
  %1345 = zext i8 %1344 to i64
  %1346 = shl nuw nsw i64 %1345, 48
  %1347 = or i64 %1342, %1346
  %1348 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 7
  %1349 = load i8, i8 addrspace(4)* %1348, align 1, !tbaa !14
  %1350 = zext i8 %1349 to i64
  %1351 = shl nuw i64 %1350, 56
  %1352 = or i64 %1347, %1351
  br label %1366

1353:                                             ; preds = %1313, %1353
  %1354 = phi i32 [ %1364, %1353 ], [ 0, %1313 ]
  %1355 = phi i64 [ %1363, %1353 ], [ 0, %1313 ]
  %1356 = zext i32 %1354 to i64
  %1357 = getelementptr inbounds i8, i8 addrspace(4)* %1309, i64 %1356
  %1358 = load i8, i8 addrspace(4)* %1357, align 1, !tbaa !14
  %1359 = zext i8 %1358 to i64
  %1360 = shl i32 %1354, 3
  %1361 = zext i32 %1360 to i64
  %1362 = shl nuw i64 %1359, %1361
  %1363 = or i64 %1362, %1355
  %1364 = add nuw nsw i32 %1354, 1
  %1365 = icmp eq i32 %1364, %1310
  br i1 %1365, label %1366, label %1353

1366:                                             ; preds = %1353, %1315, %1313
  %1367 = phi i64 [ %1352, %1315 ], [ 0, %1313 ], [ %1363, %1353 ]
  %1368 = shl nuw nsw i64 %949, 2
  %1369 = add nuw nsw i64 %1368, 28
  %1370 = and i64 %1369, 480
  %1371 = and i64 %951, -225
  %1372 = or i64 %1371, %1370
  %1373 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1372, i64 noundef %1011, i64 noundef %1071, i64 noundef %1131, i64 noundef %1191, i64 noundef %1251, i64 noundef %1311, i64 noundef %1367) #11
  %1374 = sub i64 %941, %949
  %1375 = getelementptr inbounds i8, i8 addrspace(4)* %942, i64 %949
  %1376 = icmp eq i64 %1374, 0
  br i1 %1376, label %1377, label %940

1377:                                             ; preds = %1366, %932
  %1378 = phi <2 x i64> [ %935, %932 ], [ %1373, %1366 ]
  %1379 = extractelement <2 x i64> %1378, i64 0
  %1380 = and i64 %1379, -225
  %1381 = or i64 %1380, 32
  %1382 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1381, i64 noundef %4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1383 = extractelement <2 x i64> %1382, i64 0
  %1384 = zext i32 %929 to i64
  %1385 = and i64 %1383, -227
  %1386 = or i64 %1385, 34
  %1387 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1386, i64 noundef %1384, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1388 = load i32, i32 addrspace(1)* %473, align 4, !tbaa !5
  %1389 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1390 = extractelement <2 x i64> %1389, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1391, label %1395

1391:                                             ; preds = %1377
  %1392 = and i64 %1390, -225
  %1393 = or i64 %1392, 32
  %1394 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1393, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %1836

1395:                                             ; preds = %1377
  %1396 = and i64 %1390, 2
  %1397 = and i64 %1390, -3
  %1398 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1397, i64 0
  br label %1399

1399:                                             ; preds = %1825, %1395
  %1400 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.3, i64 0, i64 12) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([13 x i8]* addrspacecast ([13 x i8] addrspace(4)* @.str.3 to [13 x i8]*) to i64)), i64 1))), %1395 ], [ %1833, %1825 ]
  %1401 = phi i8 addrspace(4)* [ getelementptr inbounds ([13 x i8], [13 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1395 ], [ %1834, %1825 ]
  %1402 = phi <2 x i64> [ %1398, %1395 ], [ %1832, %1825 ]
  %1403 = icmp ugt i64 %1400, 56
  %1404 = extractelement <2 x i64> %1402, i64 0
  %1405 = or i64 %1404, %1396
  %1406 = insertelement <2 x i64> poison, i64 %1405, i64 0
  %1407 = select i1 %1403, <2 x i64> %1402, <2 x i64> %1406
  %1408 = tail call i64 @llvm.umin.i64(i64 %1400, i64 56)
  %1409 = trunc i64 %1408 to i32
  %1410 = extractelement <2 x i64> %1407, i64 0
  %1411 = icmp ugt i32 %1409, 7
  br i1 %1411, label %1414, label %1412

1412:                                             ; preds = %1399
  %1413 = icmp eq i32 %1409, 0
  br i1 %1413, label %1467, label %1454

1414:                                             ; preds = %1399
  %1415 = load i8, i8 addrspace(4)* %1401, align 1, !tbaa !14
  %1416 = zext i8 %1415 to i64
  %1417 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 1
  %1418 = load i8, i8 addrspace(4)* %1417, align 1, !tbaa !14
  %1419 = zext i8 %1418 to i64
  %1420 = shl nuw nsw i64 %1419, 8
  %1421 = or i64 %1420, %1416
  %1422 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 2
  %1423 = load i8, i8 addrspace(4)* %1422, align 1, !tbaa !14
  %1424 = zext i8 %1423 to i64
  %1425 = shl nuw nsw i64 %1424, 16
  %1426 = or i64 %1421, %1425
  %1427 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 3
  %1428 = load i8, i8 addrspace(4)* %1427, align 1, !tbaa !14
  %1429 = zext i8 %1428 to i64
  %1430 = shl nuw nsw i64 %1429, 24
  %1431 = or i64 %1426, %1430
  %1432 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 4
  %1433 = load i8, i8 addrspace(4)* %1432, align 1, !tbaa !14
  %1434 = zext i8 %1433 to i64
  %1435 = shl nuw nsw i64 %1434, 32
  %1436 = or i64 %1431, %1435
  %1437 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 5
  %1438 = load i8, i8 addrspace(4)* %1437, align 1, !tbaa !14
  %1439 = zext i8 %1438 to i64
  %1440 = shl nuw nsw i64 %1439, 40
  %1441 = or i64 %1436, %1440
  %1442 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 6
  %1443 = load i8, i8 addrspace(4)* %1442, align 1, !tbaa !14
  %1444 = zext i8 %1443 to i64
  %1445 = shl nuw nsw i64 %1444, 48
  %1446 = or i64 %1441, %1445
  %1447 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 7
  %1448 = load i8, i8 addrspace(4)* %1447, align 1, !tbaa !14
  %1449 = zext i8 %1448 to i64
  %1450 = shl nuw i64 %1449, 56
  %1451 = or i64 %1446, %1450
  %1452 = add nsw i32 %1409, -8
  %1453 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 8
  br label %1467

1454:                                             ; preds = %1412, %1454
  %1455 = phi i32 [ %1465, %1454 ], [ 0, %1412 ]
  %1456 = phi i64 [ %1464, %1454 ], [ 0, %1412 ]
  %1457 = zext i32 %1455 to i64
  %1458 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 %1457
  %1459 = load i8, i8 addrspace(4)* %1458, align 1, !tbaa !14
  %1460 = zext i8 %1459 to i64
  %1461 = shl i32 %1455, 3
  %1462 = zext i32 %1461 to i64
  %1463 = shl nuw i64 %1460, %1462
  %1464 = or i64 %1463, %1456
  %1465 = add nuw nsw i32 %1455, 1
  %1466 = icmp eq i32 %1465, %1409
  br i1 %1466, label %1467, label %1454, !llvm.loop !15

1467:                                             ; preds = %1454, %1414, %1412
  %1468 = phi i8 addrspace(4)* [ %1453, %1414 ], [ %1401, %1412 ], [ %1401, %1454 ]
  %1469 = phi i32 [ %1452, %1414 ], [ 0, %1412 ], [ 0, %1454 ]
  %1470 = phi i64 [ %1451, %1414 ], [ 0, %1412 ], [ %1464, %1454 ]
  %1471 = icmp ugt i32 %1469, 7
  br i1 %1471, label %1474, label %1472

1472:                                             ; preds = %1467
  %1473 = icmp eq i32 %1469, 0
  br i1 %1473, label %1527, label %1514

1474:                                             ; preds = %1467
  %1475 = load i8, i8 addrspace(4)* %1468, align 1, !tbaa !14
  %1476 = zext i8 %1475 to i64
  %1477 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 1
  %1478 = load i8, i8 addrspace(4)* %1477, align 1, !tbaa !14
  %1479 = zext i8 %1478 to i64
  %1480 = shl nuw nsw i64 %1479, 8
  %1481 = or i64 %1480, %1476
  %1482 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 2
  %1483 = load i8, i8 addrspace(4)* %1482, align 1, !tbaa !14
  %1484 = zext i8 %1483 to i64
  %1485 = shl nuw nsw i64 %1484, 16
  %1486 = or i64 %1481, %1485
  %1487 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 3
  %1488 = load i8, i8 addrspace(4)* %1487, align 1, !tbaa !14
  %1489 = zext i8 %1488 to i64
  %1490 = shl nuw nsw i64 %1489, 24
  %1491 = or i64 %1486, %1490
  %1492 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 4
  %1493 = load i8, i8 addrspace(4)* %1492, align 1, !tbaa !14
  %1494 = zext i8 %1493 to i64
  %1495 = shl nuw nsw i64 %1494, 32
  %1496 = or i64 %1491, %1495
  %1497 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 5
  %1498 = load i8, i8 addrspace(4)* %1497, align 1, !tbaa !14
  %1499 = zext i8 %1498 to i64
  %1500 = shl nuw nsw i64 %1499, 40
  %1501 = or i64 %1496, %1500
  %1502 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 6
  %1503 = load i8, i8 addrspace(4)* %1502, align 1, !tbaa !14
  %1504 = zext i8 %1503 to i64
  %1505 = shl nuw nsw i64 %1504, 48
  %1506 = or i64 %1501, %1505
  %1507 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 7
  %1508 = load i8, i8 addrspace(4)* %1507, align 1, !tbaa !14
  %1509 = zext i8 %1508 to i64
  %1510 = shl nuw i64 %1509, 56
  %1511 = or i64 %1506, %1510
  %1512 = add nsw i32 %1469, -8
  %1513 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 8
  br label %1527

1514:                                             ; preds = %1472, %1514
  %1515 = phi i32 [ %1525, %1514 ], [ 0, %1472 ]
  %1516 = phi i64 [ %1524, %1514 ], [ 0, %1472 ]
  %1517 = zext i32 %1515 to i64
  %1518 = getelementptr inbounds i8, i8 addrspace(4)* %1468, i64 %1517
  %1519 = load i8, i8 addrspace(4)* %1518, align 1, !tbaa !14
  %1520 = zext i8 %1519 to i64
  %1521 = shl i32 %1515, 3
  %1522 = zext i32 %1521 to i64
  %1523 = shl nuw i64 %1520, %1522
  %1524 = or i64 %1523, %1516
  %1525 = add nuw nsw i32 %1515, 1
  %1526 = icmp eq i32 %1525, %1469
  br i1 %1526, label %1527, label %1514

1527:                                             ; preds = %1514, %1474, %1472
  %1528 = phi i8 addrspace(4)* [ %1513, %1474 ], [ %1468, %1472 ], [ %1468, %1514 ]
  %1529 = phi i32 [ %1512, %1474 ], [ 0, %1472 ], [ 0, %1514 ]
  %1530 = phi i64 [ %1511, %1474 ], [ 0, %1472 ], [ %1524, %1514 ]
  %1531 = icmp ugt i32 %1529, 7
  br i1 %1531, label %1534, label %1532

1532:                                             ; preds = %1527
  %1533 = icmp eq i32 %1529, 0
  br i1 %1533, label %1587, label %1574

1534:                                             ; preds = %1527
  %1535 = load i8, i8 addrspace(4)* %1528, align 1, !tbaa !14
  %1536 = zext i8 %1535 to i64
  %1537 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 1
  %1538 = load i8, i8 addrspace(4)* %1537, align 1, !tbaa !14
  %1539 = zext i8 %1538 to i64
  %1540 = shl nuw nsw i64 %1539, 8
  %1541 = or i64 %1540, %1536
  %1542 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 2
  %1543 = load i8, i8 addrspace(4)* %1542, align 1, !tbaa !14
  %1544 = zext i8 %1543 to i64
  %1545 = shl nuw nsw i64 %1544, 16
  %1546 = or i64 %1541, %1545
  %1547 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 3
  %1548 = load i8, i8 addrspace(4)* %1547, align 1, !tbaa !14
  %1549 = zext i8 %1548 to i64
  %1550 = shl nuw nsw i64 %1549, 24
  %1551 = or i64 %1546, %1550
  %1552 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 4
  %1553 = load i8, i8 addrspace(4)* %1552, align 1, !tbaa !14
  %1554 = zext i8 %1553 to i64
  %1555 = shl nuw nsw i64 %1554, 32
  %1556 = or i64 %1551, %1555
  %1557 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 5
  %1558 = load i8, i8 addrspace(4)* %1557, align 1, !tbaa !14
  %1559 = zext i8 %1558 to i64
  %1560 = shl nuw nsw i64 %1559, 40
  %1561 = or i64 %1556, %1560
  %1562 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 6
  %1563 = load i8, i8 addrspace(4)* %1562, align 1, !tbaa !14
  %1564 = zext i8 %1563 to i64
  %1565 = shl nuw nsw i64 %1564, 48
  %1566 = or i64 %1561, %1565
  %1567 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 7
  %1568 = load i8, i8 addrspace(4)* %1567, align 1, !tbaa !14
  %1569 = zext i8 %1568 to i64
  %1570 = shl nuw i64 %1569, 56
  %1571 = or i64 %1566, %1570
  %1572 = add nsw i32 %1529, -8
  %1573 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 8
  br label %1587

1574:                                             ; preds = %1532, %1574
  %1575 = phi i32 [ %1585, %1574 ], [ 0, %1532 ]
  %1576 = phi i64 [ %1584, %1574 ], [ 0, %1532 ]
  %1577 = zext i32 %1575 to i64
  %1578 = getelementptr inbounds i8, i8 addrspace(4)* %1528, i64 %1577
  %1579 = load i8, i8 addrspace(4)* %1578, align 1, !tbaa !14
  %1580 = zext i8 %1579 to i64
  %1581 = shl i32 %1575, 3
  %1582 = zext i32 %1581 to i64
  %1583 = shl nuw i64 %1580, %1582
  %1584 = or i64 %1583, %1576
  %1585 = add nuw nsw i32 %1575, 1
  %1586 = icmp eq i32 %1585, %1529
  br i1 %1586, label %1587, label %1574

1587:                                             ; preds = %1574, %1534, %1532
  %1588 = phi i8 addrspace(4)* [ %1573, %1534 ], [ %1528, %1532 ], [ %1528, %1574 ]
  %1589 = phi i32 [ %1572, %1534 ], [ 0, %1532 ], [ 0, %1574 ]
  %1590 = phi i64 [ %1571, %1534 ], [ 0, %1532 ], [ %1584, %1574 ]
  %1591 = icmp ugt i32 %1589, 7
  br i1 %1591, label %1594, label %1592

1592:                                             ; preds = %1587
  %1593 = icmp eq i32 %1589, 0
  br i1 %1593, label %1647, label %1634

1594:                                             ; preds = %1587
  %1595 = load i8, i8 addrspace(4)* %1588, align 1, !tbaa !14
  %1596 = zext i8 %1595 to i64
  %1597 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 1
  %1598 = load i8, i8 addrspace(4)* %1597, align 1, !tbaa !14
  %1599 = zext i8 %1598 to i64
  %1600 = shl nuw nsw i64 %1599, 8
  %1601 = or i64 %1600, %1596
  %1602 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 2
  %1603 = load i8, i8 addrspace(4)* %1602, align 1, !tbaa !14
  %1604 = zext i8 %1603 to i64
  %1605 = shl nuw nsw i64 %1604, 16
  %1606 = or i64 %1601, %1605
  %1607 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 3
  %1608 = load i8, i8 addrspace(4)* %1607, align 1, !tbaa !14
  %1609 = zext i8 %1608 to i64
  %1610 = shl nuw nsw i64 %1609, 24
  %1611 = or i64 %1606, %1610
  %1612 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 4
  %1613 = load i8, i8 addrspace(4)* %1612, align 1, !tbaa !14
  %1614 = zext i8 %1613 to i64
  %1615 = shl nuw nsw i64 %1614, 32
  %1616 = or i64 %1611, %1615
  %1617 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 5
  %1618 = load i8, i8 addrspace(4)* %1617, align 1, !tbaa !14
  %1619 = zext i8 %1618 to i64
  %1620 = shl nuw nsw i64 %1619, 40
  %1621 = or i64 %1616, %1620
  %1622 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 6
  %1623 = load i8, i8 addrspace(4)* %1622, align 1, !tbaa !14
  %1624 = zext i8 %1623 to i64
  %1625 = shl nuw nsw i64 %1624, 48
  %1626 = or i64 %1621, %1625
  %1627 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 7
  %1628 = load i8, i8 addrspace(4)* %1627, align 1, !tbaa !14
  %1629 = zext i8 %1628 to i64
  %1630 = shl nuw i64 %1629, 56
  %1631 = or i64 %1626, %1630
  %1632 = add nsw i32 %1589, -8
  %1633 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 8
  br label %1647

1634:                                             ; preds = %1592, %1634
  %1635 = phi i32 [ %1645, %1634 ], [ 0, %1592 ]
  %1636 = phi i64 [ %1644, %1634 ], [ 0, %1592 ]
  %1637 = zext i32 %1635 to i64
  %1638 = getelementptr inbounds i8, i8 addrspace(4)* %1588, i64 %1637
  %1639 = load i8, i8 addrspace(4)* %1638, align 1, !tbaa !14
  %1640 = zext i8 %1639 to i64
  %1641 = shl i32 %1635, 3
  %1642 = zext i32 %1641 to i64
  %1643 = shl nuw i64 %1640, %1642
  %1644 = or i64 %1643, %1636
  %1645 = add nuw nsw i32 %1635, 1
  %1646 = icmp eq i32 %1645, %1589
  br i1 %1646, label %1647, label %1634

1647:                                             ; preds = %1634, %1594, %1592
  %1648 = phi i8 addrspace(4)* [ %1633, %1594 ], [ %1588, %1592 ], [ %1588, %1634 ]
  %1649 = phi i32 [ %1632, %1594 ], [ 0, %1592 ], [ 0, %1634 ]
  %1650 = phi i64 [ %1631, %1594 ], [ 0, %1592 ], [ %1644, %1634 ]
  %1651 = icmp ugt i32 %1649, 7
  br i1 %1651, label %1654, label %1652

1652:                                             ; preds = %1647
  %1653 = icmp eq i32 %1649, 0
  br i1 %1653, label %1707, label %1694

1654:                                             ; preds = %1647
  %1655 = load i8, i8 addrspace(4)* %1648, align 1, !tbaa !14
  %1656 = zext i8 %1655 to i64
  %1657 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 1
  %1658 = load i8, i8 addrspace(4)* %1657, align 1, !tbaa !14
  %1659 = zext i8 %1658 to i64
  %1660 = shl nuw nsw i64 %1659, 8
  %1661 = or i64 %1660, %1656
  %1662 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 2
  %1663 = load i8, i8 addrspace(4)* %1662, align 1, !tbaa !14
  %1664 = zext i8 %1663 to i64
  %1665 = shl nuw nsw i64 %1664, 16
  %1666 = or i64 %1661, %1665
  %1667 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 3
  %1668 = load i8, i8 addrspace(4)* %1667, align 1, !tbaa !14
  %1669 = zext i8 %1668 to i64
  %1670 = shl nuw nsw i64 %1669, 24
  %1671 = or i64 %1666, %1670
  %1672 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 4
  %1673 = load i8, i8 addrspace(4)* %1672, align 1, !tbaa !14
  %1674 = zext i8 %1673 to i64
  %1675 = shl nuw nsw i64 %1674, 32
  %1676 = or i64 %1671, %1675
  %1677 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 5
  %1678 = load i8, i8 addrspace(4)* %1677, align 1, !tbaa !14
  %1679 = zext i8 %1678 to i64
  %1680 = shl nuw nsw i64 %1679, 40
  %1681 = or i64 %1676, %1680
  %1682 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 6
  %1683 = load i8, i8 addrspace(4)* %1682, align 1, !tbaa !14
  %1684 = zext i8 %1683 to i64
  %1685 = shl nuw nsw i64 %1684, 48
  %1686 = or i64 %1681, %1685
  %1687 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 7
  %1688 = load i8, i8 addrspace(4)* %1687, align 1, !tbaa !14
  %1689 = zext i8 %1688 to i64
  %1690 = shl nuw i64 %1689, 56
  %1691 = or i64 %1686, %1690
  %1692 = add nsw i32 %1649, -8
  %1693 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 8
  br label %1707

1694:                                             ; preds = %1652, %1694
  %1695 = phi i32 [ %1705, %1694 ], [ 0, %1652 ]
  %1696 = phi i64 [ %1704, %1694 ], [ 0, %1652 ]
  %1697 = zext i32 %1695 to i64
  %1698 = getelementptr inbounds i8, i8 addrspace(4)* %1648, i64 %1697
  %1699 = load i8, i8 addrspace(4)* %1698, align 1, !tbaa !14
  %1700 = zext i8 %1699 to i64
  %1701 = shl i32 %1695, 3
  %1702 = zext i32 %1701 to i64
  %1703 = shl nuw i64 %1700, %1702
  %1704 = or i64 %1703, %1696
  %1705 = add nuw nsw i32 %1695, 1
  %1706 = icmp eq i32 %1705, %1649
  br i1 %1706, label %1707, label %1694

1707:                                             ; preds = %1694, %1654, %1652
  %1708 = phi i8 addrspace(4)* [ %1693, %1654 ], [ %1648, %1652 ], [ %1648, %1694 ]
  %1709 = phi i32 [ %1692, %1654 ], [ 0, %1652 ], [ 0, %1694 ]
  %1710 = phi i64 [ %1691, %1654 ], [ 0, %1652 ], [ %1704, %1694 ]
  %1711 = icmp ugt i32 %1709, 7
  br i1 %1711, label %1714, label %1712

1712:                                             ; preds = %1707
  %1713 = icmp eq i32 %1709, 0
  br i1 %1713, label %1767, label %1754

1714:                                             ; preds = %1707
  %1715 = load i8, i8 addrspace(4)* %1708, align 1, !tbaa !14
  %1716 = zext i8 %1715 to i64
  %1717 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 1
  %1718 = load i8, i8 addrspace(4)* %1717, align 1, !tbaa !14
  %1719 = zext i8 %1718 to i64
  %1720 = shl nuw nsw i64 %1719, 8
  %1721 = or i64 %1720, %1716
  %1722 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 2
  %1723 = load i8, i8 addrspace(4)* %1722, align 1, !tbaa !14
  %1724 = zext i8 %1723 to i64
  %1725 = shl nuw nsw i64 %1724, 16
  %1726 = or i64 %1721, %1725
  %1727 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 3
  %1728 = load i8, i8 addrspace(4)* %1727, align 1, !tbaa !14
  %1729 = zext i8 %1728 to i64
  %1730 = shl nuw nsw i64 %1729, 24
  %1731 = or i64 %1726, %1730
  %1732 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 4
  %1733 = load i8, i8 addrspace(4)* %1732, align 1, !tbaa !14
  %1734 = zext i8 %1733 to i64
  %1735 = shl nuw nsw i64 %1734, 32
  %1736 = or i64 %1731, %1735
  %1737 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 5
  %1738 = load i8, i8 addrspace(4)* %1737, align 1, !tbaa !14
  %1739 = zext i8 %1738 to i64
  %1740 = shl nuw nsw i64 %1739, 40
  %1741 = or i64 %1736, %1740
  %1742 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 6
  %1743 = load i8, i8 addrspace(4)* %1742, align 1, !tbaa !14
  %1744 = zext i8 %1743 to i64
  %1745 = shl nuw nsw i64 %1744, 48
  %1746 = or i64 %1741, %1745
  %1747 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 7
  %1748 = load i8, i8 addrspace(4)* %1747, align 1, !tbaa !14
  %1749 = zext i8 %1748 to i64
  %1750 = shl nuw i64 %1749, 56
  %1751 = or i64 %1746, %1750
  %1752 = add nsw i32 %1709, -8
  %1753 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 8
  br label %1767

1754:                                             ; preds = %1712, %1754
  %1755 = phi i32 [ %1765, %1754 ], [ 0, %1712 ]
  %1756 = phi i64 [ %1764, %1754 ], [ 0, %1712 ]
  %1757 = zext i32 %1755 to i64
  %1758 = getelementptr inbounds i8, i8 addrspace(4)* %1708, i64 %1757
  %1759 = load i8, i8 addrspace(4)* %1758, align 1, !tbaa !14
  %1760 = zext i8 %1759 to i64
  %1761 = shl i32 %1755, 3
  %1762 = zext i32 %1761 to i64
  %1763 = shl nuw i64 %1760, %1762
  %1764 = or i64 %1763, %1756
  %1765 = add nuw nsw i32 %1755, 1
  %1766 = icmp eq i32 %1765, %1709
  br i1 %1766, label %1767, label %1754

1767:                                             ; preds = %1754, %1714, %1712
  %1768 = phi i8 addrspace(4)* [ %1753, %1714 ], [ %1708, %1712 ], [ %1708, %1754 ]
  %1769 = phi i32 [ %1752, %1714 ], [ 0, %1712 ], [ 0, %1754 ]
  %1770 = phi i64 [ %1751, %1714 ], [ 0, %1712 ], [ %1764, %1754 ]
  %1771 = icmp ugt i32 %1769, 7
  br i1 %1771, label %1774, label %1772

1772:                                             ; preds = %1767
  %1773 = icmp eq i32 %1769, 0
  br i1 %1773, label %1825, label %1812

1774:                                             ; preds = %1767
  %1775 = load i8, i8 addrspace(4)* %1768, align 1, !tbaa !14
  %1776 = zext i8 %1775 to i64
  %1777 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 1
  %1778 = load i8, i8 addrspace(4)* %1777, align 1, !tbaa !14
  %1779 = zext i8 %1778 to i64
  %1780 = shl nuw nsw i64 %1779, 8
  %1781 = or i64 %1780, %1776
  %1782 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 2
  %1783 = load i8, i8 addrspace(4)* %1782, align 1, !tbaa !14
  %1784 = zext i8 %1783 to i64
  %1785 = shl nuw nsw i64 %1784, 16
  %1786 = or i64 %1781, %1785
  %1787 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 3
  %1788 = load i8, i8 addrspace(4)* %1787, align 1, !tbaa !14
  %1789 = zext i8 %1788 to i64
  %1790 = shl nuw nsw i64 %1789, 24
  %1791 = or i64 %1786, %1790
  %1792 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 4
  %1793 = load i8, i8 addrspace(4)* %1792, align 1, !tbaa !14
  %1794 = zext i8 %1793 to i64
  %1795 = shl nuw nsw i64 %1794, 32
  %1796 = or i64 %1791, %1795
  %1797 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 5
  %1798 = load i8, i8 addrspace(4)* %1797, align 1, !tbaa !14
  %1799 = zext i8 %1798 to i64
  %1800 = shl nuw nsw i64 %1799, 40
  %1801 = or i64 %1796, %1800
  %1802 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 6
  %1803 = load i8, i8 addrspace(4)* %1802, align 1, !tbaa !14
  %1804 = zext i8 %1803 to i64
  %1805 = shl nuw nsw i64 %1804, 48
  %1806 = or i64 %1801, %1805
  %1807 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 7
  %1808 = load i8, i8 addrspace(4)* %1807, align 1, !tbaa !14
  %1809 = zext i8 %1808 to i64
  %1810 = shl nuw i64 %1809, 56
  %1811 = or i64 %1806, %1810
  br label %1825

1812:                                             ; preds = %1772, %1812
  %1813 = phi i32 [ %1823, %1812 ], [ 0, %1772 ]
  %1814 = phi i64 [ %1822, %1812 ], [ 0, %1772 ]
  %1815 = zext i32 %1813 to i64
  %1816 = getelementptr inbounds i8, i8 addrspace(4)* %1768, i64 %1815
  %1817 = load i8, i8 addrspace(4)* %1816, align 1, !tbaa !14
  %1818 = zext i8 %1817 to i64
  %1819 = shl i32 %1813, 3
  %1820 = zext i32 %1819 to i64
  %1821 = shl nuw i64 %1818, %1820
  %1822 = or i64 %1821, %1814
  %1823 = add nuw nsw i32 %1813, 1
  %1824 = icmp eq i32 %1823, %1769
  br i1 %1824, label %1825, label %1812

1825:                                             ; preds = %1812, %1774, %1772
  %1826 = phi i64 [ %1811, %1774 ], [ 0, %1772 ], [ %1822, %1812 ]
  %1827 = shl nuw nsw i64 %1408, 2
  %1828 = add nuw nsw i64 %1827, 28
  %1829 = and i64 %1828, 480
  %1830 = and i64 %1410, -225
  %1831 = or i64 %1830, %1829
  %1832 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1831, i64 noundef %1470, i64 noundef %1530, i64 noundef %1590, i64 noundef %1650, i64 noundef %1710, i64 noundef %1770, i64 noundef %1826) #11
  %1833 = sub i64 %1400, %1408
  %1834 = getelementptr inbounds i8, i8 addrspace(4)* %1401, i64 %1408
  %1835 = icmp eq i64 %1833, 0
  br i1 %1835, label %1836, label %1399

1836:                                             ; preds = %1825, %1391
  %1837 = phi <2 x i64> [ %1394, %1391 ], [ %1832, %1825 ]
  %1838 = extractelement <2 x i64> %1837, i64 0
  %1839 = and i64 %1838, -225
  %1840 = or i64 %1839, 32
  %1841 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1840, i64 noundef %4, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %1842 = extractelement <2 x i64> %1841, i64 0
  %1843 = zext i32 %1388 to i64
  %1844 = and i64 %1842, -227
  %1845 = or i64 %1844, 34
  %1846 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %12, i64 noundef %1845, i64 noundef %1843, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #3

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #4 {
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !17
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !19
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !10
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !10
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !10
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !10
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !10
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !10
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !10
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !10
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !19
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !21
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !19
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !19
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !17
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !25
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !10
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !22
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !19
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !10
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !10
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !10
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !10
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !10
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !10
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !10
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !10
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %110 = call i64 @llvm.read_register.i64(metadata !27) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !28
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !30
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !31
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !10
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !10
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !10
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !10
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !10
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !10
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !10
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !10
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !22
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !25
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !32
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !32
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !33
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !35
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !10
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !10
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !25
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !22
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !32
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !32
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
  %215 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #7
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #7
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #7
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #7
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #7
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #7
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #7
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #5

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #6

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #7

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #8

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #10

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #5 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #6 = { mustprogress nounwind willreturn }
attributes #7 = { nounwind }
attributes #8 = { nofree nounwind readonly }
attributes #9 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #10 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!12, !12, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !12, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !12, i64 0}
!21 = !{i64 2662}
!22 = !{!23, !18, i64 0}
!23 = !{!"", !18, i64 0, !18, i64 8, !24, i64 16, !11, i64 24, !11, i64 32, !11, i64 40}
!24 = !{!"hsa_signal_s", !11, i64 0}
!25 = !{!23, !11, i64 40}
!26 = !{!23, !18, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !20, i64 16}
!29 = !{!"", !11, i64 0, !11, i64 8, !20, i64 16, !20, i64 20}
!30 = !{!29, !11, i64 8}
!31 = !{!29, !20, i64 20}
!32 = !{!29, !11, i64 0}
!33 = !{!34, !11, i64 16}
!34 = !{!"amd_signal_s", !11, i64 0, !12, i64 8, !11, i64 16, !20, i64 24, !20, i64 28, !11, i64 32, !11, i64 40, !12, i64 48, !12, i64 56}
!35 = !{!34, !20, i64 24}
