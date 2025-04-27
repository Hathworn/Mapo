; ModuleID = '/home/LiuS/LS-CAT-HIP/data/hip_kernels/10455/1/colorVectorField.cu'
source_filename = "/home/LiuS/LS-CAT-HIP/data/hip_kernels/10455/1/colorVectorField.cu"
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
%union.anon = type { %"struct.HIP_vector_base<float, 3>::Native_vec_" }
%"struct.HIP_vector_base<float, 3>::Native_vec_" = type { [3 x float] }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <2 x float> }
%struct.dim3 = type { i32, i32, i32 }

@.str = private unnamed_addr addrspace(4) constant [54 x i8] c"coloring vector field values on the order of: %f, %f\0A\00", align 1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z16colorVectorFieldP15HIP_vector_typeIfLj3EES1_PS_IfLj2EE4dim3jj(%struct.HIP_vector_type addrspace(1)* nocapture writeonly %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type.0 addrspace(1)* noalias nocapture readonly %2, %struct.dim3 addrspace(4)* nocapture readnone byref(%struct.dim3) align 4 %3, i32 %4, i32 %5) local_unnamed_addr #1 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul i32 %23, %4
  %25 = add i32 %24, %15
  %26 = lshr i32 %4, 1
  %27 = add nuw i32 %26, 10
  %28 = icmp eq i32 %15, %27
  %29 = icmp eq i32 %23, %27
  %30 = select i1 %28, i1 %29, i1 false
  %31 = sext i32 %25 to i64
  %32 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %31, i32 0, i32 0, i32 0, i64 0
  %33 = load float, float addrspace(1)* %32, align 8, !tbaa !7
  %34 = fpext float %33 to double
  br i1 %30, label %35, label %504

35:                                               ; preds = %6
  %36 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %2, i64 %31, i32 0, i32 0, i32 0, i64 1
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fpext float %37 to double
  %39 = tail call i8 addrspace(4)* @llvm.amdgcn.implicitarg.ptr()
  %40 = getelementptr inbounds i8, i8 addrspace(4)* %39, i64 24
  %41 = bitcast i8 addrspace(4)* %40 to i64 addrspace(4)*
  %42 = load i64, i64 addrspace(4)* %41, align 8, !tbaa !10
  %43 = inttoptr i64 %42 to i8 addrspace(1)*
  %44 = addrspacecast i8 addrspace(1)* %43 to i8*
  %45 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef 33, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %46 = extractelement <2 x i64> %45, i64 0
  br i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([54 x i8], [54 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), label %47, label %51

47:                                               ; preds = %35
  %48 = and i64 %46, -225
  %49 = or i64 %48, 32
  %50 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %49, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %492

51:                                               ; preds = %35
  %52 = and i64 %46, 2
  %53 = and i64 %46, -3
  %54 = insertelement <2 x i64> <i64 poison, i64 0>, i64 %53, i64 0
  br label %55

55:                                               ; preds = %481, %51
  %56 = phi i64 [ select (i1 icmp eq (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([54 x i8], [54 x i8] addrspace(4)* @.str, i64 0, i64 0) to i8*), i8* null), i64 0, i64 add (i64 ptrtoint (i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([54 x i8], [54 x i8] addrspace(4)* @.str, i64 0, i64 53) to i8*) to i64), i64 add (i64 sub (i64 0, i64 ptrtoint ([54 x i8]* addrspacecast ([54 x i8] addrspace(4)* @.str to [54 x i8]*) to i64)), i64 1))), %51 ], [ %489, %481 ]
  %57 = phi i8 addrspace(4)* [ getelementptr inbounds ([54 x i8], [54 x i8] addrspace(4)* @.str, i64 0, i64 0), %51 ], [ %490, %481 ]
  %58 = phi <2 x i64> [ %54, %51 ], [ %488, %481 ]
  %59 = icmp ugt i64 %56, 56
  %60 = extractelement <2 x i64> %58, i64 0
  %61 = or i64 %60, %52
  %62 = insertelement <2 x i64> poison, i64 %61, i64 0
  %63 = select i1 %59, <2 x i64> %58, <2 x i64> %62
  %64 = tail call i64 @llvm.umin.i64(i64 %56, i64 56)
  %65 = trunc i64 %64 to i32
  %66 = extractelement <2 x i64> %63, i64 0
  %67 = icmp ugt i32 %65, 7
  br i1 %67, label %70, label %68

68:                                               ; preds = %55
  %69 = icmp eq i32 %65, 0
  br i1 %69, label %123, label %110

70:                                               ; preds = %55
  %71 = load i8, i8 addrspace(4)* %57, align 1, !tbaa !14
  %72 = zext i8 %71 to i64
  %73 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 1
  %74 = load i8, i8 addrspace(4)* %73, align 1, !tbaa !14
  %75 = zext i8 %74 to i64
  %76 = shl nuw nsw i64 %75, 8
  %77 = or i64 %76, %72
  %78 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 2
  %79 = load i8, i8 addrspace(4)* %78, align 1, !tbaa !14
  %80 = zext i8 %79 to i64
  %81 = shl nuw nsw i64 %80, 16
  %82 = or i64 %77, %81
  %83 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 3
  %84 = load i8, i8 addrspace(4)* %83, align 1, !tbaa !14
  %85 = zext i8 %84 to i64
  %86 = shl nuw nsw i64 %85, 24
  %87 = or i64 %82, %86
  %88 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 4
  %89 = load i8, i8 addrspace(4)* %88, align 1, !tbaa !14
  %90 = zext i8 %89 to i64
  %91 = shl nuw nsw i64 %90, 32
  %92 = or i64 %87, %91
  %93 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 5
  %94 = load i8, i8 addrspace(4)* %93, align 1, !tbaa !14
  %95 = zext i8 %94 to i64
  %96 = shl nuw nsw i64 %95, 40
  %97 = or i64 %92, %96
  %98 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 6
  %99 = load i8, i8 addrspace(4)* %98, align 1, !tbaa !14
  %100 = zext i8 %99 to i64
  %101 = shl nuw nsw i64 %100, 48
  %102 = or i64 %97, %101
  %103 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 7
  %104 = load i8, i8 addrspace(4)* %103, align 1, !tbaa !14
  %105 = zext i8 %104 to i64
  %106 = shl nuw i64 %105, 56
  %107 = or i64 %102, %106
  %108 = add nsw i32 %65, -8
  %109 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 8
  br label %123

110:                                              ; preds = %68, %110
  %111 = phi i32 [ %121, %110 ], [ 0, %68 ]
  %112 = phi i64 [ %120, %110 ], [ 0, %68 ]
  %113 = zext i32 %111 to i64
  %114 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 %113
  %115 = load i8, i8 addrspace(4)* %114, align 1, !tbaa !14
  %116 = zext i8 %115 to i64
  %117 = shl i32 %111, 3
  %118 = zext i32 %117 to i64
  %119 = shl nuw i64 %116, %118
  %120 = or i64 %119, %112
  %121 = add nuw nsw i32 %111, 1
  %122 = icmp eq i32 %121, %65
  br i1 %122, label %123, label %110, !llvm.loop !15

123:                                              ; preds = %110, %70, %68
  %124 = phi i8 addrspace(4)* [ %109, %70 ], [ %57, %68 ], [ %57, %110 ]
  %125 = phi i32 [ %108, %70 ], [ 0, %68 ], [ 0, %110 ]
  %126 = phi i64 [ %107, %70 ], [ 0, %68 ], [ %120, %110 ]
  %127 = icmp ugt i32 %125, 7
  br i1 %127, label %130, label %128

128:                                              ; preds = %123
  %129 = icmp eq i32 %125, 0
  br i1 %129, label %183, label %170

130:                                              ; preds = %123
  %131 = load i8, i8 addrspace(4)* %124, align 1, !tbaa !14
  %132 = zext i8 %131 to i64
  %133 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 1
  %134 = load i8, i8 addrspace(4)* %133, align 1, !tbaa !14
  %135 = zext i8 %134 to i64
  %136 = shl nuw nsw i64 %135, 8
  %137 = or i64 %136, %132
  %138 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 2
  %139 = load i8, i8 addrspace(4)* %138, align 1, !tbaa !14
  %140 = zext i8 %139 to i64
  %141 = shl nuw nsw i64 %140, 16
  %142 = or i64 %137, %141
  %143 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 3
  %144 = load i8, i8 addrspace(4)* %143, align 1, !tbaa !14
  %145 = zext i8 %144 to i64
  %146 = shl nuw nsw i64 %145, 24
  %147 = or i64 %142, %146
  %148 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 4
  %149 = load i8, i8 addrspace(4)* %148, align 1, !tbaa !14
  %150 = zext i8 %149 to i64
  %151 = shl nuw nsw i64 %150, 32
  %152 = or i64 %147, %151
  %153 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 5
  %154 = load i8, i8 addrspace(4)* %153, align 1, !tbaa !14
  %155 = zext i8 %154 to i64
  %156 = shl nuw nsw i64 %155, 40
  %157 = or i64 %152, %156
  %158 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 6
  %159 = load i8, i8 addrspace(4)* %158, align 1, !tbaa !14
  %160 = zext i8 %159 to i64
  %161 = shl nuw nsw i64 %160, 48
  %162 = or i64 %157, %161
  %163 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 7
  %164 = load i8, i8 addrspace(4)* %163, align 1, !tbaa !14
  %165 = zext i8 %164 to i64
  %166 = shl nuw i64 %165, 56
  %167 = or i64 %162, %166
  %168 = add nsw i32 %125, -8
  %169 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 8
  br label %183

170:                                              ; preds = %128, %170
  %171 = phi i32 [ %181, %170 ], [ 0, %128 ]
  %172 = phi i64 [ %180, %170 ], [ 0, %128 ]
  %173 = zext i32 %171 to i64
  %174 = getelementptr inbounds i8, i8 addrspace(4)* %124, i64 %173
  %175 = load i8, i8 addrspace(4)* %174, align 1, !tbaa !14
  %176 = zext i8 %175 to i64
  %177 = shl i32 %171, 3
  %178 = zext i32 %177 to i64
  %179 = shl nuw i64 %176, %178
  %180 = or i64 %179, %172
  %181 = add nuw nsw i32 %171, 1
  %182 = icmp eq i32 %181, %125
  br i1 %182, label %183, label %170

183:                                              ; preds = %170, %130, %128
  %184 = phi i8 addrspace(4)* [ %169, %130 ], [ %124, %128 ], [ %124, %170 ]
  %185 = phi i32 [ %168, %130 ], [ 0, %128 ], [ 0, %170 ]
  %186 = phi i64 [ %167, %130 ], [ 0, %128 ], [ %180, %170 ]
  %187 = icmp ugt i32 %185, 7
  br i1 %187, label %190, label %188

188:                                              ; preds = %183
  %189 = icmp eq i32 %185, 0
  br i1 %189, label %243, label %230

190:                                              ; preds = %183
  %191 = load i8, i8 addrspace(4)* %184, align 1, !tbaa !14
  %192 = zext i8 %191 to i64
  %193 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 1
  %194 = load i8, i8 addrspace(4)* %193, align 1, !tbaa !14
  %195 = zext i8 %194 to i64
  %196 = shl nuw nsw i64 %195, 8
  %197 = or i64 %196, %192
  %198 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 2
  %199 = load i8, i8 addrspace(4)* %198, align 1, !tbaa !14
  %200 = zext i8 %199 to i64
  %201 = shl nuw nsw i64 %200, 16
  %202 = or i64 %197, %201
  %203 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 3
  %204 = load i8, i8 addrspace(4)* %203, align 1, !tbaa !14
  %205 = zext i8 %204 to i64
  %206 = shl nuw nsw i64 %205, 24
  %207 = or i64 %202, %206
  %208 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 4
  %209 = load i8, i8 addrspace(4)* %208, align 1, !tbaa !14
  %210 = zext i8 %209 to i64
  %211 = shl nuw nsw i64 %210, 32
  %212 = or i64 %207, %211
  %213 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 5
  %214 = load i8, i8 addrspace(4)* %213, align 1, !tbaa !14
  %215 = zext i8 %214 to i64
  %216 = shl nuw nsw i64 %215, 40
  %217 = or i64 %212, %216
  %218 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 6
  %219 = load i8, i8 addrspace(4)* %218, align 1, !tbaa !14
  %220 = zext i8 %219 to i64
  %221 = shl nuw nsw i64 %220, 48
  %222 = or i64 %217, %221
  %223 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 7
  %224 = load i8, i8 addrspace(4)* %223, align 1, !tbaa !14
  %225 = zext i8 %224 to i64
  %226 = shl nuw i64 %225, 56
  %227 = or i64 %222, %226
  %228 = add nsw i32 %185, -8
  %229 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 8
  br label %243

230:                                              ; preds = %188, %230
  %231 = phi i32 [ %241, %230 ], [ 0, %188 ]
  %232 = phi i64 [ %240, %230 ], [ 0, %188 ]
  %233 = zext i32 %231 to i64
  %234 = getelementptr inbounds i8, i8 addrspace(4)* %184, i64 %233
  %235 = load i8, i8 addrspace(4)* %234, align 1, !tbaa !14
  %236 = zext i8 %235 to i64
  %237 = shl i32 %231, 3
  %238 = zext i32 %237 to i64
  %239 = shl nuw i64 %236, %238
  %240 = or i64 %239, %232
  %241 = add nuw nsw i32 %231, 1
  %242 = icmp eq i32 %241, %185
  br i1 %242, label %243, label %230

243:                                              ; preds = %230, %190, %188
  %244 = phi i8 addrspace(4)* [ %229, %190 ], [ %184, %188 ], [ %184, %230 ]
  %245 = phi i32 [ %228, %190 ], [ 0, %188 ], [ 0, %230 ]
  %246 = phi i64 [ %227, %190 ], [ 0, %188 ], [ %240, %230 ]
  %247 = icmp ugt i32 %245, 7
  br i1 %247, label %250, label %248

248:                                              ; preds = %243
  %249 = icmp eq i32 %245, 0
  br i1 %249, label %303, label %290

250:                                              ; preds = %243
  %251 = load i8, i8 addrspace(4)* %244, align 1, !tbaa !14
  %252 = zext i8 %251 to i64
  %253 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 1
  %254 = load i8, i8 addrspace(4)* %253, align 1, !tbaa !14
  %255 = zext i8 %254 to i64
  %256 = shl nuw nsw i64 %255, 8
  %257 = or i64 %256, %252
  %258 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 2
  %259 = load i8, i8 addrspace(4)* %258, align 1, !tbaa !14
  %260 = zext i8 %259 to i64
  %261 = shl nuw nsw i64 %260, 16
  %262 = or i64 %257, %261
  %263 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 3
  %264 = load i8, i8 addrspace(4)* %263, align 1, !tbaa !14
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 24
  %267 = or i64 %262, %266
  %268 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 4
  %269 = load i8, i8 addrspace(4)* %268, align 1, !tbaa !14
  %270 = zext i8 %269 to i64
  %271 = shl nuw nsw i64 %270, 32
  %272 = or i64 %267, %271
  %273 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 5
  %274 = load i8, i8 addrspace(4)* %273, align 1, !tbaa !14
  %275 = zext i8 %274 to i64
  %276 = shl nuw nsw i64 %275, 40
  %277 = or i64 %272, %276
  %278 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 6
  %279 = load i8, i8 addrspace(4)* %278, align 1, !tbaa !14
  %280 = zext i8 %279 to i64
  %281 = shl nuw nsw i64 %280, 48
  %282 = or i64 %277, %281
  %283 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 7
  %284 = load i8, i8 addrspace(4)* %283, align 1, !tbaa !14
  %285 = zext i8 %284 to i64
  %286 = shl nuw i64 %285, 56
  %287 = or i64 %282, %286
  %288 = add nsw i32 %245, -8
  %289 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 8
  br label %303

290:                                              ; preds = %248, %290
  %291 = phi i32 [ %301, %290 ], [ 0, %248 ]
  %292 = phi i64 [ %300, %290 ], [ 0, %248 ]
  %293 = zext i32 %291 to i64
  %294 = getelementptr inbounds i8, i8 addrspace(4)* %244, i64 %293
  %295 = load i8, i8 addrspace(4)* %294, align 1, !tbaa !14
  %296 = zext i8 %295 to i64
  %297 = shl i32 %291, 3
  %298 = zext i32 %297 to i64
  %299 = shl nuw i64 %296, %298
  %300 = or i64 %299, %292
  %301 = add nuw nsw i32 %291, 1
  %302 = icmp eq i32 %301, %245
  br i1 %302, label %303, label %290

303:                                              ; preds = %290, %250, %248
  %304 = phi i8 addrspace(4)* [ %289, %250 ], [ %244, %248 ], [ %244, %290 ]
  %305 = phi i32 [ %288, %250 ], [ 0, %248 ], [ 0, %290 ]
  %306 = phi i64 [ %287, %250 ], [ 0, %248 ], [ %300, %290 ]
  %307 = icmp ugt i32 %305, 7
  br i1 %307, label %310, label %308

308:                                              ; preds = %303
  %309 = icmp eq i32 %305, 0
  br i1 %309, label %363, label %350

310:                                              ; preds = %303
  %311 = load i8, i8 addrspace(4)* %304, align 1, !tbaa !14
  %312 = zext i8 %311 to i64
  %313 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 1
  %314 = load i8, i8 addrspace(4)* %313, align 1, !tbaa !14
  %315 = zext i8 %314 to i64
  %316 = shl nuw nsw i64 %315, 8
  %317 = or i64 %316, %312
  %318 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 2
  %319 = load i8, i8 addrspace(4)* %318, align 1, !tbaa !14
  %320 = zext i8 %319 to i64
  %321 = shl nuw nsw i64 %320, 16
  %322 = or i64 %317, %321
  %323 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 3
  %324 = load i8, i8 addrspace(4)* %323, align 1, !tbaa !14
  %325 = zext i8 %324 to i64
  %326 = shl nuw nsw i64 %325, 24
  %327 = or i64 %322, %326
  %328 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 4
  %329 = load i8, i8 addrspace(4)* %328, align 1, !tbaa !14
  %330 = zext i8 %329 to i64
  %331 = shl nuw nsw i64 %330, 32
  %332 = or i64 %327, %331
  %333 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 5
  %334 = load i8, i8 addrspace(4)* %333, align 1, !tbaa !14
  %335 = zext i8 %334 to i64
  %336 = shl nuw nsw i64 %335, 40
  %337 = or i64 %332, %336
  %338 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 6
  %339 = load i8, i8 addrspace(4)* %338, align 1, !tbaa !14
  %340 = zext i8 %339 to i64
  %341 = shl nuw nsw i64 %340, 48
  %342 = or i64 %337, %341
  %343 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 7
  %344 = load i8, i8 addrspace(4)* %343, align 1, !tbaa !14
  %345 = zext i8 %344 to i64
  %346 = shl nuw i64 %345, 56
  %347 = or i64 %342, %346
  %348 = add nsw i32 %305, -8
  %349 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 8
  br label %363

350:                                              ; preds = %308, %350
  %351 = phi i32 [ %361, %350 ], [ 0, %308 ]
  %352 = phi i64 [ %360, %350 ], [ 0, %308 ]
  %353 = zext i32 %351 to i64
  %354 = getelementptr inbounds i8, i8 addrspace(4)* %304, i64 %353
  %355 = load i8, i8 addrspace(4)* %354, align 1, !tbaa !14
  %356 = zext i8 %355 to i64
  %357 = shl i32 %351, 3
  %358 = zext i32 %357 to i64
  %359 = shl nuw i64 %356, %358
  %360 = or i64 %359, %352
  %361 = add nuw nsw i32 %351, 1
  %362 = icmp eq i32 %361, %305
  br i1 %362, label %363, label %350

363:                                              ; preds = %350, %310, %308
  %364 = phi i8 addrspace(4)* [ %349, %310 ], [ %304, %308 ], [ %304, %350 ]
  %365 = phi i32 [ %348, %310 ], [ 0, %308 ], [ 0, %350 ]
  %366 = phi i64 [ %347, %310 ], [ 0, %308 ], [ %360, %350 ]
  %367 = icmp ugt i32 %365, 7
  br i1 %367, label %370, label %368

368:                                              ; preds = %363
  %369 = icmp eq i32 %365, 0
  br i1 %369, label %423, label %410

370:                                              ; preds = %363
  %371 = load i8, i8 addrspace(4)* %364, align 1, !tbaa !14
  %372 = zext i8 %371 to i64
  %373 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 1
  %374 = load i8, i8 addrspace(4)* %373, align 1, !tbaa !14
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 8
  %377 = or i64 %376, %372
  %378 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 2
  %379 = load i8, i8 addrspace(4)* %378, align 1, !tbaa !14
  %380 = zext i8 %379 to i64
  %381 = shl nuw nsw i64 %380, 16
  %382 = or i64 %377, %381
  %383 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 3
  %384 = load i8, i8 addrspace(4)* %383, align 1, !tbaa !14
  %385 = zext i8 %384 to i64
  %386 = shl nuw nsw i64 %385, 24
  %387 = or i64 %382, %386
  %388 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 4
  %389 = load i8, i8 addrspace(4)* %388, align 1, !tbaa !14
  %390 = zext i8 %389 to i64
  %391 = shl nuw nsw i64 %390, 32
  %392 = or i64 %387, %391
  %393 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 5
  %394 = load i8, i8 addrspace(4)* %393, align 1, !tbaa !14
  %395 = zext i8 %394 to i64
  %396 = shl nuw nsw i64 %395, 40
  %397 = or i64 %392, %396
  %398 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 6
  %399 = load i8, i8 addrspace(4)* %398, align 1, !tbaa !14
  %400 = zext i8 %399 to i64
  %401 = shl nuw nsw i64 %400, 48
  %402 = or i64 %397, %401
  %403 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 7
  %404 = load i8, i8 addrspace(4)* %403, align 1, !tbaa !14
  %405 = zext i8 %404 to i64
  %406 = shl nuw i64 %405, 56
  %407 = or i64 %402, %406
  %408 = add nsw i32 %365, -8
  %409 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 8
  br label %423

410:                                              ; preds = %368, %410
  %411 = phi i32 [ %421, %410 ], [ 0, %368 ]
  %412 = phi i64 [ %420, %410 ], [ 0, %368 ]
  %413 = zext i32 %411 to i64
  %414 = getelementptr inbounds i8, i8 addrspace(4)* %364, i64 %413
  %415 = load i8, i8 addrspace(4)* %414, align 1, !tbaa !14
  %416 = zext i8 %415 to i64
  %417 = shl i32 %411, 3
  %418 = zext i32 %417 to i64
  %419 = shl nuw i64 %416, %418
  %420 = or i64 %419, %412
  %421 = add nuw nsw i32 %411, 1
  %422 = icmp eq i32 %421, %365
  br i1 %422, label %423, label %410

423:                                              ; preds = %410, %370, %368
  %424 = phi i8 addrspace(4)* [ %409, %370 ], [ %364, %368 ], [ %364, %410 ]
  %425 = phi i32 [ %408, %370 ], [ 0, %368 ], [ 0, %410 ]
  %426 = phi i64 [ %407, %370 ], [ 0, %368 ], [ %420, %410 ]
  %427 = icmp ugt i32 %425, 7
  br i1 %427, label %430, label %428

428:                                              ; preds = %423
  %429 = icmp eq i32 %425, 0
  br i1 %429, label %481, label %468

430:                                              ; preds = %423
  %431 = load i8, i8 addrspace(4)* %424, align 1, !tbaa !14
  %432 = zext i8 %431 to i64
  %433 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 1
  %434 = load i8, i8 addrspace(4)* %433, align 1, !tbaa !14
  %435 = zext i8 %434 to i64
  %436 = shl nuw nsw i64 %435, 8
  %437 = or i64 %436, %432
  %438 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 2
  %439 = load i8, i8 addrspace(4)* %438, align 1, !tbaa !14
  %440 = zext i8 %439 to i64
  %441 = shl nuw nsw i64 %440, 16
  %442 = or i64 %437, %441
  %443 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 3
  %444 = load i8, i8 addrspace(4)* %443, align 1, !tbaa !14
  %445 = zext i8 %444 to i64
  %446 = shl nuw nsw i64 %445, 24
  %447 = or i64 %442, %446
  %448 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 4
  %449 = load i8, i8 addrspace(4)* %448, align 1, !tbaa !14
  %450 = zext i8 %449 to i64
  %451 = shl nuw nsw i64 %450, 32
  %452 = or i64 %447, %451
  %453 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 5
  %454 = load i8, i8 addrspace(4)* %453, align 1, !tbaa !14
  %455 = zext i8 %454 to i64
  %456 = shl nuw nsw i64 %455, 40
  %457 = or i64 %452, %456
  %458 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 6
  %459 = load i8, i8 addrspace(4)* %458, align 1, !tbaa !14
  %460 = zext i8 %459 to i64
  %461 = shl nuw nsw i64 %460, 48
  %462 = or i64 %457, %461
  %463 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 7
  %464 = load i8, i8 addrspace(4)* %463, align 1, !tbaa !14
  %465 = zext i8 %464 to i64
  %466 = shl nuw i64 %465, 56
  %467 = or i64 %462, %466
  br label %481

468:                                              ; preds = %428, %468
  %469 = phi i32 [ %479, %468 ], [ 0, %428 ]
  %470 = phi i64 [ %478, %468 ], [ 0, %428 ]
  %471 = zext i32 %469 to i64
  %472 = getelementptr inbounds i8, i8 addrspace(4)* %424, i64 %471
  %473 = load i8, i8 addrspace(4)* %472, align 1, !tbaa !14
  %474 = zext i8 %473 to i64
  %475 = shl i32 %469, 3
  %476 = zext i32 %475 to i64
  %477 = shl nuw i64 %474, %476
  %478 = or i64 %477, %470
  %479 = add nuw nsw i32 %469, 1
  %480 = icmp eq i32 %479, %425
  br i1 %480, label %481, label %468

481:                                              ; preds = %468, %430, %428
  %482 = phi i64 [ %467, %430 ], [ 0, %428 ], [ %478, %468 ]
  %483 = shl nuw nsw i64 %64, 2
  %484 = add nuw nsw i64 %483, 28
  %485 = and i64 %484, 480
  %486 = and i64 %66, -225
  %487 = or i64 %486, %485
  %488 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %487, i64 noundef %126, i64 noundef %186, i64 noundef %246, i64 noundef %306, i64 noundef %366, i64 noundef %426, i64 noundef %482) #12
  %489 = sub i64 %56, %64
  %490 = getelementptr inbounds i8, i8 addrspace(4)* %57, i64 %64
  %491 = icmp eq i64 %489, 0
  br i1 %491, label %492, label %55

492:                                              ; preds = %481, %47
  %493 = phi <2 x i64> [ %50, %47 ], [ %488, %481 ]
  %494 = extractelement <2 x i64> %493, i64 0
  %495 = bitcast double %34 to i64
  %496 = and i64 %494, -225
  %497 = or i64 %496, 32
  %498 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %497, i64 noundef %495, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  %499 = extractelement <2 x i64> %498, i64 0
  %500 = bitcast double %38 to i64
  %501 = and i64 %499, -227
  %502 = or i64 %501, 34
  %503 = tail call fastcc <2 x i64> @__ockl_hostcall_internal(i8* noundef %44, i64 noundef %502, i64 noundef %500, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0, i64 noundef 0) #12
  br label %504

504:                                              ; preds = %6, %492
  %505 = fdiv contract double %34, 4.000000e-03
  %506 = fmul contract double %505, 2.560000e+02
  %507 = fptosi double %506 to i32
  %508 = tail call i32 @llvm.smin.i32(i32 %507, i32 255)
  %509 = tail call i32 @llvm.smax.i32(i32 %508, i32 0)
  %510 = zext i32 %509 to i64
  %511 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %510
  %512 = shl nsw i32 %25, 2
  %513 = bitcast %struct.HIP_vector_type addrspace(1)* %511 to i8 addrspace(1)*
  %514 = fcmp contract oeq float %33, 0.000000e+00
  %515 = fcmp contract olt float %33, 0.000000e+00
  %516 = sext i32 %512 to i64
  %517 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %516
  %518 = bitcast %struct.HIP_vector_type addrspace(1)* %517 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %518, i8 addrspace(1)* noundef align 4 dereferenceable(12) %513, i64 12, i1 false)
  br i1 %514, label %519, label %523

519:                                              ; preds = %504
  %520 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %517, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %520, align 4
  %521 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %516, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FE3333340000000, float addrspace(1)* %521, align 4
  %522 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %516, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FC99999A0000000, float addrspace(1)* %522, align 4
  br label %523

523:                                              ; preds = %519, %504
  br i1 %515, label %524, label %528

524:                                              ; preds = %523
  %525 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %517, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %525, align 4
  %526 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %516, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FD3333340000000, float addrspace(1)* %526, align 4
  %527 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %516, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FE6666660000000, float addrspace(1)* %527, align 4
  br label %528

528:                                              ; preds = %523, %524
  %529 = add nuw nsw i32 %512, 1
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530
  %532 = bitcast %struct.HIP_vector_type addrspace(1)* %531 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %532, i8 addrspace(1)* noundef align 4 dereferenceable(12) %513, i64 12, i1 false)
  br i1 %514, label %533, label %537

533:                                              ; preds = %528
  %534 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %531, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %534, align 4
  %535 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FE3333340000000, float addrspace(1)* %535, align 4
  %536 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FC99999A0000000, float addrspace(1)* %536, align 4
  br label %537

537:                                              ; preds = %533, %528
  br i1 %515, label %538, label %542

538:                                              ; preds = %537
  %539 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %531, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %539, align 4
  %540 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FD3333340000000, float addrspace(1)* %540, align 4
  %541 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %530, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FE6666660000000, float addrspace(1)* %541, align 4
  br label %542

542:                                              ; preds = %538, %537
  %543 = add nuw nsw i32 %512, 2
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %544
  %546 = bitcast %struct.HIP_vector_type addrspace(1)* %545 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %546, i8 addrspace(1)* noundef align 4 dereferenceable(12) %513, i64 12, i1 false)
  br i1 %514, label %547, label %551

547:                                              ; preds = %542
  %548 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %545, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %548, align 4
  %549 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %544, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FE3333340000000, float addrspace(1)* %549, align 4
  %550 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %544, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FC99999A0000000, float addrspace(1)* %550, align 4
  br label %551

551:                                              ; preds = %547, %542
  br i1 %515, label %552, label %556

552:                                              ; preds = %551
  %553 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %545, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %553, align 4
  %554 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %544, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FD3333340000000, float addrspace(1)* %554, align 4
  %555 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %544, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FE6666660000000, float addrspace(1)* %555, align 4
  br label %556

556:                                              ; preds = %552, %551
  %557 = add nuw nsw i32 %512, 3
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %558
  %560 = bitcast %struct.HIP_vector_type addrspace(1)* %559 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 4 dereferenceable(12) %560, i8 addrspace(1)* noundef align 4 dereferenceable(12) %513, i64 12, i1 false)
  br i1 %514, label %561, label %565

561:                                              ; preds = %556
  %562 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %559, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %562, align 4
  %563 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %558, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FE3333340000000, float addrspace(1)* %563, align 4
  %564 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %558, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FC99999A0000000, float addrspace(1)* %564, align 4
  br label %565

565:                                              ; preds = %561, %556
  br i1 %515, label %566, label %570

566:                                              ; preds = %565
  %567 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %559, i64 0, i32 0, i32 0, i32 0, i32 0, i64 0
  store float 0.000000e+00, float addrspace(1)* %567, align 4
  %568 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %558, i32 0, i32 0, i32 0, i32 0, i64 1
  store float 0x3FD3333340000000, float addrspace(1)* %568, align 4
  %569 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %558, i32 0, i32 0, i32 0, i32 0, i64 2
  store float 0x3FE6666660000000, float addrspace(1)* %569, align 4
  br label %570

570:                                              ; preds = %566, %565
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

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
  store i8* %0, i8* addrspace(5)* %10, align 8, !tbaa !17
  store i32 2, i32 addrspace(5)* %11, align 4, !tbaa !19
  store i64 %1, i64 addrspace(5)* %12, align 8, !tbaa !10
  store i64 %2, i64 addrspace(5)* %13, align 8, !tbaa !10
  store i64 %3, i64 addrspace(5)* %14, align 8, !tbaa !10
  store i64 %4, i64 addrspace(5)* %15, align 8, !tbaa !10
  store i64 %5, i64 addrspace(5)* %16, align 8, !tbaa !10
  store i64 %6, i64 addrspace(5)* %17, align 8, !tbaa !10
  store i64 %7, i64 addrspace(5)* %18, align 8, !tbaa !10
  store i64 %8, i64 addrspace(5)* %19, align 8, !tbaa !10
  %27 = bitcast i32 addrspace(5)* %20 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %27) #6
  %28 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0)
  %29 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %28)
  store i32 %29, i32 addrspace(5)* %20, align 4, !tbaa !19
  %30 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %31 = call i32 asm sideeffect "; ockl readfirstlane hoisting hack $0", "=v,0"(i32 %30) #12, !srcloc !21
  store i32 %31, i32 addrspace(5)* %20, align 4, !tbaa !19
  %32 = bitcast i32 addrspace(5)* %21 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 4, i8 addrspace(5)* %32) #6
  %33 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %34 = call i32 @llvm.amdgcn.readfirstlane(i32 %33)
  store i32 %34, i32 addrspace(5)* %21, align 4, !tbaa !19
  %35 = bitcast %0 addrspace(1)* addrspace(5)* %22 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %35) #6
  %36 = load i8*, i8* addrspace(5)* %10, align 8, !tbaa !17
  %37 = addrspacecast i8* %36 to %0 addrspace(1)*
  store %0 addrspace(1)* %37, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %38 = bitcast i64 addrspace(5)* %23 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %38) #6
  %39 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %40 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %41 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %68

43:                                               ; preds = %9
  %44 = getelementptr inbounds %0, %0 addrspace(1)* %39, i64 0, i32 3
  %45 = load atomic i64, i64 addrspace(1)* %44 syncscope("one-as") acquire, align 8
  %46 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 0
  %47 = getelementptr %0, %0 addrspace(1)* %39, i64 0, i32 5
  %48 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
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
  %58 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %46, align 8, !tbaa !22
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
  store i64 %78, i64 addrspace(5)* %23, align 8, !tbaa !10
  %79 = bitcast %1 addrspace(1)* addrspace(5)* %24 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %79) #6
  %80 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %81 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %82 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 0
  %83 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %82, align 8, !tbaa !22
  %84 = getelementptr %0, %0 addrspace(1)* %80, i64 0, i32 5
  %85 = load i64, i64 addrspace(1)* %84, align 8, !tbaa !25
  %86 = and i64 %81, %85
  %87 = getelementptr inbounds %1, %1 addrspace(1)* %83, i64 %86
  store %1 addrspace(1)* %87, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %88 = bitcast %2 addrspace(1)* addrspace(5)* %25 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 8, i8 addrspace(5)* %88) #6
  %89 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %90 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %91 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 1
  %92 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(1)* %91, align 8, !tbaa !26
  %93 = getelementptr %0, %0 addrspace(1)* %89, i64 0, i32 5
  %94 = load i64, i64 addrspace(1)* %93, align 8, !tbaa !25
  %95 = and i64 %90, %94
  %96 = getelementptr inbounds %2, %2 addrspace(1)* %92, i64 %95
  store %2 addrspace(1)* %96, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %97 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %98 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %99 = load i32, i32 addrspace(5)* %11, align 4, !tbaa !19
  %100 = load i64, i64 addrspace(5)* %12, align 8, !tbaa !10
  %101 = load i64, i64 addrspace(5)* %13, align 8, !tbaa !10
  %102 = load i64, i64 addrspace(5)* %14, align 8, !tbaa !10
  %103 = load i64, i64 addrspace(5)* %15, align 8, !tbaa !10
  %104 = load i64, i64 addrspace(5)* %16, align 8, !tbaa !10
  %105 = load i64, i64 addrspace(5)* %17, align 8, !tbaa !10
  %106 = load i64, i64 addrspace(5)* %18, align 8, !tbaa !10
  %107 = load i64, i64 addrspace(5)* %19, align 8, !tbaa !10
  %108 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %109 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %110 = call i64 @llvm.read_register.i64(metadata !27) #13
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
  store i64 %100, i64 addrspace(1)* %118, align 8, !tbaa !10
  %119 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 1
  store i64 %101, i64 addrspace(1)* %119, align 8, !tbaa !10
  %120 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 2
  store i64 %102, i64 addrspace(1)* %120, align 8, !tbaa !10
  %121 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 3
  store i64 %103, i64 addrspace(1)* %121, align 8, !tbaa !10
  %122 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 4
  store i64 %104, i64 addrspace(1)* %122, align 8, !tbaa !10
  %123 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 5
  store i64 %105, i64 addrspace(1)* %123, align 8, !tbaa !10
  %124 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 6
  store i64 %106, i64 addrspace(1)* %124, align 8, !tbaa !10
  %125 = getelementptr inbounds %2, %2 addrspace(1)* %98, i64 0, i32 0, i64 %117, i64 7
  store i64 %107, i64 addrspace(1)* %125, align 8, !tbaa !10
  %126 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %127 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %128 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %129 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
  %130 = icmp eq i32 %128, %129
  br i1 %130, label %131, label %163

131:                                              ; preds = %116
  %132 = getelementptr inbounds %0, %0 addrspace(1)* %126, i64 0, i32 4
  %133 = load atomic i64, i64 addrspace(1)* %132 syncscope("one-as") monotonic, align 8
  %134 = getelementptr %0, %0 addrspace(1)* %126, i64 0, i32 0
  %135 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %134, align 8, !tbaa !22
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
  %165 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(5)* %24, align 8, !tbaa !17
  %166 = load %2 addrspace(1)*, %2 addrspace(1)* addrspace(5)* %25, align 8, !tbaa !17
  %167 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %168 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
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
  %184 = load i64, i64 addrspace(1)* %182, align 8, !tbaa !10
  %185 = load i64, i64 addrspace(1)* %183, align 8, !tbaa !10
  %186 = insertelement <2 x i64> undef, i64 %184, i64 0
  %187 = insertelement <2 x i64> %186, i64 %185, i64 1
  store <2 x i64> %187, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
  %188 = load %0 addrspace(1)*, %0 addrspace(1)* addrspace(5)* %22, align 8, !tbaa !17
  %189 = load i64, i64 addrspace(5)* %23, align 8, !tbaa !10
  %190 = load i32, i32 addrspace(5)* %20, align 4, !tbaa !19
  %191 = load i32, i32 addrspace(5)* %21, align 4, !tbaa !19
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
  %203 = load %1 addrspace(1)*, %1 addrspace(1)* addrspace(1)* %202, align 8, !tbaa !22
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
  %214 = load <2 x i64>, <2 x i64> addrspace(5)* %26, align 16, !tbaa !14
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #10

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #10

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #11

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
attributes #10 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { argmemonly nocallback nofree nounwind willreturn }
attributes #12 = { convergent nounwind }
attributes #13 = { convergent }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"long", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !{!12, !12, i64 0}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !12, i64 0}
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !12, i64 0}
!21 = !{i64 2662}
!22 = !{!23, !18, i64 0}
!23 = !{!"", !18, i64 0, !18, i64 8, !24, i64 16, !11, i64 24, !11, i64 32, !11, i64 40}
!24 = !{!"hsa_signal_s", !11, i64 0}
!25 = !{!23, !11, i64 40}
!26 = !{!23, !18, i64 8}
!27 = !{!"exec"}
!28 = !{!29, !20, i64 16}
!29 = !{!"", !11, i64 0, !11, i64 8, !20, i64 16, !20, i64 20}
!30 = !{!29, !11, i64 8}
!31 = !{!29, !20, i64 20}
!32 = !{!29, !11, i64 0}
!33 = !{!34, !11, i64 16}
!34 = !{!"amd_signal_s", !11, i64 0, !12, i64 8, !11, i64 16, !20, i64 24, !20, i64 28, !11, i64 32, !11, i64 40, !12, i64 48, !12, i64 56}
!35 = !{!34, !20, i64 24}
