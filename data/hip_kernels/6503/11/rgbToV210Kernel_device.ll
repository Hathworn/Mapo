; ModuleID = '../data/hip_kernels/6503/11/main.cu'
source_filename = "../data/hip_kernels/6503/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL15rgbToV210KernelPtS_ii = comdat any

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_ZL15rgbToV210KernelPtS_ii(i16 addrspace(1)* nocapture readonly %0, i16 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 comdat {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = sdiv i32 %2, 18
  %23 = icmp slt i32 %13, %22
  %24 = icmp slt i32 %21, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %252

26:                                               ; preds = %4
  %27 = mul nsw i32 %13, 18
  %28 = mul nsw i32 %21, %2
  %29 = add nsw i32 %28, %27
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %30
  %32 = load i16, i16 addrspace(1)* %31, align 2, !tbaa !7, !amdgpu.noclobber !5
  %33 = zext i16 %32 to i32
  %34 = add nsw i32 %29, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %35
  %37 = load i16, i16 addrspace(1)* %36, align 2, !tbaa !7, !amdgpu.noclobber !5
  %38 = zext i16 %37 to i32
  %39 = add nsw i32 %29, 2
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %40
  %42 = load i16, i16 addrspace(1)* %41, align 2, !tbaa !7, !amdgpu.noclobber !5
  %43 = zext i16 %42 to i32
  %44 = mul nuw nsw i32 %33, 299
  %45 = mul nuw nsw i32 %38, 587
  %46 = add nuw nsw i32 %45, %44
  %47 = mul nuw nsw i32 %43, 114
  %48 = add nuw nsw i32 %46, %47
  %49 = udiv i32 %48, 1000
  %50 = mul nsw i32 %33, -169
  %51 = add nsw i32 %50, 512000
  %52 = mul nsw i32 %38, -332
  %53 = add nsw i32 %51, %52
  %54 = mul nuw nsw i32 %43, 500
  %55 = add nsw i32 %53, %54
  %56 = udiv i32 %55, 1000
  %57 = mul nuw nsw i32 %33, 500
  %58 = add nuw nsw i32 %57, 512000
  %59 = mul nsw i32 %38, -419
  %60 = add nsw i32 %58, %59
  %61 = mul nsw i32 %43, -81
  %62 = add nsw i32 %60, %61
  %63 = udiv i32 %62, 1000
  %64 = add nsw i32 %29, 3
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %65
  %67 = load i16, i16 addrspace(1)* %66, align 2, !tbaa !7, !amdgpu.noclobber !5
  %68 = zext i16 %67 to i32
  %69 = add nsw i32 %29, 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %70
  %72 = load i16, i16 addrspace(1)* %71, align 2, !tbaa !7, !amdgpu.noclobber !5
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 %29, 5
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %75
  %77 = load i16, i16 addrspace(1)* %76, align 2, !tbaa !7, !amdgpu.noclobber !5
  %78 = zext i16 %77 to i32
  %79 = mul nuw nsw i32 %68, 299
  %80 = mul nuw nsw i32 %73, 587
  %81 = add nuw nsw i32 %80, %79
  %82 = mul nuw nsw i32 %78, 114
  %83 = add nuw nsw i32 %81, %82
  %84 = udiv i32 %83, 1000
  %85 = mul nsw i32 %68, -169
  %86 = add nsw i32 %85, 512000
  %87 = mul nsw i32 %73, -332
  %88 = add nsw i32 %86, %87
  %89 = mul nuw nsw i32 %78, 500
  %90 = add nsw i32 %88, %89
  %91 = udiv i32 %90, 1000
  %92 = mul nuw nsw i32 %68, 500
  %93 = add nuw nsw i32 %92, 512000
  %94 = mul nsw i32 %73, -419
  %95 = add nsw i32 %93, %94
  %96 = mul nsw i32 %78, -81
  %97 = add nsw i32 %95, %96
  %98 = udiv i32 %97, 1000
  %99 = add nsw i32 %29, 6
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %100
  %102 = load i16, i16 addrspace(1)* %101, align 2, !tbaa !7, !amdgpu.noclobber !5
  %103 = zext i16 %102 to i32
  %104 = add nsw i32 %29, 7
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %105
  %107 = load i16, i16 addrspace(1)* %106, align 2, !tbaa !7, !amdgpu.noclobber !5
  %108 = zext i16 %107 to i32
  %109 = add nsw i32 %29, 8
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %110
  %112 = load i16, i16 addrspace(1)* %111, align 2, !tbaa !7, !amdgpu.noclobber !5
  %113 = zext i16 %112 to i32
  %114 = mul nuw nsw i32 %103, 299
  %115 = mul nuw nsw i32 %108, 587
  %116 = add nuw nsw i32 %115, %114
  %117 = mul nuw nsw i32 %113, 114
  %118 = add nuw nsw i32 %116, %117
  %119 = udiv i32 %118, 1000
  %120 = mul nsw i32 %103, -169
  %121 = add nsw i32 %120, 512000
  %122 = mul nsw i32 %108, -332
  %123 = add nsw i32 %121, %122
  %124 = mul nuw nsw i32 %113, 500
  %125 = add nsw i32 %123, %124
  %126 = udiv i32 %125, 1000
  %127 = mul nuw nsw i32 %103, 500
  %128 = add nuw nsw i32 %127, 512000
  %129 = mul nsw i32 %108, -419
  %130 = add nsw i32 %128, %129
  %131 = mul nsw i32 %113, -81
  %132 = add nsw i32 %130, %131
  %133 = udiv i32 %132, 1000
  %134 = add nsw i32 %29, 9
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %135
  %137 = load i16, i16 addrspace(1)* %136, align 2, !tbaa !7, !amdgpu.noclobber !5
  %138 = zext i16 %137 to i32
  %139 = add nsw i32 %29, 10
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %140
  %142 = load i16, i16 addrspace(1)* %141, align 2, !tbaa !7, !amdgpu.noclobber !5
  %143 = zext i16 %142 to i32
  %144 = add nsw i32 %29, 11
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %145
  %147 = load i16, i16 addrspace(1)* %146, align 2, !tbaa !7, !amdgpu.noclobber !5
  %148 = zext i16 %147 to i32
  %149 = mul nuw nsw i32 %138, 299
  %150 = mul nuw nsw i32 %143, 587
  %151 = add nuw nsw i32 %150, %149
  %152 = mul nuw nsw i32 %148, 114
  %153 = add nuw nsw i32 %151, %152
  %154 = udiv i32 %153, 1000
  %155 = add nsw i32 %29, 12
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %156
  %158 = load i16, i16 addrspace(1)* %157, align 2, !tbaa !7, !amdgpu.noclobber !5
  %159 = zext i16 %158 to i32
  %160 = add nsw i32 %29, 13
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %161
  %163 = load i16, i16 addrspace(1)* %162, align 2, !tbaa !7, !amdgpu.noclobber !5
  %164 = zext i16 %163 to i32
  %165 = add nsw i32 %29, 14
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %166
  %168 = load i16, i16 addrspace(1)* %167, align 2, !tbaa !7, !amdgpu.noclobber !5
  %169 = zext i16 %168 to i32
  %170 = mul nuw nsw i32 %159, 299
  %171 = mul nuw nsw i32 %164, 587
  %172 = add nuw nsw i32 %171, %170
  %173 = mul nuw nsw i32 %169, 114
  %174 = add nuw nsw i32 %172, %173
  %175 = udiv i32 %174, 1000
  %176 = add nsw i32 %29, 15
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %177
  %179 = load i16, i16 addrspace(1)* %178, align 2, !tbaa !7, !amdgpu.noclobber !5
  %180 = zext i16 %179 to i32
  %181 = add nsw i32 %29, 16
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %182
  %184 = load i16, i16 addrspace(1)* %183, align 2, !tbaa !7, !amdgpu.noclobber !5
  %185 = zext i16 %184 to i32
  %186 = add nsw i32 %29, 17
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i16, i16 addrspace(1)* %0, i64 %187
  %189 = load i16, i16 addrspace(1)* %188, align 2, !tbaa !7, !amdgpu.noclobber !5
  %190 = zext i16 %189 to i32
  %191 = mul nuw nsw i32 %180, 299
  %192 = mul nuw nsw i32 %185, 587
  %193 = add nuw nsw i32 %192, %191
  %194 = mul nuw nsw i32 %190, 114
  %195 = add nuw nsw i32 %193, %194
  %196 = udiv i32 %195, 1000
  %197 = shl i32 %63, 20
  %198 = shl nuw nsw i32 %49, 10
  %199 = or i32 %198, %56
  %200 = or i32 %199, %197
  %201 = shl i32 %119, 20
  %202 = shl i32 %91, 10
  %203 = or i32 %202, %84
  %204 = or i32 %203, %201
  %205 = shl i32 %126, 20
  %206 = shl nuw nsw i32 %154, 10
  %207 = or i32 %205, %98
  %208 = or i32 %207, %206
  %209 = shl i32 %196, 20
  %210 = shl i32 %133, 10
  %211 = or i32 %175, %210
  %212 = or i32 %211, %209
  %213 = shl nsw i32 %13, 3
  %214 = shl nsw i32 %28, 2
  %215 = sdiv i32 %214, 9
  %216 = trunc i32 %199 to i16
  %217 = add nsw i32 %215, %213
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %218
  store i16 %216, i16 addrspace(1)* %219, align 2, !tbaa !7
  %220 = lshr i32 %200, 16
  %221 = trunc i32 %220 to i16
  %222 = add nsw i32 %217, 1
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %223
  store i16 %221, i16 addrspace(1)* %224, align 2, !tbaa !7
  %225 = trunc i32 %203 to i16
  %226 = add nsw i32 %217, 2
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %227
  store i16 %225, i16 addrspace(1)* %228, align 2, !tbaa !7
  %229 = lshr i32 %204, 16
  %230 = trunc i32 %229 to i16
  %231 = add nsw i32 %217, 3
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %232
  store i16 %230, i16 addrspace(1)* %233, align 2, !tbaa !7
  %234 = trunc i32 %208 to i16
  %235 = add nsw i32 %217, 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %236
  store i16 %234, i16 addrspace(1)* %237, align 2, !tbaa !7
  %238 = lshr i32 %208, 16
  %239 = trunc i32 %238 to i16
  %240 = add nsw i32 %217, 5
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %241
  store i16 %239, i16 addrspace(1)* %242, align 2, !tbaa !7
  %243 = trunc i32 %211 to i16
  %244 = add nsw i32 %217, 6
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %245
  store i16 %243, i16 addrspace(1)* %246, align 2, !tbaa !7
  %247 = lshr i32 %212, 16
  %248 = trunc i32 %247 to i16
  %249 = add nsw i32 %217, 7
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i16, i16 addrspace(1)* %1, i64 %250
  store i16 %248, i16 addrspace(1)* %251, align 2, !tbaa !7
  br label %252

252:                                              ; preds = %26, %4
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
