; ModuleID = '../data/hip_kernels/15353/1/main.cu'
source_filename = "../data/hip_kernels/15353/1/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [30 x i8] c"CudaDevice()::RevealNumber()\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [15 x i8] c"Here comes: %i\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z12RevealNumberPij(i32 addrspace(1)* nocapture readonly %0, i32 %1) local_unnamed_addr #1 {
  %3 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %4 = getelementptr inbounds i8, i8 addrspace(4)* %3, i64 24
  %5 = bitcast i8 addrspace(4)* %4 to i64 addrspace(4)*
  %6 = load i64, i64 addrspace(4)* %5, align 8, !tbaa !4
  %7 = inttoptr i64 %6 to i8 addrspace(1)*
  %8 = addrspacecast i8 addrspace(1)* %7 to i8*
  %9 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %10 = extractelement <2 x i64> %9, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %11, label %15

11:                                               ; preds = %2
  %12 = and i64 %10, -227
  %13 = or i64 %12, 34
  %14 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %13, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %455

15:                                               ; preds = %2
  %16 = and i64 %10, -3
  %17 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %16, i64 0
  br label %18

18:                                               ; preds = %444, %15
  %19 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 29) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([30 x i8]* addrspacecast ([30 x i8] addrspace(4)* @.str to [30 x i8]*) to i64)), i64 1))), %15 ], [ %452, %444 ]
  %20 = phi i8 addrspace(4)* [ getelementptr inbounds ([30 x i8], [30 x i8] addrspace(4)* @.str, i64 0, i64 0), %15 ], [ %453, %444 ]
  %21 = phi <2 x i64> [ %17, %15 ], [ %451, %444 ]
  %22 = icmp ugt i64 %19, 56
  %23 = extractelement <2 x i64> %21, i64 0
  %24 = or i64 %23, 2
  %25 = insertelement <2 x i64> poison, i64 %24, i64 0
  %26 = select i1 %22, <2 x i64> %21, <2 x i64> %25
  %27 = tail call i64 @llvm.umin.i64(i64 %19, i64 56)
  %28 = trunc i64 %27 to i32
  %29 = extractelement <2 x i64> %26, i64 0
  %30 = icmp ugt i32 %28, 7
  br i1 %30, label %33, label %31

31:                                               ; preds = %18
  %32 = icmp eq i32 %28, 0
  br i1 %32, label %86, label %73

33:                                               ; preds = %18
  %34 = load i8, i8 addrspace(4)* %20, align 1, !tbaa !8
  %35 = zext i8 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 1
  %37 = load i8, i8 addrspace(4)* %36, align 1, !tbaa !8
  %38 = zext i8 %37 to i64
  %39 = shl nuw nsw i64 %38, 8
  %40 = or i64 %39, %35
  %41 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 2
  %42 = load i8, i8 addrspace(4)* %41, align 1, !tbaa !8
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 16
  %45 = or i64 %40, %44
  %46 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 3
  %47 = load i8, i8 addrspace(4)* %46, align 1, !tbaa !8
  %48 = zext i8 %47 to i64
  %49 = shl nuw nsw i64 %48, 24
  %50 = or i64 %45, %49
  %51 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 4
  %52 = load i8, i8 addrspace(4)* %51, align 1, !tbaa !8
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 32
  %55 = or i64 %50, %54
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 5
  %57 = load i8, i8 addrspace(4)* %56, align 1, !tbaa !8
  %58 = zext i8 %57 to i64
  %59 = shl nuw nsw i64 %58, 40
  %60 = or i64 %55, %59
  %61 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 6
  %62 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !8
  %63 = zext i8 %62 to i64
  %64 = shl nuw nsw i64 %63, 48
  %65 = or i64 %60, %64
  %66 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 7
  %67 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !8
  %68 = zext i8 %67 to i64
  %69 = shl nuw i64 %68, 56
  %70 = or i64 %65, %69
  %71 = add nsw i32 %28, -8
  %72 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 8
  br label %86

73:                                               ; preds = %31, %73
  %74 = phi i32 [ %84, %73 ], [ 0, %31 ]
  %75 = phi i64 [ %83, %73 ], [ 0, %31 ]
  %76 = zext i32 %74 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 %76
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !8
  %79 = zext i8 %78 to i64
  %80 = shl i32 %74, 3
  %81 = zext i32 %80 to i64
  %82 = shl nuw i64 %79, %81
  %83 = or i64 %82, %75
  %84 = add nuw nsw i32 %74, 1
  %85 = icmp eq i32 %84, %28
  br i1 %85, label %86, label %73, !llvm.loop !9

86:                                               ; preds = %73, %33, %31
  %87 = phi i8 addrspace(4)* [ %72, %33 ], [ %20, %31 ], [ %20, %73 ]
  %88 = phi i32 [ %71, %33 ], [ 0, %31 ], [ 0, %73 ]
  %89 = phi i64 [ %70, %33 ], [ 0, %31 ], [ %83, %73 ]
  %90 = icmp ugt i32 %88, 7
  br i1 %90, label %93, label %91

91:                                               ; preds = %86
  %92 = icmp eq i32 %88, 0
  br i1 %92, label %146, label %133

93:                                               ; preds = %86
  %94 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !8
  %95 = zext i8 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 1
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !8
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 8
  %100 = or i64 %99, %95
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 2
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !8
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 16
  %105 = or i64 %100, %104
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 3
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !8
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 24
  %110 = or i64 %105, %109
  %111 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 4
  %112 = load i8, i8 addrspace(4)* %111, align 1, !tbaa !8
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 32
  %115 = or i64 %110, %114
  %116 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 5
  %117 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !8
  %118 = zext i8 %117 to i64
  %119 = shl nuw nsw i64 %118, 40
  %120 = or i64 %115, %119
  %121 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 6
  %122 = load i8, i8 addrspace(4)* %121, align 1, !tbaa !8
  %123 = zext i8 %122 to i64
  %124 = shl nuw nsw i64 %123, 48
  %125 = or i64 %120, %124
  %126 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 7
  %127 = load i8, i8 addrspace(4)* %126, align 1, !tbaa !8
  %128 = zext i8 %127 to i64
  %129 = shl nuw i64 %128, 56
  %130 = or i64 %125, %129
  %131 = add nsw i32 %88, -8
  %132 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 8
  br label %146

133:                                              ; preds = %91, %133
  %134 = phi i32 [ %144, %133 ], [ 0, %91 ]
  %135 = phi i64 [ %143, %133 ], [ 0, %91 ]
  %136 = zext i32 %134 to i64
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %87, i64 %136
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !8
  %139 = zext i8 %138 to i64
  %140 = shl i32 %134, 3
  %141 = zext i32 %140 to i64
  %142 = shl nuw i64 %139, %141
  %143 = or i64 %142, %135
  %144 = add nuw nsw i32 %134, 1
  %145 = icmp eq i32 %144, %88
  br i1 %145, label %146, label %133

146:                                              ; preds = %133, %93, %91
  %147 = phi i8 addrspace(4)* [ %132, %93 ], [ %87, %91 ], [ %87, %133 ]
  %148 = phi i32 [ %131, %93 ], [ 0, %91 ], [ 0, %133 ]
  %149 = phi i64 [ %130, %93 ], [ 0, %91 ], [ %143, %133 ]
  %150 = icmp ugt i32 %148, 7
  br i1 %150, label %153, label %151

151:                                              ; preds = %146
  %152 = icmp eq i32 %148, 0
  br i1 %152, label %206, label %193

153:                                              ; preds = %146
  %154 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !8
  %155 = zext i8 %154 to i64
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 1
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !8
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 8
  %160 = or i64 %159, %155
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 2
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !8
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 16
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 3
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !8
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 24
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 4
  %172 = load i8, i8 addrspace(4)* %171, align 1, !tbaa !8
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 32
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 5
  %177 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !8
  %178 = zext i8 %177 to i64
  %179 = shl nuw nsw i64 %178, 40
  %180 = or i64 %175, %179
  %181 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 6
  %182 = load i8, i8 addrspace(4)* %181, align 1, !tbaa !8
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 48
  %185 = or i64 %180, %184
  %186 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 7
  %187 = load i8, i8 addrspace(4)* %186, align 1, !tbaa !8
  %188 = zext i8 %187 to i64
  %189 = shl nuw i64 %188, 56
  %190 = or i64 %185, %189
  %191 = add nsw i32 %148, -8
  %192 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 8
  br label %206

193:                                              ; preds = %151, %193
  %194 = phi i32 [ %204, %193 ], [ 0, %151 ]
  %195 = phi i64 [ %203, %193 ], [ 0, %151 ]
  %196 = zext i32 %194 to i64
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %147, i64 %196
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !8
  %199 = zext i8 %198 to i64
  %200 = shl i32 %194, 3
  %201 = zext i32 %200 to i64
  %202 = shl nuw i64 %199, %201
  %203 = or i64 %202, %195
  %204 = add nuw nsw i32 %194, 1
  %205 = icmp eq i32 %204, %148
  br i1 %205, label %206, label %193

206:                                              ; preds = %193, %153, %151
  %207 = phi i8 addrspace(4)* [ %192, %153 ], [ %147, %151 ], [ %147, %193 ]
  %208 = phi i32 [ %191, %153 ], [ 0, %151 ], [ 0, %193 ]
  %209 = phi i64 [ %190, %153 ], [ 0, %151 ], [ %203, %193 ]
  %210 = icmp ugt i32 %208, 7
  br i1 %210, label %213, label %211

211:                                              ; preds = %206
  %212 = icmp eq i32 %208, 0
  br i1 %212, label %266, label %253

213:                                              ; preds = %206
  %214 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !8
  %215 = zext i8 %214 to i64
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 1
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !8
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 8
  %220 = or i64 %219, %215
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 2
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !8
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 16
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 3
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !8
  %228 = zext i8 %227 to i64
  %229 = shl nuw nsw i64 %228, 24
  %230 = or i64 %225, %229
  %231 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 4
  %232 = load i8, i8 addrspace(4)* %231, align 1, !tbaa !8
  %233 = zext i8 %232 to i64
  %234 = shl nuw nsw i64 %233, 32
  %235 = or i64 %230, %234
  %236 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 5
  %237 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !8
  %238 = zext i8 %237 to i64
  %239 = shl nuw nsw i64 %238, 40
  %240 = or i64 %235, %239
  %241 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 6
  %242 = load i8, i8 addrspace(4)* %241, align 1, !tbaa !8
  %243 = zext i8 %242 to i64
  %244 = shl nuw nsw i64 %243, 48
  %245 = or i64 %240, %244
  %246 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 7
  %247 = load i8, i8 addrspace(4)* %246, align 1, !tbaa !8
  %248 = zext i8 %247 to i64
  %249 = shl nuw i64 %248, 56
  %250 = or i64 %245, %249
  %251 = add nsw i32 %208, -8
  %252 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 8
  br label %266

253:                                              ; preds = %211, %253
  %254 = phi i32 [ %264, %253 ], [ 0, %211 ]
  %255 = phi i64 [ %263, %253 ], [ 0, %211 ]
  %256 = zext i32 %254 to i64
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %207, i64 %256
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !8
  %259 = zext i8 %258 to i64
  %260 = shl i32 %254, 3
  %261 = zext i32 %260 to i64
  %262 = shl nuw i64 %259, %261
  %263 = or i64 %262, %255
  %264 = add nuw nsw i32 %254, 1
  %265 = icmp eq i32 %264, %208
  br i1 %265, label %266, label %253

266:                                              ; preds = %253, %213, %211
  %267 = phi i8 addrspace(4)* [ %252, %213 ], [ %207, %211 ], [ %207, %253 ]
  %268 = phi i32 [ %251, %213 ], [ 0, %211 ], [ 0, %253 ]
  %269 = phi i64 [ %250, %213 ], [ 0, %211 ], [ %263, %253 ]
  %270 = icmp ugt i32 %268, 7
  br i1 %270, label %273, label %271

271:                                              ; preds = %266
  %272 = icmp eq i32 %268, 0
  br i1 %272, label %326, label %313

273:                                              ; preds = %266
  %274 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !8
  %275 = zext i8 %274 to i64
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 1
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !8
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 8
  %280 = or i64 %279, %275
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 2
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !8
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 16
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 3
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !8
  %288 = zext i8 %287 to i64
  %289 = shl nuw nsw i64 %288, 24
  %290 = or i64 %285, %289
  %291 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 4
  %292 = load i8, i8 addrspace(4)* %291, align 1, !tbaa !8
  %293 = zext i8 %292 to i64
  %294 = shl nuw nsw i64 %293, 32
  %295 = or i64 %290, %294
  %296 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 5
  %297 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !8
  %298 = zext i8 %297 to i64
  %299 = shl nuw nsw i64 %298, 40
  %300 = or i64 %295, %299
  %301 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 6
  %302 = load i8, i8 addrspace(4)* %301, align 1, !tbaa !8
  %303 = zext i8 %302 to i64
  %304 = shl nuw nsw i64 %303, 48
  %305 = or i64 %300, %304
  %306 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 7
  %307 = load i8, i8 addrspace(4)* %306, align 1, !tbaa !8
  %308 = zext i8 %307 to i64
  %309 = shl nuw i64 %308, 56
  %310 = or i64 %305, %309
  %311 = add nsw i32 %268, -8
  %312 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 8
  br label %326

313:                                              ; preds = %271, %313
  %314 = phi i32 [ %324, %313 ], [ 0, %271 ]
  %315 = phi i64 [ %323, %313 ], [ 0, %271 ]
  %316 = zext i32 %314 to i64
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %267, i64 %316
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !8
  %319 = zext i8 %318 to i64
  %320 = shl i32 %314, 3
  %321 = zext i32 %320 to i64
  %322 = shl nuw i64 %319, %321
  %323 = or i64 %322, %315
  %324 = add nuw nsw i32 %314, 1
  %325 = icmp eq i32 %324, %268
  br i1 %325, label %326, label %313

326:                                              ; preds = %313, %273, %271
  %327 = phi i8 addrspace(4)* [ %312, %273 ], [ %267, %271 ], [ %267, %313 ]
  %328 = phi i32 [ %311, %273 ], [ 0, %271 ], [ 0, %313 ]
  %329 = phi i64 [ %310, %273 ], [ 0, %271 ], [ %323, %313 ]
  %330 = icmp ugt i32 %328, 7
  br i1 %330, label %333, label %331

331:                                              ; preds = %326
  %332 = icmp eq i32 %328, 0
  br i1 %332, label %386, label %373

333:                                              ; preds = %326
  %334 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !8
  %335 = zext i8 %334 to i64
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 1
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !8
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 8
  %340 = or i64 %339, %335
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 2
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !8
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 16
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 3
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !8
  %348 = zext i8 %347 to i64
  %349 = shl nuw nsw i64 %348, 24
  %350 = or i64 %345, %349
  %351 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 4
  %352 = load i8, i8 addrspace(4)* %351, align 1, !tbaa !8
  %353 = zext i8 %352 to i64
  %354 = shl nuw nsw i64 %353, 32
  %355 = or i64 %350, %354
  %356 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 5
  %357 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !8
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 40
  %360 = or i64 %355, %359
  %361 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 6
  %362 = load i8, i8 addrspace(4)* %361, align 1, !tbaa !8
  %363 = zext i8 %362 to i64
  %364 = shl nuw nsw i64 %363, 48
  %365 = or i64 %360, %364
  %366 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 7
  %367 = load i8, i8 addrspace(4)* %366, align 1, !tbaa !8
  %368 = zext i8 %367 to i64
  %369 = shl nuw i64 %368, 56
  %370 = or i64 %365, %369
  %371 = add nsw i32 %328, -8
  %372 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 8
  br label %386

373:                                              ; preds = %331, %373
  %374 = phi i32 [ %384, %373 ], [ 0, %331 ]
  %375 = phi i64 [ %383, %373 ], [ 0, %331 ]
  %376 = zext i32 %374 to i64
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %327, i64 %376
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !8
  %379 = zext i8 %378 to i64
  %380 = shl i32 %374, 3
  %381 = zext i32 %380 to i64
  %382 = shl nuw i64 %379, %381
  %383 = or i64 %382, %375
  %384 = add nuw nsw i32 %374, 1
  %385 = icmp eq i32 %384, %328
  br i1 %385, label %386, label %373

386:                                              ; preds = %373, %333, %331
  %387 = phi i8 addrspace(4)* [ %372, %333 ], [ %327, %331 ], [ %327, %373 ]
  %388 = phi i32 [ %371, %333 ], [ 0, %331 ], [ 0, %373 ]
  %389 = phi i64 [ %370, %333 ], [ 0, %331 ], [ %383, %373 ]
  %390 = icmp ugt i32 %388, 7
  br i1 %390, label %393, label %391

391:                                              ; preds = %386
  %392 = icmp eq i32 %388, 0
  br i1 %392, label %444, label %431

393:                                              ; preds = %386
  %394 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !8
  %395 = zext i8 %394 to i64
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 1
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !8
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 8
  %400 = or i64 %399, %395
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 2
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !8
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 16
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 3
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !8
  %408 = zext i8 %407 to i64
  %409 = shl nuw nsw i64 %408, 24
  %410 = or i64 %405, %409
  %411 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 4
  %412 = load i8, i8 addrspace(4)* %411, align 1, !tbaa !8
  %413 = zext i8 %412 to i64
  %414 = shl nuw nsw i64 %413, 32
  %415 = or i64 %410, %414
  %416 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 5
  %417 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !8
  %418 = zext i8 %417 to i64
  %419 = shl nuw nsw i64 %418, 40
  %420 = or i64 %415, %419
  %421 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 6
  %422 = load i8, i8 addrspace(4)* %421, align 1, !tbaa !8
  %423 = zext i8 %422 to i64
  %424 = shl nuw nsw i64 %423, 48
  %425 = or i64 %420, %424
  %426 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 7
  %427 = load i8, i8 addrspace(4)* %426, align 1, !tbaa !8
  %428 = zext i8 %427 to i64
  %429 = shl nuw i64 %428, 56
  %430 = or i64 %425, %429
  br label %444

431:                                              ; preds = %391, %431
  %432 = phi i32 [ %442, %431 ], [ 0, %391 ]
  %433 = phi i64 [ %441, %431 ], [ 0, %391 ]
  %434 = zext i32 %432 to i64
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %387, i64 %434
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !8
  %437 = zext i8 %436 to i64
  %438 = shl i32 %432, 3
  %439 = zext i32 %438 to i64
  %440 = shl nuw i64 %437, %439
  %441 = or i64 %440, %433
  %442 = add nuw nsw i32 %432, 1
  %443 = icmp eq i32 %442, %388
  br i1 %443, label %444, label %431

444:                                              ; preds = %431, %393, %391
  %445 = phi i64 [ %430, %393 ], [ 0, %391 ], [ %441, %431 ]
  %446 = shl nuw nsw i64 %27, 2
  %447 = add nuw nsw i64 %446, 28
  %448 = and i64 %447, 480
  %449 = and i64 %29, -225
  %450 = or i64 %449, %448
  %451 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %450, i64 noundef %89, i64 noundef %149, i64 noundef %209, i64 noundef %269, i64 noundef %329, i64 noundef %389, i64 noundef %445) #10
  %452 = sub i64 %19, %27
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %20, i64 %27
  %454 = icmp eq i64 %452, 0
  br i1 %454, label %455, label %18

455:                                              ; preds = %444, %11
  %456 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %457 = getelementptr i8, i8 addrspace(4)* %456, i64 4
  %458 = bitcast i8 addrspace(4)* %457 to i16 addrspace(4)*
  %459 = load i16, i16 addrspace(4)* %458, align 4, !range !11, !invariant.load !12
  %460 = zext i16 %459 to i32
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %456, i64 12
  %462 = bitcast i8 addrspace(4)* %461 to i32 addrspace(4)*
  %463 = load i32, i32 addrspace(4)* %462, align 4, !tbaa !13
  %464 = udiv i32 %463, %460
  %465 = mul i32 %464, %460
  %466 = icmp ugt i32 %463, %465
  %467 = zext i1 %466 to i32
  %468 = add i32 %464, %467
  %469 = mul i32 %468, %460
  %470 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %471 = add i32 %469, %470
  %472 = icmp ult i32 %471, %1
  br i1 %472, label %473, label %931

473:                                              ; preds = %455
  %474 = zext i32 %471 to i64
  %475 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %474
  %476 = load i32, i32 addrspace(1)* %475, align 4, !tbaa !20
  %477 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %478 = extractelement <2 x i64> %477, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %479, label %483

479:                                              ; preds = %473
  %480 = and i64 %478, -225
  %481 = or i64 %480, 32
  %482 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %481, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %924

483:                                              ; preds = %473
  %484 = and i64 %478, 2
  %485 = and i64 %478, -3
  %486 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %485, i64 0
  br label %487

487:                                              ; preds = %913, %483
  %488 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 14) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([15 x i8]* addrspacecast ([15 x i8] addrspace(4)* @.str.1 to [15 x i8]*) to i64)), i64 1))), %483 ], [ %921, %913 ]
  %489 = phi i8 addrspace(4)* [ getelementptr inbounds ([15 x i8], [15 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %483 ], [ %922, %913 ]
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
  %503 = load i8, i8 addrspace(4)* %489, align 1, !tbaa !8
  %504 = zext i8 %503 to i64
  %505 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 1
  %506 = load i8, i8 addrspace(4)* %505, align 1, !tbaa !8
  %507 = zext i8 %506 to i64
  %508 = shl nuw nsw i64 %507, 8
  %509 = or i64 %508, %504
  %510 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 2
  %511 = load i8, i8 addrspace(4)* %510, align 1, !tbaa !8
  %512 = zext i8 %511 to i64
  %513 = shl nuw nsw i64 %512, 16
  %514 = or i64 %509, %513
  %515 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 3
  %516 = load i8, i8 addrspace(4)* %515, align 1, !tbaa !8
  %517 = zext i8 %516 to i64
  %518 = shl nuw nsw i64 %517, 24
  %519 = or i64 %514, %518
  %520 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 4
  %521 = load i8, i8 addrspace(4)* %520, align 1, !tbaa !8
  %522 = zext i8 %521 to i64
  %523 = shl nuw nsw i64 %522, 32
  %524 = or i64 %519, %523
  %525 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 5
  %526 = load i8, i8 addrspace(4)* %525, align 1, !tbaa !8
  %527 = zext i8 %526 to i64
  %528 = shl nuw nsw i64 %527, 40
  %529 = or i64 %524, %528
  %530 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 6
  %531 = load i8, i8 addrspace(4)* %530, align 1, !tbaa !8
  %532 = zext i8 %531 to i64
  %533 = shl nuw nsw i64 %532, 48
  %534 = or i64 %529, %533
  %535 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 7
  %536 = load i8, i8 addrspace(4)* %535, align 1, !tbaa !8
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
  %547 = load i8, i8 addrspace(4)* %546, align 1, !tbaa !8
  %548 = zext i8 %547 to i64
  %549 = shl i32 %543, 3
  %550 = zext i32 %549 to i64
  %551 = shl nuw i64 %548, %550
  %552 = or i64 %551, %544
  %553 = add nuw nsw i32 %543, 1
  %554 = icmp eq i32 %553, %497
  br i1 %554, label %555, label %542, !llvm.loop !9

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
  %563 = load i8, i8 addrspace(4)* %556, align 1, !tbaa !8
  %564 = zext i8 %563 to i64
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 1
  %566 = load i8, i8 addrspace(4)* %565, align 1, !tbaa !8
  %567 = zext i8 %566 to i64
  %568 = shl nuw nsw i64 %567, 8
  %569 = or i64 %568, %564
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 2
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !8
  %572 = zext i8 %571 to i64
  %573 = shl nuw nsw i64 %572, 16
  %574 = or i64 %569, %573
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 3
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !8
  %577 = zext i8 %576 to i64
  %578 = shl nuw nsw i64 %577, 24
  %579 = or i64 %574, %578
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 4
  %581 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !8
  %582 = zext i8 %581 to i64
  %583 = shl nuw nsw i64 %582, 32
  %584 = or i64 %579, %583
  %585 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 5
  %586 = load i8, i8 addrspace(4)* %585, align 1, !tbaa !8
  %587 = zext i8 %586 to i64
  %588 = shl nuw nsw i64 %587, 40
  %589 = or i64 %584, %588
  %590 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 6
  %591 = load i8, i8 addrspace(4)* %590, align 1, !tbaa !8
  %592 = zext i8 %591 to i64
  %593 = shl nuw nsw i64 %592, 48
  %594 = or i64 %589, %593
  %595 = getelementptr inbounds i8, i8 addrspace(4)* %556, i64 7
  %596 = load i8, i8 addrspace(4)* %595, align 1, !tbaa !8
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
  %607 = load i8, i8 addrspace(4)* %606, align 1, !tbaa !8
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
  %623 = load i8, i8 addrspace(4)* %616, align 1, !tbaa !8
  %624 = zext i8 %623 to i64
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 1
  %626 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !8
  %627 = zext i8 %626 to i64
  %628 = shl nuw nsw i64 %627, 8
  %629 = or i64 %628, %624
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 2
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !8
  %632 = zext i8 %631 to i64
  %633 = shl nuw nsw i64 %632, 16
  %634 = or i64 %629, %633
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 3
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !8
  %637 = zext i8 %636 to i64
  %638 = shl nuw nsw i64 %637, 24
  %639 = or i64 %634, %638
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 4
  %641 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !8
  %642 = zext i8 %641 to i64
  %643 = shl nuw nsw i64 %642, 32
  %644 = or i64 %639, %643
  %645 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 5
  %646 = load i8, i8 addrspace(4)* %645, align 1, !tbaa !8
  %647 = zext i8 %646 to i64
  %648 = shl nuw nsw i64 %647, 40
  %649 = or i64 %644, %648
  %650 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 6
  %651 = load i8, i8 addrspace(4)* %650, align 1, !tbaa !8
  %652 = zext i8 %651 to i64
  %653 = shl nuw nsw i64 %652, 48
  %654 = or i64 %649, %653
  %655 = getelementptr inbounds i8, i8 addrspace(4)* %616, i64 7
  %656 = load i8, i8 addrspace(4)* %655, align 1, !tbaa !8
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
  %667 = load i8, i8 addrspace(4)* %666, align 1, !tbaa !8
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
  %683 = load i8, i8 addrspace(4)* %676, align 1, !tbaa !8
  %684 = zext i8 %683 to i64
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 1
  %686 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !8
  %687 = zext i8 %686 to i64
  %688 = shl nuw nsw i64 %687, 8
  %689 = or i64 %688, %684
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 2
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !8
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 16
  %694 = or i64 %689, %693
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 3
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !8
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 24
  %699 = or i64 %694, %698
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 4
  %701 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !8
  %702 = zext i8 %701 to i64
  %703 = shl nuw nsw i64 %702, 32
  %704 = or i64 %699, %703
  %705 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 5
  %706 = load i8, i8 addrspace(4)* %705, align 1, !tbaa !8
  %707 = zext i8 %706 to i64
  %708 = shl nuw nsw i64 %707, 40
  %709 = or i64 %704, %708
  %710 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 6
  %711 = load i8, i8 addrspace(4)* %710, align 1, !tbaa !8
  %712 = zext i8 %711 to i64
  %713 = shl nuw nsw i64 %712, 48
  %714 = or i64 %709, %713
  %715 = getelementptr inbounds i8, i8 addrspace(4)* %676, i64 7
  %716 = load i8, i8 addrspace(4)* %715, align 1, !tbaa !8
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
  %727 = load i8, i8 addrspace(4)* %726, align 1, !tbaa !8
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
  %743 = load i8, i8 addrspace(4)* %736, align 1, !tbaa !8
  %744 = zext i8 %743 to i64
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 1
  %746 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !8
  %747 = zext i8 %746 to i64
  %748 = shl nuw nsw i64 %747, 8
  %749 = or i64 %748, %744
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 2
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !8
  %752 = zext i8 %751 to i64
  %753 = shl nuw nsw i64 %752, 16
  %754 = or i64 %749, %753
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 3
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !8
  %757 = zext i8 %756 to i64
  %758 = shl nuw nsw i64 %757, 24
  %759 = or i64 %754, %758
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 4
  %761 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !8
  %762 = zext i8 %761 to i64
  %763 = shl nuw nsw i64 %762, 32
  %764 = or i64 %759, %763
  %765 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 5
  %766 = load i8, i8 addrspace(4)* %765, align 1, !tbaa !8
  %767 = zext i8 %766 to i64
  %768 = shl nuw nsw i64 %767, 40
  %769 = or i64 %764, %768
  %770 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 6
  %771 = load i8, i8 addrspace(4)* %770, align 1, !tbaa !8
  %772 = zext i8 %771 to i64
  %773 = shl nuw nsw i64 %772, 48
  %774 = or i64 %769, %773
  %775 = getelementptr inbounds i8, i8 addrspace(4)* %736, i64 7
  %776 = load i8, i8 addrspace(4)* %775, align 1, !tbaa !8
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
  %787 = load i8, i8 addrspace(4)* %786, align 1, !tbaa !8
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
  %803 = load i8, i8 addrspace(4)* %796, align 1, !tbaa !8
  %804 = zext i8 %803 to i64
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 1
  %806 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !8
  %807 = zext i8 %806 to i64
  %808 = shl nuw nsw i64 %807, 8
  %809 = or i64 %808, %804
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 2
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !8
  %812 = zext i8 %811 to i64
  %813 = shl nuw nsw i64 %812, 16
  %814 = or i64 %809, %813
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 3
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !8
  %817 = zext i8 %816 to i64
  %818 = shl nuw nsw i64 %817, 24
  %819 = or i64 %814, %818
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 4
  %821 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !8
  %822 = zext i8 %821 to i64
  %823 = shl nuw nsw i64 %822, 32
  %824 = or i64 %819, %823
  %825 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 5
  %826 = load i8, i8 addrspace(4)* %825, align 1, !tbaa !8
  %827 = zext i8 %826 to i64
  %828 = shl nuw nsw i64 %827, 40
  %829 = or i64 %824, %828
  %830 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 6
  %831 = load i8, i8 addrspace(4)* %830, align 1, !tbaa !8
  %832 = zext i8 %831 to i64
  %833 = shl nuw nsw i64 %832, 48
  %834 = or i64 %829, %833
  %835 = getelementptr inbounds i8, i8 addrspace(4)* %796, i64 7
  %836 = load i8, i8 addrspace(4)* %835, align 1, !tbaa !8
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
  %847 = load i8, i8 addrspace(4)* %846, align 1, !tbaa !8
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
  %863 = load i8, i8 addrspace(4)* %856, align 1, !tbaa !8
  %864 = zext i8 %863 to i64
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 1
  %866 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !8
  %867 = zext i8 %866 to i64
  %868 = shl nuw nsw i64 %867, 8
  %869 = or i64 %868, %864
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 2
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !8
  %872 = zext i8 %871 to i64
  %873 = shl nuw nsw i64 %872, 16
  %874 = or i64 %869, %873
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 3
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !8
  %877 = zext i8 %876 to i64
  %878 = shl nuw nsw i64 %877, 24
  %879 = or i64 %874, %878
  %880 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 4
  %881 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !8
  %882 = zext i8 %881 to i64
  %883 = shl nuw nsw i64 %882, 32
  %884 = or i64 %879, %883
  %885 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 5
  %886 = load i8, i8 addrspace(4)* %885, align 1, !tbaa !8
  %887 = zext i8 %886 to i64
  %888 = shl nuw nsw i64 %887, 40
  %889 = or i64 %884, %888
  %890 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 6
  %891 = load i8, i8 addrspace(4)* %890, align 1, !tbaa !8
  %892 = zext i8 %891 to i64
  %893 = shl nuw nsw i64 %892, 48
  %894 = or i64 %889, %893
  %895 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 7
  %896 = load i8, i8 addrspace(4)* %895, align 1, !tbaa !8
  %897 = zext i8 %896 to i64
  %898 = shl nuw i64 %897, 56
  %899 = or i64 %894, %898
  br label %913

900:                                              ; preds = %860, %900
  %901 = phi i32 [ %911, %900 ], [ 0, %860 ]
  %902 = phi i64 [ %910, %900 ], [ 0, %860 ]
  %903 = zext i32 %901 to i64
  %904 = getelementptr inbounds i8, i8 addrspace(4)* %856, i64 %903
  %905 = load i8, i8 addrspace(4)* %904, align 1, !tbaa !8
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
  %920 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %919, i64 noundef %558, i64 noundef %618, i64 noundef %678, i64 noundef %738, i64 noundef %798, i64 noundef %858, i64 noundef %914) #10
  %921 = sub i64 %488, %496
  %922 = getelementptr inbounds i8, i8 addrspace(4)* %489, i64 %496
  %923 = icmp eq i64 %921, 0
  br i1 %923, label %924, label %487

924:                                              ; preds = %913, %479
  %925 = phi <2 x i64> [ %482, %479 ], [ %920, %913 ]
  %926 = extractelement <2 x i64> %925, i64 0
  %927 = zext i32 %476 to i64
  %928 = and i64 %926, -227
  %929 = or i64 %928, 34
  %930 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %8, i64 noundef %929, i64 noundef %927, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %931

931:                                              ; preds = %924, %455
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !24
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !25
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !25
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !26
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !25
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !25
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !24
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !27
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !4
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !27
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !29
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !30
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !29
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !25
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !27
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
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !24
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !24
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
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
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !24
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !25
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !25
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !27
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
!11 = !{i16 1, i16 1025}
!12 = !{}
!13 = !{!14, !16, i64 12}
!14 = !{!"hsa_kernel_dispatch_packet_s", !15, i64 0, !15, i64 2, !15, i64 4, !15, i64 6, !15, i64 8, !15, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !5, i64 32, !17, i64 40, !5, i64 48, !18, i64 56}
!15 = !{!"short", !6, i64 0}
!16 = !{!"int", !6, i64 0}
!17 = !{!"any pointer", !6, i64 0}
!18 = !{!"hsa_signal_s", !5, i64 0}
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !22, i64 0}
!22 = !{!"omnipotent char", !23, i64 0}
!23 = !{!"Simple C++ TBAA"}
!24 = !{!17, !17, i64 0}
!25 = !{!16, !16, i64 0}
!26 = !{i64 2662}
!27 = !{!28, !17, i64 0}
!28 = !{!"", !17, i64 0, !17, i64 8, !18, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!29 = !{!28, !5, i64 40}
!30 = !{!28, !17, i64 8}
!31 = !{!"exec"}
!32 = !{!33, !16, i64 16}
!33 = !{!"", !5, i64 0, !5, i64 8, !16, i64 16, !16, i64 20}
!34 = !{!33, !5, i64 8}
!35 = !{!33, !16, i64 20}
!36 = !{!33, !5, i64 0}
!37 = !{!38, !5, i64 16}
!38 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !16, i64 24, !16, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!39 = !{!38, !16, i64 24}
