; ModuleID = '../data/hip_kernels/7402/6/main.cu'
source_filename = "../data/hip_kernels/7402/6/main.cu"
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

@d_PointCounter = protected addrspace(1) externally_initialized global [1 x i32] zeroinitializer, align 4
@pd = protected addrspace(1) externally_initialized global [60 x float*] zeroinitializer, align 16
@pgpyr = protected addrspace(1) externally_initialized global [72 x float*] zeroinitializer, align 16
@temsize = protected local_unnamed_addr addrspace(1) externally_initialized global i32 0, align 4
@d_oIndex = protected local_unnamed_addr addrspace(4) externally_initialized global [36 x i32] zeroinitializer, align 16
@.str = private unnamed_addr addrspace(4) constant [4 x i8] c"%f\0A\00", align 1
@llvm.compiler.used = appending addrspace(1) global [3 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast ([1 x i32] addrspace(1)* @d_PointCounter to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([60 x float*] addrspace(1)* @pd to i8 addrspace(1)*) to i8*), i8* addrspacecast (i8 addrspace(1)* bitcast ([72 x float*] addrspace(1)* @pgpyr to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z8test_gpuii(i32 %0, i32 %1) local_unnamed_addr #1 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %1
  br i1 %20, label %24, label %21

21:                                               ; preds = %2
  %22 = mul nsw i32 %19, %0
  %23 = add nsw i32 %22, %11
  br label %33

24:                                               ; preds = %2
  %25 = load float*, float* addrspace(1)* getelementptr inbounds ([72 x float*], [72 x float*] addrspace(1)* @pgpyr, i64 0, i64 0), align 16, !tbaa !7
  %26 = mul nsw i32 %19, %0
  %27 = add nsw i32 %26, %11
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float* %25, i64 %28
  %30 = addrspacecast float* %29 to float addrspace(1)*
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !11
  %32 = fadd contract float %31, 1.000000e+02
  store float %32, float addrspace(1)* %30, align 4, !tbaa !11
  br label %33

33:                                               ; preds = %21, %24
  %34 = phi i32 [ %23, %21 ], [ %27, %24 ]
  %35 = icmp slt i32 %34, 5
  br i1 %35, label %36, label %503

36:                                               ; preds = %33
  %37 = load float*, float* addrspace(1)* getelementptr inbounds ([60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 0), align 16, !tbaa !7
  %38 = sext i32 %34 to i64
  %39 = getelementptr inbounds float, float* %37, i64 %38
  %40 = addrspacecast float* %39 to float addrspace(1)*
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !11
  %42 = fpext float %41 to double
  %43 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %44 = getelementptr inbounds i8, i8 addrspace(4)* %43, i64 24
  %45 = bitcast i8 addrspace(4)* %44 to i64 addrspace(4)*
  %46 = load i64, i64 addrspace(4)* %45, align 8, !tbaa !13
  %47 = inttoptr i64 %46 to i8 addrspace(1)*
  %48 = addrspacecast i8 addrspace(1)* %47 to i8*
  %49 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %48, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %50 = extractelement <2 x i64> %49, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %51, label %55

51:                                               ; preds = %36
  %52 = and i64 %50, -225
  %53 = or i64 %52, 32
  %54 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %48, i64 noundef %53, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %496

55:                                               ; preds = %36
  %56 = and i64 %50, 2
  %57 = and i64 %50, -3
  %58 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %57, i64 0
  br label %59

59:                                               ; preds = %485, %55
  %60 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 3) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([4 x i8]* addrspacecast ([4 x i8] addrspace(4)* @.str to [4 x i8]*) to i64)), i64 1))), %55 ], [ %493, %485 ]
  %61 = phi i8 addrspace(4)* [ getelementptr inbounds ([4 x i8], [4 x i8] addrspace(4)* @.str, i64 0, i64 0), %55 ], [ %494, %485 ]
  %62 = phi <2 x i64> [ %58, %55 ], [ %492, %485 ]
  %63 = icmp ugt i64 %60, 56
  %64 = extractelement <2 x i64> %62, i64 0
  %65 = or i64 %64, %56
  %66 = insertelement <2 x i64> poison, i64 %65, i64 0
  %67 = select i1 %63, <2 x i64> %62, <2 x i64> %66
  %68 = tail call i64 @llvm.umin.i64(i64 %60, i64 56)
  %69 = trunc i64 %68 to i32
  %70 = extractelement <2 x i64> %67, i64 0
  %71 = icmp ugt i32 %69, 7
  br i1 %71, label %74, label %72

72:                                               ; preds = %59
  %73 = icmp eq i32 %69, 0
  br i1 %73, label %127, label %114

74:                                               ; preds = %59
  %75 = load i8, i8 addrspace(4)* %61, align 1, !tbaa !17
  %76 = zext i8 %75 to i64
  %77 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 1
  %78 = load i8, i8 addrspace(4)* %77, align 1, !tbaa !17
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 8
  %81 = or i64 %80, %76
  %82 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 2
  %83 = load i8, i8 addrspace(4)* %82, align 1, !tbaa !17
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 16
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 3
  %88 = load i8, i8 addrspace(4)* %87, align 1, !tbaa !17
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 24
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 4
  %93 = load i8, i8 addrspace(4)* %92, align 1, !tbaa !17
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 32
  %96 = or i64 %91, %95
  %97 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 5
  %98 = load i8, i8 addrspace(4)* %97, align 1, !tbaa !17
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 40
  %101 = or i64 %96, %100
  %102 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 6
  %103 = load i8, i8 addrspace(4)* %102, align 1, !tbaa !17
  %104 = zext i8 %103 to i64
  %105 = shl nuw nsw i64 %104, 48
  %106 = or i64 %101, %105
  %107 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 7
  %108 = load i8, i8 addrspace(4)* %107, align 1, !tbaa !17
  %109 = zext i8 %108 to i64
  %110 = shl nuw i64 %109, 56
  %111 = or i64 %106, %110
  %112 = add nsw i32 %69, -8
  %113 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 8
  br label %127

114:                                              ; preds = %72, %114
  %115 = phi i32 [ %125, %114 ], [ 0, %72 ]
  %116 = phi i64 [ %124, %114 ], [ 0, %72 ]
  %117 = zext i32 %115 to i64
  %118 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 %117
  %119 = load i8, i8 addrspace(4)* %118, align 1, !tbaa !17
  %120 = zext i8 %119 to i64
  %121 = shl i32 %115, 3
  %122 = zext i32 %121 to i64
  %123 = shl nuw i64 %120, %122
  %124 = or i64 %123, %116
  %125 = add nuw nsw i32 %115, 1
  %126 = icmp eq i32 %125, %69
  br i1 %126, label %127, label %114, !llvm.loop !18

127:                                              ; preds = %114, %74, %72
  %128 = phi i8 addrspace(4)* [ %113, %74 ], [ %61, %72 ], [ %61, %114 ]
  %129 = phi i32 [ %112, %74 ], [ 0, %72 ], [ 0, %114 ]
  %130 = phi i64 [ %111, %74 ], [ 0, %72 ], [ %124, %114 ]
  %131 = icmp ugt i32 %129, 7
  br i1 %131, label %134, label %132

132:                                              ; preds = %127
  %133 = icmp eq i32 %129, 0
  br i1 %133, label %187, label %174

134:                                              ; preds = %127
  %135 = load i8, i8 addrspace(4)* %128, align 1, !tbaa !17
  %136 = zext i8 %135 to i64
  %137 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 1
  %138 = load i8, i8 addrspace(4)* %137, align 1, !tbaa !17
  %139 = zext i8 %138 to i64
  %140 = shl nuw nsw i64 %139, 8
  %141 = or i64 %140, %136
  %142 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 2
  %143 = load i8, i8 addrspace(4)* %142, align 1, !tbaa !17
  %144 = zext i8 %143 to i64
  %145 = shl nuw nsw i64 %144, 16
  %146 = or i64 %141, %145
  %147 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 3
  %148 = load i8, i8 addrspace(4)* %147, align 1, !tbaa !17
  %149 = zext i8 %148 to i64
  %150 = shl nuw nsw i64 %149, 24
  %151 = or i64 %146, %150
  %152 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 4
  %153 = load i8, i8 addrspace(4)* %152, align 1, !tbaa !17
  %154 = zext i8 %153 to i64
  %155 = shl nuw nsw i64 %154, 32
  %156 = or i64 %151, %155
  %157 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 5
  %158 = load i8, i8 addrspace(4)* %157, align 1, !tbaa !17
  %159 = zext i8 %158 to i64
  %160 = shl nuw nsw i64 %159, 40
  %161 = or i64 %156, %160
  %162 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 6
  %163 = load i8, i8 addrspace(4)* %162, align 1, !tbaa !17
  %164 = zext i8 %163 to i64
  %165 = shl nuw nsw i64 %164, 48
  %166 = or i64 %161, %165
  %167 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 7
  %168 = load i8, i8 addrspace(4)* %167, align 1, !tbaa !17
  %169 = zext i8 %168 to i64
  %170 = shl nuw i64 %169, 56
  %171 = or i64 %166, %170
  %172 = add nsw i32 %129, -8
  %173 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 8
  br label %187

174:                                              ; preds = %132, %174
  %175 = phi i32 [ %185, %174 ], [ 0, %132 ]
  %176 = phi i64 [ %184, %174 ], [ 0, %132 ]
  %177 = zext i32 %175 to i64
  %178 = getelementptr inbounds i8, i8 addrspace(4)* %128, i64 %177
  %179 = load i8, i8 addrspace(4)* %178, align 1, !tbaa !17
  %180 = zext i8 %179 to i64
  %181 = shl i32 %175, 3
  %182 = zext i32 %181 to i64
  %183 = shl nuw i64 %180, %182
  %184 = or i64 %183, %176
  %185 = add nuw nsw i32 %175, 1
  %186 = icmp eq i32 %185, %129
  br i1 %186, label %187, label %174

187:                                              ; preds = %174, %134, %132
  %188 = phi i8 addrspace(4)* [ %173, %134 ], [ %128, %132 ], [ %128, %174 ]
  %189 = phi i32 [ %172, %134 ], [ 0, %132 ], [ 0, %174 ]
  %190 = phi i64 [ %171, %134 ], [ 0, %132 ], [ %184, %174 ]
  %191 = icmp ugt i32 %189, 7
  br i1 %191, label %194, label %192

192:                                              ; preds = %187
  %193 = icmp eq i32 %189, 0
  br i1 %193, label %247, label %234

194:                                              ; preds = %187
  %195 = load i8, i8 addrspace(4)* %188, align 1, !tbaa !17
  %196 = zext i8 %195 to i64
  %197 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 1
  %198 = load i8, i8 addrspace(4)* %197, align 1, !tbaa !17
  %199 = zext i8 %198 to i64
  %200 = shl nuw nsw i64 %199, 8
  %201 = or i64 %200, %196
  %202 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 2
  %203 = load i8, i8 addrspace(4)* %202, align 1, !tbaa !17
  %204 = zext i8 %203 to i64
  %205 = shl nuw nsw i64 %204, 16
  %206 = or i64 %201, %205
  %207 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 3
  %208 = load i8, i8 addrspace(4)* %207, align 1, !tbaa !17
  %209 = zext i8 %208 to i64
  %210 = shl nuw nsw i64 %209, 24
  %211 = or i64 %206, %210
  %212 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 4
  %213 = load i8, i8 addrspace(4)* %212, align 1, !tbaa !17
  %214 = zext i8 %213 to i64
  %215 = shl nuw nsw i64 %214, 32
  %216 = or i64 %211, %215
  %217 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 5
  %218 = load i8, i8 addrspace(4)* %217, align 1, !tbaa !17
  %219 = zext i8 %218 to i64
  %220 = shl nuw nsw i64 %219, 40
  %221 = or i64 %216, %220
  %222 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 6
  %223 = load i8, i8 addrspace(4)* %222, align 1, !tbaa !17
  %224 = zext i8 %223 to i64
  %225 = shl nuw nsw i64 %224, 48
  %226 = or i64 %221, %225
  %227 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 7
  %228 = load i8, i8 addrspace(4)* %227, align 1, !tbaa !17
  %229 = zext i8 %228 to i64
  %230 = shl nuw i64 %229, 56
  %231 = or i64 %226, %230
  %232 = add nsw i32 %189, -8
  %233 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 8
  br label %247

234:                                              ; preds = %192, %234
  %235 = phi i32 [ %245, %234 ], [ 0, %192 ]
  %236 = phi i64 [ %244, %234 ], [ 0, %192 ]
  %237 = zext i32 %235 to i64
  %238 = getelementptr inbounds i8, i8 addrspace(4)* %188, i64 %237
  %239 = load i8, i8 addrspace(4)* %238, align 1, !tbaa !17
  %240 = zext i8 %239 to i64
  %241 = shl i32 %235, 3
  %242 = zext i32 %241 to i64
  %243 = shl nuw i64 %240, %242
  %244 = or i64 %243, %236
  %245 = add nuw nsw i32 %235, 1
  %246 = icmp eq i32 %245, %189
  br i1 %246, label %247, label %234

247:                                              ; preds = %234, %194, %192
  %248 = phi i8 addrspace(4)* [ %233, %194 ], [ %188, %192 ], [ %188, %234 ]
  %249 = phi i32 [ %232, %194 ], [ 0, %192 ], [ 0, %234 ]
  %250 = phi i64 [ %231, %194 ], [ 0, %192 ], [ %244, %234 ]
  %251 = icmp ugt i32 %249, 7
  br i1 %251, label %254, label %252

252:                                              ; preds = %247
  %253 = icmp eq i32 %249, 0
  br i1 %253, label %307, label %294

254:                                              ; preds = %247
  %255 = load i8, i8 addrspace(4)* %248, align 1, !tbaa !17
  %256 = zext i8 %255 to i64
  %257 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 1
  %258 = load i8, i8 addrspace(4)* %257, align 1, !tbaa !17
  %259 = zext i8 %258 to i64
  %260 = shl nuw nsw i64 %259, 8
  %261 = or i64 %260, %256
  %262 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 2
  %263 = load i8, i8 addrspace(4)* %262, align 1, !tbaa !17
  %264 = zext i8 %263 to i64
  %265 = shl nuw nsw i64 %264, 16
  %266 = or i64 %261, %265
  %267 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 3
  %268 = load i8, i8 addrspace(4)* %267, align 1, !tbaa !17
  %269 = zext i8 %268 to i64
  %270 = shl nuw nsw i64 %269, 24
  %271 = or i64 %266, %270
  %272 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 4
  %273 = load i8, i8 addrspace(4)* %272, align 1, !tbaa !17
  %274 = zext i8 %273 to i64
  %275 = shl nuw nsw i64 %274, 32
  %276 = or i64 %271, %275
  %277 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 5
  %278 = load i8, i8 addrspace(4)* %277, align 1, !tbaa !17
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 40
  %281 = or i64 %276, %280
  %282 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 6
  %283 = load i8, i8 addrspace(4)* %282, align 1, !tbaa !17
  %284 = zext i8 %283 to i64
  %285 = shl nuw nsw i64 %284, 48
  %286 = or i64 %281, %285
  %287 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 7
  %288 = load i8, i8 addrspace(4)* %287, align 1, !tbaa !17
  %289 = zext i8 %288 to i64
  %290 = shl nuw i64 %289, 56
  %291 = or i64 %286, %290
  %292 = add nsw i32 %249, -8
  %293 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 8
  br label %307

294:                                              ; preds = %252, %294
  %295 = phi i32 [ %305, %294 ], [ 0, %252 ]
  %296 = phi i64 [ %304, %294 ], [ 0, %252 ]
  %297 = zext i32 %295 to i64
  %298 = getelementptr inbounds i8, i8 addrspace(4)* %248, i64 %297
  %299 = load i8, i8 addrspace(4)* %298, align 1, !tbaa !17
  %300 = zext i8 %299 to i64
  %301 = shl i32 %295, 3
  %302 = zext i32 %301 to i64
  %303 = shl nuw i64 %300, %302
  %304 = or i64 %303, %296
  %305 = add nuw nsw i32 %295, 1
  %306 = icmp eq i32 %305, %249
  br i1 %306, label %307, label %294

307:                                              ; preds = %294, %254, %252
  %308 = phi i8 addrspace(4)* [ %293, %254 ], [ %248, %252 ], [ %248, %294 ]
  %309 = phi i32 [ %292, %254 ], [ 0, %252 ], [ 0, %294 ]
  %310 = phi i64 [ %291, %254 ], [ 0, %252 ], [ %304, %294 ]
  %311 = icmp ugt i32 %309, 7
  br i1 %311, label %314, label %312

312:                                              ; preds = %307
  %313 = icmp eq i32 %309, 0
  br i1 %313, label %367, label %354

314:                                              ; preds = %307
  %315 = load i8, i8 addrspace(4)* %308, align 1, !tbaa !17
  %316 = zext i8 %315 to i64
  %317 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 1
  %318 = load i8, i8 addrspace(4)* %317, align 1, !tbaa !17
  %319 = zext i8 %318 to i64
  %320 = shl nuw nsw i64 %319, 8
  %321 = or i64 %320, %316
  %322 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 2
  %323 = load i8, i8 addrspace(4)* %322, align 1, !tbaa !17
  %324 = zext i8 %323 to i64
  %325 = shl nuw nsw i64 %324, 16
  %326 = or i64 %321, %325
  %327 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 3
  %328 = load i8, i8 addrspace(4)* %327, align 1, !tbaa !17
  %329 = zext i8 %328 to i64
  %330 = shl nuw nsw i64 %329, 24
  %331 = or i64 %326, %330
  %332 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 4
  %333 = load i8, i8 addrspace(4)* %332, align 1, !tbaa !17
  %334 = zext i8 %333 to i64
  %335 = shl nuw nsw i64 %334, 32
  %336 = or i64 %331, %335
  %337 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 5
  %338 = load i8, i8 addrspace(4)* %337, align 1, !tbaa !17
  %339 = zext i8 %338 to i64
  %340 = shl nuw nsw i64 %339, 40
  %341 = or i64 %336, %340
  %342 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 6
  %343 = load i8, i8 addrspace(4)* %342, align 1, !tbaa !17
  %344 = zext i8 %343 to i64
  %345 = shl nuw nsw i64 %344, 48
  %346 = or i64 %341, %345
  %347 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 7
  %348 = load i8, i8 addrspace(4)* %347, align 1, !tbaa !17
  %349 = zext i8 %348 to i64
  %350 = shl nuw i64 %349, 56
  %351 = or i64 %346, %350
  %352 = add nsw i32 %309, -8
  %353 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 8
  br label %367

354:                                              ; preds = %312, %354
  %355 = phi i32 [ %365, %354 ], [ 0, %312 ]
  %356 = phi i64 [ %364, %354 ], [ 0, %312 ]
  %357 = zext i32 %355 to i64
  %358 = getelementptr inbounds i8, i8 addrspace(4)* %308, i64 %357
  %359 = load i8, i8 addrspace(4)* %358, align 1, !tbaa !17
  %360 = zext i8 %359 to i64
  %361 = shl i32 %355, 3
  %362 = zext i32 %361 to i64
  %363 = shl nuw i64 %360, %362
  %364 = or i64 %363, %356
  %365 = add nuw nsw i32 %355, 1
  %366 = icmp eq i32 %365, %309
  br i1 %366, label %367, label %354

367:                                              ; preds = %354, %314, %312
  %368 = phi i8 addrspace(4)* [ %353, %314 ], [ %308, %312 ], [ %308, %354 ]
  %369 = phi i32 [ %352, %314 ], [ 0, %312 ], [ 0, %354 ]
  %370 = phi i64 [ %351, %314 ], [ 0, %312 ], [ %364, %354 ]
  %371 = icmp ugt i32 %369, 7
  br i1 %371, label %374, label %372

372:                                              ; preds = %367
  %373 = icmp eq i32 %369, 0
  br i1 %373, label %427, label %414

374:                                              ; preds = %367
  %375 = load i8, i8 addrspace(4)* %368, align 1, !tbaa !17
  %376 = zext i8 %375 to i64
  %377 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 1
  %378 = load i8, i8 addrspace(4)* %377, align 1, !tbaa !17
  %379 = zext i8 %378 to i64
  %380 = shl nuw nsw i64 %379, 8
  %381 = or i64 %380, %376
  %382 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 2
  %383 = load i8, i8 addrspace(4)* %382, align 1, !tbaa !17
  %384 = zext i8 %383 to i64
  %385 = shl nuw nsw i64 %384, 16
  %386 = or i64 %381, %385
  %387 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 3
  %388 = load i8, i8 addrspace(4)* %387, align 1, !tbaa !17
  %389 = zext i8 %388 to i64
  %390 = shl nuw nsw i64 %389, 24
  %391 = or i64 %386, %390
  %392 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 4
  %393 = load i8, i8 addrspace(4)* %392, align 1, !tbaa !17
  %394 = zext i8 %393 to i64
  %395 = shl nuw nsw i64 %394, 32
  %396 = or i64 %391, %395
  %397 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 5
  %398 = load i8, i8 addrspace(4)* %397, align 1, !tbaa !17
  %399 = zext i8 %398 to i64
  %400 = shl nuw nsw i64 %399, 40
  %401 = or i64 %396, %400
  %402 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 6
  %403 = load i8, i8 addrspace(4)* %402, align 1, !tbaa !17
  %404 = zext i8 %403 to i64
  %405 = shl nuw nsw i64 %404, 48
  %406 = or i64 %401, %405
  %407 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 7
  %408 = load i8, i8 addrspace(4)* %407, align 1, !tbaa !17
  %409 = zext i8 %408 to i64
  %410 = shl nuw i64 %409, 56
  %411 = or i64 %406, %410
  %412 = add nsw i32 %369, -8
  %413 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 8
  br label %427

414:                                              ; preds = %372, %414
  %415 = phi i32 [ %425, %414 ], [ 0, %372 ]
  %416 = phi i64 [ %424, %414 ], [ 0, %372 ]
  %417 = zext i32 %415 to i64
  %418 = getelementptr inbounds i8, i8 addrspace(4)* %368, i64 %417
  %419 = load i8, i8 addrspace(4)* %418, align 1, !tbaa !17
  %420 = zext i8 %419 to i64
  %421 = shl i32 %415, 3
  %422 = zext i32 %421 to i64
  %423 = shl nuw i64 %420, %422
  %424 = or i64 %423, %416
  %425 = add nuw nsw i32 %415, 1
  %426 = icmp eq i32 %425, %369
  br i1 %426, label %427, label %414

427:                                              ; preds = %414, %374, %372
  %428 = phi i8 addrspace(4)* [ %413, %374 ], [ %368, %372 ], [ %368, %414 ]
  %429 = phi i32 [ %412, %374 ], [ 0, %372 ], [ 0, %414 ]
  %430 = phi i64 [ %411, %374 ], [ 0, %372 ], [ %424, %414 ]
  %431 = icmp ugt i32 %429, 7
  br i1 %431, label %434, label %432

432:                                              ; preds = %427
  %433 = icmp eq i32 %429, 0
  br i1 %433, label %485, label %472

434:                                              ; preds = %427
  %435 = load i8, i8 addrspace(4)* %428, align 1, !tbaa !17
  %436 = zext i8 %435 to i64
  %437 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 1
  %438 = load i8, i8 addrspace(4)* %437, align 1, !tbaa !17
  %439 = zext i8 %438 to i64
  %440 = shl nuw nsw i64 %439, 8
  %441 = or i64 %440, %436
  %442 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 2
  %443 = load i8, i8 addrspace(4)* %442, align 1, !tbaa !17
  %444 = zext i8 %443 to i64
  %445 = shl nuw nsw i64 %444, 16
  %446 = or i64 %441, %445
  %447 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 3
  %448 = load i8, i8 addrspace(4)* %447, align 1, !tbaa !17
  %449 = zext i8 %448 to i64
  %450 = shl nuw nsw i64 %449, 24
  %451 = or i64 %446, %450
  %452 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 4
  %453 = load i8, i8 addrspace(4)* %452, align 1, !tbaa !17
  %454 = zext i8 %453 to i64
  %455 = shl nuw nsw i64 %454, 32
  %456 = or i64 %451, %455
  %457 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 5
  %458 = load i8, i8 addrspace(4)* %457, align 1, !tbaa !17
  %459 = zext i8 %458 to i64
  %460 = shl nuw nsw i64 %459, 40
  %461 = or i64 %456, %460
  %462 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 6
  %463 = load i8, i8 addrspace(4)* %462, align 1, !tbaa !17
  %464 = zext i8 %463 to i64
  %465 = shl nuw nsw i64 %464, 48
  %466 = or i64 %461, %465
  %467 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 7
  %468 = load i8, i8 addrspace(4)* %467, align 1, !tbaa !17
  %469 = zext i8 %468 to i64
  %470 = shl nuw i64 %469, 56
  %471 = or i64 %466, %470
  br label %485

472:                                              ; preds = %432, %472
  %473 = phi i32 [ %483, %472 ], [ 0, %432 ]
  %474 = phi i64 [ %482, %472 ], [ 0, %432 ]
  %475 = zext i32 %473 to i64
  %476 = getelementptr inbounds i8, i8 addrspace(4)* %428, i64 %475
  %477 = load i8, i8 addrspace(4)* %476, align 1, !tbaa !17
  %478 = zext i8 %477 to i64
  %479 = shl i32 %473, 3
  %480 = zext i32 %479 to i64
  %481 = shl nuw i64 %478, %480
  %482 = or i64 %481, %474
  %483 = add nuw nsw i32 %473, 1
  %484 = icmp eq i32 %483, %429
  br i1 %484, label %485, label %472

485:                                              ; preds = %472, %434, %432
  %486 = phi i64 [ %471, %434 ], [ 0, %432 ], [ %482, %472 ]
  %487 = shl nuw nsw i64 %68, 2
  %488 = add nuw nsw i64 %487, 28
  %489 = and i64 %488, 480
  %490 = and i64 %70, -225
  %491 = or i64 %490, %489
  %492 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %48, i64 noundef %491, i64 noundef %130, i64 noundef %190, i64 noundef %250, i64 noundef %310, i64 noundef %370, i64 noundef %430, i64 noundef %486) #12
  %493 = sub i64 %60, %68
  %494 = getelementptr inbounds i8, i8 addrspace(4)* %61, i64 %68
  %495 = icmp eq i64 %493, 0
  br i1 %495, label %496, label %59

496:                                              ; preds = %485, %51
  %497 = phi <2 x i64> [ %54, %51 ], [ %492, %485 ]
  %498 = extractelement <2 x i64> %497, i64 0
  %499 = bitcast double %42 to i64
  %500 = and i64 %498, -227
  %501 = or i64 %500, 34
  %502 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %48, i64 noundef %501, i64 noundef %499, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %503

503:                                              ; preds = %496, %33
  ret void
}

; Function Attrs: mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25findScaleSpaceExtrema_gpuPfiiiiiiii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #2 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = bitcast i8 addrspace(4)* %12 to <2 x i16> addrspace(4)*
  %16 = load <2 x i16>, <2 x i16> addrspace(4)* %15, align 4, !invariant.load !5
  %17 = zext <2 x i16> %16 to <2 x i32>
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = insertelement <2 x i32> poison, i32 %14, i64 0
  %20 = insertelement <2 x i32> %19, i32 %10, i64 1
  %21 = shufflevector <2 x i32> %17, <2 x i32> poison, <2 x i32> <i32 1, i32 0>
  %22 = mul <2 x i32> %20, %21
  %23 = insertelement <2 x i32> poison, i32 %18, i64 0
  %24 = insertelement <2 x i32> %23, i32 %13, i64 1
  %25 = add <2 x i32> %22, %24
  %26 = add nsw i32 %5, -5
  %27 = extractelement <2 x i32> %25, i64 0
  %28 = icmp slt i32 %27, %26
  br i1 %28, label %29, label %1470

29:                                               ; preds = %9
  %30 = add nsw i32 %3, -5
  %31 = extractelement <2 x i32> %25, i64 1
  %32 = icmp sge i32 %31, %30
  %33 = icmp slt i32 %31, 5
  %34 = or i1 %32, %33
  %35 = icmp slt i32 %27, 5
  %36 = select i1 %34, i1 true, i1 %35
  br i1 %36, label %1470, label %37

37:                                               ; preds = %29
  %38 = sext i32 %2 to i64
  %39 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %38
  %40 = load float*, float* addrspace(1)* %39, align 8, !tbaa !7
  %41 = mul nsw i32 %27, %4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float* %40, i64 %42
  %44 = zext i32 %31 to i64
  %45 = getelementptr inbounds float, float* %43, i64 %44
  %46 = addrspacecast float* %45 to float addrspace(1)*
  %47 = add nsw i32 %2, -1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %48
  %50 = load float*, float* addrspace(1)* %49, align 8, !tbaa !7
  %51 = getelementptr inbounds float, float* %50, i64 %42
  %52 = getelementptr inbounds float, float* %51, i64 %44
  %53 = addrspacecast float* %52 to float addrspace(1)*
  %54 = add nsw i32 %2, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %55
  %57 = load float*, float* addrspace(1)* %56, align 8, !tbaa !7
  %58 = getelementptr inbounds float, float* %57, i64 %42
  %59 = getelementptr inbounds float, float* %58, i64 %44
  %60 = addrspacecast float* %59 to float addrspace(1)*
  %61 = add nsw i32 %7, 2
  %62 = sdiv i32 %2, %61
  %63 = load float, float addrspace(1)* %46, align 4, !tbaa !11
  %64 = tail call float @llvm.fabs.f32(float %63)
  %65 = sitofp i32 %6 to float
  %66 = fcmp contract ogt float %64, %65
  br i1 %66, label %67, label %1470

67:                                               ; preds = %37
  %68 = fcmp contract ogt float %63, 0.000000e+00
  br i1 %68, label %69, label %206

69:                                               ; preds = %67
  %70 = getelementptr inbounds float, float* %45, i64 -1
  %71 = addrspacecast float* %70 to float addrspace(1)*
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !11
  %73 = fcmp contract ult float %63, %72
  br i1 %73, label %206, label %74

74:                                               ; preds = %69
  %75 = getelementptr inbounds float, float* %45, i64 1
  %76 = addrspacecast float* %75 to float addrspace(1)*
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !11
  %78 = fcmp contract ult float %63, %77
  br i1 %78, label %206, label %79

79:                                               ; preds = %74
  %80 = xor i32 %4, -1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float* %45, i64 %81
  %83 = addrspacecast float* %82 to float addrspace(1)*
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !11
  %85 = fcmp contract ult float %63, %84
  br i1 %85, label %206, label %86

86:                                               ; preds = %79
  %87 = sub nsw i32 0, %4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float* %45, i64 %88
  %90 = addrspacecast float* %89 to float addrspace(1)*
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !11
  %92 = fcmp contract ult float %63, %91
  br i1 %92, label %206, label %93

93:                                               ; preds = %86
  %94 = sub i32 1, %4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float* %45, i64 %95
  %97 = addrspacecast float* %96 to float addrspace(1)*
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !11
  %99 = fcmp contract ult float %63, %98
  br i1 %99, label %206, label %100

100:                                              ; preds = %93
  %101 = add nsw i32 %4, -1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float* %45, i64 %102
  %104 = addrspacecast float* %103 to float addrspace(1)*
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !11
  %106 = fcmp contract ult float %63, %105
  br i1 %106, label %206, label %107

107:                                              ; preds = %100
  %108 = sext i32 %4 to i64
  %109 = getelementptr inbounds float, float* %45, i64 %108
  %110 = addrspacecast float* %109 to float addrspace(1)*
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !11
  %112 = fcmp contract ult float %63, %111
  br i1 %112, label %206, label %113

113:                                              ; preds = %107
  %114 = add nsw i32 %4, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float* %45, i64 %115
  %117 = addrspacecast float* %116 to float addrspace(1)*
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !11
  %119 = fcmp contract ult float %63, %118
  br i1 %119, label %206, label %120

120:                                              ; preds = %113
  %121 = load float, float addrspace(1)* %60, align 4, !tbaa !11
  %122 = fcmp contract ult float %63, %121
  br i1 %122, label %206, label %123

123:                                              ; preds = %120
  %124 = getelementptr inbounds float, float* %59, i64 -1
  %125 = addrspacecast float* %124 to float addrspace(1)*
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !11
  %127 = fcmp contract ult float %63, %126
  br i1 %127, label %206, label %128

128:                                              ; preds = %123
  %129 = getelementptr inbounds float, float* %59, i64 1
  %130 = addrspacecast float* %129 to float addrspace(1)*
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !11
  %132 = fcmp contract ult float %63, %131
  br i1 %132, label %206, label %133

133:                                              ; preds = %128
  %134 = getelementptr inbounds float, float* %59, i64 %81
  %135 = addrspacecast float* %134 to float addrspace(1)*
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !11
  %137 = fcmp contract ult float %63, %136
  br i1 %137, label %206, label %138

138:                                              ; preds = %133
  %139 = getelementptr inbounds float, float* %59, i64 %88
  %140 = addrspacecast float* %139 to float addrspace(1)*
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !11
  %142 = fcmp contract ult float %63, %141
  br i1 %142, label %206, label %143

143:                                              ; preds = %138
  %144 = getelementptr inbounds float, float* %59, i64 %95
  %145 = addrspacecast float* %144 to float addrspace(1)*
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !11
  %147 = fcmp contract ult float %63, %146
  br i1 %147, label %206, label %148

148:                                              ; preds = %143
  %149 = getelementptr inbounds float, float* %59, i64 %102
  %150 = addrspacecast float* %149 to float addrspace(1)*
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !11
  %152 = fcmp contract ult float %63, %151
  br i1 %152, label %206, label %153

153:                                              ; preds = %148
  %154 = getelementptr inbounds float, float* %59, i64 %108
  %155 = addrspacecast float* %154 to float addrspace(1)*
  %156 = load float, float addrspace(1)* %155, align 4, !tbaa !11
  %157 = fcmp contract ult float %63, %156
  br i1 %157, label %206, label %158

158:                                              ; preds = %153
  %159 = getelementptr inbounds float, float* %59, i64 %115
  %160 = addrspacecast float* %159 to float addrspace(1)*
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !11
  %162 = fcmp contract ult float %63, %161
  br i1 %162, label %206, label %163

163:                                              ; preds = %158
  %164 = load float, float addrspace(1)* %53, align 4, !tbaa !11
  %165 = fcmp contract ult float %63, %164
  br i1 %165, label %206, label %166

166:                                              ; preds = %163
  %167 = getelementptr inbounds float, float* %52, i64 -1
  %168 = addrspacecast float* %167 to float addrspace(1)*
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !11
  %170 = fcmp contract ult float %63, %169
  br i1 %170, label %206, label %171

171:                                              ; preds = %166
  %172 = getelementptr inbounds float, float* %52, i64 1
  %173 = addrspacecast float* %172 to float addrspace(1)*
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !11
  %175 = fcmp contract ult float %63, %174
  br i1 %175, label %206, label %176

176:                                              ; preds = %171
  %177 = getelementptr inbounds float, float* %52, i64 %81
  %178 = addrspacecast float* %177 to float addrspace(1)*
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !11
  %180 = fcmp contract ult float %63, %179
  br i1 %180, label %206, label %181

181:                                              ; preds = %176
  %182 = getelementptr inbounds float, float* %52, i64 %88
  %183 = addrspacecast float* %182 to float addrspace(1)*
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !11
  %185 = fcmp contract ult float %63, %184
  br i1 %185, label %206, label %186

186:                                              ; preds = %181
  %187 = getelementptr inbounds float, float* %52, i64 %95
  %188 = addrspacecast float* %187 to float addrspace(1)*
  %189 = load float, float addrspace(1)* %188, align 4, !tbaa !11
  %190 = fcmp contract ult float %63, %189
  br i1 %190, label %206, label %191

191:                                              ; preds = %186
  %192 = getelementptr inbounds float, float* %52, i64 %102
  %193 = addrspacecast float* %192 to float addrspace(1)*
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !11
  %195 = fcmp contract ult float %63, %194
  br i1 %195, label %206, label %196

196:                                              ; preds = %191
  %197 = getelementptr inbounds float, float* %52, i64 %108
  %198 = addrspacecast float* %197 to float addrspace(1)*
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !11
  %200 = fcmp contract ult float %63, %199
  br i1 %200, label %206, label %201

201:                                              ; preds = %196
  %202 = getelementptr inbounds float, float* %52, i64 %115
  %203 = addrspacecast float* %202 to float addrspace(1)*
  %204 = load float, float addrspace(1)* %203, align 4, !tbaa !11
  %205 = fcmp contract ult float %63, %204
  br i1 %205, label %206, label %345

206:                                              ; preds = %201, %196, %191, %186, %181, %176, %171, %166, %163, %158, %153, %148, %143, %138, %133, %128, %123, %120, %113, %107, %100, %93, %86, %79, %74, %69, %67
  %207 = fcmp contract olt float %63, 0.000000e+00
  br i1 %207, label %208, label %1470

208:                                              ; preds = %206
  %209 = getelementptr inbounds float, float* %45, i64 -1
  %210 = addrspacecast float* %209 to float addrspace(1)*
  %211 = load float, float addrspace(1)* %210, align 4, !tbaa !11
  %212 = fcmp contract ugt float %63, %211
  br i1 %212, label %1470, label %213

213:                                              ; preds = %208
  %214 = getelementptr inbounds float, float* %45, i64 1
  %215 = addrspacecast float* %214 to float addrspace(1)*
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !11
  %217 = fcmp contract ugt float %63, %216
  br i1 %217, label %1470, label %218

218:                                              ; preds = %213
  %219 = xor i32 %4, -1
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds float, float* %45, i64 %220
  %222 = addrspacecast float* %221 to float addrspace(1)*
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !11
  %224 = fcmp contract ugt float %63, %223
  br i1 %224, label %1470, label %225

225:                                              ; preds = %218
  %226 = sub nsw i32 0, %4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds float, float* %45, i64 %227
  %229 = addrspacecast float* %228 to float addrspace(1)*
  %230 = load float, float addrspace(1)* %229, align 4, !tbaa !11
  %231 = fcmp contract ugt float %63, %230
  br i1 %231, label %1470, label %232

232:                                              ; preds = %225
  %233 = sub i32 1, %4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float* %45, i64 %234
  %236 = addrspacecast float* %235 to float addrspace(1)*
  %237 = load float, float addrspace(1)* %236, align 4, !tbaa !11
  %238 = fcmp contract ugt float %63, %237
  br i1 %238, label %1470, label %239

239:                                              ; preds = %232
  %240 = add nsw i32 %4, -1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds float, float* %45, i64 %241
  %243 = addrspacecast float* %242 to float addrspace(1)*
  %244 = load float, float addrspace(1)* %243, align 4, !tbaa !11
  %245 = fcmp contract ugt float %63, %244
  br i1 %245, label %1470, label %246

246:                                              ; preds = %239
  %247 = sext i32 %4 to i64
  %248 = getelementptr inbounds float, float* %45, i64 %247
  %249 = addrspacecast float* %248 to float addrspace(1)*
  %250 = load float, float addrspace(1)* %249, align 4, !tbaa !11
  %251 = fcmp contract ugt float %63, %250
  br i1 %251, label %1470, label %252

252:                                              ; preds = %246
  %253 = add nsw i32 %4, 1
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float* %45, i64 %254
  %256 = addrspacecast float* %255 to float addrspace(1)*
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !11
  %258 = fcmp contract ugt float %63, %257
  br i1 %258, label %1470, label %259

259:                                              ; preds = %252
  %260 = load float, float addrspace(1)* %60, align 4, !tbaa !11
  %261 = fcmp contract ugt float %63, %260
  br i1 %261, label %1470, label %262

262:                                              ; preds = %259
  %263 = getelementptr inbounds float, float* %59, i64 -1
  %264 = addrspacecast float* %263 to float addrspace(1)*
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !11
  %266 = fcmp contract ugt float %63, %265
  br i1 %266, label %1470, label %267

267:                                              ; preds = %262
  %268 = getelementptr inbounds float, float* %59, i64 1
  %269 = addrspacecast float* %268 to float addrspace(1)*
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !11
  %271 = fcmp contract ugt float %63, %270
  br i1 %271, label %1470, label %272

272:                                              ; preds = %267
  %273 = getelementptr inbounds float, float* %59, i64 %220
  %274 = addrspacecast float* %273 to float addrspace(1)*
  %275 = load float, float addrspace(1)* %274, align 4, !tbaa !11
  %276 = fcmp contract ugt float %63, %275
  br i1 %276, label %1470, label %277

277:                                              ; preds = %272
  %278 = getelementptr inbounds float, float* %59, i64 %227
  %279 = addrspacecast float* %278 to float addrspace(1)*
  %280 = load float, float addrspace(1)* %279, align 4, !tbaa !11
  %281 = fcmp contract ugt float %63, %280
  br i1 %281, label %1470, label %282

282:                                              ; preds = %277
  %283 = getelementptr inbounds float, float* %59, i64 %234
  %284 = addrspacecast float* %283 to float addrspace(1)*
  %285 = load float, float addrspace(1)* %284, align 4, !tbaa !11
  %286 = fcmp contract ugt float %63, %285
  br i1 %286, label %1470, label %287

287:                                              ; preds = %282
  %288 = getelementptr inbounds float, float* %59, i64 %241
  %289 = addrspacecast float* %288 to float addrspace(1)*
  %290 = load float, float addrspace(1)* %289, align 4, !tbaa !11
  %291 = fcmp contract ugt float %63, %290
  br i1 %291, label %1470, label %292

292:                                              ; preds = %287
  %293 = getelementptr inbounds float, float* %59, i64 %247
  %294 = addrspacecast float* %293 to float addrspace(1)*
  %295 = load float, float addrspace(1)* %294, align 4, !tbaa !11
  %296 = fcmp contract ugt float %63, %295
  br i1 %296, label %1470, label %297

297:                                              ; preds = %292
  %298 = getelementptr inbounds float, float* %59, i64 %254
  %299 = addrspacecast float* %298 to float addrspace(1)*
  %300 = load float, float addrspace(1)* %299, align 4, !tbaa !11
  %301 = fcmp contract ugt float %63, %300
  br i1 %301, label %1470, label %302

302:                                              ; preds = %297
  %303 = load float, float addrspace(1)* %53, align 4, !tbaa !11
  %304 = fcmp contract ugt float %63, %303
  br i1 %304, label %1470, label %305

305:                                              ; preds = %302
  %306 = getelementptr inbounds float, float* %52, i64 -1
  %307 = addrspacecast float* %306 to float addrspace(1)*
  %308 = load float, float addrspace(1)* %307, align 4, !tbaa !11
  %309 = fcmp contract ugt float %63, %308
  br i1 %309, label %1470, label %310

310:                                              ; preds = %305
  %311 = getelementptr inbounds float, float* %52, i64 1
  %312 = addrspacecast float* %311 to float addrspace(1)*
  %313 = load float, float addrspace(1)* %312, align 4, !tbaa !11
  %314 = fcmp contract ugt float %63, %313
  br i1 %314, label %1470, label %315

315:                                              ; preds = %310
  %316 = getelementptr inbounds float, float* %52, i64 %220
  %317 = addrspacecast float* %316 to float addrspace(1)*
  %318 = load float, float addrspace(1)* %317, align 4, !tbaa !11
  %319 = fcmp contract ugt float %63, %318
  br i1 %319, label %1470, label %320

320:                                              ; preds = %315
  %321 = getelementptr inbounds float, float* %52, i64 %227
  %322 = addrspacecast float* %321 to float addrspace(1)*
  %323 = load float, float addrspace(1)* %322, align 4, !tbaa !11
  %324 = fcmp contract ugt float %63, %323
  br i1 %324, label %1470, label %325

325:                                              ; preds = %320
  %326 = getelementptr inbounds float, float* %52, i64 %234
  %327 = addrspacecast float* %326 to float addrspace(1)*
  %328 = load float, float addrspace(1)* %327, align 4, !tbaa !11
  %329 = fcmp contract ugt float %63, %328
  br i1 %329, label %1470, label %330

330:                                              ; preds = %325
  %331 = getelementptr inbounds float, float* %52, i64 %241
  %332 = addrspacecast float* %331 to float addrspace(1)*
  %333 = load float, float addrspace(1)* %332, align 4, !tbaa !11
  %334 = fcmp contract ugt float %63, %333
  br i1 %334, label %1470, label %335

335:                                              ; preds = %330
  %336 = getelementptr inbounds float, float* %52, i64 %247
  %337 = addrspacecast float* %336 to float addrspace(1)*
  %338 = load float, float addrspace(1)* %337, align 4, !tbaa !11
  %339 = fcmp contract ugt float %63, %338
  br i1 %339, label %1470, label %340

340:                                              ; preds = %335
  %341 = getelementptr inbounds float, float* %52, i64 %254
  %342 = addrspacecast float* %341 to float addrspace(1)*
  %343 = load float, float addrspace(1)* %342, align 4, !tbaa !11
  %344 = fcmp contract ugt float %63, %343
  br i1 %344, label %1470, label %345

345:                                              ; preds = %340, %201
  %346 = phi i64 [ %220, %340 ], [ %81, %201 ]
  %347 = phi i64 [ %241, %340 ], [ %102, %201 ]
  %348 = phi i64 [ %234, %340 ], [ %95, %201 ]
  %349 = phi i64 [ %254, %340 ], [ %115, %201 ]
  %350 = phi i64 [ %227, %340 ], [ %88, %201 ]
  %351 = phi i64 [ %247, %340 ], [ %108, %201 ]
  %352 = mul nsw i32 %62, %61
  %353 = zext i32 %31 to i64
  %354 = getelementptr inbounds float, float* %43, i64 %353
  %355 = addrspacecast float* %354 to float addrspace(1)*
  %356 = getelementptr inbounds float, float* %51, i64 %353
  %357 = addrspacecast float* %356 to float addrspace(1)*
  %358 = getelementptr inbounds float, float* %58, i64 %353
  %359 = addrspacecast float* %358 to float addrspace(1)*
  %360 = getelementptr inbounds float, float* %354, i64 1
  %361 = addrspacecast float* %360 to float addrspace(1)*
  %362 = load float, float addrspace(1)* %361, align 4, !tbaa !11
  %363 = getelementptr inbounds float, float* %354, i64 -1
  %364 = addrspacecast float* %363 to float addrspace(1)*
  %365 = load float, float addrspace(1)* %364, align 4, !tbaa !11
  %366 = fsub contract float %362, %365
  %367 = fmul contract float %366, 0x3F056AC020000000
  %368 = getelementptr inbounds float, float* %354, i64 %351
  %369 = addrspacecast float* %368 to float addrspace(1)*
  %370 = load float, float addrspace(1)* %369, align 4, !tbaa !11
  %371 = getelementptr inbounds float, float* %354, i64 %350
  %372 = addrspacecast float* %371 to float addrspace(1)*
  %373 = load float, float addrspace(1)* %372, align 4, !tbaa !11
  %374 = fsub contract float %370, %373
  %375 = fmul contract float %374, 0x3F056AC020000000
  %376 = load float, float addrspace(1)* %359, align 4, !tbaa !11
  %377 = load float, float addrspace(1)* %357, align 4, !tbaa !11
  %378 = fsub contract float %376, %377
  %379 = fmul contract float %378, 0x3F056AC020000000
  %380 = load float, float addrspace(1)* %355, align 4, !tbaa !11
  %381 = fmul contract float %380, 2.000000e+00
  %382 = fadd contract float %362, %365
  %383 = fsub contract float %382, %381
  %384 = fmul contract float %383, 0x3F156AC020000000
  %385 = fadd contract float %370, %373
  %386 = fsub contract float %385, %381
  %387 = fmul contract float %386, 0x3F156AC020000000
  %388 = fadd contract float %376, %377
  %389 = fsub contract float %388, %381
  %390 = fmul contract float %389, 0x3F156AC020000000
  %391 = getelementptr inbounds float, float* %354, i64 %349
  %392 = addrspacecast float* %391 to float addrspace(1)*
  %393 = load float, float addrspace(1)* %392, align 4, !tbaa !11
  %394 = getelementptr inbounds float, float* %354, i64 %348
  %395 = addrspacecast float* %394 to float addrspace(1)*
  %396 = load float, float addrspace(1)* %395, align 4, !tbaa !11
  %397 = fsub contract float %393, %396
  %398 = getelementptr inbounds float, float* %354, i64 %347
  %399 = addrspacecast float* %398 to float addrspace(1)*
  %400 = load float, float addrspace(1)* %399, align 4, !tbaa !11
  %401 = fsub contract float %397, %400
  %402 = getelementptr inbounds float, float* %354, i64 %346
  %403 = addrspacecast float* %402 to float addrspace(1)*
  %404 = load float, float addrspace(1)* %403, align 4, !tbaa !11
  %405 = fadd contract float %401, %404
  %406 = fmul contract float %405, 0x3EF56AC020000000
  %407 = getelementptr inbounds float, float* %358, i64 1
  %408 = addrspacecast float* %407 to float addrspace(1)*
  %409 = load float, float addrspace(1)* %408, align 4, !tbaa !11
  %410 = getelementptr inbounds float, float* %358, i64 -1
  %411 = addrspacecast float* %410 to float addrspace(1)*
  %412 = load float, float addrspace(1)* %411, align 4, !tbaa !11
  %413 = fsub contract float %409, %412
  %414 = getelementptr inbounds float, float* %356, i64 1
  %415 = addrspacecast float* %414 to float addrspace(1)*
  %416 = load float, float addrspace(1)* %415, align 4, !tbaa !11
  %417 = fsub contract float %413, %416
  %418 = getelementptr inbounds float, float* %356, i64 -1
  %419 = addrspacecast float* %418 to float addrspace(1)*
  %420 = load float, float addrspace(1)* %419, align 4, !tbaa !11
  %421 = fadd contract float %417, %420
  %422 = fmul contract float %421, 0x3EF56AC020000000
  %423 = getelementptr inbounds float, float* %358, i64 %351
  %424 = addrspacecast float* %423 to float addrspace(1)*
  %425 = load float, float addrspace(1)* %424, align 4, !tbaa !11
  %426 = getelementptr inbounds float, float* %358, i64 %350
  %427 = addrspacecast float* %426 to float addrspace(1)*
  %428 = load float, float addrspace(1)* %427, align 4, !tbaa !11
  %429 = fsub contract float %425, %428
  %430 = getelementptr inbounds float, float* %356, i64 %351
  %431 = addrspacecast float* %430 to float addrspace(1)*
  %432 = load float, float addrspace(1)* %431, align 4, !tbaa !11
  %433 = fsub contract float %429, %432
  %434 = getelementptr inbounds float, float* %356, i64 %350
  %435 = addrspacecast float* %434 to float addrspace(1)*
  %436 = load float, float addrspace(1)* %435, align 4, !tbaa !11
  %437 = fadd contract float %433, %436
  %438 = fmul contract float %437, 0x3EF56AC020000000
  %439 = fmul contract float %387, %390
  %440 = fmul contract float %438, %438
  %441 = fsub contract float %439, %440
  %442 = fmul contract float %422, %438
  %443 = fmul contract float %390, %406
  %444 = fsub contract float %442, %443
  %445 = fmul contract float %406, %438
  %446 = fmul contract float %387, %422
  %447 = fsub contract float %445, %446
  %448 = fmul contract float %384, %441
  %449 = fmul contract float %406, %444
  %450 = fadd contract float %448, %449
  %451 = fmul contract float %422, %447
  %452 = fadd contract float %451, %450
  %453 = fmul contract float %384, %390
  %454 = fmul contract float %422, %422
  %455 = fsub contract float %453, %454
  %456 = fmul contract float %406, %422
  %457 = fmul contract float %384, %438
  %458 = fsub contract float %456, %457
  %459 = fmul contract float %384, %387
  %460 = fmul contract float %406, %406
  %461 = fsub contract float %459, %460
  %462 = fmul contract float %367, %441
  %463 = fmul contract float %375, %444
  %464 = fadd contract float %462, %463
  %465 = fmul contract float %379, %447
  %466 = fadd contract float %465, %464
  %467 = fmul contract float %367, %444
  %468 = fmul contract float %375, %455
  %469 = fadd contract float %468, %467
  %470 = fmul contract float %379, %458
  %471 = fadd contract float %470, %469
  %472 = fmul contract float %367, %447
  %473 = fmul contract float %375, %458
  %474 = fadd contract float %472, %473
  %475 = fmul contract float %379, %461
  %476 = fadd contract float %475, %474
  %477 = fdiv contract float -1.000000e+00, %452
  %478 = fmul contract float %466, %477
  %479 = fmul contract float %471, %477
  %480 = fmul contract float %476, %477
  %481 = tail call float @llvm.fabs.f32(float %480)
  %482 = fcmp contract olt float %481, 5.000000e-01
  %483 = tail call float @llvm.fabs.f32(float %478)
  %484 = fcmp contract olt float %483, 5.000000e-01
  %485 = select i1 %482, i1 %484, i1 false
  %486 = tail call float @llvm.fabs.f32(float %479)
  %487 = fcmp contract olt float %486, 5.000000e-01
  %488 = select i1 %485, i1 %487, i1 false
  br i1 %488, label %524, label %489

489:                                              ; preds = %345
  %490 = fcmp contract ogt float %478, 0.000000e+00
  %491 = fpext float %478 to double
  %492 = select i1 %490, double 5.000000e-01, double -5.000000e-01
  %493 = fcmp contract ogt float %479, 0.000000e+00
  %494 = select i1 %493, double 5.000000e-01, double -5.000000e-01
  %495 = fpext float %479 to double
  %496 = insertelement <2 x double> poison, double %494, i64 0
  %497 = insertelement <2 x double> %496, double %492, i64 1
  %498 = insertelement <2 x double> poison, double %495, i64 0
  %499 = insertelement <2 x double> %498, double %491, i64 1
  %500 = fadd contract <2 x double> %497, %499
  %501 = fptosi <2 x double> %500 to <2 x i32>
  %502 = add nsw <2 x i32> %25, %501
  %503 = fcmp contract ogt float %480, 0.000000e+00
  %504 = select i1 %503, double 5.000000e-01, double -5.000000e-01
  %505 = fpext float %480 to double
  %506 = fadd contract double %504, %505
  %507 = fptosi double %506 to i32
  %508 = add nsw i32 %507, %2
  %509 = sub nsw i32 %508, %352
  %510 = icmp slt i32 %509, 1
  br i1 %510, label %524, label %511

511:                                              ; preds = %489
  %512 = icmp sgt i32 %509, %7
  %513 = extractelement <2 x i32> %502, i64 0
  %514 = icmp slt i32 %513, 5
  %515 = select i1 %512, i1 true, i1 %514
  %516 = icmp sge i32 %513, %26
  %517 = extractelement <2 x i32> %502, i64 1
  %518 = icmp slt i32 %517, 5
  %519 = icmp sge i32 %517, %30
  %520 = select i1 %515, i1 true, i1 %516
  %521 = select i1 %520, i1 true, i1 %518
  %522 = select i1 %521, i1 true, i1 %519
  %523 = zext i1 %522 to i32
  br label %524

524:                                              ; preds = %345, %511, %489
  %525 = phi i32 [ 1, %489 ], [ %523, %511 ], [ 2, %345 ]
  %526 = phi i32 [ %508, %489 ], [ %508, %511 ], [ %2, %345 ]
  %527 = phi <2 x i32> [ %502, %489 ], [ %502, %511 ], [ %25, %345 ]
  %528 = extractelement <2 x i32> %527, i64 0
  %529 = extractelement <2 x i32> %527, i64 1
  switch i32 %525, label %1470 [
    i32 0, label %530
    i32 2, label %1318
  ]

530:                                              ; preds = %524
  %531 = sext i32 %526 to i64
  %532 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %531
  %533 = load float*, float* addrspace(1)* %532, align 8, !tbaa !7
  %534 = mul nsw i32 %528, %4
  %535 = sext i32 %534 to i64
  %536 = getelementptr inbounds float, float* %533, i64 %535
  %537 = sext i32 %529 to i64
  %538 = getelementptr inbounds float, float* %536, i64 %537
  %539 = addrspacecast float* %538 to float addrspace(1)*
  %540 = add nsw i32 %526, -1
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %541
  %543 = load float*, float* addrspace(1)* %542, align 8, !tbaa !7
  %544 = getelementptr inbounds float, float* %543, i64 %535
  %545 = getelementptr inbounds float, float* %544, i64 %537
  %546 = addrspacecast float* %545 to float addrspace(1)*
  %547 = add nsw i32 %526, 1
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %548
  %550 = load float*, float* addrspace(1)* %549, align 8, !tbaa !7
  %551 = getelementptr inbounds float, float* %550, i64 %535
  %552 = getelementptr inbounds float, float* %551, i64 %537
  %553 = addrspacecast float* %552 to float addrspace(1)*
  %554 = getelementptr inbounds float, float* %538, i64 1
  %555 = addrspacecast float* %554 to float addrspace(1)*
  %556 = load float, float addrspace(1)* %555, align 4, !tbaa !11
  %557 = getelementptr inbounds float, float* %538, i64 -1
  %558 = addrspacecast float* %557 to float addrspace(1)*
  %559 = load float, float addrspace(1)* %558, align 4, !tbaa !11
  %560 = fsub contract float %556, %559
  %561 = fmul contract float %560, 0x3F056AC020000000
  %562 = getelementptr inbounds float, float* %538, i64 %351
  %563 = addrspacecast float* %562 to float addrspace(1)*
  %564 = load float, float addrspace(1)* %563, align 4, !tbaa !11
  %565 = getelementptr inbounds float, float* %538, i64 %350
  %566 = addrspacecast float* %565 to float addrspace(1)*
  %567 = load float, float addrspace(1)* %566, align 4, !tbaa !11
  %568 = fsub contract float %564, %567
  %569 = fmul contract float %568, 0x3F056AC020000000
  %570 = load float, float addrspace(1)* %553, align 4, !tbaa !11
  %571 = load float, float addrspace(1)* %546, align 4, !tbaa !11
  %572 = fsub contract float %570, %571
  %573 = fmul contract float %572, 0x3F056AC020000000
  %574 = load float, float addrspace(1)* %539, align 4, !tbaa !11
  %575 = fmul contract float %574, 2.000000e+00
  %576 = fadd contract float %556, %559
  %577 = fsub contract float %576, %575
  %578 = fmul contract float %577, 0x3F156AC020000000
  %579 = fadd contract float %564, %567
  %580 = fsub contract float %579, %575
  %581 = fmul contract float %580, 0x3F156AC020000000
  %582 = fadd contract float %570, %571
  %583 = fsub contract float %582, %575
  %584 = fmul contract float %583, 0x3F156AC020000000
  %585 = getelementptr inbounds float, float* %538, i64 %349
  %586 = addrspacecast float* %585 to float addrspace(1)*
  %587 = load float, float addrspace(1)* %586, align 4, !tbaa !11
  %588 = getelementptr inbounds float, float* %538, i64 %348
  %589 = addrspacecast float* %588 to float addrspace(1)*
  %590 = load float, float addrspace(1)* %589, align 4, !tbaa !11
  %591 = fsub contract float %587, %590
  %592 = getelementptr inbounds float, float* %538, i64 %347
  %593 = addrspacecast float* %592 to float addrspace(1)*
  %594 = load float, float addrspace(1)* %593, align 4, !tbaa !11
  %595 = fsub contract float %591, %594
  %596 = getelementptr inbounds float, float* %538, i64 %346
  %597 = addrspacecast float* %596 to float addrspace(1)*
  %598 = load float, float addrspace(1)* %597, align 4, !tbaa !11
  %599 = fadd contract float %595, %598
  %600 = fmul contract float %599, 0x3EF56AC020000000
  %601 = getelementptr inbounds float, float* %552, i64 1
  %602 = addrspacecast float* %601 to float addrspace(1)*
  %603 = load float, float addrspace(1)* %602, align 4, !tbaa !11
  %604 = getelementptr inbounds float, float* %552, i64 -1
  %605 = addrspacecast float* %604 to float addrspace(1)*
  %606 = load float, float addrspace(1)* %605, align 4, !tbaa !11
  %607 = fsub contract float %603, %606
  %608 = getelementptr inbounds float, float* %545, i64 1
  %609 = addrspacecast float* %608 to float addrspace(1)*
  %610 = load float, float addrspace(1)* %609, align 4, !tbaa !11
  %611 = fsub contract float %607, %610
  %612 = getelementptr inbounds float, float* %545, i64 -1
  %613 = addrspacecast float* %612 to float addrspace(1)*
  %614 = load float, float addrspace(1)* %613, align 4, !tbaa !11
  %615 = fadd contract float %611, %614
  %616 = fmul contract float %615, 0x3EF56AC020000000
  %617 = getelementptr inbounds float, float* %552, i64 %351
  %618 = addrspacecast float* %617 to float addrspace(1)*
  %619 = load float, float addrspace(1)* %618, align 4, !tbaa !11
  %620 = getelementptr inbounds float, float* %552, i64 %350
  %621 = addrspacecast float* %620 to float addrspace(1)*
  %622 = load float, float addrspace(1)* %621, align 4, !tbaa !11
  %623 = fsub contract float %619, %622
  %624 = getelementptr inbounds float, float* %545, i64 %351
  %625 = addrspacecast float* %624 to float addrspace(1)*
  %626 = load float, float addrspace(1)* %625, align 4, !tbaa !11
  %627 = fsub contract float %623, %626
  %628 = getelementptr inbounds float, float* %545, i64 %350
  %629 = addrspacecast float* %628 to float addrspace(1)*
  %630 = load float, float addrspace(1)* %629, align 4, !tbaa !11
  %631 = fadd contract float %627, %630
  %632 = fmul contract float %631, 0x3EF56AC020000000
  %633 = fmul contract float %581, %584
  %634 = fmul contract float %632, %632
  %635 = fsub contract float %633, %634
  %636 = fmul contract float %616, %632
  %637 = fmul contract float %584, %600
  %638 = fsub contract float %636, %637
  %639 = fmul contract float %600, %632
  %640 = fmul contract float %581, %616
  %641 = fsub contract float %639, %640
  %642 = fmul contract float %578, %635
  %643 = fmul contract float %600, %638
  %644 = fadd contract float %642, %643
  %645 = fmul contract float %616, %641
  %646 = fadd contract float %645, %644
  %647 = fmul contract float %578, %584
  %648 = fmul contract float %616, %616
  %649 = fsub contract float %647, %648
  %650 = fmul contract float %600, %616
  %651 = fmul contract float %578, %632
  %652 = fsub contract float %650, %651
  %653 = fmul contract float %578, %581
  %654 = fmul contract float %600, %600
  %655 = fsub contract float %653, %654
  %656 = fmul contract float %561, %635
  %657 = fmul contract float %569, %638
  %658 = fadd contract float %656, %657
  %659 = fmul contract float %573, %641
  %660 = fadd contract float %659, %658
  %661 = fmul contract float %561, %638
  %662 = fmul contract float %569, %649
  %663 = fadd contract float %662, %661
  %664 = fmul contract float %573, %652
  %665 = fadd contract float %664, %663
  %666 = fmul contract float %561, %641
  %667 = fmul contract float %569, %652
  %668 = fadd contract float %666, %667
  %669 = fmul contract float %573, %655
  %670 = fadd contract float %669, %668
  %671 = fdiv contract float -1.000000e+00, %646
  %672 = insertelement <2 x float> poison, float %665, i64 0
  %673 = insertelement <2 x float> %672, float %660, i64 1
  %674 = insertelement <2 x float> poison, float %671, i64 0
  %675 = shufflevector <2 x float> %674, <2 x float> poison, <2 x i32> zeroinitializer
  %676 = fmul contract <2 x float> %673, %675
  %677 = fmul contract float %670, %671
  %678 = tail call float @llvm.fabs.f32(float %677)
  %679 = fcmp contract olt float %678, 5.000000e-01
  %680 = extractelement <2 x float> %676, i64 1
  %681 = tail call float @llvm.fabs.f32(float %680)
  %682 = fcmp contract olt float %681, 5.000000e-01
  %683 = select i1 %679, i1 %682, i1 false
  %684 = extractelement <2 x float> %676, i64 0
  %685 = tail call float @llvm.fabs.f32(float %684)
  %686 = fcmp contract olt float %685, 5.000000e-01
  %687 = select i1 %683, i1 %686, i1 false
  br i1 %687, label %716, label %688

688:                                              ; preds = %530
  %689 = fcmp contract ogt <2 x float> %676, zeroinitializer
  %690 = fpext <2 x float> %676 to <2 x double>
  %691 = select <2 x i1> %689, <2 x double> <double 5.000000e-01, double 5.000000e-01>, <2 x double> <double -5.000000e-01, double -5.000000e-01>
  %692 = fadd contract <2 x double> %691, %690
  %693 = fptosi <2 x double> %692 to <2 x i32>
  %694 = add nsw <2 x i32> %527, %693
  %695 = fcmp contract ogt float %677, 0.000000e+00
  %696 = select i1 %695, double 5.000000e-01, double -5.000000e-01
  %697 = fpext float %677 to double
  %698 = fadd contract double %696, %697
  %699 = fptosi double %698 to i32
  %700 = add nsw i32 %526, %699
  %701 = sub nsw i32 %700, %352
  %702 = icmp slt i32 %701, 1
  br i1 %702, label %716, label %703

703:                                              ; preds = %688
  %704 = icmp sgt i32 %701, %7
  %705 = extractelement <2 x i32> %694, i64 0
  %706 = icmp slt i32 %705, 5
  %707 = select i1 %704, i1 true, i1 %706
  %708 = icmp sge i32 %705, %26
  %709 = extractelement <2 x i32> %694, i64 1
  %710 = icmp slt i32 %709, 5
  %711 = icmp sge i32 %709, %30
  %712 = select i1 %707, i1 true, i1 %708
  %713 = select i1 %712, i1 true, i1 %710
  %714 = select i1 %713, i1 true, i1 %711
  %715 = zext i1 %714 to i32
  br label %716

716:                                              ; preds = %703, %688, %530
  %717 = phi i32 [ 1, %688 ], [ %715, %703 ], [ 2, %530 ]
  %718 = phi i32 [ %700, %688 ], [ %700, %703 ], [ %526, %530 ]
  %719 = phi <2 x i32> [ %694, %688 ], [ %694, %703 ], [ %527, %530 ]
  %720 = extractelement <2 x i32> %719, i64 0
  %721 = extractelement <2 x i32> %719, i64 1
  switch i32 %717, label %1470 [
    i32 0, label %722
    i32 2, label %1318
  ]

722:                                              ; preds = %716
  %723 = sext i32 %718 to i64
  %724 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %723
  %725 = load float*, float* addrspace(1)* %724, align 8, !tbaa !7
  %726 = mul nsw i32 %720, %4
  %727 = sext i32 %726 to i64
  %728 = getelementptr inbounds float, float* %725, i64 %727
  %729 = sext i32 %721 to i64
  %730 = getelementptr inbounds float, float* %728, i64 %729
  %731 = addrspacecast float* %730 to float addrspace(1)*
  %732 = add nsw i32 %718, -1
  %733 = sext i32 %732 to i64
  %734 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %733
  %735 = load float*, float* addrspace(1)* %734, align 8, !tbaa !7
  %736 = getelementptr inbounds float, float* %735, i64 %727
  %737 = getelementptr inbounds float, float* %736, i64 %729
  %738 = addrspacecast float* %737 to float addrspace(1)*
  %739 = add nsw i32 %718, 1
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %740
  %742 = load float*, float* addrspace(1)* %741, align 8, !tbaa !7
  %743 = getelementptr inbounds float, float* %742, i64 %727
  %744 = getelementptr inbounds float, float* %743, i64 %729
  %745 = addrspacecast float* %744 to float addrspace(1)*
  %746 = getelementptr inbounds float, float* %730, i64 1
  %747 = addrspacecast float* %746 to float addrspace(1)*
  %748 = load float, float addrspace(1)* %747, align 4, !tbaa !11
  %749 = getelementptr inbounds float, float* %730, i64 -1
  %750 = addrspacecast float* %749 to float addrspace(1)*
  %751 = load float, float addrspace(1)* %750, align 4, !tbaa !11
  %752 = fsub contract float %748, %751
  %753 = fmul contract float %752, 0x3F056AC020000000
  %754 = getelementptr inbounds float, float* %730, i64 %351
  %755 = addrspacecast float* %754 to float addrspace(1)*
  %756 = load float, float addrspace(1)* %755, align 4, !tbaa !11
  %757 = getelementptr inbounds float, float* %730, i64 %350
  %758 = addrspacecast float* %757 to float addrspace(1)*
  %759 = load float, float addrspace(1)* %758, align 4, !tbaa !11
  %760 = fsub contract float %756, %759
  %761 = fmul contract float %760, 0x3F056AC020000000
  %762 = load float, float addrspace(1)* %745, align 4, !tbaa !11
  %763 = load float, float addrspace(1)* %738, align 4, !tbaa !11
  %764 = fsub contract float %762, %763
  %765 = fmul contract float %764, 0x3F056AC020000000
  %766 = load float, float addrspace(1)* %731, align 4, !tbaa !11
  %767 = fmul contract float %766, 2.000000e+00
  %768 = fadd contract float %748, %751
  %769 = fsub contract float %768, %767
  %770 = fmul contract float %769, 0x3F156AC020000000
  %771 = fadd contract float %756, %759
  %772 = fsub contract float %771, %767
  %773 = fmul contract float %772, 0x3F156AC020000000
  %774 = fadd contract float %762, %763
  %775 = fsub contract float %774, %767
  %776 = fmul contract float %775, 0x3F156AC020000000
  %777 = getelementptr inbounds float, float* %730, i64 %349
  %778 = addrspacecast float* %777 to float addrspace(1)*
  %779 = load float, float addrspace(1)* %778, align 4, !tbaa !11
  %780 = getelementptr inbounds float, float* %730, i64 %348
  %781 = addrspacecast float* %780 to float addrspace(1)*
  %782 = load float, float addrspace(1)* %781, align 4, !tbaa !11
  %783 = fsub contract float %779, %782
  %784 = getelementptr inbounds float, float* %730, i64 %347
  %785 = addrspacecast float* %784 to float addrspace(1)*
  %786 = load float, float addrspace(1)* %785, align 4, !tbaa !11
  %787 = fsub contract float %783, %786
  %788 = getelementptr inbounds float, float* %730, i64 %346
  %789 = addrspacecast float* %788 to float addrspace(1)*
  %790 = load float, float addrspace(1)* %789, align 4, !tbaa !11
  %791 = fadd contract float %787, %790
  %792 = fmul contract float %791, 0x3EF56AC020000000
  %793 = getelementptr inbounds float, float* %744, i64 1
  %794 = addrspacecast float* %793 to float addrspace(1)*
  %795 = load float, float addrspace(1)* %794, align 4, !tbaa !11
  %796 = getelementptr inbounds float, float* %744, i64 -1
  %797 = addrspacecast float* %796 to float addrspace(1)*
  %798 = load float, float addrspace(1)* %797, align 4, !tbaa !11
  %799 = fsub contract float %795, %798
  %800 = getelementptr inbounds float, float* %737, i64 1
  %801 = addrspacecast float* %800 to float addrspace(1)*
  %802 = load float, float addrspace(1)* %801, align 4, !tbaa !11
  %803 = fsub contract float %799, %802
  %804 = getelementptr inbounds float, float* %737, i64 -1
  %805 = addrspacecast float* %804 to float addrspace(1)*
  %806 = load float, float addrspace(1)* %805, align 4, !tbaa !11
  %807 = fadd contract float %803, %806
  %808 = fmul contract float %807, 0x3EF56AC020000000
  %809 = getelementptr inbounds float, float* %744, i64 %351
  %810 = addrspacecast float* %809 to float addrspace(1)*
  %811 = load float, float addrspace(1)* %810, align 4, !tbaa !11
  %812 = getelementptr inbounds float, float* %744, i64 %350
  %813 = addrspacecast float* %812 to float addrspace(1)*
  %814 = load float, float addrspace(1)* %813, align 4, !tbaa !11
  %815 = fsub contract float %811, %814
  %816 = getelementptr inbounds float, float* %737, i64 %351
  %817 = addrspacecast float* %816 to float addrspace(1)*
  %818 = load float, float addrspace(1)* %817, align 4, !tbaa !11
  %819 = fsub contract float %815, %818
  %820 = getelementptr inbounds float, float* %737, i64 %350
  %821 = addrspacecast float* %820 to float addrspace(1)*
  %822 = load float, float addrspace(1)* %821, align 4, !tbaa !11
  %823 = fadd contract float %819, %822
  %824 = fmul contract float %823, 0x3EF56AC020000000
  %825 = fmul contract float %773, %776
  %826 = fmul contract float %824, %824
  %827 = fsub contract float %825, %826
  %828 = fmul contract float %808, %824
  %829 = fmul contract float %776, %792
  %830 = fsub contract float %828, %829
  %831 = fmul contract float %792, %824
  %832 = fmul contract float %773, %808
  %833 = fsub contract float %831, %832
  %834 = fmul contract float %770, %827
  %835 = fmul contract float %792, %830
  %836 = fadd contract float %834, %835
  %837 = fmul contract float %808, %833
  %838 = fadd contract float %837, %836
  %839 = fmul contract float %770, %776
  %840 = fmul contract float %808, %808
  %841 = fsub contract float %839, %840
  %842 = fmul contract float %792, %808
  %843 = fmul contract float %770, %824
  %844 = fsub contract float %842, %843
  %845 = fmul contract float %770, %773
  %846 = fmul contract float %792, %792
  %847 = fsub contract float %845, %846
  %848 = fmul contract float %753, %827
  %849 = fmul contract float %761, %830
  %850 = fadd contract float %848, %849
  %851 = fmul contract float %765, %833
  %852 = fmul contract float %753, %830
  %853 = fmul contract float %761, %841
  %854 = fadd contract float %853, %852
  %855 = fmul contract float %765, %844
  %856 = fmul contract float %753, %833
  %857 = fmul contract float %761, %844
  %858 = fadd contract float %856, %857
  %859 = fmul contract float %765, %847
  %860 = fadd contract float %859, %858
  %861 = fdiv contract float -1.000000e+00, %838
  %862 = insertelement <2 x float> poison, float %855, i64 0
  %863 = insertelement <2 x float> %862, float %851, i64 1
  %864 = insertelement <2 x float> poison, float %854, i64 0
  %865 = insertelement <2 x float> %864, float %850, i64 1
  %866 = fadd contract <2 x float> %863, %865
  %867 = insertelement <2 x float> poison, float %861, i64 0
  %868 = shufflevector <2 x float> %867, <2 x float> poison, <2 x i32> zeroinitializer
  %869 = fmul contract <2 x float> %866, %868
  %870 = fmul contract float %860, %861
  %871 = tail call float @llvm.fabs.f32(float %870)
  %872 = fcmp contract olt float %871, 5.000000e-01
  %873 = extractelement <2 x float> %869, i64 1
  %874 = tail call float @llvm.fabs.f32(float %873)
  %875 = fcmp contract olt float %874, 5.000000e-01
  %876 = select i1 %872, i1 %875, i1 false
  %877 = extractelement <2 x float> %869, i64 0
  %878 = tail call float @llvm.fabs.f32(float %877)
  %879 = fcmp contract olt float %878, 5.000000e-01
  %880 = select i1 %876, i1 %879, i1 false
  br i1 %880, label %909, label %881

881:                                              ; preds = %722
  %882 = fcmp contract ogt <2 x float> %869, zeroinitializer
  %883 = fpext <2 x float> %869 to <2 x double>
  %884 = select <2 x i1> %882, <2 x double> <double 5.000000e-01, double 5.000000e-01>, <2 x double> <double -5.000000e-01, double -5.000000e-01>
  %885 = fadd contract <2 x double> %884, %883
  %886 = fptosi <2 x double> %885 to <2 x i32>
  %887 = add nsw <2 x i32> %719, %886
  %888 = fcmp contract ogt float %870, 0.000000e+00
  %889 = select i1 %888, double 5.000000e-01, double -5.000000e-01
  %890 = fpext float %870 to double
  %891 = fadd contract double %889, %890
  %892 = fptosi double %891 to i32
  %893 = add nsw i32 %718, %892
  %894 = sub nsw i32 %893, %352
  %895 = icmp slt i32 %894, 1
  br i1 %895, label %909, label %896

896:                                              ; preds = %881
  %897 = icmp sgt i32 %894, %7
  %898 = extractelement <2 x i32> %887, i64 0
  %899 = icmp slt i32 %898, 5
  %900 = select i1 %897, i1 true, i1 %899
  %901 = icmp sge i32 %898, %26
  %902 = extractelement <2 x i32> %887, i64 1
  %903 = icmp slt i32 %902, 5
  %904 = icmp sge i32 %902, %30
  %905 = select i1 %900, i1 true, i1 %901
  %906 = select i1 %905, i1 true, i1 %903
  %907 = select i1 %906, i1 true, i1 %904
  %908 = zext i1 %907 to i32
  br label %909

909:                                              ; preds = %896, %881, %722
  %910 = phi i32 [ 1, %881 ], [ %908, %896 ], [ 2, %722 ]
  %911 = phi i32 [ %893, %881 ], [ %893, %896 ], [ %718, %722 ]
  %912 = phi <2 x i32> [ %887, %881 ], [ %887, %896 ], [ %719, %722 ]
  %913 = extractelement <2 x i32> %912, i64 0
  %914 = extractelement <2 x i32> %912, i64 1
  switch i32 %910, label %1470 [
    i32 0, label %915
    i32 2, label %1318
  ]

915:                                              ; preds = %909
  %916 = sext i32 %911 to i64
  %917 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %916
  %918 = load float*, float* addrspace(1)* %917, align 8, !tbaa !7
  %919 = mul nsw i32 %913, %4
  %920 = sext i32 %919 to i64
  %921 = getelementptr inbounds float, float* %918, i64 %920
  %922 = sext i32 %914 to i64
  %923 = getelementptr inbounds float, float* %921, i64 %922
  %924 = addrspacecast float* %923 to float addrspace(1)*
  %925 = add nsw i32 %911, -1
  %926 = sext i32 %925 to i64
  %927 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %926
  %928 = load float*, float* addrspace(1)* %927, align 8, !tbaa !7
  %929 = getelementptr inbounds float, float* %928, i64 %920
  %930 = getelementptr inbounds float, float* %929, i64 %922
  %931 = addrspacecast float* %930 to float addrspace(1)*
  %932 = add nsw i32 %911, 1
  %933 = sext i32 %932 to i64
  %934 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %933
  %935 = load float*, float* addrspace(1)* %934, align 8, !tbaa !7
  %936 = getelementptr inbounds float, float* %935, i64 %920
  %937 = getelementptr inbounds float, float* %936, i64 %922
  %938 = addrspacecast float* %937 to float addrspace(1)*
  %939 = getelementptr inbounds float, float* %923, i64 1
  %940 = addrspacecast float* %939 to float addrspace(1)*
  %941 = load float, float addrspace(1)* %940, align 4, !tbaa !11
  %942 = getelementptr inbounds float, float* %923, i64 -1
  %943 = addrspacecast float* %942 to float addrspace(1)*
  %944 = load float, float addrspace(1)* %943, align 4, !tbaa !11
  %945 = fsub contract float %941, %944
  %946 = fmul contract float %945, 0x3F056AC020000000
  %947 = getelementptr inbounds float, float* %923, i64 %351
  %948 = addrspacecast float* %947 to float addrspace(1)*
  %949 = load float, float addrspace(1)* %948, align 4, !tbaa !11
  %950 = getelementptr inbounds float, float* %923, i64 %350
  %951 = addrspacecast float* %950 to float addrspace(1)*
  %952 = load float, float addrspace(1)* %951, align 4, !tbaa !11
  %953 = fsub contract float %949, %952
  %954 = fmul contract float %953, 0x3F056AC020000000
  %955 = load float, float addrspace(1)* %938, align 4, !tbaa !11
  %956 = load float, float addrspace(1)* %931, align 4, !tbaa !11
  %957 = fsub contract float %955, %956
  %958 = fmul contract float %957, 0x3F056AC020000000
  %959 = load float, float addrspace(1)* %924, align 4, !tbaa !11
  %960 = fmul contract float %959, 2.000000e+00
  %961 = fadd contract float %941, %944
  %962 = fsub contract float %961, %960
  %963 = fmul contract float %962, 0x3F156AC020000000
  %964 = fadd contract float %949, %952
  %965 = fsub contract float %964, %960
  %966 = fmul contract float %965, 0x3F156AC020000000
  %967 = fadd contract float %955, %956
  %968 = fsub contract float %967, %960
  %969 = fmul contract float %968, 0x3F156AC020000000
  %970 = getelementptr inbounds float, float* %923, i64 %349
  %971 = addrspacecast float* %970 to float addrspace(1)*
  %972 = load float, float addrspace(1)* %971, align 4, !tbaa !11
  %973 = getelementptr inbounds float, float* %923, i64 %348
  %974 = addrspacecast float* %973 to float addrspace(1)*
  %975 = load float, float addrspace(1)* %974, align 4, !tbaa !11
  %976 = fsub contract float %972, %975
  %977 = getelementptr inbounds float, float* %923, i64 %347
  %978 = addrspacecast float* %977 to float addrspace(1)*
  %979 = load float, float addrspace(1)* %978, align 4, !tbaa !11
  %980 = fsub contract float %976, %979
  %981 = getelementptr inbounds float, float* %923, i64 %346
  %982 = addrspacecast float* %981 to float addrspace(1)*
  %983 = load float, float addrspace(1)* %982, align 4, !tbaa !11
  %984 = fadd contract float %980, %983
  %985 = fmul contract float %984, 0x3EF56AC020000000
  %986 = getelementptr inbounds float, float* %937, i64 1
  %987 = addrspacecast float* %986 to float addrspace(1)*
  %988 = load float, float addrspace(1)* %987, align 4, !tbaa !11
  %989 = getelementptr inbounds float, float* %937, i64 -1
  %990 = addrspacecast float* %989 to float addrspace(1)*
  %991 = load float, float addrspace(1)* %990, align 4, !tbaa !11
  %992 = fsub contract float %988, %991
  %993 = getelementptr inbounds float, float* %930, i64 1
  %994 = addrspacecast float* %993 to float addrspace(1)*
  %995 = load float, float addrspace(1)* %994, align 4, !tbaa !11
  %996 = fsub contract float %992, %995
  %997 = getelementptr inbounds float, float* %930, i64 -1
  %998 = addrspacecast float* %997 to float addrspace(1)*
  %999 = load float, float addrspace(1)* %998, align 4, !tbaa !11
  %1000 = fadd contract float %996, %999
  %1001 = fmul contract float %1000, 0x3EF56AC020000000
  %1002 = getelementptr inbounds float, float* %937, i64 %351
  %1003 = addrspacecast float* %1002 to float addrspace(1)*
  %1004 = load float, float addrspace(1)* %1003, align 4, !tbaa !11
  %1005 = getelementptr inbounds float, float* %937, i64 %350
  %1006 = addrspacecast float* %1005 to float addrspace(1)*
  %1007 = load float, float addrspace(1)* %1006, align 4, !tbaa !11
  %1008 = fsub contract float %1004, %1007
  %1009 = getelementptr inbounds float, float* %930, i64 %351
  %1010 = addrspacecast float* %1009 to float addrspace(1)*
  %1011 = load float, float addrspace(1)* %1010, align 4, !tbaa !11
  %1012 = fsub contract float %1008, %1011
  %1013 = getelementptr inbounds float, float* %930, i64 %350
  %1014 = addrspacecast float* %1013 to float addrspace(1)*
  %1015 = load float, float addrspace(1)* %1014, align 4, !tbaa !11
  %1016 = fadd contract float %1012, %1015
  %1017 = fmul contract float %1016, 0x3EF56AC020000000
  %1018 = fmul contract float %966, %969
  %1019 = fmul contract float %1017, %1017
  %1020 = fsub contract float %1018, %1019
  %1021 = fmul contract float %1001, %1017
  %1022 = fmul contract float %969, %985
  %1023 = fsub contract float %1021, %1022
  %1024 = fmul contract float %985, %1017
  %1025 = fmul contract float %966, %1001
  %1026 = fmul contract float %963, %1020
  %1027 = fmul contract float %985, %1023
  %1028 = fadd contract float %1026, %1027
  %1029 = fmul contract float %963, %969
  %1030 = fmul contract float %1001, %1001
  %1031 = fsub contract float %1029, %1030
  %1032 = fmul contract float %985, %1001
  %1033 = fmul contract float %963, %1017
  %1034 = fmul contract float %963, %966
  %1035 = fmul contract float %985, %985
  %1036 = fsub contract float %1034, %1035
  %1037 = fmul contract float %958, %1036
  %1038 = insertelement <2 x float> poison, float %1032, i64 0
  %1039 = insertelement <2 x float> %1038, float %1024, i64 1
  %1040 = insertelement <2 x float> poison, float %1033, i64 0
  %1041 = insertelement <2 x float> %1040, float %1025, i64 1
  %1042 = fsub contract <2 x float> %1039, %1041
  %1043 = extractelement <2 x float> %1042, i64 1
  %1044 = fmul contract float %1001, %1043
  %1045 = fadd contract float %1044, %1028
  %1046 = insertelement <2 x float> poison, float %946, i64 0
  %1047 = insertelement <2 x float> %1046, float %954, i64 1
  %1048 = insertelement <2 x float> poison, float %1023, i64 0
  %1049 = shufflevector <2 x float> %1048, <2 x float> poison, <2 x i32> zeroinitializer
  %1050 = fmul contract <2 x float> %1047, %1049
  %1051 = insertelement <2 x float> poison, float %954, i64 0
  %1052 = insertelement <2 x float> %1051, float %946, i64 1
  %1053 = insertelement <2 x float> poison, float %1031, i64 0
  %1054 = insertelement <2 x float> %1053, float %1020, i64 1
  %1055 = fmul contract <2 x float> %1052, %1054
  %1056 = fadd contract <2 x float> %1055, %1050
  %1057 = insertelement <2 x float> poison, float %958, i64 0
  %1058 = shufflevector <2 x float> %1057, <2 x float> poison, <2 x i32> zeroinitializer
  %1059 = fmul contract <2 x float> %1058, %1042
  %1060 = fadd contract <2 x float> %1059, %1056
  %1061 = fmul contract float %946, %1043
  %1062 = extractelement <2 x float> %1042, i64 0
  %1063 = fmul contract float %954, %1062
  %1064 = fadd contract float %1061, %1063
  %1065 = fadd contract float %1037, %1064
  %1066 = fdiv contract float -1.000000e+00, %1045
  %1067 = insertelement <2 x float> poison, float %1066, i64 0
  %1068 = shufflevector <2 x float> %1067, <2 x float> poison, <2 x i32> zeroinitializer
  %1069 = fmul contract <2 x float> %1060, %1068
  %1070 = fmul contract float %1065, %1066
  %1071 = tail call float @llvm.fabs.f32(float %1070)
  %1072 = fcmp contract olt float %1071, 5.000000e-01
  %1073 = extractelement <2 x float> %1069, i64 1
  %1074 = tail call float @llvm.fabs.f32(float %1073)
  %1075 = fcmp contract olt float %1074, 5.000000e-01
  %1076 = select i1 %1072, i1 %1075, i1 false
  %1077 = extractelement <2 x float> %1069, i64 0
  %1078 = tail call float @llvm.fabs.f32(float %1077)
  %1079 = fcmp contract olt float %1078, 5.000000e-01
  %1080 = select i1 %1076, i1 %1079, i1 false
  br i1 %1080, label %1109, label %1081

1081:                                             ; preds = %915
  %1082 = fcmp contract ogt <2 x float> %1069, zeroinitializer
  %1083 = fpext <2 x float> %1069 to <2 x double>
  %1084 = select <2 x i1> %1082, <2 x double> <double 5.000000e-01, double 5.000000e-01>, <2 x double> <double -5.000000e-01, double -5.000000e-01>
  %1085 = fadd contract <2 x double> %1084, %1083
  %1086 = fptosi <2 x double> %1085 to <2 x i32>
  %1087 = add nsw <2 x i32> %912, %1086
  %1088 = fcmp contract ogt float %1070, 0.000000e+00
  %1089 = select i1 %1088, double 5.000000e-01, double -5.000000e-01
  %1090 = fpext float %1070 to double
  %1091 = fadd contract double %1089, %1090
  %1092 = fptosi double %1091 to i32
  %1093 = add nsw i32 %911, %1092
  %1094 = sub nsw i32 %1093, %352
  %1095 = icmp slt i32 %1094, 1
  br i1 %1095, label %1109, label %1096

1096:                                             ; preds = %1081
  %1097 = icmp sgt i32 %1094, %7
  %1098 = extractelement <2 x i32> %1087, i64 0
  %1099 = icmp slt i32 %1098, 5
  %1100 = select i1 %1097, i1 true, i1 %1099
  %1101 = icmp sge i32 %1098, %26
  %1102 = extractelement <2 x i32> %1087, i64 1
  %1103 = icmp slt i32 %1102, 5
  %1104 = icmp sge i32 %1102, %30
  %1105 = select i1 %1100, i1 true, i1 %1101
  %1106 = select i1 %1105, i1 true, i1 %1103
  %1107 = select i1 %1106, i1 true, i1 %1104
  %1108 = zext i1 %1107 to i32
  br label %1109

1109:                                             ; preds = %1096, %1081, %915
  %1110 = phi i32 [ 1, %1081 ], [ %1108, %1096 ], [ 2, %915 ]
  %1111 = phi i32 [ %1093, %1081 ], [ %1093, %1096 ], [ %911, %915 ]
  %1112 = phi <2 x i32> [ %1087, %1081 ], [ %1087, %1096 ], [ %912, %915 ]
  %1113 = extractelement <2 x i32> %1112, i64 0
  %1114 = extractelement <2 x i32> %1112, i64 1
  switch i32 %1110, label %1470 [
    i32 0, label %1115
    i32 2, label %1318
  ]

1115:                                             ; preds = %1109
  %1116 = sext i32 %1111 to i64
  %1117 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %1116
  %1118 = load float*, float* addrspace(1)* %1117, align 8, !tbaa !7
  %1119 = mul nsw i32 %1113, %4
  %1120 = sext i32 %1119 to i64
  %1121 = getelementptr inbounds float, float* %1118, i64 %1120
  %1122 = sext i32 %1114 to i64
  %1123 = getelementptr inbounds float, float* %1121, i64 %1122
  %1124 = addrspacecast float* %1123 to float addrspace(1)*
  %1125 = add nsw i32 %1111, -1
  %1126 = sext i32 %1125 to i64
  %1127 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %1126
  %1128 = load float*, float* addrspace(1)* %1127, align 8, !tbaa !7
  %1129 = getelementptr inbounds float, float* %1128, i64 %1120
  %1130 = getelementptr inbounds float, float* %1129, i64 %1122
  %1131 = addrspacecast float* %1130 to float addrspace(1)*
  %1132 = add nsw i32 %1111, 1
  %1133 = sext i32 %1132 to i64
  %1134 = getelementptr inbounds [60 x float*], [60 x float*] addrspace(1)* @pd, i64 0, i64 %1133
  %1135 = load float*, float* addrspace(1)* %1134, align 8, !tbaa !7
  %1136 = getelementptr inbounds float, float* %1135, i64 %1120
  %1137 = getelementptr inbounds float, float* %1136, i64 %1122
  %1138 = addrspacecast float* %1137 to float addrspace(1)*
  %1139 = getelementptr inbounds float, float* %1123, i64 1
  %1140 = addrspacecast float* %1139 to float addrspace(1)*
  %1141 = load float, float addrspace(1)* %1140, align 4, !tbaa !11
  %1142 = getelementptr inbounds float, float* %1123, i64 -1
  %1143 = addrspacecast float* %1142 to float addrspace(1)*
  %1144 = load float, float addrspace(1)* %1143, align 4, !tbaa !11
  %1145 = getelementptr inbounds float, float* %1123, i64 %351
  %1146 = addrspacecast float* %1145 to float addrspace(1)*
  %1147 = load float, float addrspace(1)* %1146, align 4, !tbaa !11
  %1148 = getelementptr inbounds float, float* %1123, i64 %350
  %1149 = addrspacecast float* %1148 to float addrspace(1)*
  %1150 = load float, float addrspace(1)* %1149, align 4, !tbaa !11
  %1151 = load float, float addrspace(1)* %1138, align 4, !tbaa !11
  %1152 = load float, float addrspace(1)* %1131, align 4, !tbaa !11
  %1153 = fsub contract float %1151, %1152
  %1154 = fmul contract float %1153, 0x3F056AC020000000
  %1155 = load float, float addrspace(1)* %1124, align 4, !tbaa !11
  %1156 = fmul contract float %1155, 2.000000e+00
  %1157 = fadd contract float %1141, %1144
  %1158 = fsub contract float %1157, %1156
  %1159 = fadd contract float %1147, %1150
  %1160 = fsub contract float %1159, %1156
  %1161 = fadd contract float %1151, %1152
  %1162 = fsub contract float %1161, %1156
  %1163 = fmul contract float %1162, 0x3F156AC020000000
  %1164 = getelementptr inbounds float, float* %1123, i64 %349
  %1165 = addrspacecast float* %1164 to float addrspace(1)*
  %1166 = load float, float addrspace(1)* %1165, align 4, !tbaa !11
  %1167 = getelementptr inbounds float, float* %1123, i64 %348
  %1168 = addrspacecast float* %1167 to float addrspace(1)*
  %1169 = load float, float addrspace(1)* %1168, align 4, !tbaa !11
  %1170 = fsub contract float %1166, %1169
  %1171 = getelementptr inbounds float, float* %1123, i64 %347
  %1172 = addrspacecast float* %1171 to float addrspace(1)*
  %1173 = load float, float addrspace(1)* %1172, align 4, !tbaa !11
  %1174 = fsub contract float %1170, %1173
  %1175 = getelementptr inbounds float, float* %1123, i64 %346
  %1176 = addrspacecast float* %1175 to float addrspace(1)*
  %1177 = load float, float addrspace(1)* %1176, align 4, !tbaa !11
  %1178 = fadd contract float %1174, %1177
  %1179 = fmul contract float %1178, 0x3EF56AC020000000
  %1180 = getelementptr inbounds float, float* %1137, i64 1
  %1181 = addrspacecast float* %1180 to float addrspace(1)*
  %1182 = load float, float addrspace(1)* %1181, align 4, !tbaa !11
  %1183 = getelementptr inbounds float, float* %1137, i64 -1
  %1184 = addrspacecast float* %1183 to float addrspace(1)*
  %1185 = load float, float addrspace(1)* %1184, align 4, !tbaa !11
  %1186 = fsub contract float %1182, %1185
  %1187 = getelementptr inbounds float, float* %1130, i64 1
  %1188 = addrspacecast float* %1187 to float addrspace(1)*
  %1189 = load float, float addrspace(1)* %1188, align 4, !tbaa !11
  %1190 = fsub contract float %1186, %1189
  %1191 = getelementptr inbounds float, float* %1130, i64 -1
  %1192 = addrspacecast float* %1191 to float addrspace(1)*
  %1193 = load float, float addrspace(1)* %1192, align 4, !tbaa !11
  %1194 = fadd contract float %1190, %1193
  %1195 = getelementptr inbounds float, float* %1137, i64 %351
  %1196 = addrspacecast float* %1195 to float addrspace(1)*
  %1197 = load float, float addrspace(1)* %1196, align 4, !tbaa !11
  %1198 = getelementptr inbounds float, float* %1137, i64 %350
  %1199 = addrspacecast float* %1198 to float addrspace(1)*
  %1200 = load float, float addrspace(1)* %1199, align 4, !tbaa !11
  %1201 = fsub contract float %1197, %1200
  %1202 = getelementptr inbounds float, float* %1130, i64 %351
  %1203 = addrspacecast float* %1202 to float addrspace(1)*
  %1204 = load float, float addrspace(1)* %1203, align 4, !tbaa !11
  %1205 = fsub contract float %1201, %1204
  %1206 = getelementptr inbounds float, float* %1130, i64 %350
  %1207 = addrspacecast float* %1206 to float addrspace(1)*
  %1208 = load float, float addrspace(1)* %1207, align 4, !tbaa !11
  %1209 = fadd contract float %1205, %1208
  %1210 = fmul contract float %1163, %1179
  %1211 = fmul contract float %1179, %1179
  %1212 = insertelement <2 x float> poison, float %1147, i64 0
  %1213 = insertelement <2 x float> %1212, float %1141, i64 1
  %1214 = insertelement <2 x float> poison, float %1150, i64 0
  %1215 = insertelement <2 x float> %1214, float %1144, i64 1
  %1216 = fsub contract <2 x float> %1213, %1215
  %1217 = fmul contract <2 x float> %1216, <float 0x3F056AC020000000, float 0x3F056AC020000000>
  %1218 = insertelement <2 x float> poison, float %1158, i64 0
  %1219 = insertelement <2 x float> %1218, float %1160, i64 1
  %1220 = fmul contract <2 x float> %1219, <float 0x3F156AC020000000, float 0x3F156AC020000000>
  %1221 = insertelement <2 x float> poison, float %1194, i64 0
  %1222 = insertelement <2 x float> %1221, float %1209, i64 1
  %1223 = fmul contract <2 x float> %1222, <float 0x3EF56AC020000000, float 0x3EF56AC020000000>
  %1224 = extractelement <2 x float> %1223, i64 0
  %1225 = extractelement <2 x float> %1223, i64 1
  %1226 = fmul contract float %1224, %1225
  %1227 = fsub contract float %1226, %1210
  %1228 = insertelement <2 x float> poison, float %1163, i64 0
  %1229 = shufflevector <2 x float> %1228, <2 x float> poison, <2 x i32> zeroinitializer
  %1230 = fmul contract <2 x float> %1220, %1229
  %1231 = fmul contract <2 x float> %1223, %1223
  %1232 = fsub contract <2 x float> %1230, %1231
  %1233 = extractelement <2 x float> %1220, i64 0
  %1234 = extractelement <2 x float> %1232, i64 1
  %1235 = fmul contract float %1233, %1234
  %1236 = fmul contract float %1179, %1227
  %1237 = fadd contract float %1235, %1236
  %1238 = insertelement <2 x float> poison, float %1179, i64 0
  %1239 = shufflevector <2 x float> %1238, <2 x float> poison, <2 x i32> zeroinitializer
  %1240 = fmul contract <2 x float> %1239, %1223
  %1241 = shufflevector <2 x float> %1223, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %1242 = fmul contract <2 x float> %1220, %1241
  %1243 = fsub contract <2 x float> %1240, %1242
  %1244 = extractelement <2 x float> %1243, i64 1
  %1245 = fmul contract float %1224, %1244
  %1246 = fadd contract float %1245, %1237
  %1247 = extractelement <2 x float> %1220, i64 1
  %1248 = fmul contract float %1233, %1247
  %1249 = fsub contract float %1248, %1211
  %1250 = shufflevector <2 x float> %1217, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %1251 = insertelement <2 x float> poison, float %1227, i64 0
  %1252 = shufflevector <2 x float> %1251, <2 x float> poison, <2 x i32> zeroinitializer
  %1253 = fmul contract <2 x float> %1250, %1252
  %1254 = fmul contract <2 x float> %1217, %1232
  %1255 = fadd contract <2 x float> %1254, %1253
  %1256 = insertelement <2 x float> poison, float %1154, i64 0
  %1257 = shufflevector <2 x float> %1256, <2 x float> poison, <2 x i32> zeroinitializer
  %1258 = fmul contract <2 x float> %1257, %1243
  %1259 = fadd contract <2 x float> %1258, %1255
  %1260 = extractelement <2 x float> %1217, i64 1
  %1261 = fmul contract float %1260, %1244
  %1262 = extractelement <2 x float> %1243, i64 0
  %1263 = extractelement <2 x float> %1217, i64 0
  %1264 = fmul contract float %1263, %1262
  %1265 = fadd contract float %1261, %1264
  %1266 = fmul contract float %1154, %1249
  %1267 = fadd contract float %1266, %1265
  %1268 = fdiv contract float -1.000000e+00, %1246
  %1269 = insertelement <2 x float> poison, float %1268, i64 0
  %1270 = shufflevector <2 x float> %1269, <2 x float> poison, <2 x i32> zeroinitializer
  %1271 = fmul contract <2 x float> %1259, %1270
  %1272 = fmul contract float %1267, %1268
  %1273 = tail call float @llvm.fabs.f32(float %1272)
  %1274 = fcmp contract olt float %1273, 5.000000e-01
  %1275 = extractelement <2 x float> %1271, i64 1
  %1276 = tail call float @llvm.fabs.f32(float %1275)
  %1277 = fcmp contract olt float %1276, 5.000000e-01
  %1278 = select i1 %1274, i1 %1277, i1 false
  %1279 = extractelement <2 x float> %1271, i64 0
  %1280 = tail call float @llvm.fabs.f32(float %1279)
  %1281 = fcmp contract olt float %1280, 5.000000e-01
  %1282 = select i1 %1278, i1 %1281, i1 false
  br i1 %1282, label %1313, label %1283

1283:                                             ; preds = %1115
  %1284 = fcmp contract ogt <2 x float> %1271, zeroinitializer
  %1285 = fpext <2 x float> %1271 to <2 x double>
  %1286 = select <2 x i1> %1284, <2 x double> <double 5.000000e-01, double 5.000000e-01>, <2 x double> <double -5.000000e-01, double -5.000000e-01>
  %1287 = fadd contract <2 x double> %1286, %1285
  %1288 = fptosi <2 x double> %1287 to <2 x i32>
  %1289 = add nsw <2 x i32> %1112, %1288
  %1290 = shufflevector <2 x i32> %1289, <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %1291 = fcmp contract ogt float %1272, 0.000000e+00
  %1292 = select i1 %1291, double 5.000000e-01, double -5.000000e-01
  %1293 = fpext float %1272 to double
  %1294 = fadd contract double %1292, %1293
  %1295 = fptosi double %1294 to i32
  %1296 = add nsw i32 %1111, %1295
  %1297 = sub nsw i32 %1296, %352
  %1298 = icmp slt i32 %1297, 1
  %1299 = extractelement <2 x i32> %1289, i64 0
  %1300 = extractelement <2 x i32> %1289, i64 1
  br i1 %1298, label %1313, label %1301

1301:                                             ; preds = %1283
  %1302 = icmp sgt i32 %1297, %7
  %1303 = insertelement <4 x i32> <i32 poison, i32 poison, i32 5, i32 5>, i32 %26, i64 0
  %1304 = insertelement <4 x i32> %1303, i32 %30, i64 1
  %1305 = icmp sge <4 x i32> %1290, %1304
  %1306 = icmp slt <4 x i32> %1290, %1304
  %1307 = shufflevector <4 x i1> %1305, <4 x i1> %1306, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %1308 = freeze <4 x i1> %1307
  %1309 = bitcast <4 x i1> %1308 to i4
  %1310 = icmp ne i4 %1309, 0
  %1311 = select i1 %1310, i1 true, i1 %1302
  %1312 = zext i1 %1311 to i32
  br label %1313

1313:                                             ; preds = %1301, %1283, %1115
  %1314 = phi i32 [ 1, %1283 ], [ %1312, %1301 ], [ 2, %1115 ]
  %1315 = phi i32 [ %1299, %1283 ], [ %1299, %1301 ], [ %1113, %1115 ]
  %1316 = phi i32 [ %1300, %1283 ], [ %1300, %1301 ], [ %1114, %1115 ]
  %1317 = phi i32 [ %1296, %1283 ], [ %1296, %1301 ], [ %1111, %1115 ]
  switch i32 %1314, label %1470 [
    i32 0, label %1332
    i32 2, label %1318
  ]

1318:                                             ; preds = %1313, %1109, %909, %716, %524
  %1319 = phi i32 [ %528, %524 ], [ %720, %716 ], [ %913, %909 ], [ %1113, %1109 ], [ %1315, %1313 ]
  %1320 = phi i32 [ %529, %524 ], [ %721, %716 ], [ %914, %909 ], [ %1114, %1109 ], [ %1316, %1313 ]
  %1321 = phi i32 [ %526, %524 ], [ %718, %716 ], [ %911, %909 ], [ %1111, %1109 ], [ %1317, %1313 ]
  %1322 = phi float* [ %354, %524 ], [ %538, %716 ], [ %730, %909 ], [ %923, %1109 ], [ %1123, %1313 ]
  %1323 = phi float [ %367, %524 ], [ %561, %716 ], [ %753, %909 ], [ %946, %1109 ], [ %1260, %1313 ]
  %1324 = phi float [ %375, %524 ], [ %569, %716 ], [ %761, %909 ], [ %954, %1109 ], [ %1263, %1313 ]
  %1325 = phi float [ %379, %524 ], [ %573, %716 ], [ %765, %909 ], [ %958, %1109 ], [ %1154, %1313 ]
  %1326 = phi float [ %384, %524 ], [ %578, %716 ], [ %770, %909 ], [ %963, %1109 ], [ %1233, %1313 ]
  %1327 = phi float [ %387, %524 ], [ %581, %716 ], [ %773, %909 ], [ %966, %1109 ], [ %1247, %1313 ]
  %1328 = phi float [ %406, %524 ], [ %600, %716 ], [ %792, %909 ], [ %985, %1109 ], [ %1179, %1313 ]
  %1329 = phi float [ %478, %524 ], [ %680, %716 ], [ %873, %909 ], [ %1073, %1109 ], [ %1275, %1313 ]
  %1330 = phi float [ %479, %524 ], [ %684, %716 ], [ %877, %909 ], [ %1077, %1109 ], [ %1279, %1313 ]
  %1331 = phi float [ %480, %524 ], [ %677, %716 ], [ %870, %909 ], [ %1070, %1109 ], [ %1272, %1313 ]
  br label %1332

1332:                                             ; preds = %1313, %1318
  %1333 = phi i32 [ %1319, %1318 ], [ %1315, %1313 ]
  %1334 = phi i32 [ %1320, %1318 ], [ %1316, %1313 ]
  %1335 = phi i32 [ %1321, %1318 ], [ %1317, %1313 ]
  %1336 = phi float* [ %1322, %1318 ], [ %1123, %1313 ]
  %1337 = phi float [ %1323, %1318 ], [ %1260, %1313 ]
  %1338 = phi float [ %1324, %1318 ], [ %1263, %1313 ]
  %1339 = phi float [ %1325, %1318 ], [ %1154, %1313 ]
  %1340 = phi float [ %1326, %1318 ], [ %1233, %1313 ]
  %1341 = phi float [ %1327, %1318 ], [ %1247, %1313 ]
  %1342 = phi float [ %1328, %1318 ], [ %1179, %1313 ]
  %1343 = phi float [ %1329, %1318 ], [ %1275, %1313 ]
  %1344 = phi float [ %1330, %1318 ], [ %1279, %1313 ]
  %1345 = phi float [ %1331, %1318 ], [ %1272, %1313 ]
  %1346 = phi i1 [ false, %1318 ], [ true, %1313 ]
  br i1 %1346, label %1470, label %1347

1347:                                             ; preds = %1332
  %1348 = addrspacecast float* %1336 to float addrspace(1)*
  %1349 = fmul contract float %1337, %1343
  %1350 = fmul contract float %1338, %1344
  %1351 = fadd contract float %1350, %1349
  %1352 = fmul contract float %1339, %1345
  %1353 = fadd contract float %1351, %1352
  %1354 = load float, float addrspace(1)* %1348, align 4, !tbaa !11
  %1355 = fmul contract float %1354, 0x3F156AC020000000
  %1356 = fmul contract float %1353, 5.000000e-01
  %1357 = fadd contract float %1356, %1355
  %1358 = tail call float @llvm.fabs.f32(float %1357)
  %1359 = sitofp i32 %7 to float
  %1360 = fmul contract float %1358, %1359
  %1361 = fpext float %1360 to double
  %1362 = fcmp contract olt double %1361, 4.000000e-02
  br i1 %1362, label %1470, label %1363

1363:                                             ; preds = %1347
  %1364 = fadd contract float %1341, %1340
  %1365 = fmul contract float %1341, %1340
  %1366 = fmul contract float %1342, %1342
  %1367 = fsub contract float %1365, %1366
  %1368 = fcmp contract ugt float %1367, 0.000000e+00
  br i1 %1368, label %1369, label %1470

1369:                                             ; preds = %1363
  %1370 = fmul contract float %1364, %1364
  %1371 = fmul contract float %1370, 1.000000e+01
  %1372 = fmul contract float %1367, 1.210000e+02
  %1373 = fcmp contract ult float %1371, %1372
  br i1 %1373, label %1374, label %1470

1374:                                             ; preds = %1369
  %1375 = sub nsw i32 %1335, %352
  %1376 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* getelementptr inbounds ([1 x i32], [1 x i32] addrspace(1)* @d_PointCounter, i64 0, i64 0), i32 2147483647, i32 2, i32 4, i1 false)
  %1377 = icmp ult i32 %1376, %8
  %1378 = add nsw i32 %8, -1
  %1379 = select i1 %1377, i32 %1376, i32 %1378
  %1380 = sitofp i32 %1334 to float
  %1381 = fadd contract float %1343, %1380
  %1382 = shl nuw i32 1, %62
  %1383 = sitofp i32 %1382 to float
  %1384 = fmul contract float %1381, %1383
  %1385 = zext i32 %1379 to i64
  %1386 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1385
  store float %1384, float addrspace(1)* %1386, align 4, !tbaa !11
  %1387 = sitofp i32 %1333 to float
  %1388 = fadd contract float %1344, %1387
  %1389 = fmul contract float %1388, %1383
  %1390 = add i32 %1379, %1
  %1391 = zext i32 %1390 to i64
  %1392 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1391
  store float %1389, float addrspace(1)* %1392, align 4, !tbaa !11
  %1393 = shl i32 %1375, 8
  %1394 = add nsw i32 %1393, %62
  %1395 = fpext float %1345 to double
  %1396 = fadd contract double %1395, 5.000000e-01
  %1397 = fmul contract double %1396, 2.550000e+02
  %1398 = fadd contract double %1397, 5.000000e-01
  %1399 = fptosi double %1398 to i32
  %1400 = shl i32 %1399, 16
  %1401 = add nsw i32 %1394, %1400
  %1402 = sitofp i32 %1401 to float
  %1403 = shl nsw i32 %1, 1
  %1404 = add i32 %1379, %1403
  %1405 = zext i32 %1404 to i64
  %1406 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1405
  store float %1402, float addrspace(1)* %1406, align 4, !tbaa !11
  %1407 = sitofp i32 %1375 to float
  %1408 = fadd contract float %1345, %1407
  %1409 = fdiv contract float %1408, %1359
  %1410 = fmul float %1409, 0x3FE62E4300000000
  %1411 = fneg float %1410
  %1412 = tail call float @llvm.fma.f32(float %1409, float 0x3FE62E4300000000, float %1411)
  %1413 = tail call float @llvm.fma.f32(float %1409, float 0xBE205C6100000000, float %1412)
  %1414 = fadd float %1410, %1413
  %1415 = fsub float %1414, %1410
  %1416 = fsub float %1413, %1415
  %1417 = tail call float @llvm.fabs.f32(float %1410) #13
  %1418 = fcmp oeq float %1417, 0x7FF0000000000000
  %1419 = select i1 %1418, float %1410, float %1414
  %1420 = tail call float @llvm.fabs.f32(float %1419) #13
  %1421 = fcmp oeq float %1420, 0x7FF0000000000000
  %1422 = select i1 %1421, float 0.000000e+00, float %1416
  %1423 = fcmp oeq float %1419, 0x40562E4300000000
  %1424 = select i1 %1423, float 0x3EE0000000000000, float 0.000000e+00
  %1425 = fsub float %1419, %1424
  %1426 = fadd float %1424, %1422
  %1427 = fmul float %1425, 0x3FF7154760000000
  %1428 = tail call float @llvm.rint.f32(float %1427)
  %1429 = fcmp ogt float %1425, 0x40562E4300000000
  %1430 = fcmp olt float %1425, 0xC059D1DA00000000
  %1431 = fneg float %1427
  %1432 = tail call float @llvm.fma.f32(float %1425, float 0x3FF7154760000000, float %1431)
  %1433 = tail call float @llvm.fma.f32(float %1425, float 0x3E54AE0BE0000000, float %1432)
  %1434 = fsub float %1427, %1428
  %1435 = fadd float %1433, %1434
  %1436 = tail call float @llvm.exp2.f32(float %1435)
  %1437 = fptosi float %1428 to i32
  %1438 = tail call float @llvm.amdgcn.ldexp.f32(float %1436, i32 %1437)
  %1439 = select i1 %1430, float 0.000000e+00, float %1438
  %1440 = select i1 %1429, float 0x7FF0000000000000, float %1439
  %1441 = tail call float @llvm.fma.f32(float %1440, float %1426, float %1440)
  %1442 = tail call float @llvm.fabs.f32(float %1440) #13
  %1443 = fcmp oeq float %1442, 0x7FF0000000000000
  %1444 = select i1 %1443, float %1440, float %1441
  %1445 = tail call float @llvm.fabs.f32(float %1409)
  %1446 = tail call float @llvm.fabs.f32(float %1444)
  %1447 = fcmp oeq float %1445, 0x7FF0000000000000
  %1448 = bitcast float %1409 to i32
  %1449 = icmp sgt i32 %1448, -1
  %1450 = select i1 %1449, float 0x7FF0000000000000, float 0.000000e+00
  %1451 = select i1 %1447, float %1450, float %1446
  %1452 = fcmp uno float %1409, 0.000000e+00
  %1453 = select i1 %1452, float 0x7FF8000000000000, float %1451
  %1454 = fcmp oeq float %1409, 0.000000e+00
  %1455 = select i1 %1454, float 1.000000e+00, float %1453
  %1456 = fpext float %1455 to double
  %1457 = fmul contract double %1456, 1.600000e+00
  %1458 = sitofp i32 %1382 to double
  %1459 = fmul contract double %1457, %1458
  %1460 = fmul contract double %1459, 2.000000e+00
  %1461 = fptrunc double %1460 to float
  %1462 = mul nsw i32 %1, 3
  %1463 = add i32 %1379, %1462
  %1464 = zext i32 %1463 to i64
  %1465 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1464
  store float %1461, float addrspace(1)* %1465, align 4, !tbaa !11
  %1466 = shl nsw i32 %1, 2
  %1467 = add i32 %1379, %1466
  %1468 = zext i32 %1467 to i64
  %1469 = getelementptr inbounds float, float addrspace(1)* %0, i64 %1468
  store float %1358, float addrspace(1)* %1469, align 4, !tbaa !11
  br label %1470

1470:                                             ; preds = %524, %716, %909, %1109, %1313, %1347, %1363, %1374, %1369, %1332, %340, %335, %330, %325, %320, %315, %310, %305, %302, %297, %292, %287, %282, %277, %272, %267, %262, %259, %252, %246, %239, %232, %225, %218, %213, %208, %206, %37, %9, %29
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr() #4

; Function Attrs: convergent noinline norecurse nounwind optnone
define internal fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, i64 noundef %5, i64 noundef %6, i64 noundef %7, i64 noundef %8) unnamed_addr #5 {
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
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !13
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !13
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !13
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !13
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !13
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !13
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !13
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !13
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #8
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !22
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #12, !srcloc !24
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !22
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #8
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !22
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #8
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !20
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #8
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !13
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #8
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !25
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !28
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !20
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #8
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !13
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !13
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !13
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !13
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !13
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !13
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !13
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !13
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !22
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !22
  %110 = call i64 @llvm.read_register.i64(metadata !30) #14
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !13
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !13
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !13
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !13
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !13
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !13
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !13
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !13
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
  call void @llvm.lifetime.start.p5i8(i64 16, i8 addrspace(5)* %164) #8
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !13
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !13
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !17
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !20
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !13
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
  call void @llvm.lifetime.end.p5i8(i64 16, i8 addrspace(5)* %215) #8
  %216 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %216) #8
  %217 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %217) #8
  %218 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %218) #8
  %219 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 8, i8 addrspace(5)* %219) #8
  %220 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %220) #8
  %221 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.end.p5i8(i64 4, i8 addrspace(5)* %221) #8
  ret <2 x i64> %214
}

; Function Attrs: convergent mustprogress nofree nounwind readnone willreturn
declare i32 @llvm.amdgcn.readfirstlane(i32) #6

; Function Attrs: mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.sleep(i32 immarg) #7

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #8

; Function Attrs: nofree nounwind readonly
declare i64 @llvm.read_register.i64(metadata) #9

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #10

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #4

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p1i32(i32 addrspace(1)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #11

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { convergent noinline norecurse nounwind optnone "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+16-bit-insts,+add-no-carry-insts,+aperture-regs,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+ds-src2-insts,+enable-ds128,+enable-prt-strict-null,+extended-image-insts,+fast-denormal-f32,+fast-fmaf,+flat-address-space,+flat-for-global,+flat-global-insts,+flat-inst-offsets,+flat-scratch-insts,+fma-mix-insts,+fp64,+gcn3-encoding,+gfx7-gfx8-gfx9-insts,+gfx8-insts,+gfx9,+gfx9-insts,+half-rate-64-ops,+image-gather4-d16-bug,+image-insts,+int-clamp-insts,+inv-2pi-inline-imm,+ldsbankcount32,+load-store-opt,+localmemorysize65536,+mad-mac-f32-insts,+negative-scratch-offset-bug,+promote-alloca,+r128-a16,+s-memrealtime,+s-memtime-inst,+scalar-atomics,+scalar-flat-scratch-insts,+scalar-stores,+sdwa,+sdwa-omod,+sdwa-scalar,+sdwa-sdst,+sramecc,+sramecc-support,+trap-handler,+unaligned-access-mode,+unaligned-buffer-access,+unaligned-ds-access,+vgpr-index-mode,+vop3p,-wavefrontsize16,-wavefrontsize32,+wavefrontsize64,+xnack-support" }
attributes #6 = { convergent mustprogress nofree nounwind readnone willreturn }
attributes #7 = { mustprogress nounwind willreturn }
attributes #8 = { nounwind }
attributes #9 = { nofree nounwind readonly }
attributes #10 = { mustprogress nofree nosync nounwind readnone willreturn }
attributes #11 = { argmemonly nounwind willreturn }
attributes #12 = { convergent nounwind }
attributes #13 = { readnone }
attributes #14 = { convergent }

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
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !{!15, !15, i64 0}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.unroll.disable"}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !15, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !15, i64 0}
!24 = !{i64 2662}
!25 = !{!26, !21, i64 0}
!26 = !{!"", !21, i64 0, !21, i64 8, !27, i64 16, !14, i64 24, !14, i64 32, !14, i64 40}
!27 = !{!"hsa_signal_s", !14, i64 0}
!28 = !{!26, !14, i64 40}
!29 = !{!26, !21, i64 8}
!30 = !{!"exec"}
!31 = !{!32, !23, i64 16}
!32 = !{!"", !14, i64 0, !14, i64 8, !23, i64 16, !23, i64 20}
!33 = !{!32, !14, i64 8}
!34 = !{!32, !23, i64 20}
!35 = !{!32, !14, i64 0}
!36 = !{!37, !14, i64 16}
!37 = !{!"amd_signal_s", !14, i64 0, !15, i64 8, !14, i64 16, !23, i64 24, !23, i64 28, !14, i64 32, !14, i64 40, !15, i64 48, !15, i64 56}
!38 = !{!37, !23, i64 24}
