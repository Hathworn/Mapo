; ModuleID = '../data/hip_kernels/3541/0/main.cu'
source_filename = "../data/hip_kernels/3541/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [5 x i8] c" %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [15 x i8] c" %d %d  %d %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z13binary_searchPiS_Pbi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 24
  %16 = bitcast i8 addrspace(4)* %15 to i64 addrspace(4)*
  %17 = load i64, i64 addrspace(4)* %16, align 8, !tbaa !7
  %18 = inttoptr i64 %17 to i8 addrspace(1)*
  %19 = addrspacecast i8 addrspace(1)* %18 to i8*
  %20 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %21 = extractelement <2 x i64> %20, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %22, label %26

22:                                               ; preds = %4
  %23 = and i64 %21, -225
  %24 = or i64 %23, 32
  %25 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %24, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %467

26:                                               ; preds = %4
  %27 = and i64 %21, 2
  %28 = and i64 %21, -3
  %29 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %28, i64 0
  br label %30

30:                                               ; preds = %456, %26
  %31 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str, i64 0, i64 4) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([5 x i8]* addrspacecast ([5 x i8] addrspace(4)* @.str to [5 x i8]*) to i64)), i64 1))), %26 ], [ %464, %456 ]
  %32 = phi i8 addrspace(4)* [ getelementptr inbounds ([5 x i8], [5 x i8] addrspace(4)* @.str, i64 0, i64 0), %26 ], [ %465, %456 ]
  %33 = phi <2 x i64> [ %29, %26 ], [ %463, %456 ]
  %34 = icmp ugt i64 %31, 56
  %35 = extractelement <2 x i64> %33, i64 0
  %36 = or i64 %35, %27
  %37 = insertelement <2 x i64> poison, i64 %36, i64 0
  %38 = select i1 %34, <2 x i64> %33, <2 x i64> %37
  %39 = tail call i64 @llvm.umin.i64(i64 %31, i64 56)
  %40 = trunc i64 %39 to i32
  %41 = extractelement <2 x i64> %38, i64 0
  %42 = icmp ugt i32 %40, 7
  br i1 %42, label %45, label %43

43:                                               ; preds = %30
  %44 = icmp eq i32 %40, 0
  br i1 %44, label %98, label %85

45:                                               ; preds = %30
  %46 = load i8, i8 addrspace(4)* %32, align 1, !tbaa !11
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 1
  %49 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !11
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 8
  %52 = or i64 %51, %47
  %53 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 2
  %54 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !11
  %55 = zext i8 %54 to i64
  %56 = shl nuw nsw i64 %55, 16
  %57 = or i64 %52, %56
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 3
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !11
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 24
  %62 = or i64 %57, %61
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 4
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !11
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 32
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 5
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !11
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 40
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 6
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !11
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 48
  %77 = or i64 %72, %76
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 7
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !11
  %80 = zext i8 %79 to i64
  %81 = shl nuw i64 %80, 56
  %82 = or i64 %77, %81
  %83 = add nsw i32 %40, -8
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 8
  br label %98

85:                                               ; preds = %43, %85
  %86 = phi i32 [ %96, %85 ], [ 0, %43 ]
  %87 = phi i64 [ %95, %85 ], [ 0, %43 ]
  %88 = zext i32 %86 to i64
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 %88
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !11
  %91 = zext i8 %90 to i64
  %92 = shl i32 %86, 3
  %93 = zext i32 %92 to i64
  %94 = shl nuw i64 %91, %93
  %95 = or i64 %94, %87
  %96 = add nuw nsw i32 %86, 1
  %97 = icmp eq i32 %96, %40
  br i1 %97, label %98, label %85, !llvm.loop !12

98:                                               ; preds = %85, %45, %43
  %99 = phi i8 addrspace(4)* [ %84, %45 ], [ %32, %43 ], [ %32, %85 ]
  %100 = phi i32 [ %83, %45 ], [ 0, %43 ], [ 0, %85 ]
  %101 = phi i64 [ %82, %45 ], [ 0, %43 ], [ %95, %85 ]
  %102 = icmp ugt i32 %100, 7
  br i1 %102, label %105, label %103

103:                                              ; preds = %98
  %104 = icmp eq i32 %100, 0
  br i1 %104, label %158, label %145

105:                                              ; preds = %98
  %106 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !11
  %107 = zext i8 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 1
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !11
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 8
  %112 = or i64 %111, %107
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 2
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !11
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 16
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 3
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !11
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 24
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 4
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !11
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 32
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 5
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !11
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 40
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 6
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !11
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 48
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 7
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !11
  %140 = zext i8 %139 to i64
  %141 = shl nuw i64 %140, 56
  %142 = or i64 %137, %141
  %143 = add nsw i32 %100, -8
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 8
  br label %158

145:                                              ; preds = %103, %145
  %146 = phi i32 [ %156, %145 ], [ 0, %103 ]
  %147 = phi i64 [ %155, %145 ], [ 0, %103 ]
  %148 = zext i32 %146 to i64
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 %148
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !11
  %151 = zext i8 %150 to i64
  %152 = shl i32 %146, 3
  %153 = zext i32 %152 to i64
  %154 = shl nuw i64 %151, %153
  %155 = or i64 %154, %147
  %156 = add nuw nsw i32 %146, 1
  %157 = icmp eq i32 %156, %100
  br i1 %157, label %158, label %145

158:                                              ; preds = %145, %105, %103
  %159 = phi i8 addrspace(4)* [ %144, %105 ], [ %99, %103 ], [ %99, %145 ]
  %160 = phi i32 [ %143, %105 ], [ 0, %103 ], [ 0, %145 ]
  %161 = phi i64 [ %142, %105 ], [ 0, %103 ], [ %155, %145 ]
  %162 = icmp ugt i32 %160, 7
  br i1 %162, label %165, label %163

163:                                              ; preds = %158
  %164 = icmp eq i32 %160, 0
  br i1 %164, label %218, label %205

165:                                              ; preds = %158
  %166 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !11
  %167 = zext i8 %166 to i64
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 1
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !11
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 8
  %172 = or i64 %171, %167
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 2
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !11
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 16
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 3
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !11
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 24
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 4
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !11
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 32
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 5
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !11
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 40
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 6
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !11
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 48
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 7
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !11
  %200 = zext i8 %199 to i64
  %201 = shl nuw i64 %200, 56
  %202 = or i64 %197, %201
  %203 = add nsw i32 %160, -8
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 8
  br label %218

205:                                              ; preds = %163, %205
  %206 = phi i32 [ %216, %205 ], [ 0, %163 ]
  %207 = phi i64 [ %215, %205 ], [ 0, %163 ]
  %208 = zext i32 %206 to i64
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 %208
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !11
  %211 = zext i8 %210 to i64
  %212 = shl i32 %206, 3
  %213 = zext i32 %212 to i64
  %214 = shl nuw i64 %211, %213
  %215 = or i64 %214, %207
  %216 = add nuw nsw i32 %206, 1
  %217 = icmp eq i32 %216, %160
  br i1 %217, label %218, label %205

218:                                              ; preds = %205, %165, %163
  %219 = phi i8 addrspace(4)* [ %204, %165 ], [ %159, %163 ], [ %159, %205 ]
  %220 = phi i32 [ %203, %165 ], [ 0, %163 ], [ 0, %205 ]
  %221 = phi i64 [ %202, %165 ], [ 0, %163 ], [ %215, %205 ]
  %222 = icmp ugt i32 %220, 7
  br i1 %222, label %225, label %223

223:                                              ; preds = %218
  %224 = icmp eq i32 %220, 0
  br i1 %224, label %278, label %265

225:                                              ; preds = %218
  %226 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !11
  %227 = zext i8 %226 to i64
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 1
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !11
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 8
  %232 = or i64 %231, %227
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 2
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !11
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 16
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 3
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !11
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 24
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 4
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !11
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 32
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 5
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !11
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 40
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 6
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !11
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 48
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 7
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !11
  %260 = zext i8 %259 to i64
  %261 = shl nuw i64 %260, 56
  %262 = or i64 %257, %261
  %263 = add nsw i32 %220, -8
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 8
  br label %278

265:                                              ; preds = %223, %265
  %266 = phi i32 [ %276, %265 ], [ 0, %223 ]
  %267 = phi i64 [ %275, %265 ], [ 0, %223 ]
  %268 = zext i32 %266 to i64
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 %268
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !11
  %271 = zext i8 %270 to i64
  %272 = shl i32 %266, 3
  %273 = zext i32 %272 to i64
  %274 = shl nuw i64 %271, %273
  %275 = or i64 %274, %267
  %276 = add nuw nsw i32 %266, 1
  %277 = icmp eq i32 %276, %220
  br i1 %277, label %278, label %265

278:                                              ; preds = %265, %225, %223
  %279 = phi i8 addrspace(4)* [ %264, %225 ], [ %219, %223 ], [ %219, %265 ]
  %280 = phi i32 [ %263, %225 ], [ 0, %223 ], [ 0, %265 ]
  %281 = phi i64 [ %262, %225 ], [ 0, %223 ], [ %275, %265 ]
  %282 = icmp ugt i32 %280, 7
  br i1 %282, label %285, label %283

283:                                              ; preds = %278
  %284 = icmp eq i32 %280, 0
  br i1 %284, label %338, label %325

285:                                              ; preds = %278
  %286 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !11
  %287 = zext i8 %286 to i64
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 1
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !11
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 8
  %292 = or i64 %291, %287
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 2
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !11
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 16
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 3
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !11
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 24
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 4
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !11
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 32
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 5
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !11
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 40
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 6
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !11
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 48
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 7
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !11
  %320 = zext i8 %319 to i64
  %321 = shl nuw i64 %320, 56
  %322 = or i64 %317, %321
  %323 = add nsw i32 %280, -8
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 8
  br label %338

325:                                              ; preds = %283, %325
  %326 = phi i32 [ %336, %325 ], [ 0, %283 ]
  %327 = phi i64 [ %335, %325 ], [ 0, %283 ]
  %328 = zext i32 %326 to i64
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 %328
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !11
  %331 = zext i8 %330 to i64
  %332 = shl i32 %326, 3
  %333 = zext i32 %332 to i64
  %334 = shl nuw i64 %331, %333
  %335 = or i64 %334, %327
  %336 = add nuw nsw i32 %326, 1
  %337 = icmp eq i32 %336, %280
  br i1 %337, label %338, label %325

338:                                              ; preds = %325, %285, %283
  %339 = phi i8 addrspace(4)* [ %324, %285 ], [ %279, %283 ], [ %279, %325 ]
  %340 = phi i32 [ %323, %285 ], [ 0, %283 ], [ 0, %325 ]
  %341 = phi i64 [ %322, %285 ], [ 0, %283 ], [ %335, %325 ]
  %342 = icmp ugt i32 %340, 7
  br i1 %342, label %345, label %343

343:                                              ; preds = %338
  %344 = icmp eq i32 %340, 0
  br i1 %344, label %398, label %385

345:                                              ; preds = %338
  %346 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !11
  %347 = zext i8 %346 to i64
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 1
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !11
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 8
  %352 = or i64 %351, %347
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 2
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !11
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 16
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 3
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !11
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 24
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 4
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !11
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 32
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 5
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !11
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 40
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 6
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !11
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 48
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 7
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !11
  %380 = zext i8 %379 to i64
  %381 = shl nuw i64 %380, 56
  %382 = or i64 %377, %381
  %383 = add nsw i32 %340, -8
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 8
  br label %398

385:                                              ; preds = %343, %385
  %386 = phi i32 [ %396, %385 ], [ 0, %343 ]
  %387 = phi i64 [ %395, %385 ], [ 0, %343 ]
  %388 = zext i32 %386 to i64
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 %388
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !11
  %391 = zext i8 %390 to i64
  %392 = shl i32 %386, 3
  %393 = zext i32 %392 to i64
  %394 = shl nuw i64 %391, %393
  %395 = or i64 %394, %387
  %396 = add nuw nsw i32 %386, 1
  %397 = icmp eq i32 %396, %340
  br i1 %397, label %398, label %385

398:                                              ; preds = %385, %345, %343
  %399 = phi i8 addrspace(4)* [ %384, %345 ], [ %339, %343 ], [ %339, %385 ]
  %400 = phi i32 [ %383, %345 ], [ 0, %343 ], [ 0, %385 ]
  %401 = phi i64 [ %382, %345 ], [ 0, %343 ], [ %395, %385 ]
  %402 = icmp ugt i32 %400, 7
  br i1 %402, label %405, label %403

403:                                              ; preds = %398
  %404 = icmp eq i32 %400, 0
  br i1 %404, label %456, label %443

405:                                              ; preds = %398
  %406 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !11
  %407 = zext i8 %406 to i64
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 1
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !11
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 8
  %412 = or i64 %411, %407
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 2
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !11
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 16
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 3
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !11
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 24
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 4
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !11
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 32
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 5
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !11
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 40
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 6
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !11
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 48
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 7
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !11
  %440 = zext i8 %439 to i64
  %441 = shl nuw i64 %440, 56
  %442 = or i64 %437, %441
  br label %456

443:                                              ; preds = %403, %443
  %444 = phi i32 [ %454, %443 ], [ 0, %403 ]
  %445 = phi i64 [ %453, %443 ], [ 0, %403 ]
  %446 = zext i32 %444 to i64
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 %446
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !11
  %449 = zext i8 %448 to i64
  %450 = shl i32 %444, 3
  %451 = zext i32 %450 to i64
  %452 = shl nuw i64 %449, %451
  %453 = or i64 %452, %445
  %454 = add nuw nsw i32 %444, 1
  %455 = icmp eq i32 %454, %400
  br i1 %455, label %456, label %443

456:                                              ; preds = %443, %405, %403
  %457 = phi i64 [ %442, %405 ], [ 0, %403 ], [ %453, %443 ]
  %458 = shl nuw nsw i64 %39, 2
  %459 = add nuw nsw i64 %458, 28
  %460 = and i64 %459, 480
  %461 = and i64 %41, -225
  %462 = or i64 %461, %460
  %463 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %462, i64 noundef %101, i64 noundef %161, i64 noundef %221, i64 noundef %281, i64 noundef %341, i64 noundef %401, i64 noundef %457) #10
  %464 = sub i64 %31, %39
  %465 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 %39
  %466 = icmp eq i64 %464, 0
  br i1 %466, label %467, label %30

467:                                              ; preds = %456, %22
  %468 = phi <2 x i64> [ %25, %22 ], [ %463, %456 ]
  %469 = extractelement <2 x i64> %468, i64 0
  %470 = zext i32 %13 to i64
  %471 = and i64 %469, -227
  %472 = or i64 %471, 34
  %473 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %472, i64 noundef %470, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %474 = sext i32 %13 to i64
  %475 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %474
  %476 = load i32, i32 addrspace(1)* %475, align 4, !tbaa !14
  %477 = sdiv i32 %3, 2
  %478 = add i32 %3, 1
  %479 = icmp ult i32 %478, 3
  br i1 %479, label %495, label %480

480:                                              ; preds = %467, %488
  %481 = phi i32 [ %493, %488 ], [ %477, %467 ]
  %482 = phi i32 [ %491, %488 ], [ %3, %467 ]
  %483 = phi i32 [ %490, %488 ], [ 0, %467 ]
  %484 = sext i32 %481 to i64
  %485 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %484
  %486 = load i32, i32 addrspace(1)* %485, align 4, !tbaa !14
  %487 = icmp eq i32 %476, %486
  br i1 %487, label %495, label %488

488:                                              ; preds = %480
  %489 = icmp slt i32 %476, %486
  %490 = select i1 %489, i32 %483, i32 %481
  %491 = select i1 %489, i32 %481, i32 %482
  %492 = add nsw i32 %490, %491
  %493 = sdiv i32 %492, 2
  %494 = icmp eq i32 %490, %493
  br i1 %494, label %495, label %480, !llvm.loop !18

495:                                              ; preds = %488, %480, %467
  %496 = phi i32 [ %477, %467 ], [ %490, %488 ], [ %481, %480 ]
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %497
  %499 = load i32, i32 addrspace(1)* %498, align 4, !tbaa !14
  %500 = icmp eq i32 %476, %499
  %501 = zext i1 %500 to i8
  %502 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %474
  store i8 %501, i8 addrspace(1)* %502, align 1
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %504 = extractelement <2 x i64> %503, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %505, label %509

505:                                              ; preds = %495
  %506 = and i64 %504, -225
  %507 = or i64 %506, 32
  %508 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %507, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %950

509:                                              ; preds = %495
  %510 = and i64 %504, 2
  %511 = and i64 %504, -3
  %512 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %511, i64 0
  br label %513

513:                                              ; preds = %939, %509
  %514 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.1 to [15 x i8]*) to i64)), i64 1))), %509 ], [ %947, %939 ]
  %515 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %509 ], [ %948, %939 ]
  %516 = phi <2 x i64> [ %512, %509 ], [ %946, %939 ]
  %517 = icmp ugt i64 %514, 56
  %518 = extractelement <2 x i64> %516, i64 0
  %519 = or i64 %518, %510
  %520 = insertelement <2 x i64> poison, i64 %519, i64 0
  %521 = select i1 %517, <2 x i64> %516, <2 x i64> %520
  %522 = tail call i64 @llvm.umin.i64(i64 %514, i64 56)
  %523 = trunc i64 %522 to i32
  %524 = extractelement <2 x i64> %521, i64 0
  %525 = icmp ugt i32 %523, 7
  br i1 %525, label %528, label %526

526:                                              ; preds = %513
  %527 = icmp eq i32 %523, 0
  br i1 %527, label %581, label %568

528:                                              ; preds = %513
  %529 = load i8, i8 addrspace(4)* %515, align 1, !tbaa !11
  %530 = zext i8 %529 to i64
  %531 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 1
  %532 = load i8, i8 addrspace(4)* %531, align 1, !tbaa !11
  %533 = zext i8 %532 to i64
  %534 = shl nuw nsw i64 %533, 8
  %535 = or i64 %534, %530
  %536 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 2
  %537 = load i8, i8 addrspace(4)* %536, align 1, !tbaa !11
  %538 = zext i8 %537 to i64
  %539 = shl nuw nsw i64 %538, 16
  %540 = or i64 %535, %539
  %541 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 3
  %542 = load i8, i8 addrspace(4)* %541, align 1, !tbaa !11
  %543 = zext i8 %542 to i64
  %544 = shl nuw nsw i64 %543, 24
  %545 = or i64 %540, %544
  %546 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 4
  %547 = load i8, i8 addrspace(4)* %546, align 1, !tbaa !11
  %548 = zext i8 %547 to i64
  %549 = shl nuw nsw i64 %548, 32
  %550 = or i64 %545, %549
  %551 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 5
  %552 = load i8, i8 addrspace(4)* %551, align 1, !tbaa !11
  %553 = zext i8 %552 to i64
  %554 = shl nuw nsw i64 %553, 40
  %555 = or i64 %550, %554
  %556 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 6
  %557 = load i8, i8 addrspace(4)* %556, align 1, !tbaa !11
  %558 = zext i8 %557 to i64
  %559 = shl nuw nsw i64 %558, 48
  %560 = or i64 %555, %559
  %561 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 7
  %562 = load i8, i8 addrspace(4)* %561, align 1, !tbaa !11
  %563 = zext i8 %562 to i64
  %564 = shl nuw i64 %563, 56
  %565 = or i64 %560, %564
  %566 = add nsw i32 %523, -8
  %567 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 8
  br label %581

568:                                              ; preds = %526, %568
  %569 = phi i32 [ %579, %568 ], [ 0, %526 ]
  %570 = phi i64 [ %578, %568 ], [ 0, %526 ]
  %571 = zext i32 %569 to i64
  %572 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 %571
  %573 = load i8, i8 addrspace(4)* %572, align 1, !tbaa !11
  %574 = zext i8 %573 to i64
  %575 = shl i32 %569, 3
  %576 = zext i32 %575 to i64
  %577 = shl nuw i64 %574, %576
  %578 = or i64 %577, %570
  %579 = add nuw nsw i32 %569, 1
  %580 = icmp eq i32 %579, %523
  br i1 %580, label %581, label %568, !llvm.loop !12

581:                                              ; preds = %568, %528, %526
  %582 = phi i8 addrspace(4)* [ %567, %528 ], [ %515, %526 ], [ %515, %568 ]
  %583 = phi i32 [ %566, %528 ], [ 0, %526 ], [ 0, %568 ]
  %584 = phi i64 [ %565, %528 ], [ 0, %526 ], [ %578, %568 ]
  %585 = icmp ugt i32 %583, 7
  br i1 %585, label %588, label %586

586:                                              ; preds = %581
  %587 = icmp eq i32 %583, 0
  br i1 %587, label %641, label %628

588:                                              ; preds = %581
  %589 = load i8, i8 addrspace(4)* %582, align 1, !tbaa !11
  %590 = zext i8 %589 to i64
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 1
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !11
  %593 = zext i8 %592 to i64
  %594 = shl nuw nsw i64 %593, 8
  %595 = or i64 %594, %590
  %596 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 2
  %597 = load i8, i8 addrspace(4)* %596, align 1, !tbaa !11
  %598 = zext i8 %597 to i64
  %599 = shl nuw nsw i64 %598, 16
  %600 = or i64 %595, %599
  %601 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 3
  %602 = load i8, i8 addrspace(4)* %601, align 1, !tbaa !11
  %603 = zext i8 %602 to i64
  %604 = shl nuw nsw i64 %603, 24
  %605 = or i64 %600, %604
  %606 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 4
  %607 = load i8, i8 addrspace(4)* %606, align 1, !tbaa !11
  %608 = zext i8 %607 to i64
  %609 = shl nuw nsw i64 %608, 32
  %610 = or i64 %605, %609
  %611 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 5
  %612 = load i8, i8 addrspace(4)* %611, align 1, !tbaa !11
  %613 = zext i8 %612 to i64
  %614 = shl nuw nsw i64 %613, 40
  %615 = or i64 %610, %614
  %616 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 6
  %617 = load i8, i8 addrspace(4)* %616, align 1, !tbaa !11
  %618 = zext i8 %617 to i64
  %619 = shl nuw nsw i64 %618, 48
  %620 = or i64 %615, %619
  %621 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 7
  %622 = load i8, i8 addrspace(4)* %621, align 1, !tbaa !11
  %623 = zext i8 %622 to i64
  %624 = shl nuw i64 %623, 56
  %625 = or i64 %620, %624
  %626 = add nsw i32 %583, -8
  %627 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 8
  br label %641

628:                                              ; preds = %586, %628
  %629 = phi i32 [ %639, %628 ], [ 0, %586 ]
  %630 = phi i64 [ %638, %628 ], [ 0, %586 ]
  %631 = zext i32 %629 to i64
  %632 = getelementptr inbounds i8, i8 addrspace(4)* %582, i64 %631
  %633 = load i8, i8 addrspace(4)* %632, align 1, !tbaa !11
  %634 = zext i8 %633 to i64
  %635 = shl i32 %629, 3
  %636 = zext i32 %635 to i64
  %637 = shl nuw i64 %634, %636
  %638 = or i64 %637, %630
  %639 = add nuw nsw i32 %629, 1
  %640 = icmp eq i32 %639, %583
  br i1 %640, label %641, label %628

641:                                              ; preds = %628, %588, %586
  %642 = phi i8 addrspace(4)* [ %627, %588 ], [ %582, %586 ], [ %582, %628 ]
  %643 = phi i32 [ %626, %588 ], [ 0, %586 ], [ 0, %628 ]
  %644 = phi i64 [ %625, %588 ], [ 0, %586 ], [ %638, %628 ]
  %645 = icmp ugt i32 %643, 7
  br i1 %645, label %648, label %646

646:                                              ; preds = %641
  %647 = icmp eq i32 %643, 0
  br i1 %647, label %701, label %688

648:                                              ; preds = %641
  %649 = load i8, i8 addrspace(4)* %642, align 1, !tbaa !11
  %650 = zext i8 %649 to i64
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 1
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !11
  %653 = zext i8 %652 to i64
  %654 = shl nuw nsw i64 %653, 8
  %655 = or i64 %654, %650
  %656 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 2
  %657 = load i8, i8 addrspace(4)* %656, align 1, !tbaa !11
  %658 = zext i8 %657 to i64
  %659 = shl nuw nsw i64 %658, 16
  %660 = or i64 %655, %659
  %661 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 3
  %662 = load i8, i8 addrspace(4)* %661, align 1, !tbaa !11
  %663 = zext i8 %662 to i64
  %664 = shl nuw nsw i64 %663, 24
  %665 = or i64 %660, %664
  %666 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 4
  %667 = load i8, i8 addrspace(4)* %666, align 1, !tbaa !11
  %668 = zext i8 %667 to i64
  %669 = shl nuw nsw i64 %668, 32
  %670 = or i64 %665, %669
  %671 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 5
  %672 = load i8, i8 addrspace(4)* %671, align 1, !tbaa !11
  %673 = zext i8 %672 to i64
  %674 = shl nuw nsw i64 %673, 40
  %675 = or i64 %670, %674
  %676 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 6
  %677 = load i8, i8 addrspace(4)* %676, align 1, !tbaa !11
  %678 = zext i8 %677 to i64
  %679 = shl nuw nsw i64 %678, 48
  %680 = or i64 %675, %679
  %681 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 7
  %682 = load i8, i8 addrspace(4)* %681, align 1, !tbaa !11
  %683 = zext i8 %682 to i64
  %684 = shl nuw i64 %683, 56
  %685 = or i64 %680, %684
  %686 = add nsw i32 %643, -8
  %687 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 8
  br label %701

688:                                              ; preds = %646, %688
  %689 = phi i32 [ %699, %688 ], [ 0, %646 ]
  %690 = phi i64 [ %698, %688 ], [ 0, %646 ]
  %691 = zext i32 %689 to i64
  %692 = getelementptr inbounds i8, i8 addrspace(4)* %642, i64 %691
  %693 = load i8, i8 addrspace(4)* %692, align 1, !tbaa !11
  %694 = zext i8 %693 to i64
  %695 = shl i32 %689, 3
  %696 = zext i32 %695 to i64
  %697 = shl nuw i64 %694, %696
  %698 = or i64 %697, %690
  %699 = add nuw nsw i32 %689, 1
  %700 = icmp eq i32 %699, %643
  br i1 %700, label %701, label %688

701:                                              ; preds = %688, %648, %646
  %702 = phi i8 addrspace(4)* [ %687, %648 ], [ %642, %646 ], [ %642, %688 ]
  %703 = phi i32 [ %686, %648 ], [ 0, %646 ], [ 0, %688 ]
  %704 = phi i64 [ %685, %648 ], [ 0, %646 ], [ %698, %688 ]
  %705 = icmp ugt i32 %703, 7
  br i1 %705, label %708, label %706

706:                                              ; preds = %701
  %707 = icmp eq i32 %703, 0
  br i1 %707, label %761, label %748

708:                                              ; preds = %701
  %709 = load i8, i8 addrspace(4)* %702, align 1, !tbaa !11
  %710 = zext i8 %709 to i64
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 1
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !11
  %713 = zext i8 %712 to i64
  %714 = shl nuw nsw i64 %713, 8
  %715 = or i64 %714, %710
  %716 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 2
  %717 = load i8, i8 addrspace(4)* %716, align 1, !tbaa !11
  %718 = zext i8 %717 to i64
  %719 = shl nuw nsw i64 %718, 16
  %720 = or i64 %715, %719
  %721 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 3
  %722 = load i8, i8 addrspace(4)* %721, align 1, !tbaa !11
  %723 = zext i8 %722 to i64
  %724 = shl nuw nsw i64 %723, 24
  %725 = or i64 %720, %724
  %726 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 4
  %727 = load i8, i8 addrspace(4)* %726, align 1, !tbaa !11
  %728 = zext i8 %727 to i64
  %729 = shl nuw nsw i64 %728, 32
  %730 = or i64 %725, %729
  %731 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 5
  %732 = load i8, i8 addrspace(4)* %731, align 1, !tbaa !11
  %733 = zext i8 %732 to i64
  %734 = shl nuw nsw i64 %733, 40
  %735 = or i64 %730, %734
  %736 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 6
  %737 = load i8, i8 addrspace(4)* %736, align 1, !tbaa !11
  %738 = zext i8 %737 to i64
  %739 = shl nuw nsw i64 %738, 48
  %740 = or i64 %735, %739
  %741 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 7
  %742 = load i8, i8 addrspace(4)* %741, align 1, !tbaa !11
  %743 = zext i8 %742 to i64
  %744 = shl nuw i64 %743, 56
  %745 = or i64 %740, %744
  %746 = add nsw i32 %703, -8
  %747 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 8
  br label %761

748:                                              ; preds = %706, %748
  %749 = phi i32 [ %759, %748 ], [ 0, %706 ]
  %750 = phi i64 [ %758, %748 ], [ 0, %706 ]
  %751 = zext i32 %749 to i64
  %752 = getelementptr inbounds i8, i8 addrspace(4)* %702, i64 %751
  %753 = load i8, i8 addrspace(4)* %752, align 1, !tbaa !11
  %754 = zext i8 %753 to i64
  %755 = shl i32 %749, 3
  %756 = zext i32 %755 to i64
  %757 = shl nuw i64 %754, %756
  %758 = or i64 %757, %750
  %759 = add nuw nsw i32 %749, 1
  %760 = icmp eq i32 %759, %703
  br i1 %760, label %761, label %748

761:                                              ; preds = %748, %708, %706
  %762 = phi i8 addrspace(4)* [ %747, %708 ], [ %702, %706 ], [ %702, %748 ]
  %763 = phi i32 [ %746, %708 ], [ 0, %706 ], [ 0, %748 ]
  %764 = phi i64 [ %745, %708 ], [ 0, %706 ], [ %758, %748 ]
  %765 = icmp ugt i32 %763, 7
  br i1 %765, label %768, label %766

766:                                              ; preds = %761
  %767 = icmp eq i32 %763, 0
  br i1 %767, label %821, label %808

768:                                              ; preds = %761
  %769 = load i8, i8 addrspace(4)* %762, align 1, !tbaa !11
  %770 = zext i8 %769 to i64
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 1
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !11
  %773 = zext i8 %772 to i64
  %774 = shl nuw nsw i64 %773, 8
  %775 = or i64 %774, %770
  %776 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 2
  %777 = load i8, i8 addrspace(4)* %776, align 1, !tbaa !11
  %778 = zext i8 %777 to i64
  %779 = shl nuw nsw i64 %778, 16
  %780 = or i64 %775, %779
  %781 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 3
  %782 = load i8, i8 addrspace(4)* %781, align 1, !tbaa !11
  %783 = zext i8 %782 to i64
  %784 = shl nuw nsw i64 %783, 24
  %785 = or i64 %780, %784
  %786 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 4
  %787 = load i8, i8 addrspace(4)* %786, align 1, !tbaa !11
  %788 = zext i8 %787 to i64
  %789 = shl nuw nsw i64 %788, 32
  %790 = or i64 %785, %789
  %791 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 5
  %792 = load i8, i8 addrspace(4)* %791, align 1, !tbaa !11
  %793 = zext i8 %792 to i64
  %794 = shl nuw nsw i64 %793, 40
  %795 = or i64 %790, %794
  %796 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 6
  %797 = load i8, i8 addrspace(4)* %796, align 1, !tbaa !11
  %798 = zext i8 %797 to i64
  %799 = shl nuw nsw i64 %798, 48
  %800 = or i64 %795, %799
  %801 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 7
  %802 = load i8, i8 addrspace(4)* %801, align 1, !tbaa !11
  %803 = zext i8 %802 to i64
  %804 = shl nuw i64 %803, 56
  %805 = or i64 %800, %804
  %806 = add nsw i32 %763, -8
  %807 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 8
  br label %821

808:                                              ; preds = %766, %808
  %809 = phi i32 [ %819, %808 ], [ 0, %766 ]
  %810 = phi i64 [ %818, %808 ], [ 0, %766 ]
  %811 = zext i32 %809 to i64
  %812 = getelementptr inbounds i8, i8 addrspace(4)* %762, i64 %811
  %813 = load i8, i8 addrspace(4)* %812, align 1, !tbaa !11
  %814 = zext i8 %813 to i64
  %815 = shl i32 %809, 3
  %816 = zext i32 %815 to i64
  %817 = shl nuw i64 %814, %816
  %818 = or i64 %817, %810
  %819 = add nuw nsw i32 %809, 1
  %820 = icmp eq i32 %819, %763
  br i1 %820, label %821, label %808

821:                                              ; preds = %808, %768, %766
  %822 = phi i8 addrspace(4)* [ %807, %768 ], [ %762, %766 ], [ %762, %808 ]
  %823 = phi i32 [ %806, %768 ], [ 0, %766 ], [ 0, %808 ]
  %824 = phi i64 [ %805, %768 ], [ 0, %766 ], [ %818, %808 ]
  %825 = icmp ugt i32 %823, 7
  br i1 %825, label %828, label %826

826:                                              ; preds = %821
  %827 = icmp eq i32 %823, 0
  br i1 %827, label %881, label %868

828:                                              ; preds = %821
  %829 = load i8, i8 addrspace(4)* %822, align 1, !tbaa !11
  %830 = zext i8 %829 to i64
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 1
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !11
  %833 = zext i8 %832 to i64
  %834 = shl nuw nsw i64 %833, 8
  %835 = or i64 %834, %830
  %836 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 2
  %837 = load i8, i8 addrspace(4)* %836, align 1, !tbaa !11
  %838 = zext i8 %837 to i64
  %839 = shl nuw nsw i64 %838, 16
  %840 = or i64 %835, %839
  %841 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 3
  %842 = load i8, i8 addrspace(4)* %841, align 1, !tbaa !11
  %843 = zext i8 %842 to i64
  %844 = shl nuw nsw i64 %843, 24
  %845 = or i64 %840, %844
  %846 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 4
  %847 = load i8, i8 addrspace(4)* %846, align 1, !tbaa !11
  %848 = zext i8 %847 to i64
  %849 = shl nuw nsw i64 %848, 32
  %850 = or i64 %845, %849
  %851 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 5
  %852 = load i8, i8 addrspace(4)* %851, align 1, !tbaa !11
  %853 = zext i8 %852 to i64
  %854 = shl nuw nsw i64 %853, 40
  %855 = or i64 %850, %854
  %856 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 6
  %857 = load i8, i8 addrspace(4)* %856, align 1, !tbaa !11
  %858 = zext i8 %857 to i64
  %859 = shl nuw nsw i64 %858, 48
  %860 = or i64 %855, %859
  %861 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 7
  %862 = load i8, i8 addrspace(4)* %861, align 1, !tbaa !11
  %863 = zext i8 %862 to i64
  %864 = shl nuw i64 %863, 56
  %865 = or i64 %860, %864
  %866 = add nsw i32 %823, -8
  %867 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 8
  br label %881

868:                                              ; preds = %826, %868
  %869 = phi i32 [ %879, %868 ], [ 0, %826 ]
  %870 = phi i64 [ %878, %868 ], [ 0, %826 ]
  %871 = zext i32 %869 to i64
  %872 = getelementptr inbounds i8, i8 addrspace(4)* %822, i64 %871
  %873 = load i8, i8 addrspace(4)* %872, align 1, !tbaa !11
  %874 = zext i8 %873 to i64
  %875 = shl i32 %869, 3
  %876 = zext i32 %875 to i64
  %877 = shl nuw i64 %874, %876
  %878 = or i64 %877, %870
  %879 = add nuw nsw i32 %869, 1
  %880 = icmp eq i32 %879, %823
  br i1 %880, label %881, label %868

881:                                              ; preds = %868, %828, %826
  %882 = phi i8 addrspace(4)* [ %867, %828 ], [ %822, %826 ], [ %822, %868 ]
  %883 = phi i32 [ %866, %828 ], [ 0, %826 ], [ 0, %868 ]
  %884 = phi i64 [ %865, %828 ], [ 0, %826 ], [ %878, %868 ]
  %885 = icmp ugt i32 %883, 7
  br i1 %885, label %888, label %886

886:                                              ; preds = %881
  %887 = icmp eq i32 %883, 0
  br i1 %887, label %939, label %926

888:                                              ; preds = %881
  %889 = load i8, i8 addrspace(4)* %882, align 1, !tbaa !11
  %890 = zext i8 %889 to i64
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 1
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !11
  %893 = zext i8 %892 to i64
  %894 = shl nuw nsw i64 %893, 8
  %895 = or i64 %894, %890
  %896 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 2
  %897 = load i8, i8 addrspace(4)* %896, align 1, !tbaa !11
  %898 = zext i8 %897 to i64
  %899 = shl nuw nsw i64 %898, 16
  %900 = or i64 %895, %899
  %901 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 3
  %902 = load i8, i8 addrspace(4)* %901, align 1, !tbaa !11
  %903 = zext i8 %902 to i64
  %904 = shl nuw nsw i64 %903, 24
  %905 = or i64 %900, %904
  %906 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 4
  %907 = load i8, i8 addrspace(4)* %906, align 1, !tbaa !11
  %908 = zext i8 %907 to i64
  %909 = shl nuw nsw i64 %908, 32
  %910 = or i64 %905, %909
  %911 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 5
  %912 = load i8, i8 addrspace(4)* %911, align 1, !tbaa !11
  %913 = zext i8 %912 to i64
  %914 = shl nuw nsw i64 %913, 40
  %915 = or i64 %910, %914
  %916 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 6
  %917 = load i8, i8 addrspace(4)* %916, align 1, !tbaa !11
  %918 = zext i8 %917 to i64
  %919 = shl nuw nsw i64 %918, 48
  %920 = or i64 %915, %919
  %921 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 7
  %922 = load i8, i8 addrspace(4)* %921, align 1, !tbaa !11
  %923 = zext i8 %922 to i64
  %924 = shl nuw i64 %923, 56
  %925 = or i64 %920, %924
  br label %939

926:                                              ; preds = %886, %926
  %927 = phi i32 [ %937, %926 ], [ 0, %886 ]
  %928 = phi i64 [ %936, %926 ], [ 0, %886 ]
  %929 = zext i32 %927 to i64
  %930 = getelementptr inbounds i8, i8 addrspace(4)* %882, i64 %929
  %931 = load i8, i8 addrspace(4)* %930, align 1, !tbaa !11
  %932 = zext i8 %931 to i64
  %933 = shl i32 %927, 3
  %934 = zext i32 %933 to i64
  %935 = shl nuw i64 %932, %934
  %936 = or i64 %935, %928
  %937 = add nuw nsw i32 %927, 1
  %938 = icmp eq i32 %937, %883
  br i1 %938, label %939, label %926

939:                                              ; preds = %926, %888, %886
  %940 = phi i64 [ %925, %888 ], [ 0, %886 ], [ %936, %926 ]
  %941 = shl nuw nsw i64 %522, 2
  %942 = add nuw nsw i64 %941, 28
  %943 = and i64 %942, 480
  %944 = and i64 %524, -225
  %945 = or i64 %944, %943
  %946 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %945, i64 noundef %584, i64 noundef %644, i64 noundef %704, i64 noundef %764, i64 noundef %824, i64 noundef %884, i64 noundef %940) #10
  %947 = sub i64 %514, %522
  %948 = getelementptr inbounds i8, i8 addrspace(4)* %515, i64 %522
  %949 = icmp eq i64 %947, 0
  br i1 %949, label %950, label %513

950:                                              ; preds = %939, %505
  %951 = phi <2 x i64> [ %508, %505 ], [ %946, %939 ]
  %952 = extractelement <2 x i64> %951, i64 0
  %953 = and i64 %952, -225
  %954 = or i64 %953, 32
  %955 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %954, i64 noundef %470, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %956 = extractelement <2 x i64> %955, i64 0
  %957 = zext i32 %476 to i64
  %958 = and i64 %956, -225
  %959 = or i64 %958, 32
  %960 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %959, i64 noundef %957, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %961 = extractelement <2 x i64> %960, i64 0
  %962 = zext i32 %499 to i64
  %963 = and i64 %961, -225
  %964 = or i64 %963, 32
  %965 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %964, i64 noundef %962, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %966 = extractelement <2 x i64> %965, i64 0
  %967 = zext i1 %500 to i64
  %968 = and i64 %966, -227
  %969 = or i64 %968, 34
  %970 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %969, i64 noundef %967, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !20
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !22
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !25
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !28
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !28
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !29
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !28
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !22
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !7
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !7
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !7
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !7
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !7
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !7
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !7
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !7
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %110 = call i64 @llvm.read_register.i64(metadata !30) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !31
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !33
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !34
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !25
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !28
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !35
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !35
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !36
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !38
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !7
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !28
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
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !35
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !35
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
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C++ TBAA"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !9, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !9, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!27 = !{!"hsa_signal_s", !8, i64 0}
!28 = !{!26, !8, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !8, i64 0, !8, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !8, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !8, i64 0}
!36 = !{!37, !8, i64 16}
!37 = !{!"amd_signal_s", !8, i64 0, !9, i64 8, !8, i64 16, !23, i64 24, !23, i64 28, !8, i64 32, !8, i64 40, !9, i64 48, !9, i64 56}
!38 = !{!37, !23, i64 24}
