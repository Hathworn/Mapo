; ModuleID = '../data/hip_kernels/13464/8/main.cu'
source_filename = "../data/hip_kernels/13464/8/main.cu"
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

@s_sum = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4
@.str = private unnamed_addr addrspace(4) constant [7 x i8] c"%d,%f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9ReducePI2PfiS_(float addrspace(1)* nocapture readonly %0, i32 %1, float addrspace(1)* nocapture writeonly %2) local_unnamed_addr #1 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds float, float addrspace(1)* %0, i64 %5
  %7 = load float, float addrspace(1)* %6, align 4, !tbaa !5, !amdgpu.noclobber !9
  %8 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_sum, i32 0, i32 %4
  store float %7, float addrspace(3)* %8, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !10, !invariant.load !9
  %13 = icmp ult i16 %12, 2
  br i1 %13, label %16, label %14

14:                                               ; preds = %3
  %15 = zext i16 %12 to i32
  br label %27

16:                                               ; preds = %37, %3
  %17 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %18 = fpext float %17 to double
  %19 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %20 = getelementptr inbounds i8, i8 addrspace(4)* %19, i64 24
  %21 = bitcast i8 addrspace(4)* %20 to i64 addrspace(4)*
  %22 = load i64, i64 addrspace(4)* %21, align 8, !tbaa !11
  %23 = inttoptr i64 %22 to i8 addrspace(1)*
  %24 = addrspacecast i8 addrspace(1)* %23 to i8*
  %25 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %26 = extractelement <2 x i64> %25, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %39, label %43

27:                                               ; preds = %14, %37
  %28 = phi i32 [ %29, %37 ], [ %15, %14 ]
  %29 = lshr i32 %28, 1
  %30 = icmp ult i32 %4, %29
  br i1 %30, label %31, label %37

31:                                               ; preds = %27
  %32 = add nuw nsw i32 %29, %4
  %33 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @s_sum, i32 0, i32 %32
  %34 = load float, float addrspace(3)* %33, align 4, !tbaa !5
  %35 = load float, float addrspace(3)* %8, align 4, !tbaa !5
  %36 = fadd contract float %34, %35
  store float %36, float addrspace(3)* %8, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %31, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp ult i32 %28, 4
  br i1 %38, label %16, label %27, !llvm.loop !15

39:                                               ; preds = %16
  %40 = and i64 %26, -225
  %41 = or i64 %40, 32
  %42 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %41, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %484

43:                                               ; preds = %16
  %44 = and i64 %26, 2
  %45 = and i64 %26, -3
  %46 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %45, i64 0
  br label %47

47:                                               ; preds = %473, %43
  %48 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 6) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([7 x i8]* addrspacecast ([7 x i8] addrspace(4)* @.str to [7 x i8]*) to i64)), i64 1))), %43 ], [ %481, %473 ]
  %49 = phi i8 addrspace(4)* [ getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0), %43 ], [ %482, %473 ]
  %50 = phi <2 x i64> [ %46, %43 ], [ %480, %473 ]
  %51 = icmp ugt i64 %48, 56
  %52 = extractelement <2 x i64> %50, i64 0
  %53 = or i64 %52, %44
  %54 = insertelement <2 x i64> poison, i64 %53, i64 0
  %55 = select i1 %51, <2 x i64> %50, <2 x i64> %54
  %56 = tail call i64 @llvm.umin.i64(i64 %48, i64 56)
  %57 = trunc i64 %56 to i32
  %58 = extractelement <2 x i64> %55, i64 0
  %59 = icmp ugt i32 %57, 7
  br i1 %59, label %62, label %60

60:                                               ; preds = %47
  %61 = icmp eq i32 %57, 0
  br i1 %61, label %115, label %102

62:                                               ; preds = %47
  %63 = load i8, i8 addrspace(4)* %49, align 1, !tbaa !17
  %64 = zext i8 %63 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 1
  %66 = load i8, i8 addrspace(4)* %65, align 1, !tbaa !17
  %67 = zext i8 %66 to i64
  %68 = shl nuw nsw i64 %67, 8
  %69 = or i64 %68, %64
  %70 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 2
  %71 = load i8, i8 addrspace(4)* %70, align 1, !tbaa !17
  %72 = zext i8 %71 to i64
  %73 = shl nuw nsw i64 %72, 16
  %74 = or i64 %69, %73
  %75 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 3
  %76 = load i8, i8 addrspace(4)* %75, align 1, !tbaa !17
  %77 = zext i8 %76 to i64
  %78 = shl nuw nsw i64 %77, 24
  %79 = or i64 %74, %78
  %80 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 4
  %81 = load i8, i8 addrspace(4)* %80, align 1, !tbaa !17
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 32
  %84 = or i64 %79, %83
  %85 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 5
  %86 = load i8, i8 addrspace(4)* %85, align 1, !tbaa !17
  %87 = zext i8 %86 to i64
  %88 = shl nuw nsw i64 %87, 40
  %89 = or i64 %84, %88
  %90 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 6
  %91 = load i8, i8 addrspace(4)* %90, align 1, !tbaa !17
  %92 = zext i8 %91 to i64
  %93 = shl nuw nsw i64 %92, 48
  %94 = or i64 %89, %93
  %95 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 7
  %96 = load i8, i8 addrspace(4)* %95, align 1, !tbaa !17
  %97 = zext i8 %96 to i64
  %98 = shl nuw i64 %97, 56
  %99 = or i64 %94, %98
  %100 = add nsw i32 %57, -8
  %101 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 8
  br label %115

102:                                              ; preds = %60, %102
  %103 = phi i32 [ %113, %102 ], [ 0, %60 ]
  %104 = phi i64 [ %112, %102 ], [ 0, %60 ]
  %105 = zext i32 %103 to i64
  %106 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 %105
  %107 = load i8, i8 addrspace(4)* %106, align 1, !tbaa !17
  %108 = zext i8 %107 to i64
  %109 = shl i32 %103, 3
  %110 = zext i32 %109 to i64
  %111 = shl nuw i64 %108, %110
  %112 = or i64 %111, %104
  %113 = add nuw nsw i32 %103, 1
  %114 = icmp eq i32 %113, %57
  br i1 %114, label %115, label %102, !llvm.loop !18

115:                                              ; preds = %102, %62, %60
  %116 = phi i8 addrspace(4)* [ %101, %62 ], [ %49, %60 ], [ %49, %102 ]
  %117 = phi i32 [ %100, %62 ], [ 0, %60 ], [ 0, %102 ]
  %118 = phi i64 [ %99, %62 ], [ 0, %60 ], [ %112, %102 ]
  %119 = icmp ugt i32 %117, 7
  br i1 %119, label %122, label %120

120:                                              ; preds = %115
  %121 = icmp eq i32 %117, 0
  br i1 %121, label %175, label %162

122:                                              ; preds = %115
  %123 = load i8, i8 addrspace(4)* %116, align 1, !tbaa !17
  %124 = zext i8 %123 to i64
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 1
  %126 = load i8, i8 addrspace(4)* %125, align 1, !tbaa !17
  %127 = zext i8 %126 to i64
  %128 = shl nuw nsw i64 %127, 8
  %129 = or i64 %128, %124
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 2
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !17
  %132 = zext i8 %131 to i64
  %133 = shl nuw nsw i64 %132, 16
  %134 = or i64 %129, %133
  %135 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 3
  %136 = load i8, i8 addrspace(4)* %135, align 1, !tbaa !17
  %137 = zext i8 %136 to i64
  %138 = shl nuw nsw i64 %137, 24
  %139 = or i64 %134, %138
  %140 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 4
  %141 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !17
  %142 = zext i8 %141 to i64
  %143 = shl nuw nsw i64 %142, 32
  %144 = or i64 %139, %143
  %145 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 5
  %146 = load i8, i8 addrspace(4)* %145, align 1, !tbaa !17
  %147 = zext i8 %146 to i64
  %148 = shl nuw nsw i64 %147, 40
  %149 = or i64 %144, %148
  %150 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 6
  %151 = load i8, i8 addrspace(4)* %150, align 1, !tbaa !17
  %152 = zext i8 %151 to i64
  %153 = shl nuw nsw i64 %152, 48
  %154 = or i64 %149, %153
  %155 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 7
  %156 = load i8, i8 addrspace(4)* %155, align 1, !tbaa !17
  %157 = zext i8 %156 to i64
  %158 = shl nuw i64 %157, 56
  %159 = or i64 %154, %158
  %160 = add nsw i32 %117, -8
  %161 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 8
  br label %175

162:                                              ; preds = %120, %162
  %163 = phi i32 [ %173, %162 ], [ 0, %120 ]
  %164 = phi i64 [ %172, %162 ], [ 0, %120 ]
  %165 = zext i32 %163 to i64
  %166 = getelementptr inbounds i8, i8 addrspace(4)* %116, i64 %165
  %167 = load i8, i8 addrspace(4)* %166, align 1, !tbaa !17
  %168 = zext i8 %167 to i64
  %169 = shl i32 %163, 3
  %170 = zext i32 %169 to i64
  %171 = shl nuw i64 %168, %170
  %172 = or i64 %171, %164
  %173 = add nuw nsw i32 %163, 1
  %174 = icmp eq i32 %173, %117
  br i1 %174, label %175, label %162

175:                                              ; preds = %162, %122, %120
  %176 = phi i8 addrspace(4)* [ %161, %122 ], [ %116, %120 ], [ %116, %162 ]
  %177 = phi i32 [ %160, %122 ], [ 0, %120 ], [ 0, %162 ]
  %178 = phi i64 [ %159, %122 ], [ 0, %120 ], [ %172, %162 ]
  %179 = icmp ugt i32 %177, 7
  br i1 %179, label %182, label %180

180:                                              ; preds = %175
  %181 = icmp eq i32 %177, 0
  br i1 %181, label %235, label %222

182:                                              ; preds = %175
  %183 = load i8, i8 addrspace(4)* %176, align 1, !tbaa !17
  %184 = zext i8 %183 to i64
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 1
  %186 = load i8, i8 addrspace(4)* %185, align 1, !tbaa !17
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 8
  %189 = or i64 %188, %184
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 2
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !17
  %192 = zext i8 %191 to i64
  %193 = shl nuw nsw i64 %192, 16
  %194 = or i64 %189, %193
  %195 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 3
  %196 = load i8, i8 addrspace(4)* %195, align 1, !tbaa !17
  %197 = zext i8 %196 to i64
  %198 = shl nuw nsw i64 %197, 24
  %199 = or i64 %194, %198
  %200 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 4
  %201 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !17
  %202 = zext i8 %201 to i64
  %203 = shl nuw nsw i64 %202, 32
  %204 = or i64 %199, %203
  %205 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 5
  %206 = load i8, i8 addrspace(4)* %205, align 1, !tbaa !17
  %207 = zext i8 %206 to i64
  %208 = shl nuw nsw i64 %207, 40
  %209 = or i64 %204, %208
  %210 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 6
  %211 = load i8, i8 addrspace(4)* %210, align 1, !tbaa !17
  %212 = zext i8 %211 to i64
  %213 = shl nuw nsw i64 %212, 48
  %214 = or i64 %209, %213
  %215 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 7
  %216 = load i8, i8 addrspace(4)* %215, align 1, !tbaa !17
  %217 = zext i8 %216 to i64
  %218 = shl nuw i64 %217, 56
  %219 = or i64 %214, %218
  %220 = add nsw i32 %177, -8
  %221 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 8
  br label %235

222:                                              ; preds = %180, %222
  %223 = phi i32 [ %233, %222 ], [ 0, %180 ]
  %224 = phi i64 [ %232, %222 ], [ 0, %180 ]
  %225 = zext i32 %223 to i64
  %226 = getelementptr inbounds i8, i8 addrspace(4)* %176, i64 %225
  %227 = load i8, i8 addrspace(4)* %226, align 1, !tbaa !17
  %228 = zext i8 %227 to i64
  %229 = shl i32 %223, 3
  %230 = zext i32 %229 to i64
  %231 = shl nuw i64 %228, %230
  %232 = or i64 %231, %224
  %233 = add nuw nsw i32 %223, 1
  %234 = icmp eq i32 %233, %177
  br i1 %234, label %235, label %222

235:                                              ; preds = %222, %182, %180
  %236 = phi i8 addrspace(4)* [ %221, %182 ], [ %176, %180 ], [ %176, %222 ]
  %237 = phi i32 [ %220, %182 ], [ 0, %180 ], [ 0, %222 ]
  %238 = phi i64 [ %219, %182 ], [ 0, %180 ], [ %232, %222 ]
  %239 = icmp ugt i32 %237, 7
  br i1 %239, label %242, label %240

240:                                              ; preds = %235
  %241 = icmp eq i32 %237, 0
  br i1 %241, label %295, label %282

242:                                              ; preds = %235
  %243 = load i8, i8 addrspace(4)* %236, align 1, !tbaa !17
  %244 = zext i8 %243 to i64
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 1
  %246 = load i8, i8 addrspace(4)* %245, align 1, !tbaa !17
  %247 = zext i8 %246 to i64
  %248 = shl nuw nsw i64 %247, 8
  %249 = or i64 %248, %244
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 2
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !17
  %252 = zext i8 %251 to i64
  %253 = shl nuw nsw i64 %252, 16
  %254 = or i64 %249, %253
  %255 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 3
  %256 = load i8, i8 addrspace(4)* %255, align 1, !tbaa !17
  %257 = zext i8 %256 to i64
  %258 = shl nuw nsw i64 %257, 24
  %259 = or i64 %254, %258
  %260 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 4
  %261 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !17
  %262 = zext i8 %261 to i64
  %263 = shl nuw nsw i64 %262, 32
  %264 = or i64 %259, %263
  %265 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 5
  %266 = load i8, i8 addrspace(4)* %265, align 1, !tbaa !17
  %267 = zext i8 %266 to i64
  %268 = shl nuw nsw i64 %267, 40
  %269 = or i64 %264, %268
  %270 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 6
  %271 = load i8, i8 addrspace(4)* %270, align 1, !tbaa !17
  %272 = zext i8 %271 to i64
  %273 = shl nuw nsw i64 %272, 48
  %274 = or i64 %269, %273
  %275 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 7
  %276 = load i8, i8 addrspace(4)* %275, align 1, !tbaa !17
  %277 = zext i8 %276 to i64
  %278 = shl nuw i64 %277, 56
  %279 = or i64 %274, %278
  %280 = add nsw i32 %237, -8
  %281 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 8
  br label %295

282:                                              ; preds = %240, %282
  %283 = phi i32 [ %293, %282 ], [ 0, %240 ]
  %284 = phi i64 [ %292, %282 ], [ 0, %240 ]
  %285 = zext i32 %283 to i64
  %286 = getelementptr inbounds i8, i8 addrspace(4)* %236, i64 %285
  %287 = load i8, i8 addrspace(4)* %286, align 1, !tbaa !17
  %288 = zext i8 %287 to i64
  %289 = shl i32 %283, 3
  %290 = zext i32 %289 to i64
  %291 = shl nuw i64 %288, %290
  %292 = or i64 %291, %284
  %293 = add nuw nsw i32 %283, 1
  %294 = icmp eq i32 %293, %237
  br i1 %294, label %295, label %282

295:                                              ; preds = %282, %242, %240
  %296 = phi i8 addrspace(4)* [ %281, %242 ], [ %236, %240 ], [ %236, %282 ]
  %297 = phi i32 [ %280, %242 ], [ 0, %240 ], [ 0, %282 ]
  %298 = phi i64 [ %279, %242 ], [ 0, %240 ], [ %292, %282 ]
  %299 = icmp ugt i32 %297, 7
  br i1 %299, label %302, label %300

300:                                              ; preds = %295
  %301 = icmp eq i32 %297, 0
  br i1 %301, label %355, label %342

302:                                              ; preds = %295
  %303 = load i8, i8 addrspace(4)* %296, align 1, !tbaa !17
  %304 = zext i8 %303 to i64
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 1
  %306 = load i8, i8 addrspace(4)* %305, align 1, !tbaa !17
  %307 = zext i8 %306 to i64
  %308 = shl nuw nsw i64 %307, 8
  %309 = or i64 %308, %304
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 2
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !17
  %312 = zext i8 %311 to i64
  %313 = shl nuw nsw i64 %312, 16
  %314 = or i64 %309, %313
  %315 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 3
  %316 = load i8, i8 addrspace(4)* %315, align 1, !tbaa !17
  %317 = zext i8 %316 to i64
  %318 = shl nuw nsw i64 %317, 24
  %319 = or i64 %314, %318
  %320 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 4
  %321 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !17
  %322 = zext i8 %321 to i64
  %323 = shl nuw nsw i64 %322, 32
  %324 = or i64 %319, %323
  %325 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 5
  %326 = load i8, i8 addrspace(4)* %325, align 1, !tbaa !17
  %327 = zext i8 %326 to i64
  %328 = shl nuw nsw i64 %327, 40
  %329 = or i64 %324, %328
  %330 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 6
  %331 = load i8, i8 addrspace(4)* %330, align 1, !tbaa !17
  %332 = zext i8 %331 to i64
  %333 = shl nuw nsw i64 %332, 48
  %334 = or i64 %329, %333
  %335 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 7
  %336 = load i8, i8 addrspace(4)* %335, align 1, !tbaa !17
  %337 = zext i8 %336 to i64
  %338 = shl nuw i64 %337, 56
  %339 = or i64 %334, %338
  %340 = add nsw i32 %297, -8
  %341 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 8
  br label %355

342:                                              ; preds = %300, %342
  %343 = phi i32 [ %353, %342 ], [ 0, %300 ]
  %344 = phi i64 [ %352, %342 ], [ 0, %300 ]
  %345 = zext i32 %343 to i64
  %346 = getelementptr inbounds i8, i8 addrspace(4)* %296, i64 %345
  %347 = load i8, i8 addrspace(4)* %346, align 1, !tbaa !17
  %348 = zext i8 %347 to i64
  %349 = shl i32 %343, 3
  %350 = zext i32 %349 to i64
  %351 = shl nuw i64 %348, %350
  %352 = or i64 %351, %344
  %353 = add nuw nsw i32 %343, 1
  %354 = icmp eq i32 %353, %297
  br i1 %354, label %355, label %342

355:                                              ; preds = %342, %302, %300
  %356 = phi i8 addrspace(4)* [ %341, %302 ], [ %296, %300 ], [ %296, %342 ]
  %357 = phi i32 [ %340, %302 ], [ 0, %300 ], [ 0, %342 ]
  %358 = phi i64 [ %339, %302 ], [ 0, %300 ], [ %352, %342 ]
  %359 = icmp ugt i32 %357, 7
  br i1 %359, label %362, label %360

360:                                              ; preds = %355
  %361 = icmp eq i32 %357, 0
  br i1 %361, label %415, label %402

362:                                              ; preds = %355
  %363 = load i8, i8 addrspace(4)* %356, align 1, !tbaa !17
  %364 = zext i8 %363 to i64
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 1
  %366 = load i8, i8 addrspace(4)* %365, align 1, !tbaa !17
  %367 = zext i8 %366 to i64
  %368 = shl nuw nsw i64 %367, 8
  %369 = or i64 %368, %364
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 2
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !17
  %372 = zext i8 %371 to i64
  %373 = shl nuw nsw i64 %372, 16
  %374 = or i64 %369, %373
  %375 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 3
  %376 = load i8, i8 addrspace(4)* %375, align 1, !tbaa !17
  %377 = zext i8 %376 to i64
  %378 = shl nuw nsw i64 %377, 24
  %379 = or i64 %374, %378
  %380 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 4
  %381 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !17
  %382 = zext i8 %381 to i64
  %383 = shl nuw nsw i64 %382, 32
  %384 = or i64 %379, %383
  %385 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 5
  %386 = load i8, i8 addrspace(4)* %385, align 1, !tbaa !17
  %387 = zext i8 %386 to i64
  %388 = shl nuw nsw i64 %387, 40
  %389 = or i64 %384, %388
  %390 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 6
  %391 = load i8, i8 addrspace(4)* %390, align 1, !tbaa !17
  %392 = zext i8 %391 to i64
  %393 = shl nuw nsw i64 %392, 48
  %394 = or i64 %389, %393
  %395 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 7
  %396 = load i8, i8 addrspace(4)* %395, align 1, !tbaa !17
  %397 = zext i8 %396 to i64
  %398 = shl nuw i64 %397, 56
  %399 = or i64 %394, %398
  %400 = add nsw i32 %357, -8
  %401 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 8
  br label %415

402:                                              ; preds = %360, %402
  %403 = phi i32 [ %413, %402 ], [ 0, %360 ]
  %404 = phi i64 [ %412, %402 ], [ 0, %360 ]
  %405 = zext i32 %403 to i64
  %406 = getelementptr inbounds i8, i8 addrspace(4)* %356, i64 %405
  %407 = load i8, i8 addrspace(4)* %406, align 1, !tbaa !17
  %408 = zext i8 %407 to i64
  %409 = shl i32 %403, 3
  %410 = zext i32 %409 to i64
  %411 = shl nuw i64 %408, %410
  %412 = or i64 %411, %404
  %413 = add nuw nsw i32 %403, 1
  %414 = icmp eq i32 %413, %357
  br i1 %414, label %415, label %402

415:                                              ; preds = %402, %362, %360
  %416 = phi i8 addrspace(4)* [ %401, %362 ], [ %356, %360 ], [ %356, %402 ]
  %417 = phi i32 [ %400, %362 ], [ 0, %360 ], [ 0, %402 ]
  %418 = phi i64 [ %399, %362 ], [ 0, %360 ], [ %412, %402 ]
  %419 = icmp ugt i32 %417, 7
  br i1 %419, label %422, label %420

420:                                              ; preds = %415
  %421 = icmp eq i32 %417, 0
  br i1 %421, label %473, label %460

422:                                              ; preds = %415
  %423 = load i8, i8 addrspace(4)* %416, align 1, !tbaa !17
  %424 = zext i8 %423 to i64
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 1
  %426 = load i8, i8 addrspace(4)* %425, align 1, !tbaa !17
  %427 = zext i8 %426 to i64
  %428 = shl nuw nsw i64 %427, 8
  %429 = or i64 %428, %424
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 2
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !17
  %432 = zext i8 %431 to i64
  %433 = shl nuw nsw i64 %432, 16
  %434 = or i64 %429, %433
  %435 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 3
  %436 = load i8, i8 addrspace(4)* %435, align 1, !tbaa !17
  %437 = zext i8 %436 to i64
  %438 = shl nuw nsw i64 %437, 24
  %439 = or i64 %434, %438
  %440 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 4
  %441 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !17
  %442 = zext i8 %441 to i64
  %443 = shl nuw nsw i64 %442, 32
  %444 = or i64 %439, %443
  %445 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 5
  %446 = load i8, i8 addrspace(4)* %445, align 1, !tbaa !17
  %447 = zext i8 %446 to i64
  %448 = shl nuw nsw i64 %447, 40
  %449 = or i64 %444, %448
  %450 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 6
  %451 = load i8, i8 addrspace(4)* %450, align 1, !tbaa !17
  %452 = zext i8 %451 to i64
  %453 = shl nuw nsw i64 %452, 48
  %454 = or i64 %449, %453
  %455 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 7
  %456 = load i8, i8 addrspace(4)* %455, align 1, !tbaa !17
  %457 = zext i8 %456 to i64
  %458 = shl nuw i64 %457, 56
  %459 = or i64 %454, %458
  br label %473

460:                                              ; preds = %420, %460
  %461 = phi i32 [ %471, %460 ], [ 0, %420 ]
  %462 = phi i64 [ %470, %460 ], [ 0, %420 ]
  %463 = zext i32 %461 to i64
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %416, i64 %463
  %465 = load i8, i8 addrspace(4)* %464, align 1, !tbaa !17
  %466 = zext i8 %465 to i64
  %467 = shl i32 %461, 3
  %468 = zext i32 %467 to i64
  %469 = shl nuw i64 %466, %468
  %470 = or i64 %469, %462
  %471 = add nuw nsw i32 %461, 1
  %472 = icmp eq i32 %471, %417
  br i1 %472, label %473, label %460

473:                                              ; preds = %460, %422, %420
  %474 = phi i64 [ %459, %422 ], [ 0, %420 ], [ %470, %460 ]
  %475 = shl nuw nsw i64 %56, 2
  %476 = add nuw nsw i64 %475, 28
  %477 = and i64 %476, 480
  %478 = and i64 %58, -225
  %479 = or i64 %478, %477
  %480 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %479, i64 noundef %118, i64 noundef %178, i64 noundef %238, i64 noundef %298, i64 noundef %358, i64 noundef %418, i64 noundef %474) #11
  %481 = sub i64 %48, %56
  %482 = getelementptr inbounds i8, i8 addrspace(4)* %49, i64 %56
  %483 = icmp eq i64 %481, 0
  br i1 %483, label %484, label %47

484:                                              ; preds = %473, %39
  %485 = phi <2 x i64> [ %42, %39 ], [ %480, %473 ]
  %486 = extractelement <2 x i64> %485, i64 0
  %487 = and i64 %486, -225
  %488 = or i64 %487, 32
  %489 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %488, i64 noundef %5, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %490 = extractelement <2 x i64> %489, i64 0
  %491 = bitcast double %18 to i64
  %492 = and i64 %490, -227
  %493 = or i64 %492, 34
  %494 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %493, i64 noundef %491, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %495 = icmp eq i32 %4, 0
  br i1 %495, label %496, label %959

496:                                              ; preds = %484
  %497 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @s_sum, i32 0, i32 0), align 4, !tbaa !5
  %498 = sitofp i32 %1 to float
  %499 = fdiv contract float %497, %498
  store float %499, float addrspace(1)* %2, align 4, !tbaa !5
  %500 = fpext float %499 to double
  %501 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %502 = extractelement <2 x i64> %501, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %503, label %507

503:                                              ; preds = %496
  %504 = and i64 %502, -225
  %505 = or i64 %504, 32
  %506 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %505, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %948

507:                                              ; preds = %496
  %508 = and i64 %502, 2
  %509 = and i64 %502, -3
  %510 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %509, i64 0
  br label %511

511:                                              ; preds = %937, %507
  %512 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 6) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([7 x i8]* addrspacecast ([7 x i8] addrspace(4)* @.str to [7 x i8]*) to i64)), i64 1))), %507 ], [ %945, %937 ]
  %513 = phi i8 addrspace(4)* [ getelementptr inbounds ([7 x i8], [7 x i8] addrspace(4)* @.str, i64 0, i64 0), %507 ], [ %946, %937 ]
  %514 = phi <2 x i64> [ %510, %507 ], [ %944, %937 ]
  %515 = icmp ugt i64 %512, 56
  %516 = extractelement <2 x i64> %514, i64 0
  %517 = or i64 %516, %508
  %518 = insertelement <2 x i64> poison, i64 %517, i64 0
  %519 = select i1 %515, <2 x i64> %514, <2 x i64> %518
  %520 = tail call i64 @llvm.umin.i64(i64 %512, i64 56)
  %521 = trunc i64 %520 to i32
  %522 = extractelement <2 x i64> %519, i64 0
  %523 = icmp ugt i32 %521, 7
  br i1 %523, label %526, label %524

524:                                              ; preds = %511
  %525 = icmp eq i32 %521, 0
  br i1 %525, label %579, label %566

526:                                              ; preds = %511
  %527 = load i8, i8 addrspace(4)* %513, align 1, !tbaa !17
  %528 = zext i8 %527 to i64
  %529 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 1
  %530 = load i8, i8 addrspace(4)* %529, align 1, !tbaa !17
  %531 = zext i8 %530 to i64
  %532 = shl nuw nsw i64 %531, 8
  %533 = or i64 %532, %528
  %534 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 2
  %535 = load i8, i8 addrspace(4)* %534, align 1, !tbaa !17
  %536 = zext i8 %535 to i64
  %537 = shl nuw nsw i64 %536, 16
  %538 = or i64 %533, %537
  %539 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 3
  %540 = load i8, i8 addrspace(4)* %539, align 1, !tbaa !17
  %541 = zext i8 %540 to i64
  %542 = shl nuw nsw i64 %541, 24
  %543 = or i64 %538, %542
  %544 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 4
  %545 = load i8, i8 addrspace(4)* %544, align 1, !tbaa !17
  %546 = zext i8 %545 to i64
  %547 = shl nuw nsw i64 %546, 32
  %548 = or i64 %543, %547
  %549 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 5
  %550 = load i8, i8 addrspace(4)* %549, align 1, !tbaa !17
  %551 = zext i8 %550 to i64
  %552 = shl nuw nsw i64 %551, 40
  %553 = or i64 %548, %552
  %554 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 6
  %555 = load i8, i8 addrspace(4)* %554, align 1, !tbaa !17
  %556 = zext i8 %555 to i64
  %557 = shl nuw nsw i64 %556, 48
  %558 = or i64 %553, %557
  %559 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 7
  %560 = load i8, i8 addrspace(4)* %559, align 1, !tbaa !17
  %561 = zext i8 %560 to i64
  %562 = shl nuw i64 %561, 56
  %563 = or i64 %558, %562
  %564 = add nsw i32 %521, -8
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 8
  br label %579

566:                                              ; preds = %524, %566
  %567 = phi i32 [ %577, %566 ], [ 0, %524 ]
  %568 = phi i64 [ %576, %566 ], [ 0, %524 ]
  %569 = zext i32 %567 to i64
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 %569
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !17
  %572 = zext i8 %571 to i64
  %573 = shl i32 %567, 3
  %574 = zext i32 %573 to i64
  %575 = shl nuw i64 %572, %574
  %576 = or i64 %575, %568
  %577 = add nuw nsw i32 %567, 1
  %578 = icmp eq i32 %577, %521
  br i1 %578, label %579, label %566, !llvm.loop !18

579:                                              ; preds = %566, %526, %524
  %580 = phi i8 addrspace(4)* [ %565, %526 ], [ %513, %524 ], [ %513, %566 ]
  %581 = phi i32 [ %564, %526 ], [ 0, %524 ], [ 0, %566 ]
  %582 = phi i64 [ %563, %526 ], [ 0, %524 ], [ %576, %566 ]
  %583 = icmp ugt i32 %581, 7
  br i1 %583, label %586, label %584

584:                                              ; preds = %579
  %585 = icmp eq i32 %581, 0
  br i1 %585, label %639, label %626

586:                                              ; preds = %579
  %587 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !17
  %588 = zext i8 %587 to i64
  %589 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 1
  %590 = load i8, i8 addrspace(4)* %589, align 1, !tbaa !17
  %591 = zext i8 %590 to i64
  %592 = shl nuw nsw i64 %591, 8
  %593 = or i64 %592, %588
  %594 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 2
  %595 = load i8, i8 addrspace(4)* %594, align 1, !tbaa !17
  %596 = zext i8 %595 to i64
  %597 = shl nuw nsw i64 %596, 16
  %598 = or i64 %593, %597
  %599 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 3
  %600 = load i8, i8 addrspace(4)* %599, align 1, !tbaa !17
  %601 = zext i8 %600 to i64
  %602 = shl nuw nsw i64 %601, 24
  %603 = or i64 %598, %602
  %604 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 4
  %605 = load i8, i8 addrspace(4)* %604, align 1, !tbaa !17
  %606 = zext i8 %605 to i64
  %607 = shl nuw nsw i64 %606, 32
  %608 = or i64 %603, %607
  %609 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 5
  %610 = load i8, i8 addrspace(4)* %609, align 1, !tbaa !17
  %611 = zext i8 %610 to i64
  %612 = shl nuw nsw i64 %611, 40
  %613 = or i64 %608, %612
  %614 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 6
  %615 = load i8, i8 addrspace(4)* %614, align 1, !tbaa !17
  %616 = zext i8 %615 to i64
  %617 = shl nuw nsw i64 %616, 48
  %618 = or i64 %613, %617
  %619 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 7
  %620 = load i8, i8 addrspace(4)* %619, align 1, !tbaa !17
  %621 = zext i8 %620 to i64
  %622 = shl nuw i64 %621, 56
  %623 = or i64 %618, %622
  %624 = add nsw i32 %581, -8
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 8
  br label %639

626:                                              ; preds = %584, %626
  %627 = phi i32 [ %637, %626 ], [ 0, %584 ]
  %628 = phi i64 [ %636, %626 ], [ 0, %584 ]
  %629 = zext i32 %627 to i64
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %580, i64 %629
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !17
  %632 = zext i8 %631 to i64
  %633 = shl i32 %627, 3
  %634 = zext i32 %633 to i64
  %635 = shl nuw i64 %632, %634
  %636 = or i64 %635, %628
  %637 = add nuw nsw i32 %627, 1
  %638 = icmp eq i32 %637, %581
  br i1 %638, label %639, label %626

639:                                              ; preds = %626, %586, %584
  %640 = phi i8 addrspace(4)* [ %625, %586 ], [ %580, %584 ], [ %580, %626 ]
  %641 = phi i32 [ %624, %586 ], [ 0, %584 ], [ 0, %626 ]
  %642 = phi i64 [ %623, %586 ], [ 0, %584 ], [ %636, %626 ]
  %643 = icmp ugt i32 %641, 7
  br i1 %643, label %646, label %644

644:                                              ; preds = %639
  %645 = icmp eq i32 %641, 0
  br i1 %645, label %699, label %686

646:                                              ; preds = %639
  %647 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !17
  %648 = zext i8 %647 to i64
  %649 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 1
  %650 = load i8, i8 addrspace(4)* %649, align 1, !tbaa !17
  %651 = zext i8 %650 to i64
  %652 = shl nuw nsw i64 %651, 8
  %653 = or i64 %652, %648
  %654 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 2
  %655 = load i8, i8 addrspace(4)* %654, align 1, !tbaa !17
  %656 = zext i8 %655 to i64
  %657 = shl nuw nsw i64 %656, 16
  %658 = or i64 %653, %657
  %659 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 3
  %660 = load i8, i8 addrspace(4)* %659, align 1, !tbaa !17
  %661 = zext i8 %660 to i64
  %662 = shl nuw nsw i64 %661, 24
  %663 = or i64 %658, %662
  %664 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 4
  %665 = load i8, i8 addrspace(4)* %664, align 1, !tbaa !17
  %666 = zext i8 %665 to i64
  %667 = shl nuw nsw i64 %666, 32
  %668 = or i64 %663, %667
  %669 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 5
  %670 = load i8, i8 addrspace(4)* %669, align 1, !tbaa !17
  %671 = zext i8 %670 to i64
  %672 = shl nuw nsw i64 %671, 40
  %673 = or i64 %668, %672
  %674 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 6
  %675 = load i8, i8 addrspace(4)* %674, align 1, !tbaa !17
  %676 = zext i8 %675 to i64
  %677 = shl nuw nsw i64 %676, 48
  %678 = or i64 %673, %677
  %679 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 7
  %680 = load i8, i8 addrspace(4)* %679, align 1, !tbaa !17
  %681 = zext i8 %680 to i64
  %682 = shl nuw i64 %681, 56
  %683 = or i64 %678, %682
  %684 = add nsw i32 %641, -8
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 8
  br label %699

686:                                              ; preds = %644, %686
  %687 = phi i32 [ %697, %686 ], [ 0, %644 ]
  %688 = phi i64 [ %696, %686 ], [ 0, %644 ]
  %689 = zext i32 %687 to i64
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %640, i64 %689
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !17
  %692 = zext i8 %691 to i64
  %693 = shl i32 %687, 3
  %694 = zext i32 %693 to i64
  %695 = shl nuw i64 %692, %694
  %696 = or i64 %695, %688
  %697 = add nuw nsw i32 %687, 1
  %698 = icmp eq i32 %697, %641
  br i1 %698, label %699, label %686

699:                                              ; preds = %686, %646, %644
  %700 = phi i8 addrspace(4)* [ %685, %646 ], [ %640, %644 ], [ %640, %686 ]
  %701 = phi i32 [ %684, %646 ], [ 0, %644 ], [ 0, %686 ]
  %702 = phi i64 [ %683, %646 ], [ 0, %644 ], [ %696, %686 ]
  %703 = icmp ugt i32 %701, 7
  br i1 %703, label %706, label %704

704:                                              ; preds = %699
  %705 = icmp eq i32 %701, 0
  br i1 %705, label %759, label %746

706:                                              ; preds = %699
  %707 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !17
  %708 = zext i8 %707 to i64
  %709 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 1
  %710 = load i8, i8 addrspace(4)* %709, align 1, !tbaa !17
  %711 = zext i8 %710 to i64
  %712 = shl nuw nsw i64 %711, 8
  %713 = or i64 %712, %708
  %714 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 2
  %715 = load i8, i8 addrspace(4)* %714, align 1, !tbaa !17
  %716 = zext i8 %715 to i64
  %717 = shl nuw nsw i64 %716, 16
  %718 = or i64 %713, %717
  %719 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 3
  %720 = load i8, i8 addrspace(4)* %719, align 1, !tbaa !17
  %721 = zext i8 %720 to i64
  %722 = shl nuw nsw i64 %721, 24
  %723 = or i64 %718, %722
  %724 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 4
  %725 = load i8, i8 addrspace(4)* %724, align 1, !tbaa !17
  %726 = zext i8 %725 to i64
  %727 = shl nuw nsw i64 %726, 32
  %728 = or i64 %723, %727
  %729 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 5
  %730 = load i8, i8 addrspace(4)* %729, align 1, !tbaa !17
  %731 = zext i8 %730 to i64
  %732 = shl nuw nsw i64 %731, 40
  %733 = or i64 %728, %732
  %734 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 6
  %735 = load i8, i8 addrspace(4)* %734, align 1, !tbaa !17
  %736 = zext i8 %735 to i64
  %737 = shl nuw nsw i64 %736, 48
  %738 = or i64 %733, %737
  %739 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 7
  %740 = load i8, i8 addrspace(4)* %739, align 1, !tbaa !17
  %741 = zext i8 %740 to i64
  %742 = shl nuw i64 %741, 56
  %743 = or i64 %738, %742
  %744 = add nsw i32 %701, -8
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 8
  br label %759

746:                                              ; preds = %704, %746
  %747 = phi i32 [ %757, %746 ], [ 0, %704 ]
  %748 = phi i64 [ %756, %746 ], [ 0, %704 ]
  %749 = zext i32 %747 to i64
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %700, i64 %749
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !17
  %752 = zext i8 %751 to i64
  %753 = shl i32 %747, 3
  %754 = zext i32 %753 to i64
  %755 = shl nuw i64 %752, %754
  %756 = or i64 %755, %748
  %757 = add nuw nsw i32 %747, 1
  %758 = icmp eq i32 %757, %701
  br i1 %758, label %759, label %746

759:                                              ; preds = %746, %706, %704
  %760 = phi i8 addrspace(4)* [ %745, %706 ], [ %700, %704 ], [ %700, %746 ]
  %761 = phi i32 [ %744, %706 ], [ 0, %704 ], [ 0, %746 ]
  %762 = phi i64 [ %743, %706 ], [ 0, %704 ], [ %756, %746 ]
  %763 = icmp ugt i32 %761, 7
  br i1 %763, label %766, label %764

764:                                              ; preds = %759
  %765 = icmp eq i32 %761, 0
  br i1 %765, label %819, label %806

766:                                              ; preds = %759
  %767 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !17
  %768 = zext i8 %767 to i64
  %769 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 1
  %770 = load i8, i8 addrspace(4)* %769, align 1, !tbaa !17
  %771 = zext i8 %770 to i64
  %772 = shl nuw nsw i64 %771, 8
  %773 = or i64 %772, %768
  %774 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 2
  %775 = load i8, i8 addrspace(4)* %774, align 1, !tbaa !17
  %776 = zext i8 %775 to i64
  %777 = shl nuw nsw i64 %776, 16
  %778 = or i64 %773, %777
  %779 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 3
  %780 = load i8, i8 addrspace(4)* %779, align 1, !tbaa !17
  %781 = zext i8 %780 to i64
  %782 = shl nuw nsw i64 %781, 24
  %783 = or i64 %778, %782
  %784 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 4
  %785 = load i8, i8 addrspace(4)* %784, align 1, !tbaa !17
  %786 = zext i8 %785 to i64
  %787 = shl nuw nsw i64 %786, 32
  %788 = or i64 %783, %787
  %789 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 5
  %790 = load i8, i8 addrspace(4)* %789, align 1, !tbaa !17
  %791 = zext i8 %790 to i64
  %792 = shl nuw nsw i64 %791, 40
  %793 = or i64 %788, %792
  %794 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 6
  %795 = load i8, i8 addrspace(4)* %794, align 1, !tbaa !17
  %796 = zext i8 %795 to i64
  %797 = shl nuw nsw i64 %796, 48
  %798 = or i64 %793, %797
  %799 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 7
  %800 = load i8, i8 addrspace(4)* %799, align 1, !tbaa !17
  %801 = zext i8 %800 to i64
  %802 = shl nuw i64 %801, 56
  %803 = or i64 %798, %802
  %804 = add nsw i32 %761, -8
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 8
  br label %819

806:                                              ; preds = %764, %806
  %807 = phi i32 [ %817, %806 ], [ 0, %764 ]
  %808 = phi i64 [ %816, %806 ], [ 0, %764 ]
  %809 = zext i32 %807 to i64
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %760, i64 %809
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !17
  %812 = zext i8 %811 to i64
  %813 = shl i32 %807, 3
  %814 = zext i32 %813 to i64
  %815 = shl nuw i64 %812, %814
  %816 = or i64 %815, %808
  %817 = add nuw nsw i32 %807, 1
  %818 = icmp eq i32 %817, %761
  br i1 %818, label %819, label %806

819:                                              ; preds = %806, %766, %764
  %820 = phi i8 addrspace(4)* [ %805, %766 ], [ %760, %764 ], [ %760, %806 ]
  %821 = phi i32 [ %804, %766 ], [ 0, %764 ], [ 0, %806 ]
  %822 = phi i64 [ %803, %766 ], [ 0, %764 ], [ %816, %806 ]
  %823 = icmp ugt i32 %821, 7
  br i1 %823, label %826, label %824

824:                                              ; preds = %819
  %825 = icmp eq i32 %821, 0
  br i1 %825, label %879, label %866

826:                                              ; preds = %819
  %827 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !17
  %828 = zext i8 %827 to i64
  %829 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 1
  %830 = load i8, i8 addrspace(4)* %829, align 1, !tbaa !17
  %831 = zext i8 %830 to i64
  %832 = shl nuw nsw i64 %831, 8
  %833 = or i64 %832, %828
  %834 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 2
  %835 = load i8, i8 addrspace(4)* %834, align 1, !tbaa !17
  %836 = zext i8 %835 to i64
  %837 = shl nuw nsw i64 %836, 16
  %838 = or i64 %833, %837
  %839 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 3
  %840 = load i8, i8 addrspace(4)* %839, align 1, !tbaa !17
  %841 = zext i8 %840 to i64
  %842 = shl nuw nsw i64 %841, 24
  %843 = or i64 %838, %842
  %844 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 4
  %845 = load i8, i8 addrspace(4)* %844, align 1, !tbaa !17
  %846 = zext i8 %845 to i64
  %847 = shl nuw nsw i64 %846, 32
  %848 = or i64 %843, %847
  %849 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 5
  %850 = load i8, i8 addrspace(4)* %849, align 1, !tbaa !17
  %851 = zext i8 %850 to i64
  %852 = shl nuw nsw i64 %851, 40
  %853 = or i64 %848, %852
  %854 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 6
  %855 = load i8, i8 addrspace(4)* %854, align 1, !tbaa !17
  %856 = zext i8 %855 to i64
  %857 = shl nuw nsw i64 %856, 48
  %858 = or i64 %853, %857
  %859 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 7
  %860 = load i8, i8 addrspace(4)* %859, align 1, !tbaa !17
  %861 = zext i8 %860 to i64
  %862 = shl nuw i64 %861, 56
  %863 = or i64 %858, %862
  %864 = add nsw i32 %821, -8
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 8
  br label %879

866:                                              ; preds = %824, %866
  %867 = phi i32 [ %877, %866 ], [ 0, %824 ]
  %868 = phi i64 [ %876, %866 ], [ 0, %824 ]
  %869 = zext i32 %867 to i64
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %820, i64 %869
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !17
  %872 = zext i8 %871 to i64
  %873 = shl i32 %867, 3
  %874 = zext i32 %873 to i64
  %875 = shl nuw i64 %872, %874
  %876 = or i64 %875, %868
  %877 = add nuw nsw i32 %867, 1
  %878 = icmp eq i32 %877, %821
  br i1 %878, label %879, label %866

879:                                              ; preds = %866, %826, %824
  %880 = phi i8 addrspace(4)* [ %865, %826 ], [ %820, %824 ], [ %820, %866 ]
  %881 = phi i32 [ %864, %826 ], [ 0, %824 ], [ 0, %866 ]
  %882 = phi i64 [ %863, %826 ], [ 0, %824 ], [ %876, %866 ]
  %883 = icmp ugt i32 %881, 7
  br i1 %883, label %886, label %884

884:                                              ; preds = %879
  %885 = icmp eq i32 %881, 0
  br i1 %885, label %937, label %924

886:                                              ; preds = %879
  %887 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !17
  %888 = zext i8 %887 to i64
  %889 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 1
  %890 = load i8, i8 addrspace(4)* %889, align 1, !tbaa !17
  %891 = zext i8 %890 to i64
  %892 = shl nuw nsw i64 %891, 8
  %893 = or i64 %892, %888
  %894 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 2
  %895 = load i8, i8 addrspace(4)* %894, align 1, !tbaa !17
  %896 = zext i8 %895 to i64
  %897 = shl nuw nsw i64 %896, 16
  %898 = or i64 %893, %897
  %899 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 3
  %900 = load i8, i8 addrspace(4)* %899, align 1, !tbaa !17
  %901 = zext i8 %900 to i64
  %902 = shl nuw nsw i64 %901, 24
  %903 = or i64 %898, %902
  %904 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 4
  %905 = load i8, i8 addrspace(4)* %904, align 1, !tbaa !17
  %906 = zext i8 %905 to i64
  %907 = shl nuw nsw i64 %906, 32
  %908 = or i64 %903, %907
  %909 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 5
  %910 = load i8, i8 addrspace(4)* %909, align 1, !tbaa !17
  %911 = zext i8 %910 to i64
  %912 = shl nuw nsw i64 %911, 40
  %913 = or i64 %908, %912
  %914 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 6
  %915 = load i8, i8 addrspace(4)* %914, align 1, !tbaa !17
  %916 = zext i8 %915 to i64
  %917 = shl nuw nsw i64 %916, 48
  %918 = or i64 %913, %917
  %919 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 7
  %920 = load i8, i8 addrspace(4)* %919, align 1, !tbaa !17
  %921 = zext i8 %920 to i64
  %922 = shl nuw i64 %921, 56
  %923 = or i64 %918, %922
  br label %937

924:                                              ; preds = %884, %924
  %925 = phi i32 [ %935, %924 ], [ 0, %884 ]
  %926 = phi i64 [ %934, %924 ], [ 0, %884 ]
  %927 = zext i32 %925 to i64
  %928 = getelementptr inbounds i8, i8 addrspace(4)* %880, i64 %927
  %929 = load i8, i8 addrspace(4)* %928, align 1, !tbaa !17
  %930 = zext i8 %929 to i64
  %931 = shl i32 %925, 3
  %932 = zext i32 %931 to i64
  %933 = shl nuw i64 %930, %932
  %934 = or i64 %933, %926
  %935 = add nuw nsw i32 %925, 1
  %936 = icmp eq i32 %935, %881
  br i1 %936, label %937, label %924

937:                                              ; preds = %924, %886, %884
  %938 = phi i64 [ %923, %886 ], [ 0, %884 ], [ %934, %924 ]
  %939 = shl nuw nsw i64 %520, 2
  %940 = add nuw nsw i64 %939, 28
  %941 = and i64 %940, 480
  %942 = and i64 %522, -225
  %943 = or i64 %942, %941
  %944 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %943, i64 noundef %582, i64 noundef %642, i64 noundef %702, i64 noundef %762, i64 noundef %822, i64 noundef %882, i64 noundef %938) #11
  %945 = sub i64 %512, %520
  %946 = getelementptr inbounds i8, i8 addrspace(4)* %513, i64 %520
  %947 = icmp eq i64 %945, 0
  br i1 %947, label %948, label %511

948:                                              ; preds = %937, %503
  %949 = phi <2 x i64> [ %506, %503 ], [ %944, %937 ]
  %950 = extractelement <2 x i64> %949, i64 0
  %951 = and i64 %950, -225
  %952 = or i64 %951, 32
  %953 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %952, i64 noundef %5, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %954 = extractelement <2 x i64> %953, i64 0
  %955 = bitcast double %500 to i64
  %956 = and i64 %954, -227
  %957 = or i64 %956, 34
  %958 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %24, i64 noundef %957, i64 noundef %955, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %959

959:                                              ; preds = %948, %484
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !20
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !22
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !11
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !11
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !11
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !11
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !11
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !11
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !11
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !11
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #7
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !11
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #7
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !28
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %110 = call i64 @llvm.read_register.i64(metadata !30) #12
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !11
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !11
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !11
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !11
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !11
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !11
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !11
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !11
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !11
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !11
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.mustprogress"}
!17 = !{!13, !13, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !13, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !13, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!27 = !{!"hsa_signal_s", !12, i64 0}
!28 = !{!26, !12, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !12, i64 0, !12, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !12, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !12, i64 0}
!36 = !{!37, !12, i64 16}
!37 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !23, i64 24, !23, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!38 = !{!37, !23, i64 24}
