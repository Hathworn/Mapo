; ModuleID = '../data/hip_kernels/9800/8/main.cu'
source_filename = "../data/hip_kernels/9800/8/main.cu"
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

@_ZZ21scan_large_sum_kernelPjS_S_S_S_S_jjjE17shared_prefix_sum = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16
@.str = private unnamed_addr addrspace(4) constant [89 x i8] c"pass=%d,input[mid]=%d,mid=%d, blockIdx.x=%d, histogram[0]=%d, shared_prefix_sum[tid]=%d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z21scan_large_sum_kernelPjS_S_S_S_S_jjj(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 addrspace(1)* nocapture readnone %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture readnone %4, i32 addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #1 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = add i32 %17, %10
  %19 = icmp ult i32 %18, %8
  br i1 %19, label %20, label %28

20:                                               ; preds = %9
  %21 = zext i32 %11 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !6
  %24 = zext i32 %18 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  %27 = add i32 %26, %23
  br label %28

28:                                               ; preds = %9, %20
  %29 = phi i32 [ %27, %20 ], [ 1, %9 ]
  %30 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ21scan_large_sum_kernelPjS_S_S_S_S_jjjE17shared_prefix_sum, i32 0, i32 %10
  store i32 %29, i32 addrspace(3)* %30, align 4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %31, label %534

31:                                               ; preds = %28
  %32 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !7
  %33 = zext i32 %18 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = shl nuw i32 1, %6
  %37 = and i32 %35, %36
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %43, label %39

39:                                               ; preds = %31
  %40 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = sub i32 %18, %32
  %42 = add i32 %41, %40
  br label %43

43:                                               ; preds = %39, %31
  %44 = phi i32 [ %42, %39 ], [ %32, %31 ]
  %45 = icmp ult i32 %44, %8
  br i1 %45, label %532, label %46

46:                                               ; preds = %43
  %47 = load i32, i32 addrspace(1)* %5, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %49 = getelementptr inbounds i8, i8 addrspace(4)* %48, i64 24
  %50 = bitcast i8 addrspace(4)* %49 to i64 addrspace(4)*
  %51 = load i64, i64 addrspace(4)* %50, align 8, !tbaa !11
  %52 = inttoptr i64 %51 to i8 addrspace(1)*
  %53 = addrspacecast i8 addrspace(1)* %52 to i8*
  %54 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %55 = extractelement <2 x i64> %54, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([89 x i8], [89 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %56, label %60

56:                                               ; preds = %46
  %57 = and i64 %55, -225
  %58 = or i64 %57, 32
  %59 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %58, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %501

60:                                               ; preds = %46
  %61 = and i64 %55, 2
  %62 = and i64 %55, -3
  %63 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %62, i64 0
  br label %64

64:                                               ; preds = %490, %60
  %65 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([89 x i8], [89 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([89 x i8], [89 x i8] addrspace(4)* @.str, i64 0, i64 88) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([89 x i8]* addrspacecast ([89 x i8] addrspace(4)* @.str to [89 x i8]*) to i64)), i64 1))), %60 ], [ %498, %490 ]
  %66 = phi i8 addrspace(4)* [ getelementptr inbounds ([89 x i8], [89 x i8] addrspace(4)* @.str, i64 0, i64 0), %60 ], [ %499, %490 ]
  %67 = phi <2 x i64> [ %63, %60 ], [ %497, %490 ]
  %68 = icmp ugt i64 %65, 56
  %69 = extractelement <2 x i64> %67, i64 0
  %70 = or i64 %69, %61
  %71 = insertelement <2 x i64> poison, i64 %70, i64 0
  %72 = select i1 %68, <2 x i64> %67, <2 x i64> %71
  %73 = tail call i64 @llvm.umin.i64(i64 %65, i64 56)
  %74 = trunc i64 %73 to i32
  %75 = extractelement <2 x i64> %72, i64 0
  %76 = icmp ugt i32 %74, 7
  br i1 %76, label %79, label %77

77:                                               ; preds = %64
  %78 = icmp eq i32 %74, 0
  br i1 %78, label %132, label %119

79:                                               ; preds = %64
  %80 = load i8, i8 addrspace(4)* %66, align 1, !tbaa !15
  %81 = zext i8 %80 to i64
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 1
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !15
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 8
  %86 = or i64 %85, %81
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 2
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !15
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 16
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 3
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !15
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 24
  %96 = or i64 %91, %95
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 4
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !15
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 32
  %101 = or i64 %96, %100
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 5
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !15
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 40
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 6
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !15
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 48
  %111 = or i64 %106, %110
  %112 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 7
  %113 = load i8, i8 addrspace(4)* %112, align 1, !tbaa !15
  %114 = zext i8 %113 to i64
  %115 = shl nuw i64 %114, 56
  %116 = or i64 %111, %115
  %117 = add nsw i32 %74, -8
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 8
  br label %132

119:                                              ; preds = %77, %119
  %120 = phi i32 [ %130, %119 ], [ 0, %77 ]
  %121 = phi i64 [ %129, %119 ], [ 0, %77 ]
  %122 = zext i32 %120 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 %122
  %124 = load i8, i8 addrspace(4)* %123, align 1, !tbaa !15
  %125 = zext i8 %124 to i64
  %126 = shl i32 %120, 3
  %127 = zext i32 %126 to i64
  %128 = shl nuw i64 %125, %127
  %129 = or i64 %128, %121
  %130 = add nuw nsw i32 %120, 1
  %131 = icmp eq i32 %130, %74
  br i1 %131, label %132, label %119, !llvm.loop !16

132:                                              ; preds = %119, %79, %77
  %133 = phi i8 addrspace(4)* [ %118, %79 ], [ %66, %77 ], [ %66, %119 ]
  %134 = phi i32 [ %117, %79 ], [ 0, %77 ], [ 0, %119 ]
  %135 = phi i64 [ %116, %79 ], [ 0, %77 ], [ %129, %119 ]
  %136 = icmp ugt i32 %134, 7
  br i1 %136, label %139, label %137

137:                                              ; preds = %132
  %138 = icmp eq i32 %134, 0
  br i1 %138, label %192, label %179

139:                                              ; preds = %132
  %140 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !15
  %141 = zext i8 %140 to i64
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 1
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !15
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 8
  %146 = or i64 %145, %141
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 2
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !15
  %149 = zext i8 %148 to i64
  %150 = shl nuw nsw i64 %149, 16
  %151 = or i64 %146, %150
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 3
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !15
  %154 = zext i8 %153 to i64
  %155 = shl nuw nsw i64 %154, 24
  %156 = or i64 %151, %155
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 4
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !15
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 32
  %161 = or i64 %156, %160
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 5
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !15
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 40
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 6
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !15
  %169 = zext i8 %168 to i64
  %170 = shl nuw nsw i64 %169, 48
  %171 = or i64 %166, %170
  %172 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 7
  %173 = load i8, i8 addrspace(4)* %172, align 1, !tbaa !15
  %174 = zext i8 %173 to i64
  %175 = shl nuw i64 %174, 56
  %176 = or i64 %171, %175
  %177 = add nsw i32 %134, -8
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 8
  br label %192

179:                                              ; preds = %137, %179
  %180 = phi i32 [ %190, %179 ], [ 0, %137 ]
  %181 = phi i64 [ %189, %179 ], [ 0, %137 ]
  %182 = zext i32 %180 to i64
  %183 = getelementptr inbounds i8, i8 addrspace(4)* %133, i64 %182
  %184 = load i8, i8 addrspace(4)* %183, align 1, !tbaa !15
  %185 = zext i8 %184 to i64
  %186 = shl i32 %180, 3
  %187 = zext i32 %186 to i64
  %188 = shl nuw i64 %185, %187
  %189 = or i64 %188, %181
  %190 = add nuw nsw i32 %180, 1
  %191 = icmp eq i32 %190, %134
  br i1 %191, label %192, label %179

192:                                              ; preds = %179, %139, %137
  %193 = phi i8 addrspace(4)* [ %178, %139 ], [ %133, %137 ], [ %133, %179 ]
  %194 = phi i32 [ %177, %139 ], [ 0, %137 ], [ 0, %179 ]
  %195 = phi i64 [ %176, %139 ], [ 0, %137 ], [ %189, %179 ]
  %196 = icmp ugt i32 %194, 7
  br i1 %196, label %199, label %197

197:                                              ; preds = %192
  %198 = icmp eq i32 %194, 0
  br i1 %198, label %252, label %239

199:                                              ; preds = %192
  %200 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !15
  %201 = zext i8 %200 to i64
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 1
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !15
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 8
  %206 = or i64 %205, %201
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 2
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !15
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 16
  %211 = or i64 %206, %210
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 3
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !15
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 24
  %216 = or i64 %211, %215
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 4
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !15
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 32
  %221 = or i64 %216, %220
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 5
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !15
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 40
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 6
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !15
  %229 = zext i8 %228 to i64
  %230 = shl nuw nsw i64 %229, 48
  %231 = or i64 %226, %230
  %232 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 7
  %233 = load i8, i8 addrspace(4)* %232, align 1, !tbaa !15
  %234 = zext i8 %233 to i64
  %235 = shl nuw i64 %234, 56
  %236 = or i64 %231, %235
  %237 = add nsw i32 %194, -8
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 8
  br label %252

239:                                              ; preds = %197, %239
  %240 = phi i32 [ %250, %239 ], [ 0, %197 ]
  %241 = phi i64 [ %249, %239 ], [ 0, %197 ]
  %242 = zext i32 %240 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(4)* %193, i64 %242
  %244 = load i8, i8 addrspace(4)* %243, align 1, !tbaa !15
  %245 = zext i8 %244 to i64
  %246 = shl i32 %240, 3
  %247 = zext i32 %246 to i64
  %248 = shl nuw i64 %245, %247
  %249 = or i64 %248, %241
  %250 = add nuw nsw i32 %240, 1
  %251 = icmp eq i32 %250, %194
  br i1 %251, label %252, label %239

252:                                              ; preds = %239, %199, %197
  %253 = phi i8 addrspace(4)* [ %238, %199 ], [ %193, %197 ], [ %193, %239 ]
  %254 = phi i32 [ %237, %199 ], [ 0, %197 ], [ 0, %239 ]
  %255 = phi i64 [ %236, %199 ], [ 0, %197 ], [ %249, %239 ]
  %256 = icmp ugt i32 %254, 7
  br i1 %256, label %259, label %257

257:                                              ; preds = %252
  %258 = icmp eq i32 %254, 0
  br i1 %258, label %312, label %299

259:                                              ; preds = %252
  %260 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !15
  %261 = zext i8 %260 to i64
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 1
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !15
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 8
  %266 = or i64 %265, %261
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 2
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !15
  %269 = zext i8 %268 to i64
  %270 = shl nuw nsw i64 %269, 16
  %271 = or i64 %266, %270
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 3
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !15
  %274 = zext i8 %273 to i64
  %275 = shl nuw nsw i64 %274, 24
  %276 = or i64 %271, %275
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 4
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !15
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 32
  %281 = or i64 %276, %280
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 5
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !15
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 40
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 6
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !15
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 48
  %291 = or i64 %286, %290
  %292 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 7
  %293 = load i8, i8 addrspace(4)* %292, align 1, !tbaa !15
  %294 = zext i8 %293 to i64
  %295 = shl nuw i64 %294, 56
  %296 = or i64 %291, %295
  %297 = add nsw i32 %254, -8
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 8
  br label %312

299:                                              ; preds = %257, %299
  %300 = phi i32 [ %310, %299 ], [ 0, %257 ]
  %301 = phi i64 [ %309, %299 ], [ 0, %257 ]
  %302 = zext i32 %300 to i64
  %303 = getelementptr inbounds i8, i8 addrspace(4)* %253, i64 %302
  %304 = load i8, i8 addrspace(4)* %303, align 1, !tbaa !15
  %305 = zext i8 %304 to i64
  %306 = shl i32 %300, 3
  %307 = zext i32 %306 to i64
  %308 = shl nuw i64 %305, %307
  %309 = or i64 %308, %301
  %310 = add nuw nsw i32 %300, 1
  %311 = icmp eq i32 %310, %254
  br i1 %311, label %312, label %299

312:                                              ; preds = %299, %259, %257
  %313 = phi i8 addrspace(4)* [ %298, %259 ], [ %253, %257 ], [ %253, %299 ]
  %314 = phi i32 [ %297, %259 ], [ 0, %257 ], [ 0, %299 ]
  %315 = phi i64 [ %296, %259 ], [ 0, %257 ], [ %309, %299 ]
  %316 = icmp ugt i32 %314, 7
  br i1 %316, label %319, label %317

317:                                              ; preds = %312
  %318 = icmp eq i32 %314, 0
  br i1 %318, label %372, label %359

319:                                              ; preds = %312
  %320 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !15
  %321 = zext i8 %320 to i64
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 1
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !15
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 8
  %326 = or i64 %325, %321
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 2
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !15
  %329 = zext i8 %328 to i64
  %330 = shl nuw nsw i64 %329, 16
  %331 = or i64 %326, %330
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 3
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !15
  %334 = zext i8 %333 to i64
  %335 = shl nuw nsw i64 %334, 24
  %336 = or i64 %331, %335
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 4
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !15
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 32
  %341 = or i64 %336, %340
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 5
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !15
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 40
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 6
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !15
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 48
  %351 = or i64 %346, %350
  %352 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 7
  %353 = load i8, i8 addrspace(4)* %352, align 1, !tbaa !15
  %354 = zext i8 %353 to i64
  %355 = shl nuw i64 %354, 56
  %356 = or i64 %351, %355
  %357 = add nsw i32 %314, -8
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 8
  br label %372

359:                                              ; preds = %317, %359
  %360 = phi i32 [ %370, %359 ], [ 0, %317 ]
  %361 = phi i64 [ %369, %359 ], [ 0, %317 ]
  %362 = zext i32 %360 to i64
  %363 = getelementptr inbounds i8, i8 addrspace(4)* %313, i64 %362
  %364 = load i8, i8 addrspace(4)* %363, align 1, !tbaa !15
  %365 = zext i8 %364 to i64
  %366 = shl i32 %360, 3
  %367 = zext i32 %366 to i64
  %368 = shl nuw i64 %365, %367
  %369 = or i64 %368, %361
  %370 = add nuw nsw i32 %360, 1
  %371 = icmp eq i32 %370, %314
  br i1 %371, label %372, label %359

372:                                              ; preds = %359, %319, %317
  %373 = phi i8 addrspace(4)* [ %358, %319 ], [ %313, %317 ], [ %313, %359 ]
  %374 = phi i32 [ %357, %319 ], [ 0, %317 ], [ 0, %359 ]
  %375 = phi i64 [ %356, %319 ], [ 0, %317 ], [ %369, %359 ]
  %376 = icmp ugt i32 %374, 7
  br i1 %376, label %379, label %377

377:                                              ; preds = %372
  %378 = icmp eq i32 %374, 0
  br i1 %378, label %432, label %419

379:                                              ; preds = %372
  %380 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !15
  %381 = zext i8 %380 to i64
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 1
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !15
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 8
  %386 = or i64 %385, %381
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 2
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !15
  %389 = zext i8 %388 to i64
  %390 = shl nuw nsw i64 %389, 16
  %391 = or i64 %386, %390
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 3
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !15
  %394 = zext i8 %393 to i64
  %395 = shl nuw nsw i64 %394, 24
  %396 = or i64 %391, %395
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 4
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !15
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 32
  %401 = or i64 %396, %400
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 5
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !15
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 40
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 6
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !15
  %409 = zext i8 %408 to i64
  %410 = shl nuw nsw i64 %409, 48
  %411 = or i64 %406, %410
  %412 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 7
  %413 = load i8, i8 addrspace(4)* %412, align 1, !tbaa !15
  %414 = zext i8 %413 to i64
  %415 = shl nuw i64 %414, 56
  %416 = or i64 %411, %415
  %417 = add nsw i32 %374, -8
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 8
  br label %432

419:                                              ; preds = %377, %419
  %420 = phi i32 [ %430, %419 ], [ 0, %377 ]
  %421 = phi i64 [ %429, %419 ], [ 0, %377 ]
  %422 = zext i32 %420 to i64
  %423 = getelementptr inbounds i8, i8 addrspace(4)* %373, i64 %422
  %424 = load i8, i8 addrspace(4)* %423, align 1, !tbaa !15
  %425 = zext i8 %424 to i64
  %426 = shl i32 %420, 3
  %427 = zext i32 %426 to i64
  %428 = shl nuw i64 %425, %427
  %429 = or i64 %428, %421
  %430 = add nuw nsw i32 %420, 1
  %431 = icmp eq i32 %430, %374
  br i1 %431, label %432, label %419

432:                                              ; preds = %419, %379, %377
  %433 = phi i8 addrspace(4)* [ %418, %379 ], [ %373, %377 ], [ %373, %419 ]
  %434 = phi i32 [ %417, %379 ], [ 0, %377 ], [ 0, %419 ]
  %435 = phi i64 [ %416, %379 ], [ 0, %377 ], [ %429, %419 ]
  %436 = icmp ugt i32 %434, 7
  br i1 %436, label %439, label %437

437:                                              ; preds = %432
  %438 = icmp eq i32 %434, 0
  br i1 %438, label %490, label %477

439:                                              ; preds = %432
  %440 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !15
  %441 = zext i8 %440 to i64
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 1
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !15
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 8
  %446 = or i64 %445, %441
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 2
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !15
  %449 = zext i8 %448 to i64
  %450 = shl nuw nsw i64 %449, 16
  %451 = or i64 %446, %450
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 3
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !15
  %454 = zext i8 %453 to i64
  %455 = shl nuw nsw i64 %454, 24
  %456 = or i64 %451, %455
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 4
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !15
  %459 = zext i8 %458 to i64
  %460 = shl nuw nsw i64 %459, 32
  %461 = or i64 %456, %460
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 5
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !15
  %464 = zext i8 %463 to i64
  %465 = shl nuw nsw i64 %464, 40
  %466 = or i64 %461, %465
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 6
  %468 = load i8, i8 addrspace(4)* %467, align 1, !tbaa !15
  %469 = zext i8 %468 to i64
  %470 = shl nuw nsw i64 %469, 48
  %471 = or i64 %466, %470
  %472 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 7
  %473 = load i8, i8 addrspace(4)* %472, align 1, !tbaa !15
  %474 = zext i8 %473 to i64
  %475 = shl nuw i64 %474, 56
  %476 = or i64 %471, %475
  br label %490

477:                                              ; preds = %437, %477
  %478 = phi i32 [ %488, %477 ], [ 0, %437 ]
  %479 = phi i64 [ %487, %477 ], [ 0, %437 ]
  %480 = zext i32 %478 to i64
  %481 = getelementptr inbounds i8, i8 addrspace(4)* %433, i64 %480
  %482 = load i8, i8 addrspace(4)* %481, align 1, !tbaa !15
  %483 = zext i8 %482 to i64
  %484 = shl i32 %478, 3
  %485 = zext i32 %484 to i64
  %486 = shl nuw i64 %483, %485
  %487 = or i64 %486, %479
  %488 = add nuw nsw i32 %478, 1
  %489 = icmp eq i32 %488, %434
  br i1 %489, label %490, label %477

490:                                              ; preds = %477, %439, %437
  %491 = phi i64 [ %476, %439 ], [ 0, %437 ], [ %487, %477 ]
  %492 = shl nuw nsw i64 %73, 2
  %493 = add nuw nsw i64 %492, 28
  %494 = and i64 %493, 480
  %495 = and i64 %75, -225
  %496 = or i64 %495, %494
  %497 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %496, i64 noundef %135, i64 noundef %195, i64 noundef %255, i64 noundef %315, i64 noundef %375, i64 noundef %435, i64 noundef %491) #11
  %498 = sub i64 %65, %73
  %499 = getelementptr inbounds i8, i8 addrspace(4)* %66, i64 %73
  %500 = icmp eq i64 %498, 0
  br i1 %500, label %501, label %64

501:                                              ; preds = %490, %56
  %502 = phi <2 x i64> [ %59, %56 ], [ %497, %490 ]
  %503 = extractelement <2 x i64> %502, i64 0
  %504 = zext i32 %6 to i64
  %505 = and i64 %503, -225
  %506 = or i64 %505, 32
  %507 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %506, i64 noundef %504, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %508 = extractelement <2 x i64> %507, i64 0
  %509 = zext i32 %35 to i64
  %510 = and i64 %508, -225
  %511 = or i64 %510, 32
  %512 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %511, i64 noundef %509, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %513 = extractelement <2 x i64> %512, i64 0
  %514 = and i64 %513, -225
  %515 = or i64 %514, 32
  %516 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %515, i64 noundef %33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %517 = extractelement <2 x i64> %516, i64 0
  %518 = zext i32 %11 to i64
  %519 = and i64 %517, -225
  %520 = or i64 %519, 32
  %521 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %520, i64 noundef %518, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %522 = extractelement <2 x i64> %521, i64 0
  %523 = zext i32 %47 to i64
  %524 = and i64 %522, -225
  %525 = or i64 %524, 32
  %526 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %525, i64 noundef %523, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  %527 = extractelement <2 x i64> %526, i64 0
  %528 = zext i32 %32 to i64
  %529 = and i64 %527, -227
  %530 = or i64 %529, 34
  %531 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %53, i64 noundef %530, i64 noundef %528, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #11
  br label %532

532:                                              ; preds = %501, %43
  %533 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %33
  store i32 %44, i32 addrspace(1)* %533, align 4, !tbaa !7
  br label %534

534:                                              ; preds = %532, %28
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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !18
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !20
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
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !20
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #11, !srcloc !22
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !20
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #7
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !20
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #7
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !18
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #7
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !23
  %49 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %59 = load i64, i64 addrspace(1)* %47, align 8, !tbaa !26
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
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !23
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !26
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #7
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !27
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !26
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !20
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !11
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !11
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !11
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !11
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !11
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !11
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !11
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !11
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %110 = call i64 @llvm.read_register.i64(metadata !28) #12
  %111 = icmp eq i32 %108, %109
  br i1 %111, label %112, label %116

112:                                              ; preds = %68
  %113 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 2
  store i32 %99, i32 addrspace(1)* %113, align 8, !tbaa !29
  %114 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 1
  store i64 %110, i64 addrspace(1)* %114, align 8, !tbaa !31
  %115 = getelementptr inbounds %1, %1 addrspace(1)* %97, i64 0, i32 3
  store i32 1, i32 addrspace(1)* %115, align 4, !tbaa !32
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
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !23
  %136 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 5
  %137 = load i64, i64 addrspace(1)* %136, align 8, !tbaa !26
  %138 = and i64 %137, %127
  %139 = getelementptr inbounds %1, %1 addrspace(1)* %135, i64 %138, i32 0
  store i64 %133, i64 addrspace(1)* %139, align 8, !tbaa !33
  %140 = cmpxchg i64 addrspace(1)* %132, i64 %133, i64 %127 syncscope("one-as") release monotonic, align 8
  %141 = extractvalue { i64, i1 } %140, 1
  br i1 %141, label %147, label %142

142:                                              ; preds = %142, %131
  %143 = phi { i64, i1 } [ %145, %142 ], [ %140, %131 ]
  %144 = extractvalue { i64, i1 } %143, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %144, i64 addrspace(1)* %139, align 8, !tbaa !33
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
  %154 = load i64, i64 addrspace(1)* %153, align 16, !tbaa !34
  %155 = icmp eq i64 %154, 0
  br i1 %155, label %163, label %156

156:                                              ; preds = %147
  %157 = inttoptr i64 %154 to i64 addrspace(1)*
  %158 = getelementptr inbounds %4, %4 addrspace(1)* %150, i64 0, i32 3
  %159 = load i32, i32 addrspace(1)* %158, align 8, !tbaa !36
  %160 = zext i32 %159 to i64
  store atomic i64 %160, i64 addrspace(1)* %157 syncscope("one-as") release, align 8
  %161 = call i32 @llvm.amdgcn.readfirstlane(i32 %159)
  %162 = and i32 %161, 255
  call void @llvm.amdgcn.s.sendmsg(i32 1, i32 %162)
  br label %163

163:                                              ; preds = %116, %147, %156
  %164 = bitcast <2 x i64> addrspace(5)* %26 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #7
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !18
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !18
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
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
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !18
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !11
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !20
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !20
  %192 = icmp eq i32 %190, %191
  br i1 %192, label %193, label %213

193:                                              ; preds = %180
  %194 = getelementptr inbounds %0, %0 addrspace(1)* %188, i64 0, i32 5
  %195 = load i64, i64 addrspace(1)* %194, align 8, !tbaa !26
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
  store i64 %201, i64 addrspace(1)* %205, align 8, !tbaa !33
  %206 = cmpxchg i64 addrspace(1)* %200, i64 %201, i64 %199 syncscope("one-as") release monotonic, align 8
  %207 = extractvalue { i64, i1 } %206, 1
  br i1 %207, label %213, label %208

208:                                              ; preds = %208, %193
  %209 = phi { i64, i1 } [ %211, %208 ], [ %206, %193 ]
  %210 = extractvalue { i64, i1 } %209, 0
  call void @llvm.amdgcn.s.sleep(i32 1)
  store i64 %210, i64 addrspace(1)* %205, align 8, !tbaa !33
  %211 = cmpxchg i64 addrspace(1)* %200, i64 %210, i64 %199 syncscope("one-as") release monotonic, align 8
  %212 = extractvalue { i64, i1 } %211, 1
  br i1 %212, label %213, label %208

213:                                              ; preds = %180, %193, %208
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !15
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!13, !13, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !13, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !13, i64 0}
!22 = !{i64 2662}
!23 = !{!24, !19, i64 0}
!24 = !{!"", !19, i64 0, !19, i64 8, !25, i64 16, !12, i64 24, !12, i64 32, !12, i64 40}
!25 = !{!"hsa_signal_s", !12, i64 0}
!26 = !{!24, !12, i64 40}
!27 = !{!24, !19, i64 8}
!28 = !{!"exec"}
!29 = !{!30, !21, i64 16}
!30 = !{!"", !12, i64 0, !12, i64 8, !21, i64 16, !21, i64 20}
!31 = !{!30, !12, i64 8}
!32 = !{!30, !21, i64 20}
!33 = !{!30, !12, i64 0}
!34 = !{!35, !12, i64 16}
!35 = !{!"amd_signal_s", !12, i64 0, !13, i64 8, !12, i64 16, !21, i64 24, !21, i64 28, !12, i64 32, !12, i64 40, !13, i64 48, !13, i64 56}
!36 = !{!35, !21, i64 24}
