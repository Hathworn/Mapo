; ModuleID = '../data/hip_kernels/32/9/main.cu'
source_filename = "../data/hip_kernels/32/9/main.cu"
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

@.str = private unnamed_addr addrspace(4) constant [7 x i8] c"%4.3f \00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [2 x i8] c"\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z8VarPrintPdiii(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %20

6:                                                ; preds = %4
  %7 = icmp sgt i32 %2, 0
  %8 = icmp sgt i32 %1, 0
  %9 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 24
  %11 = bitcast i8 addrspace(4)* %10 to i64 addrspace(4)*
  br label %12

12:                                               ; preds = %6, %1841
  %13 = phi i32 [ 0, %6 ], [ %1842, %1841 ]
  br i1 %7, label %18, label %14

14:                                               ; preds = %12
  %15 = load i64, i64 addrspace(4)* %11, align 8, !tbaa !4
  %16 = inttoptr i64 %15 to i8 addrspace(1)*
  %17 = addrspacecast i8 addrspace(1)* %16 to i8*
  br label %33

18:                                               ; preds = %12
  %19 = mul i32 %13, %2
  br label %21

20:                                               ; preds = %1841, %4
  ret void

21:                                               ; preds = %18, %947
  %22 = phi i32 [ 0, %18 ], [ %948, %947 ]
  br i1 %8, label %27, label %23

23:                                               ; preds = %21
  %24 = load i64, i64 addrspace(4)* %11, align 8, !tbaa !4
  %25 = inttoptr i64 %24 to i8 addrspace(1)*
  %26 = addrspacecast i8 addrspace(1)* %25 to i8*
  br label %37

27:                                               ; preds = %21
  %28 = add i32 %22, %19
  %29 = mul i32 %28, %1
  %30 = load i64, i64 addrspace(4)* %11, align 8, !tbaa !4
  %31 = inttoptr i64 %30 to i8 addrspace(1)*
  %32 = addrspacecast i8 addrspace(1)* %31 to i8*
  br label %41

33:                                               ; preds = %947, %14
  %34 = phi i8* [ %17, %14 ], [ %38, %947 ]
  %35 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %36 = extractelement <2 x i64> %35, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %950, label %954

37:                                               ; preds = %495, %23
  %38 = phi i8* [ %26, %23 ], [ %32, %495 ]
  %39 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %38, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %40 = extractelement <2 x i64> %39, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %503, label %507

41:                                               ; preds = %27, %495
  %42 = phi i32 [ 0, %27 ], [ %501, %495 ]
  %43 = add i32 %42, %29
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = bitcast double addrspace(1)* %45 to i64 addrspace(1)*
  %47 = load i64, i64 addrspace(1)* %46, align 8, !tbaa !8
  %48 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %49 = extractelement <2 x i64> %48, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %50, label %54

50:                                               ; preds = %41
  %51 = and i64 %49, -225
  %52 = or i64 %51, 32
  %53 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %52, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %495

54:                                               ; preds = %41
  %55 = and i64 %49, 2
  %56 = and i64 %49, -3
  %57 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %56, i64 0
  br label %58

58:                                               ; preds = %484, %54
  %59 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 6) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([7 x i8]* addrspacecast ([7 x i8] addrspace(4)* @.str to [7 x i8]*) to i64)), i64 1))), %54 ], [ %492, %484 ]
  %60 = phi i8 addrspace(4)* [ getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0), %54 ], [ %493, %484 ]
  %61 = phi <2 x i64> [ %57, %54 ], [ %491, %484 ]
  %62 = icmp ugt i64 %59, 56
  %63 = extractelement <2 x i64> %61, i64 0
  %64 = or i64 %63, %55
  %65 = insertelement <2 x i64> poison, i64 %64, i64 0
  %66 = select i1 %62, <2 x i64> %61, <2 x i64> %65
  %67 = tail call i64 @llvm.umin.i64(i64 %59, i64 56)
  %68 = trunc i64 %67 to i32
  %69 = extractelement <2 x i64> %66, i64 0
  %70 = icmp ugt i32 %68, 7
  br i1 %70, label %73, label %71

71:                                               ; preds = %58
  %72 = icmp eq i32 %68, 0
  br i1 %72, label %126, label %113

73:                                               ; preds = %58
  %74 = load i8, i8 addrspace(4)* %60, align 1, !tbaa !12
  %75 = zext i8 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 1
  %77 = load i8, i8 addrspace(4)* %76, align 1, !tbaa !12
  %78 = zext i8 %77 to i64
  %79 = shl nuw nsw i64 %78, 8
  %80 = or i64 %79, %75
  %81 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 2
  %82 = load i8, i8 addrspace(4)* %81, align 1, !tbaa !12
  %83 = zext i8 %82 to i64
  %84 = shl nuw nsw i64 %83, 16
  %85 = or i64 %80, %84
  %86 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 3
  %87 = load i8, i8 addrspace(4)* %86, align 1, !tbaa !12
  %88 = zext i8 %87 to i64
  %89 = shl nuw nsw i64 %88, 24
  %90 = or i64 %85, %89
  %91 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 4
  %92 = load i8, i8 addrspace(4)* %91, align 1, !tbaa !12
  %93 = zext i8 %92 to i64
  %94 = shl nuw nsw i64 %93, 32
  %95 = or i64 %90, %94
  %96 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 5
  %97 = load i8, i8 addrspace(4)* %96, align 1, !tbaa !12
  %98 = zext i8 %97 to i64
  %99 = shl nuw nsw i64 %98, 40
  %100 = or i64 %95, %99
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 6
  %102 = load i8, i8 addrspace(4)* %101, align 1, !tbaa !12
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 48
  %105 = or i64 %100, %104
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 7
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !12
  %108 = zext i8 %107 to i64
  %109 = shl nuw i64 %108, 56
  %110 = or i64 %105, %109
  %111 = add nsw i32 %68, -8
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 8
  br label %126

113:                                              ; preds = %71, %113
  %114 = phi i32 [ %124, %113 ], [ 0, %71 ]
  %115 = phi i64 [ %123, %113 ], [ 0, %71 ]
  %116 = zext i32 %114 to i64
  %117 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 %116
  %118 = load i8, i8 addrspace(4)* %117, align 1, !tbaa !12
  %119 = zext i8 %118 to i64
  %120 = shl i32 %114, 3
  %121 = zext i32 %120 to i64
  %122 = shl nuw i64 %119, %121
  %123 = or i64 %122, %115
  %124 = add nuw nsw i32 %114, 1
  %125 = icmp eq i32 %124, %68
  br i1 %125, label %126, label %113, !llvm.loop !13

126:                                              ; preds = %113, %73, %71
  %127 = phi i8 addrspace(4)* [ %112, %73 ], [ %60, %71 ], [ %60, %113 ]
  %128 = phi i32 [ %111, %73 ], [ 0, %71 ], [ 0, %113 ]
  %129 = phi i64 [ %110, %73 ], [ 0, %71 ], [ %123, %113 ]
  %130 = icmp ugt i32 %128, 7
  br i1 %130, label %133, label %131

131:                                              ; preds = %126
  %132 = icmp eq i32 %128, 0
  br i1 %132, label %186, label %173

133:                                              ; preds = %126
  %134 = load i8, i8 addrspace(4)* %127, align 1, !tbaa !12
  %135 = zext i8 %134 to i64
  %136 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 1
  %137 = load i8, i8 addrspace(4)* %136, align 1, !tbaa !12
  %138 = zext i8 %137 to i64
  %139 = shl nuw nsw i64 %138, 8
  %140 = or i64 %139, %135
  %141 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 2
  %142 = load i8, i8 addrspace(4)* %141, align 1, !tbaa !12
  %143 = zext i8 %142 to i64
  %144 = shl nuw nsw i64 %143, 16
  %145 = or i64 %140, %144
  %146 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 3
  %147 = load i8, i8 addrspace(4)* %146, align 1, !tbaa !12
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 24
  %150 = or i64 %145, %149
  %151 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 4
  %152 = load i8, i8 addrspace(4)* %151, align 1, !tbaa !12
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 32
  %155 = or i64 %150, %154
  %156 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 5
  %157 = load i8, i8 addrspace(4)* %156, align 1, !tbaa !12
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 40
  %160 = or i64 %155, %159
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 6
  %162 = load i8, i8 addrspace(4)* %161, align 1, !tbaa !12
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 48
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 7
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !12
  %168 = zext i8 %167 to i64
  %169 = shl nuw i64 %168, 56
  %170 = or i64 %165, %169
  %171 = add nsw i32 %128, -8
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 8
  br label %186

173:                                              ; preds = %131, %173
  %174 = phi i32 [ %184, %173 ], [ 0, %131 ]
  %175 = phi i64 [ %183, %173 ], [ 0, %131 ]
  %176 = zext i32 %174 to i64
  %177 = getelementptr inbounds i8, i8 addrspace(4)* %127, i64 %176
  %178 = load i8, i8 addrspace(4)* %177, align 1, !tbaa !12
  %179 = zext i8 %178 to i64
  %180 = shl i32 %174, 3
  %181 = zext i32 %180 to i64
  %182 = shl nuw i64 %179, %181
  %183 = or i64 %182, %175
  %184 = add nuw nsw i32 %174, 1
  %185 = icmp eq i32 %184, %128
  br i1 %185, label %186, label %173

186:                                              ; preds = %173, %133, %131
  %187 = phi i8 addrspace(4)* [ %172, %133 ], [ %127, %131 ], [ %127, %173 ]
  %188 = phi i32 [ %171, %133 ], [ 0, %131 ], [ 0, %173 ]
  %189 = phi i64 [ %170, %133 ], [ 0, %131 ], [ %183, %173 ]
  %190 = icmp ugt i32 %188, 7
  br i1 %190, label %193, label %191

191:                                              ; preds = %186
  %192 = icmp eq i32 %188, 0
  br i1 %192, label %246, label %233

193:                                              ; preds = %186
  %194 = load i8, i8 addrspace(4)* %187, align 1, !tbaa !12
  %195 = zext i8 %194 to i64
  %196 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 1
  %197 = load i8, i8 addrspace(4)* %196, align 1, !tbaa !12
  %198 = zext i8 %197 to i64
  %199 = shl nuw nsw i64 %198, 8
  %200 = or i64 %199, %195
  %201 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 2
  %202 = load i8, i8 addrspace(4)* %201, align 1, !tbaa !12
  %203 = zext i8 %202 to i64
  %204 = shl nuw nsw i64 %203, 16
  %205 = or i64 %200, %204
  %206 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 3
  %207 = load i8, i8 addrspace(4)* %206, align 1, !tbaa !12
  %208 = zext i8 %207 to i64
  %209 = shl nuw nsw i64 %208, 24
  %210 = or i64 %205, %209
  %211 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 4
  %212 = load i8, i8 addrspace(4)* %211, align 1, !tbaa !12
  %213 = zext i8 %212 to i64
  %214 = shl nuw nsw i64 %213, 32
  %215 = or i64 %210, %214
  %216 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 5
  %217 = load i8, i8 addrspace(4)* %216, align 1, !tbaa !12
  %218 = zext i8 %217 to i64
  %219 = shl nuw nsw i64 %218, 40
  %220 = or i64 %215, %219
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 6
  %222 = load i8, i8 addrspace(4)* %221, align 1, !tbaa !12
  %223 = zext i8 %222 to i64
  %224 = shl nuw nsw i64 %223, 48
  %225 = or i64 %220, %224
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 7
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !12
  %228 = zext i8 %227 to i64
  %229 = shl nuw i64 %228, 56
  %230 = or i64 %225, %229
  %231 = add nsw i32 %188, -8
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 8
  br label %246

233:                                              ; preds = %191, %233
  %234 = phi i32 [ %244, %233 ], [ 0, %191 ]
  %235 = phi i64 [ %243, %233 ], [ 0, %191 ]
  %236 = zext i32 %234 to i64
  %237 = getelementptr inbounds i8, i8 addrspace(4)* %187, i64 %236
  %238 = load i8, i8 addrspace(4)* %237, align 1, !tbaa !12
  %239 = zext i8 %238 to i64
  %240 = shl i32 %234, 3
  %241 = zext i32 %240 to i64
  %242 = shl nuw i64 %239, %241
  %243 = or i64 %242, %235
  %244 = add nuw nsw i32 %234, 1
  %245 = icmp eq i32 %244, %188
  br i1 %245, label %246, label %233

246:                                              ; preds = %233, %193, %191
  %247 = phi i8 addrspace(4)* [ %232, %193 ], [ %187, %191 ], [ %187, %233 ]
  %248 = phi i32 [ %231, %193 ], [ 0, %191 ], [ 0, %233 ]
  %249 = phi i64 [ %230, %193 ], [ 0, %191 ], [ %243, %233 ]
  %250 = icmp ugt i32 %248, 7
  br i1 %250, label %253, label %251

251:                                              ; preds = %246
  %252 = icmp eq i32 %248, 0
  br i1 %252, label %306, label %293

253:                                              ; preds = %246
  %254 = load i8, i8 addrspace(4)* %247, align 1, !tbaa !12
  %255 = zext i8 %254 to i64
  %256 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 1
  %257 = load i8, i8 addrspace(4)* %256, align 1, !tbaa !12
  %258 = zext i8 %257 to i64
  %259 = shl nuw nsw i64 %258, 8
  %260 = or i64 %259, %255
  %261 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 2
  %262 = load i8, i8 addrspace(4)* %261, align 1, !tbaa !12
  %263 = zext i8 %262 to i64
  %264 = shl nuw nsw i64 %263, 16
  %265 = or i64 %260, %264
  %266 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 3
  %267 = load i8, i8 addrspace(4)* %266, align 1, !tbaa !12
  %268 = zext i8 %267 to i64
  %269 = shl nuw nsw i64 %268, 24
  %270 = or i64 %265, %269
  %271 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 4
  %272 = load i8, i8 addrspace(4)* %271, align 1, !tbaa !12
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 32
  %275 = or i64 %270, %274
  %276 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 5
  %277 = load i8, i8 addrspace(4)* %276, align 1, !tbaa !12
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 40
  %280 = or i64 %275, %279
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 6
  %282 = load i8, i8 addrspace(4)* %281, align 1, !tbaa !12
  %283 = zext i8 %282 to i64
  %284 = shl nuw nsw i64 %283, 48
  %285 = or i64 %280, %284
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 7
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !12
  %288 = zext i8 %287 to i64
  %289 = shl nuw i64 %288, 56
  %290 = or i64 %285, %289
  %291 = add nsw i32 %248, -8
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 8
  br label %306

293:                                              ; preds = %251, %293
  %294 = phi i32 [ %304, %293 ], [ 0, %251 ]
  %295 = phi i64 [ %303, %293 ], [ 0, %251 ]
  %296 = zext i32 %294 to i64
  %297 = getelementptr inbounds i8, i8 addrspace(4)* %247, i64 %296
  %298 = load i8, i8 addrspace(4)* %297, align 1, !tbaa !12
  %299 = zext i8 %298 to i64
  %300 = shl i32 %294, 3
  %301 = zext i32 %300 to i64
  %302 = shl nuw i64 %299, %301
  %303 = or i64 %302, %295
  %304 = add nuw nsw i32 %294, 1
  %305 = icmp eq i32 %304, %248
  br i1 %305, label %306, label %293

306:                                              ; preds = %293, %253, %251
  %307 = phi i8 addrspace(4)* [ %292, %253 ], [ %247, %251 ], [ %247, %293 ]
  %308 = phi i32 [ %291, %253 ], [ 0, %251 ], [ 0, %293 ]
  %309 = phi i64 [ %290, %253 ], [ 0, %251 ], [ %303, %293 ]
  %310 = icmp ugt i32 %308, 7
  br i1 %310, label %313, label %311

311:                                              ; preds = %306
  %312 = icmp eq i32 %308, 0
  br i1 %312, label %366, label %353

313:                                              ; preds = %306
  %314 = load i8, i8 addrspace(4)* %307, align 1, !tbaa !12
  %315 = zext i8 %314 to i64
  %316 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 1
  %317 = load i8, i8 addrspace(4)* %316, align 1, !tbaa !12
  %318 = zext i8 %317 to i64
  %319 = shl nuw nsw i64 %318, 8
  %320 = or i64 %319, %315
  %321 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 2
  %322 = load i8, i8 addrspace(4)* %321, align 1, !tbaa !12
  %323 = zext i8 %322 to i64
  %324 = shl nuw nsw i64 %323, 16
  %325 = or i64 %320, %324
  %326 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 3
  %327 = load i8, i8 addrspace(4)* %326, align 1, !tbaa !12
  %328 = zext i8 %327 to i64
  %329 = shl nuw nsw i64 %328, 24
  %330 = or i64 %325, %329
  %331 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 4
  %332 = load i8, i8 addrspace(4)* %331, align 1, !tbaa !12
  %333 = zext i8 %332 to i64
  %334 = shl nuw nsw i64 %333, 32
  %335 = or i64 %330, %334
  %336 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 5
  %337 = load i8, i8 addrspace(4)* %336, align 1, !tbaa !12
  %338 = zext i8 %337 to i64
  %339 = shl nuw nsw i64 %338, 40
  %340 = or i64 %335, %339
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 6
  %342 = load i8, i8 addrspace(4)* %341, align 1, !tbaa !12
  %343 = zext i8 %342 to i64
  %344 = shl nuw nsw i64 %343, 48
  %345 = or i64 %340, %344
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 7
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !12
  %348 = zext i8 %347 to i64
  %349 = shl nuw i64 %348, 56
  %350 = or i64 %345, %349
  %351 = add nsw i32 %308, -8
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 8
  br label %366

353:                                              ; preds = %311, %353
  %354 = phi i32 [ %364, %353 ], [ 0, %311 ]
  %355 = phi i64 [ %363, %353 ], [ 0, %311 ]
  %356 = zext i32 %354 to i64
  %357 = getelementptr inbounds i8, i8 addrspace(4)* %307, i64 %356
  %358 = load i8, i8 addrspace(4)* %357, align 1, !tbaa !12
  %359 = zext i8 %358 to i64
  %360 = shl i32 %354, 3
  %361 = zext i32 %360 to i64
  %362 = shl nuw i64 %359, %361
  %363 = or i64 %362, %355
  %364 = add nuw nsw i32 %354, 1
  %365 = icmp eq i32 %364, %308
  br i1 %365, label %366, label %353

366:                                              ; preds = %353, %313, %311
  %367 = phi i8 addrspace(4)* [ %352, %313 ], [ %307, %311 ], [ %307, %353 ]
  %368 = phi i32 [ %351, %313 ], [ 0, %311 ], [ 0, %353 ]
  %369 = phi i64 [ %350, %313 ], [ 0, %311 ], [ %363, %353 ]
  %370 = icmp ugt i32 %368, 7
  br i1 %370, label %373, label %371

371:                                              ; preds = %366
  %372 = icmp eq i32 %368, 0
  br i1 %372, label %426, label %413

373:                                              ; preds = %366
  %374 = load i8, i8 addrspace(4)* %367, align 1, !tbaa !12
  %375 = zext i8 %374 to i64
  %376 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 1
  %377 = load i8, i8 addrspace(4)* %376, align 1, !tbaa !12
  %378 = zext i8 %377 to i64
  %379 = shl nuw nsw i64 %378, 8
  %380 = or i64 %379, %375
  %381 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 2
  %382 = load i8, i8 addrspace(4)* %381, align 1, !tbaa !12
  %383 = zext i8 %382 to i64
  %384 = shl nuw nsw i64 %383, 16
  %385 = or i64 %380, %384
  %386 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 3
  %387 = load i8, i8 addrspace(4)* %386, align 1, !tbaa !12
  %388 = zext i8 %387 to i64
  %389 = shl nuw nsw i64 %388, 24
  %390 = or i64 %385, %389
  %391 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 4
  %392 = load i8, i8 addrspace(4)* %391, align 1, !tbaa !12
  %393 = zext i8 %392 to i64
  %394 = shl nuw nsw i64 %393, 32
  %395 = or i64 %390, %394
  %396 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 5
  %397 = load i8, i8 addrspace(4)* %396, align 1, !tbaa !12
  %398 = zext i8 %397 to i64
  %399 = shl nuw nsw i64 %398, 40
  %400 = or i64 %395, %399
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 6
  %402 = load i8, i8 addrspace(4)* %401, align 1, !tbaa !12
  %403 = zext i8 %402 to i64
  %404 = shl nuw nsw i64 %403, 48
  %405 = or i64 %400, %404
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 7
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !12
  %408 = zext i8 %407 to i64
  %409 = shl nuw i64 %408, 56
  %410 = or i64 %405, %409
  %411 = add nsw i32 %368, -8
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 8
  br label %426

413:                                              ; preds = %371, %413
  %414 = phi i32 [ %424, %413 ], [ 0, %371 ]
  %415 = phi i64 [ %423, %413 ], [ 0, %371 ]
  %416 = zext i32 %414 to i64
  %417 = getelementptr inbounds i8, i8 addrspace(4)* %367, i64 %416
  %418 = load i8, i8 addrspace(4)* %417, align 1, !tbaa !12
  %419 = zext i8 %418 to i64
  %420 = shl i32 %414, 3
  %421 = zext i32 %420 to i64
  %422 = shl nuw i64 %419, %421
  %423 = or i64 %422, %415
  %424 = add nuw nsw i32 %414, 1
  %425 = icmp eq i32 %424, %368
  br i1 %425, label %426, label %413

426:                                              ; preds = %413, %373, %371
  %427 = phi i8 addrspace(4)* [ %412, %373 ], [ %367, %371 ], [ %367, %413 ]
  %428 = phi i32 [ %411, %373 ], [ 0, %371 ], [ 0, %413 ]
  %429 = phi i64 [ %410, %373 ], [ 0, %371 ], [ %423, %413 ]
  %430 = icmp ugt i32 %428, 7
  br i1 %430, label %433, label %431

431:                                              ; preds = %426
  %432 = icmp eq i32 %428, 0
  br i1 %432, label %484, label %471

433:                                              ; preds = %426
  %434 = load i8, i8 addrspace(4)* %427, align 1, !tbaa !12
  %435 = zext i8 %434 to i64
  %436 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 1
  %437 = load i8, i8 addrspace(4)* %436, align 1, !tbaa !12
  %438 = zext i8 %437 to i64
  %439 = shl nuw nsw i64 %438, 8
  %440 = or i64 %439, %435
  %441 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 2
  %442 = load i8, i8 addrspace(4)* %441, align 1, !tbaa !12
  %443 = zext i8 %442 to i64
  %444 = shl nuw nsw i64 %443, 16
  %445 = or i64 %440, %444
  %446 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 3
  %447 = load i8, i8 addrspace(4)* %446, align 1, !tbaa !12
  %448 = zext i8 %447 to i64
  %449 = shl nuw nsw i64 %448, 24
  %450 = or i64 %445, %449
  %451 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 4
  %452 = load i8, i8 addrspace(4)* %451, align 1, !tbaa !12
  %453 = zext i8 %452 to i64
  %454 = shl nuw nsw i64 %453, 32
  %455 = or i64 %450, %454
  %456 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 5
  %457 = load i8, i8 addrspace(4)* %456, align 1, !tbaa !12
  %458 = zext i8 %457 to i64
  %459 = shl nuw nsw i64 %458, 40
  %460 = or i64 %455, %459
  %461 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 6
  %462 = load i8, i8 addrspace(4)* %461, align 1, !tbaa !12
  %463 = zext i8 %462 to i64
  %464 = shl nuw nsw i64 %463, 48
  %465 = or i64 %460, %464
  %466 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 7
  %467 = load i8, i8 addrspace(4)* %466, align 1, !tbaa !12
  %468 = zext i8 %467 to i64
  %469 = shl nuw i64 %468, 56
  %470 = or i64 %465, %469
  br label %484

471:                                              ; preds = %431, %471
  %472 = phi i32 [ %482, %471 ], [ 0, %431 ]
  %473 = phi i64 [ %481, %471 ], [ 0, %431 ]
  %474 = zext i32 %472 to i64
  %475 = getelementptr inbounds i8, i8 addrspace(4)* %427, i64 %474
  %476 = load i8, i8 addrspace(4)* %475, align 1, !tbaa !12
  %477 = zext i8 %476 to i64
  %478 = shl i32 %472, 3
  %479 = zext i32 %478 to i64
  %480 = shl nuw i64 %477, %479
  %481 = or i64 %480, %473
  %482 = add nuw nsw i32 %472, 1
  %483 = icmp eq i32 %482, %428
  br i1 %483, label %484, label %471

484:                                              ; preds = %471, %433, %431
  %485 = phi i64 [ %470, %433 ], [ 0, %431 ], [ %481, %471 ]
  %486 = shl nuw nsw i64 %67, 2
  %487 = add nuw nsw i64 %486, 28
  %488 = and i64 %487, 480
  %489 = and i64 %69, -225
  %490 = or i64 %489, %488
  %491 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %490, i64 noundef %129, i64 noundef %189, i64 noundef %249, i64 noundef %309, i64 noundef %369, i64 noundef %429, i64 noundef %485) #10
  %492 = sub i64 %59, %67
  %493 = getelementptr inbounds i8, i8 addrspace(4)* %60, i64 %67
  %494 = icmp eq i64 %492, 0
  br i1 %494, label %495, label %58

495:                                              ; preds = %484, %50
  %496 = phi <2 x i64> [ %53, %50 ], [ %491, %484 ]
  %497 = extractelement <2 x i64> %496, i64 0
  %498 = and i64 %497, -227
  %499 = or i64 %498, 34
  %500 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %32, i64 noundef %499, i64 noundef %47, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %501 = add nuw nsw i32 %42, 1
  %502 = icmp eq i32 %501, %1
  br i1 %502, label %37, label %41, !llvm.loop !15

503:                                              ; preds = %37
  %504 = and i64 %40, -227
  %505 = or i64 %504, 34
  %506 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %38, i64 noundef %505, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %947

507:                                              ; preds = %37
  %508 = and i64 %40, -3
  %509 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %508, i64 0
  br label %510

510:                                              ; preds = %936, %507
  %511 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 1) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([2 x i8]* addrspacecast ([2 x i8] addrspace(4)* @.str.1 to [2 x i8]*) to i64)), i64 1))), %507 ], [ %944, %936 ]
  %512 = phi i8 addrspace(4)* [ getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %507 ], [ %945, %936 ]
  %513 = phi <2 x i64> [ %509, %507 ], [ %943, %936 ]
  %514 = icmp ugt i64 %511, 56
  %515 = extractelement <2 x i64> %513, i64 0
  %516 = or i64 %515, 2
  %517 = insertelement <2 x i64> poison, i64 %516, i64 0
  %518 = select i1 %514, <2 x i64> %513, <2 x i64> %517
  %519 = tail call i64 @llvm.umin.i64(i64 %511, i64 56)
  %520 = trunc i64 %519 to i32
  %521 = extractelement <2 x i64> %518, i64 0
  %522 = icmp ugt i32 %520, 7
  br i1 %522, label %525, label %523

523:                                              ; preds = %510
  %524 = icmp eq i32 %520, 0
  br i1 %524, label %578, label %565

525:                                              ; preds = %510
  %526 = load i8, i8 addrspace(4)* %512, align 1, !tbaa !12
  %527 = zext i8 %526 to i64
  %528 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 1
  %529 = load i8, i8 addrspace(4)* %528, align 1, !tbaa !12
  %530 = zext i8 %529 to i64
  %531 = shl nuw nsw i64 %530, 8
  %532 = or i64 %531, %527
  %533 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 2
  %534 = load i8, i8 addrspace(4)* %533, align 1, !tbaa !12
  %535 = zext i8 %534 to i64
  %536 = shl nuw nsw i64 %535, 16
  %537 = or i64 %532, %536
  %538 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 3
  %539 = load i8, i8 addrspace(4)* %538, align 1, !tbaa !12
  %540 = zext i8 %539 to i64
  %541 = shl nuw nsw i64 %540, 24
  %542 = or i64 %537, %541
  %543 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 4
  %544 = load i8, i8 addrspace(4)* %543, align 1, !tbaa !12
  %545 = zext i8 %544 to i64
  %546 = shl nuw nsw i64 %545, 32
  %547 = or i64 %542, %546
  %548 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 5
  %549 = load i8, i8 addrspace(4)* %548, align 1, !tbaa !12
  %550 = zext i8 %549 to i64
  %551 = shl nuw nsw i64 %550, 40
  %552 = or i64 %547, %551
  %553 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 6
  %554 = load i8, i8 addrspace(4)* %553, align 1, !tbaa !12
  %555 = zext i8 %554 to i64
  %556 = shl nuw nsw i64 %555, 48
  %557 = or i64 %552, %556
  %558 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 7
  %559 = load i8, i8 addrspace(4)* %558, align 1, !tbaa !12
  %560 = zext i8 %559 to i64
  %561 = shl nuw i64 %560, 56
  %562 = or i64 %557, %561
  %563 = add nsw i32 %520, -8
  %564 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 8
  br label %578

565:                                              ; preds = %523, %565
  %566 = phi i32 [ %576, %565 ], [ 0, %523 ]
  %567 = phi i64 [ %575, %565 ], [ 0, %523 ]
  %568 = zext i32 %566 to i64
  %569 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 %568
  %570 = load i8, i8 addrspace(4)* %569, align 1, !tbaa !12
  %571 = zext i8 %570 to i64
  %572 = shl i32 %566, 3
  %573 = zext i32 %572 to i64
  %574 = shl nuw i64 %571, %573
  %575 = or i64 %574, %567
  %576 = add nuw nsw i32 %566, 1
  %577 = icmp eq i32 %576, %520
  br i1 %577, label %578, label %565, !llvm.loop !13

578:                                              ; preds = %565, %525, %523
  %579 = phi i8 addrspace(4)* [ %564, %525 ], [ %512, %523 ], [ %512, %565 ]
  %580 = phi i32 [ %563, %525 ], [ 0, %523 ], [ 0, %565 ]
  %581 = phi i64 [ %562, %525 ], [ 0, %523 ], [ %575, %565 ]
  %582 = icmp ugt i32 %580, 7
  br i1 %582, label %585, label %583

583:                                              ; preds = %578
  %584 = icmp eq i32 %580, 0
  br i1 %584, label %638, label %625

585:                                              ; preds = %578
  %586 = load i8, i8 addrspace(4)* %579, align 1, !tbaa !12
  %587 = zext i8 %586 to i64
  %588 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 1
  %589 = load i8, i8 addrspace(4)* %588, align 1, !tbaa !12
  %590 = zext i8 %589 to i64
  %591 = shl nuw nsw i64 %590, 8
  %592 = or i64 %591, %587
  %593 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 2
  %594 = load i8, i8 addrspace(4)* %593, align 1, !tbaa !12
  %595 = zext i8 %594 to i64
  %596 = shl nuw nsw i64 %595, 16
  %597 = or i64 %592, %596
  %598 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 3
  %599 = load i8, i8 addrspace(4)* %598, align 1, !tbaa !12
  %600 = zext i8 %599 to i64
  %601 = shl nuw nsw i64 %600, 24
  %602 = or i64 %597, %601
  %603 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 4
  %604 = load i8, i8 addrspace(4)* %603, align 1, !tbaa !12
  %605 = zext i8 %604 to i64
  %606 = shl nuw nsw i64 %605, 32
  %607 = or i64 %602, %606
  %608 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 5
  %609 = load i8, i8 addrspace(4)* %608, align 1, !tbaa !12
  %610 = zext i8 %609 to i64
  %611 = shl nuw nsw i64 %610, 40
  %612 = or i64 %607, %611
  %613 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 6
  %614 = load i8, i8 addrspace(4)* %613, align 1, !tbaa !12
  %615 = zext i8 %614 to i64
  %616 = shl nuw nsw i64 %615, 48
  %617 = or i64 %612, %616
  %618 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 7
  %619 = load i8, i8 addrspace(4)* %618, align 1, !tbaa !12
  %620 = zext i8 %619 to i64
  %621 = shl nuw i64 %620, 56
  %622 = or i64 %617, %621
  %623 = add nsw i32 %580, -8
  %624 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 8
  br label %638

625:                                              ; preds = %583, %625
  %626 = phi i32 [ %636, %625 ], [ 0, %583 ]
  %627 = phi i64 [ %635, %625 ], [ 0, %583 ]
  %628 = zext i32 %626 to i64
  %629 = getelementptr inbounds i8, i8 addrspace(4)* %579, i64 %628
  %630 = load i8, i8 addrspace(4)* %629, align 1, !tbaa !12
  %631 = zext i8 %630 to i64
  %632 = shl i32 %626, 3
  %633 = zext i32 %632 to i64
  %634 = shl nuw i64 %631, %633
  %635 = or i64 %634, %627
  %636 = add nuw nsw i32 %626, 1
  %637 = icmp eq i32 %636, %580
  br i1 %637, label %638, label %625

638:                                              ; preds = %625, %585, %583
  %639 = phi i8 addrspace(4)* [ %624, %585 ], [ %579, %583 ], [ %579, %625 ]
  %640 = phi i32 [ %623, %585 ], [ 0, %583 ], [ 0, %625 ]
  %641 = phi i64 [ %622, %585 ], [ 0, %583 ], [ %635, %625 ]
  %642 = icmp ugt i32 %640, 7
  br i1 %642, label %645, label %643

643:                                              ; preds = %638
  %644 = icmp eq i32 %640, 0
  br i1 %644, label %698, label %685

645:                                              ; preds = %638
  %646 = load i8, i8 addrspace(4)* %639, align 1, !tbaa !12
  %647 = zext i8 %646 to i64
  %648 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 1
  %649 = load i8, i8 addrspace(4)* %648, align 1, !tbaa !12
  %650 = zext i8 %649 to i64
  %651 = shl nuw nsw i64 %650, 8
  %652 = or i64 %651, %647
  %653 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 2
  %654 = load i8, i8 addrspace(4)* %653, align 1, !tbaa !12
  %655 = zext i8 %654 to i64
  %656 = shl nuw nsw i64 %655, 16
  %657 = or i64 %652, %656
  %658 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 3
  %659 = load i8, i8 addrspace(4)* %658, align 1, !tbaa !12
  %660 = zext i8 %659 to i64
  %661 = shl nuw nsw i64 %660, 24
  %662 = or i64 %657, %661
  %663 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 4
  %664 = load i8, i8 addrspace(4)* %663, align 1, !tbaa !12
  %665 = zext i8 %664 to i64
  %666 = shl nuw nsw i64 %665, 32
  %667 = or i64 %662, %666
  %668 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 5
  %669 = load i8, i8 addrspace(4)* %668, align 1, !tbaa !12
  %670 = zext i8 %669 to i64
  %671 = shl nuw nsw i64 %670, 40
  %672 = or i64 %667, %671
  %673 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 6
  %674 = load i8, i8 addrspace(4)* %673, align 1, !tbaa !12
  %675 = zext i8 %674 to i64
  %676 = shl nuw nsw i64 %675, 48
  %677 = or i64 %672, %676
  %678 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 7
  %679 = load i8, i8 addrspace(4)* %678, align 1, !tbaa !12
  %680 = zext i8 %679 to i64
  %681 = shl nuw i64 %680, 56
  %682 = or i64 %677, %681
  %683 = add nsw i32 %640, -8
  %684 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 8
  br label %698

685:                                              ; preds = %643, %685
  %686 = phi i32 [ %696, %685 ], [ 0, %643 ]
  %687 = phi i64 [ %695, %685 ], [ 0, %643 ]
  %688 = zext i32 %686 to i64
  %689 = getelementptr inbounds i8, i8 addrspace(4)* %639, i64 %688
  %690 = load i8, i8 addrspace(4)* %689, align 1, !tbaa !12
  %691 = zext i8 %690 to i64
  %692 = shl i32 %686, 3
  %693 = zext i32 %692 to i64
  %694 = shl nuw i64 %691, %693
  %695 = or i64 %694, %687
  %696 = add nuw nsw i32 %686, 1
  %697 = icmp eq i32 %696, %640
  br i1 %697, label %698, label %685

698:                                              ; preds = %685, %645, %643
  %699 = phi i8 addrspace(4)* [ %684, %645 ], [ %639, %643 ], [ %639, %685 ]
  %700 = phi i32 [ %683, %645 ], [ 0, %643 ], [ 0, %685 ]
  %701 = phi i64 [ %682, %645 ], [ 0, %643 ], [ %695, %685 ]
  %702 = icmp ugt i32 %700, 7
  br i1 %702, label %705, label %703

703:                                              ; preds = %698
  %704 = icmp eq i32 %700, 0
  br i1 %704, label %758, label %745

705:                                              ; preds = %698
  %706 = load i8, i8 addrspace(4)* %699, align 1, !tbaa !12
  %707 = zext i8 %706 to i64
  %708 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 1
  %709 = load i8, i8 addrspace(4)* %708, align 1, !tbaa !12
  %710 = zext i8 %709 to i64
  %711 = shl nuw nsw i64 %710, 8
  %712 = or i64 %711, %707
  %713 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 2
  %714 = load i8, i8 addrspace(4)* %713, align 1, !tbaa !12
  %715 = zext i8 %714 to i64
  %716 = shl nuw nsw i64 %715, 16
  %717 = or i64 %712, %716
  %718 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 3
  %719 = load i8, i8 addrspace(4)* %718, align 1, !tbaa !12
  %720 = zext i8 %719 to i64
  %721 = shl nuw nsw i64 %720, 24
  %722 = or i64 %717, %721
  %723 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 4
  %724 = load i8, i8 addrspace(4)* %723, align 1, !tbaa !12
  %725 = zext i8 %724 to i64
  %726 = shl nuw nsw i64 %725, 32
  %727 = or i64 %722, %726
  %728 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 5
  %729 = load i8, i8 addrspace(4)* %728, align 1, !tbaa !12
  %730 = zext i8 %729 to i64
  %731 = shl nuw nsw i64 %730, 40
  %732 = or i64 %727, %731
  %733 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 6
  %734 = load i8, i8 addrspace(4)* %733, align 1, !tbaa !12
  %735 = zext i8 %734 to i64
  %736 = shl nuw nsw i64 %735, 48
  %737 = or i64 %732, %736
  %738 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 7
  %739 = load i8, i8 addrspace(4)* %738, align 1, !tbaa !12
  %740 = zext i8 %739 to i64
  %741 = shl nuw i64 %740, 56
  %742 = or i64 %737, %741
  %743 = add nsw i32 %700, -8
  %744 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 8
  br label %758

745:                                              ; preds = %703, %745
  %746 = phi i32 [ %756, %745 ], [ 0, %703 ]
  %747 = phi i64 [ %755, %745 ], [ 0, %703 ]
  %748 = zext i32 %746 to i64
  %749 = getelementptr inbounds i8, i8 addrspace(4)* %699, i64 %748
  %750 = load i8, i8 addrspace(4)* %749, align 1, !tbaa !12
  %751 = zext i8 %750 to i64
  %752 = shl i32 %746, 3
  %753 = zext i32 %752 to i64
  %754 = shl nuw i64 %751, %753
  %755 = or i64 %754, %747
  %756 = add nuw nsw i32 %746, 1
  %757 = icmp eq i32 %756, %700
  br i1 %757, label %758, label %745

758:                                              ; preds = %745, %705, %703
  %759 = phi i8 addrspace(4)* [ %744, %705 ], [ %699, %703 ], [ %699, %745 ]
  %760 = phi i32 [ %743, %705 ], [ 0, %703 ], [ 0, %745 ]
  %761 = phi i64 [ %742, %705 ], [ 0, %703 ], [ %755, %745 ]
  %762 = icmp ugt i32 %760, 7
  br i1 %762, label %765, label %763

763:                                              ; preds = %758
  %764 = icmp eq i32 %760, 0
  br i1 %764, label %818, label %805

765:                                              ; preds = %758
  %766 = load i8, i8 addrspace(4)* %759, align 1, !tbaa !12
  %767 = zext i8 %766 to i64
  %768 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 1
  %769 = load i8, i8 addrspace(4)* %768, align 1, !tbaa !12
  %770 = zext i8 %769 to i64
  %771 = shl nuw nsw i64 %770, 8
  %772 = or i64 %771, %767
  %773 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 2
  %774 = load i8, i8 addrspace(4)* %773, align 1, !tbaa !12
  %775 = zext i8 %774 to i64
  %776 = shl nuw nsw i64 %775, 16
  %777 = or i64 %772, %776
  %778 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 3
  %779 = load i8, i8 addrspace(4)* %778, align 1, !tbaa !12
  %780 = zext i8 %779 to i64
  %781 = shl nuw nsw i64 %780, 24
  %782 = or i64 %777, %781
  %783 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 4
  %784 = load i8, i8 addrspace(4)* %783, align 1, !tbaa !12
  %785 = zext i8 %784 to i64
  %786 = shl nuw nsw i64 %785, 32
  %787 = or i64 %782, %786
  %788 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 5
  %789 = load i8, i8 addrspace(4)* %788, align 1, !tbaa !12
  %790 = zext i8 %789 to i64
  %791 = shl nuw nsw i64 %790, 40
  %792 = or i64 %787, %791
  %793 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 6
  %794 = load i8, i8 addrspace(4)* %793, align 1, !tbaa !12
  %795 = zext i8 %794 to i64
  %796 = shl nuw nsw i64 %795, 48
  %797 = or i64 %792, %796
  %798 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 7
  %799 = load i8, i8 addrspace(4)* %798, align 1, !tbaa !12
  %800 = zext i8 %799 to i64
  %801 = shl nuw i64 %800, 56
  %802 = or i64 %797, %801
  %803 = add nsw i32 %760, -8
  %804 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 8
  br label %818

805:                                              ; preds = %763, %805
  %806 = phi i32 [ %816, %805 ], [ 0, %763 ]
  %807 = phi i64 [ %815, %805 ], [ 0, %763 ]
  %808 = zext i32 %806 to i64
  %809 = getelementptr inbounds i8, i8 addrspace(4)* %759, i64 %808
  %810 = load i8, i8 addrspace(4)* %809, align 1, !tbaa !12
  %811 = zext i8 %810 to i64
  %812 = shl i32 %806, 3
  %813 = zext i32 %812 to i64
  %814 = shl nuw i64 %811, %813
  %815 = or i64 %814, %807
  %816 = add nuw nsw i32 %806, 1
  %817 = icmp eq i32 %816, %760
  br i1 %817, label %818, label %805

818:                                              ; preds = %805, %765, %763
  %819 = phi i8 addrspace(4)* [ %804, %765 ], [ %759, %763 ], [ %759, %805 ]
  %820 = phi i32 [ %803, %765 ], [ 0, %763 ], [ 0, %805 ]
  %821 = phi i64 [ %802, %765 ], [ 0, %763 ], [ %815, %805 ]
  %822 = icmp ugt i32 %820, 7
  br i1 %822, label %825, label %823

823:                                              ; preds = %818
  %824 = icmp eq i32 %820, 0
  br i1 %824, label %878, label %865

825:                                              ; preds = %818
  %826 = load i8, i8 addrspace(4)* %819, align 1, !tbaa !12
  %827 = zext i8 %826 to i64
  %828 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 1
  %829 = load i8, i8 addrspace(4)* %828, align 1, !tbaa !12
  %830 = zext i8 %829 to i64
  %831 = shl nuw nsw i64 %830, 8
  %832 = or i64 %831, %827
  %833 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 2
  %834 = load i8, i8 addrspace(4)* %833, align 1, !tbaa !12
  %835 = zext i8 %834 to i64
  %836 = shl nuw nsw i64 %835, 16
  %837 = or i64 %832, %836
  %838 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 3
  %839 = load i8, i8 addrspace(4)* %838, align 1, !tbaa !12
  %840 = zext i8 %839 to i64
  %841 = shl nuw nsw i64 %840, 24
  %842 = or i64 %837, %841
  %843 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 4
  %844 = load i8, i8 addrspace(4)* %843, align 1, !tbaa !12
  %845 = zext i8 %844 to i64
  %846 = shl nuw nsw i64 %845, 32
  %847 = or i64 %842, %846
  %848 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 5
  %849 = load i8, i8 addrspace(4)* %848, align 1, !tbaa !12
  %850 = zext i8 %849 to i64
  %851 = shl nuw nsw i64 %850, 40
  %852 = or i64 %847, %851
  %853 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 6
  %854 = load i8, i8 addrspace(4)* %853, align 1, !tbaa !12
  %855 = zext i8 %854 to i64
  %856 = shl nuw nsw i64 %855, 48
  %857 = or i64 %852, %856
  %858 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 7
  %859 = load i8, i8 addrspace(4)* %858, align 1, !tbaa !12
  %860 = zext i8 %859 to i64
  %861 = shl nuw i64 %860, 56
  %862 = or i64 %857, %861
  %863 = add nsw i32 %820, -8
  %864 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 8
  br label %878

865:                                              ; preds = %823, %865
  %866 = phi i32 [ %876, %865 ], [ 0, %823 ]
  %867 = phi i64 [ %875, %865 ], [ 0, %823 ]
  %868 = zext i32 %866 to i64
  %869 = getelementptr inbounds i8, i8 addrspace(4)* %819, i64 %868
  %870 = load i8, i8 addrspace(4)* %869, align 1, !tbaa !12
  %871 = zext i8 %870 to i64
  %872 = shl i32 %866, 3
  %873 = zext i32 %872 to i64
  %874 = shl nuw i64 %871, %873
  %875 = or i64 %874, %867
  %876 = add nuw nsw i32 %866, 1
  %877 = icmp eq i32 %876, %820
  br i1 %877, label %878, label %865

878:                                              ; preds = %865, %825, %823
  %879 = phi i8 addrspace(4)* [ %864, %825 ], [ %819, %823 ], [ %819, %865 ]
  %880 = phi i32 [ %863, %825 ], [ 0, %823 ], [ 0, %865 ]
  %881 = phi i64 [ %862, %825 ], [ 0, %823 ], [ %875, %865 ]
  %882 = icmp ugt i32 %880, 7
  br i1 %882, label %885, label %883

883:                                              ; preds = %878
  %884 = icmp eq i32 %880, 0
  br i1 %884, label %936, label %923

885:                                              ; preds = %878
  %886 = load i8, i8 addrspace(4)* %879, align 1, !tbaa !12
  %887 = zext i8 %886 to i64
  %888 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 1
  %889 = load i8, i8 addrspace(4)* %888, align 1, !tbaa !12
  %890 = zext i8 %889 to i64
  %891 = shl nuw nsw i64 %890, 8
  %892 = or i64 %891, %887
  %893 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 2
  %894 = load i8, i8 addrspace(4)* %893, align 1, !tbaa !12
  %895 = zext i8 %894 to i64
  %896 = shl nuw nsw i64 %895, 16
  %897 = or i64 %892, %896
  %898 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 3
  %899 = load i8, i8 addrspace(4)* %898, align 1, !tbaa !12
  %900 = zext i8 %899 to i64
  %901 = shl nuw nsw i64 %900, 24
  %902 = or i64 %897, %901
  %903 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 4
  %904 = load i8, i8 addrspace(4)* %903, align 1, !tbaa !12
  %905 = zext i8 %904 to i64
  %906 = shl nuw nsw i64 %905, 32
  %907 = or i64 %902, %906
  %908 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 5
  %909 = load i8, i8 addrspace(4)* %908, align 1, !tbaa !12
  %910 = zext i8 %909 to i64
  %911 = shl nuw nsw i64 %910, 40
  %912 = or i64 %907, %911
  %913 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 6
  %914 = load i8, i8 addrspace(4)* %913, align 1, !tbaa !12
  %915 = zext i8 %914 to i64
  %916 = shl nuw nsw i64 %915, 48
  %917 = or i64 %912, %916
  %918 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 7
  %919 = load i8, i8 addrspace(4)* %918, align 1, !tbaa !12
  %920 = zext i8 %919 to i64
  %921 = shl nuw i64 %920, 56
  %922 = or i64 %917, %921
  br label %936

923:                                              ; preds = %883, %923
  %924 = phi i32 [ %934, %923 ], [ 0, %883 ]
  %925 = phi i64 [ %933, %923 ], [ 0, %883 ]
  %926 = zext i32 %924 to i64
  %927 = getelementptr inbounds i8, i8 addrspace(4)* %879, i64 %926
  %928 = load i8, i8 addrspace(4)* %927, align 1, !tbaa !12
  %929 = zext i8 %928 to i64
  %930 = shl i32 %924, 3
  %931 = zext i32 %930 to i64
  %932 = shl nuw i64 %929, %931
  %933 = or i64 %932, %925
  %934 = add nuw nsw i32 %924, 1
  %935 = icmp eq i32 %934, %880
  br i1 %935, label %936, label %923

936:                                              ; preds = %923, %885, %883
  %937 = phi i64 [ %922, %885 ], [ 0, %883 ], [ %933, %923 ]
  %938 = shl nuw nsw i64 %519, 2
  %939 = add nuw nsw i64 %938, 28
  %940 = and i64 %939, 480
  %941 = and i64 %521, -225
  %942 = or i64 %941, %940
  %943 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %38, i64 noundef %942, i64 noundef %581, i64 noundef %641, i64 noundef %701, i64 noundef %761, i64 noundef %821, i64 noundef %881, i64 noundef %937) #10
  %944 = sub i64 %511, %519
  %945 = getelementptr inbounds i8, i8 addrspace(4)* %512, i64 %519
  %946 = icmp eq i64 %944, 0
  br i1 %946, label %947, label %510

947:                                              ; preds = %936, %503
  %948 = add nuw nsw i32 %22, 1
  %949 = icmp eq i32 %948, %2
  br i1 %949, label %33, label %21, !llvm.loop !17

950:                                              ; preds = %33
  %951 = and i64 %36, -227
  %952 = or i64 %951, 34
  %953 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %952, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1394

954:                                              ; preds = %33
  %955 = and i64 %36, -3
  %956 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %955, i64 0
  br label %957

957:                                              ; preds = %1383, %954
  %958 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 1) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([2 x i8]* addrspacecast ([2 x i8] addrspace(4)* @.str.1 to [2 x i8]*) to i64)), i64 1))), %954 ], [ %1391, %1383 ]
  %959 = phi i8 addrspace(4)* [ getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %954 ], [ %1392, %1383 ]
  %960 = phi <2 x i64> [ %956, %954 ], [ %1390, %1383 ]
  %961 = icmp ugt i64 %958, 56
  %962 = extractelement <2 x i64> %960, i64 0
  %963 = or i64 %962, 2
  %964 = insertelement <2 x i64> poison, i64 %963, i64 0
  %965 = select i1 %961, <2 x i64> %960, <2 x i64> %964
  %966 = tail call i64 @llvm.umin.i64(i64 %958, i64 56)
  %967 = trunc i64 %966 to i32
  %968 = extractelement <2 x i64> %965, i64 0
  %969 = icmp ugt i32 %967, 7
  br i1 %969, label %972, label %970

970:                                              ; preds = %957
  %971 = icmp eq i32 %967, 0
  br i1 %971, label %1025, label %1012

972:                                              ; preds = %957
  %973 = load i8, i8 addrspace(4)* %959, align 1, !tbaa !12
  %974 = zext i8 %973 to i64
  %975 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 1
  %976 = load i8, i8 addrspace(4)* %975, align 1, !tbaa !12
  %977 = zext i8 %976 to i64
  %978 = shl nuw nsw i64 %977, 8
  %979 = or i64 %978, %974
  %980 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 2
  %981 = load i8, i8 addrspace(4)* %980, align 1, !tbaa !12
  %982 = zext i8 %981 to i64
  %983 = shl nuw nsw i64 %982, 16
  %984 = or i64 %979, %983
  %985 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 3
  %986 = load i8, i8 addrspace(4)* %985, align 1, !tbaa !12
  %987 = zext i8 %986 to i64
  %988 = shl nuw nsw i64 %987, 24
  %989 = or i64 %984, %988
  %990 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 4
  %991 = load i8, i8 addrspace(4)* %990, align 1, !tbaa !12
  %992 = zext i8 %991 to i64
  %993 = shl nuw nsw i64 %992, 32
  %994 = or i64 %989, %993
  %995 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 5
  %996 = load i8, i8 addrspace(4)* %995, align 1, !tbaa !12
  %997 = zext i8 %996 to i64
  %998 = shl nuw nsw i64 %997, 40
  %999 = or i64 %994, %998
  %1000 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 6
  %1001 = load i8, i8 addrspace(4)* %1000, align 1, !tbaa !12
  %1002 = zext i8 %1001 to i64
  %1003 = shl nuw nsw i64 %1002, 48
  %1004 = or i64 %999, %1003
  %1005 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 7
  %1006 = load i8, i8 addrspace(4)* %1005, align 1, !tbaa !12
  %1007 = zext i8 %1006 to i64
  %1008 = shl nuw i64 %1007, 56
  %1009 = or i64 %1004, %1008
  %1010 = add nsw i32 %967, -8
  %1011 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 8
  br label %1025

1012:                                             ; preds = %970, %1012
  %1013 = phi i32 [ %1023, %1012 ], [ 0, %970 ]
  %1014 = phi i64 [ %1022, %1012 ], [ 0, %970 ]
  %1015 = zext i32 %1013 to i64
  %1016 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 %1015
  %1017 = load i8, i8 addrspace(4)* %1016, align 1, !tbaa !12
  %1018 = zext i8 %1017 to i64
  %1019 = shl i32 %1013, 3
  %1020 = zext i32 %1019 to i64
  %1021 = shl nuw i64 %1018, %1020
  %1022 = or i64 %1021, %1014
  %1023 = add nuw nsw i32 %1013, 1
  %1024 = icmp eq i32 %1023, %967
  br i1 %1024, label %1025, label %1012, !llvm.loop !13

1025:                                             ; preds = %1012, %972, %970
  %1026 = phi i8 addrspace(4)* [ %1011, %972 ], [ %959, %970 ], [ %959, %1012 ]
  %1027 = phi i32 [ %1010, %972 ], [ 0, %970 ], [ 0, %1012 ]
  %1028 = phi i64 [ %1009, %972 ], [ 0, %970 ], [ %1022, %1012 ]
  %1029 = icmp ugt i32 %1027, 7
  br i1 %1029, label %1032, label %1030

1030:                                             ; preds = %1025
  %1031 = icmp eq i32 %1027, 0
  br i1 %1031, label %1085, label %1072

1032:                                             ; preds = %1025
  %1033 = load i8, i8 addrspace(4)* %1026, align 1, !tbaa !12
  %1034 = zext i8 %1033 to i64
  %1035 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 1
  %1036 = load i8, i8 addrspace(4)* %1035, align 1, !tbaa !12
  %1037 = zext i8 %1036 to i64
  %1038 = shl nuw nsw i64 %1037, 8
  %1039 = or i64 %1038, %1034
  %1040 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 2
  %1041 = load i8, i8 addrspace(4)* %1040, align 1, !tbaa !12
  %1042 = zext i8 %1041 to i64
  %1043 = shl nuw nsw i64 %1042, 16
  %1044 = or i64 %1039, %1043
  %1045 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 3
  %1046 = load i8, i8 addrspace(4)* %1045, align 1, !tbaa !12
  %1047 = zext i8 %1046 to i64
  %1048 = shl nuw nsw i64 %1047, 24
  %1049 = or i64 %1044, %1048
  %1050 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 4
  %1051 = load i8, i8 addrspace(4)* %1050, align 1, !tbaa !12
  %1052 = zext i8 %1051 to i64
  %1053 = shl nuw nsw i64 %1052, 32
  %1054 = or i64 %1049, %1053
  %1055 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 5
  %1056 = load i8, i8 addrspace(4)* %1055, align 1, !tbaa !12
  %1057 = zext i8 %1056 to i64
  %1058 = shl nuw nsw i64 %1057, 40
  %1059 = or i64 %1054, %1058
  %1060 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 6
  %1061 = load i8, i8 addrspace(4)* %1060, align 1, !tbaa !12
  %1062 = zext i8 %1061 to i64
  %1063 = shl nuw nsw i64 %1062, 48
  %1064 = or i64 %1059, %1063
  %1065 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 7
  %1066 = load i8, i8 addrspace(4)* %1065, align 1, !tbaa !12
  %1067 = zext i8 %1066 to i64
  %1068 = shl nuw i64 %1067, 56
  %1069 = or i64 %1064, %1068
  %1070 = add nsw i32 %1027, -8
  %1071 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 8
  br label %1085

1072:                                             ; preds = %1030, %1072
  %1073 = phi i32 [ %1083, %1072 ], [ 0, %1030 ]
  %1074 = phi i64 [ %1082, %1072 ], [ 0, %1030 ]
  %1075 = zext i32 %1073 to i64
  %1076 = getelementptr inbounds i8, i8 addrspace(4)* %1026, i64 %1075
  %1077 = load i8, i8 addrspace(4)* %1076, align 1, !tbaa !12
  %1078 = zext i8 %1077 to i64
  %1079 = shl i32 %1073, 3
  %1080 = zext i32 %1079 to i64
  %1081 = shl nuw i64 %1078, %1080
  %1082 = or i64 %1081, %1074
  %1083 = add nuw nsw i32 %1073, 1
  %1084 = icmp eq i32 %1083, %1027
  br i1 %1084, label %1085, label %1072

1085:                                             ; preds = %1072, %1032, %1030
  %1086 = phi i8 addrspace(4)* [ %1071, %1032 ], [ %1026, %1030 ], [ %1026, %1072 ]
  %1087 = phi i32 [ %1070, %1032 ], [ 0, %1030 ], [ 0, %1072 ]
  %1088 = phi i64 [ %1069, %1032 ], [ 0, %1030 ], [ %1082, %1072 ]
  %1089 = icmp ugt i32 %1087, 7
  br i1 %1089, label %1092, label %1090

1090:                                             ; preds = %1085
  %1091 = icmp eq i32 %1087, 0
  br i1 %1091, label %1145, label %1132

1092:                                             ; preds = %1085
  %1093 = load i8, i8 addrspace(4)* %1086, align 1, !tbaa !12
  %1094 = zext i8 %1093 to i64
  %1095 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 1
  %1096 = load i8, i8 addrspace(4)* %1095, align 1, !tbaa !12
  %1097 = zext i8 %1096 to i64
  %1098 = shl nuw nsw i64 %1097, 8
  %1099 = or i64 %1098, %1094
  %1100 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 2
  %1101 = load i8, i8 addrspace(4)* %1100, align 1, !tbaa !12
  %1102 = zext i8 %1101 to i64
  %1103 = shl nuw nsw i64 %1102, 16
  %1104 = or i64 %1099, %1103
  %1105 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 3
  %1106 = load i8, i8 addrspace(4)* %1105, align 1, !tbaa !12
  %1107 = zext i8 %1106 to i64
  %1108 = shl nuw nsw i64 %1107, 24
  %1109 = or i64 %1104, %1108
  %1110 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 4
  %1111 = load i8, i8 addrspace(4)* %1110, align 1, !tbaa !12
  %1112 = zext i8 %1111 to i64
  %1113 = shl nuw nsw i64 %1112, 32
  %1114 = or i64 %1109, %1113
  %1115 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 5
  %1116 = load i8, i8 addrspace(4)* %1115, align 1, !tbaa !12
  %1117 = zext i8 %1116 to i64
  %1118 = shl nuw nsw i64 %1117, 40
  %1119 = or i64 %1114, %1118
  %1120 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 6
  %1121 = load i8, i8 addrspace(4)* %1120, align 1, !tbaa !12
  %1122 = zext i8 %1121 to i64
  %1123 = shl nuw nsw i64 %1122, 48
  %1124 = or i64 %1119, %1123
  %1125 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 7
  %1126 = load i8, i8 addrspace(4)* %1125, align 1, !tbaa !12
  %1127 = zext i8 %1126 to i64
  %1128 = shl nuw i64 %1127, 56
  %1129 = or i64 %1124, %1128
  %1130 = add nsw i32 %1087, -8
  %1131 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 8
  br label %1145

1132:                                             ; preds = %1090, %1132
  %1133 = phi i32 [ %1143, %1132 ], [ 0, %1090 ]
  %1134 = phi i64 [ %1142, %1132 ], [ 0, %1090 ]
  %1135 = zext i32 %1133 to i64
  %1136 = getelementptr inbounds i8, i8 addrspace(4)* %1086, i64 %1135
  %1137 = load i8, i8 addrspace(4)* %1136, align 1, !tbaa !12
  %1138 = zext i8 %1137 to i64
  %1139 = shl i32 %1133, 3
  %1140 = zext i32 %1139 to i64
  %1141 = shl nuw i64 %1138, %1140
  %1142 = or i64 %1141, %1134
  %1143 = add nuw nsw i32 %1133, 1
  %1144 = icmp eq i32 %1143, %1087
  br i1 %1144, label %1145, label %1132

1145:                                             ; preds = %1132, %1092, %1090
  %1146 = phi i8 addrspace(4)* [ %1131, %1092 ], [ %1086, %1090 ], [ %1086, %1132 ]
  %1147 = phi i32 [ %1130, %1092 ], [ 0, %1090 ], [ 0, %1132 ]
  %1148 = phi i64 [ %1129, %1092 ], [ 0, %1090 ], [ %1142, %1132 ]
  %1149 = icmp ugt i32 %1147, 7
  br i1 %1149, label %1152, label %1150

1150:                                             ; preds = %1145
  %1151 = icmp eq i32 %1147, 0
  br i1 %1151, label %1205, label %1192

1152:                                             ; preds = %1145
  %1153 = load i8, i8 addrspace(4)* %1146, align 1, !tbaa !12
  %1154 = zext i8 %1153 to i64
  %1155 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 1
  %1156 = load i8, i8 addrspace(4)* %1155, align 1, !tbaa !12
  %1157 = zext i8 %1156 to i64
  %1158 = shl nuw nsw i64 %1157, 8
  %1159 = or i64 %1158, %1154
  %1160 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 2
  %1161 = load i8, i8 addrspace(4)* %1160, align 1, !tbaa !12
  %1162 = zext i8 %1161 to i64
  %1163 = shl nuw nsw i64 %1162, 16
  %1164 = or i64 %1159, %1163
  %1165 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 3
  %1166 = load i8, i8 addrspace(4)* %1165, align 1, !tbaa !12
  %1167 = zext i8 %1166 to i64
  %1168 = shl nuw nsw i64 %1167, 24
  %1169 = or i64 %1164, %1168
  %1170 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 4
  %1171 = load i8, i8 addrspace(4)* %1170, align 1, !tbaa !12
  %1172 = zext i8 %1171 to i64
  %1173 = shl nuw nsw i64 %1172, 32
  %1174 = or i64 %1169, %1173
  %1175 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 5
  %1176 = load i8, i8 addrspace(4)* %1175, align 1, !tbaa !12
  %1177 = zext i8 %1176 to i64
  %1178 = shl nuw nsw i64 %1177, 40
  %1179 = or i64 %1174, %1178
  %1180 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 6
  %1181 = load i8, i8 addrspace(4)* %1180, align 1, !tbaa !12
  %1182 = zext i8 %1181 to i64
  %1183 = shl nuw nsw i64 %1182, 48
  %1184 = or i64 %1179, %1183
  %1185 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 7
  %1186 = load i8, i8 addrspace(4)* %1185, align 1, !tbaa !12
  %1187 = zext i8 %1186 to i64
  %1188 = shl nuw i64 %1187, 56
  %1189 = or i64 %1184, %1188
  %1190 = add nsw i32 %1147, -8
  %1191 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 8
  br label %1205

1192:                                             ; preds = %1150, %1192
  %1193 = phi i32 [ %1203, %1192 ], [ 0, %1150 ]
  %1194 = phi i64 [ %1202, %1192 ], [ 0, %1150 ]
  %1195 = zext i32 %1193 to i64
  %1196 = getelementptr inbounds i8, i8 addrspace(4)* %1146, i64 %1195
  %1197 = load i8, i8 addrspace(4)* %1196, align 1, !tbaa !12
  %1198 = zext i8 %1197 to i64
  %1199 = shl i32 %1193, 3
  %1200 = zext i32 %1199 to i64
  %1201 = shl nuw i64 %1198, %1200
  %1202 = or i64 %1201, %1194
  %1203 = add nuw nsw i32 %1193, 1
  %1204 = icmp eq i32 %1203, %1147
  br i1 %1204, label %1205, label %1192

1205:                                             ; preds = %1192, %1152, %1150
  %1206 = phi i8 addrspace(4)* [ %1191, %1152 ], [ %1146, %1150 ], [ %1146, %1192 ]
  %1207 = phi i32 [ %1190, %1152 ], [ 0, %1150 ], [ 0, %1192 ]
  %1208 = phi i64 [ %1189, %1152 ], [ 0, %1150 ], [ %1202, %1192 ]
  %1209 = icmp ugt i32 %1207, 7
  br i1 %1209, label %1212, label %1210

1210:                                             ; preds = %1205
  %1211 = icmp eq i32 %1207, 0
  br i1 %1211, label %1265, label %1252

1212:                                             ; preds = %1205
  %1213 = load i8, i8 addrspace(4)* %1206, align 1, !tbaa !12
  %1214 = zext i8 %1213 to i64
  %1215 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 1
  %1216 = load i8, i8 addrspace(4)* %1215, align 1, !tbaa !12
  %1217 = zext i8 %1216 to i64
  %1218 = shl nuw nsw i64 %1217, 8
  %1219 = or i64 %1218, %1214
  %1220 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 2
  %1221 = load i8, i8 addrspace(4)* %1220, align 1, !tbaa !12
  %1222 = zext i8 %1221 to i64
  %1223 = shl nuw nsw i64 %1222, 16
  %1224 = or i64 %1219, %1223
  %1225 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 3
  %1226 = load i8, i8 addrspace(4)* %1225, align 1, !tbaa !12
  %1227 = zext i8 %1226 to i64
  %1228 = shl nuw nsw i64 %1227, 24
  %1229 = or i64 %1224, %1228
  %1230 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 4
  %1231 = load i8, i8 addrspace(4)* %1230, align 1, !tbaa !12
  %1232 = zext i8 %1231 to i64
  %1233 = shl nuw nsw i64 %1232, 32
  %1234 = or i64 %1229, %1233
  %1235 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 5
  %1236 = load i8, i8 addrspace(4)* %1235, align 1, !tbaa !12
  %1237 = zext i8 %1236 to i64
  %1238 = shl nuw nsw i64 %1237, 40
  %1239 = or i64 %1234, %1238
  %1240 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 6
  %1241 = load i8, i8 addrspace(4)* %1240, align 1, !tbaa !12
  %1242 = zext i8 %1241 to i64
  %1243 = shl nuw nsw i64 %1242, 48
  %1244 = or i64 %1239, %1243
  %1245 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 7
  %1246 = load i8, i8 addrspace(4)* %1245, align 1, !tbaa !12
  %1247 = zext i8 %1246 to i64
  %1248 = shl nuw i64 %1247, 56
  %1249 = or i64 %1244, %1248
  %1250 = add nsw i32 %1207, -8
  %1251 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 8
  br label %1265

1252:                                             ; preds = %1210, %1252
  %1253 = phi i32 [ %1263, %1252 ], [ 0, %1210 ]
  %1254 = phi i64 [ %1262, %1252 ], [ 0, %1210 ]
  %1255 = zext i32 %1253 to i64
  %1256 = getelementptr inbounds i8, i8 addrspace(4)* %1206, i64 %1255
  %1257 = load i8, i8 addrspace(4)* %1256, align 1, !tbaa !12
  %1258 = zext i8 %1257 to i64
  %1259 = shl i32 %1253, 3
  %1260 = zext i32 %1259 to i64
  %1261 = shl nuw i64 %1258, %1260
  %1262 = or i64 %1261, %1254
  %1263 = add nuw nsw i32 %1253, 1
  %1264 = icmp eq i32 %1263, %1207
  br i1 %1264, label %1265, label %1252

1265:                                             ; preds = %1252, %1212, %1210
  %1266 = phi i8 addrspace(4)* [ %1251, %1212 ], [ %1206, %1210 ], [ %1206, %1252 ]
  %1267 = phi i32 [ %1250, %1212 ], [ 0, %1210 ], [ 0, %1252 ]
  %1268 = phi i64 [ %1249, %1212 ], [ 0, %1210 ], [ %1262, %1252 ]
  %1269 = icmp ugt i32 %1267, 7
  br i1 %1269, label %1272, label %1270

1270:                                             ; preds = %1265
  %1271 = icmp eq i32 %1267, 0
  br i1 %1271, label %1325, label %1312

1272:                                             ; preds = %1265
  %1273 = load i8, i8 addrspace(4)* %1266, align 1, !tbaa !12
  %1274 = zext i8 %1273 to i64
  %1275 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 1
  %1276 = load i8, i8 addrspace(4)* %1275, align 1, !tbaa !12
  %1277 = zext i8 %1276 to i64
  %1278 = shl nuw nsw i64 %1277, 8
  %1279 = or i64 %1278, %1274
  %1280 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 2
  %1281 = load i8, i8 addrspace(4)* %1280, align 1, !tbaa !12
  %1282 = zext i8 %1281 to i64
  %1283 = shl nuw nsw i64 %1282, 16
  %1284 = or i64 %1279, %1283
  %1285 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 3
  %1286 = load i8, i8 addrspace(4)* %1285, align 1, !tbaa !12
  %1287 = zext i8 %1286 to i64
  %1288 = shl nuw nsw i64 %1287, 24
  %1289 = or i64 %1284, %1288
  %1290 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 4
  %1291 = load i8, i8 addrspace(4)* %1290, align 1, !tbaa !12
  %1292 = zext i8 %1291 to i64
  %1293 = shl nuw nsw i64 %1292, 32
  %1294 = or i64 %1289, %1293
  %1295 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 5
  %1296 = load i8, i8 addrspace(4)* %1295, align 1, !tbaa !12
  %1297 = zext i8 %1296 to i64
  %1298 = shl nuw nsw i64 %1297, 40
  %1299 = or i64 %1294, %1298
  %1300 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 6
  %1301 = load i8, i8 addrspace(4)* %1300, align 1, !tbaa !12
  %1302 = zext i8 %1301 to i64
  %1303 = shl nuw nsw i64 %1302, 48
  %1304 = or i64 %1299, %1303
  %1305 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 7
  %1306 = load i8, i8 addrspace(4)* %1305, align 1, !tbaa !12
  %1307 = zext i8 %1306 to i64
  %1308 = shl nuw i64 %1307, 56
  %1309 = or i64 %1304, %1308
  %1310 = add nsw i32 %1267, -8
  %1311 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 8
  br label %1325

1312:                                             ; preds = %1270, %1312
  %1313 = phi i32 [ %1323, %1312 ], [ 0, %1270 ]
  %1314 = phi i64 [ %1322, %1312 ], [ 0, %1270 ]
  %1315 = zext i32 %1313 to i64
  %1316 = getelementptr inbounds i8, i8 addrspace(4)* %1266, i64 %1315
  %1317 = load i8, i8 addrspace(4)* %1316, align 1, !tbaa !12
  %1318 = zext i8 %1317 to i64
  %1319 = shl i32 %1313, 3
  %1320 = zext i32 %1319 to i64
  %1321 = shl nuw i64 %1318, %1320
  %1322 = or i64 %1321, %1314
  %1323 = add nuw nsw i32 %1313, 1
  %1324 = icmp eq i32 %1323, %1267
  br i1 %1324, label %1325, label %1312

1325:                                             ; preds = %1312, %1272, %1270
  %1326 = phi i8 addrspace(4)* [ %1311, %1272 ], [ %1266, %1270 ], [ %1266, %1312 ]
  %1327 = phi i32 [ %1310, %1272 ], [ 0, %1270 ], [ 0, %1312 ]
  %1328 = phi i64 [ %1309, %1272 ], [ 0, %1270 ], [ %1322, %1312 ]
  %1329 = icmp ugt i32 %1327, 7
  br i1 %1329, label %1332, label %1330

1330:                                             ; preds = %1325
  %1331 = icmp eq i32 %1327, 0
  br i1 %1331, label %1383, label %1370

1332:                                             ; preds = %1325
  %1333 = load i8, i8 addrspace(4)* %1326, align 1, !tbaa !12
  %1334 = zext i8 %1333 to i64
  %1335 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 1
  %1336 = load i8, i8 addrspace(4)* %1335, align 1, !tbaa !12
  %1337 = zext i8 %1336 to i64
  %1338 = shl nuw nsw i64 %1337, 8
  %1339 = or i64 %1338, %1334
  %1340 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 2
  %1341 = load i8, i8 addrspace(4)* %1340, align 1, !tbaa !12
  %1342 = zext i8 %1341 to i64
  %1343 = shl nuw nsw i64 %1342, 16
  %1344 = or i64 %1339, %1343
  %1345 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 3
  %1346 = load i8, i8 addrspace(4)* %1345, align 1, !tbaa !12
  %1347 = zext i8 %1346 to i64
  %1348 = shl nuw nsw i64 %1347, 24
  %1349 = or i64 %1344, %1348
  %1350 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 4
  %1351 = load i8, i8 addrspace(4)* %1350, align 1, !tbaa !12
  %1352 = zext i8 %1351 to i64
  %1353 = shl nuw nsw i64 %1352, 32
  %1354 = or i64 %1349, %1353
  %1355 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 5
  %1356 = load i8, i8 addrspace(4)* %1355, align 1, !tbaa !12
  %1357 = zext i8 %1356 to i64
  %1358 = shl nuw nsw i64 %1357, 40
  %1359 = or i64 %1354, %1358
  %1360 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 6
  %1361 = load i8, i8 addrspace(4)* %1360, align 1, !tbaa !12
  %1362 = zext i8 %1361 to i64
  %1363 = shl nuw nsw i64 %1362, 48
  %1364 = or i64 %1359, %1363
  %1365 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 7
  %1366 = load i8, i8 addrspace(4)* %1365, align 1, !tbaa !12
  %1367 = zext i8 %1366 to i64
  %1368 = shl nuw i64 %1367, 56
  %1369 = or i64 %1364, %1368
  br label %1383

1370:                                             ; preds = %1330, %1370
  %1371 = phi i32 [ %1381, %1370 ], [ 0, %1330 ]
  %1372 = phi i64 [ %1380, %1370 ], [ 0, %1330 ]
  %1373 = zext i32 %1371 to i64
  %1374 = getelementptr inbounds i8, i8 addrspace(4)* %1326, i64 %1373
  %1375 = load i8, i8 addrspace(4)* %1374, align 1, !tbaa !12
  %1376 = zext i8 %1375 to i64
  %1377 = shl i32 %1371, 3
  %1378 = zext i32 %1377 to i64
  %1379 = shl nuw i64 %1376, %1378
  %1380 = or i64 %1379, %1372
  %1381 = add nuw nsw i32 %1371, 1
  %1382 = icmp eq i32 %1381, %1327
  br i1 %1382, label %1383, label %1370

1383:                                             ; preds = %1370, %1332, %1330
  %1384 = phi i64 [ %1369, %1332 ], [ 0, %1330 ], [ %1380, %1370 ]
  %1385 = shl nuw nsw i64 %966, 2
  %1386 = add nuw nsw i64 %1385, 28
  %1387 = and i64 %1386, 480
  %1388 = and i64 %968, -225
  %1389 = or i64 %1388, %1387
  %1390 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %1389, i64 noundef %1028, i64 noundef %1088, i64 noundef %1148, i64 noundef %1208, i64 noundef %1268, i64 noundef %1328, i64 noundef %1384) #10
  %1391 = sub i64 %958, %966
  %1392 = getelementptr inbounds i8, i8 addrspace(4)* %959, i64 %966
  %1393 = icmp eq i64 %1391, 0
  br i1 %1393, label %1394, label %957

1394:                                             ; preds = %1383, %950
  %1395 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %1396 = extractelement <2 x i64> %1395, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %1397, label %1401

1397:                                             ; preds = %1394
  %1398 = and i64 %1396, -227
  %1399 = or i64 %1398, 34
  %1400 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %1399, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %1841

1401:                                             ; preds = %1394
  %1402 = and i64 %1396, -3
  %1403 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %1402, i64 0
  br label %1404

1404:                                             ; preds = %1830, %1401
  %1405 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 1) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([2 x i8]* addrspacecast ([2 x i8] addrspace(4)* @.str.1 to [2 x i8]*) to i64)), i64 1))), %1401 ], [ %1838, %1830 ]
  %1406 = phi i8 addrspace(4)* [ getelementptr inbounds ([2 x i8], [2 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %1401 ], [ %1839, %1830 ]
  %1407 = phi <2 x i64> [ %1403, %1401 ], [ %1837, %1830 ]
  %1408 = icmp ugt i64 %1405, 56
  %1409 = extractelement <2 x i64> %1407, i64 0
  %1410 = or i64 %1409, 2
  %1411 = insertelement <2 x i64> poison, i64 %1410, i64 0
  %1412 = select i1 %1408, <2 x i64> %1407, <2 x i64> %1411
  %1413 = tail call i64 @llvm.umin.i64(i64 %1405, i64 56)
  %1414 = trunc i64 %1413 to i32
  %1415 = extractelement <2 x i64> %1412, i64 0
  %1416 = icmp ugt i32 %1414, 7
  br i1 %1416, label %1419, label %1417

1417:                                             ; preds = %1404
  %1418 = icmp eq i32 %1414, 0
  br i1 %1418, label %1472, label %1459

1419:                                             ; preds = %1404
  %1420 = load i8, i8 addrspace(4)* %1406, align 1, !tbaa !12
  %1421 = zext i8 %1420 to i64
  %1422 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 1
  %1423 = load i8, i8 addrspace(4)* %1422, align 1, !tbaa !12
  %1424 = zext i8 %1423 to i64
  %1425 = shl nuw nsw i64 %1424, 8
  %1426 = or i64 %1425, %1421
  %1427 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 2
  %1428 = load i8, i8 addrspace(4)* %1427, align 1, !tbaa !12
  %1429 = zext i8 %1428 to i64
  %1430 = shl nuw nsw i64 %1429, 16
  %1431 = or i64 %1426, %1430
  %1432 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 3
  %1433 = load i8, i8 addrspace(4)* %1432, align 1, !tbaa !12
  %1434 = zext i8 %1433 to i64
  %1435 = shl nuw nsw i64 %1434, 24
  %1436 = or i64 %1431, %1435
  %1437 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 4
  %1438 = load i8, i8 addrspace(4)* %1437, align 1, !tbaa !12
  %1439 = zext i8 %1438 to i64
  %1440 = shl nuw nsw i64 %1439, 32
  %1441 = or i64 %1436, %1440
  %1442 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 5
  %1443 = load i8, i8 addrspace(4)* %1442, align 1, !tbaa !12
  %1444 = zext i8 %1443 to i64
  %1445 = shl nuw nsw i64 %1444, 40
  %1446 = or i64 %1441, %1445
  %1447 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 6
  %1448 = load i8, i8 addrspace(4)* %1447, align 1, !tbaa !12
  %1449 = zext i8 %1448 to i64
  %1450 = shl nuw nsw i64 %1449, 48
  %1451 = or i64 %1446, %1450
  %1452 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 7
  %1453 = load i8, i8 addrspace(4)* %1452, align 1, !tbaa !12
  %1454 = zext i8 %1453 to i64
  %1455 = shl nuw i64 %1454, 56
  %1456 = or i64 %1451, %1455
  %1457 = add nsw i32 %1414, -8
  %1458 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 8
  br label %1472

1459:                                             ; preds = %1417, %1459
  %1460 = phi i32 [ %1470, %1459 ], [ 0, %1417 ]
  %1461 = phi i64 [ %1469, %1459 ], [ 0, %1417 ]
  %1462 = zext i32 %1460 to i64
  %1463 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 %1462
  %1464 = load i8, i8 addrspace(4)* %1463, align 1, !tbaa !12
  %1465 = zext i8 %1464 to i64
  %1466 = shl i32 %1460, 3
  %1467 = zext i32 %1466 to i64
  %1468 = shl nuw i64 %1465, %1467
  %1469 = or i64 %1468, %1461
  %1470 = add nuw nsw i32 %1460, 1
  %1471 = icmp eq i32 %1470, %1414
  br i1 %1471, label %1472, label %1459, !llvm.loop !13

1472:                                             ; preds = %1459, %1419, %1417
  %1473 = phi i8 addrspace(4)* [ %1458, %1419 ], [ %1406, %1417 ], [ %1406, %1459 ]
  %1474 = phi i32 [ %1457, %1419 ], [ 0, %1417 ], [ 0, %1459 ]
  %1475 = phi i64 [ %1456, %1419 ], [ 0, %1417 ], [ %1469, %1459 ]
  %1476 = icmp ugt i32 %1474, 7
  br i1 %1476, label %1479, label %1477

1477:                                             ; preds = %1472
  %1478 = icmp eq i32 %1474, 0
  br i1 %1478, label %1532, label %1519

1479:                                             ; preds = %1472
  %1480 = load i8, i8 addrspace(4)* %1473, align 1, !tbaa !12
  %1481 = zext i8 %1480 to i64
  %1482 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 1
  %1483 = load i8, i8 addrspace(4)* %1482, align 1, !tbaa !12
  %1484 = zext i8 %1483 to i64
  %1485 = shl nuw nsw i64 %1484, 8
  %1486 = or i64 %1485, %1481
  %1487 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 2
  %1488 = load i8, i8 addrspace(4)* %1487, align 1, !tbaa !12
  %1489 = zext i8 %1488 to i64
  %1490 = shl nuw nsw i64 %1489, 16
  %1491 = or i64 %1486, %1490
  %1492 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 3
  %1493 = load i8, i8 addrspace(4)* %1492, align 1, !tbaa !12
  %1494 = zext i8 %1493 to i64
  %1495 = shl nuw nsw i64 %1494, 24
  %1496 = or i64 %1491, %1495
  %1497 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 4
  %1498 = load i8, i8 addrspace(4)* %1497, align 1, !tbaa !12
  %1499 = zext i8 %1498 to i64
  %1500 = shl nuw nsw i64 %1499, 32
  %1501 = or i64 %1496, %1500
  %1502 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 5
  %1503 = load i8, i8 addrspace(4)* %1502, align 1, !tbaa !12
  %1504 = zext i8 %1503 to i64
  %1505 = shl nuw nsw i64 %1504, 40
  %1506 = or i64 %1501, %1505
  %1507 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 6
  %1508 = load i8, i8 addrspace(4)* %1507, align 1, !tbaa !12
  %1509 = zext i8 %1508 to i64
  %1510 = shl nuw nsw i64 %1509, 48
  %1511 = or i64 %1506, %1510
  %1512 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 7
  %1513 = load i8, i8 addrspace(4)* %1512, align 1, !tbaa !12
  %1514 = zext i8 %1513 to i64
  %1515 = shl nuw i64 %1514, 56
  %1516 = or i64 %1511, %1515
  %1517 = add nsw i32 %1474, -8
  %1518 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 8
  br label %1532

1519:                                             ; preds = %1477, %1519
  %1520 = phi i32 [ %1530, %1519 ], [ 0, %1477 ]
  %1521 = phi i64 [ %1529, %1519 ], [ 0, %1477 ]
  %1522 = zext i32 %1520 to i64
  %1523 = getelementptr inbounds i8, i8 addrspace(4)* %1473, i64 %1522
  %1524 = load i8, i8 addrspace(4)* %1523, align 1, !tbaa !12
  %1525 = zext i8 %1524 to i64
  %1526 = shl i32 %1520, 3
  %1527 = zext i32 %1526 to i64
  %1528 = shl nuw i64 %1525, %1527
  %1529 = or i64 %1528, %1521
  %1530 = add nuw nsw i32 %1520, 1
  %1531 = icmp eq i32 %1530, %1474
  br i1 %1531, label %1532, label %1519

1532:                                             ; preds = %1519, %1479, %1477
  %1533 = phi i8 addrspace(4)* [ %1518, %1479 ], [ %1473, %1477 ], [ %1473, %1519 ]
  %1534 = phi i32 [ %1517, %1479 ], [ 0, %1477 ], [ 0, %1519 ]
  %1535 = phi i64 [ %1516, %1479 ], [ 0, %1477 ], [ %1529, %1519 ]
  %1536 = icmp ugt i32 %1534, 7
  br i1 %1536, label %1539, label %1537

1537:                                             ; preds = %1532
  %1538 = icmp eq i32 %1534, 0
  br i1 %1538, label %1592, label %1579

1539:                                             ; preds = %1532
  %1540 = load i8, i8 addrspace(4)* %1533, align 1, !tbaa !12
  %1541 = zext i8 %1540 to i64
  %1542 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 1
  %1543 = load i8, i8 addrspace(4)* %1542, align 1, !tbaa !12
  %1544 = zext i8 %1543 to i64
  %1545 = shl nuw nsw i64 %1544, 8
  %1546 = or i64 %1545, %1541
  %1547 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 2
  %1548 = load i8, i8 addrspace(4)* %1547, align 1, !tbaa !12
  %1549 = zext i8 %1548 to i64
  %1550 = shl nuw nsw i64 %1549, 16
  %1551 = or i64 %1546, %1550
  %1552 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 3
  %1553 = load i8, i8 addrspace(4)* %1552, align 1, !tbaa !12
  %1554 = zext i8 %1553 to i64
  %1555 = shl nuw nsw i64 %1554, 24
  %1556 = or i64 %1551, %1555
  %1557 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 4
  %1558 = load i8, i8 addrspace(4)* %1557, align 1, !tbaa !12
  %1559 = zext i8 %1558 to i64
  %1560 = shl nuw nsw i64 %1559, 32
  %1561 = or i64 %1556, %1560
  %1562 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 5
  %1563 = load i8, i8 addrspace(4)* %1562, align 1, !tbaa !12
  %1564 = zext i8 %1563 to i64
  %1565 = shl nuw nsw i64 %1564, 40
  %1566 = or i64 %1561, %1565
  %1567 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 6
  %1568 = load i8, i8 addrspace(4)* %1567, align 1, !tbaa !12
  %1569 = zext i8 %1568 to i64
  %1570 = shl nuw nsw i64 %1569, 48
  %1571 = or i64 %1566, %1570
  %1572 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 7
  %1573 = load i8, i8 addrspace(4)* %1572, align 1, !tbaa !12
  %1574 = zext i8 %1573 to i64
  %1575 = shl nuw i64 %1574, 56
  %1576 = or i64 %1571, %1575
  %1577 = add nsw i32 %1534, -8
  %1578 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 8
  br label %1592

1579:                                             ; preds = %1537, %1579
  %1580 = phi i32 [ %1590, %1579 ], [ 0, %1537 ]
  %1581 = phi i64 [ %1589, %1579 ], [ 0, %1537 ]
  %1582 = zext i32 %1580 to i64
  %1583 = getelementptr inbounds i8, i8 addrspace(4)* %1533, i64 %1582
  %1584 = load i8, i8 addrspace(4)* %1583, align 1, !tbaa !12
  %1585 = zext i8 %1584 to i64
  %1586 = shl i32 %1580, 3
  %1587 = zext i32 %1586 to i64
  %1588 = shl nuw i64 %1585, %1587
  %1589 = or i64 %1588, %1581
  %1590 = add nuw nsw i32 %1580, 1
  %1591 = icmp eq i32 %1590, %1534
  br i1 %1591, label %1592, label %1579

1592:                                             ; preds = %1579, %1539, %1537
  %1593 = phi i8 addrspace(4)* [ %1578, %1539 ], [ %1533, %1537 ], [ %1533, %1579 ]
  %1594 = phi i32 [ %1577, %1539 ], [ 0, %1537 ], [ 0, %1579 ]
  %1595 = phi i64 [ %1576, %1539 ], [ 0, %1537 ], [ %1589, %1579 ]
  %1596 = icmp ugt i32 %1594, 7
  br i1 %1596, label %1599, label %1597

1597:                                             ; preds = %1592
  %1598 = icmp eq i32 %1594, 0
  br i1 %1598, label %1652, label %1639

1599:                                             ; preds = %1592
  %1600 = load i8, i8 addrspace(4)* %1593, align 1, !tbaa !12
  %1601 = zext i8 %1600 to i64
  %1602 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 1
  %1603 = load i8, i8 addrspace(4)* %1602, align 1, !tbaa !12
  %1604 = zext i8 %1603 to i64
  %1605 = shl nuw nsw i64 %1604, 8
  %1606 = or i64 %1605, %1601
  %1607 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 2
  %1608 = load i8, i8 addrspace(4)* %1607, align 1, !tbaa !12
  %1609 = zext i8 %1608 to i64
  %1610 = shl nuw nsw i64 %1609, 16
  %1611 = or i64 %1606, %1610
  %1612 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 3
  %1613 = load i8, i8 addrspace(4)* %1612, align 1, !tbaa !12
  %1614 = zext i8 %1613 to i64
  %1615 = shl nuw nsw i64 %1614, 24
  %1616 = or i64 %1611, %1615
  %1617 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 4
  %1618 = load i8, i8 addrspace(4)* %1617, align 1, !tbaa !12
  %1619 = zext i8 %1618 to i64
  %1620 = shl nuw nsw i64 %1619, 32
  %1621 = or i64 %1616, %1620
  %1622 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 5
  %1623 = load i8, i8 addrspace(4)* %1622, align 1, !tbaa !12
  %1624 = zext i8 %1623 to i64
  %1625 = shl nuw nsw i64 %1624, 40
  %1626 = or i64 %1621, %1625
  %1627 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 6
  %1628 = load i8, i8 addrspace(4)* %1627, align 1, !tbaa !12
  %1629 = zext i8 %1628 to i64
  %1630 = shl nuw nsw i64 %1629, 48
  %1631 = or i64 %1626, %1630
  %1632 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 7
  %1633 = load i8, i8 addrspace(4)* %1632, align 1, !tbaa !12
  %1634 = zext i8 %1633 to i64
  %1635 = shl nuw i64 %1634, 56
  %1636 = or i64 %1631, %1635
  %1637 = add nsw i32 %1594, -8
  %1638 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 8
  br label %1652

1639:                                             ; preds = %1597, %1639
  %1640 = phi i32 [ %1650, %1639 ], [ 0, %1597 ]
  %1641 = phi i64 [ %1649, %1639 ], [ 0, %1597 ]
  %1642 = zext i32 %1640 to i64
  %1643 = getelementptr inbounds i8, i8 addrspace(4)* %1593, i64 %1642
  %1644 = load i8, i8 addrspace(4)* %1643, align 1, !tbaa !12
  %1645 = zext i8 %1644 to i64
  %1646 = shl i32 %1640, 3
  %1647 = zext i32 %1646 to i64
  %1648 = shl nuw i64 %1645, %1647
  %1649 = or i64 %1648, %1641
  %1650 = add nuw nsw i32 %1640, 1
  %1651 = icmp eq i32 %1650, %1594
  br i1 %1651, label %1652, label %1639

1652:                                             ; preds = %1639, %1599, %1597
  %1653 = phi i8 addrspace(4)* [ %1638, %1599 ], [ %1593, %1597 ], [ %1593, %1639 ]
  %1654 = phi i32 [ %1637, %1599 ], [ 0, %1597 ], [ 0, %1639 ]
  %1655 = phi i64 [ %1636, %1599 ], [ 0, %1597 ], [ %1649, %1639 ]
  %1656 = icmp ugt i32 %1654, 7
  br i1 %1656, label %1659, label %1657

1657:                                             ; preds = %1652
  %1658 = icmp eq i32 %1654, 0
  br i1 %1658, label %1712, label %1699

1659:                                             ; preds = %1652
  %1660 = load i8, i8 addrspace(4)* %1653, align 1, !tbaa !12
  %1661 = zext i8 %1660 to i64
  %1662 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 1
  %1663 = load i8, i8 addrspace(4)* %1662, align 1, !tbaa !12
  %1664 = zext i8 %1663 to i64
  %1665 = shl nuw nsw i64 %1664, 8
  %1666 = or i64 %1665, %1661
  %1667 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 2
  %1668 = load i8, i8 addrspace(4)* %1667, align 1, !tbaa !12
  %1669 = zext i8 %1668 to i64
  %1670 = shl nuw nsw i64 %1669, 16
  %1671 = or i64 %1666, %1670
  %1672 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 3
  %1673 = load i8, i8 addrspace(4)* %1672, align 1, !tbaa !12
  %1674 = zext i8 %1673 to i64
  %1675 = shl nuw nsw i64 %1674, 24
  %1676 = or i64 %1671, %1675
  %1677 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 4
  %1678 = load i8, i8 addrspace(4)* %1677, align 1, !tbaa !12
  %1679 = zext i8 %1678 to i64
  %1680 = shl nuw nsw i64 %1679, 32
  %1681 = or i64 %1676, %1680
  %1682 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 5
  %1683 = load i8, i8 addrspace(4)* %1682, align 1, !tbaa !12
  %1684 = zext i8 %1683 to i64
  %1685 = shl nuw nsw i64 %1684, 40
  %1686 = or i64 %1681, %1685
  %1687 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 6
  %1688 = load i8, i8 addrspace(4)* %1687, align 1, !tbaa !12
  %1689 = zext i8 %1688 to i64
  %1690 = shl nuw nsw i64 %1689, 48
  %1691 = or i64 %1686, %1690
  %1692 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 7
  %1693 = load i8, i8 addrspace(4)* %1692, align 1, !tbaa !12
  %1694 = zext i8 %1693 to i64
  %1695 = shl nuw i64 %1694, 56
  %1696 = or i64 %1691, %1695
  %1697 = add nsw i32 %1654, -8
  %1698 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 8
  br label %1712

1699:                                             ; preds = %1657, %1699
  %1700 = phi i32 [ %1710, %1699 ], [ 0, %1657 ]
  %1701 = phi i64 [ %1709, %1699 ], [ 0, %1657 ]
  %1702 = zext i32 %1700 to i64
  %1703 = getelementptr inbounds i8, i8 addrspace(4)* %1653, i64 %1702
  %1704 = load i8, i8 addrspace(4)* %1703, align 1, !tbaa !12
  %1705 = zext i8 %1704 to i64
  %1706 = shl i32 %1700, 3
  %1707 = zext i32 %1706 to i64
  %1708 = shl nuw i64 %1705, %1707
  %1709 = or i64 %1708, %1701
  %1710 = add nuw nsw i32 %1700, 1
  %1711 = icmp eq i32 %1710, %1654
  br i1 %1711, label %1712, label %1699

1712:                                             ; preds = %1699, %1659, %1657
  %1713 = phi i8 addrspace(4)* [ %1698, %1659 ], [ %1653, %1657 ], [ %1653, %1699 ]
  %1714 = phi i32 [ %1697, %1659 ], [ 0, %1657 ], [ 0, %1699 ]
  %1715 = phi i64 [ %1696, %1659 ], [ 0, %1657 ], [ %1709, %1699 ]
  %1716 = icmp ugt i32 %1714, 7
  br i1 %1716, label %1719, label %1717

1717:                                             ; preds = %1712
  %1718 = icmp eq i32 %1714, 0
  br i1 %1718, label %1772, label %1759

1719:                                             ; preds = %1712
  %1720 = load i8, i8 addrspace(4)* %1713, align 1, !tbaa !12
  %1721 = zext i8 %1720 to i64
  %1722 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 1
  %1723 = load i8, i8 addrspace(4)* %1722, align 1, !tbaa !12
  %1724 = zext i8 %1723 to i64
  %1725 = shl nuw nsw i64 %1724, 8
  %1726 = or i64 %1725, %1721
  %1727 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 2
  %1728 = load i8, i8 addrspace(4)* %1727, align 1, !tbaa !12
  %1729 = zext i8 %1728 to i64
  %1730 = shl nuw nsw i64 %1729, 16
  %1731 = or i64 %1726, %1730
  %1732 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 3
  %1733 = load i8, i8 addrspace(4)* %1732, align 1, !tbaa !12
  %1734 = zext i8 %1733 to i64
  %1735 = shl nuw nsw i64 %1734, 24
  %1736 = or i64 %1731, %1735
  %1737 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 4
  %1738 = load i8, i8 addrspace(4)* %1737, align 1, !tbaa !12
  %1739 = zext i8 %1738 to i64
  %1740 = shl nuw nsw i64 %1739, 32
  %1741 = or i64 %1736, %1740
  %1742 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 5
  %1743 = load i8, i8 addrspace(4)* %1742, align 1, !tbaa !12
  %1744 = zext i8 %1743 to i64
  %1745 = shl nuw nsw i64 %1744, 40
  %1746 = or i64 %1741, %1745
  %1747 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 6
  %1748 = load i8, i8 addrspace(4)* %1747, align 1, !tbaa !12
  %1749 = zext i8 %1748 to i64
  %1750 = shl nuw nsw i64 %1749, 48
  %1751 = or i64 %1746, %1750
  %1752 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 7
  %1753 = load i8, i8 addrspace(4)* %1752, align 1, !tbaa !12
  %1754 = zext i8 %1753 to i64
  %1755 = shl nuw i64 %1754, 56
  %1756 = or i64 %1751, %1755
  %1757 = add nsw i32 %1714, -8
  %1758 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 8
  br label %1772

1759:                                             ; preds = %1717, %1759
  %1760 = phi i32 [ %1770, %1759 ], [ 0, %1717 ]
  %1761 = phi i64 [ %1769, %1759 ], [ 0, %1717 ]
  %1762 = zext i32 %1760 to i64
  %1763 = getelementptr inbounds i8, i8 addrspace(4)* %1713, i64 %1762
  %1764 = load i8, i8 addrspace(4)* %1763, align 1, !tbaa !12
  %1765 = zext i8 %1764 to i64
  %1766 = shl i32 %1760, 3
  %1767 = zext i32 %1766 to i64
  %1768 = shl nuw i64 %1765, %1767
  %1769 = or i64 %1768, %1761
  %1770 = add nuw nsw i32 %1760, 1
  %1771 = icmp eq i32 %1770, %1714
  br i1 %1771, label %1772, label %1759

1772:                                             ; preds = %1759, %1719, %1717
  %1773 = phi i8 addrspace(4)* [ %1758, %1719 ], [ %1713, %1717 ], [ %1713, %1759 ]
  %1774 = phi i32 [ %1757, %1719 ], [ 0, %1717 ], [ 0, %1759 ]
  %1775 = phi i64 [ %1756, %1719 ], [ 0, %1717 ], [ %1769, %1759 ]
  %1776 = icmp ugt i32 %1774, 7
  br i1 %1776, label %1779, label %1777

1777:                                             ; preds = %1772
  %1778 = icmp eq i32 %1774, 0
  br i1 %1778, label %1830, label %1817

1779:                                             ; preds = %1772
  %1780 = load i8, i8 addrspace(4)* %1773, align 1, !tbaa !12
  %1781 = zext i8 %1780 to i64
  %1782 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 1
  %1783 = load i8, i8 addrspace(4)* %1782, align 1, !tbaa !12
  %1784 = zext i8 %1783 to i64
  %1785 = shl nuw nsw i64 %1784, 8
  %1786 = or i64 %1785, %1781
  %1787 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 2
  %1788 = load i8, i8 addrspace(4)* %1787, align 1, !tbaa !12
  %1789 = zext i8 %1788 to i64
  %1790 = shl nuw nsw i64 %1789, 16
  %1791 = or i64 %1786, %1790
  %1792 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 3
  %1793 = load i8, i8 addrspace(4)* %1792, align 1, !tbaa !12
  %1794 = zext i8 %1793 to i64
  %1795 = shl nuw nsw i64 %1794, 24
  %1796 = or i64 %1791, %1795
  %1797 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 4
  %1798 = load i8, i8 addrspace(4)* %1797, align 1, !tbaa !12
  %1799 = zext i8 %1798 to i64
  %1800 = shl nuw nsw i64 %1799, 32
  %1801 = or i64 %1796, %1800
  %1802 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 5
  %1803 = load i8, i8 addrspace(4)* %1802, align 1, !tbaa !12
  %1804 = zext i8 %1803 to i64
  %1805 = shl nuw nsw i64 %1804, 40
  %1806 = or i64 %1801, %1805
  %1807 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 6
  %1808 = load i8, i8 addrspace(4)* %1807, align 1, !tbaa !12
  %1809 = zext i8 %1808 to i64
  %1810 = shl nuw nsw i64 %1809, 48
  %1811 = or i64 %1806, %1810
  %1812 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 7
  %1813 = load i8, i8 addrspace(4)* %1812, align 1, !tbaa !12
  %1814 = zext i8 %1813 to i64
  %1815 = shl nuw i64 %1814, 56
  %1816 = or i64 %1811, %1815
  br label %1830

1817:                                             ; preds = %1777, %1817
  %1818 = phi i32 [ %1828, %1817 ], [ 0, %1777 ]
  %1819 = phi i64 [ %1827, %1817 ], [ 0, %1777 ]
  %1820 = zext i32 %1818 to i64
  %1821 = getelementptr inbounds i8, i8 addrspace(4)* %1773, i64 %1820
  %1822 = load i8, i8 addrspace(4)* %1821, align 1, !tbaa !12
  %1823 = zext i8 %1822 to i64
  %1824 = shl i32 %1818, 3
  %1825 = zext i32 %1824 to i64
  %1826 = shl nuw i64 %1823, %1825
  %1827 = or i64 %1826, %1819
  %1828 = add nuw nsw i32 %1818, 1
  %1829 = icmp eq i32 %1828, %1774
  br i1 %1829, label %1830, label %1817

1830:                                             ; preds = %1817, %1779, %1777
  %1831 = phi i64 [ %1816, %1779 ], [ 0, %1777 ], [ %1827, %1817 ]
  %1832 = shl nuw nsw i64 %1413, 2
  %1833 = add nuw nsw i64 %1832, 28
  %1834 = and i64 %1833, 480
  %1835 = and i64 %1415, -225
  %1836 = or i64 %1835, %1834
  %1837 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %34, i64 noundef %1836, i64 noundef %1475, i64 noundef %1535, i64 noundef %1595, i64 noundef %1655, i64 noundef %1715, i64 noundef %1775, i64 noundef %1831) #10
  %1838 = sub i64 %1405, %1413
  %1839 = getelementptr inbounds i8, i8 addrspace(4)* %1406, i64 %1413
  %1840 = icmp eq i64 %1838, 0
  br i1 %1840, label %1841, label %1404

1841:                                             ; preds = %1830, %1397
  %1842 = add nuw nsw i32 %13, 1
  %1843 = icmp eq i32 %1842, %3
  br i1 %1843, label %20, label %12, !llvm.loop !18
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !19
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !21
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !21
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #10, !srcloc !23
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !21
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !21
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !19
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !19
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !19
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !24
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !24
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !4
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !19
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !24
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !27
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !19
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !19
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !28
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !27
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !19
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !19
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !19
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !21
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !4
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !4
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !4
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !4
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !4
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !4
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !4
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !4
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !19
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !24
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
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !19
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !19
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !4
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !4
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !12
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !19
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !4
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !21
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !21
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !24
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !12
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
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{!6, !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = distinct !{!17, !16}
!18 = distinct !{!18, !16}
!19 = !{!20, !20, i64 0}
!20 = !{!"any pointer", !6, i64 0}
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !6, i64 0}
!23 = !{i64 2662}
!24 = !{!25, !20, i64 0}
!25 = !{!"", !20, i64 0, !20, i64 8, !26, i64 16, !5, i64 24, !5, i64 32, !5, i64 40}
!26 = !{!"hsa_signal_s", !5, i64 0}
!27 = !{!25, !5, i64 40}
!28 = !{!25, !20, i64 8}
!29 = !{!"exec"}
!30 = !{!31, !22, i64 16}
!31 = !{!"", !5, i64 0, !5, i64 8, !22, i64 16, !22, i64 20}
!32 = !{!31, !5, i64 8}
!33 = !{!31, !22, i64 20}
!34 = !{!31, !5, i64 0}
!35 = !{!36, !5, i64 16}
!36 = !{!"amd_signal_s", !5, i64 0, !6, i64 8, !5, i64 16, !22, i64 24, !22, i64 28, !5, i64 32, !5, i64 40, !6, i64 48, !6, i64 56}
!37 = !{!36, !22, i64 24}
