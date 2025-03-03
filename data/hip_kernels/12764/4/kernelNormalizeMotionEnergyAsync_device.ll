; ModuleID = '../data/hip_kernels/12764/4/main.cu'
source_filename = "../data/hip_kernels/12764/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32kernelNormalizeMotionEnergyAsynciiiffffPf(i32 %0, i32 %1, i32 %2, float %3, float %4, float %5, float %6, float addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = fmul contract float %6, 2.000000e+00
  %19 = fmul contract float %18, %6
  %20 = icmp slt i32 %17, %2
  br i1 %20, label %21, label %228

21:                                               ; preds = %8
  %22 = mul nsw i32 %1, %0
  %23 = sdiv i32 %17, %22
  %24 = freeze i32 %23
  %25 = freeze i32 %0
  %26 = sdiv i32 %24, %25
  %27 = mul i32 %26, %25
  %28 = sub i32 %24, %27
  %29 = sext i32 %17 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %7, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = fpext float %19 to double
  %33 = fmul contract double %32, 0x400921FB54442D18
  %34 = fdiv contract double 1.000000e+00, %33
  %35 = add nsw i32 %28, -2
  %36 = icmp slt i32 %28, 2
  %37 = icmp sge i32 %35, %0
  %38 = select i1 %36, i1 true, i1 %37
  %39 = mul nsw i32 %35, %35
  %40 = add nsw i32 %28, -1
  %41 = icmp slt i32 %28, 1
  %42 = icmp slt i32 %0, 0
  %43 = or i1 %41, %42
  %44 = mul nsw i32 %40, %40
  %45 = or i32 %28, %0
  %46 = icmp slt i32 %45, 0
  %47 = mul nsw i32 %28, %28
  %48 = add nsw i32 %28, 1
  %49 = icmp slt i32 %28, -1
  %50 = icmp sge i32 %48, %0
  %51 = select i1 %49, i1 true, i1 %50
  %52 = xor i32 %28, -1
  %53 = mul i32 %48, %52
  %54 = add nsw i32 %28, 2
  %55 = icmp slt i32 %28, -2
  %56 = icmp sge i32 %54, %0
  %57 = select i1 %55, i1 true, i1 %56
  %58 = mul nsw i32 %54, %54
  br label %65

59:                                               ; preds = %224
  %60 = fdiv contract float %225, %4
  %61 = fmul contract float %31, %5
  %62 = fadd contract float %31, %3
  %63 = fadd contract float %62, %60
  %64 = fdiv contract float %61, %63
  store float %64, float addrspace(1)* %30, align 4, !tbaa !7
  br label %228

65:                                               ; preds = %21, %224
  %66 = phi float [ 0.000000e+00, %21 ], [ %225, %224 ]
  %67 = phi i32 [ -2, %21 ], [ %226, %224 ]
  %68 = add nsw i32 %67, %26
  %69 = icmp sgt i32 %68, -1
  %70 = icmp slt i32 %68, %1
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %224

72:                                               ; preds = %65
  %73 = icmp eq i32 %67, 0
  %74 = mul nsw i32 %68, %68
  %75 = mul nsw i32 %68, %0
  br i1 %38, label %104, label %76

76:                                               ; preds = %72
  %77 = add nuw nsw i32 %74, %39
  %78 = sub nsw i32 0, %77
  %79 = sitofp i32 %78 to float
  %80 = fdiv contract float %79, %19
  %81 = fmul float %80, 0x3FF7154760000000
  %82 = tail call float @llvm.rint.f32(float %81)
  %83 = fcmp ogt float %80, 0x40562E4300000000
  %84 = fcmp olt float %80, 0xC059D1DA00000000
  %85 = fneg float %81
  %86 = tail call float @llvm.fma.f32(float %80, float 0x3FF7154760000000, float %85)
  %87 = tail call float @llvm.fma.f32(float %80, float 0x3E54AE0BE0000000, float %86)
  %88 = fsub float %81, %82
  %89 = fadd float %87, %88
  %90 = tail call float @llvm.exp2.f32(float %89)
  %91 = fptosi float %82 to i32
  %92 = tail call float @llvm.amdgcn.ldexp.f32(float %90, i32 %91)
  %93 = select i1 %84, float 0.000000e+00, float %92
  %94 = select i1 %83, float 0x7FF0000000000000, float %93
  %95 = fpext float %94 to double
  %96 = fmul contract double %34, %95
  %97 = fptrunc double %96 to float
  %98 = add nsw i32 %35, %75
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %7, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = fmul contract float %101, %97
  %103 = fadd contract float %66, %102
  br label %104

104:                                              ; preds = %72, %76
  %105 = phi float [ %103, %76 ], [ %66, %72 ]
  br i1 %43, label %134, label %106

106:                                              ; preds = %104
  %107 = add nuw nsw i32 %74, %44
  %108 = sub nsw i32 0, %107
  %109 = sitofp i32 %108 to float
  %110 = fdiv contract float %109, %19
  %111 = fmul float %110, 0x3FF7154760000000
  %112 = tail call float @llvm.rint.f32(float %111)
  %113 = fcmp ogt float %110, 0x40562E4300000000
  %114 = fcmp olt float %110, 0xC059D1DA00000000
  %115 = fneg float %111
  %116 = tail call float @llvm.fma.f32(float %110, float 0x3FF7154760000000, float %115)
  %117 = tail call float @llvm.fma.f32(float %110, float 0x3E54AE0BE0000000, float %116)
  %118 = fsub float %111, %112
  %119 = fadd float %117, %118
  %120 = tail call float @llvm.exp2.f32(float %119)
  %121 = fptosi float %112 to i32
  %122 = tail call float @llvm.amdgcn.ldexp.f32(float %120, i32 %121)
  %123 = select i1 %114, float 0.000000e+00, float %122
  %124 = select i1 %113, float 0x7FF0000000000000, float %123
  %125 = fpext float %124 to double
  %126 = fmul contract double %34, %125
  %127 = fptrunc double %126 to float
  %128 = add nsw i32 %40, %75
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %7, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7, !amdgpu.noclobber !6
  %132 = fmul contract float %131, %127
  %133 = fadd contract float %105, %132
  br label %134

134:                                              ; preds = %106, %104
  %135 = phi float [ %133, %106 ], [ %105, %104 ]
  %136 = select i1 %46, i1 true, i1 %73
  br i1 %136, label %165, label %137

137:                                              ; preds = %134
  %138 = add nuw nsw i32 %74, %47
  %139 = sub nsw i32 0, %138
  %140 = sitofp i32 %139 to float
  %141 = fdiv contract float %140, %19
  %142 = fmul float %141, 0x3FF7154760000000
  %143 = tail call float @llvm.rint.f32(float %142)
  %144 = fcmp ogt float %141, 0x40562E4300000000
  %145 = fcmp olt float %141, 0xC059D1DA00000000
  %146 = fneg float %142
  %147 = tail call float @llvm.fma.f32(float %141, float 0x3FF7154760000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %141, float 0x3E54AE0BE0000000, float %147)
  %149 = fsub float %142, %143
  %150 = fadd float %148, %149
  %151 = tail call float @llvm.exp2.f32(float %150)
  %152 = fptosi float %143 to i32
  %153 = tail call float @llvm.amdgcn.ldexp.f32(float %151, i32 %152)
  %154 = select i1 %145, float 0.000000e+00, float %153
  %155 = select i1 %144, float 0x7FF0000000000000, float %154
  %156 = fpext float %155 to double
  %157 = fmul contract double %34, %156
  %158 = fptrunc double %157 to float
  %159 = add nsw i32 %28, %75
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds float, float addrspace(1)* %7, i64 %160
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7, !amdgpu.noclobber !6
  %163 = fmul contract float %162, %158
  %164 = fadd contract float %135, %163
  br label %165

165:                                              ; preds = %137, %134
  %166 = phi float [ %164, %137 ], [ %135, %134 ]
  br i1 %51, label %194, label %167

167:                                              ; preds = %165
  %168 = sub i32 %53, %74
  %169 = sitofp i32 %168 to float
  %170 = fdiv contract float %169, %19
  %171 = fmul float %170, 0x3FF7154760000000
  %172 = tail call float @llvm.rint.f32(float %171)
  %173 = fcmp ogt float %170, 0x40562E4300000000
  %174 = fcmp olt float %170, 0xC059D1DA00000000
  %175 = fneg float %171
  %176 = tail call float @llvm.fma.f32(float %170, float 0x3FF7154760000000, float %175)
  %177 = tail call float @llvm.fma.f32(float %170, float 0x3E54AE0BE0000000, float %176)
  %178 = fsub float %171, %172
  %179 = fadd float %177, %178
  %180 = tail call float @llvm.exp2.f32(float %179)
  %181 = fptosi float %172 to i32
  %182 = tail call float @llvm.amdgcn.ldexp.f32(float %180, i32 %181)
  %183 = select i1 %174, float 0.000000e+00, float %182
  %184 = select i1 %173, float 0x7FF0000000000000, float %183
  %185 = fpext float %184 to double
  %186 = fmul contract double %34, %185
  %187 = fptrunc double %186 to float
  %188 = add nsw i32 %48, %75
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %7, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7, !amdgpu.noclobber !6
  %192 = fmul contract float %191, %187
  %193 = fadd contract float %166, %192
  br label %194

194:                                              ; preds = %167, %165
  %195 = phi float [ %193, %167 ], [ %166, %165 ]
  br i1 %57, label %224, label %196

196:                                              ; preds = %194
  %197 = add nuw nsw i32 %74, %58
  %198 = sub nsw i32 0, %197
  %199 = sitofp i32 %198 to float
  %200 = fdiv contract float %199, %19
  %201 = fmul float %200, 0x3FF7154760000000
  %202 = tail call float @llvm.rint.f32(float %201)
  %203 = fcmp ogt float %200, 0x40562E4300000000
  %204 = fcmp olt float %200, 0xC059D1DA00000000
  %205 = fneg float %201
  %206 = tail call float @llvm.fma.f32(float %200, float 0x3FF7154760000000, float %205)
  %207 = tail call float @llvm.fma.f32(float %200, float 0x3E54AE0BE0000000, float %206)
  %208 = fsub float %201, %202
  %209 = fadd float %207, %208
  %210 = tail call float @llvm.exp2.f32(float %209)
  %211 = fptosi float %202 to i32
  %212 = tail call float @llvm.amdgcn.ldexp.f32(float %210, i32 %211)
  %213 = select i1 %204, float 0.000000e+00, float %212
  %214 = select i1 %203, float 0x7FF0000000000000, float %213
  %215 = fpext float %214 to double
  %216 = fmul contract double %34, %215
  %217 = fptrunc double %216 to float
  %218 = add nsw i32 %54, %75
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds float, float addrspace(1)* %7, i64 %219
  %221 = load float, float addrspace(1)* %220, align 4, !tbaa !7, !amdgpu.noclobber !6
  %222 = fmul contract float %221, %217
  %223 = fadd contract float %195, %222
  br label %224

224:                                              ; preds = %194, %196, %65
  %225 = phi float [ %66, %65 ], [ %223, %196 ], [ %195, %194 ]
  %226 = add nsw i32 %67, 1
  %227 = icmp eq i32 %226, 3
  br i1 %227, label %59, label %65, !llvm.loop !11

228:                                              ; preds = %59, %8
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
