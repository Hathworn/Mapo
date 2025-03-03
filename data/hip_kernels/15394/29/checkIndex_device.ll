; ModuleID = '../data/hip_kernels/15394/29/main.cu'
source_filename = "../data/hip_kernels/15394/29/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [24 x i8] c"threadIdx:(%d, %d, %d)\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [23 x i8] c"blockIdx:(%d, %d, %d)\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [23 x i8] c"blockDim:(%d, %d, %d)\0A\00", align 1
@.str.3 = private unnamed_addr addrspace(4) constant [22 x i8] c"gridDim:(%d, %d, %d)\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z10checkIndexv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %3 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %4 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 24
  %6 = bitcast i8 addrspace(4)* %5 to i64 addrspace(4)*
  %7 = load i64, i64 addrspace(4)* %6, align 8, !tbaa !5
  %8 = inttoptr i64 %7 to i8 addrspace(1)*
  %9 = addrspacecast i8 addrspace(1)* %8 to i8*
  %10 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %11 = extractelement <2 x i64> %10, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %12, label %16

12:                                               ; preds = %0
  %13 = and i64 %11, -225
  %14 = or i64 %13, 32
  %15 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %14, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %457

16:                                               ; preds = %0
  %17 = and i64 %11, 2
  %18 = and i64 %11, -3
  %19 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %18, i64 0
  br label %20

20:                                               ; preds = %446, %16
  %21 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 23) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([24 x i8]* addrspacecast ([24 x i8] addrspace(4)* @.str to [24 x i8]*) to i64)), i64 1))), %16 ], [ %454, %446 ]
  %22 = phi i8 addrspace(4)* [ getelementptr inbounds ([24 x i8], [24 x i8] addrspace(4)* @.str, i64 0, i64 0), %16 ], [ %455, %446 ]
  %23 = phi <2 x i64> [ %19, %16 ], [ %453, %446 ]
  %24 = icmp ugt i64 %21, 56
  %25 = extractelement <2 x i64> %23, i64 0
  %26 = or i64 %25, %17
  %27 = insertelement <2 x i64> poison, i64 %26, i64 0
  %28 = select i1 %24, <2 x i64> %23, <2 x i64> %27
  %29 = tail call i64 @llvm.umin.i64(i64 %21, i64 56)
  %30 = trunc i64 %29 to i32
  %31 = extractelement <2 x i64> %28, i64 0
  %32 = icmp ugt i32 %30, 7
  br i1 %32, label %35, label %33

33:                                               ; preds = %20
  %34 = icmp eq i32 %30, 0
  br i1 %34, label %88, label %75

35:                                               ; preds = %20
  %36 = load i8, i8 addrspace(4)* %22, align 1, !tbaa !9
  %37 = zext i8 %36 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 1
  %39 = load i8, i8 addrspace(4)* %38, align 1, !tbaa !9
  %40 = zext i8 %39 to i64
  %41 = shl nuw nsw i64 %40, 8
  %42 = or i64 %41, %37
  %43 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 2
  %44 = load i8, i8 addrspace(4)* %43, align 1, !tbaa !9
  %45 = zext i8 %44 to i64
  %46 = shl nuw nsw i64 %45, 16
  %47 = or i64 %42, %46
  %48 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 3
  %49 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !9
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 24
  %52 = or i64 %47, %51
  %53 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 4
  %54 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !9
  %55 = zext i8 %54 to i64
  %56 = shl nuw nsw i64 %55, 32
  %57 = or i64 %52, %56
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 5
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !9
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 40
  %62 = or i64 %57, %61
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 6
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !9
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 48
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 7
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !9
  %70 = zext i8 %69 to i64
  %71 = shl nuw i64 %70, 56
  %72 = or i64 %67, %71
  %73 = add nsw i32 %30, -8
  %74 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 8
  br label %88

75:                                               ; preds = %33, %75
  %76 = phi i32 [ %86, %75 ], [ 0, %33 ]
  %77 = phi i64 [ %85, %75 ], [ 0, %33 ]
  %78 = zext i32 %76 to i64
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 %78
  %80 = load i8, i8 addrspace(4)* %79, align 1, !tbaa !9
  %81 = zext i8 %80 to i64
  %82 = shl i32 %76, 3
  %83 = zext i32 %82 to i64
  %84 = shl nuw i64 %81, %83
  %85 = or i64 %84, %77
  %86 = add nuw nsw i32 %76, 1
  %87 = icmp eq i32 %86, %30
  br i1 %87, label %88, label %75, !llvm.loop !10

88:                                               ; preds = %75, %35, %33
  %89 = phi i8 addrspace(4)* [ %74, %35 ], [ %22, %33 ], [ %22, %75 ]
  %90 = phi i32 [ %73, %35 ], [ 0, %33 ], [ 0, %75 ]
  %91 = phi i64 [ %72, %35 ], [ 0, %33 ], [ %85, %75 ]
  %92 = icmp ugt i32 %90, 7
  br i1 %92, label %95, label %93

93:                                               ; preds = %88
  %94 = icmp eq i32 %90, 0
  br i1 %94, label %148, label %135

95:                                               ; preds = %88
  %96 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !9
  %97 = zext i8 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 1
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !9
  %100 = zext i8 %99 to i64
  %101 = shl nuw nsw i64 %100, 8
  %102 = or i64 %101, %97
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 2
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !9
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 16
  %107 = or i64 %102, %106
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 3
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !9
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 24
  %112 = or i64 %107, %111
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 4
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !9
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 32
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 5
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !9
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 40
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 6
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !9
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 48
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 7
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !9
  %130 = zext i8 %129 to i64
  %131 = shl nuw i64 %130, 56
  %132 = or i64 %127, %131
  %133 = add nsw i32 %90, -8
  %134 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 8
  br label %148

135:                                              ; preds = %93, %135
  %136 = phi i32 [ %146, %135 ], [ 0, %93 ]
  %137 = phi i64 [ %145, %135 ], [ 0, %93 ]
  %138 = zext i32 %136 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %89, i64 %138
  %140 = load i8, i8 addrspace(4)* %139, align 1, !tbaa !9
  %141 = zext i8 %140 to i64
  %142 = shl i32 %136, 3
  %143 = zext i32 %142 to i64
  %144 = shl nuw i64 %141, %143
  %145 = or i64 %144, %137
  %146 = add nuw nsw i32 %136, 1
  %147 = icmp eq i32 %146, %90
  br i1 %147, label %148, label %135

148:                                              ; preds = %135, %95, %93
  %149 = phi i8 addrspace(4)* [ %134, %95 ], [ %89, %93 ], [ %89, %135 ]
  %150 = phi i32 [ %133, %95 ], [ 0, %93 ], [ 0, %135 ]
  %151 = phi i64 [ %132, %95 ], [ 0, %93 ], [ %145, %135 ]
  %152 = icmp ugt i32 %150, 7
  br i1 %152, label %155, label %153

153:                                              ; preds = %148
  %154 = icmp eq i32 %150, 0
  br i1 %154, label %208, label %195

155:                                              ; preds = %148
  %156 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !9
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 1
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !9
  %160 = zext i8 %159 to i64
  %161 = shl nuw nsw i64 %160, 8
  %162 = or i64 %161, %157
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 2
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !9
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 16
  %167 = or i64 %162, %166
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 3
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !9
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 24
  %172 = or i64 %167, %171
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 4
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !9
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 32
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 5
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !9
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 40
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 6
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !9
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 48
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 7
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !9
  %190 = zext i8 %189 to i64
  %191 = shl nuw i64 %190, 56
  %192 = or i64 %187, %191
  %193 = add nsw i32 %150, -8
  %194 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 8
  br label %208

195:                                              ; preds = %153, %195
  %196 = phi i32 [ %206, %195 ], [ 0, %153 ]
  %197 = phi i64 [ %205, %195 ], [ 0, %153 ]
  %198 = zext i32 %196 to i64
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %149, i64 %198
  %200 = load i8, i8 addrspace(4)* %199, align 1, !tbaa !9
  %201 = zext i8 %200 to i64
  %202 = shl i32 %196, 3
  %203 = zext i32 %202 to i64
  %204 = shl nuw i64 %201, %203
  %205 = or i64 %204, %197
  %206 = add nuw nsw i32 %196, 1
  %207 = icmp eq i32 %206, %150
  br i1 %207, label %208, label %195

208:                                              ; preds = %195, %155, %153
  %209 = phi i8 addrspace(4)* [ %194, %155 ], [ %149, %153 ], [ %149, %195 ]
  %210 = phi i32 [ %193, %155 ], [ 0, %153 ], [ 0, %195 ]
  %211 = phi i64 [ %192, %155 ], [ 0, %153 ], [ %205, %195 ]
  %212 = icmp ugt i32 %210, 7
  br i1 %212, label %215, label %213

213:                                              ; preds = %208
  %214 = icmp eq i32 %210, 0
  br i1 %214, label %268, label %255

215:                                              ; preds = %208
  %216 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !9
  %217 = zext i8 %216 to i64
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 1
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !9
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 8
  %222 = or i64 %221, %217
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 2
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !9
  %225 = zext i8 %224 to i64
  %226 = shl nuw nsw i64 %225, 16
  %227 = or i64 %222, %226
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 3
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !9
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 24
  %232 = or i64 %227, %231
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 4
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !9
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 32
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 5
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !9
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 40
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 6
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !9
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 48
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 7
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !9
  %250 = zext i8 %249 to i64
  %251 = shl nuw i64 %250, 56
  %252 = or i64 %247, %251
  %253 = add nsw i32 %210, -8
  %254 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 8
  br label %268

255:                                              ; preds = %213, %255
  %256 = phi i32 [ %266, %255 ], [ 0, %213 ]
  %257 = phi i64 [ %265, %255 ], [ 0, %213 ]
  %258 = zext i32 %256 to i64
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %209, i64 %258
  %260 = load i8, i8 addrspace(4)* %259, align 1, !tbaa !9
  %261 = zext i8 %260 to i64
  %262 = shl i32 %256, 3
  %263 = zext i32 %262 to i64
  %264 = shl nuw i64 %261, %263
  %265 = or i64 %264, %257
  %266 = add nuw nsw i32 %256, 1
  %267 = icmp eq i32 %266, %210
  br i1 %267, label %268, label %255

268:                                              ; preds = %255, %215, %213
  %269 = phi i8 addrspace(4)* [ %254, %215 ], [ %209, %213 ], [ %209, %255 ]
  %270 = phi i32 [ %253, %215 ], [ 0, %213 ], [ 0, %255 ]
  %271 = phi i64 [ %252, %215 ], [ 0, %213 ], [ %265, %255 ]
  %272 = icmp ugt i32 %270, 7
  br i1 %272, label %275, label %273

273:                                              ; preds = %268
  %274 = icmp eq i32 %270, 0
  br i1 %274, label %328, label %315

275:                                              ; preds = %268
  %276 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !9
  %277 = zext i8 %276 to i64
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 1
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !9
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 8
  %282 = or i64 %281, %277
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 2
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !9
  %285 = zext i8 %284 to i64
  %286 = shl nuw nsw i64 %285, 16
  %287 = or i64 %282, %286
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 3
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !9
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 24
  %292 = or i64 %287, %291
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 4
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !9
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 32
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 5
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !9
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 40
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 6
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !9
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 48
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 7
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !9
  %310 = zext i8 %309 to i64
  %311 = shl nuw i64 %310, 56
  %312 = or i64 %307, %311
  %313 = add nsw i32 %270, -8
  %314 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 8
  br label %328

315:                                              ; preds = %273, %315
  %316 = phi i32 [ %326, %315 ], [ 0, %273 ]
  %317 = phi i64 [ %325, %315 ], [ 0, %273 ]
  %318 = zext i32 %316 to i64
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %269, i64 %318
  %320 = load i8, i8 addrspace(4)* %319, align 1, !tbaa !9
  %321 = zext i8 %320 to i64
  %322 = shl i32 %316, 3
  %323 = zext i32 %322 to i64
  %324 = shl nuw i64 %321, %323
  %325 = or i64 %324, %317
  %326 = add nuw nsw i32 %316, 1
  %327 = icmp eq i32 %326, %270
  br i1 %327, label %328, label %315

328:                                              ; preds = %315, %275, %273
  %329 = phi i8 addrspace(4)* [ %314, %275 ], [ %269, %273 ], [ %269, %315 ]
  %330 = phi i32 [ %313, %275 ], [ 0, %273 ], [ 0, %315 ]
  %331 = phi i64 [ %312, %275 ], [ 0, %273 ], [ %325, %315 ]
  %332 = icmp ugt i32 %330, 7
  br i1 %332, label %335, label %333

333:                                              ; preds = %328
  %334 = icmp eq i32 %330, 0
  br i1 %334, label %388, label %375

335:                                              ; preds = %328
  %336 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !9
  %337 = zext i8 %336 to i64
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 1
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !9
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 8
  %342 = or i64 %341, %337
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 2
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !9
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 16
  %347 = or i64 %342, %346
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 3
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !9
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 24
  %352 = or i64 %347, %351
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 4
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !9
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 32
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 5
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !9
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 40
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 6
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !9
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 48
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 7
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !9
  %370 = zext i8 %369 to i64
  %371 = shl nuw i64 %370, 56
  %372 = or i64 %367, %371
  %373 = add nsw i32 %330, -8
  %374 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 8
  br label %388

375:                                              ; preds = %333, %375
  %376 = phi i32 [ %386, %375 ], [ 0, %333 ]
  %377 = phi i64 [ %385, %375 ], [ 0, %333 ]
  %378 = zext i32 %376 to i64
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %329, i64 %378
  %380 = load i8, i8 addrspace(4)* %379, align 1, !tbaa !9
  %381 = zext i8 %380 to i64
  %382 = shl i32 %376, 3
  %383 = zext i32 %382 to i64
  %384 = shl nuw i64 %381, %383
  %385 = or i64 %384, %377
  %386 = add nuw nsw i32 %376, 1
  %387 = icmp eq i32 %386, %330
  br i1 %387, label %388, label %375

388:                                              ; preds = %375, %335, %333
  %389 = phi i8 addrspace(4)* [ %374, %335 ], [ %329, %333 ], [ %329, %375 ]
  %390 = phi i32 [ %373, %335 ], [ 0, %333 ], [ 0, %375 ]
  %391 = phi i64 [ %372, %335 ], [ 0, %333 ], [ %385, %375 ]
  %392 = icmp ugt i32 %390, 7
  br i1 %392, label %395, label %393

393:                                              ; preds = %388
  %394 = icmp eq i32 %390, 0
  br i1 %394, label %446, label %433

395:                                              ; preds = %388
  %396 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !9
  %397 = zext i8 %396 to i64
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 1
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !9
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 8
  %402 = or i64 %401, %397
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 2
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !9
  %405 = zext i8 %404 to i64
  %406 = shl nuw nsw i64 %405, 16
  %407 = or i64 %402, %406
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 3
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !9
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 24
  %412 = or i64 %407, %411
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 4
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !9
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 32
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 5
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !9
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 40
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 6
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !9
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 48
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 7
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !9
  %430 = zext i8 %429 to i64
  %431 = shl nuw i64 %430, 56
  %432 = or i64 %427, %431
  br label %446

433:                                              ; preds = %393, %433
  %434 = phi i32 [ %444, %433 ], [ 0, %393 ]
  %435 = phi i64 [ %443, %433 ], [ 0, %393 ]
  %436 = zext i32 %434 to i64
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %389, i64 %436
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !9
  %439 = zext i8 %438 to i64
  %440 = shl i32 %434, 3
  %441 = zext i32 %440 to i64
  %442 = shl nuw i64 %439, %441
  %443 = or i64 %442, %435
  %444 = add nuw nsw i32 %434, 1
  %445 = icmp eq i32 %444, %390
  br i1 %445, label %446, label %433

446:                                              ; preds = %433, %395, %393
  %447 = phi i64 [ %432, %395 ], [ 0, %393 ], [ %443, %433 ]
  %448 = shl nuw nsw i64 %29, 2
  %449 = add nuw nsw i64 %448, 28
  %450 = and i64 %449, 480
  %451 = and i64 %31, -225
  %452 = or i64 %451, %450
  %453 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %452, i64 noundef %91, i64 noundef %151, i64 noundef %211, i64 noundef %271, i64 noundef %331, i64 noundef %391, i64 noundef %447) #10
  %454 = sub i64 %21, %29
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 %29
  %456 = icmp eq i64 %454, 0
  br i1 %456, label %457, label %20

457:                                              ; preds = %446, %12
  %458 = phi <2 x i64> [ %15, %12 ], [ %453, %446 ]
  %459 = extractelement <2 x i64> %458, i64 0
  %460 = zext i32 %1 to i64
  %461 = and i64 %459, -225
  %462 = or i64 %461, 32
  %463 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %462, i64 noundef %460, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %464 = extractelement <2 x i64> %463, i64 0
  %465 = zext i32 %2 to i64
  %466 = and i64 %464, -225
  %467 = or i64 %466, 32
  %468 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %467, i64 noundef %465, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %469 = extractelement <2 x i64> %468, i64 0
  %470 = zext i32 %3 to i64
  %471 = and i64 %469, -227
  %472 = or i64 %471, 34
  %473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %472, i64 noundef %470, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %474 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %475 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %476 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %478 = extractelement <2 x i64> %477, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %479, label %483

479:                                              ; preds = %457
  %480 = and i64 %478, -225
  %481 = or i64 %480, 32
  %482 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %481, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %924

483:                                              ; preds = %457
  %484 = and i64 %478, 2
  %485 = and i64 %478, -3
  %486 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %485, i64 0
  br label %487

487:                                              ; preds = %913, %483
  %488 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 22) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([23 x i8]* addrspacecast ([23 x i8] addrspace(4)* @.str.1 to [23 x i8]*) to i64)), i64 1))), %483 ], [ %921, %913 ]
  %489 = phi i8 addrspace(4)* [ getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %483 ], [ %922, %913 ]
  %490 = phi <2 x i64> [ %486, %483 ], [ %920, %913 ]
  %491 = icmp ugt i64 %488, 56
  %492 = extractelement <2 x i64> %490, i64 0
  %493 = or i64 %492, %484
  %494 = insertelement <2 x i64> poison, i64 %493, i64 0
  %495 = select i1 %491, <2 x i64> %490, <2 x i64> %494
  %496 = tail call i64 @llvm.umin.i64(i64 %488, i64 56)
  %497 = trunc i64 %496 to i32
  %498 = extractelement <2 x i64> %495, i64 0
  %499 = icmp ugt i32 %497, 7
  br i1 %499, label %502, label %500

500:                                              ; preds = %487
  %501 = icmp eq i32 %497, 0
  br i1 %501, label %555, label %542

502:                                              ; preds = %487
  %503 = load i8, i8 addrspace(4)* %489, align 1, !tbaa !9
  %504 = zext i8 %503 to i64
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 1
  %506 = load i8, i8 addrspace(4)* %505, align 1, !tbaa !9
  %507 = zext i8 %506 to i64
  %508 = shl nuw nsw i64 %507, 8
  %509 = or i64 %508, %504
  %510 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 2
  %511 = load i8, i8 addrspace(4)* %510, align 1, !tbaa !9
  %512 = zext i8 %511 to i64
  %513 = shl nuw nsw i64 %512, 16
  %514 = or i64 %509, %513
  %515 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 3
  %516 = load i8, i8 addrspace(4)* %515, align 1, !tbaa !9
  %517 = zext i8 %516 to i64
  %518 = shl nuw nsw i64 %517, 24
  %519 = or i64 %514, %518
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 4
  %521 = load i8, i8 addrspace(4)* %520, align 1, !tbaa !9
  %522 = zext i8 %521 to i64
  %523 = shl nuw nsw i64 %522, 32
  %524 = or i64 %519, %523
  %525 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 5
  %526 = load i8, i8 addrspace(4)* %525, align 1, !tbaa !9
  %527 = zext i8 %526 to i64
  %528 = shl nuw nsw i64 %527, 40
  %529 = or i64 %524, %528
  %530 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 6
  %531 = load i8, i8 addrspace(4)* %530, align 1, !tbaa !9
  %532 = zext i8 %531 to i64
  %533 = shl nuw nsw i64 %532, 48
  %534 = or i64 %529, %533
  %535 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 7
  %536 = load i8, i8 addrspace(4)* %535, align 1, !tbaa !9
  %537 = zext i8 %536 to i64
  %538 = shl nuw i64 %537, 56
  %539 = or i64 %534, %538
  %540 = add nsw i32 %497, -8
  %541 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 8
  br label %555

542:                                              ; preds = %500, %542
  %543 = phi i32 [ %553, %542 ], [ 0, %500 ]
  %544 = phi i64 [ %552, %542 ], [ 0, %500 ]
  %545 = zext i32 %543 to i64
  %546 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 %545
  %547 = load i8, i8 addrspace(4)* %546, align 1, !tbaa !9
  %548 = zext i8 %547 to i64
  %549 = shl i32 %543, 3
  %550 = zext i32 %549 to i64
  %551 = shl nuw i64 %548, %550
  %552 = or i64 %551, %544
  %553 = add nuw nsw i32 %543, 1
  %554 = icmp eq i32 %553, %497
  br i1 %554, label %555, label %542, !llvm.loop !10

555:                                              ; preds = %542, %502, %500
  %556 = phi i8 addrspace(4)* [ %541, %502 ], [ %489, %500 ], [ %489, %542 ]
  %557 = phi i32 [ %540, %502 ], [ 0, %500 ], [ 0, %542 ]
  %558 = phi i64 [ %539, %502 ], [ 0, %500 ], [ %552, %542 ]
  %559 = icmp ugt i32 %557, 7
  br i1 %559, label %562, label %560

560:                                              ; preds = %555
  %561 = icmp eq i32 %557, 0
  br i1 %561, label %615, label %602

562:                                              ; preds = %555
  %563 = load i8, i8 addrspace(4)* %556, align 1, !tbaa !9
  %564 = zext i8 %563 to i64
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 1
  %566 = load i8, i8 addrspace(4)* %565, align 1, !tbaa !9
  %567 = zext i8 %566 to i64
  %568 = shl nuw nsw i64 %567, 8
  %569 = or i64 %568, %564
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 2
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !9
  %572 = zext i8 %571 to i64
  %573 = shl nuw nsw i64 %572, 16
  %574 = or i64 %569, %573
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 3
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !9
  %577 = zext i8 %576 to i64
  %578 = shl nuw nsw i64 %577, 24
  %579 = or i64 %574, %578
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 4
  %581 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !9
  %582 = zext i8 %581 to i64
  %583 = shl nuw nsw i64 %582, 32
  %584 = or i64 %579, %583
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 5
  %586 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !9
  %587 = zext i8 %586 to i64
  %588 = shl nuw nsw i64 %587, 40
  %589 = or i64 %584, %588
  %590 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 6
  %591 = load i8, i8 addrspace(4)* %590, align 1, !tbaa !9
  %592 = zext i8 %591 to i64
  %593 = shl nuw nsw i64 %592, 48
  %594 = or i64 %589, %593
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 7
  %596 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !9
  %597 = zext i8 %596 to i64
  %598 = shl nuw i64 %597, 56
  %599 = or i64 %594, %598
  %600 = add nsw i32 %557, -8
  %601 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 8
  br label %615

602:                                              ; preds = %560, %602
  %603 = phi i32 [ %613, %602 ], [ 0, %560 ]
  %604 = phi i64 [ %612, %602 ], [ 0, %560 ]
  %605 = zext i32 %603 to i64
  %606 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 %605
  %607 = load i8, i8 addrspace(4)* %606, align 1, !tbaa !9
  %608 = zext i8 %607 to i64
  %609 = shl i32 %603, 3
  %610 = zext i32 %609 to i64
  %611 = shl nuw i64 %608, %610
  %612 = or i64 %611, %604
  %613 = add nuw nsw i32 %603, 1
  %614 = icmp eq i32 %613, %557
  br i1 %614, label %615, label %602

615:                                              ; preds = %602, %562, %560
  %616 = phi i8 addrspace(4)* [ %601, %562 ], [ %556, %560 ], [ %556, %602 ]
  %617 = phi i32 [ %600, %562 ], [ 0, %560 ], [ 0, %602 ]
  %618 = phi i64 [ %599, %562 ], [ 0, %560 ], [ %612, %602 ]
  %619 = icmp ugt i32 %617, 7
  br i1 %619, label %622, label %620

620:                                              ; preds = %615
  %621 = icmp eq i32 %617, 0
  br i1 %621, label %675, label %662

622:                                              ; preds = %615
  %623 = load i8, i8 addrspace(4)* %616, align 1, !tbaa !9
  %624 = zext i8 %623 to i64
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 1
  %626 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !9
  %627 = zext i8 %626 to i64
  %628 = shl nuw nsw i64 %627, 8
  %629 = or i64 %628, %624
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 2
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !9
  %632 = zext i8 %631 to i64
  %633 = shl nuw nsw i64 %632, 16
  %634 = or i64 %629, %633
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 3
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !9
  %637 = zext i8 %636 to i64
  %638 = shl nuw nsw i64 %637, 24
  %639 = or i64 %634, %638
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 4
  %641 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !9
  %642 = zext i8 %641 to i64
  %643 = shl nuw nsw i64 %642, 32
  %644 = or i64 %639, %643
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 5
  %646 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !9
  %647 = zext i8 %646 to i64
  %648 = shl nuw nsw i64 %647, 40
  %649 = or i64 %644, %648
  %650 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 6
  %651 = load i8, i8 addrspace(4)* %650, align 1, !tbaa !9
  %652 = zext i8 %651 to i64
  %653 = shl nuw nsw i64 %652, 48
  %654 = or i64 %649, %653
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 7
  %656 = load i8, i8 addrspace(4)* %655, align 1, !tbaa !9
  %657 = zext i8 %656 to i64
  %658 = shl nuw i64 %657, 56
  %659 = or i64 %654, %658
  %660 = add nsw i32 %617, -8
  %661 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 8
  br label %675

662:                                              ; preds = %620, %662
  %663 = phi i32 [ %673, %662 ], [ 0, %620 ]
  %664 = phi i64 [ %672, %662 ], [ 0, %620 ]
  %665 = zext i32 %663 to i64
  %666 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 %665
  %667 = load i8, i8 addrspace(4)* %666, align 1, !tbaa !9
  %668 = zext i8 %667 to i64
  %669 = shl i32 %663, 3
  %670 = zext i32 %669 to i64
  %671 = shl nuw i64 %668, %670
  %672 = or i64 %671, %664
  %673 = add nuw nsw i32 %663, 1
  %674 = icmp eq i32 %673, %617
  br i1 %674, label %675, label %662

675:                                              ; preds = %662, %622, %620
  %676 = phi i8 addrspace(4)* [ %661, %622 ], [ %616, %620 ], [ %616, %662 ]
  %677 = phi i32 [ %660, %622 ], [ 0, %620 ], [ 0, %662 ]
  %678 = phi i64 [ %659, %622 ], [ 0, %620 ], [ %672, %662 ]
  %679 = icmp ugt i32 %677, 7
  br i1 %679, label %682, label %680

680:                                              ; preds = %675
  %681 = icmp eq i32 %677, 0
  br i1 %681, label %735, label %722

682:                                              ; preds = %675
  %683 = load i8, i8 addrspace(4)* %676, align 1, !tbaa !9
  %684 = zext i8 %683 to i64
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 1
  %686 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !9
  %687 = zext i8 %686 to i64
  %688 = shl nuw nsw i64 %687, 8
  %689 = or i64 %688, %684
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 2
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !9
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 16
  %694 = or i64 %689, %693
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 3
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !9
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 24
  %699 = or i64 %694, %698
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 4
  %701 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !9
  %702 = zext i8 %701 to i64
  %703 = shl nuw nsw i64 %702, 32
  %704 = or i64 %699, %703
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 5
  %706 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !9
  %707 = zext i8 %706 to i64
  %708 = shl nuw nsw i64 %707, 40
  %709 = or i64 %704, %708
  %710 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 6
  %711 = load i8, i8 addrspace(4)* %710, align 1, !tbaa !9
  %712 = zext i8 %711 to i64
  %713 = shl nuw nsw i64 %712, 48
  %714 = or i64 %709, %713
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 7
  %716 = load i8, i8 addrspace(4)* %715, align 1, !tbaa !9
  %717 = zext i8 %716 to i64
  %718 = shl nuw i64 %717, 56
  %719 = or i64 %714, %718
  %720 = add nsw i32 %677, -8
  %721 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 8
  br label %735

722:                                              ; preds = %680, %722
  %723 = phi i32 [ %733, %722 ], [ 0, %680 ]
  %724 = phi i64 [ %732, %722 ], [ 0, %680 ]
  %725 = zext i32 %723 to i64
  %726 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 %725
  %727 = load i8, i8 addrspace(4)* %726, align 1, !tbaa !9
  %728 = zext i8 %727 to i64
  %729 = shl i32 %723, 3
  %730 = zext i32 %729 to i64
  %731 = shl nuw i64 %728, %730
  %732 = or i64 %731, %724
  %733 = add nuw nsw i32 %723, 1
  %734 = icmp eq i32 %733, %677
  br i1 %734, label %735, label %722

735:                                              ; preds = %722, %682, %680
  %736 = phi i8 addrspace(4)* [ %721, %682 ], [ %676, %680 ], [ %676, %722 ]
  %737 = phi i32 [ %720, %682 ], [ 0, %680 ], [ 0, %722 ]
  %738 = phi i64 [ %719, %682 ], [ 0, %680 ], [ %732, %722 ]
  %739 = icmp ugt i32 %737, 7
  br i1 %739, label %742, label %740

740:                                              ; preds = %735
  %741 = icmp eq i32 %737, 0
  br i1 %741, label %795, label %782

742:                                              ; preds = %735
  %743 = load i8, i8 addrspace(4)* %736, align 1, !tbaa !9
  %744 = zext i8 %743 to i64
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 1
  %746 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !9
  %747 = zext i8 %746 to i64
  %748 = shl nuw nsw i64 %747, 8
  %749 = or i64 %748, %744
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 2
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !9
  %752 = zext i8 %751 to i64
  %753 = shl nuw nsw i64 %752, 16
  %754 = or i64 %749, %753
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 3
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !9
  %757 = zext i8 %756 to i64
  %758 = shl nuw nsw i64 %757, 24
  %759 = or i64 %754, %758
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 4
  %761 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !9
  %762 = zext i8 %761 to i64
  %763 = shl nuw nsw i64 %762, 32
  %764 = or i64 %759, %763
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 5
  %766 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !9
  %767 = zext i8 %766 to i64
  %768 = shl nuw nsw i64 %767, 40
  %769 = or i64 %764, %768
  %770 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 6
  %771 = load i8, i8 addrspace(4)* %770, align 1, !tbaa !9
  %772 = zext i8 %771 to i64
  %773 = shl nuw nsw i64 %772, 48
  %774 = or i64 %769, %773
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 7
  %776 = load i8, i8 addrspace(4)* %775, align 1, !tbaa !9
  %777 = zext i8 %776 to i64
  %778 = shl nuw i64 %777, 56
  %779 = or i64 %774, %778
  %780 = add nsw i32 %737, -8
  %781 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 8
  br label %795

782:                                              ; preds = %740, %782
  %783 = phi i32 [ %793, %782 ], [ 0, %740 ]
  %784 = phi i64 [ %792, %782 ], [ 0, %740 ]
  %785 = zext i32 %783 to i64
  %786 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 %785
  %787 = load i8, i8 addrspace(4)* %786, align 1, !tbaa !9
  %788 = zext i8 %787 to i64
  %789 = shl i32 %783, 3
  %790 = zext i32 %789 to i64
  %791 = shl nuw i64 %788, %790
  %792 = or i64 %791, %784
  %793 = add nuw nsw i32 %783, 1
  %794 = icmp eq i32 %793, %737
  br i1 %794, label %795, label %782

795:                                              ; preds = %782, %742, %740
  %796 = phi i8 addrspace(4)* [ %781, %742 ], [ %736, %740 ], [ %736, %782 ]
  %797 = phi i32 [ %780, %742 ], [ 0, %740 ], [ 0, %782 ]
  %798 = phi i64 [ %779, %742 ], [ 0, %740 ], [ %792, %782 ]
  %799 = icmp ugt i32 %797, 7
  br i1 %799, label %802, label %800

800:                                              ; preds = %795
  %801 = icmp eq i32 %797, 0
  br i1 %801, label %855, label %842

802:                                              ; preds = %795
  %803 = load i8, i8 addrspace(4)* %796, align 1, !tbaa !9
  %804 = zext i8 %803 to i64
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 1
  %806 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !9
  %807 = zext i8 %806 to i64
  %808 = shl nuw nsw i64 %807, 8
  %809 = or i64 %808, %804
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 2
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !9
  %812 = zext i8 %811 to i64
  %813 = shl nuw nsw i64 %812, 16
  %814 = or i64 %809, %813
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 3
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !9
  %817 = zext i8 %816 to i64
  %818 = shl nuw nsw i64 %817, 24
  %819 = or i64 %814, %818
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 4
  %821 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !9
  %822 = zext i8 %821 to i64
  %823 = shl nuw nsw i64 %822, 32
  %824 = or i64 %819, %823
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 5
  %826 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !9
  %827 = zext i8 %826 to i64
  %828 = shl nuw nsw i64 %827, 40
  %829 = or i64 %824, %828
  %830 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 6
  %831 = load i8, i8 addrspace(4)* %830, align 1, !tbaa !9
  %832 = zext i8 %831 to i64
  %833 = shl nuw nsw i64 %832, 48
  %834 = or i64 %829, %833
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 7
  %836 = load i8, i8 addrspace(4)* %835, align 1, !tbaa !9
  %837 = zext i8 %836 to i64
  %838 = shl nuw i64 %837, 56
  %839 = or i64 %834, %838
  %840 = add nsw i32 %797, -8
  %841 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 8
  br label %855

842:                                              ; preds = %800, %842
  %843 = phi i32 [ %853, %842 ], [ 0, %800 ]
  %844 = phi i64 [ %852, %842 ], [ 0, %800 ]
  %845 = zext i32 %843 to i64
  %846 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 %845
  %847 = load i8, i8 addrspace(4)* %846, align 1, !tbaa !9
  %848 = zext i8 %847 to i64
  %849 = shl i32 %843, 3
  %850 = zext i32 %849 to i64
  %851 = shl nuw i64 %848, %850
  %852 = or i64 %851, %844
  %853 = add nuw nsw i32 %843, 1
  %854 = icmp eq i32 %853, %797
  br i1 %854, label %855, label %842

855:                                              ; preds = %842, %802, %800
  %856 = phi i8 addrspace(4)* [ %841, %802 ], [ %796, %800 ], [ %796, %842 ]
  %857 = phi i32 [ %840, %802 ], [ 0, %800 ], [ 0, %842 ]
  %858 = phi i64 [ %839, %802 ], [ 0, %800 ], [ %852, %842 ]
  %859 = icmp ugt i32 %857, 7
  br i1 %859, label %862, label %860

860:                                              ; preds = %855
  %861 = icmp eq i32 %857, 0
  br i1 %861, label %913, label %900

862:                                              ; preds = %855
  %863 = load i8, i8 addrspace(4)* %856, align 1, !tbaa !9
  %864 = zext i8 %863 to i64
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 1
  %866 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !9
  %867 = zext i8 %866 to i64
  %868 = shl nuw nsw i64 %867, 8
  %869 = or i64 %868, %864
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 2
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !9
  %872 = zext i8 %871 to i64
  %873 = shl nuw nsw i64 %872, 16
  %874 = or i64 %869, %873
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 3
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !9
  %877 = zext i8 %876 to i64
  %878 = shl nuw nsw i64 %877, 24
  %879 = or i64 %874, %878
  %880 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 4
  %881 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !9
  %882 = zext i8 %881 to i64
  %883 = shl nuw nsw i64 %882, 32
  %884 = or i64 %879, %883
  %885 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 5
  %886 = load i8, i8 addrspace(4)* %885, align 1, !tbaa !9
  %887 = zext i8 %886 to i64
  %888 = shl nuw nsw i64 %887, 40
  %889 = or i64 %884, %888
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 6
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !9
  %892 = zext i8 %891 to i64
  %893 = shl nuw nsw i64 %892, 48
  %894 = or i64 %889, %893
  %895 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 7
  %896 = load i8, i8 addrspace(4)* %895, align 1, !tbaa !9
  %897 = zext i8 %896 to i64
  %898 = shl nuw i64 %897, 56
  %899 = or i64 %894, %898
  br label %913

900:                                              ; preds = %860, %900
  %901 = phi i32 [ %911, %900 ], [ 0, %860 ]
  %902 = phi i64 [ %910, %900 ], [ 0, %860 ]
  %903 = zext i32 %901 to i64
  %904 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 %903
  %905 = load i8, i8 addrspace(4)* %904, align 1, !tbaa !9
  %906 = zext i8 %905 to i64
  %907 = shl i32 %901, 3
  %908 = zext i32 %907 to i64
  %909 = shl nuw i64 %906, %908
  %910 = or i64 %909, %902
  %911 = add nuw nsw i32 %901, 1
  %912 = icmp eq i32 %911, %857
  br i1 %912, label %913, label %900

913:                                              ; preds = %900, %862, %860
  %914 = phi i64 [ %899, %862 ], [ 0, %860 ], [ %910, %900 ]
  %915 = shl nuw nsw i64 %496, 2
  %916 = add nuw nsw i64 %915, 28
  %917 = and i64 %916, 480
  %918 = and i64 %498, -225
  %919 = or i64 %918, %917
  %920 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %919, i64 noundef %558, i64 noundef %618, i64 noundef %678, i64 noundef %738, i64 noundef %798, i64 noundef %858, i64 noundef %914) #10
  %921 = sub i64 %488, %496
  %922 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 %496
  %923 = icmp eq i64 %921, 0
  br i1 %923, label %924, label %487

924:                                              ; preds = %913, %479
  %925 = phi <2 x i64> [ %482, %479 ], [ %920, %913 ]
  %926 = extractelement <2 x i64> %925, i64 0
  %927 = zext i32 %474 to i64
  %928 = and i64 %926, -225
  %929 = or i64 %928, 32
  %930 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %929, i64 noundef %927, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %931 = extractelement <2 x i64> %930, i64 0
  %932 = zext i32 %475 to i64
  %933 = and i64 %931, -225
  %934 = or i64 %933, 32
  %935 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %934, i64 noundef %932, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %936 = extractelement <2 x i64> %935, i64 0
  %937 = zext i32 %476 to i64
  %938 = and i64 %936, -227
  %939 = or i64 %938, 34
  %940 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %939, i64 noundef %937, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %941 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %942 = getelementptr i8, i8 addrspace(4)* %941, i64 4
  %943 = bitcast i8 addrspace(4)* %942 to i16 addrspace(4)*
  %944 = load i16, i16 addrspace(4)* %943, align 4, !range !12, !invariant.load !13
  %945 = zext i16 %944 to i32
  %946 = getelementptr inbounds i8, i8 addrspace(4)* %941, i64 12
  %947 = bitcast i8 addrspace(4)* %946 to i32 addrspace(4)*
  %948 = load i32, i32 addrspace(4)* %947, align 4, !tbaa !14
  %949 = getelementptr i8, i8 addrspace(4)* %941, i64 6
  %950 = bitcast i8 addrspace(4)* %949 to i16 addrspace(4)*
  %951 = load i16, i16 addrspace(4)* %950, align 2, !range !12, !invariant.load !13
  %952 = zext i16 %951 to i32
  %953 = getelementptr inbounds i8, i8 addrspace(4)* %941, i64 16
  %954 = bitcast i8 addrspace(4)* %953 to i32 addrspace(4)*
  %955 = load i32, i32 addrspace(4)* %954, align 8, !tbaa !20
  %956 = getelementptr i8, i8 addrspace(4)* %941, i64 8
  %957 = bitcast i8 addrspace(4)* %956 to i16 addrspace(4)*
  %958 = load i16, i16 addrspace(4)* %957, align 4, !range !12, !invariant.load !13
  %959 = zext i16 %958 to i32
  %960 = getelementptr inbounds i8, i8 addrspace(4)* %941, i64 20
  %961 = bitcast i8 addrspace(4)* %960 to i32 addrspace(4)*
  %962 = load i32, i32 addrspace(4)* %961, align 4, !tbaa !21
  %963 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %964 = extractelement <2 x i64> %963, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %965, label %969

965:                                              ; preds = %924
  %966 = and i64 %964, -225
  %967 = or i64 %966, 32
  %968 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %967, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1410

969:                                              ; preds = %924
  %970 = and i64 %964, 2
  %971 = and i64 %964, -3
  %972 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %971, i64 0
  br label %973

973:                                              ; preds = %1399, %969
  %974 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.2, i64 0, i64 22) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([23 x i8]* addrspacecast ([23 x i8] addrspace(4)* @.str.2 to [23 x i8]*) to i64)), i64 1))), %969 ], [ %1407, %1399 ]
  %975 = phi i8 addrspace(4)* [ getelementptr inbounds ([23 x i8], [23 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %969 ], [ %1408, %1399 ]
  %976 = phi <2 x i64> [ %972, %969 ], [ %1406, %1399 ]
  %977 = icmp ugt i64 %974, 56
  %978 = extractelement <2 x i64> %976, i64 0
  %979 = or i64 %978, %970
  %980 = insertelement <2 x i64> poison, i64 %979, i64 0
  %981 = select i1 %977, <2 x i64> %976, <2 x i64> %980
  %982 = tail call i64 @llvm.umin.i64(i64 %974, i64 56)
  %983 = trunc i64 %982 to i32
  %984 = extractelement <2 x i64> %981, i64 0
  %985 = icmp ugt i32 %983, 7
  br i1 %985, label %988, label %986

986:                                              ; preds = %973
  %987 = icmp eq i32 %983, 0
  br i1 %987, label %1041, label %1028

988:                                              ; preds = %973
  %989 = load i8, i8 addrspace(4)* %975, align 1, !tbaa !9
  %990 = zext i8 %989 to i64
  %991 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 1
  %992 = load i8, i8 addrspace(4)* %991, align 1, !tbaa !9
  %993 = zext i8 %992 to i64
  %994 = shl nuw nsw i64 %993, 8
  %995 = or i64 %994, %990
  %996 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 2
  %997 = load i8, i8 addrspace(4)* %996, align 1, !tbaa !9
  %998 = zext i8 %997 to i64
  %999 = shl nuw nsw i64 %998, 16
  %1000 = or i64 %995, %999
  %1001 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 3
  %1002 = load i8, i8 addrspace(4)* %1001, align 1, !tbaa !9
  %1003 = zext i8 %1002 to i64
  %1004 = shl nuw nsw i64 %1003, 24
  %1005 = or i64 %1000, %1004
  %1006 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 4
  %1007 = load i8, i8 addrspace(4)* %1006, align 1, !tbaa !9
  %1008 = zext i8 %1007 to i64
  %1009 = shl nuw nsw i64 %1008, 32
  %1010 = or i64 %1005, %1009
  %1011 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 5
  %1012 = load i8, i8 addrspace(4)* %1011, align 1, !tbaa !9
  %1013 = zext i8 %1012 to i64
  %1014 = shl nuw nsw i64 %1013, 40
  %1015 = or i64 %1010, %1014
  %1016 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 6
  %1017 = load i8, i8 addrspace(4)* %1016, align 1, !tbaa !9
  %1018 = zext i8 %1017 to i64
  %1019 = shl nuw nsw i64 %1018, 48
  %1020 = or i64 %1015, %1019
  %1021 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 7
  %1022 = load i8, i8 addrspace(4)* %1021, align 1, !tbaa !9
  %1023 = zext i8 %1022 to i64
  %1024 = shl nuw i64 %1023, 56
  %1025 = or i64 %1020, %1024
  %1026 = add nsw i32 %983, -8
  %1027 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 8
  br label %1041

1028:                                             ; preds = %986, %1028
  %1029 = phi i32 [ %1039, %1028 ], [ 0, %986 ]
  %1030 = phi i64 [ %1038, %1028 ], [ 0, %986 ]
  %1031 = zext i32 %1029 to i64
  %1032 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 %1031
  %1033 = load i8, i8 addrspace(4)* %1032, align 1, !tbaa !9
  %1034 = zext i8 %1033 to i64
  %1035 = shl i32 %1029, 3
  %1036 = zext i32 %1035 to i64
  %1037 = shl nuw i64 %1034, %1036
  %1038 = or i64 %1037, %1030
  %1039 = add nuw nsw i32 %1029, 1
  %1040 = icmp eq i32 %1039, %983
  br i1 %1040, label %1041, label %1028, !llvm.loop !10

1041:                                             ; preds = %1028, %988, %986
  %1042 = phi i8 addrspace(4)* [ %1027, %988 ], [ %975, %986 ], [ %975, %1028 ]
  %1043 = phi i32 [ %1026, %988 ], [ 0, %986 ], [ 0, %1028 ]
  %1044 = phi i64 [ %1025, %988 ], [ 0, %986 ], [ %1038, %1028 ]
  %1045 = icmp ugt i32 %1043, 7
  br i1 %1045, label %1048, label %1046

1046:                                             ; preds = %1041
  %1047 = icmp eq i32 %1043, 0
  br i1 %1047, label %1101, label %1088

1048:                                             ; preds = %1041
  %1049 = load i8, i8 addrspace(4)* %1042, align 1, !tbaa !9
  %1050 = zext i8 %1049 to i64
  %1051 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 1
  %1052 = load i8, i8 addrspace(4)* %1051, align 1, !tbaa !9
  %1053 = zext i8 %1052 to i64
  %1054 = shl nuw nsw i64 %1053, 8
  %1055 = or i64 %1054, %1050
  %1056 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 2
  %1057 = load i8, i8 addrspace(4)* %1056, align 1, !tbaa !9
  %1058 = zext i8 %1057 to i64
  %1059 = shl nuw nsw i64 %1058, 16
  %1060 = or i64 %1055, %1059
  %1061 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 3
  %1062 = load i8, i8 addrspace(4)* %1061, align 1, !tbaa !9
  %1063 = zext i8 %1062 to i64
  %1064 = shl nuw nsw i64 %1063, 24
  %1065 = or i64 %1060, %1064
  %1066 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 4
  %1067 = load i8, i8 addrspace(4)* %1066, align 1, !tbaa !9
  %1068 = zext i8 %1067 to i64
  %1069 = shl nuw nsw i64 %1068, 32
  %1070 = or i64 %1065, %1069
  %1071 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 5
  %1072 = load i8, i8 addrspace(4)* %1071, align 1, !tbaa !9
  %1073 = zext i8 %1072 to i64
  %1074 = shl nuw nsw i64 %1073, 40
  %1075 = or i64 %1070, %1074
  %1076 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 6
  %1077 = load i8, i8 addrspace(4)* %1076, align 1, !tbaa !9
  %1078 = zext i8 %1077 to i64
  %1079 = shl nuw nsw i64 %1078, 48
  %1080 = or i64 %1075, %1079
  %1081 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 7
  %1082 = load i8, i8 addrspace(4)* %1081, align 1, !tbaa !9
  %1083 = zext i8 %1082 to i64
  %1084 = shl nuw i64 %1083, 56
  %1085 = or i64 %1080, %1084
  %1086 = add nsw i32 %1043, -8
  %1087 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 8
  br label %1101

1088:                                             ; preds = %1046, %1088
  %1089 = phi i32 [ %1099, %1088 ], [ 0, %1046 ]
  %1090 = phi i64 [ %1098, %1088 ], [ 0, %1046 ]
  %1091 = zext i32 %1089 to i64
  %1092 = getelementptr inbounds i8, i8 addrspace(4)* %1042, i64 %1091
  %1093 = load i8, i8 addrspace(4)* %1092, align 1, !tbaa !9
  %1094 = zext i8 %1093 to i64
  %1095 = shl i32 %1089, 3
  %1096 = zext i32 %1095 to i64
  %1097 = shl nuw i64 %1094, %1096
  %1098 = or i64 %1097, %1090
  %1099 = add nuw nsw i32 %1089, 1
  %1100 = icmp eq i32 %1099, %1043
  br i1 %1100, label %1101, label %1088

1101:                                             ; preds = %1088, %1048, %1046
  %1102 = phi i8 addrspace(4)* [ %1087, %1048 ], [ %1042, %1046 ], [ %1042, %1088 ]
  %1103 = phi i32 [ %1086, %1048 ], [ 0, %1046 ], [ 0, %1088 ]
  %1104 = phi i64 [ %1085, %1048 ], [ 0, %1046 ], [ %1098, %1088 ]
  %1105 = icmp ugt i32 %1103, 7
  br i1 %1105, label %1108, label %1106

1106:                                             ; preds = %1101
  %1107 = icmp eq i32 %1103, 0
  br i1 %1107, label %1161, label %1148

1108:                                             ; preds = %1101
  %1109 = load i8, i8 addrspace(4)* %1102, align 1, !tbaa !9
  %1110 = zext i8 %1109 to i64
  %1111 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 1
  %1112 = load i8, i8 addrspace(4)* %1111, align 1, !tbaa !9
  %1113 = zext i8 %1112 to i64
  %1114 = shl nuw nsw i64 %1113, 8
  %1115 = or i64 %1114, %1110
  %1116 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 2
  %1117 = load i8, i8 addrspace(4)* %1116, align 1, !tbaa !9
  %1118 = zext i8 %1117 to i64
  %1119 = shl nuw nsw i64 %1118, 16
  %1120 = or i64 %1115, %1119
  %1121 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 3
  %1122 = load i8, i8 addrspace(4)* %1121, align 1, !tbaa !9
  %1123 = zext i8 %1122 to i64
  %1124 = shl nuw nsw i64 %1123, 24
  %1125 = or i64 %1120, %1124
  %1126 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 4
  %1127 = load i8, i8 addrspace(4)* %1126, align 1, !tbaa !9
  %1128 = zext i8 %1127 to i64
  %1129 = shl nuw nsw i64 %1128, 32
  %1130 = or i64 %1125, %1129
  %1131 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 5
  %1132 = load i8, i8 addrspace(4)* %1131, align 1, !tbaa !9
  %1133 = zext i8 %1132 to i64
  %1134 = shl nuw nsw i64 %1133, 40
  %1135 = or i64 %1130, %1134
  %1136 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 6
  %1137 = load i8, i8 addrspace(4)* %1136, align 1, !tbaa !9
  %1138 = zext i8 %1137 to i64
  %1139 = shl nuw nsw i64 %1138, 48
  %1140 = or i64 %1135, %1139
  %1141 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 7
  %1142 = load i8, i8 addrspace(4)* %1141, align 1, !tbaa !9
  %1143 = zext i8 %1142 to i64
  %1144 = shl nuw i64 %1143, 56
  %1145 = or i64 %1140, %1144
  %1146 = add nsw i32 %1103, -8
  %1147 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 8
  br label %1161

1148:                                             ; preds = %1106, %1148
  %1149 = phi i32 [ %1159, %1148 ], [ 0, %1106 ]
  %1150 = phi i64 [ %1158, %1148 ], [ 0, %1106 ]
  %1151 = zext i32 %1149 to i64
  %1152 = getelementptr inbounds i8, i8 addrspace(4)* %1102, i64 %1151
  %1153 = load i8, i8 addrspace(4)* %1152, align 1, !tbaa !9
  %1154 = zext i8 %1153 to i64
  %1155 = shl i32 %1149, 3
  %1156 = zext i32 %1155 to i64
  %1157 = shl nuw i64 %1154, %1156
  %1158 = or i64 %1157, %1150
  %1159 = add nuw nsw i32 %1149, 1
  %1160 = icmp eq i32 %1159, %1103
  br i1 %1160, label %1161, label %1148

1161:                                             ; preds = %1148, %1108, %1106
  %1162 = phi i8 addrspace(4)* [ %1147, %1108 ], [ %1102, %1106 ], [ %1102, %1148 ]
  %1163 = phi i32 [ %1146, %1108 ], [ 0, %1106 ], [ 0, %1148 ]
  %1164 = phi i64 [ %1145, %1108 ], [ 0, %1106 ], [ %1158, %1148 ]
  %1165 = icmp ugt i32 %1163, 7
  br i1 %1165, label %1168, label %1166

1166:                                             ; preds = %1161
  %1167 = icmp eq i32 %1163, 0
  br i1 %1167, label %1221, label %1208

1168:                                             ; preds = %1161
  %1169 = load i8, i8 addrspace(4)* %1162, align 1, !tbaa !9
  %1170 = zext i8 %1169 to i64
  %1171 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 1
  %1172 = load i8, i8 addrspace(4)* %1171, align 1, !tbaa !9
  %1173 = zext i8 %1172 to i64
  %1174 = shl nuw nsw i64 %1173, 8
  %1175 = or i64 %1174, %1170
  %1176 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 2
  %1177 = load i8, i8 addrspace(4)* %1176, align 1, !tbaa !9
  %1178 = zext i8 %1177 to i64
  %1179 = shl nuw nsw i64 %1178, 16
  %1180 = or i64 %1175, %1179
  %1181 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 3
  %1182 = load i8, i8 addrspace(4)* %1181, align 1, !tbaa !9
  %1183 = zext i8 %1182 to i64
  %1184 = shl nuw nsw i64 %1183, 24
  %1185 = or i64 %1180, %1184
  %1186 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 4
  %1187 = load i8, i8 addrspace(4)* %1186, align 1, !tbaa !9
  %1188 = zext i8 %1187 to i64
  %1189 = shl nuw nsw i64 %1188, 32
  %1190 = or i64 %1185, %1189
  %1191 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 5
  %1192 = load i8, i8 addrspace(4)* %1191, align 1, !tbaa !9
  %1193 = zext i8 %1192 to i64
  %1194 = shl nuw nsw i64 %1193, 40
  %1195 = or i64 %1190, %1194
  %1196 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 6
  %1197 = load i8, i8 addrspace(4)* %1196, align 1, !tbaa !9
  %1198 = zext i8 %1197 to i64
  %1199 = shl nuw nsw i64 %1198, 48
  %1200 = or i64 %1195, %1199
  %1201 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 7
  %1202 = load i8, i8 addrspace(4)* %1201, align 1, !tbaa !9
  %1203 = zext i8 %1202 to i64
  %1204 = shl nuw i64 %1203, 56
  %1205 = or i64 %1200, %1204
  %1206 = add nsw i32 %1163, -8
  %1207 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 8
  br label %1221

1208:                                             ; preds = %1166, %1208
  %1209 = phi i32 [ %1219, %1208 ], [ 0, %1166 ]
  %1210 = phi i64 [ %1218, %1208 ], [ 0, %1166 ]
  %1211 = zext i32 %1209 to i64
  %1212 = getelementptr inbounds i8, i8 addrspace(4)* %1162, i64 %1211
  %1213 = load i8, i8 addrspace(4)* %1212, align 1, !tbaa !9
  %1214 = zext i8 %1213 to i64
  %1215 = shl i32 %1209, 3
  %1216 = zext i32 %1215 to i64
  %1217 = shl nuw i64 %1214, %1216
  %1218 = or i64 %1217, %1210
  %1219 = add nuw nsw i32 %1209, 1
  %1220 = icmp eq i32 %1219, %1163
  br i1 %1220, label %1221, label %1208

1221:                                             ; preds = %1208, %1168, %1166
  %1222 = phi i8 addrspace(4)* [ %1207, %1168 ], [ %1162, %1166 ], [ %1162, %1208 ]
  %1223 = phi i32 [ %1206, %1168 ], [ 0, %1166 ], [ 0, %1208 ]
  %1224 = phi i64 [ %1205, %1168 ], [ 0, %1166 ], [ %1218, %1208 ]
  %1225 = icmp ugt i32 %1223, 7
  br i1 %1225, label %1228, label %1226

1226:                                             ; preds = %1221
  %1227 = icmp eq i32 %1223, 0
  br i1 %1227, label %1281, label %1268

1228:                                             ; preds = %1221
  %1229 = load i8, i8 addrspace(4)* %1222, align 1, !tbaa !9
  %1230 = zext i8 %1229 to i64
  %1231 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 1
  %1232 = load i8, i8 addrspace(4)* %1231, align 1, !tbaa !9
  %1233 = zext i8 %1232 to i64
  %1234 = shl nuw nsw i64 %1233, 8
  %1235 = or i64 %1234, %1230
  %1236 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 2
  %1237 = load i8, i8 addrspace(4)* %1236, align 1, !tbaa !9
  %1238 = zext i8 %1237 to i64
  %1239 = shl nuw nsw i64 %1238, 16
  %1240 = or i64 %1235, %1239
  %1241 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 3
  %1242 = load i8, i8 addrspace(4)* %1241, align 1, !tbaa !9
  %1243 = zext i8 %1242 to i64
  %1244 = shl nuw nsw i64 %1243, 24
  %1245 = or i64 %1240, %1244
  %1246 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 4
  %1247 = load i8, i8 addrspace(4)* %1246, align 1, !tbaa !9
  %1248 = zext i8 %1247 to i64
  %1249 = shl nuw nsw i64 %1248, 32
  %1250 = or i64 %1245, %1249
  %1251 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 5
  %1252 = load i8, i8 addrspace(4)* %1251, align 1, !tbaa !9
  %1253 = zext i8 %1252 to i64
  %1254 = shl nuw nsw i64 %1253, 40
  %1255 = or i64 %1250, %1254
  %1256 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 6
  %1257 = load i8, i8 addrspace(4)* %1256, align 1, !tbaa !9
  %1258 = zext i8 %1257 to i64
  %1259 = shl nuw nsw i64 %1258, 48
  %1260 = or i64 %1255, %1259
  %1261 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 7
  %1262 = load i8, i8 addrspace(4)* %1261, align 1, !tbaa !9
  %1263 = zext i8 %1262 to i64
  %1264 = shl nuw i64 %1263, 56
  %1265 = or i64 %1260, %1264
  %1266 = add nsw i32 %1223, -8
  %1267 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 8
  br label %1281

1268:                                             ; preds = %1226, %1268
  %1269 = phi i32 [ %1279, %1268 ], [ 0, %1226 ]
  %1270 = phi i64 [ %1278, %1268 ], [ 0, %1226 ]
  %1271 = zext i32 %1269 to i64
  %1272 = getelementptr inbounds i8, i8 addrspace(4)* %1222, i64 %1271
  %1273 = load i8, i8 addrspace(4)* %1272, align 1, !tbaa !9
  %1274 = zext i8 %1273 to i64
  %1275 = shl i32 %1269, 3
  %1276 = zext i32 %1275 to i64
  %1277 = shl nuw i64 %1274, %1276
  %1278 = or i64 %1277, %1270
  %1279 = add nuw nsw i32 %1269, 1
  %1280 = icmp eq i32 %1279, %1223
  br i1 %1280, label %1281, label %1268

1281:                                             ; preds = %1268, %1228, %1226
  %1282 = phi i8 addrspace(4)* [ %1267, %1228 ], [ %1222, %1226 ], [ %1222, %1268 ]
  %1283 = phi i32 [ %1266, %1228 ], [ 0, %1226 ], [ 0, %1268 ]
  %1284 = phi i64 [ %1265, %1228 ], [ 0, %1226 ], [ %1278, %1268 ]
  %1285 = icmp ugt i32 %1283, 7
  br i1 %1285, label %1288, label %1286

1286:                                             ; preds = %1281
  %1287 = icmp eq i32 %1283, 0
  br i1 %1287, label %1341, label %1328

1288:                                             ; preds = %1281
  %1289 = load i8, i8 addrspace(4)* %1282, align 1, !tbaa !9
  %1290 = zext i8 %1289 to i64
  %1291 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 1
  %1292 = load i8, i8 addrspace(4)* %1291, align 1, !tbaa !9
  %1293 = zext i8 %1292 to i64
  %1294 = shl nuw nsw i64 %1293, 8
  %1295 = or i64 %1294, %1290
  %1296 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 2
  %1297 = load i8, i8 addrspace(4)* %1296, align 1, !tbaa !9
  %1298 = zext i8 %1297 to i64
  %1299 = shl nuw nsw i64 %1298, 16
  %1300 = or i64 %1295, %1299
  %1301 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 3
  %1302 = load i8, i8 addrspace(4)* %1301, align 1, !tbaa !9
  %1303 = zext i8 %1302 to i64
  %1304 = shl nuw nsw i64 %1303, 24
  %1305 = or i64 %1300, %1304
  %1306 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 4
  %1307 = load i8, i8 addrspace(4)* %1306, align 1, !tbaa !9
  %1308 = zext i8 %1307 to i64
  %1309 = shl nuw nsw i64 %1308, 32
  %1310 = or i64 %1305, %1309
  %1311 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 5
  %1312 = load i8, i8 addrspace(4)* %1311, align 1, !tbaa !9
  %1313 = zext i8 %1312 to i64
  %1314 = shl nuw nsw i64 %1313, 40
  %1315 = or i64 %1310, %1314
  %1316 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 6
  %1317 = load i8, i8 addrspace(4)* %1316, align 1, !tbaa !9
  %1318 = zext i8 %1317 to i64
  %1319 = shl nuw nsw i64 %1318, 48
  %1320 = or i64 %1315, %1319
  %1321 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 7
  %1322 = load i8, i8 addrspace(4)* %1321, align 1, !tbaa !9
  %1323 = zext i8 %1322 to i64
  %1324 = shl nuw i64 %1323, 56
  %1325 = or i64 %1320, %1324
  %1326 = add nsw i32 %1283, -8
  %1327 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 8
  br label %1341

1328:                                             ; preds = %1286, %1328
  %1329 = phi i32 [ %1339, %1328 ], [ 0, %1286 ]
  %1330 = phi i64 [ %1338, %1328 ], [ 0, %1286 ]
  %1331 = zext i32 %1329 to i64
  %1332 = getelementptr inbounds i8, i8 addrspace(4)* %1282, i64 %1331
  %1333 = load i8, i8 addrspace(4)* %1332, align 1, !tbaa !9
  %1334 = zext i8 %1333 to i64
  %1335 = shl i32 %1329, 3
  %1336 = zext i32 %1335 to i64
  %1337 = shl nuw i64 %1334, %1336
  %1338 = or i64 %1337, %1330
  %1339 = add nuw nsw i32 %1329, 1
  %1340 = icmp eq i32 %1339, %1283
  br i1 %1340, label %1341, label %1328

1341:                                             ; preds = %1328, %1288, %1286
  %1342 = phi i8 addrspace(4)* [ %1327, %1288 ], [ %1282, %1286 ], [ %1282, %1328 ]
  %1343 = phi i32 [ %1326, %1288 ], [ 0, %1286 ], [ 0, %1328 ]
  %1344 = phi i64 [ %1325, %1288 ], [ 0, %1286 ], [ %1338, %1328 ]
  %1345 = icmp ugt i32 %1343, 7
  br i1 %1345, label %1348, label %1346

1346:                                             ; preds = %1341
  %1347 = icmp eq i32 %1343, 0
  br i1 %1347, label %1399, label %1386

1348:                                             ; preds = %1341
  %1349 = load i8, i8 addrspace(4)* %1342, align 1, !tbaa !9
  %1350 = zext i8 %1349 to i64
  %1351 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 1
  %1352 = load i8, i8 addrspace(4)* %1351, align 1, !tbaa !9
  %1353 = zext i8 %1352 to i64
  %1354 = shl nuw nsw i64 %1353, 8
  %1355 = or i64 %1354, %1350
  %1356 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 2
  %1357 = load i8, i8 addrspace(4)* %1356, align 1, !tbaa !9
  %1358 = zext i8 %1357 to i64
  %1359 = shl nuw nsw i64 %1358, 16
  %1360 = or i64 %1355, %1359
  %1361 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 3
  %1362 = load i8, i8 addrspace(4)* %1361, align 1, !tbaa !9
  %1363 = zext i8 %1362 to i64
  %1364 = shl nuw nsw i64 %1363, 24
  %1365 = or i64 %1360, %1364
  %1366 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 4
  %1367 = load i8, i8 addrspace(4)* %1366, align 1, !tbaa !9
  %1368 = zext i8 %1367 to i64
  %1369 = shl nuw nsw i64 %1368, 32
  %1370 = or i64 %1365, %1369
  %1371 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 5
  %1372 = load i8, i8 addrspace(4)* %1371, align 1, !tbaa !9
  %1373 = zext i8 %1372 to i64
  %1374 = shl nuw nsw i64 %1373, 40
  %1375 = or i64 %1370, %1374
  %1376 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 6
  %1377 = load i8, i8 addrspace(4)* %1376, align 1, !tbaa !9
  %1378 = zext i8 %1377 to i64
  %1379 = shl nuw nsw i64 %1378, 48
  %1380 = or i64 %1375, %1379
  %1381 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 7
  %1382 = load i8, i8 addrspace(4)* %1381, align 1, !tbaa !9
  %1383 = zext i8 %1382 to i64
  %1384 = shl nuw i64 %1383, 56
  %1385 = or i64 %1380, %1384
  br label %1399

1386:                                             ; preds = %1346, %1386
  %1387 = phi i32 [ %1397, %1386 ], [ 0, %1346 ]
  %1388 = phi i64 [ %1396, %1386 ], [ 0, %1346 ]
  %1389 = zext i32 %1387 to i64
  %1390 = getelementptr inbounds i8, i8 addrspace(4)* %1342, i64 %1389
  %1391 = load i8, i8 addrspace(4)* %1390, align 1, !tbaa !9
  %1392 = zext i8 %1391 to i64
  %1393 = shl i32 %1387, 3
  %1394 = zext i32 %1393 to i64
  %1395 = shl nuw i64 %1392, %1394
  %1396 = or i64 %1395, %1388
  %1397 = add nuw nsw i32 %1387, 1
  %1398 = icmp eq i32 %1397, %1343
  br i1 %1398, label %1399, label %1386

1399:                                             ; preds = %1386, %1348, %1346
  %1400 = phi i64 [ %1385, %1348 ], [ 0, %1346 ], [ %1396, %1386 ]
  %1401 = shl nuw nsw i64 %982, 2
  %1402 = add nuw nsw i64 %1401, 28
  %1403 = and i64 %1402, 480
  %1404 = and i64 %984, -225
  %1405 = or i64 %1404, %1403
  %1406 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1405, i64 noundef %1044, i64 noundef %1104, i64 noundef %1164, i64 noundef %1224, i64 noundef %1284, i64 noundef %1344, i64 noundef %1400) #10
  %1407 = sub i64 %974, %982
  %1408 = getelementptr inbounds i8, i8 addrspace(4)* %975, i64 %982
  %1409 = icmp eq i64 %1407, 0
  br i1 %1409, label %1410, label %973

1410:                                             ; preds = %1399, %965
  %1411 = phi <2 x i64> [ %968, %965 ], [ %1406, %1399 ]
  %1412 = extractelement <2 x i64> %1411, i64 0
  %1413 = zext i16 %944 to i64
  %1414 = and i64 %1412, -225
  %1415 = or i64 %1414, 32
  %1416 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1415, i64 noundef %1413, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1417 = extractelement <2 x i64> %1416, i64 0
  %1418 = zext i16 %951 to i64
  %1419 = and i64 %1417, -225
  %1420 = or i64 %1419, 32
  %1421 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1420, i64 noundef %1418, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1422 = extractelement <2 x i64> %1421, i64 0
  %1423 = zext i16 %958 to i64
  %1424 = and i64 %1422, -227
  %1425 = or i64 %1424, 34
  %1426 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1425, i64 noundef %1423, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1427 = udiv i32 %948, %945
  %1428 = udiv i32 %955, %952
  %1429 = udiv i32 %962, %959
  %1430 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1431 = extractelement <2 x i64> %1430, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), label %1432, label %1436

1432:                                             ; preds = %1410
  %1433 = and i64 %1431, -225
  %1434 = or i64 %1433, 32
  %1435 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1434, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1877

1436:                                             ; preds = %1410
  %1437 = and i64 %1431, 2
  %1438 = and i64 %1431, -3
  %1439 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1438, i64 0
  br label %1440

1440:                                             ; preds = %1866, %1436
  %1441 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str.3, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str.3, i64 0, i64 21) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([22 x i8]* addrspacecast ([22 x i8] addrspace(4)* @.str.3 to [22 x i8]*) to i64)), i64 1))), %1436 ], [ %1874, %1866 ]
  %1442 = phi i8 addrspace(4)* [ getelementptr inbounds ([22 x i8], [22 x i8] addrspace(4)* @.str.3, i64 0, i64 0), %1436 ], [ %1875, %1866 ]
  %1443 = phi <2 x i64> [ %1439, %1436 ], [ %1873, %1866 ]
  %1444 = icmp ugt i64 %1441, 56
  %1445 = extractelement <2 x i64> %1443, i64 0
  %1446 = or i64 %1445, %1437
  %1447 = insertelement <2 x i64> poison, i64 %1446, i64 0
  %1448 = select i1 %1444, <2 x i64> %1443, <2 x i64> %1447
  %1449 = tail call i64 @llvm.umin.i64(i64 %1441, i64 56)
  %1450 = trunc i64 %1449 to i32
  %1451 = extractelement <2 x i64> %1448, i64 0
  %1452 = icmp ugt i32 %1450, 7
  br i1 %1452, label %1455, label %1453

1453:                                             ; preds = %1440
  %1454 = icmp eq i32 %1450, 0
  br i1 %1454, label %1508, label %1495

1455:                                             ; preds = %1440
  %1456 = load i8, i8 addrspace(4)* %1442, align 1, !tbaa !9
  %1457 = zext i8 %1456 to i64
  %1458 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 1
  %1459 = load i8, i8 addrspace(4)* %1458, align 1, !tbaa !9
  %1460 = zext i8 %1459 to i64
  %1461 = shl nuw nsw i64 %1460, 8
  %1462 = or i64 %1461, %1457
  %1463 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 2
  %1464 = load i8, i8 addrspace(4)* %1463, align 1, !tbaa !9
  %1465 = zext i8 %1464 to i64
  %1466 = shl nuw nsw i64 %1465, 16
  %1467 = or i64 %1462, %1466
  %1468 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 3
  %1469 = load i8, i8 addrspace(4)* %1468, align 1, !tbaa !9
  %1470 = zext i8 %1469 to i64
  %1471 = shl nuw nsw i64 %1470, 24
  %1472 = or i64 %1467, %1471
  %1473 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 4
  %1474 = load i8, i8 addrspace(4)* %1473, align 1, !tbaa !9
  %1475 = zext i8 %1474 to i64
  %1476 = shl nuw nsw i64 %1475, 32
  %1477 = or i64 %1472, %1476
  %1478 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 5
  %1479 = load i8, i8 addrspace(4)* %1478, align 1, !tbaa !9
  %1480 = zext i8 %1479 to i64
  %1481 = shl nuw nsw i64 %1480, 40
  %1482 = or i64 %1477, %1481
  %1483 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 6
  %1484 = load i8, i8 addrspace(4)* %1483, align 1, !tbaa !9
  %1485 = zext i8 %1484 to i64
  %1486 = shl nuw nsw i64 %1485, 48
  %1487 = or i64 %1482, %1486
  %1488 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 7
  %1489 = load i8, i8 addrspace(4)* %1488, align 1, !tbaa !9
  %1490 = zext i8 %1489 to i64
  %1491 = shl nuw i64 %1490, 56
  %1492 = or i64 %1487, %1491
  %1493 = add nsw i32 %1450, -8
  %1494 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 8
  br label %1508

1495:                                             ; preds = %1453, %1495
  %1496 = phi i32 [ %1506, %1495 ], [ 0, %1453 ]
  %1497 = phi i64 [ %1505, %1495 ], [ 0, %1453 ]
  %1498 = zext i32 %1496 to i64
  %1499 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 %1498
  %1500 = load i8, i8 addrspace(4)* %1499, align 1, !tbaa !9
  %1501 = zext i8 %1500 to i64
  %1502 = shl i32 %1496, 3
  %1503 = zext i32 %1502 to i64
  %1504 = shl nuw i64 %1501, %1503
  %1505 = or i64 %1504, %1497
  %1506 = add nuw nsw i32 %1496, 1
  %1507 = icmp eq i32 %1506, %1450
  br i1 %1507, label %1508, label %1495, !llvm.loop !10

1508:                                             ; preds = %1495, %1455, %1453
  %1509 = phi i8 addrspace(4)* [ %1494, %1455 ], [ %1442, %1453 ], [ %1442, %1495 ]
  %1510 = phi i32 [ %1493, %1455 ], [ 0, %1453 ], [ 0, %1495 ]
  %1511 = phi i64 [ %1492, %1455 ], [ 0, %1453 ], [ %1505, %1495 ]
  %1512 = icmp ugt i32 %1510, 7
  br i1 %1512, label %1515, label %1513

1513:                                             ; preds = %1508
  %1514 = icmp eq i32 %1510, 0
  br i1 %1514, label %1568, label %1555

1515:                                             ; preds = %1508
  %1516 = load i8, i8 addrspace(4)* %1509, align 1, !tbaa !9
  %1517 = zext i8 %1516 to i64
  %1518 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 1
  %1519 = load i8, i8 addrspace(4)* %1518, align 1, !tbaa !9
  %1520 = zext i8 %1519 to i64
  %1521 = shl nuw nsw i64 %1520, 8
  %1522 = or i64 %1521, %1517
  %1523 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 2
  %1524 = load i8, i8 addrspace(4)* %1523, align 1, !tbaa !9
  %1525 = zext i8 %1524 to i64
  %1526 = shl nuw nsw i64 %1525, 16
  %1527 = or i64 %1522, %1526
  %1528 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 3
  %1529 = load i8, i8 addrspace(4)* %1528, align 1, !tbaa !9
  %1530 = zext i8 %1529 to i64
  %1531 = shl nuw nsw i64 %1530, 24
  %1532 = or i64 %1527, %1531
  %1533 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 4
  %1534 = load i8, i8 addrspace(4)* %1533, align 1, !tbaa !9
  %1535 = zext i8 %1534 to i64
  %1536 = shl nuw nsw i64 %1535, 32
  %1537 = or i64 %1532, %1536
  %1538 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 5
  %1539 = load i8, i8 addrspace(4)* %1538, align 1, !tbaa !9
  %1540 = zext i8 %1539 to i64
  %1541 = shl nuw nsw i64 %1540, 40
  %1542 = or i64 %1537, %1541
  %1543 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 6
  %1544 = load i8, i8 addrspace(4)* %1543, align 1, !tbaa !9
  %1545 = zext i8 %1544 to i64
  %1546 = shl nuw nsw i64 %1545, 48
  %1547 = or i64 %1542, %1546
  %1548 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 7
  %1549 = load i8, i8 addrspace(4)* %1548, align 1, !tbaa !9
  %1550 = zext i8 %1549 to i64
  %1551 = shl nuw i64 %1550, 56
  %1552 = or i64 %1547, %1551
  %1553 = add nsw i32 %1510, -8
  %1554 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 8
  br label %1568

1555:                                             ; preds = %1513, %1555
  %1556 = phi i32 [ %1566, %1555 ], [ 0, %1513 ]
  %1557 = phi i64 [ %1565, %1555 ], [ 0, %1513 ]
  %1558 = zext i32 %1556 to i64
  %1559 = getelementptr inbounds i8, i8 addrspace(4)* %1509, i64 %1558
  %1560 = load i8, i8 addrspace(4)* %1559, align 1, !tbaa !9
  %1561 = zext i8 %1560 to i64
  %1562 = shl i32 %1556, 3
  %1563 = zext i32 %1562 to i64
  %1564 = shl nuw i64 %1561, %1563
  %1565 = or i64 %1564, %1557
  %1566 = add nuw nsw i32 %1556, 1
  %1567 = icmp eq i32 %1566, %1510
  br i1 %1567, label %1568, label %1555

1568:                                             ; preds = %1555, %1515, %1513
  %1569 = phi i8 addrspace(4)* [ %1554, %1515 ], [ %1509, %1513 ], [ %1509, %1555 ]
  %1570 = phi i32 [ %1553, %1515 ], [ 0, %1513 ], [ 0, %1555 ]
  %1571 = phi i64 [ %1552, %1515 ], [ 0, %1513 ], [ %1565, %1555 ]
  %1572 = icmp ugt i32 %1570, 7
  br i1 %1572, label %1575, label %1573

1573:                                             ; preds = %1568
  %1574 = icmp eq i32 %1570, 0
  br i1 %1574, label %1628, label %1615

1575:                                             ; preds = %1568
  %1576 = load i8, i8 addrspace(4)* %1569, align 1, !tbaa !9
  %1577 = zext i8 %1576 to i64
  %1578 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 1
  %1579 = load i8, i8 addrspace(4)* %1578, align 1, !tbaa !9
  %1580 = zext i8 %1579 to i64
  %1581 = shl nuw nsw i64 %1580, 8
  %1582 = or i64 %1581, %1577
  %1583 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 2
  %1584 = load i8, i8 addrspace(4)* %1583, align 1, !tbaa !9
  %1585 = zext i8 %1584 to i64
  %1586 = shl nuw nsw i64 %1585, 16
  %1587 = or i64 %1582, %1586
  %1588 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 3
  %1589 = load i8, i8 addrspace(4)* %1588, align 1, !tbaa !9
  %1590 = zext i8 %1589 to i64
  %1591 = shl nuw nsw i64 %1590, 24
  %1592 = or i64 %1587, %1591
  %1593 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 4
  %1594 = load i8, i8 addrspace(4)* %1593, align 1, !tbaa !9
  %1595 = zext i8 %1594 to i64
  %1596 = shl nuw nsw i64 %1595, 32
  %1597 = or i64 %1592, %1596
  %1598 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 5
  %1599 = load i8, i8 addrspace(4)* %1598, align 1, !tbaa !9
  %1600 = zext i8 %1599 to i64
  %1601 = shl nuw nsw i64 %1600, 40
  %1602 = or i64 %1597, %1601
  %1603 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 6
  %1604 = load i8, i8 addrspace(4)* %1603, align 1, !tbaa !9
  %1605 = zext i8 %1604 to i64
  %1606 = shl nuw nsw i64 %1605, 48
  %1607 = or i64 %1602, %1606
  %1608 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 7
  %1609 = load i8, i8 addrspace(4)* %1608, align 1, !tbaa !9
  %1610 = zext i8 %1609 to i64
  %1611 = shl nuw i64 %1610, 56
  %1612 = or i64 %1607, %1611
  %1613 = add nsw i32 %1570, -8
  %1614 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 8
  br label %1628

1615:                                             ; preds = %1573, %1615
  %1616 = phi i32 [ %1626, %1615 ], [ 0, %1573 ]
  %1617 = phi i64 [ %1625, %1615 ], [ 0, %1573 ]
  %1618 = zext i32 %1616 to i64
  %1619 = getelementptr inbounds i8, i8 addrspace(4)* %1569, i64 %1618
  %1620 = load i8, i8 addrspace(4)* %1619, align 1, !tbaa !9
  %1621 = zext i8 %1620 to i64
  %1622 = shl i32 %1616, 3
  %1623 = zext i32 %1622 to i64
  %1624 = shl nuw i64 %1621, %1623
  %1625 = or i64 %1624, %1617
  %1626 = add nuw nsw i32 %1616, 1
  %1627 = icmp eq i32 %1626, %1570
  br i1 %1627, label %1628, label %1615

1628:                                             ; preds = %1615, %1575, %1573
  %1629 = phi i8 addrspace(4)* [ %1614, %1575 ], [ %1569, %1573 ], [ %1569, %1615 ]
  %1630 = phi i32 [ %1613, %1575 ], [ 0, %1573 ], [ 0, %1615 ]
  %1631 = phi i64 [ %1612, %1575 ], [ 0, %1573 ], [ %1625, %1615 ]
  %1632 = icmp ugt i32 %1630, 7
  br i1 %1632, label %1635, label %1633

1633:                                             ; preds = %1628
  %1634 = icmp eq i32 %1630, 0
  br i1 %1634, label %1688, label %1675

1635:                                             ; preds = %1628
  %1636 = load i8, i8 addrspace(4)* %1629, align 1, !tbaa !9
  %1637 = zext i8 %1636 to i64
  %1638 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 1
  %1639 = load i8, i8 addrspace(4)* %1638, align 1, !tbaa !9
  %1640 = zext i8 %1639 to i64
  %1641 = shl nuw nsw i64 %1640, 8
  %1642 = or i64 %1641, %1637
  %1643 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 2
  %1644 = load i8, i8 addrspace(4)* %1643, align 1, !tbaa !9
  %1645 = zext i8 %1644 to i64
  %1646 = shl nuw nsw i64 %1645, 16
  %1647 = or i64 %1642, %1646
  %1648 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 3
  %1649 = load i8, i8 addrspace(4)* %1648, align 1, !tbaa !9
  %1650 = zext i8 %1649 to i64
  %1651 = shl nuw nsw i64 %1650, 24
  %1652 = or i64 %1647, %1651
  %1653 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 4
  %1654 = load i8, i8 addrspace(4)* %1653, align 1, !tbaa !9
  %1655 = zext i8 %1654 to i64
  %1656 = shl nuw nsw i64 %1655, 32
  %1657 = or i64 %1652, %1656
  %1658 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 5
  %1659 = load i8, i8 addrspace(4)* %1658, align 1, !tbaa !9
  %1660 = zext i8 %1659 to i64
  %1661 = shl nuw nsw i64 %1660, 40
  %1662 = or i64 %1657, %1661
  %1663 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 6
  %1664 = load i8, i8 addrspace(4)* %1663, align 1, !tbaa !9
  %1665 = zext i8 %1664 to i64
  %1666 = shl nuw nsw i64 %1665, 48
  %1667 = or i64 %1662, %1666
  %1668 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 7
  %1669 = load i8, i8 addrspace(4)* %1668, align 1, !tbaa !9
  %1670 = zext i8 %1669 to i64
  %1671 = shl nuw i64 %1670, 56
  %1672 = or i64 %1667, %1671
  %1673 = add nsw i32 %1630, -8
  %1674 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 8
  br label %1688

1675:                                             ; preds = %1633, %1675
  %1676 = phi i32 [ %1686, %1675 ], [ 0, %1633 ]
  %1677 = phi i64 [ %1685, %1675 ], [ 0, %1633 ]
  %1678 = zext i32 %1676 to i64
  %1679 = getelementptr inbounds i8, i8 addrspace(4)* %1629, i64 %1678
  %1680 = load i8, i8 addrspace(4)* %1679, align 1, !tbaa !9
  %1681 = zext i8 %1680 to i64
  %1682 = shl i32 %1676, 3
  %1683 = zext i32 %1682 to i64
  %1684 = shl nuw i64 %1681, %1683
  %1685 = or i64 %1684, %1677
  %1686 = add nuw nsw i32 %1676, 1
  %1687 = icmp eq i32 %1686, %1630
  br i1 %1687, label %1688, label %1675

1688:                                             ; preds = %1675, %1635, %1633
  %1689 = phi i8 addrspace(4)* [ %1674, %1635 ], [ %1629, %1633 ], [ %1629, %1675 ]
  %1690 = phi i32 [ %1673, %1635 ], [ 0, %1633 ], [ 0, %1675 ]
  %1691 = phi i64 [ %1672, %1635 ], [ 0, %1633 ], [ %1685, %1675 ]
  %1692 = icmp ugt i32 %1690, 7
  br i1 %1692, label %1695, label %1693

1693:                                             ; preds = %1688
  %1694 = icmp eq i32 %1690, 0
  br i1 %1694, label %1748, label %1735

1695:                                             ; preds = %1688
  %1696 = load i8, i8 addrspace(4)* %1689, align 1, !tbaa !9
  %1697 = zext i8 %1696 to i64
  %1698 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 1
  %1699 = load i8, i8 addrspace(4)* %1698, align 1, !tbaa !9
  %1700 = zext i8 %1699 to i64
  %1701 = shl nuw nsw i64 %1700, 8
  %1702 = or i64 %1701, %1697
  %1703 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 2
  %1704 = load i8, i8 addrspace(4)* %1703, align 1, !tbaa !9
  %1705 = zext i8 %1704 to i64
  %1706 = shl nuw nsw i64 %1705, 16
  %1707 = or i64 %1702, %1706
  %1708 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 3
  %1709 = load i8, i8 addrspace(4)* %1708, align 1, !tbaa !9
  %1710 = zext i8 %1709 to i64
  %1711 = shl nuw nsw i64 %1710, 24
  %1712 = or i64 %1707, %1711
  %1713 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 4
  %1714 = load i8, i8 addrspace(4)* %1713, align 1, !tbaa !9
  %1715 = zext i8 %1714 to i64
  %1716 = shl nuw nsw i64 %1715, 32
  %1717 = or i64 %1712, %1716
  %1718 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 5
  %1719 = load i8, i8 addrspace(4)* %1718, align 1, !tbaa !9
  %1720 = zext i8 %1719 to i64
  %1721 = shl nuw nsw i64 %1720, 40
  %1722 = or i64 %1717, %1721
  %1723 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 6
  %1724 = load i8, i8 addrspace(4)* %1723, align 1, !tbaa !9
  %1725 = zext i8 %1724 to i64
  %1726 = shl nuw nsw i64 %1725, 48
  %1727 = or i64 %1722, %1726
  %1728 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 7
  %1729 = load i8, i8 addrspace(4)* %1728, align 1, !tbaa !9
  %1730 = zext i8 %1729 to i64
  %1731 = shl nuw i64 %1730, 56
  %1732 = or i64 %1727, %1731
  %1733 = add nsw i32 %1690, -8
  %1734 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 8
  br label %1748

1735:                                             ; preds = %1693, %1735
  %1736 = phi i32 [ %1746, %1735 ], [ 0, %1693 ]
  %1737 = phi i64 [ %1745, %1735 ], [ 0, %1693 ]
  %1738 = zext i32 %1736 to i64
  %1739 = getelementptr inbounds i8, i8 addrspace(4)* %1689, i64 %1738
  %1740 = load i8, i8 addrspace(4)* %1739, align 1, !tbaa !9
  %1741 = zext i8 %1740 to i64
  %1742 = shl i32 %1736, 3
  %1743 = zext i32 %1742 to i64
  %1744 = shl nuw i64 %1741, %1743
  %1745 = or i64 %1744, %1737
  %1746 = add nuw nsw i32 %1736, 1
  %1747 = icmp eq i32 %1746, %1690
  br i1 %1747, label %1748, label %1735

1748:                                             ; preds = %1735, %1695, %1693
  %1749 = phi i8 addrspace(4)* [ %1734, %1695 ], [ %1689, %1693 ], [ %1689, %1735 ]
  %1750 = phi i32 [ %1733, %1695 ], [ 0, %1693 ], [ 0, %1735 ]
  %1751 = phi i64 [ %1732, %1695 ], [ 0, %1693 ], [ %1745, %1735 ]
  %1752 = icmp ugt i32 %1750, 7
  br i1 %1752, label %1755, label %1753

1753:                                             ; preds = %1748
  %1754 = icmp eq i32 %1750, 0
  br i1 %1754, label %1808, label %1795

1755:                                             ; preds = %1748
  %1756 = load i8, i8 addrspace(4)* %1749, align 1, !tbaa !9
  %1757 = zext i8 %1756 to i64
  %1758 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 1
  %1759 = load i8, i8 addrspace(4)* %1758, align 1, !tbaa !9
  %1760 = zext i8 %1759 to i64
  %1761 = shl nuw nsw i64 %1760, 8
  %1762 = or i64 %1761, %1757
  %1763 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 2
  %1764 = load i8, i8 addrspace(4)* %1763, align 1, !tbaa !9
  %1765 = zext i8 %1764 to i64
  %1766 = shl nuw nsw i64 %1765, 16
  %1767 = or i64 %1762, %1766
  %1768 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 3
  %1769 = load i8, i8 addrspace(4)* %1768, align 1, !tbaa !9
  %1770 = zext i8 %1769 to i64
  %1771 = shl nuw nsw i64 %1770, 24
  %1772 = or i64 %1767, %1771
  %1773 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 4
  %1774 = load i8, i8 addrspace(4)* %1773, align 1, !tbaa !9
  %1775 = zext i8 %1774 to i64
  %1776 = shl nuw nsw i64 %1775, 32
  %1777 = or i64 %1772, %1776
  %1778 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 5
  %1779 = load i8, i8 addrspace(4)* %1778, align 1, !tbaa !9
  %1780 = zext i8 %1779 to i64
  %1781 = shl nuw nsw i64 %1780, 40
  %1782 = or i64 %1777, %1781
  %1783 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 6
  %1784 = load i8, i8 addrspace(4)* %1783, align 1, !tbaa !9
  %1785 = zext i8 %1784 to i64
  %1786 = shl nuw nsw i64 %1785, 48
  %1787 = or i64 %1782, %1786
  %1788 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 7
  %1789 = load i8, i8 addrspace(4)* %1788, align 1, !tbaa !9
  %1790 = zext i8 %1789 to i64
  %1791 = shl nuw i64 %1790, 56
  %1792 = or i64 %1787, %1791
  %1793 = add nsw i32 %1750, -8
  %1794 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 8
  br label %1808

1795:                                             ; preds = %1753, %1795
  %1796 = phi i32 [ %1806, %1795 ], [ 0, %1753 ]
  %1797 = phi i64 [ %1805, %1795 ], [ 0, %1753 ]
  %1798 = zext i32 %1796 to i64
  %1799 = getelementptr inbounds i8, i8 addrspace(4)* %1749, i64 %1798
  %1800 = load i8, i8 addrspace(4)* %1799, align 1, !tbaa !9
  %1801 = zext i8 %1800 to i64
  %1802 = shl i32 %1796, 3
  %1803 = zext i32 %1802 to i64
  %1804 = shl nuw i64 %1801, %1803
  %1805 = or i64 %1804, %1797
  %1806 = add nuw nsw i32 %1796, 1
  %1807 = icmp eq i32 %1806, %1750
  br i1 %1807, label %1808, label %1795

1808:                                             ; preds = %1795, %1755, %1753
  %1809 = phi i8 addrspace(4)* [ %1794, %1755 ], [ %1749, %1753 ], [ %1749, %1795 ]
  %1810 = phi i32 [ %1793, %1755 ], [ 0, %1753 ], [ 0, %1795 ]
  %1811 = phi i64 [ %1792, %1755 ], [ 0, %1753 ], [ %1805, %1795 ]
  %1812 = icmp ugt i32 %1810, 7
  br i1 %1812, label %1815, label %1813

1813:                                             ; preds = %1808
  %1814 = icmp eq i32 %1810, 0
  br i1 %1814, label %1866, label %1853

1815:                                             ; preds = %1808
  %1816 = load i8, i8 addrspace(4)* %1809, align 1, !tbaa !9
  %1817 = zext i8 %1816 to i64
  %1818 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 1
  %1819 = load i8, i8 addrspace(4)* %1818, align 1, !tbaa !9
  %1820 = zext i8 %1819 to i64
  %1821 = shl nuw nsw i64 %1820, 8
  %1822 = or i64 %1821, %1817
  %1823 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 2
  %1824 = load i8, i8 addrspace(4)* %1823, align 1, !tbaa !9
  %1825 = zext i8 %1824 to i64
  %1826 = shl nuw nsw i64 %1825, 16
  %1827 = or i64 %1822, %1826
  %1828 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 3
  %1829 = load i8, i8 addrspace(4)* %1828, align 1, !tbaa !9
  %1830 = zext i8 %1829 to i64
  %1831 = shl nuw nsw i64 %1830, 24
  %1832 = or i64 %1827, %1831
  %1833 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 4
  %1834 = load i8, i8 addrspace(4)* %1833, align 1, !tbaa !9
  %1835 = zext i8 %1834 to i64
  %1836 = shl nuw nsw i64 %1835, 32
  %1837 = or i64 %1832, %1836
  %1838 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 5
  %1839 = load i8, i8 addrspace(4)* %1838, align 1, !tbaa !9
  %1840 = zext i8 %1839 to i64
  %1841 = shl nuw nsw i64 %1840, 40
  %1842 = or i64 %1837, %1841
  %1843 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 6
  %1844 = load i8, i8 addrspace(4)* %1843, align 1, !tbaa !9
  %1845 = zext i8 %1844 to i64
  %1846 = shl nuw nsw i64 %1845, 48
  %1847 = or i64 %1842, %1846
  %1848 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 7
  %1849 = load i8, i8 addrspace(4)* %1848, align 1, !tbaa !9
  %1850 = zext i8 %1849 to i64
  %1851 = shl nuw i64 %1850, 56
  %1852 = or i64 %1847, %1851
  br label %1866

1853:                                             ; preds = %1813, %1853
  %1854 = phi i32 [ %1864, %1853 ], [ 0, %1813 ]
  %1855 = phi i64 [ %1863, %1853 ], [ 0, %1813 ]
  %1856 = zext i32 %1854 to i64
  %1857 = getelementptr inbounds i8, i8 addrspace(4)* %1809, i64 %1856
  %1858 = load i8, i8 addrspace(4)* %1857, align 1, !tbaa !9
  %1859 = zext i8 %1858 to i64
  %1860 = shl i32 %1854, 3
  %1861 = zext i32 %1860 to i64
  %1862 = shl nuw i64 %1859, %1861
  %1863 = or i64 %1862, %1855
  %1864 = add nuw nsw i32 %1854, 1
  %1865 = icmp eq i32 %1864, %1810
  br i1 %1865, label %1866, label %1853

1866:                                             ; preds = %1853, %1815, %1813
  %1867 = phi i64 [ %1852, %1815 ], [ 0, %1813 ], [ %1863, %1853 ]
  %1868 = shl nuw nsw i64 %1449, 2
  %1869 = add nuw nsw i64 %1868, 28
  %1870 = and i64 %1869, 480
  %1871 = and i64 %1451, -225
  %1872 = or i64 %1871, %1870
  %1873 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1872, i64 noundef %1511, i64 noundef %1571, i64 noundef %1631, i64 noundef %1691, i64 noundef %1751, i64 noundef %1811, i64 noundef %1867) #10
  %1874 = sub i64 %1441, %1449
  %1875 = getelementptr inbounds i8, i8 addrspace(4)* %1442, i64 %1449
  %1876 = icmp eq i64 %1874, 0
  br i1 %1876, label %1877, label %1440

1877:                                             ; preds = %1866, %1432
  %1878 = phi <2 x i64> [ %1435, %1432 ], [ %1873, %1866 ]
  %1879 = mul i32 %1429, %959
  %1880 = icmp ugt i32 %962, %1879
  %1881 = zext i1 %1880 to i32
  %1882 = add i32 %1429, %1881
  %1883 = mul i32 %1428, %952
  %1884 = icmp ugt i32 %955, %1883
  %1885 = zext i1 %1884 to i32
  %1886 = add i32 %1428, %1885
  %1887 = mul i32 %1427, %945
  %1888 = icmp ugt i32 %948, %1887
  %1889 = zext i1 %1888 to i32
  %1890 = add i32 %1427, %1889
  %1891 = extractelement <2 x i64> %1878, i64 0
  %1892 = zext i32 %1890 to i64
  %1893 = and i64 %1891, -225
  %1894 = or i64 %1893, 32
  %1895 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1894, i64 noundef %1892, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1896 = extractelement <2 x i64> %1895, i64 0
  %1897 = zext i32 %1886 to i64
  %1898 = and i64 %1896, -225
  %1899 = or i64 %1898, 32
  %1900 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1899, i64 noundef %1897, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1901 = extractelement <2 x i64> %1900, i64 0
  %1902 = zext i32 %1882 to i64
  %1903 = and i64 %1901, -227
  %1904 = or i64 %1903, 34
  %1905 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1904, i64 noundef %1902, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !5
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !5
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !5
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !5
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !5
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !5
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !5
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !5
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !5
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !5
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !5
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !9
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !22
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !5
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
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{i16 1, i16 1025}
!13 = !{}
!14 = !{!15, !17, i64 12}
!15 = !{!"hsa_kernel_dispatch_packet_s", !16, i64 0, !16, i64 2, !16, i64 4, !16, i64 6, !16, i64 8, !16, i64 10, !17, i64 12, !17, i64 16, !17, i64 20, !17, i64 24, !17, i64 28, !6, i64 32, !18, i64 40, !6, i64 48, !19, i64 56}
!16 = !{!"short", !7, i64 0}
!17 = !{!"int", !7, i64 0}
!18 = !{!"any pointer", !7, i64 0}
!19 = !{!"hsa_signal_s", !6, i64 0}
!20 = !{!15, !17, i64 16}
!21 = !{!15, !17, i64 20}
!22 = !{!18, !18, i64 0}
!23 = !{!17, !17, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !18, i64 0}
!26 = !{!"", !18, i64 0, !18, i64 8, !19, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!27 = !{!26, !6, i64 40}
!28 = !{!26, !18, i64 8}
!29 = !{!"exec"}
!30 = !{!31, !17, i64 16}
!31 = !{!"", !6, i64 0, !6, i64 8, !17, i64 16, !17, i64 20}
!32 = !{!31, !6, i64 8}
!33 = !{!31, !17, i64 20}
!34 = !{!31, !6, i64 0}
!35 = !{!36, !6, i64 16}
!36 = !{!"amd_signal_s", !6, i64 0, !7, i64 8, !6, i64 16, !17, i64 24, !17, i64 28, !6, i64 32, !6, i64 40, !7, i64 48, !7, i64 56}
!37 = !{!36, !17, i64 24}
