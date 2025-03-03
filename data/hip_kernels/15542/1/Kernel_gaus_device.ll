; ModuleID = '../data/hip_kernels/15542/1/main.cu'
source_filename = "../data/hip_kernels/15542/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11Kernel_gausPfS_S_iiiPifS0_S0_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 addrspace(1)* nocapture readonly %6, float %7, i32 addrspace(1)* nocapture readonly %8, i32 addrspace(1)* nocapture readonly %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !6
  %21 = mul i32 %12, %17
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !4, !invariant.load !5
  %27 = zext i16 %26 to i32
  %28 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 16
  %29 = bitcast i8 addrspace(4)* %28 to i32 addrspace(4)*
  %30 = load i32, i32 addrspace(4)* %29, align 8, !tbaa !16
  %31 = icmp slt i32 %23, %3
  br i1 %31, label %32, label %262

32:                                               ; preds = %11
  %33 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %34 = mul i32 %33, %27
  %35 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %36 = add i32 %34, %35
  %37 = udiv i32 %20, %17
  %38 = mul i32 %37, %17
  %39 = icmp ugt i32 %20, %38
  %40 = zext i1 %39 to i32
  %41 = add i32 %37, %40
  %42 = mul i32 %41, %17
  br label %43

43:                                               ; preds = %32, %258
  %44 = phi i32 [ %23, %32 ], [ %260, %258 ]
  %45 = phi i32 [ %36, %32 ], [ %259, %258 ]
  %46 = icmp slt i32 %45, %5
  br i1 %46, label %47, label %258

47:                                               ; preds = %43
  %48 = sext i32 %44 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %9, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !17, !amdgpu.noclobber !5
  %51 = icmp sgt i32 %50, 0
  %52 = mul nsw i32 %44, %10
  %53 = mul nsw i32 %44, %4
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %48
  %55 = udiv i32 %30, %27
  %56 = mul i32 %55, %27
  %57 = icmp ugt i32 %30, %56
  %58 = zext i1 %57 to i32
  %59 = add i32 %55, %58
  %60 = mul i32 %59, %27
  %61 = and i32 %50, 7
  %62 = icmp ult i32 %50, 8
  %63 = and i32 %50, -8
  %64 = icmp eq i32 %61, 0
  br label %65

65:                                               ; preds = %47, %223
  %66 = phi i32 [ %45, %47 ], [ %256, %223 ]
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !17, !amdgpu.noclobber !5
  br i1 %51, label %70, label %223

70:                                               ; preds = %65
  %71 = mul nsw i32 %69, %4
  br i1 %62, label %198, label %72

72:                                               ; preds = %70, %72
  %73 = phi float [ %194, %72 ], [ 0.000000e+00, %70 ]
  %74 = phi i32 [ %195, %72 ], [ 0, %70 ]
  %75 = phi i32 [ %196, %72 ], [ 0, %70 ]
  %76 = add nsw i32 %74, %52
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !17, !amdgpu.noclobber !5
  %80 = add nsw i32 %79, %53
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !21
  %84 = add nsw i32 %79, %71
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !21
  %88 = fmul contract float %83, %87
  %89 = fadd contract float %73, %88
  %90 = or i32 %74, 1
  %91 = add nsw i32 %90, %52
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !17, !amdgpu.noclobber !5
  %95 = add nsw i32 %94, %53
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %0, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !21
  %99 = add nsw i32 %94, %71
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !21
  %103 = fmul contract float %98, %102
  %104 = fadd contract float %89, %103
  %105 = or i32 %74, 2
  %106 = add nsw i32 %105, %52
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !17, !amdgpu.noclobber !5
  %110 = add nsw i32 %109, %53
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float addrspace(1)* %0, i64 %111
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !21
  %114 = add nsw i32 %109, %71
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %0, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !21
  %118 = fmul contract float %113, %117
  %119 = fadd contract float %104, %118
  %120 = or i32 %74, 3
  %121 = add nsw i32 %120, %52
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !17, !amdgpu.noclobber !5
  %125 = add nsw i32 %124, %53
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %0, i64 %126
  %128 = load float, float addrspace(1)* %127, align 4, !tbaa !21
  %129 = add nsw i32 %124, %71
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds float, float addrspace(1)* %0, i64 %130
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !21
  %133 = fmul contract float %128, %132
  %134 = fadd contract float %119, %133
  %135 = or i32 %74, 4
  %136 = add nsw i32 %135, %52
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %137
  %139 = load i32, i32 addrspace(1)* %138, align 4, !tbaa !17, !amdgpu.noclobber !5
  %140 = add nsw i32 %139, %53
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %0, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !21
  %144 = add nsw i32 %139, %71
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !21
  %148 = fmul contract float %143, %147
  %149 = fadd contract float %134, %148
  %150 = or i32 %74, 5
  %151 = add nsw i32 %150, %52
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !17, !amdgpu.noclobber !5
  %155 = add nsw i32 %154, %53
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %0, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !21
  %159 = add nsw i32 %154, %71
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %0, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !21
  %163 = fmul contract float %158, %162
  %164 = fadd contract float %149, %163
  %165 = or i32 %74, 6
  %166 = add nsw i32 %165, %52
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %167
  %169 = load i32, i32 addrspace(1)* %168, align 4, !tbaa !17, !amdgpu.noclobber !5
  %170 = add nsw i32 %169, %53
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %0, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !21
  %174 = add nsw i32 %169, %71
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !21
  %178 = fmul contract float %173, %177
  %179 = fadd contract float %164, %178
  %180 = or i32 %74, 7
  %181 = add nsw i32 %180, %52
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %182
  %184 = load i32, i32 addrspace(1)* %183, align 4, !tbaa !17, !amdgpu.noclobber !5
  %185 = add nsw i32 %184, %53
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %0, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !21
  %189 = add nsw i32 %184, %71
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %0, i64 %190
  %192 = load float, float addrspace(1)* %191, align 4, !tbaa !21
  %193 = fmul contract float %188, %192
  %194 = fadd contract float %179, %193
  %195 = add nuw nsw i32 %74, 8
  %196 = add i32 %75, 8
  %197 = icmp eq i32 %196, %63
  br i1 %197, label %198, label %72, !llvm.loop !23

198:                                              ; preds = %72, %70
  %199 = phi float [ undef, %70 ], [ %194, %72 ]
  %200 = phi float [ 0.000000e+00, %70 ], [ %194, %72 ]
  %201 = phi i32 [ 0, %70 ], [ %195, %72 ]
  br i1 %64, label %223, label %202

202:                                              ; preds = %198, %202
  %203 = phi float [ %219, %202 ], [ %200, %198 ]
  %204 = phi i32 [ %220, %202 ], [ %201, %198 ]
  %205 = phi i32 [ %221, %202 ], [ 0, %198 ]
  %206 = add nsw i32 %204, %52
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %207
  %209 = load i32, i32 addrspace(1)* %208, align 4, !tbaa !17, !amdgpu.noclobber !5
  %210 = add nsw i32 %209, %53
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds float, float addrspace(1)* %0, i64 %211
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !21
  %214 = add nsw i32 %209, %71
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds float, float addrspace(1)* %0, i64 %215
  %217 = load float, float addrspace(1)* %216, align 4, !tbaa !21
  %218 = fmul contract float %213, %217
  %219 = fadd contract float %203, %218
  %220 = add nuw nsw i32 %204, 1
  %221 = add i32 %205, 1
  %222 = icmp eq i32 %221, %61
  br i1 %222, label %223, label %202, !llvm.loop !25

223:                                              ; preds = %198, %202, %65
  %224 = phi float [ 0.000000e+00, %65 ], [ %199, %198 ], [ %219, %202 ]
  %225 = fpext float %224 to double
  %226 = fmul contract double %225, 2.000000e+00
  %227 = load float, float addrspace(1)* %54, align 4, !tbaa !21
  %228 = fpext float %227 to double
  %229 = fsub contract double %228, %226
  %230 = sext i32 %69 to i64
  %231 = getelementptr inbounds float, float addrspace(1)* %2, i64 %230
  %232 = load float, float addrspace(1)* %231, align 4, !tbaa !21
  %233 = fpext float %232 to double
  %234 = fadd contract double %229, %233
  %235 = fptrunc double %234 to float
  %236 = fneg contract float %235
  %237 = fmul contract float %236, %7
  %238 = fmul float %237, 0x3FF7154760000000
  %239 = tail call float @llvm.rint.f32(float %238)
  %240 = fcmp ogt float %237, 0x40562E4300000000
  %241 = fcmp olt float %237, 0xC059D1DA00000000
  %242 = fneg float %238
  %243 = tail call float @llvm.fma.f32(float %237, float 0x3FF7154760000000, float %242)
  %244 = tail call float @llvm.fma.f32(float %237, float 0x3E54AE0BE0000000, float %243)
  %245 = fsub float %238, %239
  %246 = fadd float %244, %245
  %247 = tail call float @llvm.exp2.f32(float %246)
  %248 = fptosi float %239 to i32
  %249 = tail call float @llvm.amdgcn.ldexp.f32(float %247, i32 %248)
  %250 = select i1 %241, float 0.000000e+00, float %249
  %251 = select i1 %240, float 0x7FF0000000000000, float %250
  %252 = mul nsw i32 %66, %3
  %253 = add nsw i32 %252, %44
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds float, float addrspace(1)* %1, i64 %254
  store float %251, float addrspace(1)* %255, align 4, !tbaa !21
  %256 = add i32 %60, %66
  %257 = icmp slt i32 %256, %5
  br i1 %257, label %65, label %258, !llvm.loop !27

258:                                              ; preds = %223, %43
  %259 = phi i32 [ %45, %43 ], [ %256, %223 ]
  %260 = add i32 %42, %44
  %261 = icmp slt i32 %260, %3
  br i1 %261, label %43, label %262, !llvm.loop !28

262:                                              ; preds = %258, %11
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!28 = distinct !{!28, !24}
