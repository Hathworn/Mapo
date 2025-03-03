; ModuleID = '../data/hip_kernels/5330/5/main.cu'
source_filename = "../data/hip_kernels/5330/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24ca_map_backward_kernel_gPKfS0_S0_Pfiiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readnone %2, float addrspace(1)* nocapture %3, i32 %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = mul nsw i32 %7, %6
  %27 = add nsw i32 %6, -1
  %28 = add i32 %27, %7
  %29 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %30 = icmp slt i32 %17, %7
  %31 = icmp slt i32 %25, %6
  %32 = select i1 %30, i1 %31, i1 false
  %33 = icmp slt i32 %29, %5
  %34 = select i1 %32, i1 %33, i1 false
  %35 = icmp sgt i32 %4, 0
  %36 = select i1 %34, i1 %35, i1 false
  br i1 %36, label %37, label %262

37:                                               ; preds = %8
  %38 = icmp sgt i32 %7, 0
  %39 = mul nsw i32 %25, %7
  %40 = icmp sgt i32 %6, 0
  %41 = add i32 %25, %7
  %42 = and i32 %7, 7
  %43 = icmp ult i32 %7, 8
  %44 = and i32 %7, -8
  %45 = icmp eq i32 %42, 0
  %46 = and i32 %6, 1
  %47 = icmp eq i32 %6, 1
  %48 = and i32 %6, -2
  %49 = icmp eq i32 %46, 0
  br label %50

50:                                               ; preds = %37, %212
  %51 = phi i32 [ 0, %37 ], [ %213, %212 ]
  br i1 %38, label %52, label %85

52:                                               ; preds = %50
  %53 = mul nsw i32 %51, %5
  %54 = add nsw i32 %53, %29
  %55 = mul nsw i32 %54, %26
  %56 = add nsw i32 %55, %39
  %57 = mul nsw i32 %51, %28
  %58 = add nsw i32 %57, %17
  %59 = mul nsw i32 %58, %26
  %60 = add nsw i32 %59, %39
  %61 = add nsw i32 %56, %17
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %3, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7
  br i1 %43, label %65, label %96

65:                                               ; preds = %96, %52
  %66 = phi float [ %64, %52 ], [ %186, %96 ]
  %67 = phi i32 [ 0, %52 ], [ %187, %96 ]
  br i1 %45, label %85, label %68

68:                                               ; preds = %65, %68
  %69 = phi float [ %81, %68 ], [ %66, %65 ]
  %70 = phi i32 [ %82, %68 ], [ %67, %65 ]
  %71 = phi i32 [ %83, %68 ], [ 0, %65 ]
  %72 = add nsw i32 %70, %56
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !7
  %76 = add nsw i32 %60, %70
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %1, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = fmul contract float %75, %79
  %81 = fadd contract float %69, %80
  store float %81, float addrspace(1)* %63, align 4, !tbaa !7
  %82 = add nuw nsw i32 %70, 1
  %83 = add i32 %71, 1
  %84 = icmp eq i32 %83, %42
  br i1 %84, label %85, label %68, !llvm.loop !11

85:                                               ; preds = %65, %68, %50
  br i1 %40, label %86, label %212

86:                                               ; preds = %85
  %87 = mul nsw i32 %51, %5
  %88 = add nsw i32 %87, %29
  %89 = mul nsw i32 %88, %26
  %90 = add i32 %89, %17
  %91 = mul nsw i32 %51, %28
  %92 = add i32 %41, %91
  %93 = add i32 %90, %39
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %3, i64 %94
  br i1 %47, label %190, label %215

96:                                               ; preds = %52, %96
  %97 = phi float [ %186, %96 ], [ %64, %52 ]
  %98 = phi i32 [ %187, %96 ], [ 0, %52 ]
  %99 = phi i32 [ %188, %96 ], [ 0, %52 ]
  %100 = add nsw i32 %98, %56
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = add nsw i32 %60, %98
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7
  %108 = fmul contract float %103, %107
  %109 = fadd contract float %97, %108
  store float %109, float addrspace(1)* %63, align 4, !tbaa !7
  %110 = or i32 %98, 1
  %111 = add nsw i32 %110, %56
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %0, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !7
  %115 = add nsw i32 %60, %110
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !7
  %119 = fmul contract float %114, %118
  %120 = fadd contract float %109, %119
  store float %120, float addrspace(1)* %63, align 4, !tbaa !7
  %121 = or i32 %98, 2
  %122 = add nsw i32 %121, %56
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %0, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7
  %126 = add nsw i32 %60, %121
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %1, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !7
  %130 = fmul contract float %125, %129
  %131 = fadd contract float %120, %130
  store float %131, float addrspace(1)* %63, align 4, !tbaa !7
  %132 = or i32 %98, 3
  %133 = add nsw i32 %132, %56
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = add nsw i32 %60, %132
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = fmul contract float %136, %140
  %142 = fadd contract float %131, %141
  store float %142, float addrspace(1)* %63, align 4, !tbaa !7
  %143 = or i32 %98, 4
  %144 = add nsw i32 %143, %56
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7
  %148 = add nsw i32 %60, %143
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %1, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = fmul contract float %147, %151
  %153 = fadd contract float %142, %152
  store float %153, float addrspace(1)* %63, align 4, !tbaa !7
  %154 = or i32 %98, 5
  %155 = add nsw i32 %154, %56
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = add nsw i32 %60, %154
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %1, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7
  %163 = fmul contract float %158, %162
  %164 = fadd contract float %153, %163
  store float %164, float addrspace(1)* %63, align 4, !tbaa !7
  %165 = or i32 %98, 6
  %166 = add nsw i32 %165, %56
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %0, i64 %167
  %169 = load float, float addrspace(1)* %168, align 4, !tbaa !7
  %170 = add nsw i32 %60, %165
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %1, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !7
  %174 = fmul contract float %169, %173
  %175 = fadd contract float %164, %174
  store float %175, float addrspace(1)* %63, align 4, !tbaa !7
  %176 = or i32 %98, 7
  %177 = add nsw i32 %176, %56
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !7
  %181 = add nsw i32 %60, %176
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %1, i64 %182
  %184 = load float, float addrspace(1)* %183, align 4, !tbaa !7
  %185 = fmul contract float %180, %184
  %186 = fadd contract float %175, %185
  store float %186, float addrspace(1)* %63, align 4, !tbaa !7
  %187 = add nuw nsw i32 %98, 8
  %188 = add i32 %99, 8
  %189 = icmp eq i32 %188, %44
  br i1 %189, label %65, label %96, !llvm.loop !13

190:                                              ; preds = %258, %86
  %191 = phi i32 [ 0, %86 ], [ %259, %258 ]
  %192 = icmp eq i32 %191, %25
  %193 = select i1 %49, i1 true, i1 %192
  br i1 %193, label %212, label %194

194:                                              ; preds = %190
  %195 = icmp sle i32 %191, %25
  %196 = sext i1 %195 to i32
  %197 = mul nsw i32 %191, %7
  %198 = add i32 %90, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %0, i64 %199
  %201 = load float, float addrspace(1)* %200, align 4, !tbaa !7
  %202 = add i32 %92, %196
  %203 = mul nsw i32 %202, %26
  %204 = add i32 %197, %17
  %205 = add i32 %204, %203
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  %208 = load float, float addrspace(1)* %207, align 4, !tbaa !7
  %209 = fmul contract float %201, %208
  %210 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %211 = fadd contract float %210, %209
  store float %211, float addrspace(1)* %95, align 4, !tbaa !7
  br label %212

212:                                              ; preds = %190, %194, %85
  %213 = add nuw nsw i32 %51, 1
  %214 = icmp eq i32 %213, %4
  br i1 %214, label %262, label %50, !llvm.loop !15

215:                                              ; preds = %86, %258
  %216 = phi i32 [ %259, %258 ], [ 0, %86 ]
  %217 = phi i32 [ %260, %258 ], [ 0, %86 ]
  %218 = icmp eq i32 %216, %25
  br i1 %218, label %237, label %219

219:                                              ; preds = %215
  %220 = icmp sle i32 %216, %25
  %221 = sext i1 %220 to i32
  %222 = mul nsw i32 %216, %7
  %223 = add i32 %90, %222
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds float, float addrspace(1)* %0, i64 %224
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = add i32 %92, %221
  %228 = mul nsw i32 %227, %26
  %229 = add i32 %222, %17
  %230 = add i32 %229, %228
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %1, i64 %231
  %233 = load float, float addrspace(1)* %232, align 4, !tbaa !7
  %234 = fmul contract float %226, %233
  %235 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %236 = fadd contract float %235, %234
  store float %236, float addrspace(1)* %95, align 4, !tbaa !7
  br label %237

237:                                              ; preds = %215, %219
  %238 = or i32 %216, 1
  %239 = icmp eq i32 %238, %25
  br i1 %239, label %258, label %240

240:                                              ; preds = %237
  %241 = icmp slt i32 %216, %25
  %242 = sext i1 %241 to i32
  %243 = mul nsw i32 %238, %7
  %244 = add i32 %90, %243
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds float, float addrspace(1)* %0, i64 %245
  %247 = load float, float addrspace(1)* %246, align 4, !tbaa !7
  %248 = add i32 %92, %242
  %249 = mul nsw i32 %248, %26
  %250 = add i32 %243, %17
  %251 = add i32 %250, %249
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds float, float addrspace(1)* %1, i64 %252
  %254 = load float, float addrspace(1)* %253, align 4, !tbaa !7
  %255 = fmul contract float %247, %254
  %256 = load float, float addrspace(1)* %95, align 4, !tbaa !7
  %257 = fadd contract float %256, %255
  store float %257, float addrspace(1)* %95, align 4, !tbaa !7
  br label %258

258:                                              ; preds = %240, %237
  %259 = add nuw nsw i32 %216, 2
  %260 = add i32 %217, 2
  %261 = icmp eq i32 %260, %48
  br i1 %261, label %190, label %215, !llvm.loop !16

262:                                              ; preds = %212, %8
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #1

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
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !14}
