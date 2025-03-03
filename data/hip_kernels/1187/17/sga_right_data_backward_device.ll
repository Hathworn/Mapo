; ModuleID = '../data/hip_kernels/1187/17/main.cu'
source_filename = "../data/hip_kernels/1187/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23sga_right_data_backwardiPKfPfiiiiS1_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %278

19:                                               ; preds = %8
  %20 = mul nsw i32 %4, %3
  %21 = freeze i32 %17
  %22 = freeze i32 %3
  %23 = sdiv i32 %21, %22
  %24 = mul nsw i32 %23, %20
  %25 = mul nsw i32 %24, %5
  %26 = mul i32 %23, %22
  %27 = sub i32 %21, %26
  %28 = mul nsw i32 %27, %4
  %29 = add nsw i32 %25, %28
  %30 = mul nsw i32 %24, %6
  %31 = add nsw i32 %30, %28
  %32 = icmp sgt i32 %4, 0
  br i1 %32, label %33, label %278

33:                                               ; preds = %19
  %34 = icmp sgt i32 %5, 0
  %35 = shl nsw i32 %20, 1
  %36 = add i32 %35, 2
  %37 = mul nsw i32 %20, 3
  %38 = shl nsw i32 %20, 2
  br label %51

39:                                               ; preds = %127, %51
  %40 = icmp sgt i32 %52, 1
  br i1 %40, label %51, label %41, !llvm.loop !7

41:                                               ; preds = %39
  br i1 %32, label %42, label %278

42:                                               ; preds = %41
  %43 = mul nsw i32 %20, 3
  %44 = add nsw i32 %5, -1
  %45 = mul nsw i32 %44, %20
  %46 = shl nsw i32 %20, 2
  %47 = and i32 %4, 3
  %48 = icmp ult i32 %4, 4
  br i1 %48, label %244, label %49

49:                                               ; preds = %42
  %50 = and i32 %4, -4
  br label %135

51:                                               ; preds = %33, %39
  %52 = phi i32 [ %4, %33 ], [ %53, %39 ]
  %53 = add nsw i32 %52, -1
  %54 = add nsw i32 %53, %31
  br i1 %34, label %55, label %39

55:                                               ; preds = %51
  %56 = icmp slt i32 %52, %4
  %57 = add i32 %52, %31
  %58 = add nsw i32 %57, %20
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = add nuw nsw i32 %52, 1
  %62 = icmp slt i32 %61, %4
  %63 = add i32 %36, %54
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %1, i64 %64
  %66 = add nsw i32 %57, %37
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %1, i64 %67
  %69 = add nsw i32 %57, %38
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = sext i32 %54 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  br label %74

74:                                               ; preds = %55, %127
  %75 = phi i32 [ 0, %55 ], [ %102, %127 ]
  %76 = mul nsw i32 %75, %20
  %77 = add nsw i32 %76, %29
  %78 = add nsw i32 %77, %53
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !9
  br i1 %56, label %82, label %90

82:                                               ; preds = %74
  %83 = add i32 %77, %52
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !9
  %87 = load float, float addrspace(1)* %60, align 4, !tbaa !9
  %88 = fmul contract float %86, %87
  %89 = fadd contract float %81, %88
  br label %90

90:                                               ; preds = %82, %74
  %91 = phi float [ %89, %82 ], [ %81, %74 ]
  br i1 %62, label %92, label %100

92:                                               ; preds = %90
  %93 = add nsw i32 %78, 2
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !9
  %97 = load float, float addrspace(1)* %65, align 4, !tbaa !9
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %91, %98
  br label %100

100:                                              ; preds = %92, %90
  %101 = phi float [ %99, %92 ], [ %91, %90 ]
  %102 = add nuw nsw i32 %75, 1
  %103 = icmp slt i32 %102, %5
  %104 = select i1 %56, i1 %103, i1 false
  br i1 %104, label %105, label %114

105:                                              ; preds = %100
  %106 = add i32 %77, %52
  %107 = add nsw i32 %106, %20
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %2, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !9
  %111 = load float, float addrspace(1)* %68, align 4, !tbaa !9
  %112 = fmul contract float %110, %111
  %113 = fadd contract float %101, %112
  br label %114

114:                                              ; preds = %105, %100
  %115 = phi float [ %113, %105 ], [ %101, %100 ]
  %116 = icmp ne i32 %75, 0
  %117 = select i1 %56, i1 %116, i1 false
  br i1 %117, label %118, label %127

118:                                              ; preds = %114
  %119 = add i32 %77, %52
  %120 = sub i32 %119, %20
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !9
  %124 = load float, float addrspace(1)* %71, align 4, !tbaa !9
  %125 = fmul contract float %123, %124
  %126 = fadd contract float %115, %125
  br label %127

127:                                              ; preds = %118, %114
  %128 = phi float [ %126, %118 ], [ %115, %114 ]
  store float %128, float addrspace(1)* %80, align 4, !tbaa !9
  %129 = load float, float addrspace(1)* %73, align 4, !tbaa !9
  %130 = fmul contract float %128, %129
  %131 = getelementptr inbounds float, float addrspace(1)* %7, i64 %79
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !9
  %133 = fadd contract float %132, %130
  store float %133, float addrspace(1)* %131, align 4, !tbaa !9
  %134 = icmp eq i32 %102, %5
  br i1 %134, label %39, label %74, !llvm.loop !13

135:                                              ; preds = %135, %49
  %136 = phi i32 [ 0, %49 ], [ %241, %135 ]
  %137 = phi i32 [ 0, %49 ], [ %242, %135 ]
  %138 = add nsw i32 %136, %31
  %139 = add nsw i32 %136, %29
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !9
  %143 = add nsw i32 %138, %43
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %1, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !9
  %147 = fmul contract float %142, %146
  %148 = getelementptr inbounds float, float addrspace(1)* %7, i64 %140
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !9
  %150 = fadd contract float %149, %147
  store float %150, float addrspace(1)* %148, align 4, !tbaa !9
  %151 = add nsw i32 %139, %45
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %2, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !9
  %155 = add nsw i32 %138, %46
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !9
  %159 = fmul contract float %154, %158
  %160 = getelementptr inbounds float, float addrspace(1)* %7, i64 %152
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !9
  %162 = fadd contract float %161, %159
  store float %162, float addrspace(1)* %160, align 4, !tbaa !9
  %163 = or i32 %136, 1
  %164 = add nsw i32 %163, %31
  %165 = add nsw i32 %163, %29
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %2, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !9
  %169 = add nsw i32 %164, %43
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds float, float addrspace(1)* %1, i64 %170
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !9
  %173 = fmul contract float %168, %172
  %174 = getelementptr inbounds float, float addrspace(1)* %7, i64 %166
  %175 = load float, float addrspace(1)* %174, align 4, !tbaa !9
  %176 = fadd contract float %175, %173
  store float %176, float addrspace(1)* %174, align 4, !tbaa !9
  %177 = add nsw i32 %165, %45
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %2, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !9
  %181 = add nsw i32 %164, %46
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !9
  %185 = fmul contract float %180, %184
  %186 = getelementptr inbounds float, float addrspace(1)* %7, i64 %178
  %187 = load float, float addrspace(1)* %186, align 4, !tbaa !9
  %188 = fadd contract float %187, %185
  store float %188, float addrspace(1)* %186, align 4, !tbaa !9
  %189 = or i32 %136, 2
  %190 = add nsw i32 %189, %31
  %191 = add nsw i32 %189, %29
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %2, i64 %192
  %194 = load float, float addrspace(1)* %193, align 4, !tbaa !9
  %195 = add nsw i32 %190, %43
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds float, float addrspace(1)* %1, i64 %196
  %198 = load float, float addrspace(1)* %197, align 4, !tbaa !9
  %199 = fmul contract float %194, %198
  %200 = getelementptr inbounds float, float addrspace(1)* %7, i64 %192
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !9
  %202 = fadd contract float %201, %199
  store float %202, float addrspace(1)* %200, align 4, !tbaa !9
  %203 = add nsw i32 %191, %45
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %2, i64 %204
  %206 = load float, float addrspace(1)* %205, align 4, !tbaa !9
  %207 = add nsw i32 %190, %46
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %1, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !9
  %211 = fmul contract float %206, %210
  %212 = getelementptr inbounds float, float addrspace(1)* %7, i64 %204
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !9
  %214 = fadd contract float %213, %211
  store float %214, float addrspace(1)* %212, align 4, !tbaa !9
  %215 = or i32 %136, 3
  %216 = add nsw i32 %215, %31
  %217 = add nsw i32 %215, %29
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %2, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !9
  %221 = add nsw i32 %216, %43
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds float, float addrspace(1)* %1, i64 %222
  %224 = load float, float addrspace(1)* %223, align 4, !tbaa !9
  %225 = fmul contract float %220, %224
  %226 = getelementptr inbounds float, float addrspace(1)* %7, i64 %218
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !9
  %228 = fadd contract float %227, %225
  store float %228, float addrspace(1)* %226, align 4, !tbaa !9
  %229 = add nsw i32 %217, %45
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %2, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !9
  %233 = add nsw i32 %216, %46
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds float, float addrspace(1)* %1, i64 %234
  %236 = load float, float addrspace(1)* %235, align 4, !tbaa !9
  %237 = fmul contract float %232, %236
  %238 = getelementptr inbounds float, float addrspace(1)* %7, i64 %230
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !9
  %240 = fadd contract float %239, %237
  store float %240, float addrspace(1)* %238, align 4, !tbaa !9
  %241 = add nuw nsw i32 %136, 4
  %242 = add i32 %137, 4
  %243 = icmp eq i32 %242, %50
  br i1 %243, label %244, label %135, !llvm.loop !14

244:                                              ; preds = %135, %42
  %245 = phi i32 [ 0, %42 ], [ %241, %135 ]
  %246 = icmp eq i32 %47, 0
  br i1 %246, label %278, label %247

247:                                              ; preds = %244, %247
  %248 = phi i32 [ %275, %247 ], [ %245, %244 ]
  %249 = phi i32 [ %276, %247 ], [ 0, %244 ]
  %250 = add nsw i32 %248, %31
  %251 = add nsw i32 %248, %29
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %2, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !9
  %255 = add nsw i32 %250, %43
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %1, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !9
  %259 = fmul contract float %254, %258
  %260 = getelementptr inbounds float, float addrspace(1)* %7, i64 %252
  %261 = load float, float addrspace(1)* %260, align 4, !tbaa !9
  %262 = fadd contract float %261, %259
  store float %262, float addrspace(1)* %260, align 4, !tbaa !9
  %263 = add nsw i32 %251, %45
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds float, float addrspace(1)* %2, i64 %264
  %266 = load float, float addrspace(1)* %265, align 4, !tbaa !9
  %267 = add nsw i32 %250, %46
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds float, float addrspace(1)* %1, i64 %268
  %270 = load float, float addrspace(1)* %269, align 4, !tbaa !9
  %271 = fmul contract float %266, %270
  %272 = getelementptr inbounds float, float addrspace(1)* %7, i64 %264
  %273 = load float, float addrspace(1)* %272, align 4, !tbaa !9
  %274 = fadd contract float %273, %271
  store float %274, float addrspace(1)* %272, align 4, !tbaa !9
  %275 = add nuw nsw i32 %248, 1
  %276 = add i32 %249, 1
  %277 = icmp eq i32 %276, %47
  br i1 %277, label %278, label %247, !llvm.loop !15

278:                                              ; preds = %244, %247, %19, %41, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
