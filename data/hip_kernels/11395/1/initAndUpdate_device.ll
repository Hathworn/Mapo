; ModuleID = '../data/hip_kernels/11395/1/main.cu'
source_filename = "../data/hip_kernels/11395/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13initAndUpdatePfS_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %264

15:                                               ; preds = %4
  %16 = add nsw i32 %13, 1
  %17 = sitofp i32 %13 to float
  %18 = add nsw i32 %2, -1
  %19 = sitofp i32 %18 to float
  %20 = fdiv contract float %17, %19
  %21 = fmul contract float %20, 0x401921FB60000000
  %22 = tail call float @llvm.fabs.f32(float %21)
  %23 = fcmp olt float %22, 1.310720e+05
  br i1 %23, label %24, label %32

24:                                               ; preds = %15
  %25 = fmul float %22, 0x3FE45F3060000000
  %26 = tail call float @llvm.rint.f32(float %25)
  %27 = tail call float @llvm.fma.f32(float %26, float 0xBFF921FB40000000, float %22)
  %28 = tail call float @llvm.fma.f32(float %26, float 0xBE74442D00000000, float %27)
  %29 = tail call float @llvm.fma.f32(float %26, float 0xBCF8469880000000, float %28)
  %30 = fptosi float %26 to i32
  %31 = bitcast float %22 to i32
  br label %138

32:                                               ; preds = %15
  %33 = bitcast float %22 to i32
  %34 = lshr i32 %33, 23
  %35 = and i32 %33, 8388607
  %36 = or i32 %35, 8388608
  %37 = zext i32 %36 to i64
  %38 = mul nuw nsw i64 %37, 4266746795
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = mul nuw nsw i64 %37, 1011060801
  %42 = add nuw nsw i64 %40, %41
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = mul nuw nsw i64 %37, 3680671129
  %46 = add nuw nsw i64 %44, %45
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %37, 4113882560
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %37, 4230436817
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %37, 1313084713
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %37, 2734261102
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = trunc i64 %64 to i32
  %66 = add nsw i32 %34, -120
  %67 = icmp ugt i32 %66, 63
  %68 = select i1 %67, i32 %59, i32 %65
  %69 = select i1 %67, i32 %55, i32 %63
  %70 = select i1 %67, i32 %51, i32 %59
  %71 = select i1 %67, i32 %47, i32 %55
  %72 = select i1 %67, i32 %43, i32 %51
  %73 = select i1 %67, i32 %39, i32 %47
  %74 = select i1 %67, i32 -64, i32 0
  %75 = add nsw i32 %74, %66
  %76 = icmp ugt i32 %75, 31
  %77 = select i1 %76, i32 %69, i32 %68
  %78 = select i1 %76, i32 %70, i32 %69
  %79 = select i1 %76, i32 %71, i32 %70
  %80 = select i1 %76, i32 %72, i32 %71
  %81 = select i1 %76, i32 %73, i32 %72
  %82 = select i1 %76, i32 -32, i32 0
  %83 = add nsw i32 %82, %75
  %84 = icmp ugt i32 %83, 31
  %85 = select i1 %84, i32 %78, i32 %77
  %86 = select i1 %84, i32 %79, i32 %78
  %87 = select i1 %84, i32 %80, i32 %79
  %88 = select i1 %84, i32 %81, i32 %80
  %89 = select i1 %84, i32 -32, i32 0
  %90 = add nsw i32 %89, %83
  %91 = icmp eq i32 %90, 0
  %92 = sub nsw i32 32, %90
  %93 = tail call i32 @llvm.fshr.i32(i32 %85, i32 %86, i32 %92)
  %94 = tail call i32 @llvm.fshr.i32(i32 %86, i32 %87, i32 %92)
  %95 = tail call i32 @llvm.fshr.i32(i32 %87, i32 %88, i32 %92)
  %96 = select i1 %91, i32 %85, i32 %93
  %97 = select i1 %91, i32 %86, i32 %94
  %98 = select i1 %91, i32 %87, i32 %95
  %99 = lshr i32 %96, 29
  %100 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %97, i32 2)
  %101 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %98, i32 2)
  %102 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %88, i32 2)
  %103 = and i32 %99, 1
  %104 = sub nsw i32 0, %103
  %105 = shl i32 %99, 31
  %106 = xor i32 %100, %104
  %107 = xor i32 %101, %104
  %108 = xor i32 %102, %104
  %109 = tail call i32 @llvm.ctlz.i32(i32 %106, i1 false), !range !7
  %110 = sub nsw i32 31, %109
  %111 = tail call i32 @llvm.fshr.i32(i32 %106, i32 %107, i32 %110)
  %112 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %110)
  %113 = shl nuw nsw i32 %109, 23
  %114 = sub nuw nsw i32 1056964608, %113
  %115 = lshr i32 %111, 9
  %116 = or i32 %115, %114
  %117 = or i32 %116, %105
  %118 = bitcast i32 %117 to float
  %119 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 23)
  %120 = tail call i32 @llvm.ctlz.i32(i32 %119, i1 false), !range !7
  %121 = fmul float %118, 0x3FF921FB40000000
  %122 = add nuw nsw i32 %120, %109
  %123 = shl nuw nsw i32 %122, 23
  %124 = sub nuw nsw i32 855638016, %123
  %125 = sub nsw i32 31, %120
  %126 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %112, i32 %125)
  %127 = lshr i32 %126, 9
  %128 = or i32 %124, %127
  %129 = or i32 %128, %105
  %130 = bitcast i32 %129 to float
  %131 = fneg float %121
  %132 = tail call float @llvm.fma.f32(float %118, float 0x3FF921FB40000000, float %131)
  %133 = tail call float @llvm.fma.f32(float %118, float 0x3E74442D00000000, float %132)
  %134 = tail call float @llvm.fma.f32(float %130, float 0x3FF921FB40000000, float %133)
  %135 = fadd float %121, %134
  %136 = lshr i32 %96, 30
  %137 = add nuw nsw i32 %103, %136
  br label %138

138:                                              ; preds = %24, %32
  %139 = phi i32 [ %31, %24 ], [ %33, %32 ]
  %140 = phi float [ %29, %24 ], [ %135, %32 ]
  %141 = phi i32 [ %30, %24 ], [ %137, %32 ]
  %142 = fmul float %140, %140
  %143 = tail call float @llvm.fmuladd.f32(float %142, float 0xBF29833040000000, float 0x3F81103880000000)
  %144 = tail call float @llvm.fmuladd.f32(float %142, float %143, float 0xBFC55553A0000000)
  %145 = fmul float %142, %144
  %146 = tail call float @llvm.fmuladd.f32(float %140, float %145, float %140)
  %147 = tail call float @llvm.fmuladd.f32(float %142, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %148 = tail call float @llvm.fmuladd.f32(float %142, float %147, float 0x3FA5557EE0000000)
  %149 = tail call float @llvm.fmuladd.f32(float %142, float %148, float 0xBFE0000080000000)
  %150 = tail call float @llvm.fmuladd.f32(float %142, float %149, float 1.000000e+00)
  %151 = and i32 %141, 1
  %152 = icmp eq i32 %151, 0
  %153 = select i1 %152, float %146, float %150
  %154 = bitcast float %153 to i32
  %155 = shl i32 %141, 30
  %156 = and i32 %155, -2147483648
  %157 = bitcast float %21 to i32
  %158 = xor i32 %139, %157
  %159 = xor i32 %158, %156
  %160 = xor i32 %159, %154
  %161 = bitcast i32 %160 to float
  %162 = tail call i1 @llvm.amdgcn.class.f32(float %22, i32 504)
  %163 = select i1 %162, float %161, float 0x7FF8000000000000
  %164 = sext i32 %16 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  store float %163, float addrspace(1)* %165, align 4, !tbaa !8
  %166 = getelementptr inbounds float, float addrspace(1)* %0, i64 %164
  store float %163, float addrspace(1)* %166, align 4, !tbaa !8
  %167 = icmp eq i32 %13, 0
  %168 = icmp eq i32 %16, %2
  %169 = select i1 %167, i1 true, i1 %168
  br i1 %169, label %178, label %170

170:                                              ; preds = %138
  %171 = icmp slt i32 %3, 1
  br i1 %171, label %264, label %172

172:                                              ; preds = %170
  %173 = load float, float addrspace(1)* %165, align 4, !tbaa !8
  %174 = and i32 %3, 7
  %175 = icmp ult i32 %3, 8
  br i1 %175, label %248, label %176

176:                                              ; preds = %172
  %177 = and i32 %3, -8
  br label %179

178:                                              ; preds = %138
  store float 0.000000e+00, float addrspace(1)* %165, align 4, !tbaa !8
  br label %264

179:                                              ; preds = %179, %176
  %180 = phi float [ %173, %176 ], [ %245, %179 ]
  %181 = phi i32 [ 0, %176 ], [ %246, %179 ]
  %182 = fpext float %180 to double
  %183 = fmul contract double %182, 2.000000e+00
  %184 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %185 = fpext float %184 to double
  %186 = fsub contract double %183, %185
  %187 = fmul contract double %182, 0x3FC70A3D80000000
  %188 = fsub contract double %186, %187
  %189 = fptrunc double %188 to float
  store float %180, float addrspace(1)* %166, align 4, !tbaa !8
  store float %189, float addrspace(1)* %165, align 4, !tbaa !8
  %190 = fpext float %189 to double
  %191 = fmul contract double %190, 2.000000e+00
  %192 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %193 = fpext float %192 to double
  %194 = fsub contract double %191, %193
  %195 = fmul contract double %190, 0x3FC70A3D80000000
  %196 = fsub contract double %194, %195
  %197 = fptrunc double %196 to float
  store float %189, float addrspace(1)* %166, align 4, !tbaa !8
  store float %197, float addrspace(1)* %165, align 4, !tbaa !8
  %198 = fpext float %197 to double
  %199 = fmul contract double %198, 2.000000e+00
  %200 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %201 = fpext float %200 to double
  %202 = fsub contract double %199, %201
  %203 = fmul contract double %198, 0x3FC70A3D80000000
  %204 = fsub contract double %202, %203
  %205 = fptrunc double %204 to float
  store float %197, float addrspace(1)* %166, align 4, !tbaa !8
  store float %205, float addrspace(1)* %165, align 4, !tbaa !8
  %206 = fpext float %205 to double
  %207 = fmul contract double %206, 2.000000e+00
  %208 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %209 = fpext float %208 to double
  %210 = fsub contract double %207, %209
  %211 = fmul contract double %206, 0x3FC70A3D80000000
  %212 = fsub contract double %210, %211
  %213 = fptrunc double %212 to float
  store float %205, float addrspace(1)* %166, align 4, !tbaa !8
  store float %213, float addrspace(1)* %165, align 4, !tbaa !8
  %214 = fpext float %213 to double
  %215 = fmul contract double %214, 2.000000e+00
  %216 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %217 = fpext float %216 to double
  %218 = fsub contract double %215, %217
  %219 = fmul contract double %214, 0x3FC70A3D80000000
  %220 = fsub contract double %218, %219
  %221 = fptrunc double %220 to float
  store float %213, float addrspace(1)* %166, align 4, !tbaa !8
  store float %221, float addrspace(1)* %165, align 4, !tbaa !8
  %222 = fpext float %221 to double
  %223 = fmul contract double %222, 2.000000e+00
  %224 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %225 = fpext float %224 to double
  %226 = fsub contract double %223, %225
  %227 = fmul contract double %222, 0x3FC70A3D80000000
  %228 = fsub contract double %226, %227
  %229 = fptrunc double %228 to float
  store float %221, float addrspace(1)* %166, align 4, !tbaa !8
  store float %229, float addrspace(1)* %165, align 4, !tbaa !8
  %230 = fpext float %229 to double
  %231 = fmul contract double %230, 2.000000e+00
  %232 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %233 = fpext float %232 to double
  %234 = fsub contract double %231, %233
  %235 = fmul contract double %230, 0x3FC70A3D80000000
  %236 = fsub contract double %234, %235
  %237 = fptrunc double %236 to float
  store float %229, float addrspace(1)* %166, align 4, !tbaa !8
  store float %237, float addrspace(1)* %165, align 4, !tbaa !8
  %238 = fpext float %237 to double
  %239 = fmul contract double %238, 2.000000e+00
  %240 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %241 = fpext float %240 to double
  %242 = fsub contract double %239, %241
  %243 = fmul contract double %238, 0x3FC70A3D80000000
  %244 = fsub contract double %242, %243
  %245 = fptrunc double %244 to float
  store float %237, float addrspace(1)* %166, align 4, !tbaa !8
  store float %245, float addrspace(1)* %165, align 4, !tbaa !8
  %246 = add i32 %181, 8
  %247 = icmp eq i32 %246, %177
  br i1 %247, label %248, label %179, !llvm.loop !12

248:                                              ; preds = %179, %172
  %249 = phi float [ %173, %172 ], [ %245, %179 ]
  %250 = icmp eq i32 %174, 0
  br i1 %250, label %264, label %251

251:                                              ; preds = %248, %251
  %252 = phi float [ %261, %251 ], [ %249, %248 ]
  %253 = phi i32 [ %262, %251 ], [ 0, %248 ]
  %254 = fpext float %252 to double
  %255 = fmul contract double %254, 2.000000e+00
  %256 = load float, float addrspace(1)* %166, align 4, !tbaa !8
  %257 = fpext float %256 to double
  %258 = fsub contract double %255, %257
  %259 = fmul contract double %254, 0x3FC70A3D80000000
  %260 = fsub contract double %258, %259
  %261 = fptrunc double %260 to float
  store float %252, float addrspace(1)* %166, align 4, !tbaa !8
  store float %261, float addrspace(1)* %165, align 4, !tbaa !8
  %262 = add i32 %253, 1
  %263 = icmp eq i32 %262, %174
  br i1 %263, label %264, label %251, !llvm.loop !14

264:                                              ; preds = %248, %251, %170, %178, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!6 = !{i32 0, i32 1024}
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
