; ModuleID = '../data/hip_kernels/5146/4/main.cu'
source_filename = "../data/hip_kernels/5146/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" }
%"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" = type { [3 x i8] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4blurP15HIP_vector_typeIhLj3EES1_ii(%struct.HIP_vector_type addrspace(1)* nocapture readonly %0, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %22, %13
  %24 = icmp slt i32 %13, %2
  br i1 %24, label %25, label %324

25:                                               ; preds = %4
  %26 = icmp slt i32 %21, %3
  %27 = icmp sgt i32 %13, 3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %324

29:                                               ; preds = %25
  %30 = add nsw i32 %2, -3
  %31 = icmp slt i32 %13, %30
  %32 = icmp sgt i32 %21, 3
  %33 = select i1 %31, i1 %32, i1 false
  %34 = add nsw i32 %3, -3
  %35 = icmp slt i32 %21, %34
  %36 = select i1 %33, i1 %35, i1 false
  br i1 %36, label %37, label %324

37:                                               ; preds = %29
  %38 = add nsw i32 %21, -3
  %39 = add nsw i32 %13, -3
  %40 = sext i32 %23 to i64
  %41 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %40, i32 0, i32 0, i32 0, i32 0, i64 0
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %40, i32 0, i32 0, i32 0, i32 0, i64 1
  %43 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %40, i32 0, i32 0, i32 0, i32 0, i64 2
  %44 = mul nsw i32 %38, %2
  %45 = add i32 %39, %44
  %46 = add i32 %45, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %47, i32 0, i32 0, i32 0, i32 0, i64 0
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7
  %50 = zext i8 %49 to i32
  %51 = add i32 %13, %44
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %52, i32 0, i32 0, i32 0, i32 0, i64 0
  %54 = load i8, i8 addrspace(1)* %53, align 1, !tbaa !7
  %55 = zext i8 %54 to i32
  %56 = shl nuw nsw i32 %55, 1
  %57 = add nuw nsw i32 %56, %50
  %58 = add i32 %45, 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %59, i32 0, i32 0, i32 0, i32 0, i64 0
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = zext i8 %61 to i32
  %63 = add nuw nsw i32 %57, %62
  %64 = lshr i32 %63, 2
  %65 = trunc i32 %64 to i8
  store i8 %65, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %65, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %65, i8 addrspace(1)* %43, align 1, !tbaa !7
  %66 = add nsw i32 %21, -2
  %67 = mul nsw i32 %66, %2
  %68 = add i32 %39, %67
  %69 = add i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %70, i32 0, i32 0, i32 0, i32 0, i64 0
  %72 = load i8, i8 addrspace(1)* %71, align 1, !tbaa !7
  %73 = zext i8 %72 to i32
  %74 = mul nuw nsw i32 %73, 3
  %75 = add nuw nsw i32 %74, %63
  %76 = add i32 %68, 2
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %77, i32 0, i32 0, i32 0, i32 0, i64 0
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !7
  %80 = zext i8 %79 to i32
  %81 = mul nuw nsw i32 %80, 3
  %82 = add nuw nsw i32 %81, %75
  %83 = add i32 %13, %67
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %84, i32 0, i32 0, i32 0, i32 0, i64 0
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !7
  %87 = zext i8 %86 to i32
  %88 = mul nuw nsw i32 %87, 22
  %89 = add nuw nsw i32 %88, %82
  %90 = add i32 %68, 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %91, i32 0, i32 0, i32 0, i32 0, i64 0
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !7
  %94 = zext i8 %93 to i32
  %95 = mul nuw nsw i32 %94, 3
  %96 = add nuw nsw i32 %95, %89
  %97 = add i32 %68, 5
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %98, i32 0, i32 0, i32 0, i32 0, i64 0
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !7
  %101 = zext i8 %100 to i32
  %102 = mul nuw nsw i32 %101, 3
  %103 = add nuw nsw i32 %102, %96
  %104 = trunc i32 %103 to i16
  %105 = udiv i16 %104, 38
  %106 = trunc i16 %105 to i8
  store i8 %106, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %106, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %106, i8 addrspace(1)* %43, align 1, !tbaa !7
  %107 = add nsw i32 %21, -1
  %108 = mul nsw i32 %107, %2
  %109 = add i32 %39, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %110, i32 0, i32 0, i32 0, i32 0, i64 0
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !7
  %113 = zext i8 %112 to i32
  %114 = add nuw nsw i32 %103, %113
  %115 = add i32 %109, 1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %116, i32 0, i32 0, i32 0, i32 0, i64 0
  %118 = load i8, i8 addrspace(1)* %117, align 1, !tbaa !7
  %119 = zext i8 %118 to i32
  %120 = mul nuw nsw i32 %119, 13
  %121 = add nuw nsw i32 %120, %114
  %122 = add i32 %109, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %123, i32 0, i32 0, i32 0, i32 0, i64 0
  %125 = load i8, i8 addrspace(1)* %124, align 1, !tbaa !7
  %126 = zext i8 %125 to i32
  %127 = mul nuw nsw i32 %126, 59
  %128 = add nuw nsw i32 %127, %121
  %129 = add i32 %13, %108
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %130, i32 0, i32 0, i32 0, i32 0, i64 0
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !7
  %133 = zext i8 %132 to i32
  %134 = mul nuw nsw i32 %133, 97
  %135 = add nuw nsw i32 %134, %128
  %136 = add i32 %109, 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %137, i32 0, i32 0, i32 0, i32 0, i64 0
  %139 = load i8, i8 addrspace(1)* %138, align 1, !tbaa !7
  %140 = zext i8 %139 to i32
  %141 = mul nuw nsw i32 %140, 59
  %142 = add nuw nsw i32 %141, %135
  %143 = add i32 %109, 5
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %144, i32 0, i32 0, i32 0, i32 0, i64 0
  %146 = load i8, i8 addrspace(1)* %145, align 1, !tbaa !7
  %147 = zext i8 %146 to i32
  %148 = mul nuw nsw i32 %147, 13
  %149 = add nuw nsw i32 %148, %142
  %150 = add i32 %109, 6
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %151, i32 0, i32 0, i32 0, i32 0, i64 0
  %153 = load i8, i8 addrspace(1)* %152, align 1, !tbaa !7
  %154 = zext i8 %153 to i32
  %155 = add nuw nsw i32 %149, %154
  %156 = udiv i32 %155, 281
  %157 = trunc i32 %156 to i8
  store i8 %157, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %157, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %157, i8 addrspace(1)* %43, align 1, !tbaa !7
  %158 = add i32 %39, %22
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %159, i32 0, i32 0, i32 0, i32 0, i64 0
  %161 = load i8, i8 addrspace(1)* %160, align 1, !tbaa !7
  %162 = zext i8 %161 to i32
  %163 = shl nuw nsw i32 %162, 1
  %164 = add nuw nsw i32 %163, %155
  %165 = add i32 %158, 1
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %166, i32 0, i32 0, i32 0, i32 0, i64 0
  %168 = load i8, i8 addrspace(1)* %167, align 1, !tbaa !7
  %169 = zext i8 %168 to i32
  %170 = mul nuw nsw i32 %169, 22
  %171 = add nuw nsw i32 %170, %164
  %172 = add i32 %158, 2
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %173, i32 0, i32 0, i32 0, i32 0, i64 0
  %175 = load i8, i8 addrspace(1)* %174, align 1, !tbaa !7
  %176 = zext i8 %175 to i32
  %177 = mul nuw nsw i32 %176, 97
  %178 = add nuw nsw i32 %177, %171
  %179 = add i32 %13, %22
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %180, i32 0, i32 0, i32 0, i32 0, i64 0
  %182 = load i8, i8 addrspace(1)* %181, align 1, !tbaa !7
  %183 = zext i8 %182 to i32
  %184 = mul nuw nsw i32 %183, 159
  %185 = add nuw nsw i32 %184, %178
  %186 = add i32 %158, 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %187, i32 0, i32 0, i32 0, i32 0, i64 0
  %189 = load i8, i8 addrspace(1)* %188, align 1, !tbaa !7
  %190 = zext i8 %189 to i32
  %191 = mul nuw nsw i32 %190, 97
  %192 = add nuw nsw i32 %191, %185
  %193 = add i32 %158, 5
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %194, i32 0, i32 0, i32 0, i32 0, i64 0
  %196 = load i8, i8 addrspace(1)* %195, align 1, !tbaa !7
  %197 = zext i8 %196 to i32
  %198 = mul nuw nsw i32 %197, 22
  %199 = add nuw nsw i32 %198, %192
  %200 = add i32 %158, 6
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %201, i32 0, i32 0, i32 0, i32 0, i64 0
  %203 = load i8, i8 addrspace(1)* %202, align 1, !tbaa !7
  %204 = zext i8 %203 to i32
  %205 = shl nuw nsw i32 %204, 1
  %206 = add nuw nsw i32 %205, %199
  %207 = udiv i32 %206, 682
  %208 = trunc i32 %207 to i8
  store i8 %208, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %208, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %208, i8 addrspace(1)* %43, align 1, !tbaa !7
  %209 = add nuw nsw i32 %21, 1
  %210 = mul nsw i32 %209, %2
  %211 = add i32 %39, %210
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %212, i32 0, i32 0, i32 0, i32 0, i64 0
  %214 = load i8, i8 addrspace(1)* %213, align 1, !tbaa !7
  %215 = zext i8 %214 to i32
  %216 = add nuw nsw i32 %206, %215
  %217 = add i32 %211, 1
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %218, i32 0, i32 0, i32 0, i32 0, i64 0
  %220 = load i8, i8 addrspace(1)* %219, align 1, !tbaa !7
  %221 = zext i8 %220 to i32
  %222 = mul nuw nsw i32 %221, 13
  %223 = add nuw nsw i32 %222, %216
  %224 = add i32 %211, 2
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %225, i32 0, i32 0, i32 0, i32 0, i64 0
  %227 = load i8, i8 addrspace(1)* %226, align 1, !tbaa !7
  %228 = zext i8 %227 to i32
  %229 = mul nuw nsw i32 %228, 59
  %230 = add nuw nsw i32 %229, %223
  %231 = add i32 %13, %210
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %232, i32 0, i32 0, i32 0, i32 0, i64 0
  %234 = load i8, i8 addrspace(1)* %233, align 1, !tbaa !7
  %235 = zext i8 %234 to i32
  %236 = mul nuw nsw i32 %235, 97
  %237 = add nuw nsw i32 %236, %230
  %238 = add i32 %211, 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %239, i32 0, i32 0, i32 0, i32 0, i64 0
  %241 = load i8, i8 addrspace(1)* %240, align 1, !tbaa !7
  %242 = zext i8 %241 to i32
  %243 = mul nuw nsw i32 %242, 59
  %244 = add nuw nsw i32 %243, %237
  %245 = add i32 %211, 5
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %246, i32 0, i32 0, i32 0, i32 0, i64 0
  %248 = load i8, i8 addrspace(1)* %247, align 1, !tbaa !7
  %249 = zext i8 %248 to i32
  %250 = mul nuw nsw i32 %249, 13
  %251 = add nuw nsw i32 %250, %244
  %252 = add i32 %211, 6
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %253, i32 0, i32 0, i32 0, i32 0, i64 0
  %255 = load i8, i8 addrspace(1)* %254, align 1, !tbaa !7
  %256 = zext i8 %255 to i32
  %257 = add nuw nsw i32 %251, %256
  %258 = udiv i32 %257, 925
  %259 = trunc i32 %258 to i8
  store i8 %259, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %259, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %259, i8 addrspace(1)* %43, align 1, !tbaa !7
  %260 = add nuw nsw i32 %21, 2
  %261 = mul nsw i32 %260, %2
  %262 = add i32 %39, %261
  %263 = add i32 %262, 1
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %264, i32 0, i32 0, i32 0, i32 0, i64 0
  %266 = load i8, i8 addrspace(1)* %265, align 1, !tbaa !7
  %267 = zext i8 %266 to i32
  %268 = mul nuw nsw i32 %267, 3
  %269 = add nuw nsw i32 %268, %257
  %270 = add i32 %262, 2
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %271, i32 0, i32 0, i32 0, i32 0, i64 0
  %273 = load i8, i8 addrspace(1)* %272, align 1, !tbaa !7
  %274 = zext i8 %273 to i32
  %275 = mul nuw nsw i32 %274, 13
  %276 = add nuw nsw i32 %275, %269
  %277 = add i32 %13, %261
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %278, i32 0, i32 0, i32 0, i32 0, i64 0
  %280 = load i8, i8 addrspace(1)* %279, align 1, !tbaa !7
  %281 = zext i8 %280 to i32
  %282 = mul nuw nsw i32 %281, 22
  %283 = add nuw nsw i32 %282, %276
  %284 = add i32 %262, 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %285, i32 0, i32 0, i32 0, i32 0, i64 0
  %287 = load i8, i8 addrspace(1)* %286, align 1, !tbaa !7
  %288 = zext i8 %287 to i32
  %289 = mul nuw nsw i32 %288, 3
  %290 = add nuw nsw i32 %289, %283
  %291 = add i32 %262, 5
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %292, i32 0, i32 0, i32 0, i32 0, i64 0
  %294 = load i8, i8 addrspace(1)* %293, align 1, !tbaa !7
  %295 = zext i8 %294 to i32
  %296 = mul nuw nsw i32 %295, 3
  %297 = add nuw nsw i32 %296, %290
  %298 = udiv i32 %297, 969
  %299 = trunc i32 %298 to i8
  store i8 %299, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %299, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %299, i8 addrspace(1)* %43, align 1, !tbaa !7
  %300 = add nuw nsw i32 %21, 3
  %301 = mul nsw i32 %300, %2
  %302 = add i32 %39, %301
  %303 = add i32 %302, 2
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %304, i32 0, i32 0, i32 0, i32 0, i64 0
  %306 = load i8, i8 addrspace(1)* %305, align 1, !tbaa !7
  %307 = zext i8 %306 to i32
  %308 = add nuw nsw i32 %297, %307
  %309 = add i32 %13, %301
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %310, i32 0, i32 0, i32 0, i32 0, i64 0
  %312 = load i8, i8 addrspace(1)* %311, align 1, !tbaa !7
  %313 = zext i8 %312 to i32
  %314 = shl nuw nsw i32 %313, 1
  %315 = add nuw nsw i32 %314, %308
  %316 = add i32 %302, 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %317, i32 0, i32 0, i32 0, i32 0, i64 0
  %319 = load i8, i8 addrspace(1)* %318, align 1, !tbaa !7
  %320 = zext i8 %319 to i32
  %321 = add nuw nsw i32 %315, %320
  %322 = udiv i32 %321, 973
  %323 = trunc i32 %322 to i8
  store i8 %323, i8 addrspace(1)* %41, align 1, !tbaa !7
  store i8 %323, i8 addrspace(1)* %42, align 1, !tbaa !7
  store i8 %323, i8 addrspace(1)* %43, align 1, !tbaa !7
  br label %324

324:                                              ; preds = %37, %25, %29, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
