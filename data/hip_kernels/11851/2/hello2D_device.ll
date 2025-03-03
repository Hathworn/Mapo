; ModuleID = '../data/hip_kernels/11851/2/main.cu'
source_filename = "../data/hip_kernels/11851/2/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [63 x i8] c"I am thread (%d, %d) in block (%d, %d). Global thread ID = %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z7hello2Dv() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %2 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 12
  %5 = bitcast i8 addrspace(4)* %4 to i32 addrspace(4)*
  %6 = load i32, i32 addrspace(4)* %5, align 4, !tbaa !4
  %7 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !13, !invariant.load !14
  %10 = zext i16 %9 to i32
  %11 = udiv i32 %6, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %14 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 24
  %16 = bitcast i8 addrspace(4)* %15 to i64 addrspace(4)*
  %17 = load i64, i64 addrspace(4)* %16, align 8, !tbaa !16
  %18 = inttoptr i64 %17 to i8 addrspace(1)*
  %19 = addrspacecast i8 addrspace(1)* %18 to i8*
  %20 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %21 = extractelement <2 x i64> %20, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([63 x i8], [63 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %22, label %26

22:                                               ; preds = %0
  %23 = and i64 %21, -225
  %24 = or i64 %23, 32
  %25 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %24, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %467

26:                                               ; preds = %0
  %27 = and i64 %21, 2
  %28 = and i64 %21, -3
  %29 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %28, i64 0
  br label %30

30:                                               ; preds = %456, %26
  %31 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([63 x i8], [63 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([63 x i8], [63 x i8] addrspace(4)* @.str, i64 0, i64 62) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([63 x i8]* addrspacecast ([63 x i8] addrspace(4)* @.str to [63 x i8]*) to i64)), i64 1))), %26 ], [ %464, %456 ]
  %32 = phi i8 addrspace(4)* [ getelementptr inbounds ([63 x i8], [63 x i8] addrspace(4)* @.str, i64 0, i64 0), %26 ], [ %465, %456 ]
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
  %46 = load i8, i8 addrspace(4)* %32, align 1, !tbaa !17
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 1
  %49 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !17
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 8
  %52 = or i64 %51, %47
  %53 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 2
  %54 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !17
  %55 = zext i8 %54 to i64
  %56 = shl nuw nsw i64 %55, 16
  %57 = or i64 %52, %56
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 3
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !17
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 24
  %62 = or i64 %57, %61
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 4
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !17
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 32
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 5
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !17
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 40
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 6
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !17
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 48
  %77 = or i64 %72, %76
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %32, i64 7
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !17
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
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !17
  %91 = zext i8 %90 to i64
  %92 = shl i32 %86, 3
  %93 = zext i32 %92 to i64
  %94 = shl nuw i64 %91, %93
  %95 = or i64 %94, %87
  %96 = add nuw nsw i32 %86, 1
  %97 = icmp eq i32 %96, %40
  br i1 %97, label %98, label %85, !llvm.loop !18

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
  %106 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !17
  %107 = zext i8 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 1
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !17
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 8
  %112 = or i64 %111, %107
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 2
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !17
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 16
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 3
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !17
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 24
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 4
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !17
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 32
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 5
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !17
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 40
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 6
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !17
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 48
  %137 = or i64 %132, %136
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %99, i64 7
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !17
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
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !17
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
  %166 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !17
  %167 = zext i8 %166 to i64
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 1
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !17
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 8
  %172 = or i64 %171, %167
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 2
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !17
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 16
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 3
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !17
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 24
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 4
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !17
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 32
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 5
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !17
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 40
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 6
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !17
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 48
  %197 = or i64 %192, %196
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %159, i64 7
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !17
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
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !17
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
  %226 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !17
  %227 = zext i8 %226 to i64
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 1
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !17
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 8
  %232 = or i64 %231, %227
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 2
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !17
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 16
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 3
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !17
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 24
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 4
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !17
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 32
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 5
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !17
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 40
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 6
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !17
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 48
  %257 = or i64 %252, %256
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %219, i64 7
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !17
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
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !17
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
  %286 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !17
  %287 = zext i8 %286 to i64
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 1
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !17
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 8
  %292 = or i64 %291, %287
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 2
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !17
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 16
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 3
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !17
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 24
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 4
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !17
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 32
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 5
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !17
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 40
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 6
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !17
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 48
  %317 = or i64 %312, %316
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %279, i64 7
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !17
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
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !17
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
  %346 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !17
  %347 = zext i8 %346 to i64
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 1
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !17
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 8
  %352 = or i64 %351, %347
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 2
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !17
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 16
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 3
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !17
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 24
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 4
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !17
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 32
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 5
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !17
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 40
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 6
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !17
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 48
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %339, i64 7
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !17
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
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !17
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
  %406 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !17
  %407 = zext i8 %406 to i64
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 1
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !17
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 8
  %412 = or i64 %411, %407
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 2
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !17
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 16
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 3
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !17
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 24
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 4
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !17
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 32
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 5
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !17
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 40
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 6
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !17
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 48
  %437 = or i64 %432, %436
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 7
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !17
  %440 = zext i8 %439 to i64
  %441 = shl nuw i64 %440, 56
  %442 = or i64 %437, %441
  br label %456

443:                                              ; preds = %403, %443
  %444 = phi i32 [ %454, %443 ], [ 0, %403 ]
  %445 = phi i64 [ %453, %443 ], [ 0, %403 ]
  %446 = zext i32 %444 to i64
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %399, i64 %446
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !17
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
  %469 = mul i32 %11, %10
  %470 = icmp ugt i32 %6, %469
  %471 = zext i1 %470 to i32
  %472 = add i32 %11, %471
  %473 = mul i32 %472, %1
  %474 = add i32 %473, %2
  %475 = mul i32 %1, %2
  %476 = mul nsw i32 %475, %474
  %477 = mul nuw nsw i32 %12, %10
  %478 = add nuw nsw i32 %477, %13
  %479 = add i32 %478, %476
  %480 = extractelement <2 x i64> %468, i64 0
  %481 = zext i32 %12 to i64
  %482 = and i64 %480, -225
  %483 = or i64 %482, 32
  %484 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %483, i64 noundef %481, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %485 = extractelement <2 x i64> %484, i64 0
  %486 = zext i32 %13 to i64
  %487 = and i64 %485, -225
  %488 = or i64 %487, 32
  %489 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %488, i64 noundef %486, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %490 = extractelement <2 x i64> %489, i64 0
  %491 = zext i32 %1 to i64
  %492 = and i64 %490, -225
  %493 = or i64 %492, 32
  %494 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %493, i64 noundef %491, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %495 = extractelement <2 x i64> %494, i64 0
  %496 = zext i32 %2 to i64
  %497 = and i64 %495, -225
  %498 = or i64 %497, 32
  %499 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %498, i64 noundef %496, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %500 = extractelement <2 x i64> %499, i64 0
  %501 = zext i32 %479 to i64
  %502 = and i64 %500, -227
  %503 = or i64 %502, 34
  %504 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %19, i64 noundef %503, i64 noundef %501, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
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
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !21
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !16
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !16
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !16
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !16
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !16
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !16
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !16
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !16
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !21
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !21
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !21
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !16
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !21
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !16
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !16
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !16
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !16
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !16
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !16
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !16
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !16
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %110 = call i64 @llvm.read_register.i64(metadata !27) #11
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !16
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !16
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !16
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !16
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !16
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !16
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !16
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !16
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !20
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !16
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !16
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !16
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !23
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!10, !10, i64 0}
!17 = !{!7, !7, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = !{!11, !11, i64 0}
!21 = !{!9, !9, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !11, i64 0}
!24 = !{!"", !11, i64 0, !11, i64 8, !12, i64 16, !10, i64 24, !10, i64 32, !10, i64 40}
!25 = !{!24, !10, i64 40}
!26 = !{!24, !11, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !9, i64 16}
!29 = !{!"", !10, i64 0, !10, i64 8, !9, i64 16, !9, i64 20}
!30 = !{!29, !10, i64 8}
!31 = !{!29, !9, i64 20}
!32 = !{!29, !10, i64 0}
!33 = !{!34, !10, i64 16}
!34 = !{!"amd_signal_s", !10, i64 0, !7, i64 8, !10, i64 16, !9, i64 24, !9, i64 28, !10, i64 32, !10, i64 40, !7, i64 48, !7, i64 56}
!35 = !{!34, !9, i64 24}
