; ModuleID = '../data/hip_kernels/6503/8/main.cu'
source_filename = "../data/hip_kernels/6503/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL19convertVToRGBKernelPKtPhiiiPi = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL19convertVToRGBKernelPKtPhiiiPi(i16 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5) local_unnamed_addr #0 comdat {
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
  %24 = sdiv i32 %2, 8
  %25 = icmp slt i32 %15, %24
  %26 = icmp slt i32 %23, %4
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %312

28:                                               ; preds = %6
  %29 = mul nsw i32 %23, %2
  %30 = shl nsw i32 %15, 3
  %31 = add nsw i32 %29, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %32
  %34 = load i16, i16 addrspace(1)* %33, align 2, !tbaa !7, !amdgpu.noclobber !5
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %31, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %37
  %39 = load i16, i16 addrspace(1)* %38, align 2, !tbaa !7, !amdgpu.noclobber !5
  %40 = zext i16 %39 to i32
  %41 = shl nuw i32 %40, 16
  %42 = or i32 %41, %35
  %43 = add nsw i32 %31, 2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %44
  %46 = load i16, i16 addrspace(1)* %45, align 2, !tbaa !7, !amdgpu.noclobber !5
  %47 = zext i16 %46 to i32
  %48 = add nsw i32 %31, 3
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %49
  %51 = load i16, i16 addrspace(1)* %50, align 2, !tbaa !7, !amdgpu.noclobber !5
  %52 = zext i16 %51 to i32
  %53 = shl nuw i32 %52, 16
  %54 = or i32 %53, %47
  %55 = add nsw i32 %31, 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %56
  %58 = load i16, i16 addrspace(1)* %57, align 2, !tbaa !7, !amdgpu.noclobber !5
  %59 = zext i16 %58 to i32
  %60 = add nsw i32 %31, 5
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %61
  %63 = load i16, i16 addrspace(1)* %62, align 2, !tbaa !7, !amdgpu.noclobber !5
  %64 = zext i16 %63 to i32
  %65 = shl nuw i32 %64, 16
  %66 = or i32 %65, %59
  %67 = add nsw i32 %31, 6
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %68
  %70 = load i16, i16 addrspace(1)* %69, align 2, !tbaa !7, !amdgpu.noclobber !5
  %71 = zext i16 %70 to i32
  %72 = add nsw i32 %31, 7
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %73
  %75 = load i16, i16 addrspace(1)* %74, align 2, !tbaa !7, !amdgpu.noclobber !5
  %76 = zext i16 %75 to i32
  %77 = shl nuw i32 %76, 16
  %78 = or i32 %77, %71
  %79 = lshr i32 %40, 4
  %80 = and i32 %79, 1023
  %81 = lshr i32 %42, 10
  %82 = and i32 %81, 1023
  %83 = mul nuw nsw i32 %82, 1000
  %84 = and i32 %35, 1023
  %85 = lshr i32 %52, 4
  %86 = and i32 %85, 1023
  %87 = mul nuw nsw i32 %86, 1000
  %88 = lshr i32 %54, 10
  %89 = and i32 %88, 1023
  %90 = and i32 %47, 1023
  %91 = mul nuw nsw i32 %90, 1000
  %92 = lshr i32 %64, 4
  %93 = and i32 %92, 1023
  %94 = lshr i32 %66, 10
  %95 = and i32 %94, 1023
  %96 = mul nuw nsw i32 %95, 1000
  %97 = and i32 %59, 1023
  %98 = lshr i32 %76, 4
  %99 = and i32 %98, 1023
  %100 = mul nuw nsw i32 %99, 1000
  %101 = lshr i32 %78, 10
  %102 = and i32 %101, 1023
  %103 = and i32 %71, 1023
  %104 = mul nuw nsw i32 %103, 1000
  %105 = mul nsw i32 %15, 18
  %106 = mul nsw i32 %29, 9
  %107 = sdiv i32 %106, 4
  %108 = mul nuw nsw i32 %80, 1407
  %109 = add nsw i32 %108, -720384
  %110 = mul nuw nsw i32 %80, 716
  %111 = mul nuw nsw i32 %84, 345
  %112 = add nuw nsw i32 %111, -543232
  %113 = add nsw i32 %112, %110
  %114 = mul nuw nsw i32 %84, 1779
  %115 = add nsw i32 %114, -910848
  %116 = add nsw i32 %83, %109
  %117 = udiv i32 %116, 1000
  %118 = sub nsw i32 %83, %113
  %119 = udiv i32 %118, 1000
  %120 = add nsw i32 %83, %115
  %121 = udiv i32 %120, 1000
  %122 = add nsw i32 %109, %91
  %123 = udiv i32 %122, 1000
  %124 = sub nsw i32 %91, %113
  %125 = udiv i32 %124, 1000
  %126 = add nsw i32 %91, %115
  %127 = udiv i32 %126, 1000
  %128 = and i32 %117, 65535
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %129
  %131 = load i32, i32 addrspace(1)* %130, align 4, !tbaa !11, !amdgpu.noclobber !5
  %132 = trunc i32 %131 to i8
  %133 = add nsw i32 %107, %105
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %134
  store i8 %132, i8 addrspace(1)* %135, align 1, !tbaa !13
  %136 = and i32 %119, 65535
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !11
  %140 = trunc i32 %139 to i8
  %141 = add nsw i32 %133, 1
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %142
  store i8 %140, i8 addrspace(1)* %143, align 1, !tbaa !13
  %144 = and i32 %121, 65535
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %145
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !11
  %148 = trunc i32 %147 to i8
  %149 = add nsw i32 %133, 2
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %150
  store i8 %148, i8 addrspace(1)* %151, align 1, !tbaa !13
  %152 = and i32 %123, 65535
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %153
  %155 = load i32, i32 addrspace(1)* %154, align 4, !tbaa !11
  %156 = trunc i32 %155 to i8
  %157 = add nsw i32 %133, 3
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %158
  store i8 %156, i8 addrspace(1)* %159, align 1, !tbaa !13
  %160 = and i32 %125, 65535
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %161
  %163 = load i32, i32 addrspace(1)* %162, align 4, !tbaa !11
  %164 = trunc i32 %163 to i8
  %165 = add nsw i32 %133, 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %166
  store i8 %164, i8 addrspace(1)* %167, align 1, !tbaa !13
  %168 = and i32 %127, 65535
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %169
  %171 = load i32, i32 addrspace(1)* %170, align 4, !tbaa !11
  %172 = trunc i32 %171 to i8
  %173 = add nsw i32 %133, 5
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %174
  store i8 %172, i8 addrspace(1)* %175, align 1, !tbaa !13
  %176 = mul nuw nsw i32 %97, 1407
  %177 = add nsw i32 %176, -720384
  %178 = mul nuw nsw i32 %97, 716
  %179 = mul nuw nsw i32 %89, 345
  %180 = add nsw i32 %178, -543232
  %181 = add nsw i32 %180, %179
  %182 = mul nuw nsw i32 %89, 1779
  %183 = add nsw i32 %182, -910848
  %184 = add nsw i32 %177, %87
  %185 = udiv i32 %184, 1000
  %186 = sub nsw i32 %87, %181
  %187 = udiv i32 %186, 1000
  %188 = add nsw i32 %183, %87
  %189 = udiv i32 %188, 1000
  %190 = add nsw i32 %96, %177
  %191 = udiv i32 %190, 1000
  %192 = sub nsw i32 %96, %181
  %193 = udiv i32 %192, 1000
  %194 = add nsw i32 %96, %183
  %195 = udiv i32 %194, 1000
  %196 = and i32 %185, 65535
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %197
  %199 = load i32, i32 addrspace(1)* %198, align 4, !tbaa !11
  %200 = trunc i32 %199 to i8
  %201 = add nsw i32 %133, 6
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %202
  store i8 %200, i8 addrspace(1)* %203, align 1, !tbaa !13
  %204 = and i32 %187, 65535
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %205
  %207 = load i32, i32 addrspace(1)* %206, align 4, !tbaa !11
  %208 = trunc i32 %207 to i8
  %209 = add nsw i32 %133, 7
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %210
  store i8 %208, i8 addrspace(1)* %211, align 1, !tbaa !13
  %212 = and i32 %189, 65535
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %213
  %215 = load i32, i32 addrspace(1)* %214, align 4, !tbaa !11
  %216 = trunc i32 %215 to i8
  %217 = add nsw i32 %133, 8
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %218
  store i8 %216, i8 addrspace(1)* %219, align 1, !tbaa !13
  %220 = and i32 %191, 65535
  %221 = zext i32 %220 to i64
  %222 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %221
  %223 = load i32, i32 addrspace(1)* %222, align 4, !tbaa !11
  %224 = trunc i32 %223 to i8
  %225 = add nsw i32 %133, 9
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %226
  store i8 %224, i8 addrspace(1)* %227, align 1, !tbaa !13
  %228 = and i32 %193, 65535
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %229
  %231 = load i32, i32 addrspace(1)* %230, align 4, !tbaa !11
  %232 = trunc i32 %231 to i8
  %233 = add nsw i32 %133, 10
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %234
  store i8 %232, i8 addrspace(1)* %235, align 1, !tbaa !13
  %236 = and i32 %195, 65535
  %237 = zext i32 %236 to i64
  %238 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %237
  %239 = load i32, i32 addrspace(1)* %238, align 4, !tbaa !11
  %240 = trunc i32 %239 to i8
  %241 = add nsw i32 %133, 11
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %242
  store i8 %240, i8 addrspace(1)* %243, align 1, !tbaa !13
  %244 = mul nuw nsw i32 %102, 1407
  %245 = add nsw i32 %244, -720384
  %246 = mul nuw nsw i32 %102, 716
  %247 = mul nuw nsw i32 %93, 345
  %248 = add nuw nsw i32 %247, -543232
  %249 = add nsw i32 %248, %246
  %250 = mul nuw nsw i32 %93, 1779
  %251 = add nsw i32 %250, -910848
  %252 = add nsw i32 %245, %104
  %253 = udiv i32 %252, 1000
  %254 = sub nsw i32 %104, %249
  %255 = udiv i32 %254, 1000
  %256 = add nsw i32 %251, %104
  %257 = udiv i32 %256, 1000
  %258 = add nsw i32 %245, %100
  %259 = udiv i32 %258, 1000
  %260 = sub nsw i32 %100, %249
  %261 = udiv i32 %260, 1000
  %262 = add nsw i32 %100, %251
  %263 = udiv i32 %262, 1000
  %264 = and i32 %253, 65535
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %265
  %267 = load i32, i32 addrspace(1)* %266, align 4, !tbaa !11
  %268 = trunc i32 %267 to i8
  %269 = add nsw i32 %133, 12
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %270
  store i8 %268, i8 addrspace(1)* %271, align 1, !tbaa !13
  %272 = and i32 %255, 65535
  %273 = zext i32 %272 to i64
  %274 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %273
  %275 = load i32, i32 addrspace(1)* %274, align 4, !tbaa !11
  %276 = trunc i32 %275 to i8
  %277 = add nsw i32 %133, 13
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %278
  store i8 %276, i8 addrspace(1)* %279, align 1, !tbaa !13
  %280 = and i32 %257, 65535
  %281 = zext i32 %280 to i64
  %282 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %281
  %283 = load i32, i32 addrspace(1)* %282, align 4, !tbaa !11
  %284 = trunc i32 %283 to i8
  %285 = add nsw i32 %133, 14
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %286
  store i8 %284, i8 addrspace(1)* %287, align 1, !tbaa !13
  %288 = and i32 %259, 65535
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %289
  %291 = load i32, i32 addrspace(1)* %290, align 4, !tbaa !11
  %292 = trunc i32 %291 to i8
  %293 = add nsw i32 %133, 15
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %294
  store i8 %292, i8 addrspace(1)* %295, align 1, !tbaa !13
  %296 = and i32 %261, 65535
  %297 = zext i32 %296 to i64
  %298 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %297
  %299 = load i32, i32 addrspace(1)* %298, align 4, !tbaa !11
  %300 = trunc i32 %299 to i8
  %301 = add nsw i32 %133, 16
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %302
  store i8 %300, i8 addrspace(1)* %303, align 1, !tbaa !13
  %304 = and i32 %263, 65535
  %305 = zext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !11
  %308 = trunc i32 %307 to i8
  %309 = add nsw i32 %133, 17
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %310
  store i8 %308, i8 addrspace(1)* %311, align 1, !tbaa !13
  br label %312

312:                                              ; preds = %28, %6
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = !{!9, !9, i64 0}
