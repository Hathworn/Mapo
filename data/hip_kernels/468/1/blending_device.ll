; ModuleID = '../data/hip_kernels/468/1/main.cu'
source_filename = "../data/hip_kernels/468/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8blendingPfS_S_S_iiifffi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float %7, float %8, float %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = shl nsw i32 %13, 8
  %15 = add nsw i32 %14, %12
  %16 = mul nsw i32 %5, %4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %27

18:                                               ; preds = %11
  %19 = fpext float %9 to double
  %20 = fmul contract double %19, 1.412000e+00
  %21 = sdiv i32 %6, 2
  %22 = add nsw i32 %4, -1
  %23 = add nsw i32 %5, -1
  %24 = mul nsw i32 %6, %6
  %25 = sitofp i32 %24 to float
  %26 = sitofp i32 %10 to float
  br label %28

27:                                               ; preds = %252, %11
  ret void

28:                                               ; preds = %18, %252
  %29 = phi i32 [ %15, %18 ], [ %255, %252 ]
  %30 = freeze i32 %29
  %31 = freeze i32 %4
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = sext i32 %29 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %3, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !5
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %40 = fsub contract float %37, %39
  %41 = fadd contract float %40, %8
  %42 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !5
  %44 = fsub contract float %37, %43
  %45 = fpext float %44 to double
  %46 = fadd contract double %20, %45
  %47 = fptrunc double %46 to float
  %48 = sub nsw i32 %34, %21
  %49 = tail call i32 @llvm.smax.i32(i32 %48, i32 0)
  %50 = add nsw i32 %34, %21
  %51 = tail call i32 @llvm.smin.i32(i32 %50, i32 %22)
  %52 = sub nsw i32 %32, %21
  %53 = tail call i32 @llvm.smax.i32(i32 %52, i32 0)
  %54 = add nsw i32 %32, %21
  %55 = tail call i32 @llvm.smin.i32(i32 %54, i32 %23)
  %56 = icmp sgt i32 %53, %55
  br i1 %56, label %83, label %57

57:                                               ; preds = %28
  %58 = icmp sgt i32 %49, %51
  br label %59

59:                                               ; preds = %57, %78
  %60 = phi float [ 0.000000e+00, %57 ], [ %80, %78 ]
  %61 = phi float [ 0.000000e+00, %57 ], [ %79, %78 ]
  %62 = phi i32 [ %53, %57 ], [ %81, %78 ]
  br i1 %58, label %78, label %63

63:                                               ; preds = %59
  %64 = mul nsw i32 %62, %4
  br label %65

65:                                               ; preds = %63, %65
  %66 = phi float [ %60, %63 ], [ %75, %65 ]
  %67 = phi float [ %61, %63 ], [ %74, %65 ]
  %68 = phi i32 [ %49, %63 ], [ %76, %65 ]
  %69 = add nsw i32 %68, %64
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %1, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !5
  %73 = fmul contract float %72, %72
  %74 = fadd contract float %67, %73
  %75 = fadd contract float %66, %72
  %76 = add nuw nsw i32 %68, 1
  %77 = icmp slt i32 %68, %51
  br i1 %77, label %65, label %78, !llvm.loop !9

78:                                               ; preds = %65, %59
  %79 = phi float [ %61, %59 ], [ %74, %65 ]
  %80 = phi float [ %60, %59 ], [ %75, %65 ]
  %81 = add nuw nsw i32 %62, 1
  %82 = icmp slt i32 %62, %55
  br i1 %82, label %59, label %83, !llvm.loop !11

83:                                               ; preds = %78, %28
  %84 = phi float [ 0.000000e+00, %28 ], [ %79, %78 ]
  %85 = phi float [ 0.000000e+00, %28 ], [ %80, %78 ]
  %86 = fdiv contract float %84, %25
  %87 = fdiv contract float %85, %25
  %88 = fmul contract float %87, %87
  %89 = fsub contract float %86, %88
  %90 = fcmp olt float %89, 0x39F0000000000000
  %91 = select i1 %90, float 0x41F0000000000000, float 1.000000e+00
  %92 = fmul float %89, %91
  %93 = tail call float @llvm.sqrt.f32(float %92)
  %94 = bitcast float %93 to i32
  %95 = add nsw i32 %94, -1
  %96 = bitcast i32 %95 to float
  %97 = add nsw i32 %94, 1
  %98 = bitcast i32 %97 to float
  %99 = tail call i1 @llvm.amdgcn.class.f32(float %92, i32 608)
  %100 = select i1 %90, float 0x3EF0000000000000, float 1.000000e+00
  %101 = fneg float %98
  %102 = tail call float @llvm.fma.f32(float %101, float %93, float %92)
  %103 = fcmp ogt float %102, 0.000000e+00
  %104 = fneg float %96
  %105 = tail call float @llvm.fma.f32(float %104, float %93, float %92)
  %106 = fcmp ole float %105, 0.000000e+00
  %107 = select i1 %106, float %96, float %93
  %108 = select i1 %103, float %98, float %107
  %109 = fmul float %100, %108
  %110 = select i1 %99, float %92, float %109
  %111 = fdiv contract float %110, %26
  br i1 %56, label %220, label %112

112:                                              ; preds = %83
  %113 = icmp sgt i32 %49, %51
  %114 = fcmp contract ogt float %41, 0.000000e+00
  %115 = fcmp contract olt float %41, 0.000000e+00
  %116 = fcmp contract ogt float %47, 0.000000e+00
  %117 = fcmp contract olt float %47, 0.000000e+00
  br label %118

118:                                              ; preds = %112, %213
  %119 = phi i32 [ 0, %112 ], [ %217, %213 ]
  %120 = phi float [ 0.000000e+00, %112 ], [ %216, %213 ]
  %121 = phi float [ 0.000000e+00, %112 ], [ %215, %213 ]
  %122 = phi i32 [ 0, %112 ], [ %214, %213 ]
  %123 = phi i32 [ %53, %112 ], [ %218, %213 ]
  br i1 %113, label %213, label %124

124:                                              ; preds = %118
  %125 = mul nsw i32 %123, %4
  %126 = sub nsw i32 %32, %123
  %127 = mul nsw i32 %126, %126
  br label %128

128:                                              ; preds = %124, %206
  %129 = phi i32 [ %119, %124 ], [ %210, %206 ]
  %130 = phi float [ %120, %124 ], [ %209, %206 ]
  %131 = phi float [ %121, %124 ], [ %208, %206 ]
  %132 = phi i32 [ %122, %124 ], [ %207, %206 ]
  %133 = phi i32 [ %49, %124 ], [ %211, %206 ]
  %134 = add nsw i32 %133, %125
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %1, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !5
  %138 = fsub contract float %39, %137
  %139 = tail call float @llvm.fabs.f32(float %138)
  %140 = fcmp contract olt float %139, %111
  br i1 %140, label %141, label %206

141:                                              ; preds = %128
  %142 = getelementptr inbounds float, float addrspace(1)* %3, i64 %135
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !5
  %144 = fsub contract float %143, %137
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %135
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5
  %147 = fsub contract float %143, %146
  %148 = fcmp contract olt float %144, %41
  %149 = select i1 %114, i1 %148, i1 false
  %150 = fcmp contract ogt float %144, %41
  %151 = select i1 %115, i1 %150, i1 false
  %152 = select i1 %149, i1 true, i1 %151
  br i1 %152, label %153, label %206

153:                                              ; preds = %141
  %154 = fcmp contract olt float %147, %47
  %155 = select i1 %116, i1 %154, i1 false
  %156 = fcmp contract ogt float %147, %47
  %157 = select i1 %117, i1 %156, i1 false
  %158 = select i1 %155, i1 true, i1 %157
  br i1 %158, label %159, label %206

159:                                              ; preds = %153
  %160 = tail call float @llvm.fabs.f32(float %144)
  %161 = fpext float %160 to double
  %162 = fadd contract double %161, 1.000000e-04
  %163 = fptrunc double %162 to float
  %164 = tail call float @llvm.fabs.f32(float %147)
  %165 = fpext float %164 to double
  %166 = fadd contract double %165, 1.000000e-04
  %167 = fptrunc double %166 to float
  %168 = icmp eq i32 %29, %134
  %169 = select i1 %168, i32 1, i32 %132
  %170 = sub nsw i32 %34, %133
  %171 = mul nsw i32 %170, %170
  %172 = add nuw nsw i32 %171, %127
  %173 = sitofp i32 %172 to float
  %174 = icmp eq i32 %172, 0
  %175 = select i1 %174, float 0x41F0000000000000, float 1.000000e+00
  %176 = fmul float %175, %173
  %177 = tail call float @llvm.sqrt.f32(float %176)
  %178 = bitcast float %177 to i32
  %179 = add nsw i32 %178, -1
  %180 = bitcast i32 %179 to float
  %181 = add nsw i32 %178, 1
  %182 = bitcast i32 %181 to float
  %183 = tail call i1 @llvm.amdgcn.class.f32(float %176, i32 608)
  %184 = select i1 %174, float 0x3EF0000000000000, float 1.000000e+00
  %185 = fneg float %182
  %186 = tail call float @llvm.fma.f32(float %185, float %177, float %176)
  %187 = fcmp ogt float %186, 0.000000e+00
  %188 = fneg float %180
  %189 = tail call float @llvm.fma.f32(float %188, float %177, float %176)
  %190 = fcmp ole float %189, 0.000000e+00
  %191 = select i1 %190, float %180, float %177
  %192 = select i1 %187, float %182, float %191
  %193 = fmul float %184, %192
  %194 = select i1 %183, float %176, float %193
  %195 = fdiv contract float %194, %7
  %196 = fadd contract float %195, 1.000000e+00
  %197 = fmul contract float %196, %163
  %198 = fmul contract float %197, %167
  %199 = fdiv contract float 1.000000e+00, %198
  %200 = fadd contract float %131, %199
  %201 = fadd contract float %137, %146
  %202 = fsub contract float %201, %143
  %203 = fmul contract float %202, %199
  %204 = fadd contract float %130, %203
  %205 = add nsw i32 %129, 1
  br label %206

206:                                              ; preds = %153, %141, %128, %159
  %207 = phi i32 [ %169, %159 ], [ %132, %128 ], [ %132, %141 ], [ %132, %153 ]
  %208 = phi float [ %200, %159 ], [ %131, %128 ], [ %131, %141 ], [ %131, %153 ]
  %209 = phi float [ %204, %159 ], [ %130, %128 ], [ %130, %141 ], [ %130, %153 ]
  %210 = phi i32 [ %205, %159 ], [ %129, %128 ], [ %129, %141 ], [ %129, %153 ]
  %211 = add nuw nsw i32 %133, 1
  %212 = icmp slt i32 %133, %51
  br i1 %212, label %128, label %213, !llvm.loop !12

213:                                              ; preds = %206, %118
  %214 = phi i32 [ %122, %118 ], [ %207, %206 ]
  %215 = phi float [ %121, %118 ], [ %208, %206 ]
  %216 = phi float [ %120, %118 ], [ %209, %206 ]
  %217 = phi i32 [ %119, %118 ], [ %210, %206 ]
  %218 = add nuw nsw i32 %123, 1
  %219 = icmp slt i32 %123, %55
  br i1 %219, label %118, label %220, !llvm.loop !13

220:                                              ; preds = %213, %83
  %221 = phi i32 [ 0, %83 ], [ %214, %213 ]
  %222 = phi float [ 0.000000e+00, %83 ], [ %215, %213 ]
  %223 = phi float [ 0.000000e+00, %83 ], [ %216, %213 ]
  %224 = phi i32 [ 0, %83 ], [ %217, %213 ]
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %226, label %230

226:                                              ; preds = %220
  %227 = fadd contract float %39, %43
  %228 = fsub contract float %227, %37
  %229 = tail call float @llvm.fabs.f32(float %228)
  br label %252

230:                                              ; preds = %220
  %231 = icmp eq i32 %221, 0
  br i1 %231, label %232, label %248

232:                                              ; preds = %230
  %233 = tail call float @llvm.fabs.f32(float %40)
  %234 = fpext float %233 to double
  %235 = fadd contract double %234, 1.000000e-04
  %236 = fptrunc double %235 to float
  %237 = tail call float @llvm.fabs.f32(float %44)
  %238 = fpext float %237 to double
  %239 = fadd contract double %238, 1.000000e-04
  %240 = fptrunc double %239 to float
  %241 = fmul contract float %236, %240
  %242 = fdiv contract float 1.000000e+00, %241
  %243 = fadd contract float %39, %43
  %244 = fsub contract float %243, %37
  %245 = fmul contract float %244, %242
  %246 = fadd contract float %245, %223
  %247 = fadd contract float %242, %222
  br label %248

248:                                              ; preds = %232, %230
  %249 = phi float [ %247, %232 ], [ %222, %230 ]
  %250 = phi float [ %246, %232 ], [ %223, %230 ]
  %251 = fdiv contract float %250, %249
  br label %252

252:                                              ; preds = %226, %248
  %253 = phi float [ %229, %226 ], [ %251, %248 ]
  %254 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  store float %253, float addrspace(1)* %254, align 4, !tbaa !5
  %255 = add nsw i32 %29, 65536
  %256 = icmp slt i32 %255, %16
  br i1 %256, label %28, label %27, !llvm.loop !14
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
