; ModuleID = '../data/hip_kernels/831/10/main.cu'
source_filename = "../data/hip_kernels/831/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18sobelFilterShared3PhS_jjE9sharedMem = internal unnamed_addr addrspace(3) global [484 x i8] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18sobelFilterShared3PhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add nsw i32 %7, -3
  %9 = add i32 %8, %6
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = shl i32 %10, 4
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %13 = add nsw i32 %12, -3
  %14 = add i32 %13, %11
  %15 = tail call i32 @llvm.smax.i32(i32 %9, i32 3)
  %16 = add i32 %2, -4
  %17 = sitofp i32 %15 to double
  %18 = uitofp i32 %16 to double
  %19 = tail call double @llvm.minnum.f64(double %17, double %18)
  %20 = fptosi double %19 to i32
  %21 = tail call i32 @llvm.smax.i32(i32 %14, i32 3)
  %22 = add i32 %3, -4
  %23 = sitofp i32 %21 to double
  %24 = uitofp i32 %22 to double
  %25 = tail call double @llvm.minnum.f64(double %23, double %24)
  %26 = fptosi double %25 to i32
  %27 = mul i32 %26, %2
  %28 = add i32 %27, %20
  %29 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %30 = getelementptr i8, i8 addrspace(4)* %29, i64 6
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 2, !range !5, !invariant.load !6
  %33 = zext i16 %32 to i32
  %34 = mul nuw nsw i32 %12, %33
  %35 = add nuw nsw i32 %34, %7
  %36 = zext i32 %28 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %35
  store i8 %38, i8 addrspace(3)* %39, align 1, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp ult i32 %8, 16
  %41 = icmp ugt i32 %12, 2
  %42 = select i1 %40, i1 %41, i1 false
  %43 = icmp ult i32 %12, 19
  %44 = select i1 %42, i1 %43, i1 false
  br i1 %44, label %45, label %299

45:                                               ; preds = %4
  %46 = getelementptr i8, i8 addrspace(4)* %29, i64 4
  %47 = bitcast i8 addrspace(4)* %46 to i16 addrspace(4)*
  %48 = load i16, i16 addrspace(4)* %47, align 4, !range !5, !invariant.load !6
  %49 = zext i16 %48 to i32
  %50 = add nsw i32 %35, -3
  %51 = mul nsw i32 %49, -3
  %52 = add nsw i32 %50, %51
  %53 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %52
  %54 = load i8, i8 addrspace(3)* %53, align 1, !tbaa !7
  %55 = sext i8 %54 to i16
  %56 = add nsw i32 %35, -2
  %57 = add nsw i32 %56, %51
  %58 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %57
  %59 = load i8, i8 addrspace(3)* %58, align 1, !tbaa !7
  %60 = sext i8 %59 to i16
  %61 = add nsw i16 %55, %60
  %62 = add nsw i32 %35, -1
  %63 = add nsw i32 %62, %51
  %64 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %63
  %65 = load i8, i8 addrspace(3)* %64, align 1, !tbaa !7
  %66 = sext i8 %65 to i16
  %67 = add nsw i16 %61, %66
  %68 = add nsw i32 %35, %51
  %69 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %68
  %70 = load i8, i8 addrspace(3)* %69, align 1, !tbaa !7
  %71 = sext i8 %70 to i16
  %72 = add nsw i16 %67, %71
  %73 = add nuw nsw i32 %35, 1
  %74 = add nsw i32 %73, %51
  %75 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %74
  %76 = load i8, i8 addrspace(3)* %75, align 1, !tbaa !7
  %77 = sext i8 %76 to i16
  %78 = add nsw i16 %72, %77
  %79 = add nuw nsw i32 %35, 2
  %80 = add nsw i32 %79, %51
  %81 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %80
  %82 = load i8, i8 addrspace(3)* %81, align 1, !tbaa !7
  %83 = sext i8 %82 to i16
  %84 = add nsw i16 %78, %83
  %85 = add nuw nsw i32 %35, 3
  %86 = add nsw i32 %85, %51
  %87 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %86
  %88 = load i8, i8 addrspace(3)* %87, align 1, !tbaa !7
  %89 = sext i8 %88 to i16
  %90 = add nsw i16 %84, %89
  %91 = mul nsw i32 %49, -2
  %92 = add nsw i32 %50, %91
  %93 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %92
  %94 = load i8, i8 addrspace(3)* %93, align 1, !tbaa !7
  %95 = sext i8 %94 to i16
  %96 = add i16 %90, %95
  %97 = add nsw i32 %56, %91
  %98 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %97
  %99 = load i8, i8 addrspace(3)* %98, align 1, !tbaa !7
  %100 = sext i8 %99 to i16
  %101 = add i16 %96, %100
  %102 = add nsw i32 %62, %91
  %103 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %102
  %104 = load i8, i8 addrspace(3)* %103, align 1, !tbaa !7
  %105 = sext i8 %104 to i16
  %106 = add i16 %101, %105
  %107 = add nsw i32 %35, %91
  %108 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %107
  %109 = load i8, i8 addrspace(3)* %108, align 1, !tbaa !7
  %110 = sext i8 %109 to i16
  %111 = add i16 %106, %110
  %112 = add nsw i32 %73, %91
  %113 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %112
  %114 = load i8, i8 addrspace(3)* %113, align 1, !tbaa !7
  %115 = sext i8 %114 to i16
  %116 = add i16 %111, %115
  %117 = add nsw i32 %79, %91
  %118 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %117
  %119 = load i8, i8 addrspace(3)* %118, align 1, !tbaa !7
  %120 = sext i8 %119 to i16
  %121 = add i16 %116, %120
  %122 = add nsw i32 %85, %91
  %123 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %122
  %124 = load i8, i8 addrspace(3)* %123, align 1, !tbaa !7
  %125 = sext i8 %124 to i16
  %126 = add i16 %121, %125
  %127 = sub nsw i32 %50, %49
  %128 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %127
  %129 = load i8, i8 addrspace(3)* %128, align 1, !tbaa !7
  %130 = sext i8 %129 to i16
  %131 = add i16 %126, %130
  %132 = sub nsw i32 %56, %49
  %133 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %132
  %134 = load i8, i8 addrspace(3)* %133, align 1, !tbaa !7
  %135 = sext i8 %134 to i16
  %136 = add i16 %131, %135
  %137 = sub nsw i32 %62, %49
  %138 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %137
  %139 = load i8, i8 addrspace(3)* %138, align 1, !tbaa !7
  %140 = sext i8 %139 to i16
  %141 = add i16 %136, %140
  %142 = sub nsw i32 %35, %49
  %143 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %142
  %144 = load i8, i8 addrspace(3)* %143, align 1, !tbaa !7
  %145 = sext i8 %144 to i16
  %146 = add i16 %141, %145
  %147 = sub nsw i32 %73, %49
  %148 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %147
  %149 = load i8, i8 addrspace(3)* %148, align 1, !tbaa !7
  %150 = sext i8 %149 to i16
  %151 = add i16 %146, %150
  %152 = sub nsw i32 %79, %49
  %153 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %152
  %154 = load i8, i8 addrspace(3)* %153, align 1, !tbaa !7
  %155 = sext i8 %154 to i16
  %156 = add i16 %151, %155
  %157 = sub nsw i32 %85, %49
  %158 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %157
  %159 = load i8, i8 addrspace(3)* %158, align 1, !tbaa !7
  %160 = sext i8 %159 to i16
  %161 = add i16 %156, %160
  %162 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %50
  %163 = load i8, i8 addrspace(3)* %162, align 1, !tbaa !7
  %164 = sext i8 %163 to i16
  %165 = add i16 %161, %164
  %166 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %56
  %167 = load i8, i8 addrspace(3)* %166, align 1, !tbaa !7
  %168 = sext i8 %167 to i16
  %169 = add i16 %165, %168
  %170 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %62
  %171 = load i8, i8 addrspace(3)* %170, align 1, !tbaa !7
  %172 = sext i8 %171 to i16
  %173 = add i16 %169, %172
  %174 = load i8, i8 addrspace(3)* %39, align 1, !tbaa !7
  %175 = sext i8 %174 to i16
  %176 = add i16 %173, %175
  %177 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %73
  %178 = load i8, i8 addrspace(3)* %177, align 1, !tbaa !7
  %179 = sext i8 %178 to i16
  %180 = add i16 %176, %179
  %181 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %79
  %182 = load i8, i8 addrspace(3)* %181, align 1, !tbaa !7
  %183 = sext i8 %182 to i16
  %184 = add i16 %180, %183
  %185 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %85
  %186 = load i8, i8 addrspace(3)* %185, align 1, !tbaa !7
  %187 = sext i8 %186 to i16
  %188 = add i16 %184, %187
  %189 = add nsw i32 %50, %49
  %190 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %189
  %191 = load i8, i8 addrspace(3)* %190, align 1, !tbaa !7
  %192 = sext i8 %191 to i16
  %193 = add i16 %188, %192
  %194 = add nsw i32 %56, %49
  %195 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %194
  %196 = load i8, i8 addrspace(3)* %195, align 1, !tbaa !7
  %197 = sext i8 %196 to i16
  %198 = add i16 %193, %197
  %199 = add nsw i32 %62, %49
  %200 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %199
  %201 = load i8, i8 addrspace(3)* %200, align 1, !tbaa !7
  %202 = sext i8 %201 to i16
  %203 = add i16 %198, %202
  %204 = add nuw nsw i32 %35, %49
  %205 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %204
  %206 = load i8, i8 addrspace(3)* %205, align 1, !tbaa !7
  %207 = sext i8 %206 to i16
  %208 = add i16 %203, %207
  %209 = add nuw nsw i32 %73, %49
  %210 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %209
  %211 = load i8, i8 addrspace(3)* %210, align 1, !tbaa !7
  %212 = sext i8 %211 to i16
  %213 = add i16 %208, %212
  %214 = add nuw nsw i32 %79, %49
  %215 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %214
  %216 = load i8, i8 addrspace(3)* %215, align 1, !tbaa !7
  %217 = sext i8 %216 to i16
  %218 = add i16 %213, %217
  %219 = add nuw nsw i32 %85, %49
  %220 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %219
  %221 = load i8, i8 addrspace(3)* %220, align 1, !tbaa !7
  %222 = sext i8 %221 to i16
  %223 = add i16 %218, %222
  %224 = shl nuw nsw i32 %49, 1
  %225 = add nsw i32 %50, %224
  %226 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %225
  %227 = load i8, i8 addrspace(3)* %226, align 1, !tbaa !7
  %228 = sext i8 %227 to i16
  %229 = add i16 %223, %228
  %230 = add nsw i32 %56, %224
  %231 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %230
  %232 = load i8, i8 addrspace(3)* %231, align 1, !tbaa !7
  %233 = sext i8 %232 to i16
  %234 = add i16 %229, %233
  %235 = add nsw i32 %62, %224
  %236 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %235
  %237 = load i8, i8 addrspace(3)* %236, align 1, !tbaa !7
  %238 = sext i8 %237 to i16
  %239 = add i16 %234, %238
  %240 = add nuw nsw i32 %35, %224
  %241 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %240
  %242 = load i8, i8 addrspace(3)* %241, align 1, !tbaa !7
  %243 = sext i8 %242 to i16
  %244 = add i16 %239, %243
  %245 = add nuw nsw i32 %73, %224
  %246 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %245
  %247 = load i8, i8 addrspace(3)* %246, align 1, !tbaa !7
  %248 = sext i8 %247 to i16
  %249 = add i16 %244, %248
  %250 = add nuw nsw i32 %79, %224
  %251 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %250
  %252 = load i8, i8 addrspace(3)* %251, align 1, !tbaa !7
  %253 = sext i8 %252 to i16
  %254 = add i16 %249, %253
  %255 = add nuw nsw i32 %85, %224
  %256 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %255
  %257 = load i8, i8 addrspace(3)* %256, align 1, !tbaa !7
  %258 = sext i8 %257 to i16
  %259 = add i16 %254, %258
  %260 = mul nuw nsw i32 %49, 3
  %261 = add nsw i32 %50, %260
  %262 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %261
  %263 = load i8, i8 addrspace(3)* %262, align 1, !tbaa !7
  %264 = sext i8 %263 to i16
  %265 = add i16 %259, %264
  %266 = add nsw i32 %56, %260
  %267 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %266
  %268 = load i8, i8 addrspace(3)* %267, align 1, !tbaa !7
  %269 = sext i8 %268 to i16
  %270 = add i16 %265, %269
  %271 = add nsw i32 %62, %260
  %272 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %271
  %273 = load i8, i8 addrspace(3)* %272, align 1, !tbaa !7
  %274 = sext i8 %273 to i16
  %275 = add i16 %270, %274
  %276 = add nuw nsw i32 %35, %260
  %277 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %276
  %278 = load i8, i8 addrspace(3)* %277, align 1, !tbaa !7
  %279 = sext i8 %278 to i16
  %280 = add i16 %275, %279
  %281 = add nuw nsw i32 %73, %260
  %282 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %281
  %283 = load i8, i8 addrspace(3)* %282, align 1, !tbaa !7
  %284 = sext i8 %283 to i16
  %285 = add i16 %280, %284
  %286 = add nuw nsw i32 %79, %260
  %287 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %286
  %288 = load i8, i8 addrspace(3)* %287, align 1, !tbaa !7
  %289 = sext i8 %288 to i16
  %290 = add i16 %285, %289
  %291 = add nuw nsw i32 %85, %260
  %292 = getelementptr inbounds [484 x i8], [484 x i8] addrspace(3)* @_ZZ18sobelFilterShared3PhS_jjE9sharedMem, i32 0, i32 %291
  %293 = load i8, i8 addrspace(3)* %292, align 1, !tbaa !7
  %294 = sext i8 %293 to i16
  %295 = add i16 %290, %294
  %296 = sdiv i16 %295, 49
  %297 = trunc i16 %296 to i8
  %298 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %36
  store i8 %297, i8 addrspace(1)* %298, align 1, !tbaa !7
  br label %299

299:                                              ; preds = %45, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
