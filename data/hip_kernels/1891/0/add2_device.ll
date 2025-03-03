; ModuleID = '../data/hip_kernels/1891/0/main.cu'
source_filename = "../data/hip_kernels/1891/0/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [16 x i8] c"Hellow world_3\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [16 x i8] c"Hellow world_2\0A\00", align 1
@.str.2 = private unnamed_addr addrspace(4) constant [16 x i8] c"Hellow world_4\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z4add2iiPi(i32 %0, i32 %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #1 {
  %4 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %5 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 24
  %6 = bitcast i8 addrspace(4)* %5 to i64 addrspace(4)*
  %7 = load i64, i64 addrspace(4)* %6, align 8, !tbaa !4
  %8 = inttoptr i64 %7 to i8 addrspace(1)*
  %9 = addrspacecast i8 addrspace(1)* %8 to i8*
  %10 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %11 = extractelement <2 x i64> %10, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %12, label %16

12:                                               ; preds = %3
  %13 = and i64 %11, -227
  %14 = or i64 %13, 34
  %15 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %14, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %456

16:                                               ; preds = %3
  %17 = and i64 %11, -3
  %18 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %17, i64 0
  br label %19

19:                                               ; preds = %445, %16
  %20 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.1 to [16 x i8]*) to i64)), i64 1))), %16 ], [ %453, %445 ]
  %21 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %16 ], [ %454, %445 ]
  %22 = phi <2 x i64> [ %18, %16 ], [ %452, %445 ]
  %23 = icmp ugt i64 %20, 56
  %24 = extractelement <2 x i64> %22, i64 0
  %25 = or i64 %24, 2
  %26 = insertelement <2 x i64> poison, i64 %25, i64 0
  %27 = select i1 %23, <2 x i64> %22, <2 x i64> %26
  %28 = tail call i64 @llvm.umin.i64(i64 %20, i64 56)
  %29 = trunc i64 %28 to i32
  %30 = extractelement <2 x i64> %27, i64 0
  %31 = icmp ugt i32 %29, 7
  br i1 %31, label %34, label %32

32:                                               ; preds = %19
  %33 = icmp eq i32 %29, 0
  br i1 %33, label %87, label %74

34:                                               ; preds = %19
  %35 = load i8, i8 addrspace(4)* %21, align 1, !tbaa !8
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 1
  %38 = load i8, i8 addrspace(4)* %37, align 1, !tbaa !8
  %39 = zext i8 %38 to i64
  %40 = shl nuw nsw i64 %39, 8
  %41 = or i64 %40, %36
  %42 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 2
  %43 = load i8, i8 addrspace(4)* %42, align 1, !tbaa !8
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 16
  %46 = or i64 %41, %45
  %47 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 3
  %48 = load i8, i8 addrspace(4)* %47, align 1, !tbaa !8
  %49 = zext i8 %48 to i64
  %50 = shl nuw nsw i64 %49, 24
  %51 = or i64 %46, %50
  %52 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 4
  %53 = load i8, i8 addrspace(4)* %52, align 1, !tbaa !8
  %54 = zext i8 %53 to i64
  %55 = shl nuw nsw i64 %54, 32
  %56 = or i64 %51, %55
  %57 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 5
  %58 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !8
  %59 = zext i8 %58 to i64
  %60 = shl nuw nsw i64 %59, 40
  %61 = or i64 %56, %60
  %62 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 6
  %63 = load i8, i8 addrspace(4)* %62, align 1, !tbaa !8
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 48
  %66 = or i64 %61, %65
  %67 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 7
  %68 = load i8, i8 addrspace(4)* %67, align 1, !tbaa !8
  %69 = zext i8 %68 to i64
  %70 = shl nuw i64 %69, 56
  %71 = or i64 %66, %70
  %72 = add nsw i32 %29, -8
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 8
  br label %87

74:                                               ; preds = %32, %74
  %75 = phi i32 [ %85, %74 ], [ 0, %32 ]
  %76 = phi i64 [ %84, %74 ], [ 0, %32 ]
  %77 = zext i32 %75 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 %77
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !8
  %80 = zext i8 %79 to i64
  %81 = shl i32 %75, 3
  %82 = zext i32 %81 to i64
  %83 = shl nuw i64 %80, %82
  %84 = or i64 %83, %76
  %85 = add nuw nsw i32 %75, 1
  %86 = icmp eq i32 %85, %29
  br i1 %86, label %87, label %74, !llvm.loop !9

87:                                               ; preds = %74, %34, %32
  %88 = phi i8 addrspace(4)* [ %73, %34 ], [ %21, %32 ], [ %21, %74 ]
  %89 = phi i32 [ %72, %34 ], [ 0, %32 ], [ 0, %74 ]
  %90 = phi i64 [ %71, %34 ], [ 0, %32 ], [ %84, %74 ]
  %91 = icmp ugt i32 %89, 7
  br i1 %91, label %94, label %92

92:                                               ; preds = %87
  %93 = icmp eq i32 %89, 0
  br i1 %93, label %147, label %134

94:                                               ; preds = %87
  %95 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !8
  %96 = zext i8 %95 to i64
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 1
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !8
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 8
  %101 = or i64 %100, %96
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 2
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !8
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 16
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 3
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !8
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 24
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 4
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !8
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 32
  %116 = or i64 %111, %115
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 5
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !8
  %119 = zext i8 %118 to i64
  %120 = shl nuw nsw i64 %119, 40
  %121 = or i64 %116, %120
  %122 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 6
  %123 = load i8, i8 addrspace(4)* %122, align 1, !tbaa !8
  %124 = zext i8 %123 to i64
  %125 = shl nuw nsw i64 %124, 48
  %126 = or i64 %121, %125
  %127 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 7
  %128 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !8
  %129 = zext i8 %128 to i64
  %130 = shl nuw i64 %129, 56
  %131 = or i64 %126, %130
  %132 = add nsw i32 %89, -8
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 8
  br label %147

134:                                              ; preds = %92, %134
  %135 = phi i32 [ %145, %134 ], [ 0, %92 ]
  %136 = phi i64 [ %144, %134 ], [ 0, %92 ]
  %137 = zext i32 %135 to i64
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %88, i64 %137
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !8
  %140 = zext i8 %139 to i64
  %141 = shl i32 %135, 3
  %142 = zext i32 %141 to i64
  %143 = shl nuw i64 %140, %142
  %144 = or i64 %143, %136
  %145 = add nuw nsw i32 %135, 1
  %146 = icmp eq i32 %145, %89
  br i1 %146, label %147, label %134

147:                                              ; preds = %134, %94, %92
  %148 = phi i8 addrspace(4)* [ %133, %94 ], [ %88, %92 ], [ %88, %134 ]
  %149 = phi i32 [ %132, %94 ], [ 0, %92 ], [ 0, %134 ]
  %150 = phi i64 [ %131, %94 ], [ 0, %92 ], [ %144, %134 ]
  %151 = icmp ugt i32 %149, 7
  br i1 %151, label %154, label %152

152:                                              ; preds = %147
  %153 = icmp eq i32 %149, 0
  br i1 %153, label %207, label %194

154:                                              ; preds = %147
  %155 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !8
  %156 = zext i8 %155 to i64
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 1
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !8
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 8
  %161 = or i64 %160, %156
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 2
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !8
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 16
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 3
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !8
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 24
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 4
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !8
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 32
  %176 = or i64 %171, %175
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 5
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !8
  %179 = zext i8 %178 to i64
  %180 = shl nuw nsw i64 %179, 40
  %181 = or i64 %176, %180
  %182 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 6
  %183 = load i8, i8 addrspace(4)* %182, align 1, !tbaa !8
  %184 = zext i8 %183 to i64
  %185 = shl nuw nsw i64 %184, 48
  %186 = or i64 %181, %185
  %187 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 7
  %188 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !8
  %189 = zext i8 %188 to i64
  %190 = shl nuw i64 %189, 56
  %191 = or i64 %186, %190
  %192 = add nsw i32 %149, -8
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 8
  br label %207

194:                                              ; preds = %152, %194
  %195 = phi i32 [ %205, %194 ], [ 0, %152 ]
  %196 = phi i64 [ %204, %194 ], [ 0, %152 ]
  %197 = zext i32 %195 to i64
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %148, i64 %197
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !8
  %200 = zext i8 %199 to i64
  %201 = shl i32 %195, 3
  %202 = zext i32 %201 to i64
  %203 = shl nuw i64 %200, %202
  %204 = or i64 %203, %196
  %205 = add nuw nsw i32 %195, 1
  %206 = icmp eq i32 %205, %149
  br i1 %206, label %207, label %194

207:                                              ; preds = %194, %154, %152
  %208 = phi i8 addrspace(4)* [ %193, %154 ], [ %148, %152 ], [ %148, %194 ]
  %209 = phi i32 [ %192, %154 ], [ 0, %152 ], [ 0, %194 ]
  %210 = phi i64 [ %191, %154 ], [ 0, %152 ], [ %204, %194 ]
  %211 = icmp ugt i32 %209, 7
  br i1 %211, label %214, label %212

212:                                              ; preds = %207
  %213 = icmp eq i32 %209, 0
  br i1 %213, label %267, label %254

214:                                              ; preds = %207
  %215 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !8
  %216 = zext i8 %215 to i64
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 1
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !8
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 8
  %221 = or i64 %220, %216
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 2
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !8
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 16
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 3
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !8
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 24
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 4
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !8
  %234 = zext i8 %233 to i64
  %235 = shl nuw nsw i64 %234, 32
  %236 = or i64 %231, %235
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 5
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !8
  %239 = zext i8 %238 to i64
  %240 = shl nuw nsw i64 %239, 40
  %241 = or i64 %236, %240
  %242 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 6
  %243 = load i8, i8 addrspace(4)* %242, align 1, !tbaa !8
  %244 = zext i8 %243 to i64
  %245 = shl nuw nsw i64 %244, 48
  %246 = or i64 %241, %245
  %247 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 7
  %248 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !8
  %249 = zext i8 %248 to i64
  %250 = shl nuw i64 %249, 56
  %251 = or i64 %246, %250
  %252 = add nsw i32 %209, -8
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 8
  br label %267

254:                                              ; preds = %212, %254
  %255 = phi i32 [ %265, %254 ], [ 0, %212 ]
  %256 = phi i64 [ %264, %254 ], [ 0, %212 ]
  %257 = zext i32 %255 to i64
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %208, i64 %257
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !8
  %260 = zext i8 %259 to i64
  %261 = shl i32 %255, 3
  %262 = zext i32 %261 to i64
  %263 = shl nuw i64 %260, %262
  %264 = or i64 %263, %256
  %265 = add nuw nsw i32 %255, 1
  %266 = icmp eq i32 %265, %209
  br i1 %266, label %267, label %254

267:                                              ; preds = %254, %214, %212
  %268 = phi i8 addrspace(4)* [ %253, %214 ], [ %208, %212 ], [ %208, %254 ]
  %269 = phi i32 [ %252, %214 ], [ 0, %212 ], [ 0, %254 ]
  %270 = phi i64 [ %251, %214 ], [ 0, %212 ], [ %264, %254 ]
  %271 = icmp ugt i32 %269, 7
  br i1 %271, label %274, label %272

272:                                              ; preds = %267
  %273 = icmp eq i32 %269, 0
  br i1 %273, label %327, label %314

274:                                              ; preds = %267
  %275 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !8
  %276 = zext i8 %275 to i64
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 1
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !8
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 8
  %281 = or i64 %280, %276
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 2
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !8
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 16
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 3
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !8
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 24
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 4
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !8
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 32
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 5
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !8
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 40
  %301 = or i64 %296, %300
  %302 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 6
  %303 = load i8, i8 addrspace(4)* %302, align 1, !tbaa !8
  %304 = zext i8 %303 to i64
  %305 = shl nuw nsw i64 %304, 48
  %306 = or i64 %301, %305
  %307 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 7
  %308 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !8
  %309 = zext i8 %308 to i64
  %310 = shl nuw i64 %309, 56
  %311 = or i64 %306, %310
  %312 = add nsw i32 %269, -8
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 8
  br label %327

314:                                              ; preds = %272, %314
  %315 = phi i32 [ %325, %314 ], [ 0, %272 ]
  %316 = phi i64 [ %324, %314 ], [ 0, %272 ]
  %317 = zext i32 %315 to i64
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %268, i64 %317
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !8
  %320 = zext i8 %319 to i64
  %321 = shl i32 %315, 3
  %322 = zext i32 %321 to i64
  %323 = shl nuw i64 %320, %322
  %324 = or i64 %323, %316
  %325 = add nuw nsw i32 %315, 1
  %326 = icmp eq i32 %325, %269
  br i1 %326, label %327, label %314

327:                                              ; preds = %314, %274, %272
  %328 = phi i8 addrspace(4)* [ %313, %274 ], [ %268, %272 ], [ %268, %314 ]
  %329 = phi i32 [ %312, %274 ], [ 0, %272 ], [ 0, %314 ]
  %330 = phi i64 [ %311, %274 ], [ 0, %272 ], [ %324, %314 ]
  %331 = icmp ugt i32 %329, 7
  br i1 %331, label %334, label %332

332:                                              ; preds = %327
  %333 = icmp eq i32 %329, 0
  br i1 %333, label %387, label %374

334:                                              ; preds = %327
  %335 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !8
  %336 = zext i8 %335 to i64
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 1
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !8
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 8
  %341 = or i64 %340, %336
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 2
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !8
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 16
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 3
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !8
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 24
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 4
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !8
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 32
  %356 = or i64 %351, %355
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 5
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !8
  %359 = zext i8 %358 to i64
  %360 = shl nuw nsw i64 %359, 40
  %361 = or i64 %356, %360
  %362 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 6
  %363 = load i8, i8 addrspace(4)* %362, align 1, !tbaa !8
  %364 = zext i8 %363 to i64
  %365 = shl nuw nsw i64 %364, 48
  %366 = or i64 %361, %365
  %367 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 7
  %368 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !8
  %369 = zext i8 %368 to i64
  %370 = shl nuw i64 %369, 56
  %371 = or i64 %366, %370
  %372 = add nsw i32 %329, -8
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 8
  br label %387

374:                                              ; preds = %332, %374
  %375 = phi i32 [ %385, %374 ], [ 0, %332 ]
  %376 = phi i64 [ %384, %374 ], [ 0, %332 ]
  %377 = zext i32 %375 to i64
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %328, i64 %377
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !8
  %380 = zext i8 %379 to i64
  %381 = shl i32 %375, 3
  %382 = zext i32 %381 to i64
  %383 = shl nuw i64 %380, %382
  %384 = or i64 %383, %376
  %385 = add nuw nsw i32 %375, 1
  %386 = icmp eq i32 %385, %329
  br i1 %386, label %387, label %374

387:                                              ; preds = %374, %334, %332
  %388 = phi i8 addrspace(4)* [ %373, %334 ], [ %328, %332 ], [ %328, %374 ]
  %389 = phi i32 [ %372, %334 ], [ 0, %332 ], [ 0, %374 ]
  %390 = phi i64 [ %371, %334 ], [ 0, %332 ], [ %384, %374 ]
  %391 = icmp ugt i32 %389, 7
  br i1 %391, label %394, label %392

392:                                              ; preds = %387
  %393 = icmp eq i32 %389, 0
  br i1 %393, label %445, label %432

394:                                              ; preds = %387
  %395 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !8
  %396 = zext i8 %395 to i64
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 1
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !8
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 8
  %401 = or i64 %400, %396
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 2
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !8
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 16
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 3
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !8
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 24
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 4
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !8
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 32
  %416 = or i64 %411, %415
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 5
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !8
  %419 = zext i8 %418 to i64
  %420 = shl nuw nsw i64 %419, 40
  %421 = or i64 %416, %420
  %422 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 6
  %423 = load i8, i8 addrspace(4)* %422, align 1, !tbaa !8
  %424 = zext i8 %423 to i64
  %425 = shl nuw nsw i64 %424, 48
  %426 = or i64 %421, %425
  %427 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 7
  %428 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !8
  %429 = zext i8 %428 to i64
  %430 = shl nuw i64 %429, 56
  %431 = or i64 %426, %430
  br label %445

432:                                              ; preds = %392, %432
  %433 = phi i32 [ %443, %432 ], [ 0, %392 ]
  %434 = phi i64 [ %442, %432 ], [ 0, %392 ]
  %435 = zext i32 %433 to i64
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %388, i64 %435
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !8
  %438 = zext i8 %437 to i64
  %439 = shl i32 %433, 3
  %440 = zext i32 %439 to i64
  %441 = shl nuw i64 %438, %440
  %442 = or i64 %441, %434
  %443 = add nuw nsw i32 %433, 1
  %444 = icmp eq i32 %443, %389
  br i1 %444, label %445, label %432

445:                                              ; preds = %432, %394, %392
  %446 = phi i64 [ %431, %394 ], [ 0, %392 ], [ %442, %432 ]
  %447 = shl nuw nsw i64 %28, 2
  %448 = add nuw nsw i64 %447, 28
  %449 = and i64 %448, 480
  %450 = and i64 %30, -225
  %451 = or i64 %450, %449
  %452 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %451, i64 noundef %90, i64 noundef %150, i64 noundef %210, i64 noundef %270, i64 noundef %330, i64 noundef %390, i64 noundef %446) #10
  %453 = sub i64 %20, %28
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %21, i64 %28
  %455 = icmp eq i64 %453, 0
  br i1 %455, label %456, label %19

456:                                              ; preds = %445, %12
  %457 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %458 = extractelement <2 x i64> %457, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %459, label %463

459:                                              ; preds = %456
  %460 = and i64 %458, -227
  %461 = or i64 %460, 34
  %462 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %461, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %903

463:                                              ; preds = %456
  %464 = and i64 %458, -3
  %465 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %464, i64 0
  br label %466

466:                                              ; preds = %892, %463
  %467 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str to [16 x i8]*) to i64)), i64 1))), %463 ], [ %900, %892 ]
  %468 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str, i64 0, i64 0), %463 ], [ %901, %892 ]
  %469 = phi <2 x i64> [ %465, %463 ], [ %899, %892 ]
  %470 = icmp ugt i64 %467, 56
  %471 = extractelement <2 x i64> %469, i64 0
  %472 = or i64 %471, 2
  %473 = insertelement <2 x i64> poison, i64 %472, i64 0
  %474 = select i1 %470, <2 x i64> %469, <2 x i64> %473
  %475 = tail call i64 @llvm.umin.i64(i64 %467, i64 56)
  %476 = trunc i64 %475 to i32
  %477 = extractelement <2 x i64> %474, i64 0
  %478 = icmp ugt i32 %476, 7
  br i1 %478, label %481, label %479

479:                                              ; preds = %466
  %480 = icmp eq i32 %476, 0
  br i1 %480, label %534, label %521

481:                                              ; preds = %466
  %482 = load i8, i8 addrspace(4)* %468, align 1, !tbaa !8
  %483 = zext i8 %482 to i64
  %484 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 1
  %485 = load i8, i8 addrspace(4)* %484, align 1, !tbaa !8
  %486 = zext i8 %485 to i64
  %487 = shl nuw nsw i64 %486, 8
  %488 = or i64 %487, %483
  %489 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 2
  %490 = load i8, i8 addrspace(4)* %489, align 1, !tbaa !8
  %491 = zext i8 %490 to i64
  %492 = shl nuw nsw i64 %491, 16
  %493 = or i64 %488, %492
  %494 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 3
  %495 = load i8, i8 addrspace(4)* %494, align 1, !tbaa !8
  %496 = zext i8 %495 to i64
  %497 = shl nuw nsw i64 %496, 24
  %498 = or i64 %493, %497
  %499 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 4
  %500 = load i8, i8 addrspace(4)* %499, align 1, !tbaa !8
  %501 = zext i8 %500 to i64
  %502 = shl nuw nsw i64 %501, 32
  %503 = or i64 %498, %502
  %504 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 5
  %505 = load i8, i8 addrspace(4)* %504, align 1, !tbaa !8
  %506 = zext i8 %505 to i64
  %507 = shl nuw nsw i64 %506, 40
  %508 = or i64 %503, %507
  %509 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 6
  %510 = load i8, i8 addrspace(4)* %509, align 1, !tbaa !8
  %511 = zext i8 %510 to i64
  %512 = shl nuw nsw i64 %511, 48
  %513 = or i64 %508, %512
  %514 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 7
  %515 = load i8, i8 addrspace(4)* %514, align 1, !tbaa !8
  %516 = zext i8 %515 to i64
  %517 = shl nuw i64 %516, 56
  %518 = or i64 %513, %517
  %519 = add nsw i32 %476, -8
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 8
  br label %534

521:                                              ; preds = %479, %521
  %522 = phi i32 [ %532, %521 ], [ 0, %479 ]
  %523 = phi i64 [ %531, %521 ], [ 0, %479 ]
  %524 = zext i32 %522 to i64
  %525 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 %524
  %526 = load i8, i8 addrspace(4)* %525, align 1, !tbaa !8
  %527 = zext i8 %526 to i64
  %528 = shl i32 %522, 3
  %529 = zext i32 %528 to i64
  %530 = shl nuw i64 %527, %529
  %531 = or i64 %530, %523
  %532 = add nuw nsw i32 %522, 1
  %533 = icmp eq i32 %532, %476
  br i1 %533, label %534, label %521, !llvm.loop !9

534:                                              ; preds = %521, %481, %479
  %535 = phi i8 addrspace(4)* [ %520, %481 ], [ %468, %479 ], [ %468, %521 ]
  %536 = phi i32 [ %519, %481 ], [ 0, %479 ], [ 0, %521 ]
  %537 = phi i64 [ %518, %481 ], [ 0, %479 ], [ %531, %521 ]
  %538 = icmp ugt i32 %536, 7
  br i1 %538, label %541, label %539

539:                                              ; preds = %534
  %540 = icmp eq i32 %536, 0
  br i1 %540, label %594, label %581

541:                                              ; preds = %534
  %542 = load i8, i8 addrspace(4)* %535, align 1, !tbaa !8
  %543 = zext i8 %542 to i64
  %544 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 1
  %545 = load i8, i8 addrspace(4)* %544, align 1, !tbaa !8
  %546 = zext i8 %545 to i64
  %547 = shl nuw nsw i64 %546, 8
  %548 = or i64 %547, %543
  %549 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 2
  %550 = load i8, i8 addrspace(4)* %549, align 1, !tbaa !8
  %551 = zext i8 %550 to i64
  %552 = shl nuw nsw i64 %551, 16
  %553 = or i64 %548, %552
  %554 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 3
  %555 = load i8, i8 addrspace(4)* %554, align 1, !tbaa !8
  %556 = zext i8 %555 to i64
  %557 = shl nuw nsw i64 %556, 24
  %558 = or i64 %553, %557
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 4
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !8
  %561 = zext i8 %560 to i64
  %562 = shl nuw nsw i64 %561, 32
  %563 = or i64 %558, %562
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 5
  %565 = load i8, i8 addrspace(4)* %564, align 1, !tbaa !8
  %566 = zext i8 %565 to i64
  %567 = shl nuw nsw i64 %566, 40
  %568 = or i64 %563, %567
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 6
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !8
  %571 = zext i8 %570 to i64
  %572 = shl nuw nsw i64 %571, 48
  %573 = or i64 %568, %572
  %574 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 7
  %575 = load i8, i8 addrspace(4)* %574, align 1, !tbaa !8
  %576 = zext i8 %575 to i64
  %577 = shl nuw i64 %576, 56
  %578 = or i64 %573, %577
  %579 = add nsw i32 %536, -8
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 8
  br label %594

581:                                              ; preds = %539, %581
  %582 = phi i32 [ %592, %581 ], [ 0, %539 ]
  %583 = phi i64 [ %591, %581 ], [ 0, %539 ]
  %584 = zext i32 %582 to i64
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %535, i64 %584
  %586 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !8
  %587 = zext i8 %586 to i64
  %588 = shl i32 %582, 3
  %589 = zext i32 %588 to i64
  %590 = shl nuw i64 %587, %589
  %591 = or i64 %590, %583
  %592 = add nuw nsw i32 %582, 1
  %593 = icmp eq i32 %592, %536
  br i1 %593, label %594, label %581

594:                                              ; preds = %581, %541, %539
  %595 = phi i8 addrspace(4)* [ %580, %541 ], [ %535, %539 ], [ %535, %581 ]
  %596 = phi i32 [ %579, %541 ], [ 0, %539 ], [ 0, %581 ]
  %597 = phi i64 [ %578, %541 ], [ 0, %539 ], [ %591, %581 ]
  %598 = icmp ugt i32 %596, 7
  br i1 %598, label %601, label %599

599:                                              ; preds = %594
  %600 = icmp eq i32 %596, 0
  br i1 %600, label %654, label %641

601:                                              ; preds = %594
  %602 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !8
  %603 = zext i8 %602 to i64
  %604 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 1
  %605 = load i8, i8 addrspace(4)* %604, align 1, !tbaa !8
  %606 = zext i8 %605 to i64
  %607 = shl nuw nsw i64 %606, 8
  %608 = or i64 %607, %603
  %609 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 2
  %610 = load i8, i8 addrspace(4)* %609, align 1, !tbaa !8
  %611 = zext i8 %610 to i64
  %612 = shl nuw nsw i64 %611, 16
  %613 = or i64 %608, %612
  %614 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 3
  %615 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !8
  %616 = zext i8 %615 to i64
  %617 = shl nuw nsw i64 %616, 24
  %618 = or i64 %613, %617
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 4
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !8
  %621 = zext i8 %620 to i64
  %622 = shl nuw nsw i64 %621, 32
  %623 = or i64 %618, %622
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 5
  %625 = load i8, i8 addrspace(4)* %624, align 1, !tbaa !8
  %626 = zext i8 %625 to i64
  %627 = shl nuw nsw i64 %626, 40
  %628 = or i64 %623, %627
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 6
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !8
  %631 = zext i8 %630 to i64
  %632 = shl nuw nsw i64 %631, 48
  %633 = or i64 %628, %632
  %634 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 7
  %635 = load i8, i8 addrspace(4)* %634, align 1, !tbaa !8
  %636 = zext i8 %635 to i64
  %637 = shl nuw i64 %636, 56
  %638 = or i64 %633, %637
  %639 = add nsw i32 %596, -8
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 8
  br label %654

641:                                              ; preds = %599, %641
  %642 = phi i32 [ %652, %641 ], [ 0, %599 ]
  %643 = phi i64 [ %651, %641 ], [ 0, %599 ]
  %644 = zext i32 %642 to i64
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %595, i64 %644
  %646 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !8
  %647 = zext i8 %646 to i64
  %648 = shl i32 %642, 3
  %649 = zext i32 %648 to i64
  %650 = shl nuw i64 %647, %649
  %651 = or i64 %650, %643
  %652 = add nuw nsw i32 %642, 1
  %653 = icmp eq i32 %652, %596
  br i1 %653, label %654, label %641

654:                                              ; preds = %641, %601, %599
  %655 = phi i8 addrspace(4)* [ %640, %601 ], [ %595, %599 ], [ %595, %641 ]
  %656 = phi i32 [ %639, %601 ], [ 0, %599 ], [ 0, %641 ]
  %657 = phi i64 [ %638, %601 ], [ 0, %599 ], [ %651, %641 ]
  %658 = icmp ugt i32 %656, 7
  br i1 %658, label %661, label %659

659:                                              ; preds = %654
  %660 = icmp eq i32 %656, 0
  br i1 %660, label %714, label %701

661:                                              ; preds = %654
  %662 = load i8, i8 addrspace(4)* %655, align 1, !tbaa !8
  %663 = zext i8 %662 to i64
  %664 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 1
  %665 = load i8, i8 addrspace(4)* %664, align 1, !tbaa !8
  %666 = zext i8 %665 to i64
  %667 = shl nuw nsw i64 %666, 8
  %668 = or i64 %667, %663
  %669 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 2
  %670 = load i8, i8 addrspace(4)* %669, align 1, !tbaa !8
  %671 = zext i8 %670 to i64
  %672 = shl nuw nsw i64 %671, 16
  %673 = or i64 %668, %672
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 3
  %675 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !8
  %676 = zext i8 %675 to i64
  %677 = shl nuw nsw i64 %676, 24
  %678 = or i64 %673, %677
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 4
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !8
  %681 = zext i8 %680 to i64
  %682 = shl nuw nsw i64 %681, 32
  %683 = or i64 %678, %682
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 5
  %685 = load i8, i8 addrspace(4)* %684, align 1, !tbaa !8
  %686 = zext i8 %685 to i64
  %687 = shl nuw nsw i64 %686, 40
  %688 = or i64 %683, %687
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 6
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !8
  %691 = zext i8 %690 to i64
  %692 = shl nuw nsw i64 %691, 48
  %693 = or i64 %688, %692
  %694 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 7
  %695 = load i8, i8 addrspace(4)* %694, align 1, !tbaa !8
  %696 = zext i8 %695 to i64
  %697 = shl nuw i64 %696, 56
  %698 = or i64 %693, %697
  %699 = add nsw i32 %656, -8
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 8
  br label %714

701:                                              ; preds = %659, %701
  %702 = phi i32 [ %712, %701 ], [ 0, %659 ]
  %703 = phi i64 [ %711, %701 ], [ 0, %659 ]
  %704 = zext i32 %702 to i64
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %655, i64 %704
  %706 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !8
  %707 = zext i8 %706 to i64
  %708 = shl i32 %702, 3
  %709 = zext i32 %708 to i64
  %710 = shl nuw i64 %707, %709
  %711 = or i64 %710, %703
  %712 = add nuw nsw i32 %702, 1
  %713 = icmp eq i32 %712, %656
  br i1 %713, label %714, label %701

714:                                              ; preds = %701, %661, %659
  %715 = phi i8 addrspace(4)* [ %700, %661 ], [ %655, %659 ], [ %655, %701 ]
  %716 = phi i32 [ %699, %661 ], [ 0, %659 ], [ 0, %701 ]
  %717 = phi i64 [ %698, %661 ], [ 0, %659 ], [ %711, %701 ]
  %718 = icmp ugt i32 %716, 7
  br i1 %718, label %721, label %719

719:                                              ; preds = %714
  %720 = icmp eq i32 %716, 0
  br i1 %720, label %774, label %761

721:                                              ; preds = %714
  %722 = load i8, i8 addrspace(4)* %715, align 1, !tbaa !8
  %723 = zext i8 %722 to i64
  %724 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 1
  %725 = load i8, i8 addrspace(4)* %724, align 1, !tbaa !8
  %726 = zext i8 %725 to i64
  %727 = shl nuw nsw i64 %726, 8
  %728 = or i64 %727, %723
  %729 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 2
  %730 = load i8, i8 addrspace(4)* %729, align 1, !tbaa !8
  %731 = zext i8 %730 to i64
  %732 = shl nuw nsw i64 %731, 16
  %733 = or i64 %728, %732
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 3
  %735 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !8
  %736 = zext i8 %735 to i64
  %737 = shl nuw nsw i64 %736, 24
  %738 = or i64 %733, %737
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 4
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !8
  %741 = zext i8 %740 to i64
  %742 = shl nuw nsw i64 %741, 32
  %743 = or i64 %738, %742
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 5
  %745 = load i8, i8 addrspace(4)* %744, align 1, !tbaa !8
  %746 = zext i8 %745 to i64
  %747 = shl nuw nsw i64 %746, 40
  %748 = or i64 %743, %747
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 6
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !8
  %751 = zext i8 %750 to i64
  %752 = shl nuw nsw i64 %751, 48
  %753 = or i64 %748, %752
  %754 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 7
  %755 = load i8, i8 addrspace(4)* %754, align 1, !tbaa !8
  %756 = zext i8 %755 to i64
  %757 = shl nuw i64 %756, 56
  %758 = or i64 %753, %757
  %759 = add nsw i32 %716, -8
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 8
  br label %774

761:                                              ; preds = %719, %761
  %762 = phi i32 [ %772, %761 ], [ 0, %719 ]
  %763 = phi i64 [ %771, %761 ], [ 0, %719 ]
  %764 = zext i32 %762 to i64
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %715, i64 %764
  %766 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !8
  %767 = zext i8 %766 to i64
  %768 = shl i32 %762, 3
  %769 = zext i32 %768 to i64
  %770 = shl nuw i64 %767, %769
  %771 = or i64 %770, %763
  %772 = add nuw nsw i32 %762, 1
  %773 = icmp eq i32 %772, %716
  br i1 %773, label %774, label %761

774:                                              ; preds = %761, %721, %719
  %775 = phi i8 addrspace(4)* [ %760, %721 ], [ %715, %719 ], [ %715, %761 ]
  %776 = phi i32 [ %759, %721 ], [ 0, %719 ], [ 0, %761 ]
  %777 = phi i64 [ %758, %721 ], [ 0, %719 ], [ %771, %761 ]
  %778 = icmp ugt i32 %776, 7
  br i1 %778, label %781, label %779

779:                                              ; preds = %774
  %780 = icmp eq i32 %776, 0
  br i1 %780, label %834, label %821

781:                                              ; preds = %774
  %782 = load i8, i8 addrspace(4)* %775, align 1, !tbaa !8
  %783 = zext i8 %782 to i64
  %784 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 1
  %785 = load i8, i8 addrspace(4)* %784, align 1, !tbaa !8
  %786 = zext i8 %785 to i64
  %787 = shl nuw nsw i64 %786, 8
  %788 = or i64 %787, %783
  %789 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 2
  %790 = load i8, i8 addrspace(4)* %789, align 1, !tbaa !8
  %791 = zext i8 %790 to i64
  %792 = shl nuw nsw i64 %791, 16
  %793 = or i64 %788, %792
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 3
  %795 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !8
  %796 = zext i8 %795 to i64
  %797 = shl nuw nsw i64 %796, 24
  %798 = or i64 %793, %797
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 4
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !8
  %801 = zext i8 %800 to i64
  %802 = shl nuw nsw i64 %801, 32
  %803 = or i64 %798, %802
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 5
  %805 = load i8, i8 addrspace(4)* %804, align 1, !tbaa !8
  %806 = zext i8 %805 to i64
  %807 = shl nuw nsw i64 %806, 40
  %808 = or i64 %803, %807
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 6
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !8
  %811 = zext i8 %810 to i64
  %812 = shl nuw nsw i64 %811, 48
  %813 = or i64 %808, %812
  %814 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 7
  %815 = load i8, i8 addrspace(4)* %814, align 1, !tbaa !8
  %816 = zext i8 %815 to i64
  %817 = shl nuw i64 %816, 56
  %818 = or i64 %813, %817
  %819 = add nsw i32 %776, -8
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 8
  br label %834

821:                                              ; preds = %779, %821
  %822 = phi i32 [ %832, %821 ], [ 0, %779 ]
  %823 = phi i64 [ %831, %821 ], [ 0, %779 ]
  %824 = zext i32 %822 to i64
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %775, i64 %824
  %826 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !8
  %827 = zext i8 %826 to i64
  %828 = shl i32 %822, 3
  %829 = zext i32 %828 to i64
  %830 = shl nuw i64 %827, %829
  %831 = or i64 %830, %823
  %832 = add nuw nsw i32 %822, 1
  %833 = icmp eq i32 %832, %776
  br i1 %833, label %834, label %821

834:                                              ; preds = %821, %781, %779
  %835 = phi i8 addrspace(4)* [ %820, %781 ], [ %775, %779 ], [ %775, %821 ]
  %836 = phi i32 [ %819, %781 ], [ 0, %779 ], [ 0, %821 ]
  %837 = phi i64 [ %818, %781 ], [ 0, %779 ], [ %831, %821 ]
  %838 = icmp ugt i32 %836, 7
  br i1 %838, label %841, label %839

839:                                              ; preds = %834
  %840 = icmp eq i32 %836, 0
  br i1 %840, label %892, label %879

841:                                              ; preds = %834
  %842 = load i8, i8 addrspace(4)* %835, align 1, !tbaa !8
  %843 = zext i8 %842 to i64
  %844 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 1
  %845 = load i8, i8 addrspace(4)* %844, align 1, !tbaa !8
  %846 = zext i8 %845 to i64
  %847 = shl nuw nsw i64 %846, 8
  %848 = or i64 %847, %843
  %849 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 2
  %850 = load i8, i8 addrspace(4)* %849, align 1, !tbaa !8
  %851 = zext i8 %850 to i64
  %852 = shl nuw nsw i64 %851, 16
  %853 = or i64 %848, %852
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 3
  %855 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !8
  %856 = zext i8 %855 to i64
  %857 = shl nuw nsw i64 %856, 24
  %858 = or i64 %853, %857
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 4
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !8
  %861 = zext i8 %860 to i64
  %862 = shl nuw nsw i64 %861, 32
  %863 = or i64 %858, %862
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 5
  %865 = load i8, i8 addrspace(4)* %864, align 1, !tbaa !8
  %866 = zext i8 %865 to i64
  %867 = shl nuw nsw i64 %866, 40
  %868 = or i64 %863, %867
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 6
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !8
  %871 = zext i8 %870 to i64
  %872 = shl nuw nsw i64 %871, 48
  %873 = or i64 %868, %872
  %874 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 7
  %875 = load i8, i8 addrspace(4)* %874, align 1, !tbaa !8
  %876 = zext i8 %875 to i64
  %877 = shl nuw i64 %876, 56
  %878 = or i64 %873, %877
  br label %892

879:                                              ; preds = %839, %879
  %880 = phi i32 [ %890, %879 ], [ 0, %839 ]
  %881 = phi i64 [ %889, %879 ], [ 0, %839 ]
  %882 = zext i32 %880 to i64
  %883 = getelementptr inbounds i8, i8 addrspace(4)* %835, i64 %882
  %884 = load i8, i8 addrspace(4)* %883, align 1, !tbaa !8
  %885 = zext i8 %884 to i64
  %886 = shl i32 %880, 3
  %887 = zext i32 %886 to i64
  %888 = shl nuw i64 %885, %887
  %889 = or i64 %888, %881
  %890 = add nuw nsw i32 %880, 1
  %891 = icmp eq i32 %890, %836
  br i1 %891, label %892, label %879

892:                                              ; preds = %879, %841, %839
  %893 = phi i64 [ %878, %841 ], [ 0, %839 ], [ %889, %879 ]
  %894 = shl nuw nsw i64 %475, 2
  %895 = add nuw nsw i64 %894, 28
  %896 = and i64 %895, 480
  %897 = and i64 %477, -225
  %898 = or i64 %897, %896
  %899 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %898, i64 noundef %537, i64 noundef %597, i64 noundef %657, i64 noundef %717, i64 noundef %777, i64 noundef %837, i64 noundef %893) #10
  %900 = sub i64 %467, %475
  %901 = getelementptr inbounds i8, i8 addrspace(4)* %468, i64 %475
  %902 = icmp eq i64 %900, 0
  br i1 %902, label %903, label %466

903:                                              ; preds = %892, %459
  %904 = mul nsw i32 %1, %0
  store i32 %904, i32 addrspace(1)* %2, align 4, !tbaa !11
  %905 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %906 = extractelement <2 x i64> %905, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), label %907, label %911

907:                                              ; preds = %903
  %908 = and i64 %906, -227
  %909 = or i64 %908, 34
  %910 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %909, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1351

911:                                              ; preds = %903
  %912 = and i64 %906, -3
  %913 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %912, i64 0
  br label %914

914:                                              ; preds = %1340, %911
  %915 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 15) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([16 x i8]* addrspacecast ([16 x i8] addrspace(4)* @.str.2 to [16 x i8]*) to i64)), i64 1))), %911 ], [ %1348, %1340 ]
  %916 = phi i8 addrspace(4)* [ getelementptr inbounds ([16 x i8], [16 x i8] addrspace(4)* @.str.2, i64 0, i64 0), %911 ], [ %1349, %1340 ]
  %917 = phi <2 x i64> [ %913, %911 ], [ %1347, %1340 ]
  %918 = icmp ugt i64 %915, 56
  %919 = extractelement <2 x i64> %917, i64 0
  %920 = or i64 %919, 2
  %921 = insertelement <2 x i64> poison, i64 %920, i64 0
  %922 = select i1 %918, <2 x i64> %917, <2 x i64> %921
  %923 = tail call i64 @llvm.umin.i64(i64 %915, i64 56)
  %924 = trunc i64 %923 to i32
  %925 = extractelement <2 x i64> %922, i64 0
  %926 = icmp ugt i32 %924, 7
  br i1 %926, label %929, label %927

927:                                              ; preds = %914
  %928 = icmp eq i32 %924, 0
  br i1 %928, label %982, label %969

929:                                              ; preds = %914
  %930 = load i8, i8 addrspace(4)* %916, align 1, !tbaa !8
  %931 = zext i8 %930 to i64
  %932 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 1
  %933 = load i8, i8 addrspace(4)* %932, align 1, !tbaa !8
  %934 = zext i8 %933 to i64
  %935 = shl nuw nsw i64 %934, 8
  %936 = or i64 %935, %931
  %937 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 2
  %938 = load i8, i8 addrspace(4)* %937, align 1, !tbaa !8
  %939 = zext i8 %938 to i64
  %940 = shl nuw nsw i64 %939, 16
  %941 = or i64 %936, %940
  %942 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 3
  %943 = load i8, i8 addrspace(4)* %942, align 1, !tbaa !8
  %944 = zext i8 %943 to i64
  %945 = shl nuw nsw i64 %944, 24
  %946 = or i64 %941, %945
  %947 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 4
  %948 = load i8, i8 addrspace(4)* %947, align 1, !tbaa !8
  %949 = zext i8 %948 to i64
  %950 = shl nuw nsw i64 %949, 32
  %951 = or i64 %946, %950
  %952 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 5
  %953 = load i8, i8 addrspace(4)* %952, align 1, !tbaa !8
  %954 = zext i8 %953 to i64
  %955 = shl nuw nsw i64 %954, 40
  %956 = or i64 %951, %955
  %957 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 6
  %958 = load i8, i8 addrspace(4)* %957, align 1, !tbaa !8
  %959 = zext i8 %958 to i64
  %960 = shl nuw nsw i64 %959, 48
  %961 = or i64 %956, %960
  %962 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 7
  %963 = load i8, i8 addrspace(4)* %962, align 1, !tbaa !8
  %964 = zext i8 %963 to i64
  %965 = shl nuw i64 %964, 56
  %966 = or i64 %961, %965
  %967 = add nsw i32 %924, -8
  %968 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 8
  br label %982

969:                                              ; preds = %927, %969
  %970 = phi i32 [ %980, %969 ], [ 0, %927 ]
  %971 = phi i64 [ %979, %969 ], [ 0, %927 ]
  %972 = zext i32 %970 to i64
  %973 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 %972
  %974 = load i8, i8 addrspace(4)* %973, align 1, !tbaa !8
  %975 = zext i8 %974 to i64
  %976 = shl i32 %970, 3
  %977 = zext i32 %976 to i64
  %978 = shl nuw i64 %975, %977
  %979 = or i64 %978, %971
  %980 = add nuw nsw i32 %970, 1
  %981 = icmp eq i32 %980, %924
  br i1 %981, label %982, label %969, !llvm.loop !9

982:                                              ; preds = %969, %929, %927
  %983 = phi i8 addrspace(4)* [ %968, %929 ], [ %916, %927 ], [ %916, %969 ]
  %984 = phi i32 [ %967, %929 ], [ 0, %927 ], [ 0, %969 ]
  %985 = phi i64 [ %966, %929 ], [ 0, %927 ], [ %979, %969 ]
  %986 = icmp ugt i32 %984, 7
  br i1 %986, label %989, label %987

987:                                              ; preds = %982
  %988 = icmp eq i32 %984, 0
  br i1 %988, label %1042, label %1029

989:                                              ; preds = %982
  %990 = load i8, i8 addrspace(4)* %983, align 1, !tbaa !8
  %991 = zext i8 %990 to i64
  %992 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 1
  %993 = load i8, i8 addrspace(4)* %992, align 1, !tbaa !8
  %994 = zext i8 %993 to i64
  %995 = shl nuw nsw i64 %994, 8
  %996 = or i64 %995, %991
  %997 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 2
  %998 = load i8, i8 addrspace(4)* %997, align 1, !tbaa !8
  %999 = zext i8 %998 to i64
  %1000 = shl nuw nsw i64 %999, 16
  %1001 = or i64 %996, %1000
  %1002 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 3
  %1003 = load i8, i8 addrspace(4)* %1002, align 1, !tbaa !8
  %1004 = zext i8 %1003 to i64
  %1005 = shl nuw nsw i64 %1004, 24
  %1006 = or i64 %1001, %1005
  %1007 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 4
  %1008 = load i8, i8 addrspace(4)* %1007, align 1, !tbaa !8
  %1009 = zext i8 %1008 to i64
  %1010 = shl nuw nsw i64 %1009, 32
  %1011 = or i64 %1006, %1010
  %1012 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 5
  %1013 = load i8, i8 addrspace(4)* %1012, align 1, !tbaa !8
  %1014 = zext i8 %1013 to i64
  %1015 = shl nuw nsw i64 %1014, 40
  %1016 = or i64 %1011, %1015
  %1017 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 6
  %1018 = load i8, i8 addrspace(4)* %1017, align 1, !tbaa !8
  %1019 = zext i8 %1018 to i64
  %1020 = shl nuw nsw i64 %1019, 48
  %1021 = or i64 %1016, %1020
  %1022 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 7
  %1023 = load i8, i8 addrspace(4)* %1022, align 1, !tbaa !8
  %1024 = zext i8 %1023 to i64
  %1025 = shl nuw i64 %1024, 56
  %1026 = or i64 %1021, %1025
  %1027 = add nsw i32 %984, -8
  %1028 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 8
  br label %1042

1029:                                             ; preds = %987, %1029
  %1030 = phi i32 [ %1040, %1029 ], [ 0, %987 ]
  %1031 = phi i64 [ %1039, %1029 ], [ 0, %987 ]
  %1032 = zext i32 %1030 to i64
  %1033 = getelementptr inbounds i8, i8 addrspace(4)* %983, i64 %1032
  %1034 = load i8, i8 addrspace(4)* %1033, align 1, !tbaa !8
  %1035 = zext i8 %1034 to i64
  %1036 = shl i32 %1030, 3
  %1037 = zext i32 %1036 to i64
  %1038 = shl nuw i64 %1035, %1037
  %1039 = or i64 %1038, %1031
  %1040 = add nuw nsw i32 %1030, 1
  %1041 = icmp eq i32 %1040, %984
  br i1 %1041, label %1042, label %1029

1042:                                             ; preds = %1029, %989, %987
  %1043 = phi i8 addrspace(4)* [ %1028, %989 ], [ %983, %987 ], [ %983, %1029 ]
  %1044 = phi i32 [ %1027, %989 ], [ 0, %987 ], [ 0, %1029 ]
  %1045 = phi i64 [ %1026, %989 ], [ 0, %987 ], [ %1039, %1029 ]
  %1046 = icmp ugt i32 %1044, 7
  br i1 %1046, label %1049, label %1047

1047:                                             ; preds = %1042
  %1048 = icmp eq i32 %1044, 0
  br i1 %1048, label %1102, label %1089

1049:                                             ; preds = %1042
  %1050 = load i8, i8 addrspace(4)* %1043, align 1, !tbaa !8
  %1051 = zext i8 %1050 to i64
  %1052 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 1
  %1053 = load i8, i8 addrspace(4)* %1052, align 1, !tbaa !8
  %1054 = zext i8 %1053 to i64
  %1055 = shl nuw nsw i64 %1054, 8
  %1056 = or i64 %1055, %1051
  %1057 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 2
  %1058 = load i8, i8 addrspace(4)* %1057, align 1, !tbaa !8
  %1059 = zext i8 %1058 to i64
  %1060 = shl nuw nsw i64 %1059, 16
  %1061 = or i64 %1056, %1060
  %1062 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 3
  %1063 = load i8, i8 addrspace(4)* %1062, align 1, !tbaa !8
  %1064 = zext i8 %1063 to i64
  %1065 = shl nuw nsw i64 %1064, 24
  %1066 = or i64 %1061, %1065
  %1067 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 4
  %1068 = load i8, i8 addrspace(4)* %1067, align 1, !tbaa !8
  %1069 = zext i8 %1068 to i64
  %1070 = shl nuw nsw i64 %1069, 32
  %1071 = or i64 %1066, %1070
  %1072 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 5
  %1073 = load i8, i8 addrspace(4)* %1072, align 1, !tbaa !8
  %1074 = zext i8 %1073 to i64
  %1075 = shl nuw nsw i64 %1074, 40
  %1076 = or i64 %1071, %1075
  %1077 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 6
  %1078 = load i8, i8 addrspace(4)* %1077, align 1, !tbaa !8
  %1079 = zext i8 %1078 to i64
  %1080 = shl nuw nsw i64 %1079, 48
  %1081 = or i64 %1076, %1080
  %1082 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 7
  %1083 = load i8, i8 addrspace(4)* %1082, align 1, !tbaa !8
  %1084 = zext i8 %1083 to i64
  %1085 = shl nuw i64 %1084, 56
  %1086 = or i64 %1081, %1085
  %1087 = add nsw i32 %1044, -8
  %1088 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 8
  br label %1102

1089:                                             ; preds = %1047, %1089
  %1090 = phi i32 [ %1100, %1089 ], [ 0, %1047 ]
  %1091 = phi i64 [ %1099, %1089 ], [ 0, %1047 ]
  %1092 = zext i32 %1090 to i64
  %1093 = getelementptr inbounds i8, i8 addrspace(4)* %1043, i64 %1092
  %1094 = load i8, i8 addrspace(4)* %1093, align 1, !tbaa !8
  %1095 = zext i8 %1094 to i64
  %1096 = shl i32 %1090, 3
  %1097 = zext i32 %1096 to i64
  %1098 = shl nuw i64 %1095, %1097
  %1099 = or i64 %1098, %1091
  %1100 = add nuw nsw i32 %1090, 1
  %1101 = icmp eq i32 %1100, %1044
  br i1 %1101, label %1102, label %1089

1102:                                             ; preds = %1089, %1049, %1047
  %1103 = phi i8 addrspace(4)* [ %1088, %1049 ], [ %1043, %1047 ], [ %1043, %1089 ]
  %1104 = phi i32 [ %1087, %1049 ], [ 0, %1047 ], [ 0, %1089 ]
  %1105 = phi i64 [ %1086, %1049 ], [ 0, %1047 ], [ %1099, %1089 ]
  %1106 = icmp ugt i32 %1104, 7
  br i1 %1106, label %1109, label %1107

1107:                                             ; preds = %1102
  %1108 = icmp eq i32 %1104, 0
  br i1 %1108, label %1162, label %1149

1109:                                             ; preds = %1102
  %1110 = load i8, i8 addrspace(4)* %1103, align 1, !tbaa !8
  %1111 = zext i8 %1110 to i64
  %1112 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 1
  %1113 = load i8, i8 addrspace(4)* %1112, align 1, !tbaa !8
  %1114 = zext i8 %1113 to i64
  %1115 = shl nuw nsw i64 %1114, 8
  %1116 = or i64 %1115, %1111
  %1117 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 2
  %1118 = load i8, i8 addrspace(4)* %1117, align 1, !tbaa !8
  %1119 = zext i8 %1118 to i64
  %1120 = shl nuw nsw i64 %1119, 16
  %1121 = or i64 %1116, %1120
  %1122 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 3
  %1123 = load i8, i8 addrspace(4)* %1122, align 1, !tbaa !8
  %1124 = zext i8 %1123 to i64
  %1125 = shl nuw nsw i64 %1124, 24
  %1126 = or i64 %1121, %1125
  %1127 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 4
  %1128 = load i8, i8 addrspace(4)* %1127, align 1, !tbaa !8
  %1129 = zext i8 %1128 to i64
  %1130 = shl nuw nsw i64 %1129, 32
  %1131 = or i64 %1126, %1130
  %1132 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 5
  %1133 = load i8, i8 addrspace(4)* %1132, align 1, !tbaa !8
  %1134 = zext i8 %1133 to i64
  %1135 = shl nuw nsw i64 %1134, 40
  %1136 = or i64 %1131, %1135
  %1137 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 6
  %1138 = load i8, i8 addrspace(4)* %1137, align 1, !tbaa !8
  %1139 = zext i8 %1138 to i64
  %1140 = shl nuw nsw i64 %1139, 48
  %1141 = or i64 %1136, %1140
  %1142 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 7
  %1143 = load i8, i8 addrspace(4)* %1142, align 1, !tbaa !8
  %1144 = zext i8 %1143 to i64
  %1145 = shl nuw i64 %1144, 56
  %1146 = or i64 %1141, %1145
  %1147 = add nsw i32 %1104, -8
  %1148 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 8
  br label %1162

1149:                                             ; preds = %1107, %1149
  %1150 = phi i32 [ %1160, %1149 ], [ 0, %1107 ]
  %1151 = phi i64 [ %1159, %1149 ], [ 0, %1107 ]
  %1152 = zext i32 %1150 to i64
  %1153 = getelementptr inbounds i8, i8 addrspace(4)* %1103, i64 %1152
  %1154 = load i8, i8 addrspace(4)* %1153, align 1, !tbaa !8
  %1155 = zext i8 %1154 to i64
  %1156 = shl i32 %1150, 3
  %1157 = zext i32 %1156 to i64
  %1158 = shl nuw i64 %1155, %1157
  %1159 = or i64 %1158, %1151
  %1160 = add nuw nsw i32 %1150, 1
  %1161 = icmp eq i32 %1160, %1104
  br i1 %1161, label %1162, label %1149

1162:                                             ; preds = %1149, %1109, %1107
  %1163 = phi i8 addrspace(4)* [ %1148, %1109 ], [ %1103, %1107 ], [ %1103, %1149 ]
  %1164 = phi i32 [ %1147, %1109 ], [ 0, %1107 ], [ 0, %1149 ]
  %1165 = phi i64 [ %1146, %1109 ], [ 0, %1107 ], [ %1159, %1149 ]
  %1166 = icmp ugt i32 %1164, 7
  br i1 %1166, label %1169, label %1167

1167:                                             ; preds = %1162
  %1168 = icmp eq i32 %1164, 0
  br i1 %1168, label %1222, label %1209

1169:                                             ; preds = %1162
  %1170 = load i8, i8 addrspace(4)* %1163, align 1, !tbaa !8
  %1171 = zext i8 %1170 to i64
  %1172 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 1
  %1173 = load i8, i8 addrspace(4)* %1172, align 1, !tbaa !8
  %1174 = zext i8 %1173 to i64
  %1175 = shl nuw nsw i64 %1174, 8
  %1176 = or i64 %1175, %1171
  %1177 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 2
  %1178 = load i8, i8 addrspace(4)* %1177, align 1, !tbaa !8
  %1179 = zext i8 %1178 to i64
  %1180 = shl nuw nsw i64 %1179, 16
  %1181 = or i64 %1176, %1180
  %1182 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 3
  %1183 = load i8, i8 addrspace(4)* %1182, align 1, !tbaa !8
  %1184 = zext i8 %1183 to i64
  %1185 = shl nuw nsw i64 %1184, 24
  %1186 = or i64 %1181, %1185
  %1187 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 4
  %1188 = load i8, i8 addrspace(4)* %1187, align 1, !tbaa !8
  %1189 = zext i8 %1188 to i64
  %1190 = shl nuw nsw i64 %1189, 32
  %1191 = or i64 %1186, %1190
  %1192 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 5
  %1193 = load i8, i8 addrspace(4)* %1192, align 1, !tbaa !8
  %1194 = zext i8 %1193 to i64
  %1195 = shl nuw nsw i64 %1194, 40
  %1196 = or i64 %1191, %1195
  %1197 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 6
  %1198 = load i8, i8 addrspace(4)* %1197, align 1, !tbaa !8
  %1199 = zext i8 %1198 to i64
  %1200 = shl nuw nsw i64 %1199, 48
  %1201 = or i64 %1196, %1200
  %1202 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 7
  %1203 = load i8, i8 addrspace(4)* %1202, align 1, !tbaa !8
  %1204 = zext i8 %1203 to i64
  %1205 = shl nuw i64 %1204, 56
  %1206 = or i64 %1201, %1205
  %1207 = add nsw i32 %1164, -8
  %1208 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 8
  br label %1222

1209:                                             ; preds = %1167, %1209
  %1210 = phi i32 [ %1220, %1209 ], [ 0, %1167 ]
  %1211 = phi i64 [ %1219, %1209 ], [ 0, %1167 ]
  %1212 = zext i32 %1210 to i64
  %1213 = getelementptr inbounds i8, i8 addrspace(4)* %1163, i64 %1212
  %1214 = load i8, i8 addrspace(4)* %1213, align 1, !tbaa !8
  %1215 = zext i8 %1214 to i64
  %1216 = shl i32 %1210, 3
  %1217 = zext i32 %1216 to i64
  %1218 = shl nuw i64 %1215, %1217
  %1219 = or i64 %1218, %1211
  %1220 = add nuw nsw i32 %1210, 1
  %1221 = icmp eq i32 %1220, %1164
  br i1 %1221, label %1222, label %1209

1222:                                             ; preds = %1209, %1169, %1167
  %1223 = phi i8 addrspace(4)* [ %1208, %1169 ], [ %1163, %1167 ], [ %1163, %1209 ]
  %1224 = phi i32 [ %1207, %1169 ], [ 0, %1167 ], [ 0, %1209 ]
  %1225 = phi i64 [ %1206, %1169 ], [ 0, %1167 ], [ %1219, %1209 ]
  %1226 = icmp ugt i32 %1224, 7
  br i1 %1226, label %1229, label %1227

1227:                                             ; preds = %1222
  %1228 = icmp eq i32 %1224, 0
  br i1 %1228, label %1282, label %1269

1229:                                             ; preds = %1222
  %1230 = load i8, i8 addrspace(4)* %1223, align 1, !tbaa !8
  %1231 = zext i8 %1230 to i64
  %1232 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 1
  %1233 = load i8, i8 addrspace(4)* %1232, align 1, !tbaa !8
  %1234 = zext i8 %1233 to i64
  %1235 = shl nuw nsw i64 %1234, 8
  %1236 = or i64 %1235, %1231
  %1237 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 2
  %1238 = load i8, i8 addrspace(4)* %1237, align 1, !tbaa !8
  %1239 = zext i8 %1238 to i64
  %1240 = shl nuw nsw i64 %1239, 16
  %1241 = or i64 %1236, %1240
  %1242 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 3
  %1243 = load i8, i8 addrspace(4)* %1242, align 1, !tbaa !8
  %1244 = zext i8 %1243 to i64
  %1245 = shl nuw nsw i64 %1244, 24
  %1246 = or i64 %1241, %1245
  %1247 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 4
  %1248 = load i8, i8 addrspace(4)* %1247, align 1, !tbaa !8
  %1249 = zext i8 %1248 to i64
  %1250 = shl nuw nsw i64 %1249, 32
  %1251 = or i64 %1246, %1250
  %1252 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 5
  %1253 = load i8, i8 addrspace(4)* %1252, align 1, !tbaa !8
  %1254 = zext i8 %1253 to i64
  %1255 = shl nuw nsw i64 %1254, 40
  %1256 = or i64 %1251, %1255
  %1257 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 6
  %1258 = load i8, i8 addrspace(4)* %1257, align 1, !tbaa !8
  %1259 = zext i8 %1258 to i64
  %1260 = shl nuw nsw i64 %1259, 48
  %1261 = or i64 %1256, %1260
  %1262 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 7
  %1263 = load i8, i8 addrspace(4)* %1262, align 1, !tbaa !8
  %1264 = zext i8 %1263 to i64
  %1265 = shl nuw i64 %1264, 56
  %1266 = or i64 %1261, %1265
  %1267 = add nsw i32 %1224, -8
  %1268 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 8
  br label %1282

1269:                                             ; preds = %1227, %1269
  %1270 = phi i32 [ %1280, %1269 ], [ 0, %1227 ]
  %1271 = phi i64 [ %1279, %1269 ], [ 0, %1227 ]
  %1272 = zext i32 %1270 to i64
  %1273 = getelementptr inbounds i8, i8 addrspace(4)* %1223, i64 %1272
  %1274 = load i8, i8 addrspace(4)* %1273, align 1, !tbaa !8
  %1275 = zext i8 %1274 to i64
  %1276 = shl i32 %1270, 3
  %1277 = zext i32 %1276 to i64
  %1278 = shl nuw i64 %1275, %1277
  %1279 = or i64 %1278, %1271
  %1280 = add nuw nsw i32 %1270, 1
  %1281 = icmp eq i32 %1280, %1224
  br i1 %1281, label %1282, label %1269

1282:                                             ; preds = %1269, %1229, %1227
  %1283 = phi i8 addrspace(4)* [ %1268, %1229 ], [ %1223, %1227 ], [ %1223, %1269 ]
  %1284 = phi i32 [ %1267, %1229 ], [ 0, %1227 ], [ 0, %1269 ]
  %1285 = phi i64 [ %1266, %1229 ], [ 0, %1227 ], [ %1279, %1269 ]
  %1286 = icmp ugt i32 %1284, 7
  br i1 %1286, label %1289, label %1287

1287:                                             ; preds = %1282
  %1288 = icmp eq i32 %1284, 0
  br i1 %1288, label %1340, label %1327

1289:                                             ; preds = %1282
  %1290 = load i8, i8 addrspace(4)* %1283, align 1, !tbaa !8
  %1291 = zext i8 %1290 to i64
  %1292 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 1
  %1293 = load i8, i8 addrspace(4)* %1292, align 1, !tbaa !8
  %1294 = zext i8 %1293 to i64
  %1295 = shl nuw nsw i64 %1294, 8
  %1296 = or i64 %1295, %1291
  %1297 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 2
  %1298 = load i8, i8 addrspace(4)* %1297, align 1, !tbaa !8
  %1299 = zext i8 %1298 to i64
  %1300 = shl nuw nsw i64 %1299, 16
  %1301 = or i64 %1296, %1300
  %1302 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 3
  %1303 = load i8, i8 addrspace(4)* %1302, align 1, !tbaa !8
  %1304 = zext i8 %1303 to i64
  %1305 = shl nuw nsw i64 %1304, 24
  %1306 = or i64 %1301, %1305
  %1307 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 4
  %1308 = load i8, i8 addrspace(4)* %1307, align 1, !tbaa !8
  %1309 = zext i8 %1308 to i64
  %1310 = shl nuw nsw i64 %1309, 32
  %1311 = or i64 %1306, %1310
  %1312 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 5
  %1313 = load i8, i8 addrspace(4)* %1312, align 1, !tbaa !8
  %1314 = zext i8 %1313 to i64
  %1315 = shl nuw nsw i64 %1314, 40
  %1316 = or i64 %1311, %1315
  %1317 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 6
  %1318 = load i8, i8 addrspace(4)* %1317, align 1, !tbaa !8
  %1319 = zext i8 %1318 to i64
  %1320 = shl nuw nsw i64 %1319, 48
  %1321 = or i64 %1316, %1320
  %1322 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 7
  %1323 = load i8, i8 addrspace(4)* %1322, align 1, !tbaa !8
  %1324 = zext i8 %1323 to i64
  %1325 = shl nuw i64 %1324, 56
  %1326 = or i64 %1321, %1325
  br label %1340

1327:                                             ; preds = %1287, %1327
  %1328 = phi i32 [ %1338, %1327 ], [ 0, %1287 ]
  %1329 = phi i64 [ %1337, %1327 ], [ 0, %1287 ]
  %1330 = zext i32 %1328 to i64
  %1331 = getelementptr inbounds i8, i8 addrspace(4)* %1283, i64 %1330
  %1332 = load i8, i8 addrspace(4)* %1331, align 1, !tbaa !8
  %1333 = zext i8 %1332 to i64
  %1334 = shl i32 %1328, 3
  %1335 = zext i32 %1334 to i64
  %1336 = shl nuw i64 %1333, %1335
  %1337 = or i64 %1336, %1329
  %1338 = add nuw nsw i32 %1328, 1
  %1339 = icmp eq i32 %1338, %1284
  br i1 %1339, label %1340, label %1327

1340:                                             ; preds = %1327, %1289, %1287
  %1341 = phi i64 [ %1326, %1289 ], [ 0, %1287 ], [ %1337, %1327 ]
  %1342 = shl nuw nsw i64 %923, 2
  %1343 = add nuw nsw i64 %1342, 28
  %1344 = and i64 %1343, 480
  %1345 = and i64 %925, -225
  %1346 = or i64 %1345, %1344
  %1347 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %9, i64 noundef %1346, i64 noundef %985, i64 noundef %1045, i64 noundef %1105, i64 noundef %1165, i64 noundef %1225, i64 noundef %1285, i64 noundef %1341) #10
  %1348 = sub i64 %915, %923
  %1349 = getelementptr inbounds i8, i8 addrspace(4)* %916, i64 %923
  %1350 = icmp eq i64 %1348, 0
  br i1 %1350, label %1351, label %914

1351:                                             ; preds = %1340, %907
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !15
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !17
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !4
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !4
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !4
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !4
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !4
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !4
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !4
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !4
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !17
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !19
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !17
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !17
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !15
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !20
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !23
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !20
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !23
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !4
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !20
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !23
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !24
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !23
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !17
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %110 = call i64 @llvm.read_register.i64(metadata !25) #11
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !26
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !28
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !29
  br label %116

116:                                              ; preds = %68, %112
  %117 = zext i32 %108 to i64
  %118 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 0
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !4
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !4
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !4
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !4
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !4
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !4
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !4
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !4
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !20
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !23
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !30
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !30
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !31
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !33
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #6
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !15
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !15
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !4
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !4
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !15
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !17
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !17
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !23
  %196 = add i64 %195, 1
  %197 = add i64 %196, %189
  %198 = icmp eq i64 %197, 0
  %199 = select i1 %198, i64 %196, i64 %197
  %200 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 3
  %201 = load atomic i64, i64 addrspace(1)* %200 syncscope("one-as") monotonic, align 8
  %202 = getelementptr %0, %0 addrspace(1)* %188, i64 0, i32 0
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !20
  %204 = and i64 %199, %195
  %205 = getelementptr inbounds %1, %1 addrspace(1)* %203, i64 %204, i32 0
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !30
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !30
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !8
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
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!6, !6, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C++ TBAA"}
!15 = !{!16, !16, i64 0}
!16 = !{!"any pointer", !6, i64 0}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !6, i64 0}
!19 = !{i64 2662}
!20 = !{!21, !16, i64 0}
!21 = !{!"", !16, i64 0, !16, i64 8, !22, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!22 = !{!"hsa_signal_s", !5, i64 0}
!23 = !{!21, !5, i64 40}
!24 = !{!21, !16, i64 8}
!25 = !{!"exec"}
!26 = !{!27, !18, i64 16}
!27 = !{!"", !5, i64 0, !5, i64 8, !18, i64 16, !18, i64 20}
!28 = !{!27, !5, i64 8}
!29 = !{!27, !18, i64 20}
!30 = !{!27, !5, i64 0}
!31 = !{!32, !5, i64 16}
!32 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !18, i64 24, !18, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!33 = !{!32, !18, i64 24}
