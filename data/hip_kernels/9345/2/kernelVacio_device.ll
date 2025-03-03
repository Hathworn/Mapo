; ModuleID = '../data/hip_kernels/9345/2/main.cu'
source_filename = "../data/hip_kernels/9345/2/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [61 x i8] c"Data: %s Id Thread: %d Id block : %d Num threads block : %d\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [12 x i8] c"helloWorld!\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z11kernelVaciov() local_unnamed_addr #1 {
  %1 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %2 = icmp ult i32 %1, 10
  br i1 %2, label %3, label %927

3:                                                ; preds = %0
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 24
  %11 = bitcast i8 addrspace(4)* %10 to i64 addrspace(4)*
  %12 = load i64, i64 addrspace(4)* %11, align 8, !tbaa !7
  %13 = inttoptr i64 %12 to i8 addrspace(1)*
  %14 = addrspacecast i8 addrspace(1)* %13 to i8*
  %15 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %16 = extractelement <2 x i64> %15, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([61 x i8], [61 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %17, label %21

17:                                               ; preds = %3
  %18 = and i64 %16, -225
  %19 = or i64 %18, 32
  %20 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %19, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %462

21:                                               ; preds = %3
  %22 = and i64 %16, 2
  %23 = and i64 %16, -3
  %24 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %23, i64 0
  br label %25

25:                                               ; preds = %451, %21
  %26 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([61 x i8], [61 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([61 x i8], [61 x i8] addrspace(4)* @.str, i64 0, i64 60) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([61 x i8]* addrspacecast ([61 x i8] addrspace(4)* @.str to [61 x i8]*) to i64)), i64 1))), %21 ], [ %459, %451 ]
  %27 = phi i8 addrspace(4)* [ getelementptr inbounds ([61 x i8], [61 x i8] addrspace(4)* @.str, i64 0, i64 0), %21 ], [ %460, %451 ]
  %28 = phi <2 x i64> [ %24, %21 ], [ %458, %451 ]
  %29 = icmp ugt i64 %26, 56
  %30 = extractelement <2 x i64> %28, i64 0
  %31 = or i64 %30, %22
  %32 = insertelement <2 x i64> poison, i64 %31, i64 0
  %33 = select i1 %29, <2 x i64> %28, <2 x i64> %32
  %34 = tail call i64 @llvm.umin.i64(i64 %26, i64 56)
  %35 = trunc i64 %34 to i32
  %36 = extractelement <2 x i64> %33, i64 0
  %37 = icmp ugt i32 %35, 7
  br i1 %37, label %40, label %38

38:                                               ; preds = %25
  %39 = icmp eq i32 %35, 0
  br i1 %39, label %93, label %80

40:                                               ; preds = %25
  %41 = load i8, i8 addrspace(4)* %27, align 1, !tbaa !11
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 1
  %44 = load i8, i8 addrspace(4)* %43, align 1, !tbaa !11
  %45 = zext i8 %44 to i64
  %46 = shl nuw nsw i64 %45, 8
  %47 = or i64 %46, %42
  %48 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 2
  %49 = load i8, i8 addrspace(4)* %48, align 1, !tbaa !11
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 16
  %52 = or i64 %47, %51
  %53 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 3
  %54 = load i8, i8 addrspace(4)* %53, align 1, !tbaa !11
  %55 = zext i8 %54 to i64
  %56 = shl nuw nsw i64 %55, 24
  %57 = or i64 %52, %56
  %58 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 4
  %59 = load i8, i8 addrspace(4)* %58, align 1, !tbaa !11
  %60 = zext i8 %59 to i64
  %61 = shl nuw nsw i64 %60, 32
  %62 = or i64 %57, %61
  %63 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 5
  %64 = load i8, i8 addrspace(4)* %63, align 1, !tbaa !11
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 40
  %67 = or i64 %62, %66
  %68 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 6
  %69 = load i8, i8 addrspace(4)* %68, align 1, !tbaa !11
  %70 = zext i8 %69 to i64
  %71 = shl nuw nsw i64 %70, 48
  %72 = or i64 %67, %71
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 7
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !11
  %75 = zext i8 %74 to i64
  %76 = shl nuw i64 %75, 56
  %77 = or i64 %72, %76
  %78 = add nsw i32 %35, -8
  %79 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 8
  br label %93

80:                                               ; preds = %38, %80
  %81 = phi i32 [ %91, %80 ], [ 0, %38 ]
  %82 = phi i64 [ %90, %80 ], [ 0, %38 ]
  %83 = zext i32 %81 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 %83
  %85 = load i8, i8 addrspace(4)* %84, align 1, !tbaa !11
  %86 = zext i8 %85 to i64
  %87 = shl i32 %81, 3
  %88 = zext i32 %87 to i64
  %89 = shl nuw i64 %86, %88
  %90 = or i64 %89, %82
  %91 = add nuw nsw i32 %81, 1
  %92 = icmp eq i32 %91, %35
  br i1 %92, label %93, label %80, !llvm.loop !12

93:                                               ; preds = %80, %40, %38
  %94 = phi i8 addrspace(4)* [ %79, %40 ], [ %27, %38 ], [ %27, %80 ]
  %95 = phi i32 [ %78, %40 ], [ 0, %38 ], [ 0, %80 ]
  %96 = phi i64 [ %77, %40 ], [ 0, %38 ], [ %90, %80 ]
  %97 = icmp ugt i32 %95, 7
  br i1 %97, label %100, label %98

98:                                               ; preds = %93
  %99 = icmp eq i32 %95, 0
  br i1 %99, label %153, label %140

100:                                              ; preds = %93
  %101 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !11
  %102 = zext i8 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 1
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !11
  %105 = zext i8 %104 to i64
  %106 = shl nuw nsw i64 %105, 8
  %107 = or i64 %106, %102
  %108 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 2
  %109 = load i8, i8 addrspace(4)* %108, align 1, !tbaa !11
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 16
  %112 = or i64 %107, %111
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 3
  %114 = load i8, i8 addrspace(4)* %113, align 1, !tbaa !11
  %115 = zext i8 %114 to i64
  %116 = shl nuw nsw i64 %115, 24
  %117 = or i64 %112, %116
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 4
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !11
  %120 = zext i8 %119 to i64
  %121 = shl nuw nsw i64 %120, 32
  %122 = or i64 %117, %121
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 5
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !11
  %125 = zext i8 %124 to i64
  %126 = shl nuw nsw i64 %125, 40
  %127 = or i64 %122, %126
  %128 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 6
  %129 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !11
  %130 = zext i8 %129 to i64
  %131 = shl nuw nsw i64 %130, 48
  %132 = or i64 %127, %131
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 7
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !11
  %135 = zext i8 %134 to i64
  %136 = shl nuw i64 %135, 56
  %137 = or i64 %132, %136
  %138 = add nsw i32 %95, -8
  %139 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 8
  br label %153

140:                                              ; preds = %98, %140
  %141 = phi i32 [ %151, %140 ], [ 0, %98 ]
  %142 = phi i64 [ %150, %140 ], [ 0, %98 ]
  %143 = zext i32 %141 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(4)* %94, i64 %143
  %145 = load i8, i8 addrspace(4)* %144, align 1, !tbaa !11
  %146 = zext i8 %145 to i64
  %147 = shl i32 %141, 3
  %148 = zext i32 %147 to i64
  %149 = shl nuw i64 %146, %148
  %150 = or i64 %149, %142
  %151 = add nuw nsw i32 %141, 1
  %152 = icmp eq i32 %151, %95
  br i1 %152, label %153, label %140

153:                                              ; preds = %140, %100, %98
  %154 = phi i8 addrspace(4)* [ %139, %100 ], [ %94, %98 ], [ %94, %140 ]
  %155 = phi i32 [ %138, %100 ], [ 0, %98 ], [ 0, %140 ]
  %156 = phi i64 [ %137, %100 ], [ 0, %98 ], [ %150, %140 ]
  %157 = icmp ugt i32 %155, 7
  br i1 %157, label %160, label %158

158:                                              ; preds = %153
  %159 = icmp eq i32 %155, 0
  br i1 %159, label %213, label %200

160:                                              ; preds = %153
  %161 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !11
  %162 = zext i8 %161 to i64
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 1
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !11
  %165 = zext i8 %164 to i64
  %166 = shl nuw nsw i64 %165, 8
  %167 = or i64 %166, %162
  %168 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 2
  %169 = load i8, i8 addrspace(4)* %168, align 1, !tbaa !11
  %170 = zext i8 %169 to i64
  %171 = shl nuw nsw i64 %170, 16
  %172 = or i64 %167, %171
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 3
  %174 = load i8, i8 addrspace(4)* %173, align 1, !tbaa !11
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 24
  %177 = or i64 %172, %176
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 4
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !11
  %180 = zext i8 %179 to i64
  %181 = shl nuw nsw i64 %180, 32
  %182 = or i64 %177, %181
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 5
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !11
  %185 = zext i8 %184 to i64
  %186 = shl nuw nsw i64 %185, 40
  %187 = or i64 %182, %186
  %188 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 6
  %189 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !11
  %190 = zext i8 %189 to i64
  %191 = shl nuw nsw i64 %190, 48
  %192 = or i64 %187, %191
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 7
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !11
  %195 = zext i8 %194 to i64
  %196 = shl nuw i64 %195, 56
  %197 = or i64 %192, %196
  %198 = add nsw i32 %155, -8
  %199 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 8
  br label %213

200:                                              ; preds = %158, %200
  %201 = phi i32 [ %211, %200 ], [ 0, %158 ]
  %202 = phi i64 [ %210, %200 ], [ 0, %158 ]
  %203 = zext i32 %201 to i64
  %204 = getelementptr inbounds i8, i8 addrspace(4)* %154, i64 %203
  %205 = load i8, i8 addrspace(4)* %204, align 1, !tbaa !11
  %206 = zext i8 %205 to i64
  %207 = shl i32 %201, 3
  %208 = zext i32 %207 to i64
  %209 = shl nuw i64 %206, %208
  %210 = or i64 %209, %202
  %211 = add nuw nsw i32 %201, 1
  %212 = icmp eq i32 %211, %155
  br i1 %212, label %213, label %200

213:                                              ; preds = %200, %160, %158
  %214 = phi i8 addrspace(4)* [ %199, %160 ], [ %154, %158 ], [ %154, %200 ]
  %215 = phi i32 [ %198, %160 ], [ 0, %158 ], [ 0, %200 ]
  %216 = phi i64 [ %197, %160 ], [ 0, %158 ], [ %210, %200 ]
  %217 = icmp ugt i32 %215, 7
  br i1 %217, label %220, label %218

218:                                              ; preds = %213
  %219 = icmp eq i32 %215, 0
  br i1 %219, label %273, label %260

220:                                              ; preds = %213
  %221 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !11
  %222 = zext i8 %221 to i64
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 1
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !11
  %225 = zext i8 %224 to i64
  %226 = shl nuw nsw i64 %225, 8
  %227 = or i64 %226, %222
  %228 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 2
  %229 = load i8, i8 addrspace(4)* %228, align 1, !tbaa !11
  %230 = zext i8 %229 to i64
  %231 = shl nuw nsw i64 %230, 16
  %232 = or i64 %227, %231
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 3
  %234 = load i8, i8 addrspace(4)* %233, align 1, !tbaa !11
  %235 = zext i8 %234 to i64
  %236 = shl nuw nsw i64 %235, 24
  %237 = or i64 %232, %236
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 4
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !11
  %240 = zext i8 %239 to i64
  %241 = shl nuw nsw i64 %240, 32
  %242 = or i64 %237, %241
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 5
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !11
  %245 = zext i8 %244 to i64
  %246 = shl nuw nsw i64 %245, 40
  %247 = or i64 %242, %246
  %248 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 6
  %249 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !11
  %250 = zext i8 %249 to i64
  %251 = shl nuw nsw i64 %250, 48
  %252 = or i64 %247, %251
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 7
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !11
  %255 = zext i8 %254 to i64
  %256 = shl nuw i64 %255, 56
  %257 = or i64 %252, %256
  %258 = add nsw i32 %215, -8
  %259 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 8
  br label %273

260:                                              ; preds = %218, %260
  %261 = phi i32 [ %271, %260 ], [ 0, %218 ]
  %262 = phi i64 [ %270, %260 ], [ 0, %218 ]
  %263 = zext i32 %261 to i64
  %264 = getelementptr inbounds i8, i8 addrspace(4)* %214, i64 %263
  %265 = load i8, i8 addrspace(4)* %264, align 1, !tbaa !11
  %266 = zext i8 %265 to i64
  %267 = shl i32 %261, 3
  %268 = zext i32 %267 to i64
  %269 = shl nuw i64 %266, %268
  %270 = or i64 %269, %262
  %271 = add nuw nsw i32 %261, 1
  %272 = icmp eq i32 %271, %215
  br i1 %272, label %273, label %260

273:                                              ; preds = %260, %220, %218
  %274 = phi i8 addrspace(4)* [ %259, %220 ], [ %214, %218 ], [ %214, %260 ]
  %275 = phi i32 [ %258, %220 ], [ 0, %218 ], [ 0, %260 ]
  %276 = phi i64 [ %257, %220 ], [ 0, %218 ], [ %270, %260 ]
  %277 = icmp ugt i32 %275, 7
  br i1 %277, label %280, label %278

278:                                              ; preds = %273
  %279 = icmp eq i32 %275, 0
  br i1 %279, label %333, label %320

280:                                              ; preds = %273
  %281 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !11
  %282 = zext i8 %281 to i64
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 1
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !11
  %285 = zext i8 %284 to i64
  %286 = shl nuw nsw i64 %285, 8
  %287 = or i64 %286, %282
  %288 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 2
  %289 = load i8, i8 addrspace(4)* %288, align 1, !tbaa !11
  %290 = zext i8 %289 to i64
  %291 = shl nuw nsw i64 %290, 16
  %292 = or i64 %287, %291
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 3
  %294 = load i8, i8 addrspace(4)* %293, align 1, !tbaa !11
  %295 = zext i8 %294 to i64
  %296 = shl nuw nsw i64 %295, 24
  %297 = or i64 %292, %296
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 4
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !11
  %300 = zext i8 %299 to i64
  %301 = shl nuw nsw i64 %300, 32
  %302 = or i64 %297, %301
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 5
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !11
  %305 = zext i8 %304 to i64
  %306 = shl nuw nsw i64 %305, 40
  %307 = or i64 %302, %306
  %308 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 6
  %309 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !11
  %310 = zext i8 %309 to i64
  %311 = shl nuw nsw i64 %310, 48
  %312 = or i64 %307, %311
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 7
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !11
  %315 = zext i8 %314 to i64
  %316 = shl nuw i64 %315, 56
  %317 = or i64 %312, %316
  %318 = add nsw i32 %275, -8
  %319 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 8
  br label %333

320:                                              ; preds = %278, %320
  %321 = phi i32 [ %331, %320 ], [ 0, %278 ]
  %322 = phi i64 [ %330, %320 ], [ 0, %278 ]
  %323 = zext i32 %321 to i64
  %324 = getelementptr inbounds i8, i8 addrspace(4)* %274, i64 %323
  %325 = load i8, i8 addrspace(4)* %324, align 1, !tbaa !11
  %326 = zext i8 %325 to i64
  %327 = shl i32 %321, 3
  %328 = zext i32 %327 to i64
  %329 = shl nuw i64 %326, %328
  %330 = or i64 %329, %322
  %331 = add nuw nsw i32 %321, 1
  %332 = icmp eq i32 %331, %275
  br i1 %332, label %333, label %320

333:                                              ; preds = %320, %280, %278
  %334 = phi i8 addrspace(4)* [ %319, %280 ], [ %274, %278 ], [ %274, %320 ]
  %335 = phi i32 [ %318, %280 ], [ 0, %278 ], [ 0, %320 ]
  %336 = phi i64 [ %317, %280 ], [ 0, %278 ], [ %330, %320 ]
  %337 = icmp ugt i32 %335, 7
  br i1 %337, label %340, label %338

338:                                              ; preds = %333
  %339 = icmp eq i32 %335, 0
  br i1 %339, label %393, label %380

340:                                              ; preds = %333
  %341 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !11
  %342 = zext i8 %341 to i64
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 1
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !11
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 8
  %347 = or i64 %346, %342
  %348 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 2
  %349 = load i8, i8 addrspace(4)* %348, align 1, !tbaa !11
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 16
  %352 = or i64 %347, %351
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 3
  %354 = load i8, i8 addrspace(4)* %353, align 1, !tbaa !11
  %355 = zext i8 %354 to i64
  %356 = shl nuw nsw i64 %355, 24
  %357 = or i64 %352, %356
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 4
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !11
  %360 = zext i8 %359 to i64
  %361 = shl nuw nsw i64 %360, 32
  %362 = or i64 %357, %361
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 5
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !11
  %365 = zext i8 %364 to i64
  %366 = shl nuw nsw i64 %365, 40
  %367 = or i64 %362, %366
  %368 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 6
  %369 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !11
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 48
  %372 = or i64 %367, %371
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 7
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !11
  %375 = zext i8 %374 to i64
  %376 = shl nuw i64 %375, 56
  %377 = or i64 %372, %376
  %378 = add nsw i32 %335, -8
  %379 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 8
  br label %393

380:                                              ; preds = %338, %380
  %381 = phi i32 [ %391, %380 ], [ 0, %338 ]
  %382 = phi i64 [ %390, %380 ], [ 0, %338 ]
  %383 = zext i32 %381 to i64
  %384 = getelementptr inbounds i8, i8 addrspace(4)* %334, i64 %383
  %385 = load i8, i8 addrspace(4)* %384, align 1, !tbaa !11
  %386 = zext i8 %385 to i64
  %387 = shl i32 %381, 3
  %388 = zext i32 %387 to i64
  %389 = shl nuw i64 %386, %388
  %390 = or i64 %389, %382
  %391 = add nuw nsw i32 %381, 1
  %392 = icmp eq i32 %391, %335
  br i1 %392, label %393, label %380

393:                                              ; preds = %380, %340, %338
  %394 = phi i8 addrspace(4)* [ %379, %340 ], [ %334, %338 ], [ %334, %380 ]
  %395 = phi i32 [ %378, %340 ], [ 0, %338 ], [ 0, %380 ]
  %396 = phi i64 [ %377, %340 ], [ 0, %338 ], [ %390, %380 ]
  %397 = icmp ugt i32 %395, 7
  br i1 %397, label %400, label %398

398:                                              ; preds = %393
  %399 = icmp eq i32 %395, 0
  br i1 %399, label %451, label %438

400:                                              ; preds = %393
  %401 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !11
  %402 = zext i8 %401 to i64
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 1
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !11
  %405 = zext i8 %404 to i64
  %406 = shl nuw nsw i64 %405, 8
  %407 = or i64 %406, %402
  %408 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 2
  %409 = load i8, i8 addrspace(4)* %408, align 1, !tbaa !11
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 16
  %412 = or i64 %407, %411
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 3
  %414 = load i8, i8 addrspace(4)* %413, align 1, !tbaa !11
  %415 = zext i8 %414 to i64
  %416 = shl nuw nsw i64 %415, 24
  %417 = or i64 %412, %416
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 4
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !11
  %420 = zext i8 %419 to i64
  %421 = shl nuw nsw i64 %420, 32
  %422 = or i64 %417, %421
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 5
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !11
  %425 = zext i8 %424 to i64
  %426 = shl nuw nsw i64 %425, 40
  %427 = or i64 %422, %426
  %428 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 6
  %429 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !11
  %430 = zext i8 %429 to i64
  %431 = shl nuw nsw i64 %430, 48
  %432 = or i64 %427, %431
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 7
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !11
  %435 = zext i8 %434 to i64
  %436 = shl nuw i64 %435, 56
  %437 = or i64 %432, %436
  br label %451

438:                                              ; preds = %398, %438
  %439 = phi i32 [ %449, %438 ], [ 0, %398 ]
  %440 = phi i64 [ %448, %438 ], [ 0, %398 ]
  %441 = zext i32 %439 to i64
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %394, i64 %441
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !11
  %444 = zext i8 %443 to i64
  %445 = shl i32 %439, 3
  %446 = zext i32 %445 to i64
  %447 = shl nuw i64 %444, %446
  %448 = or i64 %447, %440
  %449 = add nuw nsw i32 %439, 1
  %450 = icmp eq i32 %449, %395
  br i1 %450, label %451, label %438

451:                                              ; preds = %438, %400, %398
  %452 = phi i64 [ %437, %400 ], [ 0, %398 ], [ %448, %438 ]
  %453 = shl nuw nsw i64 %34, 2
  %454 = add nuw nsw i64 %453, 28
  %455 = and i64 %454, 480
  %456 = and i64 %36, -225
  %457 = or i64 %456, %455
  %458 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %457, i64 noundef %96, i64 noundef %156, i64 noundef %216, i64 noundef %276, i64 noundef %336, i64 noundef %396, i64 noundef %452) #10
  %459 = sub i64 %26, %34
  %460 = getelementptr inbounds i8, i8 addrspace(4)* %27, i64 %34
  %461 = icmp eq i64 %459, 0
  br i1 %461, label %462, label %25

462:                                              ; preds = %451, %17
  %463 = phi <2 x i64> [ %20, %17 ], [ %458, %451 ]
  %464 = extractelement <2 x i64> %463, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %465, label %469

465:                                              ; preds = %462
  %466 = and i64 %464, -225
  %467 = or i64 %466, 32
  %468 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %467, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %910

469:                                              ; preds = %462
  %470 = and i64 %464, 2
  %471 = and i64 %464, -3
  %472 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %471, i64 0
  br label %473

473:                                              ; preds = %899, %469
  %474 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.1, i64 0, i64 11) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([12 x i8]* addrspacecast ([12 x i8] addrspace(4)* @.str.1 to [12 x i8]*) to i64)), i64 1))), %469 ], [ %907, %899 ]
  %475 = phi i8 addrspace(4)* [ getelementptr inbounds ([12 x i8], [12 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %469 ], [ %908, %899 ]
  %476 = phi <2 x i64> [ %472, %469 ], [ %906, %899 ]
  %477 = icmp ugt i64 %474, 56
  %478 = extractelement <2 x i64> %476, i64 0
  %479 = or i64 %478, %470
  %480 = insertelement <2 x i64> poison, i64 %479, i64 0
  %481 = select i1 %477, <2 x i64> %476, <2 x i64> %480
  %482 = tail call i64 @llvm.umin.i64(i64 %474, i64 56)
  %483 = trunc i64 %482 to i32
  %484 = extractelement <2 x i64> %481, i64 0
  %485 = icmp ugt i32 %483, 7
  br i1 %485, label %488, label %486

486:                                              ; preds = %473
  %487 = icmp eq i32 %483, 0
  br i1 %487, label %541, label %528

488:                                              ; preds = %473
  %489 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !11
  %490 = zext i8 %489 to i64
  %491 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 1
  %492 = load i8, i8 addrspace(4)* %491, align 1, !tbaa !11
  %493 = zext i8 %492 to i64
  %494 = shl nuw nsw i64 %493, 8
  %495 = or i64 %494, %490
  %496 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 2
  %497 = load i8, i8 addrspace(4)* %496, align 1, !tbaa !11
  %498 = zext i8 %497 to i64
  %499 = shl nuw nsw i64 %498, 16
  %500 = or i64 %495, %499
  %501 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 3
  %502 = load i8, i8 addrspace(4)* %501, align 1, !tbaa !11
  %503 = zext i8 %502 to i64
  %504 = shl nuw nsw i64 %503, 24
  %505 = or i64 %500, %504
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 4
  %507 = load i8, i8 addrspace(4)* %506, align 1, !tbaa !11
  %508 = zext i8 %507 to i64
  %509 = shl nuw nsw i64 %508, 32
  %510 = or i64 %505, %509
  %511 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 5
  %512 = load i8, i8 addrspace(4)* %511, align 1, !tbaa !11
  %513 = zext i8 %512 to i64
  %514 = shl nuw nsw i64 %513, 40
  %515 = or i64 %510, %514
  %516 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 6
  %517 = load i8, i8 addrspace(4)* %516, align 1, !tbaa !11
  %518 = zext i8 %517 to i64
  %519 = shl nuw nsw i64 %518, 48
  %520 = or i64 %515, %519
  %521 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 7
  %522 = load i8, i8 addrspace(4)* %521, align 1, !tbaa !11
  %523 = zext i8 %522 to i64
  %524 = shl nuw i64 %523, 56
  %525 = or i64 %520, %524
  %526 = add nsw i32 %483, -8
  %527 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 8
  br label %541

528:                                              ; preds = %486, %528
  %529 = phi i32 [ %539, %528 ], [ 0, %486 ]
  %530 = phi i64 [ %538, %528 ], [ 0, %486 ]
  %531 = zext i32 %529 to i64
  %532 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 %531
  %533 = load i8, i8 addrspace(4)* %532, align 1, !tbaa !11
  %534 = zext i8 %533 to i64
  %535 = shl i32 %529, 3
  %536 = zext i32 %535 to i64
  %537 = shl nuw i64 %534, %536
  %538 = or i64 %537, %530
  %539 = add nuw nsw i32 %529, 1
  %540 = icmp eq i32 %539, %483
  br i1 %540, label %541, label %528, !llvm.loop !12

541:                                              ; preds = %528, %488, %486
  %542 = phi i8 addrspace(4)* [ %527, %488 ], [ %475, %486 ], [ %475, %528 ]
  %543 = phi i32 [ %526, %488 ], [ 0, %486 ], [ 0, %528 ]
  %544 = phi i64 [ %525, %488 ], [ 0, %486 ], [ %538, %528 ]
  %545 = icmp ugt i32 %543, 7
  br i1 %545, label %548, label %546

546:                                              ; preds = %541
  %547 = icmp eq i32 %543, 0
  br i1 %547, label %601, label %588

548:                                              ; preds = %541
  %549 = load i8, i8 addrspace(4)* %542, align 1, !tbaa !11
  %550 = zext i8 %549 to i64
  %551 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 1
  %552 = load i8, i8 addrspace(4)* %551, align 1, !tbaa !11
  %553 = zext i8 %552 to i64
  %554 = shl nuw nsw i64 %553, 8
  %555 = or i64 %554, %550
  %556 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 2
  %557 = load i8, i8 addrspace(4)* %556, align 1, !tbaa !11
  %558 = zext i8 %557 to i64
  %559 = shl nuw nsw i64 %558, 16
  %560 = or i64 %555, %559
  %561 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 3
  %562 = load i8, i8 addrspace(4)* %561, align 1, !tbaa !11
  %563 = zext i8 %562 to i64
  %564 = shl nuw nsw i64 %563, 24
  %565 = or i64 %560, %564
  %566 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 4
  %567 = load i8, i8 addrspace(4)* %566, align 1, !tbaa !11
  %568 = zext i8 %567 to i64
  %569 = shl nuw nsw i64 %568, 32
  %570 = or i64 %565, %569
  %571 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 5
  %572 = load i8, i8 addrspace(4)* %571, align 1, !tbaa !11
  %573 = zext i8 %572 to i64
  %574 = shl nuw nsw i64 %573, 40
  %575 = or i64 %570, %574
  %576 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 6
  %577 = load i8, i8 addrspace(4)* %576, align 1, !tbaa !11
  %578 = zext i8 %577 to i64
  %579 = shl nuw nsw i64 %578, 48
  %580 = or i64 %575, %579
  %581 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 7
  %582 = load i8, i8 addrspace(4)* %581, align 1, !tbaa !11
  %583 = zext i8 %582 to i64
  %584 = shl nuw i64 %583, 56
  %585 = or i64 %580, %584
  %586 = add nsw i32 %543, -8
  %587 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 8
  br label %601

588:                                              ; preds = %546, %588
  %589 = phi i32 [ %599, %588 ], [ 0, %546 ]
  %590 = phi i64 [ %598, %588 ], [ 0, %546 ]
  %591 = zext i32 %589 to i64
  %592 = getelementptr inbounds i8, i8 addrspace(4)* %542, i64 %591
  %593 = load i8, i8 addrspace(4)* %592, align 1, !tbaa !11
  %594 = zext i8 %593 to i64
  %595 = shl i32 %589, 3
  %596 = zext i32 %595 to i64
  %597 = shl nuw i64 %594, %596
  %598 = or i64 %597, %590
  %599 = add nuw nsw i32 %589, 1
  %600 = icmp eq i32 %599, %543
  br i1 %600, label %601, label %588

601:                                              ; preds = %588, %548, %546
  %602 = phi i8 addrspace(4)* [ %587, %548 ], [ %542, %546 ], [ %542, %588 ]
  %603 = phi i32 [ %586, %548 ], [ 0, %546 ], [ 0, %588 ]
  %604 = phi i64 [ %585, %548 ], [ 0, %546 ], [ %598, %588 ]
  %605 = icmp ugt i32 %603, 7
  br i1 %605, label %608, label %606

606:                                              ; preds = %601
  %607 = icmp eq i32 %603, 0
  br i1 %607, label %661, label %648

608:                                              ; preds = %601
  %609 = load i8, i8 addrspace(4)* %602, align 1, !tbaa !11
  %610 = zext i8 %609 to i64
  %611 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 1
  %612 = load i8, i8 addrspace(4)* %611, align 1, !tbaa !11
  %613 = zext i8 %612 to i64
  %614 = shl nuw nsw i64 %613, 8
  %615 = or i64 %614, %610
  %616 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 2
  %617 = load i8, i8 addrspace(4)* %616, align 1, !tbaa !11
  %618 = zext i8 %617 to i64
  %619 = shl nuw nsw i64 %618, 16
  %620 = or i64 %615, %619
  %621 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 3
  %622 = load i8, i8 addrspace(4)* %621, align 1, !tbaa !11
  %623 = zext i8 %622 to i64
  %624 = shl nuw nsw i64 %623, 24
  %625 = or i64 %620, %624
  %626 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 4
  %627 = load i8, i8 addrspace(4)* %626, align 1, !tbaa !11
  %628 = zext i8 %627 to i64
  %629 = shl nuw nsw i64 %628, 32
  %630 = or i64 %625, %629
  %631 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 5
  %632 = load i8, i8 addrspace(4)* %631, align 1, !tbaa !11
  %633 = zext i8 %632 to i64
  %634 = shl nuw nsw i64 %633, 40
  %635 = or i64 %630, %634
  %636 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 6
  %637 = load i8, i8 addrspace(4)* %636, align 1, !tbaa !11
  %638 = zext i8 %637 to i64
  %639 = shl nuw nsw i64 %638, 48
  %640 = or i64 %635, %639
  %641 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 7
  %642 = load i8, i8 addrspace(4)* %641, align 1, !tbaa !11
  %643 = zext i8 %642 to i64
  %644 = shl nuw i64 %643, 56
  %645 = or i64 %640, %644
  %646 = add nsw i32 %603, -8
  %647 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 8
  br label %661

648:                                              ; preds = %606, %648
  %649 = phi i32 [ %659, %648 ], [ 0, %606 ]
  %650 = phi i64 [ %658, %648 ], [ 0, %606 ]
  %651 = zext i32 %649 to i64
  %652 = getelementptr inbounds i8, i8 addrspace(4)* %602, i64 %651
  %653 = load i8, i8 addrspace(4)* %652, align 1, !tbaa !11
  %654 = zext i8 %653 to i64
  %655 = shl i32 %649, 3
  %656 = zext i32 %655 to i64
  %657 = shl nuw i64 %654, %656
  %658 = or i64 %657, %650
  %659 = add nuw nsw i32 %649, 1
  %660 = icmp eq i32 %659, %603
  br i1 %660, label %661, label %648

661:                                              ; preds = %648, %608, %606
  %662 = phi i8 addrspace(4)* [ %647, %608 ], [ %602, %606 ], [ %602, %648 ]
  %663 = phi i32 [ %646, %608 ], [ 0, %606 ], [ 0, %648 ]
  %664 = phi i64 [ %645, %608 ], [ 0, %606 ], [ %658, %648 ]
  %665 = icmp ugt i32 %663, 7
  br i1 %665, label %668, label %666

666:                                              ; preds = %661
  %667 = icmp eq i32 %663, 0
  br i1 %667, label %721, label %708

668:                                              ; preds = %661
  %669 = load i8, i8 addrspace(4)* %662, align 1, !tbaa !11
  %670 = zext i8 %669 to i64
  %671 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 1
  %672 = load i8, i8 addrspace(4)* %671, align 1, !tbaa !11
  %673 = zext i8 %672 to i64
  %674 = shl nuw nsw i64 %673, 8
  %675 = or i64 %674, %670
  %676 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 2
  %677 = load i8, i8 addrspace(4)* %676, align 1, !tbaa !11
  %678 = zext i8 %677 to i64
  %679 = shl nuw nsw i64 %678, 16
  %680 = or i64 %675, %679
  %681 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 3
  %682 = load i8, i8 addrspace(4)* %681, align 1, !tbaa !11
  %683 = zext i8 %682 to i64
  %684 = shl nuw nsw i64 %683, 24
  %685 = or i64 %680, %684
  %686 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 4
  %687 = load i8, i8 addrspace(4)* %686, align 1, !tbaa !11
  %688 = zext i8 %687 to i64
  %689 = shl nuw nsw i64 %688, 32
  %690 = or i64 %685, %689
  %691 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 5
  %692 = load i8, i8 addrspace(4)* %691, align 1, !tbaa !11
  %693 = zext i8 %692 to i64
  %694 = shl nuw nsw i64 %693, 40
  %695 = or i64 %690, %694
  %696 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 6
  %697 = load i8, i8 addrspace(4)* %696, align 1, !tbaa !11
  %698 = zext i8 %697 to i64
  %699 = shl nuw nsw i64 %698, 48
  %700 = or i64 %695, %699
  %701 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 7
  %702 = load i8, i8 addrspace(4)* %701, align 1, !tbaa !11
  %703 = zext i8 %702 to i64
  %704 = shl nuw i64 %703, 56
  %705 = or i64 %700, %704
  %706 = add nsw i32 %663, -8
  %707 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 8
  br label %721

708:                                              ; preds = %666, %708
  %709 = phi i32 [ %719, %708 ], [ 0, %666 ]
  %710 = phi i64 [ %718, %708 ], [ 0, %666 ]
  %711 = zext i32 %709 to i64
  %712 = getelementptr inbounds i8, i8 addrspace(4)* %662, i64 %711
  %713 = load i8, i8 addrspace(4)* %712, align 1, !tbaa !11
  %714 = zext i8 %713 to i64
  %715 = shl i32 %709, 3
  %716 = zext i32 %715 to i64
  %717 = shl nuw i64 %714, %716
  %718 = or i64 %717, %710
  %719 = add nuw nsw i32 %709, 1
  %720 = icmp eq i32 %719, %663
  br i1 %720, label %721, label %708

721:                                              ; preds = %708, %668, %666
  %722 = phi i8 addrspace(4)* [ %707, %668 ], [ %662, %666 ], [ %662, %708 ]
  %723 = phi i32 [ %706, %668 ], [ 0, %666 ], [ 0, %708 ]
  %724 = phi i64 [ %705, %668 ], [ 0, %666 ], [ %718, %708 ]
  %725 = icmp ugt i32 %723, 7
  br i1 %725, label %728, label %726

726:                                              ; preds = %721
  %727 = icmp eq i32 %723, 0
  br i1 %727, label %781, label %768

728:                                              ; preds = %721
  %729 = load i8, i8 addrspace(4)* %722, align 1, !tbaa !11
  %730 = zext i8 %729 to i64
  %731 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 1
  %732 = load i8, i8 addrspace(4)* %731, align 1, !tbaa !11
  %733 = zext i8 %732 to i64
  %734 = shl nuw nsw i64 %733, 8
  %735 = or i64 %734, %730
  %736 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 2
  %737 = load i8, i8 addrspace(4)* %736, align 1, !tbaa !11
  %738 = zext i8 %737 to i64
  %739 = shl nuw nsw i64 %738, 16
  %740 = or i64 %735, %739
  %741 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 3
  %742 = load i8, i8 addrspace(4)* %741, align 1, !tbaa !11
  %743 = zext i8 %742 to i64
  %744 = shl nuw nsw i64 %743, 24
  %745 = or i64 %740, %744
  %746 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 4
  %747 = load i8, i8 addrspace(4)* %746, align 1, !tbaa !11
  %748 = zext i8 %747 to i64
  %749 = shl nuw nsw i64 %748, 32
  %750 = or i64 %745, %749
  %751 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 5
  %752 = load i8, i8 addrspace(4)* %751, align 1, !tbaa !11
  %753 = zext i8 %752 to i64
  %754 = shl nuw nsw i64 %753, 40
  %755 = or i64 %750, %754
  %756 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 6
  %757 = load i8, i8 addrspace(4)* %756, align 1, !tbaa !11
  %758 = zext i8 %757 to i64
  %759 = shl nuw nsw i64 %758, 48
  %760 = or i64 %755, %759
  %761 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 7
  %762 = load i8, i8 addrspace(4)* %761, align 1, !tbaa !11
  %763 = zext i8 %762 to i64
  %764 = shl nuw i64 %763, 56
  %765 = or i64 %760, %764
  %766 = add nsw i32 %723, -8
  %767 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 8
  br label %781

768:                                              ; preds = %726, %768
  %769 = phi i32 [ %779, %768 ], [ 0, %726 ]
  %770 = phi i64 [ %778, %768 ], [ 0, %726 ]
  %771 = zext i32 %769 to i64
  %772 = getelementptr inbounds i8, i8 addrspace(4)* %722, i64 %771
  %773 = load i8, i8 addrspace(4)* %772, align 1, !tbaa !11
  %774 = zext i8 %773 to i64
  %775 = shl i32 %769, 3
  %776 = zext i32 %775 to i64
  %777 = shl nuw i64 %774, %776
  %778 = or i64 %777, %770
  %779 = add nuw nsw i32 %769, 1
  %780 = icmp eq i32 %779, %723
  br i1 %780, label %781, label %768

781:                                              ; preds = %768, %728, %726
  %782 = phi i8 addrspace(4)* [ %767, %728 ], [ %722, %726 ], [ %722, %768 ]
  %783 = phi i32 [ %766, %728 ], [ 0, %726 ], [ 0, %768 ]
  %784 = phi i64 [ %765, %728 ], [ 0, %726 ], [ %778, %768 ]
  %785 = icmp ugt i32 %783, 7
  br i1 %785, label %788, label %786

786:                                              ; preds = %781
  %787 = icmp eq i32 %783, 0
  br i1 %787, label %841, label %828

788:                                              ; preds = %781
  %789 = load i8, i8 addrspace(4)* %782, align 1, !tbaa !11
  %790 = zext i8 %789 to i64
  %791 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 1
  %792 = load i8, i8 addrspace(4)* %791, align 1, !tbaa !11
  %793 = zext i8 %792 to i64
  %794 = shl nuw nsw i64 %793, 8
  %795 = or i64 %794, %790
  %796 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 2
  %797 = load i8, i8 addrspace(4)* %796, align 1, !tbaa !11
  %798 = zext i8 %797 to i64
  %799 = shl nuw nsw i64 %798, 16
  %800 = or i64 %795, %799
  %801 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 3
  %802 = load i8, i8 addrspace(4)* %801, align 1, !tbaa !11
  %803 = zext i8 %802 to i64
  %804 = shl nuw nsw i64 %803, 24
  %805 = or i64 %800, %804
  %806 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 4
  %807 = load i8, i8 addrspace(4)* %806, align 1, !tbaa !11
  %808 = zext i8 %807 to i64
  %809 = shl nuw nsw i64 %808, 32
  %810 = or i64 %805, %809
  %811 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 5
  %812 = load i8, i8 addrspace(4)* %811, align 1, !tbaa !11
  %813 = zext i8 %812 to i64
  %814 = shl nuw nsw i64 %813, 40
  %815 = or i64 %810, %814
  %816 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 6
  %817 = load i8, i8 addrspace(4)* %816, align 1, !tbaa !11
  %818 = zext i8 %817 to i64
  %819 = shl nuw nsw i64 %818, 48
  %820 = or i64 %815, %819
  %821 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 7
  %822 = load i8, i8 addrspace(4)* %821, align 1, !tbaa !11
  %823 = zext i8 %822 to i64
  %824 = shl nuw i64 %823, 56
  %825 = or i64 %820, %824
  %826 = add nsw i32 %783, -8
  %827 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 8
  br label %841

828:                                              ; preds = %786, %828
  %829 = phi i32 [ %839, %828 ], [ 0, %786 ]
  %830 = phi i64 [ %838, %828 ], [ 0, %786 ]
  %831 = zext i32 %829 to i64
  %832 = getelementptr inbounds i8, i8 addrspace(4)* %782, i64 %831
  %833 = load i8, i8 addrspace(4)* %832, align 1, !tbaa !11
  %834 = zext i8 %833 to i64
  %835 = shl i32 %829, 3
  %836 = zext i32 %835 to i64
  %837 = shl nuw i64 %834, %836
  %838 = or i64 %837, %830
  %839 = add nuw nsw i32 %829, 1
  %840 = icmp eq i32 %839, %783
  br i1 %840, label %841, label %828

841:                                              ; preds = %828, %788, %786
  %842 = phi i8 addrspace(4)* [ %827, %788 ], [ %782, %786 ], [ %782, %828 ]
  %843 = phi i32 [ %826, %788 ], [ 0, %786 ], [ 0, %828 ]
  %844 = phi i64 [ %825, %788 ], [ 0, %786 ], [ %838, %828 ]
  %845 = icmp ugt i32 %843, 7
  br i1 %845, label %848, label %846

846:                                              ; preds = %841
  %847 = icmp eq i32 %843, 0
  br i1 %847, label %899, label %886

848:                                              ; preds = %841
  %849 = load i8, i8 addrspace(4)* %842, align 1, !tbaa !11
  %850 = zext i8 %849 to i64
  %851 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 1
  %852 = load i8, i8 addrspace(4)* %851, align 1, !tbaa !11
  %853 = zext i8 %852 to i64
  %854 = shl nuw nsw i64 %853, 8
  %855 = or i64 %854, %850
  %856 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 2
  %857 = load i8, i8 addrspace(4)* %856, align 1, !tbaa !11
  %858 = zext i8 %857 to i64
  %859 = shl nuw nsw i64 %858, 16
  %860 = or i64 %855, %859
  %861 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 3
  %862 = load i8, i8 addrspace(4)* %861, align 1, !tbaa !11
  %863 = zext i8 %862 to i64
  %864 = shl nuw nsw i64 %863, 24
  %865 = or i64 %860, %864
  %866 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 4
  %867 = load i8, i8 addrspace(4)* %866, align 1, !tbaa !11
  %868 = zext i8 %867 to i64
  %869 = shl nuw nsw i64 %868, 32
  %870 = or i64 %865, %869
  %871 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 5
  %872 = load i8, i8 addrspace(4)* %871, align 1, !tbaa !11
  %873 = zext i8 %872 to i64
  %874 = shl nuw nsw i64 %873, 40
  %875 = or i64 %870, %874
  %876 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 6
  %877 = load i8, i8 addrspace(4)* %876, align 1, !tbaa !11
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 48
  %880 = or i64 %875, %879
  %881 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 7
  %882 = load i8, i8 addrspace(4)* %881, align 1, !tbaa !11
  %883 = zext i8 %882 to i64
  %884 = shl nuw i64 %883, 56
  %885 = or i64 %880, %884
  br label %899

886:                                              ; preds = %846, %886
  %887 = phi i32 [ %897, %886 ], [ 0, %846 ]
  %888 = phi i64 [ %896, %886 ], [ 0, %846 ]
  %889 = zext i32 %887 to i64
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %842, i64 %889
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !11
  %892 = zext i8 %891 to i64
  %893 = shl i32 %887, 3
  %894 = zext i32 %893 to i64
  %895 = shl nuw i64 %892, %894
  %896 = or i64 %895, %888
  %897 = add nuw nsw i32 %887, 1
  %898 = icmp eq i32 %897, %843
  br i1 %898, label %899, label %886

899:                                              ; preds = %886, %848, %846
  %900 = phi i64 [ %885, %848 ], [ 0, %846 ], [ %896, %886 ]
  %901 = shl nuw nsw i64 %482, 2
  %902 = add nuw nsw i64 %901, 28
  %903 = and i64 %902, 480
  %904 = and i64 %484, -225
  %905 = or i64 %904, %903
  %906 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %905, i64 noundef %544, i64 noundef %604, i64 noundef %664, i64 noundef %724, i64 noundef %784, i64 noundef %844, i64 noundef %900) #10
  %907 = sub i64 %474, %482
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %475, i64 %482
  %909 = icmp eq i64 %907, 0
  br i1 %909, label %910, label %473

910:                                              ; preds = %899, %465
  %911 = phi <2 x i64> [ %468, %465 ], [ %906, %899 ]
  %912 = extractelement <2 x i64> %911, i64 0
  %913 = zext i32 %1 to i64
  %914 = and i64 %912, -225
  %915 = or i64 %914, 32
  %916 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %915, i64 noundef %913, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %917 = extractelement <2 x i64> %916, i64 0
  %918 = zext i32 %4 to i64
  %919 = and i64 %917, -225
  %920 = or i64 %919, 32
  %921 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %920, i64 noundef %918, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %922 = extractelement <2 x i64> %921, i64 0
  %923 = zext i16 %8 to i64
  %924 = and i64 %922, -227
  %925 = or i64 %924, 34
  %926 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %14, i64 noundef %925, i64 noundef %923, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %927

927:                                              ; preds = %910, %0
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
