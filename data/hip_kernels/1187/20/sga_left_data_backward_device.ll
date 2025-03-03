; ModuleID = '../data/hip_kernels/1187/20/main.cu'
source_filename = "../data/hip_kernels/1187/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22sga_left_data_backwardiPKfPfiiiiS1_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
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
  br i1 %18, label %19, label %277

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
  br i1 %32, label %33, label %277

33:                                               ; preds = %19
  %34 = icmp sgt i32 %5, 0
  %35 = shl nsw i32 %20, 1
  %36 = add nsw i32 %35, -2
  %37 = add nsw i32 %20, -1
  %38 = mul nsw i32 %20, 3
  %39 = shl nsw i32 %20, 2
  br label %50

40:                                               ; preds = %72
  br i1 %32, label %41, label %277

41:                                               ; preds = %40
  %42 = mul nsw i32 %20, 3
  %43 = add nsw i32 %5, -1
  %44 = mul nsw i32 %43, %20
  %45 = shl nsw i32 %20, 2
  %46 = and i32 %4, 3
  %47 = icmp ult i32 %4, 4
  br i1 %47, label %243, label %48

48:                                               ; preds = %41
  %49 = and i32 %4, -4
  br label %134

50:                                               ; preds = %33, %72
  %51 = phi i32 [ 0, %33 ], [ %73, %72 ]
  %52 = add nsw i32 %51, %31
  br i1 %34, label %53, label %72

53:                                               ; preds = %50
  %54 = add i32 %51, %29
  %55 = icmp eq i32 %51, 0
  %56 = add nsw i32 %52, -1
  %57 = add nsw i32 %56, %20
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  %60 = icmp ugt i32 %51, 1
  %61 = add i32 %36, %52
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = add nsw i32 %56, %38
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %65
  %67 = add nsw i32 %56, %39
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %68
  %70 = sext i32 %52 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  br label %75

72:                                               ; preds = %126, %50
  %73 = add nuw nsw i32 %51, 1
  %74 = icmp eq i32 %73, %4
  br i1 %74, label %40, label %50, !llvm.loop !7

75:                                               ; preds = %53, %126
  %76 = phi i32 [ 0, %53 ], [ %102, %126 ]
  %77 = mul nsw i32 %76, %20
  %78 = add i32 %54, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !9
  br i1 %55, label %90, label %82

82:                                               ; preds = %75
  %83 = add nsw i32 %78, -1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !9
  %87 = load float, float addrspace(1)* %59, align 4, !tbaa !9
  %88 = fmul contract float %86, %87
  %89 = fadd contract float %81, %88
  br label %90

90:                                               ; preds = %82, %75
  %91 = phi float [ %89, %82 ], [ %81, %75 ]
  br i1 %60, label %92, label %100

92:                                               ; preds = %90
  %93 = add nsw i32 %78, -2
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !9
  %97 = load float, float addrspace(1)* %63, align 4, !tbaa !9
  %98 = fmul contract float %96, %97
  %99 = fadd contract float %91, %98
  br label %100

100:                                              ; preds = %92, %90
  %101 = phi float [ %99, %92 ], [ %91, %90 ]
  %102 = add nuw nsw i32 %76, 1
  %103 = icmp sge i32 %102, %5
  %104 = select i1 %55, i1 true, i1 %103
  br i1 %104, label %113, label %105

105:                                              ; preds = %100
  %106 = add i32 %37, %78
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !9
  %110 = load float, float addrspace(1)* %66, align 4, !tbaa !9
  %111 = fmul contract float %109, %110
  %112 = fadd contract float %101, %111
  br label %113

113:                                              ; preds = %105, %100
  %114 = phi float [ %112, %105 ], [ %101, %100 ]
  %115 = icmp eq i32 %76, 0
  %116 = select i1 %55, i1 true, i1 %115
  br i1 %116, label %126, label %117

117:                                              ; preds = %113
  %118 = sub i32 %78, %20
  %119 = add nsw i32 %118, -1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %2, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !9
  %123 = load float, float addrspace(1)* %69, align 4, !tbaa !9
  %124 = fmul contract float %122, %123
  %125 = fadd contract float %114, %124
  br label %126

126:                                              ; preds = %117, %113
  %127 = phi float [ %125, %117 ], [ %114, %113 ]
  store float %127, float addrspace(1)* %80, align 4, !tbaa !9
  %128 = load float, float addrspace(1)* %71, align 4, !tbaa !9
  %129 = fmul contract float %127, %128
  %130 = getelementptr inbounds float, float addrspace(1)* %7, i64 %79
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !9
  %132 = fadd contract float %131, %129
  store float %132, float addrspace(1)* %130, align 4, !tbaa !9
  %133 = icmp eq i32 %102, %5
  br i1 %133, label %72, label %75, !llvm.loop !13

134:                                              ; preds = %134, %48
  %135 = phi i32 [ 0, %48 ], [ %240, %134 ]
  %136 = phi i32 [ 0, %48 ], [ %241, %134 ]
  %137 = add nsw i32 %135, %31
  %138 = add nsw i32 %135, %29
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !9
  %142 = add nsw i32 %137, %42
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !9
  %146 = fmul contract float %141, %145
  %147 = getelementptr inbounds float, float addrspace(1)* %7, i64 %139
  %148 = load float, float addrspace(1)* %147, align 4, !tbaa !9
  %149 = fadd contract float %148, %146
  store float %149, float addrspace(1)* %147, align 4, !tbaa !9
  %150 = add nsw i32 %138, %44
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %2, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !9
  %154 = add nsw i32 %137, %45
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %1, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !9
  %158 = fmul contract float %153, %157
  %159 = getelementptr inbounds float, float addrspace(1)* %7, i64 %151
  %160 = load float, float addrspace(1)* %159, align 4, !tbaa !9
  %161 = fadd contract float %160, %158
  store float %161, float addrspace(1)* %159, align 4, !tbaa !9
  %162 = or i32 %135, 1
  %163 = add nsw i32 %162, %31
  %164 = add nsw i32 %162, %29
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %2, i64 %165
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !9
  %168 = add nsw i32 %163, %42
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %1, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !9
  %172 = fmul contract float %167, %171
  %173 = getelementptr inbounds float, float addrspace(1)* %7, i64 %165
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !9
  %175 = fadd contract float %174, %172
  store float %175, float addrspace(1)* %173, align 4, !tbaa !9
  %176 = add nsw i32 %164, %44
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %2, i64 %177
  %179 = load float, float addrspace(1)* %178, align 4, !tbaa !9
  %180 = add nsw i32 %163, %45
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %1, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !9
  %184 = fmul contract float %179, %183
  %185 = getelementptr inbounds float, float addrspace(1)* %7, i64 %177
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !9
  %187 = fadd contract float %186, %184
  store float %187, float addrspace(1)* %185, align 4, !tbaa !9
  %188 = or i32 %135, 2
  %189 = add nsw i32 %188, %31
  %190 = add nsw i32 %188, %29
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %2, i64 %191
  %193 = load float, float addrspace(1)* %192, align 4, !tbaa !9
  %194 = add nsw i32 %189, %42
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds float, float addrspace(1)* %1, i64 %195
  %197 = load float, float addrspace(1)* %196, align 4, !tbaa !9
  %198 = fmul contract float %193, %197
  %199 = getelementptr inbounds float, float addrspace(1)* %7, i64 %191
  %200 = load float, float addrspace(1)* %199, align 4, !tbaa !9
  %201 = fadd contract float %200, %198
  store float %201, float addrspace(1)* %199, align 4, !tbaa !9
  %202 = add nsw i32 %190, %44
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds float, float addrspace(1)* %2, i64 %203
  %205 = load float, float addrspace(1)* %204, align 4, !tbaa !9
  %206 = add nsw i32 %189, %45
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %1, i64 %207
  %209 = load float, float addrspace(1)* %208, align 4, !tbaa !9
  %210 = fmul contract float %205, %209
  %211 = getelementptr inbounds float, float addrspace(1)* %7, i64 %203
  %212 = load float, float addrspace(1)* %211, align 4, !tbaa !9
  %213 = fadd contract float %212, %210
  store float %213, float addrspace(1)* %211, align 4, !tbaa !9
  %214 = or i32 %135, 3
  %215 = add nsw i32 %214, %31
  %216 = add nsw i32 %214, %29
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %2, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !9
  %220 = add nsw i32 %215, %42
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds float, float addrspace(1)* %1, i64 %221
  %223 = load float, float addrspace(1)* %222, align 4, !tbaa !9
  %224 = fmul contract float %219, %223
  %225 = getelementptr inbounds float, float addrspace(1)* %7, i64 %217
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !9
  %227 = fadd contract float %226, %224
  store float %227, float addrspace(1)* %225, align 4, !tbaa !9
  %228 = add nsw i32 %216, %44
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds float, float addrspace(1)* %2, i64 %229
  %231 = load float, float addrspace(1)* %230, align 4, !tbaa !9
  %232 = add nsw i32 %215, %45
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %1, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !9
  %236 = fmul contract float %231, %235
  %237 = getelementptr inbounds float, float addrspace(1)* %7, i64 %229
  %238 = load float, float addrspace(1)* %237, align 4, !tbaa !9
  %239 = fadd contract float %238, %236
  store float %239, float addrspace(1)* %237, align 4, !tbaa !9
  %240 = add nuw nsw i32 %135, 4
  %241 = add i32 %136, 4
  %242 = icmp eq i32 %241, %49
  br i1 %242, label %243, label %134, !llvm.loop !14

243:                                              ; preds = %134, %41
  %244 = phi i32 [ 0, %41 ], [ %240, %134 ]
  %245 = icmp eq i32 %46, 0
  br i1 %245, label %277, label %246

246:                                              ; preds = %243, %246
  %247 = phi i32 [ %274, %246 ], [ %244, %243 ]
  %248 = phi i32 [ %275, %246 ], [ 0, %243 ]
  %249 = add nsw i32 %247, %31
  %250 = add nsw i32 %247, %29
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds float, float addrspace(1)* %2, i64 %251
  %253 = load float, float addrspace(1)* %252, align 4, !tbaa !9
  %254 = add nsw i32 %249, %42
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds float, float addrspace(1)* %1, i64 %255
  %257 = load float, float addrspace(1)* %256, align 4, !tbaa !9
  %258 = fmul contract float %253, %257
  %259 = getelementptr inbounds float, float addrspace(1)* %7, i64 %251
  %260 = load float, float addrspace(1)* %259, align 4, !tbaa !9
  %261 = fadd contract float %260, %258
  store float %261, float addrspace(1)* %259, align 4, !tbaa !9
  %262 = add nsw i32 %250, %44
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds float, float addrspace(1)* %2, i64 %263
  %265 = load float, float addrspace(1)* %264, align 4, !tbaa !9
  %266 = add nsw i32 %249, %45
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds float, float addrspace(1)* %1, i64 %267
  %269 = load float, float addrspace(1)* %268, align 4, !tbaa !9
  %270 = fmul contract float %265, %269
  %271 = getelementptr inbounds float, float addrspace(1)* %7, i64 %263
  %272 = load float, float addrspace(1)* %271, align 4, !tbaa !9
  %273 = fadd contract float %272, %270
  store float %273, float addrspace(1)* %271, align 4, !tbaa !9
  %274 = add nuw nsw i32 %247, 1
  %275 = add i32 %248, 1
  %276 = icmp eq i32 %275, %46
  br i1 %276, label %277, label %246, !llvm.loop !15

277:                                              ; preds = %243, %246, %19, %40, %8
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
