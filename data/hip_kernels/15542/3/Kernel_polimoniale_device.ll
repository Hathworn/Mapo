; ModuleID = '../data/hip_kernels/15542/3/main.cu'
source_filename = "../data/hip_kernels/15542/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18Kernel_polimonialePfS_iiiPiS0_S0_ii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 addrspace(1)* nocapture readonly %5, i32 addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture readonly %7, i32 %8, i32 %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 16
  %28 = bitcast i8 addrspace(4)* %27 to i32 addrspace(4)*
  %29 = load i32, i32 addrspace(4)* %28, align 8, !tbaa !16
  %30 = icmp slt i32 %22, %2
  br i1 %30, label %31, label %264

31:                                               ; preds = %10
  %32 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %33 = mul i32 %32, %26
  %34 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %35 = add i32 %33, %34
  %36 = icmp sgt i32 %9, 0
  %37 = udiv i32 %19, %16
  %38 = mul i32 %37, %16
  %39 = icmp ugt i32 %19, %38
  %40 = zext i1 %39 to i32
  %41 = add i32 %37, %40
  %42 = mul i32 %41, %16
  %43 = and i32 %9, 7
  %44 = icmp ult i32 %9, 8
  %45 = and i32 %9, -8
  %46 = icmp eq i32 %43, 0
  br label %47

47:                                               ; preds = %31, %260
  %48 = phi i32 [ %22, %31 ], [ %262, %260 ]
  %49 = phi i32 [ %35, %31 ], [ %261, %260 ]
  %50 = icmp slt i32 %49, %4
  br i1 %50, label %51, label %260

51:                                               ; preds = %47
  %52 = sext i32 %48 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !17, !amdgpu.noclobber !5
  %55 = icmp sgt i32 %54, 0
  %56 = mul nsw i32 %48, %8
  %57 = mul nsw i32 %48, %3
  %58 = udiv i32 %29, %26
  %59 = mul i32 %58, %26
  %60 = icmp ugt i32 %29, %59
  %61 = zext i1 %60 to i32
  %62 = add i32 %58, %61
  %63 = mul i32 %62, %26
  %64 = and i32 %54, 7
  %65 = icmp ult i32 %54, 8
  %66 = and i32 %54, -8
  %67 = icmp eq i32 %64, 0
  br label %68

68:                                               ; preds = %51, %252
  %69 = phi i32 [ %49, %51 ], [ %258, %252 ]
  br i1 %55, label %70, label %226

70:                                               ; preds = %68
  %71 = sext i32 %69 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !17, !amdgpu.noclobber !5
  %74 = mul nsw i32 %73, %3
  br i1 %65, label %201, label %75

75:                                               ; preds = %70, %75
  %76 = phi float [ %197, %75 ], [ 0.000000e+00, %70 ]
  %77 = phi i32 [ %198, %75 ], [ 0, %70 ]
  %78 = phi i32 [ %199, %75 ], [ 0, %70 ]
  %79 = add nsw i32 %77, %56
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !17, !amdgpu.noclobber !5
  %83 = add nsw i32 %82, %57
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !21
  %87 = add nsw i32 %82, %74
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !21
  %91 = fmul contract float %86, %90
  %92 = fadd contract float %76, %91
  %93 = or i32 %77, 1
  %94 = add nsw i32 %93, %56
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !17, !amdgpu.noclobber !5
  %98 = add nsw i32 %97, %57
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !21
  %102 = add nsw i32 %97, %74
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %0, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !21
  %106 = fmul contract float %101, %105
  %107 = fadd contract float %92, %106
  %108 = or i32 %77, 2
  %109 = add nsw i32 %108, %56
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !17, !amdgpu.noclobber !5
  %113 = add nsw i32 %112, %57
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !21
  %117 = add nsw i32 %112, %74
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !21
  %121 = fmul contract float %116, %120
  %122 = fadd contract float %107, %121
  %123 = or i32 %77, 3
  %124 = add nsw i32 %123, %56
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !17, !amdgpu.noclobber !5
  %128 = add nsw i32 %127, %57
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !21
  %132 = add nsw i32 %127, %74
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !21
  %136 = fmul contract float %131, %135
  %137 = fadd contract float %122, %136
  %138 = or i32 %77, 4
  %139 = add nsw i32 %138, %56
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !17, !amdgpu.noclobber !5
  %143 = add nsw i32 %142, %57
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %0, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !21
  %147 = add nsw i32 %142, %74
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !21
  %151 = fmul contract float %146, %150
  %152 = fadd contract float %137, %151
  %153 = or i32 %77, 5
  %154 = add nsw i32 %153, %56
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %155
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !17, !amdgpu.noclobber !5
  %158 = add nsw i32 %157, %57
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds float, float addrspace(1)* %0, i64 %159
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !21
  %162 = add nsw i32 %157, %74
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !21
  %166 = fmul contract float %161, %165
  %167 = fadd contract float %152, %166
  %168 = or i32 %77, 6
  %169 = add nsw i32 %168, %56
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %170
  %172 = load i32, i32 addrspace(1)* %171, align 4, !tbaa !17, !amdgpu.noclobber !5
  %173 = add nsw i32 %172, %57
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %0, i64 %174
  %176 = load float, float addrspace(1)* %175, align 4, !tbaa !21
  %177 = add nsw i32 %172, %74
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  %180 = load float, float addrspace(1)* %179, align 4, !tbaa !21
  %181 = fmul contract float %176, %180
  %182 = fadd contract float %167, %181
  %183 = or i32 %77, 7
  %184 = add nsw i32 %183, %56
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %185
  %187 = load i32, i32 addrspace(1)* %186, align 4, !tbaa !17, !amdgpu.noclobber !5
  %188 = add nsw i32 %187, %57
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %0, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !21
  %192 = add nsw i32 %187, %74
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %0, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !21
  %196 = fmul contract float %191, %195
  %197 = fadd contract float %182, %196
  %198 = add nuw nsw i32 %77, 8
  %199 = add i32 %78, 8
  %200 = icmp eq i32 %199, %66
  br i1 %200, label %201, label %75, !llvm.loop !23

201:                                              ; preds = %75, %70
  %202 = phi float [ undef, %70 ], [ %197, %75 ]
  %203 = phi float [ 0.000000e+00, %70 ], [ %197, %75 ]
  %204 = phi i32 [ 0, %70 ], [ %198, %75 ]
  br i1 %67, label %226, label %205

205:                                              ; preds = %201, %205
  %206 = phi float [ %222, %205 ], [ %203, %201 ]
  %207 = phi i32 [ %223, %205 ], [ %204, %201 ]
  %208 = phi i32 [ %224, %205 ], [ 0, %201 ]
  %209 = add nsw i32 %207, %56
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %210
  %212 = load i32, i32 addrspace(1)* %211, align 4, !tbaa !17, !amdgpu.noclobber !5
  %213 = add nsw i32 %212, %57
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds float, float addrspace(1)* %0, i64 %214
  %216 = load float, float addrspace(1)* %215, align 4, !tbaa !21
  %217 = add nsw i32 %212, %74
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %0, i64 %218
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !21
  %221 = fmul contract float %216, %220
  %222 = fadd contract float %206, %221
  %223 = add nuw nsw i32 %207, 1
  %224 = add i32 %208, 1
  %225 = icmp eq i32 %224, %64
  br i1 %225, label %226, label %205, !llvm.loop !25

226:                                              ; preds = %201, %205, %68
  %227 = phi float [ 0.000000e+00, %68 ], [ %202, %201 ], [ %222, %205 ]
  %228 = fadd contract float %227, 1.000000e+00
  br i1 %36, label %229, label %252

229:                                              ; preds = %226
  br i1 %44, label %243, label %230

230:                                              ; preds = %229, %230
  %231 = phi float [ %240, %230 ], [ 1.000000e+00, %229 ]
  %232 = phi i32 [ %241, %230 ], [ 0, %229 ]
  %233 = fmul contract float %228, %231
  %234 = fmul contract float %228, %233
  %235 = fmul contract float %228, %234
  %236 = fmul contract float %228, %235
  %237 = fmul contract float %228, %236
  %238 = fmul contract float %228, %237
  %239 = fmul contract float %228, %238
  %240 = fmul contract float %228, %239
  %241 = add i32 %232, 8
  %242 = icmp eq i32 %241, %45
  br i1 %242, label %243, label %230, !llvm.loop !27

243:                                              ; preds = %230, %229
  %244 = phi float [ undef, %229 ], [ %240, %230 ]
  %245 = phi float [ 1.000000e+00, %229 ], [ %240, %230 ]
  br i1 %46, label %252, label %246

246:                                              ; preds = %243, %246
  %247 = phi float [ %249, %246 ], [ %245, %243 ]
  %248 = phi i32 [ %250, %246 ], [ 0, %243 ]
  %249 = fmul contract float %228, %247
  %250 = add i32 %248, 1
  %251 = icmp eq i32 %250, %43
  br i1 %251, label %252, label %246, !llvm.loop !28

252:                                              ; preds = %243, %246, %226
  %253 = phi float [ 1.000000e+00, %226 ], [ %244, %243 ], [ %249, %246 ]
  %254 = mul nsw i32 %69, %2
  %255 = add nsw i32 %254, %48
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %1, i64 %256
  store float %253, float addrspace(1)* %257, align 4, !tbaa !21
  %258 = add i32 %63, %69
  %259 = icmp slt i32 %258, %4
  br i1 %259, label %68, label %260, !llvm.loop !29

260:                                              ; preds = %252, %47
  %261 = phi i32 [ %49, %47 ], [ %258, %252 ]
  %262 = add i32 %42, %48
  %263 = icmp slt i32 %262, %2
  br i1 %263, label %47, label %264, !llvm.loop !30

264:                                              ; preds = %260, %10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!7, !11, i64 16}
!17 = !{!18, !18, i64 0}
!18 = !{!"int", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C++ TBAA"}
!21 = !{!22, !22, i64 0}
!22 = !{!"float", !19, i64 0}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.mustprogress"}
!25 = distinct !{!25, !26}
!26 = !{!"llvm.loop.unroll.disable"}
!27 = distinct !{!27, !24}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !24}
!30 = distinct !{!30, !24}
