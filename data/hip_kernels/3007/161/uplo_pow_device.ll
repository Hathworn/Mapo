; ModuleID = '../data/hip_kernels/3007/161/main.cu'
source_filename = "../data/hip_kernels/3007/161/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8uplo_powiiiPKfiiS0_iiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture readonly %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp slt i32 %21, %0
  %31 = icmp slt i32 %29, %0
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %249

33:                                               ; preds = %12
  %34 = icmp eq i32 %1, 132
  %35 = mul nsw i32 %21, %2
  %36 = mul nsw i32 %29, %2
  %37 = icmp sgt i32 %35, %36
  %38 = icmp sge i32 %35, %36
  %39 = select i1 %34, i1 %37, i1 %38
  br i1 %39, label %40, label %249

40:                                               ; preds = %33
  %41 = add nsw i32 %21, %4
  %42 = mul nsw i32 %29, %5
  %43 = add nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = add nsw i32 %21, %7
  %48 = mul nsw i32 %29, %8
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %6, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = tail call float @llvm.fabs.f32(float %46)
  %54 = tail call float @llvm.amdgcn.frexp.mant.f32(float %53)
  %55 = fcmp olt float %54, 0x3FE5555560000000
  %56 = zext i1 %55 to i32
  %57 = tail call float @llvm.amdgcn.ldexp.f32(float %54, i32 %56)
  %58 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %53)
  %59 = sub nsw i32 %58, %56
  %60 = fadd float %57, -1.000000e+00
  %61 = fadd float %57, 1.000000e+00
  %62 = fadd float %61, -1.000000e+00
  %63 = fsub float %57, %62
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %61)
  %65 = fmul float %60, %64
  %66 = fmul float %61, %65
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %65, float %61, float %67)
  %69 = tail call float @llvm.fma.f32(float %65, float %63, float %68)
  %70 = fadd float %66, %69
  %71 = fsub float %70, %66
  %72 = fsub float %69, %71
  %73 = fsub float %60, %70
  %74 = fsub float %60, %73
  %75 = fsub float %74, %70
  %76 = fsub float %75, %72
  %77 = fadd float %73, %76
  %78 = fmul float %64, %77
  %79 = fadd float %65, %78
  %80 = fsub float %79, %65
  %81 = fsub float %78, %80
  %82 = fmul float %79, %79
  %83 = fneg float %82
  %84 = tail call float @llvm.fma.f32(float %79, float %79, float %83)
  %85 = fmul float %81, 2.000000e+00
  %86 = tail call float @llvm.fma.f32(float %79, float %85, float %84)
  %87 = fadd float %82, %86
  %88 = fsub float %87, %82
  %89 = fsub float %86, %88
  %90 = tail call float @llvm.fmuladd.f32(float %87, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %91 = tail call float @llvm.fmuladd.f32(float %87, float %90, float 0x3FD999BDE0000000)
  %92 = sitofp i32 %59 to float
  %93 = fmul float %92, 0x3FE62E4300000000
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %92, float 0x3FE62E4300000000, float %94)
  %96 = tail call float @llvm.fma.f32(float %92, float 0xBE205C6100000000, float %95)
  %97 = fadd float %93, %96
  %98 = fsub float %97, %93
  %99 = fsub float %96, %98
  %100 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 1)
  %101 = fmul float %79, %87
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %87, float %79, float %102)
  %104 = tail call float @llvm.fma.f32(float %87, float %81, float %103)
  %105 = tail call float @llvm.fma.f32(float %89, float %79, float %104)
  %106 = fadd float %101, %105
  %107 = fsub float %106, %101
  %108 = fsub float %105, %107
  %109 = fmul float %87, %91
  %110 = fneg float %109
  %111 = tail call float @llvm.fma.f32(float %87, float %91, float %110)
  %112 = tail call float @llvm.fma.f32(float %89, float %91, float %111)
  %113 = fadd float %109, %112
  %114 = fsub float %113, %109
  %115 = fsub float %112, %114
  %116 = fadd float %113, 0x3FE5555540000000
  %117 = fadd float %116, 0xBFE5555540000000
  %118 = fsub float %113, %117
  %119 = fadd float %115, 0x3E2E720200000000
  %120 = fadd float %119, %118
  %121 = fadd float %116, %120
  %122 = fsub float %121, %116
  %123 = fsub float %120, %122
  %124 = fmul float %106, %121
  %125 = fneg float %124
  %126 = tail call float @llvm.fma.f32(float %106, float %121, float %125)
  %127 = tail call float @llvm.fma.f32(float %106, float %123, float %126)
  %128 = tail call float @llvm.fma.f32(float %108, float %121, float %127)
  %129 = tail call float @llvm.amdgcn.ldexp.f32(float %81, i32 1)
  %130 = fadd float %124, %128
  %131 = fsub float %130, %124
  %132 = fsub float %128, %131
  %133 = fadd float %100, %130
  %134 = fsub float %133, %100
  %135 = fsub float %130, %134
  %136 = fadd float %129, %132
  %137 = fadd float %136, %135
  %138 = fadd float %133, %137
  %139 = fsub float %138, %133
  %140 = fsub float %137, %139
  %141 = fadd float %97, %138
  %142 = fsub float %141, %97
  %143 = fsub float %141, %142
  %144 = fsub float %97, %143
  %145 = fsub float %138, %142
  %146 = fadd float %145, %144
  %147 = fadd float %99, %140
  %148 = fsub float %147, %99
  %149 = fsub float %147, %148
  %150 = fsub float %99, %149
  %151 = fsub float %140, %148
  %152 = fadd float %151, %150
  %153 = fadd float %147, %146
  %154 = fadd float %141, %153
  %155 = fsub float %154, %141
  %156 = fsub float %153, %155
  %157 = fadd float %152, %156
  %158 = fadd float %154, %157
  %159 = fsub float %158, %154
  %160 = fsub float %157, %159
  %161 = fmul float %52, %158
  %162 = fneg float %161
  %163 = tail call float @llvm.fma.f32(float %52, float %158, float %162)
  %164 = tail call float @llvm.fma.f32(float %52, float %160, float %163)
  %165 = fadd float %161, %164
  %166 = fsub float %165, %161
  %167 = fsub float %164, %166
  %168 = tail call float @llvm.fabs.f32(float %161) #3
  %169 = fcmp oeq float %168, 0x7FF0000000000000
  %170 = select i1 %169, float %161, float %165
  %171 = tail call float @llvm.fabs.f32(float %170) #3
  %172 = fcmp oeq float %171, 0x7FF0000000000000
  %173 = select i1 %172, float 0.000000e+00, float %167
  %174 = fcmp oeq float %170, 0x40562E4300000000
  %175 = select i1 %174, float 0x3EE0000000000000, float 0.000000e+00
  %176 = fsub float %170, %175
  %177 = fadd float %175, %173
  %178 = fmul float %176, 0x3FF7154760000000
  %179 = tail call float @llvm.rint.f32(float %178)
  %180 = fcmp ogt float %176, 0x40562E4300000000
  %181 = fcmp olt float %176, 0xC059D1DA00000000
  %182 = fneg float %178
  %183 = tail call float @llvm.fma.f32(float %176, float 0x3FF7154760000000, float %182)
  %184 = tail call float @llvm.fma.f32(float %176, float 0x3E54AE0BE0000000, float %183)
  %185 = fsub float %178, %179
  %186 = fadd float %184, %185
  %187 = tail call float @llvm.exp2.f32(float %186)
  %188 = fptosi float %179 to i32
  %189 = tail call float @llvm.amdgcn.ldexp.f32(float %187, i32 %188)
  %190 = select i1 %181, float 0.000000e+00, float %189
  %191 = select i1 %180, float 0x7FF0000000000000, float %190
  %192 = tail call float @llvm.fma.f32(float %191, float %177, float %191)
  %193 = tail call float @llvm.fabs.f32(float %191) #3
  %194 = fcmp oeq float %193, 0x7FF0000000000000
  %195 = select i1 %194, float %191, float %192
  %196 = tail call float @llvm.fabs.f32(float %52)
  %197 = tail call float @llvm.trunc.f32(float %196)
  %198 = fcmp oeq float %196, %197
  %199 = zext i1 %198 to i32
  %200 = fmul float %197, 5.000000e-01
  %201 = tail call float @llvm.amdgcn.fract.f32(float %200)
  %202 = tail call i1 @llvm.amdgcn.class.f32(float %200, i32 516)
  %203 = select i1 %202, float 0.000000e+00, float %201
  %204 = fcmp oeq float %203, 0.000000e+00
  %205 = and i1 %198, %204
  %206 = zext i1 %205 to i32
  %207 = add nuw nsw i32 %206, %199
  %208 = icmp eq i32 %207, 1
  %209 = fcmp olt float %46, 0.000000e+00
  %210 = and i1 %209, %208
  %211 = select i1 %210, float -0.000000e+00, float 0.000000e+00
  %212 = tail call float @llvm.copysign.f32(float %195, float %211)
  %213 = fcmp uge float %46, 0.000000e+00
  %214 = icmp ne i32 %207, 0
  %215 = select i1 %213, i1 true, i1 %214
  %216 = select i1 %215, float %212, float 0x7FF8000000000000
  %217 = fcmp oeq float %196, 0x7FF0000000000000
  br i1 %217, label %218, label %227

218:                                              ; preds = %40
  %219 = fcmp oeq float %53, 1.000000e+00
  %220 = fadd float %53, -1.000000e+00
  %221 = bitcast float %52 to i32
  %222 = bitcast float %220 to i32
  %223 = xor i32 %222, %221
  %224 = icmp sgt i32 %223, -1
  %225 = select i1 %224, float 0x7FF0000000000000, float 0.000000e+00
  %226 = select i1 %219, float %53, float %225
  br label %227

227:                                              ; preds = %40, %218
  %228 = phi float [ %216, %40 ], [ %226, %218 ]
  %229 = fcmp oeq float %53, 0x7FF0000000000000
  %230 = fcmp oeq float %46, 0.000000e+00
  %231 = or i1 %230, %229
  %232 = fcmp olt float %52, 0.000000e+00
  %233 = xor i1 %230, %232
  %234 = select i1 %233, float 0.000000e+00, float 0x7FF0000000000000
  %235 = select i1 %208, float %46, float 0.000000e+00
  %236 = tail call float @llvm.copysign.f32(float %234, float %235)
  %237 = select i1 %231, float %236, float %228
  %238 = fcmp uno float %46, %52
  %239 = select i1 %238, float 0x7FF8000000000000, float %237
  %240 = fcmp oeq float %46, 1.000000e+00
  %241 = fcmp oeq float %52, 0.000000e+00
  %242 = or i1 %240, %241
  %243 = select i1 %242, float 1.000000e+00, float %239
  %244 = add nsw i32 %21, %10
  %245 = mul nsw i32 %29, %11
  %246 = add nsw i32 %244, %245
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds float, float addrspace(1)* %9, i64 %247
  store float %243, float addrspace(1)* %248, align 4, !tbaa !7
  br label %249

249:                                              ; preds = %12, %227, %33
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

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
