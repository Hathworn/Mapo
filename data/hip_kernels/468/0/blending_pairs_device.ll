; ModuleID = '../data/hip_kernels/468/0/main.cu'
source_filename = "../data/hip_kernels/468/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14blending_pairsPfS_S_S_S_iiifffi(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7, float %8, float %9, float %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = shl nsw i32 %14, 8
  %16 = add nsw i32 %15, %13
  %17 = mul nsw i32 %6, %5
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %28

19:                                               ; preds = %12
  %20 = fpext float %10 to double
  %21 = fmul contract double %20, 1.412000e+00
  %22 = sdiv i32 %7, 2
  %23 = add nsw i32 %5, -1
  %24 = add nsw i32 %6, -1
  %25 = mul nsw i32 %7, %7
  %26 = sitofp i32 %25 to float
  %27 = sitofp i32 %11 to float
  br label %29

28:                                               ; preds = %267, %12
  ret void

29:                                               ; preds = %19, %267
  %30 = phi i32 [ %16, %19 ], [ %268, %267 ]
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %4, i64 %31
  store float 0.000000e+00, float addrspace(1)* %32, align 4, !tbaa !5
  %33 = freeze i32 %30
  %34 = freeze i32 %5
  %35 = sdiv i32 %33, %34
  %36 = mul i32 %35, %34
  %37 = sub i32 %33, %36
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %31
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %40 = getelementptr inbounds float, float addrspace(1)* %1, i64 %31
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %42 = fsub contract float %39, %41
  %43 = fadd contract float %42, %9
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %31
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %46 = fsub contract float %39, %45
  %47 = fpext float %46 to double
  %48 = fadd contract double %21, %47
  %49 = fptrunc double %48 to float
  %50 = sub nsw i32 %37, %22
  %51 = tail call i32 @llvm.smax.i32(i32 %50, i32 0)
  %52 = add nsw i32 %37, %22
  %53 = tail call i32 @llvm.smin.i32(i32 %52, i32 %23)
  %54 = sub nsw i32 %35, %22
  %55 = tail call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = add nsw i32 %35, %22
  %57 = tail call i32 @llvm.smin.i32(i32 %56, i32 %24)
  %58 = icmp sgt i32 %55, %57
  br i1 %58, label %85, label %59

59:                                               ; preds = %29
  %60 = icmp sgt i32 %51, %53
  br label %61

61:                                               ; preds = %59, %80
  %62 = phi float [ 0.000000e+00, %59 ], [ %82, %80 ]
  %63 = phi float [ 0.000000e+00, %59 ], [ %81, %80 ]
  %64 = phi i32 [ %55, %59 ], [ %83, %80 ]
  br i1 %60, label %80, label %65

65:                                               ; preds = %61
  %66 = mul nsw i32 %64, %5
  br label %67

67:                                               ; preds = %65, %67
  %68 = phi float [ %62, %65 ], [ %77, %67 ]
  %69 = phi float [ %63, %65 ], [ %76, %67 ]
  %70 = phi i32 [ %51, %65 ], [ %78, %67 ]
  %71 = add nsw i32 %70, %66
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %1, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !5
  %75 = fmul contract float %74, %74
  %76 = fadd contract float %69, %75
  %77 = fadd contract float %68, %74
  %78 = add nuw nsw i32 %70, 1
  %79 = icmp slt i32 %70, %53
  br i1 %79, label %67, label %80, !llvm.loop !9

80:                                               ; preds = %67, %61
  %81 = phi float [ %63, %61 ], [ %76, %67 ]
  %82 = phi float [ %62, %61 ], [ %77, %67 ]
  %83 = add nuw nsw i32 %64, 1
  %84 = icmp slt i32 %64, %57
  br i1 %84, label %61, label %85, !llvm.loop !11

85:                                               ; preds = %80, %29
  %86 = phi float [ 0.000000e+00, %29 ], [ %81, %80 ]
  %87 = phi float [ 0.000000e+00, %29 ], [ %82, %80 ]
  %88 = fdiv contract float %86, %26
  %89 = fdiv contract float %87, %26
  %90 = fmul contract float %89, %89
  %91 = fsub contract float %88, %90
  %92 = fcmp olt float %91, 0x39F0000000000000
  %93 = select i1 %92, float 0x41F0000000000000, float 1.000000e+00
  %94 = fmul float %91, %93
  %95 = tail call float @llvm.sqrt.f32(float %94)
  %96 = bitcast float %95 to i32
  %97 = add nsw i32 %96, -1
  %98 = bitcast i32 %97 to float
  %99 = add nsw i32 %96, 1
  %100 = bitcast i32 %99 to float
  %101 = tail call i1 @llvm.amdgcn.class.f32(float %94, i32 608)
  %102 = select i1 %92, float 0x3EF0000000000000, float 1.000000e+00
  %103 = fneg float %100
  %104 = tail call float @llvm.fma.f32(float %103, float %95, float %94)
  %105 = fcmp ogt float %104, 0.000000e+00
  %106 = fneg float %98
  %107 = tail call float @llvm.fma.f32(float %106, float %95, float %94)
  %108 = fcmp ole float %107, 0.000000e+00
  %109 = select i1 %108, float %98, float %95
  %110 = select i1 %105, float %100, float %109
  %111 = fmul float %102, %110
  %112 = select i1 %101, float %94, float %111
  %113 = fdiv contract float %112, %27
  br i1 %58, label %226, label %114

114:                                              ; preds = %85
  %115 = icmp sgt i32 %51, %53
  %116 = fcmp contract ogt float %43, 0.000000e+00
  %117 = fcmp contract olt float %43, 0.000000e+00
  %118 = fcmp contract ogt float %49, 0.000000e+00
  %119 = fcmp contract olt float %49, 0.000000e+00
  br label %120

120:                                              ; preds = %114, %219
  %121 = phi float [ 0.000000e+00, %114 ], [ %220, %219 ]
  %122 = phi i32 [ 0, %114 ], [ %223, %219 ]
  %123 = phi float [ 0.000000e+00, %114 ], [ %222, %219 ]
  %124 = phi i32 [ 0, %114 ], [ %221, %219 ]
  %125 = phi i32 [ %55, %114 ], [ %224, %219 ]
  br i1 %115, label %219, label %126

126:                                              ; preds = %120
  %127 = mul nsw i32 %125, %5
  %128 = sub nsw i32 %35, %125
  %129 = mul nsw i32 %128, %128
  br label %130

130:                                              ; preds = %126, %212
  %131 = phi float [ %121, %126 ], [ %213, %212 ]
  %132 = phi i32 [ %122, %126 ], [ %216, %212 ]
  %133 = phi float [ %123, %126 ], [ %215, %212 ]
  %134 = phi i32 [ %124, %126 ], [ %214, %212 ]
  %135 = phi i32 [ %51, %126 ], [ %217, %212 ]
  %136 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %137 = add nsw i32 %135, %127
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !5
  %141 = fsub contract float %136, %140
  %142 = tail call float @llvm.fabs.f32(float %141)
  %143 = fcmp contract olt float %142, %113
  br i1 %143, label %144, label %212

144:                                              ; preds = %130
  %145 = getelementptr inbounds float, float addrspace(1)* %3, i64 %138
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !5
  %147 = fsub contract float %146, %140
  %148 = getelementptr inbounds float, float addrspace(1)* %2, i64 %138
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5
  %150 = fsub contract float %146, %149
  %151 = fcmp contract olt float %147, %43
  %152 = select i1 %116, i1 %151, i1 false
  %153 = fcmp contract ogt float %147, %43
  %154 = select i1 %117, i1 %153, i1 false
  %155 = select i1 %152, i1 true, i1 %154
  br i1 %155, label %156, label %212

156:                                              ; preds = %144
  %157 = fcmp contract olt float %150, %49
  %158 = select i1 %118, i1 %157, i1 false
  %159 = fcmp contract ogt float %150, %49
  %160 = select i1 %119, i1 %159, i1 false
  %161 = select i1 %158, i1 true, i1 %160
  br i1 %161, label %162, label %212

162:                                              ; preds = %156
  %163 = tail call float @llvm.fabs.f32(float %147)
  %164 = fpext float %163 to double
  %165 = fadd contract double %164, 1.000000e-04
  %166 = fptrunc double %165 to float
  %167 = tail call float @llvm.fabs.f32(float %150)
  %168 = fpext float %167 to double
  %169 = fadd contract double %168, 1.000000e-04
  %170 = fptrunc double %169 to float
  %171 = icmp eq i32 %30, %137
  %172 = select i1 %171, i32 1, i32 %134
  %173 = sub nsw i32 %37, %135
  %174 = mul nsw i32 %173, %173
  %175 = add nuw nsw i32 %174, %129
  %176 = sitofp i32 %175 to float
  %177 = icmp eq i32 %175, 0
  %178 = select i1 %177, float 0x41F0000000000000, float 1.000000e+00
  %179 = fmul float %178, %176
  %180 = tail call float @llvm.sqrt.f32(float %179)
  %181 = bitcast float %180 to i32
  %182 = add nsw i32 %181, -1
  %183 = bitcast i32 %182 to float
  %184 = add nsw i32 %181, 1
  %185 = bitcast i32 %184 to float
  %186 = tail call i1 @llvm.amdgcn.class.f32(float %179, i32 608)
  %187 = select i1 %177, float 0x3EF0000000000000, float 1.000000e+00
  %188 = fneg float %185
  %189 = tail call float @llvm.fma.f32(float %188, float %180, float %179)
  %190 = fcmp ogt float %189, 0.000000e+00
  %191 = fneg float %183
  %192 = tail call float @llvm.fma.f32(float %191, float %180, float %179)
  %193 = fcmp ole float %192, 0.000000e+00
  %194 = select i1 %193, float %183, float %180
  %195 = select i1 %190, float %185, float %194
  %196 = fmul float %187, %195
  %197 = select i1 %186, float %179, float %196
  %198 = fdiv contract float %197, %8
  %199 = fadd contract float %198, 1.000000e+00
  %200 = fmul contract float %199, %166
  %201 = fmul contract float %200, %170
  %202 = fdiv contract float 1.000000e+00, %201
  %203 = fadd contract float %202, %131
  store float %203, float addrspace(1)* %32, align 4, !tbaa !5
  %204 = load float, float addrspace(1)* %148, align 4, !tbaa !5
  %205 = load float, float addrspace(1)* %139, align 4, !tbaa !5
  %206 = fadd contract float %204, %205
  %207 = load float, float addrspace(1)* %145, align 4, !tbaa !5
  %208 = fsub contract float %206, %207
  %209 = fmul contract float %202, %208
  %210 = fadd contract float %133, %209
  %211 = add nsw i32 %132, 1
  br label %212

212:                                              ; preds = %156, %144, %130, %162
  %213 = phi float [ %203, %162 ], [ %131, %130 ], [ %131, %144 ], [ %131, %156 ]
  %214 = phi i32 [ %172, %162 ], [ %134, %130 ], [ %134, %144 ], [ %134, %156 ]
  %215 = phi float [ %210, %162 ], [ %133, %130 ], [ %133, %144 ], [ %133, %156 ]
  %216 = phi i32 [ %211, %162 ], [ %132, %130 ], [ %132, %144 ], [ %132, %156 ]
  %217 = add nuw nsw i32 %135, 1
  %218 = icmp slt i32 %135, %53
  br i1 %218, label %130, label %219, !llvm.loop !12

219:                                              ; preds = %212, %120
  %220 = phi float [ %121, %120 ], [ %213, %212 ]
  %221 = phi i32 [ %124, %120 ], [ %214, %212 ]
  %222 = phi float [ %123, %120 ], [ %215, %212 ]
  %223 = phi i32 [ %122, %120 ], [ %216, %212 ]
  %224 = add nuw nsw i32 %125, 1
  %225 = icmp slt i32 %125, %57
  br i1 %225, label %120, label %226, !llvm.loop !13

226:                                              ; preds = %219, %85
  %227 = phi float [ 0.000000e+00, %85 ], [ %220, %219 ]
  %228 = phi i32 [ 0, %85 ], [ %221, %219 ]
  %229 = phi float [ 0.000000e+00, %85 ], [ %222, %219 ]
  %230 = phi i32 [ 0, %85 ], [ %223, %219 ]
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %232, label %241

232:                                              ; preds = %226
  %233 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %234 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %235 = fadd contract float %233, %234
  %236 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %237 = fsub contract float %235, %236
  %238 = tail call float @llvm.fabs.f32(float %237)
  %239 = fmul contract float %238, 1.000000e+03
  %240 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  store float %239, float addrspace(1)* %240, align 4, !tbaa !5
  store float 1.000000e+03, float addrspace(1)* %32, align 4, !tbaa !5
  br label %267

241:                                              ; preds = %226
  %242 = icmp eq i32 %228, 0
  br i1 %242, label %243, label %264

243:                                              ; preds = %241
  %244 = load float, float addrspace(1)* %38, align 4, !tbaa !5
  %245 = load float, float addrspace(1)* %40, align 4, !tbaa !5
  %246 = fsub contract float %244, %245
  %247 = tail call float @llvm.fabs.f32(float %246)
  %248 = fpext float %247 to double
  %249 = fadd contract double %248, 1.000000e-04
  %250 = fptrunc double %249 to float
  %251 = load float, float addrspace(1)* %44, align 4, !tbaa !5
  %252 = fsub contract float %244, %251
  %253 = tail call float @llvm.fabs.f32(float %252)
  %254 = fpext float %253 to double
  %255 = fadd contract double %254, 1.000000e-04
  %256 = fptrunc double %255 to float
  %257 = fmul contract float %250, %256
  %258 = fdiv contract float 1.000000e+00, %257
  %259 = fadd contract float %245, %251
  %260 = fsub contract float %259, %244
  %261 = fmul contract float %260, %258
  %262 = fadd contract float %229, %261
  %263 = fadd contract float %227, %258
  store float %263, float addrspace(1)* %32, align 4, !tbaa !5
  br label %264

264:                                              ; preds = %243, %241
  %265 = phi float [ %262, %243 ], [ %229, %241 ]
  %266 = getelementptr inbounds float, float addrspace(1)* %0, i64 %31
  store float %265, float addrspace(1)* %266, align 4, !tbaa !5
  br label %267

267:                                              ; preds = %232, %264
  %268 = add nsw i32 %30, 65536
  %269 = icmp slt i32 %268, %17
  br i1 %269, label %29, label %28, !llvm.loop !14
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
