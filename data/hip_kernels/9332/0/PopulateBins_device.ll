; ModuleID = '../data/hip_kernels/9332/0/main.cu'
source_filename = "../data/hip_kernels/9332/0/main.cu"
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
%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

@.str = private unnamed_addr addrspace(4) constant [27 x i8] c"Idx 10 reads X: %f, Y: %f\0A\00", align 1
@.str.1 = private unnamed_addr addrspace(4) constant [41 x i8] c"Idx 10 trying to add to bin: %d, %d, %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z12PopulateBinsPiP15HIP_vector_typeIfLj2EEffiijj(i32 addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, float %2, float %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #1 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 0
  %20 = load float, float addrspace(1)* %19, align 8, !tbaa !7, !amdgpu.noclobber !5
  %21 = fpext float %20 to double
  %22 = fneg contract float %2
  %23 = fpext float %22 to double
  %24 = fmul contract double %23, 5.000000e-01
  %25 = uitofp i32 %7 to float
  br label %26

26:                                               ; preds = %26, %8
  %27 = phi i32 [ 0, %8 ], [ %34, %26 ]
  %28 = uitofp i32 %27 to float
  %29 = fmul contract float %28, %2
  %30 = fdiv contract float %29, %25
  %31 = fpext float %30 to double
  %32 = fadd contract double %24, %31
  %33 = fcmp contract olt double %32, %21
  %34 = add i32 %27, 1
  br i1 %33, label %26, label %35, !llvm.loop !10

35:                                               ; preds = %26
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %18, i32 0, i32 0, i32 0, i64 1
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fpext float %37 to double
  %39 = fneg contract float %3
  %40 = fpext float %39 to double
  %41 = fmul contract double %40, 5.000000e-01
  %42 = uitofp i32 %6 to float
  br label %43

43:                                               ; preds = %43, %35
  %44 = phi i32 [ %51, %43 ], [ 0, %35 ]
  %45 = uitofp i32 %44 to float
  %46 = fmul contract float %45, %3
  %47 = fdiv contract float %46, %42
  %48 = fpext float %47 to double
  %49 = fadd contract double %41, %48
  %50 = fcmp contract olt double %49, %38
  %51 = add i32 %44, 1
  br i1 %50, label %43, label %52, !llvm.loop !12

52:                                               ; preds = %43
  %53 = icmp eq i32 %17, 10
  br i1 %53, label %54, label %986

54:                                               ; preds = %52
  %55 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %56 = getelementptr inbounds i8, i8 addrspace(4)* %55, i64 24
  %57 = bitcast i8 addrspace(4)* %56 to i64 addrspace(4)*
  %58 = load i64, i64 addrspace(4)* %57, align 8, !tbaa !13
  %59 = inttoptr i64 %58 to i8 addrspace(1)*
  %60 = addrspacecast i8 addrspace(1)* %59 to i8*
  %61 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %62 = extractelement <2 x i64> %61, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %63, label %67

63:                                               ; preds = %54
  %64 = and i64 %62, -225
  %65 = or i64 %64, 32
  %66 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %65, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %508

67:                                               ; preds = %54
  %68 = and i64 %62, 2
  %69 = and i64 %62, -3
  %70 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %69, i64 0
  br label %71

71:                                               ; preds = %497, %67
  %72 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 26) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([27 x i8]* addrspacecast ([27 x i8] addrspace(4)* @.str to [27 x i8]*) to i64)), i64 1))), %67 ], [ %505, %497 ]
  %73 = phi i8 addrspace(4)* [ getelementptr inbounds ([27 x i8], [27 x i8] addrspace(4)* @.str, i64 0, i64 0), %67 ], [ %506, %497 ]
  %74 = phi <2 x i64> [ %70, %67 ], [ %504, %497 ]
  %75 = icmp ugt i64 %72, 56
  %76 = extractelement <2 x i64> %74, i64 0
  %77 = or i64 %76, %68
  %78 = insertelement <2 x i64> poison, i64 %77, i64 0
  %79 = select i1 %75, <2 x i64> %74, <2 x i64> %78
  %80 = tail call i64 @llvm.umin.i64(i64 %72, i64 56)
  %81 = trunc i64 %80 to i32
  %82 = extractelement <2 x i64> %79, i64 0
  %83 = icmp ugt i32 %81, 7
  br i1 %83, label %86, label %84

84:                                               ; preds = %71
  %85 = icmp eq i32 %81, 0
  br i1 %85, label %139, label %126

86:                                               ; preds = %71
  %87 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !17
  %88 = zext i8 %87 to i64
  %89 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 1
  %90 = load i8, i8 addrspace(4)* %89, align 1, !tbaa !17
  %91 = zext i8 %90 to i64
  %92 = shl nuw nsw i64 %91, 8
  %93 = or i64 %92, %88
  %94 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 2
  %95 = load i8, i8 addrspace(4)* %94, align 1, !tbaa !17
  %96 = zext i8 %95 to i64
  %97 = shl nuw nsw i64 %96, 16
  %98 = or i64 %93, %97
  %99 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 3
  %100 = load i8, i8 addrspace(4)* %99, align 1, !tbaa !17
  %101 = zext i8 %100 to i64
  %102 = shl nuw nsw i64 %101, 24
  %103 = or i64 %98, %102
  %104 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 4
  %105 = load i8, i8 addrspace(4)* %104, align 1, !tbaa !17
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 32
  %108 = or i64 %103, %107
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 5
  %110 = load i8, i8 addrspace(4)* %109, align 1, !tbaa !17
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 40
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 6
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !17
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 48
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 7
  %120 = load i8, i8 addrspace(4)* %119, align 1, !tbaa !17
  %121 = zext i8 %120 to i64
  %122 = shl nuw i64 %121, 56
  %123 = or i64 %118, %122
  %124 = add nsw i32 %81, -8
  %125 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 8
  br label %139

126:                                              ; preds = %84, %126
  %127 = phi i32 [ %137, %126 ], [ 0, %84 ]
  %128 = phi i64 [ %136, %126 ], [ 0, %84 ]
  %129 = zext i32 %127 to i64
  %130 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 %129
  %131 = load i8, i8 addrspace(4)* %130, align 1, !tbaa !17
  %132 = zext i8 %131 to i64
  %133 = shl i32 %127, 3
  %134 = zext i32 %133 to i64
  %135 = shl nuw i64 %132, %134
  %136 = or i64 %135, %128
  %137 = add nuw nsw i32 %127, 1
  %138 = icmp eq i32 %137, %81
  br i1 %138, label %139, label %126, !llvm.loop !18

139:                                              ; preds = %126, %86, %84
  %140 = phi i8 addrspace(4)* [ %125, %86 ], [ %73, %84 ], [ %73, %126 ]
  %141 = phi i32 [ %124, %86 ], [ 0, %84 ], [ 0, %126 ]
  %142 = phi i64 [ %123, %86 ], [ 0, %84 ], [ %136, %126 ]
  %143 = icmp ugt i32 %141, 7
  br i1 %143, label %146, label %144

144:                                              ; preds = %139
  %145 = icmp eq i32 %141, 0
  br i1 %145, label %199, label %186

146:                                              ; preds = %139
  %147 = load i8, i8 addrspace(4)* %140, align 1, !tbaa !17
  %148 = zext i8 %147 to i64
  %149 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 1
  %150 = load i8, i8 addrspace(4)* %149, align 1, !tbaa !17
  %151 = zext i8 %150 to i64
  %152 = shl nuw nsw i64 %151, 8
  %153 = or i64 %152, %148
  %154 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 2
  %155 = load i8, i8 addrspace(4)* %154, align 1, !tbaa !17
  %156 = zext i8 %155 to i64
  %157 = shl nuw nsw i64 %156, 16
  %158 = or i64 %153, %157
  %159 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 3
  %160 = load i8, i8 addrspace(4)* %159, align 1, !tbaa !17
  %161 = zext i8 %160 to i64
  %162 = shl nuw nsw i64 %161, 24
  %163 = or i64 %158, %162
  %164 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 4
  %165 = load i8, i8 addrspace(4)* %164, align 1, !tbaa !17
  %166 = zext i8 %165 to i64
  %167 = shl nuw nsw i64 %166, 32
  %168 = or i64 %163, %167
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 5
  %170 = load i8, i8 addrspace(4)* %169, align 1, !tbaa !17
  %171 = zext i8 %170 to i64
  %172 = shl nuw nsw i64 %171, 40
  %173 = or i64 %168, %172
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 6
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !17
  %176 = zext i8 %175 to i64
  %177 = shl nuw nsw i64 %176, 48
  %178 = or i64 %173, %177
  %179 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 7
  %180 = load i8, i8 addrspace(4)* %179, align 1, !tbaa !17
  %181 = zext i8 %180 to i64
  %182 = shl nuw i64 %181, 56
  %183 = or i64 %178, %182
  %184 = add nsw i32 %141, -8
  %185 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 8
  br label %199

186:                                              ; preds = %144, %186
  %187 = phi i32 [ %197, %186 ], [ 0, %144 ]
  %188 = phi i64 [ %196, %186 ], [ 0, %144 ]
  %189 = zext i32 %187 to i64
  %190 = getelementptr inbounds i8, i8 addrspace(4)* %140, i64 %189
  %191 = load i8, i8 addrspace(4)* %190, align 1, !tbaa !17
  %192 = zext i8 %191 to i64
  %193 = shl i32 %187, 3
  %194 = zext i32 %193 to i64
  %195 = shl nuw i64 %192, %194
  %196 = or i64 %195, %188
  %197 = add nuw nsw i32 %187, 1
  %198 = icmp eq i32 %197, %141
  br i1 %198, label %199, label %186

199:                                              ; preds = %186, %146, %144
  %200 = phi i8 addrspace(4)* [ %185, %146 ], [ %140, %144 ], [ %140, %186 ]
  %201 = phi i32 [ %184, %146 ], [ 0, %144 ], [ 0, %186 ]
  %202 = phi i64 [ %183, %146 ], [ 0, %144 ], [ %196, %186 ]
  %203 = icmp ugt i32 %201, 7
  br i1 %203, label %206, label %204

204:                                              ; preds = %199
  %205 = icmp eq i32 %201, 0
  br i1 %205, label %259, label %246

206:                                              ; preds = %199
  %207 = load i8, i8 addrspace(4)* %200, align 1, !tbaa !17
  %208 = zext i8 %207 to i64
  %209 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 1
  %210 = load i8, i8 addrspace(4)* %209, align 1, !tbaa !17
  %211 = zext i8 %210 to i64
  %212 = shl nuw nsw i64 %211, 8
  %213 = or i64 %212, %208
  %214 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 2
  %215 = load i8, i8 addrspace(4)* %214, align 1, !tbaa !17
  %216 = zext i8 %215 to i64
  %217 = shl nuw nsw i64 %216, 16
  %218 = or i64 %213, %217
  %219 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 3
  %220 = load i8, i8 addrspace(4)* %219, align 1, !tbaa !17
  %221 = zext i8 %220 to i64
  %222 = shl nuw nsw i64 %221, 24
  %223 = or i64 %218, %222
  %224 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 4
  %225 = load i8, i8 addrspace(4)* %224, align 1, !tbaa !17
  %226 = zext i8 %225 to i64
  %227 = shl nuw nsw i64 %226, 32
  %228 = or i64 %223, %227
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 5
  %230 = load i8, i8 addrspace(4)* %229, align 1, !tbaa !17
  %231 = zext i8 %230 to i64
  %232 = shl nuw nsw i64 %231, 40
  %233 = or i64 %228, %232
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 6
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !17
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 48
  %238 = or i64 %233, %237
  %239 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 7
  %240 = load i8, i8 addrspace(4)* %239, align 1, !tbaa !17
  %241 = zext i8 %240 to i64
  %242 = shl nuw i64 %241, 56
  %243 = or i64 %238, %242
  %244 = add nsw i32 %201, -8
  %245 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 8
  br label %259

246:                                              ; preds = %204, %246
  %247 = phi i32 [ %257, %246 ], [ 0, %204 ]
  %248 = phi i64 [ %256, %246 ], [ 0, %204 ]
  %249 = zext i32 %247 to i64
  %250 = getelementptr inbounds i8, i8 addrspace(4)* %200, i64 %249
  %251 = load i8, i8 addrspace(4)* %250, align 1, !tbaa !17
  %252 = zext i8 %251 to i64
  %253 = shl i32 %247, 3
  %254 = zext i32 %253 to i64
  %255 = shl nuw i64 %252, %254
  %256 = or i64 %255, %248
  %257 = add nuw nsw i32 %247, 1
  %258 = icmp eq i32 %257, %201
  br i1 %258, label %259, label %246

259:                                              ; preds = %246, %206, %204
  %260 = phi i8 addrspace(4)* [ %245, %206 ], [ %200, %204 ], [ %200, %246 ]
  %261 = phi i32 [ %244, %206 ], [ 0, %204 ], [ 0, %246 ]
  %262 = phi i64 [ %243, %206 ], [ 0, %204 ], [ %256, %246 ]
  %263 = icmp ugt i32 %261, 7
  br i1 %263, label %266, label %264

264:                                              ; preds = %259
  %265 = icmp eq i32 %261, 0
  br i1 %265, label %319, label %306

266:                                              ; preds = %259
  %267 = load i8, i8 addrspace(4)* %260, align 1, !tbaa !17
  %268 = zext i8 %267 to i64
  %269 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 1
  %270 = load i8, i8 addrspace(4)* %269, align 1, !tbaa !17
  %271 = zext i8 %270 to i64
  %272 = shl nuw nsw i64 %271, 8
  %273 = or i64 %272, %268
  %274 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 2
  %275 = load i8, i8 addrspace(4)* %274, align 1, !tbaa !17
  %276 = zext i8 %275 to i64
  %277 = shl nuw nsw i64 %276, 16
  %278 = or i64 %273, %277
  %279 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 3
  %280 = load i8, i8 addrspace(4)* %279, align 1, !tbaa !17
  %281 = zext i8 %280 to i64
  %282 = shl nuw nsw i64 %281, 24
  %283 = or i64 %278, %282
  %284 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 4
  %285 = load i8, i8 addrspace(4)* %284, align 1, !tbaa !17
  %286 = zext i8 %285 to i64
  %287 = shl nuw nsw i64 %286, 32
  %288 = or i64 %283, %287
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 5
  %290 = load i8, i8 addrspace(4)* %289, align 1, !tbaa !17
  %291 = zext i8 %290 to i64
  %292 = shl nuw nsw i64 %291, 40
  %293 = or i64 %288, %292
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 6
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !17
  %296 = zext i8 %295 to i64
  %297 = shl nuw nsw i64 %296, 48
  %298 = or i64 %293, %297
  %299 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 7
  %300 = load i8, i8 addrspace(4)* %299, align 1, !tbaa !17
  %301 = zext i8 %300 to i64
  %302 = shl nuw i64 %301, 56
  %303 = or i64 %298, %302
  %304 = add nsw i32 %261, -8
  %305 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 8
  br label %319

306:                                              ; preds = %264, %306
  %307 = phi i32 [ %317, %306 ], [ 0, %264 ]
  %308 = phi i64 [ %316, %306 ], [ 0, %264 ]
  %309 = zext i32 %307 to i64
  %310 = getelementptr inbounds i8, i8 addrspace(4)* %260, i64 %309
  %311 = load i8, i8 addrspace(4)* %310, align 1, !tbaa !17
  %312 = zext i8 %311 to i64
  %313 = shl i32 %307, 3
  %314 = zext i32 %313 to i64
  %315 = shl nuw i64 %312, %314
  %316 = or i64 %315, %308
  %317 = add nuw nsw i32 %307, 1
  %318 = icmp eq i32 %317, %261
  br i1 %318, label %319, label %306

319:                                              ; preds = %306, %266, %264
  %320 = phi i8 addrspace(4)* [ %305, %266 ], [ %260, %264 ], [ %260, %306 ]
  %321 = phi i32 [ %304, %266 ], [ 0, %264 ], [ 0, %306 ]
  %322 = phi i64 [ %303, %266 ], [ 0, %264 ], [ %316, %306 ]
  %323 = icmp ugt i32 %321, 7
  br i1 %323, label %326, label %324

324:                                              ; preds = %319
  %325 = icmp eq i32 %321, 0
  br i1 %325, label %379, label %366

326:                                              ; preds = %319
  %327 = load i8, i8 addrspace(4)* %320, align 1, !tbaa !17
  %328 = zext i8 %327 to i64
  %329 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 1
  %330 = load i8, i8 addrspace(4)* %329, align 1, !tbaa !17
  %331 = zext i8 %330 to i64
  %332 = shl nuw nsw i64 %331, 8
  %333 = or i64 %332, %328
  %334 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 2
  %335 = load i8, i8 addrspace(4)* %334, align 1, !tbaa !17
  %336 = zext i8 %335 to i64
  %337 = shl nuw nsw i64 %336, 16
  %338 = or i64 %333, %337
  %339 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 3
  %340 = load i8, i8 addrspace(4)* %339, align 1, !tbaa !17
  %341 = zext i8 %340 to i64
  %342 = shl nuw nsw i64 %341, 24
  %343 = or i64 %338, %342
  %344 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 4
  %345 = load i8, i8 addrspace(4)* %344, align 1, !tbaa !17
  %346 = zext i8 %345 to i64
  %347 = shl nuw nsw i64 %346, 32
  %348 = or i64 %343, %347
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 5
  %350 = load i8, i8 addrspace(4)* %349, align 1, !tbaa !17
  %351 = zext i8 %350 to i64
  %352 = shl nuw nsw i64 %351, 40
  %353 = or i64 %348, %352
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 6
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !17
  %356 = zext i8 %355 to i64
  %357 = shl nuw nsw i64 %356, 48
  %358 = or i64 %353, %357
  %359 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 7
  %360 = load i8, i8 addrspace(4)* %359, align 1, !tbaa !17
  %361 = zext i8 %360 to i64
  %362 = shl nuw i64 %361, 56
  %363 = or i64 %358, %362
  %364 = add nsw i32 %321, -8
  %365 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 8
  br label %379

366:                                              ; preds = %324, %366
  %367 = phi i32 [ %377, %366 ], [ 0, %324 ]
  %368 = phi i64 [ %376, %366 ], [ 0, %324 ]
  %369 = zext i32 %367 to i64
  %370 = getelementptr inbounds i8, i8 addrspace(4)* %320, i64 %369
  %371 = load i8, i8 addrspace(4)* %370, align 1, !tbaa !17
  %372 = zext i8 %371 to i64
  %373 = shl i32 %367, 3
  %374 = zext i32 %373 to i64
  %375 = shl nuw i64 %372, %374
  %376 = or i64 %375, %368
  %377 = add nuw nsw i32 %367, 1
  %378 = icmp eq i32 %377, %321
  br i1 %378, label %379, label %366

379:                                              ; preds = %366, %326, %324
  %380 = phi i8 addrspace(4)* [ %365, %326 ], [ %320, %324 ], [ %320, %366 ]
  %381 = phi i32 [ %364, %326 ], [ 0, %324 ], [ 0, %366 ]
  %382 = phi i64 [ %363, %326 ], [ 0, %324 ], [ %376, %366 ]
  %383 = icmp ugt i32 %381, 7
  br i1 %383, label %386, label %384

384:                                              ; preds = %379
  %385 = icmp eq i32 %381, 0
  br i1 %385, label %439, label %426

386:                                              ; preds = %379
  %387 = load i8, i8 addrspace(4)* %380, align 1, !tbaa !17
  %388 = zext i8 %387 to i64
  %389 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 1
  %390 = load i8, i8 addrspace(4)* %389, align 1, !tbaa !17
  %391 = zext i8 %390 to i64
  %392 = shl nuw nsw i64 %391, 8
  %393 = or i64 %392, %388
  %394 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 2
  %395 = load i8, i8 addrspace(4)* %394, align 1, !tbaa !17
  %396 = zext i8 %395 to i64
  %397 = shl nuw nsw i64 %396, 16
  %398 = or i64 %393, %397
  %399 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 3
  %400 = load i8, i8 addrspace(4)* %399, align 1, !tbaa !17
  %401 = zext i8 %400 to i64
  %402 = shl nuw nsw i64 %401, 24
  %403 = or i64 %398, %402
  %404 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 4
  %405 = load i8, i8 addrspace(4)* %404, align 1, !tbaa !17
  %406 = zext i8 %405 to i64
  %407 = shl nuw nsw i64 %406, 32
  %408 = or i64 %403, %407
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 5
  %410 = load i8, i8 addrspace(4)* %409, align 1, !tbaa !17
  %411 = zext i8 %410 to i64
  %412 = shl nuw nsw i64 %411, 40
  %413 = or i64 %408, %412
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 6
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !17
  %416 = zext i8 %415 to i64
  %417 = shl nuw nsw i64 %416, 48
  %418 = or i64 %413, %417
  %419 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 7
  %420 = load i8, i8 addrspace(4)* %419, align 1, !tbaa !17
  %421 = zext i8 %420 to i64
  %422 = shl nuw i64 %421, 56
  %423 = or i64 %418, %422
  %424 = add nsw i32 %381, -8
  %425 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 8
  br label %439

426:                                              ; preds = %384, %426
  %427 = phi i32 [ %437, %426 ], [ 0, %384 ]
  %428 = phi i64 [ %436, %426 ], [ 0, %384 ]
  %429 = zext i32 %427 to i64
  %430 = getelementptr inbounds i8, i8 addrspace(4)* %380, i64 %429
  %431 = load i8, i8 addrspace(4)* %430, align 1, !tbaa !17
  %432 = zext i8 %431 to i64
  %433 = shl i32 %427, 3
  %434 = zext i32 %433 to i64
  %435 = shl nuw i64 %432, %434
  %436 = or i64 %435, %428
  %437 = add nuw nsw i32 %427, 1
  %438 = icmp eq i32 %437, %381
  br i1 %438, label %439, label %426

439:                                              ; preds = %426, %386, %384
  %440 = phi i8 addrspace(4)* [ %425, %386 ], [ %380, %384 ], [ %380, %426 ]
  %441 = phi i32 [ %424, %386 ], [ 0, %384 ], [ 0, %426 ]
  %442 = phi i64 [ %423, %386 ], [ 0, %384 ], [ %436, %426 ]
  %443 = icmp ugt i32 %441, 7
  br i1 %443, label %446, label %444

444:                                              ; preds = %439
  %445 = icmp eq i32 %441, 0
  br i1 %445, label %497, label %484

446:                                              ; preds = %439
  %447 = load i8, i8 addrspace(4)* %440, align 1, !tbaa !17
  %448 = zext i8 %447 to i64
  %449 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 1
  %450 = load i8, i8 addrspace(4)* %449, align 1, !tbaa !17
  %451 = zext i8 %450 to i64
  %452 = shl nuw nsw i64 %451, 8
  %453 = or i64 %452, %448
  %454 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 2
  %455 = load i8, i8 addrspace(4)* %454, align 1, !tbaa !17
  %456 = zext i8 %455 to i64
  %457 = shl nuw nsw i64 %456, 16
  %458 = or i64 %453, %457
  %459 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 3
  %460 = load i8, i8 addrspace(4)* %459, align 1, !tbaa !17
  %461 = zext i8 %460 to i64
  %462 = shl nuw nsw i64 %461, 24
  %463 = or i64 %458, %462
  %464 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 4
  %465 = load i8, i8 addrspace(4)* %464, align 1, !tbaa !17
  %466 = zext i8 %465 to i64
  %467 = shl nuw nsw i64 %466, 32
  %468 = or i64 %463, %467
  %469 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 5
  %470 = load i8, i8 addrspace(4)* %469, align 1, !tbaa !17
  %471 = zext i8 %470 to i64
  %472 = shl nuw nsw i64 %471, 40
  %473 = or i64 %468, %472
  %474 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 6
  %475 = load i8, i8 addrspace(4)* %474, align 1, !tbaa !17
  %476 = zext i8 %475 to i64
  %477 = shl nuw nsw i64 %476, 48
  %478 = or i64 %473, %477
  %479 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 7
  %480 = load i8, i8 addrspace(4)* %479, align 1, !tbaa !17
  %481 = zext i8 %480 to i64
  %482 = shl nuw i64 %481, 56
  %483 = or i64 %478, %482
  br label %497

484:                                              ; preds = %444, %484
  %485 = phi i32 [ %495, %484 ], [ 0, %444 ]
  %486 = phi i64 [ %494, %484 ], [ 0, %444 ]
  %487 = zext i32 %485 to i64
  %488 = getelementptr inbounds i8, i8 addrspace(4)* %440, i64 %487
  %489 = load i8, i8 addrspace(4)* %488, align 1, !tbaa !17
  %490 = zext i8 %489 to i64
  %491 = shl i32 %485, 3
  %492 = zext i32 %491 to i64
  %493 = shl nuw i64 %490, %492
  %494 = or i64 %493, %486
  %495 = add nuw nsw i32 %485, 1
  %496 = icmp eq i32 %495, %441
  br i1 %496, label %497, label %484

497:                                              ; preds = %484, %446, %444
  %498 = phi i64 [ %483, %446 ], [ 0, %444 ], [ %494, %484 ]
  %499 = shl nuw nsw i64 %80, 2
  %500 = add nuw nsw i64 %499, 28
  %501 = and i64 %500, 480
  %502 = and i64 %82, -225
  %503 = or i64 %502, %501
  %504 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %503, i64 noundef %142, i64 noundef %202, i64 noundef %262, i64 noundef %322, i64 noundef %382, i64 noundef %442, i64 noundef %498) #10
  %505 = sub i64 %72, %80
  %506 = getelementptr inbounds i8, i8 addrspace(4)* %73, i64 %80
  %507 = icmp eq i64 %505, 0
  br i1 %507, label %508, label %71

508:                                              ; preds = %497, %63
  %509 = phi <2 x i64> [ %66, %63 ], [ %504, %497 ]
  %510 = extractelement <2 x i64> %509, i64 0
  %511 = bitcast double %21 to i64
  %512 = and i64 %510, -225
  %513 = or i64 %512, 32
  %514 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %513, i64 noundef %511, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %515 = extractelement <2 x i64> %514, i64 0
  %516 = bitcast double %38 to i64
  %517 = and i64 %515, -227
  %518 = or i64 %517, 34
  %519 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %518, i64 noundef %516, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %520 = mul i32 %44, %7
  %521 = add i32 %520, %27
  %522 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %523 = extractelement <2 x i64> %522, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), label %524, label %528

524:                                              ; preds = %508
  %525 = and i64 %523, -225
  %526 = or i64 %525, 32
  %527 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %526, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %969

528:                                              ; preds = %508
  %529 = and i64 %523, 2
  %530 = and i64 %523, -3
  %531 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %530, i64 0
  br label %532

532:                                              ; preds = %958, %528
  %533 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str.1, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str.1, i64 0, i64 40) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([41 x i8]* addrspacecast ([41 x i8] addrspace(4)* @.str.1 to [41 x i8]*) to i64)), i64 1))), %528 ], [ %966, %958 ]
  %534 = phi i8 addrspace(4)* [ getelementptr inbounds ([41 x i8], [41 x i8] addrspace(4)* @.str.1, i64 0, i64 0), %528 ], [ %967, %958 ]
  %535 = phi <2 x i64> [ %531, %528 ], [ %965, %958 ]
  %536 = icmp ugt i64 %533, 56
  %537 = extractelement <2 x i64> %535, i64 0
  %538 = or i64 %537, %529
  %539 = insertelement <2 x i64> poison, i64 %538, i64 0
  %540 = select i1 %536, <2 x i64> %535, <2 x i64> %539
  %541 = tail call i64 @llvm.umin.i64(i64 %533, i64 56)
  %542 = trunc i64 %541 to i32
  %543 = extractelement <2 x i64> %540, i64 0
  %544 = icmp ugt i32 %542, 7
  br i1 %544, label %547, label %545

545:                                              ; preds = %532
  %546 = icmp eq i32 %542, 0
  br i1 %546, label %600, label %587

547:                                              ; preds = %532
  %548 = load i8, i8 addrspace(4)* %534, align 1, !tbaa !17
  %549 = zext i8 %548 to i64
  %550 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 1
  %551 = load i8, i8 addrspace(4)* %550, align 1, !tbaa !17
  %552 = zext i8 %551 to i64
  %553 = shl nuw nsw i64 %552, 8
  %554 = or i64 %553, %549
  %555 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 2
  %556 = load i8, i8 addrspace(4)* %555, align 1, !tbaa !17
  %557 = zext i8 %556 to i64
  %558 = shl nuw nsw i64 %557, 16
  %559 = or i64 %554, %558
  %560 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 3
  %561 = load i8, i8 addrspace(4)* %560, align 1, !tbaa !17
  %562 = zext i8 %561 to i64
  %563 = shl nuw nsw i64 %562, 24
  %564 = or i64 %559, %563
  %565 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 4
  %566 = load i8, i8 addrspace(4)* %565, align 1, !tbaa !17
  %567 = zext i8 %566 to i64
  %568 = shl nuw nsw i64 %567, 32
  %569 = or i64 %564, %568
  %570 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 5
  %571 = load i8, i8 addrspace(4)* %570, align 1, !tbaa !17
  %572 = zext i8 %571 to i64
  %573 = shl nuw nsw i64 %572, 40
  %574 = or i64 %569, %573
  %575 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 6
  %576 = load i8, i8 addrspace(4)* %575, align 1, !tbaa !17
  %577 = zext i8 %576 to i64
  %578 = shl nuw nsw i64 %577, 48
  %579 = or i64 %574, %578
  %580 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 7
  %581 = load i8, i8 addrspace(4)* %580, align 1, !tbaa !17
  %582 = zext i8 %581 to i64
  %583 = shl nuw i64 %582, 56
  %584 = or i64 %579, %583
  %585 = add nsw i32 %542, -8
  %586 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 8
  br label %600

587:                                              ; preds = %545, %587
  %588 = phi i32 [ %598, %587 ], [ 0, %545 ]
  %589 = phi i64 [ %597, %587 ], [ 0, %545 ]
  %590 = zext i32 %588 to i64
  %591 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 %590
  %592 = load i8, i8 addrspace(4)* %591, align 1, !tbaa !17
  %593 = zext i8 %592 to i64
  %594 = shl i32 %588, 3
  %595 = zext i32 %594 to i64
  %596 = shl nuw i64 %593, %595
  %597 = or i64 %596, %589
  %598 = add nuw nsw i32 %588, 1
  %599 = icmp eq i32 %598, %542
  br i1 %599, label %600, label %587, !llvm.loop !18

600:                                              ; preds = %587, %547, %545
  %601 = phi i8 addrspace(4)* [ %586, %547 ], [ %534, %545 ], [ %534, %587 ]
  %602 = phi i32 [ %585, %547 ], [ 0, %545 ], [ 0, %587 ]
  %603 = phi i64 [ %584, %547 ], [ 0, %545 ], [ %597, %587 ]
  %604 = icmp ugt i32 %602, 7
  br i1 %604, label %607, label %605

605:                                              ; preds = %600
  %606 = icmp eq i32 %602, 0
  br i1 %606, label %660, label %647

607:                                              ; preds = %600
  %608 = load i8, i8 addrspace(4)* %601, align 1, !tbaa !17
  %609 = zext i8 %608 to i64
  %610 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 1
  %611 = load i8, i8 addrspace(4)* %610, align 1, !tbaa !17
  %612 = zext i8 %611 to i64
  %613 = shl nuw nsw i64 %612, 8
  %614 = or i64 %613, %609
  %615 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 2
  %616 = load i8, i8 addrspace(4)* %615, align 1, !tbaa !17
  %617 = zext i8 %616 to i64
  %618 = shl nuw nsw i64 %617, 16
  %619 = or i64 %614, %618
  %620 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 3
  %621 = load i8, i8 addrspace(4)* %620, align 1, !tbaa !17
  %622 = zext i8 %621 to i64
  %623 = shl nuw nsw i64 %622, 24
  %624 = or i64 %619, %623
  %625 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 4
  %626 = load i8, i8 addrspace(4)* %625, align 1, !tbaa !17
  %627 = zext i8 %626 to i64
  %628 = shl nuw nsw i64 %627, 32
  %629 = or i64 %624, %628
  %630 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 5
  %631 = load i8, i8 addrspace(4)* %630, align 1, !tbaa !17
  %632 = zext i8 %631 to i64
  %633 = shl nuw nsw i64 %632, 40
  %634 = or i64 %629, %633
  %635 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 6
  %636 = load i8, i8 addrspace(4)* %635, align 1, !tbaa !17
  %637 = zext i8 %636 to i64
  %638 = shl nuw nsw i64 %637, 48
  %639 = or i64 %634, %638
  %640 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 7
  %641 = load i8, i8 addrspace(4)* %640, align 1, !tbaa !17
  %642 = zext i8 %641 to i64
  %643 = shl nuw i64 %642, 56
  %644 = or i64 %639, %643
  %645 = add nsw i32 %602, -8
  %646 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 8
  br label %660

647:                                              ; preds = %605, %647
  %648 = phi i32 [ %658, %647 ], [ 0, %605 ]
  %649 = phi i64 [ %657, %647 ], [ 0, %605 ]
  %650 = zext i32 %648 to i64
  %651 = getelementptr inbounds i8, i8 addrspace(4)* %601, i64 %650
  %652 = load i8, i8 addrspace(4)* %651, align 1, !tbaa !17
  %653 = zext i8 %652 to i64
  %654 = shl i32 %648, 3
  %655 = zext i32 %654 to i64
  %656 = shl nuw i64 %653, %655
  %657 = or i64 %656, %649
  %658 = add nuw nsw i32 %648, 1
  %659 = icmp eq i32 %658, %602
  br i1 %659, label %660, label %647

660:                                              ; preds = %647, %607, %605
  %661 = phi i8 addrspace(4)* [ %646, %607 ], [ %601, %605 ], [ %601, %647 ]
  %662 = phi i32 [ %645, %607 ], [ 0, %605 ], [ 0, %647 ]
  %663 = phi i64 [ %644, %607 ], [ 0, %605 ], [ %657, %647 ]
  %664 = icmp ugt i32 %662, 7
  br i1 %664, label %667, label %665

665:                                              ; preds = %660
  %666 = icmp eq i32 %662, 0
  br i1 %666, label %720, label %707

667:                                              ; preds = %660
  %668 = load i8, i8 addrspace(4)* %661, align 1, !tbaa !17
  %669 = zext i8 %668 to i64
  %670 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 1
  %671 = load i8, i8 addrspace(4)* %670, align 1, !tbaa !17
  %672 = zext i8 %671 to i64
  %673 = shl nuw nsw i64 %672, 8
  %674 = or i64 %673, %669
  %675 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 2
  %676 = load i8, i8 addrspace(4)* %675, align 1, !tbaa !17
  %677 = zext i8 %676 to i64
  %678 = shl nuw nsw i64 %677, 16
  %679 = or i64 %674, %678
  %680 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 3
  %681 = load i8, i8 addrspace(4)* %680, align 1, !tbaa !17
  %682 = zext i8 %681 to i64
  %683 = shl nuw nsw i64 %682, 24
  %684 = or i64 %679, %683
  %685 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 4
  %686 = load i8, i8 addrspace(4)* %685, align 1, !tbaa !17
  %687 = zext i8 %686 to i64
  %688 = shl nuw nsw i64 %687, 32
  %689 = or i64 %684, %688
  %690 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 5
  %691 = load i8, i8 addrspace(4)* %690, align 1, !tbaa !17
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 40
  %694 = or i64 %689, %693
  %695 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 6
  %696 = load i8, i8 addrspace(4)* %695, align 1, !tbaa !17
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 48
  %699 = or i64 %694, %698
  %700 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 7
  %701 = load i8, i8 addrspace(4)* %700, align 1, !tbaa !17
  %702 = zext i8 %701 to i64
  %703 = shl nuw i64 %702, 56
  %704 = or i64 %699, %703
  %705 = add nsw i32 %662, -8
  %706 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 8
  br label %720

707:                                              ; preds = %665, %707
  %708 = phi i32 [ %718, %707 ], [ 0, %665 ]
  %709 = phi i64 [ %717, %707 ], [ 0, %665 ]
  %710 = zext i32 %708 to i64
  %711 = getelementptr inbounds i8, i8 addrspace(4)* %661, i64 %710
  %712 = load i8, i8 addrspace(4)* %711, align 1, !tbaa !17
  %713 = zext i8 %712 to i64
  %714 = shl i32 %708, 3
  %715 = zext i32 %714 to i64
  %716 = shl nuw i64 %713, %715
  %717 = or i64 %716, %709
  %718 = add nuw nsw i32 %708, 1
  %719 = icmp eq i32 %718, %662
  br i1 %719, label %720, label %707

720:                                              ; preds = %707, %667, %665
  %721 = phi i8 addrspace(4)* [ %706, %667 ], [ %661, %665 ], [ %661, %707 ]
  %722 = phi i32 [ %705, %667 ], [ 0, %665 ], [ 0, %707 ]
  %723 = phi i64 [ %704, %667 ], [ 0, %665 ], [ %717, %707 ]
  %724 = icmp ugt i32 %722, 7
  br i1 %724, label %727, label %725

725:                                              ; preds = %720
  %726 = icmp eq i32 %722, 0
  br i1 %726, label %780, label %767

727:                                              ; preds = %720
  %728 = load i8, i8 addrspace(4)* %721, align 1, !tbaa !17
  %729 = zext i8 %728 to i64
  %730 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 1
  %731 = load i8, i8 addrspace(4)* %730, align 1, !tbaa !17
  %732 = zext i8 %731 to i64
  %733 = shl nuw nsw i64 %732, 8
  %734 = or i64 %733, %729
  %735 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 2
  %736 = load i8, i8 addrspace(4)* %735, align 1, !tbaa !17
  %737 = zext i8 %736 to i64
  %738 = shl nuw nsw i64 %737, 16
  %739 = or i64 %734, %738
  %740 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 3
  %741 = load i8, i8 addrspace(4)* %740, align 1, !tbaa !17
  %742 = zext i8 %741 to i64
  %743 = shl nuw nsw i64 %742, 24
  %744 = or i64 %739, %743
  %745 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 4
  %746 = load i8, i8 addrspace(4)* %745, align 1, !tbaa !17
  %747 = zext i8 %746 to i64
  %748 = shl nuw nsw i64 %747, 32
  %749 = or i64 %744, %748
  %750 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 5
  %751 = load i8, i8 addrspace(4)* %750, align 1, !tbaa !17
  %752 = zext i8 %751 to i64
  %753 = shl nuw nsw i64 %752, 40
  %754 = or i64 %749, %753
  %755 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 6
  %756 = load i8, i8 addrspace(4)* %755, align 1, !tbaa !17
  %757 = zext i8 %756 to i64
  %758 = shl nuw nsw i64 %757, 48
  %759 = or i64 %754, %758
  %760 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 7
  %761 = load i8, i8 addrspace(4)* %760, align 1, !tbaa !17
  %762 = zext i8 %761 to i64
  %763 = shl nuw i64 %762, 56
  %764 = or i64 %759, %763
  %765 = add nsw i32 %722, -8
  %766 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 8
  br label %780

767:                                              ; preds = %725, %767
  %768 = phi i32 [ %778, %767 ], [ 0, %725 ]
  %769 = phi i64 [ %777, %767 ], [ 0, %725 ]
  %770 = zext i32 %768 to i64
  %771 = getelementptr inbounds i8, i8 addrspace(4)* %721, i64 %770
  %772 = load i8, i8 addrspace(4)* %771, align 1, !tbaa !17
  %773 = zext i8 %772 to i64
  %774 = shl i32 %768, 3
  %775 = zext i32 %774 to i64
  %776 = shl nuw i64 %773, %775
  %777 = or i64 %776, %769
  %778 = add nuw nsw i32 %768, 1
  %779 = icmp eq i32 %778, %722
  br i1 %779, label %780, label %767

780:                                              ; preds = %767, %727, %725
  %781 = phi i8 addrspace(4)* [ %766, %727 ], [ %721, %725 ], [ %721, %767 ]
  %782 = phi i32 [ %765, %727 ], [ 0, %725 ], [ 0, %767 ]
  %783 = phi i64 [ %764, %727 ], [ 0, %725 ], [ %777, %767 ]
  %784 = icmp ugt i32 %782, 7
  br i1 %784, label %787, label %785

785:                                              ; preds = %780
  %786 = icmp eq i32 %782, 0
  br i1 %786, label %840, label %827

787:                                              ; preds = %780
  %788 = load i8, i8 addrspace(4)* %781, align 1, !tbaa !17
  %789 = zext i8 %788 to i64
  %790 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 1
  %791 = load i8, i8 addrspace(4)* %790, align 1, !tbaa !17
  %792 = zext i8 %791 to i64
  %793 = shl nuw nsw i64 %792, 8
  %794 = or i64 %793, %789
  %795 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 2
  %796 = load i8, i8 addrspace(4)* %795, align 1, !tbaa !17
  %797 = zext i8 %796 to i64
  %798 = shl nuw nsw i64 %797, 16
  %799 = or i64 %794, %798
  %800 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 3
  %801 = load i8, i8 addrspace(4)* %800, align 1, !tbaa !17
  %802 = zext i8 %801 to i64
  %803 = shl nuw nsw i64 %802, 24
  %804 = or i64 %799, %803
  %805 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 4
  %806 = load i8, i8 addrspace(4)* %805, align 1, !tbaa !17
  %807 = zext i8 %806 to i64
  %808 = shl nuw nsw i64 %807, 32
  %809 = or i64 %804, %808
  %810 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 5
  %811 = load i8, i8 addrspace(4)* %810, align 1, !tbaa !17
  %812 = zext i8 %811 to i64
  %813 = shl nuw nsw i64 %812, 40
  %814 = or i64 %809, %813
  %815 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 6
  %816 = load i8, i8 addrspace(4)* %815, align 1, !tbaa !17
  %817 = zext i8 %816 to i64
  %818 = shl nuw nsw i64 %817, 48
  %819 = or i64 %814, %818
  %820 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 7
  %821 = load i8, i8 addrspace(4)* %820, align 1, !tbaa !17
  %822 = zext i8 %821 to i64
  %823 = shl nuw i64 %822, 56
  %824 = or i64 %819, %823
  %825 = add nsw i32 %782, -8
  %826 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 8
  br label %840

827:                                              ; preds = %785, %827
  %828 = phi i32 [ %838, %827 ], [ 0, %785 ]
  %829 = phi i64 [ %837, %827 ], [ 0, %785 ]
  %830 = zext i32 %828 to i64
  %831 = getelementptr inbounds i8, i8 addrspace(4)* %781, i64 %830
  %832 = load i8, i8 addrspace(4)* %831, align 1, !tbaa !17
  %833 = zext i8 %832 to i64
  %834 = shl i32 %828, 3
  %835 = zext i32 %834 to i64
  %836 = shl nuw i64 %833, %835
  %837 = or i64 %836, %829
  %838 = add nuw nsw i32 %828, 1
  %839 = icmp eq i32 %838, %782
  br i1 %839, label %840, label %827

840:                                              ; preds = %827, %787, %785
  %841 = phi i8 addrspace(4)* [ %826, %787 ], [ %781, %785 ], [ %781, %827 ]
  %842 = phi i32 [ %825, %787 ], [ 0, %785 ], [ 0, %827 ]
  %843 = phi i64 [ %824, %787 ], [ 0, %785 ], [ %837, %827 ]
  %844 = icmp ugt i32 %842, 7
  br i1 %844, label %847, label %845

845:                                              ; preds = %840
  %846 = icmp eq i32 %842, 0
  br i1 %846, label %900, label %887

847:                                              ; preds = %840
  %848 = load i8, i8 addrspace(4)* %841, align 1, !tbaa !17
  %849 = zext i8 %848 to i64
  %850 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 1
  %851 = load i8, i8 addrspace(4)* %850, align 1, !tbaa !17
  %852 = zext i8 %851 to i64
  %853 = shl nuw nsw i64 %852, 8
  %854 = or i64 %853, %849
  %855 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 2
  %856 = load i8, i8 addrspace(4)* %855, align 1, !tbaa !17
  %857 = zext i8 %856 to i64
  %858 = shl nuw nsw i64 %857, 16
  %859 = or i64 %854, %858
  %860 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 3
  %861 = load i8, i8 addrspace(4)* %860, align 1, !tbaa !17
  %862 = zext i8 %861 to i64
  %863 = shl nuw nsw i64 %862, 24
  %864 = or i64 %859, %863
  %865 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 4
  %866 = load i8, i8 addrspace(4)* %865, align 1, !tbaa !17
  %867 = zext i8 %866 to i64
  %868 = shl nuw nsw i64 %867, 32
  %869 = or i64 %864, %868
  %870 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 5
  %871 = load i8, i8 addrspace(4)* %870, align 1, !tbaa !17
  %872 = zext i8 %871 to i64
  %873 = shl nuw nsw i64 %872, 40
  %874 = or i64 %869, %873
  %875 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 6
  %876 = load i8, i8 addrspace(4)* %875, align 1, !tbaa !17
  %877 = zext i8 %876 to i64
  %878 = shl nuw nsw i64 %877, 48
  %879 = or i64 %874, %878
  %880 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 7
  %881 = load i8, i8 addrspace(4)* %880, align 1, !tbaa !17
  %882 = zext i8 %881 to i64
  %883 = shl nuw i64 %882, 56
  %884 = or i64 %879, %883
  %885 = add nsw i32 %842, -8
  %886 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 8
  br label %900

887:                                              ; preds = %845, %887
  %888 = phi i32 [ %898, %887 ], [ 0, %845 ]
  %889 = phi i64 [ %897, %887 ], [ 0, %845 ]
  %890 = zext i32 %888 to i64
  %891 = getelementptr inbounds i8, i8 addrspace(4)* %841, i64 %890
  %892 = load i8, i8 addrspace(4)* %891, align 1, !tbaa !17
  %893 = zext i8 %892 to i64
  %894 = shl i32 %888, 3
  %895 = zext i32 %894 to i64
  %896 = shl nuw i64 %893, %895
  %897 = or i64 %896, %889
  %898 = add nuw nsw i32 %888, 1
  %899 = icmp eq i32 %898, %842
  br i1 %899, label %900, label %887

900:                                              ; preds = %887, %847, %845
  %901 = phi i8 addrspace(4)* [ %886, %847 ], [ %841, %845 ], [ %841, %887 ]
  %902 = phi i32 [ %885, %847 ], [ 0, %845 ], [ 0, %887 ]
  %903 = phi i64 [ %884, %847 ], [ 0, %845 ], [ %897, %887 ]
  %904 = icmp ugt i32 %902, 7
  br i1 %904, label %907, label %905

905:                                              ; preds = %900
  %906 = icmp eq i32 %902, 0
  br i1 %906, label %958, label %945

907:                                              ; preds = %900
  %908 = load i8, i8 addrspace(4)* %901, align 1, !tbaa !17
  %909 = zext i8 %908 to i64
  %910 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 1
  %911 = load i8, i8 addrspace(4)* %910, align 1, !tbaa !17
  %912 = zext i8 %911 to i64
  %913 = shl nuw nsw i64 %912, 8
  %914 = or i64 %913, %909
  %915 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 2
  %916 = load i8, i8 addrspace(4)* %915, align 1, !tbaa !17
  %917 = zext i8 %916 to i64
  %918 = shl nuw nsw i64 %917, 16
  %919 = or i64 %914, %918
  %920 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 3
  %921 = load i8, i8 addrspace(4)* %920, align 1, !tbaa !17
  %922 = zext i8 %921 to i64
  %923 = shl nuw nsw i64 %922, 24
  %924 = or i64 %919, %923
  %925 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 4
  %926 = load i8, i8 addrspace(4)* %925, align 1, !tbaa !17
  %927 = zext i8 %926 to i64
  %928 = shl nuw nsw i64 %927, 32
  %929 = or i64 %924, %928
  %930 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 5
  %931 = load i8, i8 addrspace(4)* %930, align 1, !tbaa !17
  %932 = zext i8 %931 to i64
  %933 = shl nuw nsw i64 %932, 40
  %934 = or i64 %929, %933
  %935 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 6
  %936 = load i8, i8 addrspace(4)* %935, align 1, !tbaa !17
  %937 = zext i8 %936 to i64
  %938 = shl nuw nsw i64 %937, 48
  %939 = or i64 %934, %938
  %940 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 7
  %941 = load i8, i8 addrspace(4)* %940, align 1, !tbaa !17
  %942 = zext i8 %941 to i64
  %943 = shl nuw i64 %942, 56
  %944 = or i64 %939, %943
  br label %958

945:                                              ; preds = %905, %945
  %946 = phi i32 [ %956, %945 ], [ 0, %905 ]
  %947 = phi i64 [ %955, %945 ], [ 0, %905 ]
  %948 = zext i32 %946 to i64
  %949 = getelementptr inbounds i8, i8 addrspace(4)* %901, i64 %948
  %950 = load i8, i8 addrspace(4)* %949, align 1, !tbaa !17
  %951 = zext i8 %950 to i64
  %952 = shl i32 %946, 3
  %953 = zext i32 %952 to i64
  %954 = shl nuw i64 %951, %953
  %955 = or i64 %954, %947
  %956 = add nuw nsw i32 %946, 1
  %957 = icmp eq i32 %956, %902
  br i1 %957, label %958, label %945

958:                                              ; preds = %945, %907, %905
  %959 = phi i64 [ %944, %907 ], [ 0, %905 ], [ %955, %945 ]
  %960 = shl nuw nsw i64 %541, 2
  %961 = add nuw nsw i64 %960, 28
  %962 = and i64 %961, 480
  %963 = and i64 %543, -225
  %964 = or i64 %963, %962
  %965 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %964, i64 noundef %603, i64 noundef %663, i64 noundef %723, i64 noundef %783, i64 noundef %843, i64 noundef %903, i64 noundef %959) #10
  %966 = sub i64 %533, %541
  %967 = getelementptr inbounds i8, i8 addrspace(4)* %534, i64 %541
  %968 = icmp eq i64 %966, 0
  br i1 %968, label %969, label %532

969:                                              ; preds = %958, %524
  %970 = phi <2 x i64> [ %527, %524 ], [ %965, %958 ]
  %971 = extractelement <2 x i64> %970, i64 0
  %972 = zext i32 %27 to i64
  %973 = and i64 %971, -225
  %974 = or i64 %973, 32
  %975 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %974, i64 noundef %972, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %976 = extractelement <2 x i64> %975, i64 0
  %977 = zext i32 %44 to i64
  %978 = and i64 %976, -225
  %979 = or i64 %978, 32
  %980 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %979, i64 noundef %977, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  %981 = extractelement <2 x i64> %980, i64 0
  %982 = zext i32 %521 to i64
  %983 = and i64 %981, -227
  %984 = or i64 %983, 34
  %985 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %60, i64 noundef %984, i64 noundef %982, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #10
  br label %986

986:                                              ; preds = %969, %52
  %987 = add i32 %7, -1
  %988 = icmp ugt i32 %27, %987
  %989 = add i32 %6, -1
  %990 = icmp ugt i32 %44, %989
  %991 = select i1 %988, i1 true, i1 %990
  br i1 %991, label %998, label %992

992:                                              ; preds = %986
  %993 = mul i32 %44, %7
  %994 = add i32 %993, %27
  %995 = zext i32 %994 to i64
  %996 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %995
  %997 = atomicrmw add i32 addrspace(1)* %996, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %998

998:                                              ; preds = %986, %992
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
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !13
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !13
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !13
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !13
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !13
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !13
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !13
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !13
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !13
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
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
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
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
