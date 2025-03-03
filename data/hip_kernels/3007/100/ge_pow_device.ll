; ModuleID = '../data/hip_kernels/3007/100/main.cu'
source_filename = "../data/hip_kernels/3007/100/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6ge_powiiPKfiiS0_iiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, float addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !4, !invariant.load !5
  %17 = zext i16 %16 to i32
  %18 = mul i32 %12, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = add i32 %18, %19
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = getelementptr i8, i8 addrspace(4)* %13, i64 6
  %23 = bitcast i8 addrspace(4)* %22 to i16 addrspace(4)*
  %24 = load i16, i16 addrspace(4)* %23, align 2, !range !4, !invariant.load !5
  %25 = zext i16 %24 to i32
  %26 = mul i32 %21, %25
  %27 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %28 = add i32 %26, %27
  %29 = icmp slt i32 %20, %0
  %30 = icmp slt i32 %28, %1
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %241

32:                                               ; preds = %11
  %33 = add nsw i32 %20, %3
  %34 = mul nsw i32 %28, %4
  %35 = add nsw i32 %33, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = add nsw i32 %20, %6
  %40 = mul nsw i32 %28, %7
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %5, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !5
  %45 = tail call float @llvm.fabs.f32(float %38)
  %46 = tail call float @llvm.amdgcn.frexp.mant.f32(float %45)
  %47 = fcmp olt float %46, 0x3FE5555560000000
  %48 = zext i1 %47 to i32
  %49 = tail call float @llvm.amdgcn.ldexp.f32(float %46, i32 %48)
  %50 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %45)
  %51 = sub nsw i32 %50, %48
  %52 = fadd float %49, -1.000000e+00
  %53 = fadd float %49, 1.000000e+00
  %54 = fadd float %53, -1.000000e+00
  %55 = fsub float %49, %54
  %56 = tail call float @llvm.amdgcn.rcp.f32(float %53)
  %57 = fmul float %52, %56
  %58 = fmul float %53, %57
  %59 = fneg float %58
  %60 = tail call float @llvm.fma.f32(float %57, float %53, float %59)
  %61 = tail call float @llvm.fma.f32(float %57, float %55, float %60)
  %62 = fadd float %58, %61
  %63 = fsub float %62, %58
  %64 = fsub float %61, %63
  %65 = fsub float %52, %62
  %66 = fsub float %52, %65
  %67 = fsub float %66, %62
  %68 = fsub float %67, %64
  %69 = fadd float %65, %68
  %70 = fmul float %56, %69
  %71 = fadd float %57, %70
  %72 = fsub float %71, %57
  %73 = fsub float %70, %72
  %74 = fmul float %71, %71
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %71, float %71, float %75)
  %77 = fmul float %73, 2.000000e+00
  %78 = tail call float @llvm.fma.f32(float %71, float %77, float %76)
  %79 = fadd float %74, %78
  %80 = fsub float %79, %74
  %81 = fsub float %78, %80
  %82 = tail call float @llvm.fmuladd.f32(float %79, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %83 = tail call float @llvm.fmuladd.f32(float %79, float %82, float 0x3FD999BDE0000000)
  %84 = sitofp i32 %51 to float
  %85 = fmul float %84, 0x3FE62E4300000000
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %84, float 0x3FE62E4300000000, float %86)
  %88 = tail call float @llvm.fma.f32(float %84, float 0xBE205C6100000000, float %87)
  %89 = fadd float %85, %88
  %90 = fsub float %89, %85
  %91 = fsub float %88, %90
  %92 = tail call float @llvm.amdgcn.ldexp.f32(float %71, i32 1)
  %93 = fmul float %71, %79
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %79, float %71, float %94)
  %96 = tail call float @llvm.fma.f32(float %79, float %73, float %95)
  %97 = tail call float @llvm.fma.f32(float %81, float %71, float %96)
  %98 = fadd float %93, %97
  %99 = fsub float %98, %93
  %100 = fsub float %97, %99
  %101 = fmul float %79, %83
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %79, float %83, float %102)
  %104 = tail call float @llvm.fma.f32(float %81, float %83, float %103)
  %105 = fadd float %101, %104
  %106 = fsub float %105, %101
  %107 = fsub float %104, %106
  %108 = fadd float %105, 0x3FE5555540000000
  %109 = fadd float %108, 0xBFE5555540000000
  %110 = fsub float %105, %109
  %111 = fadd float %107, 0x3E2E720200000000
  %112 = fadd float %111, %110
  %113 = fadd float %108, %112
  %114 = fsub float %113, %108
  %115 = fsub float %112, %114
  %116 = fmul float %98, %113
  %117 = fneg float %116
  %118 = tail call float @llvm.fma.f32(float %98, float %113, float %117)
  %119 = tail call float @llvm.fma.f32(float %98, float %115, float %118)
  %120 = tail call float @llvm.fma.f32(float %100, float %113, float %119)
  %121 = tail call float @llvm.amdgcn.ldexp.f32(float %73, i32 1)
  %122 = fadd float %116, %120
  %123 = fsub float %122, %116
  %124 = fsub float %120, %123
  %125 = fadd float %92, %122
  %126 = fsub float %125, %92
  %127 = fsub float %122, %126
  %128 = fadd float %121, %124
  %129 = fadd float %128, %127
  %130 = fadd float %125, %129
  %131 = fsub float %130, %125
  %132 = fsub float %129, %131
  %133 = fadd float %89, %130
  %134 = fsub float %133, %89
  %135 = fsub float %133, %134
  %136 = fsub float %89, %135
  %137 = fsub float %130, %134
  %138 = fadd float %137, %136
  %139 = fadd float %91, %132
  %140 = fsub float %139, %91
  %141 = fsub float %139, %140
  %142 = fsub float %91, %141
  %143 = fsub float %132, %140
  %144 = fadd float %143, %142
  %145 = fadd float %139, %138
  %146 = fadd float %133, %145
  %147 = fsub float %146, %133
  %148 = fsub float %145, %147
  %149 = fadd float %144, %148
  %150 = fadd float %146, %149
  %151 = fsub float %150, %146
  %152 = fsub float %149, %151
  %153 = fmul float %44, %150
  %154 = fneg float %153
  %155 = tail call float @llvm.fma.f32(float %44, float %150, float %154)
  %156 = tail call float @llvm.fma.f32(float %44, float %152, float %155)
  %157 = fadd float %153, %156
  %158 = fsub float %157, %153
  %159 = fsub float %156, %158
  %160 = tail call float @llvm.fabs.f32(float %153) #3
  %161 = fcmp oeq float %160, 0x7FF0000000000000
  %162 = select i1 %161, float %153, float %157
  %163 = tail call float @llvm.fabs.f32(float %162) #3
  %164 = fcmp oeq float %163, 0x7FF0000000000000
  %165 = select i1 %164, float 0.000000e+00, float %159
  %166 = fcmp oeq float %162, 0x40562E4300000000
  %167 = select i1 %166, float 0x3EE0000000000000, float 0.000000e+00
  %168 = fsub float %162, %167
  %169 = fadd float %167, %165
  %170 = fmul float %168, 0x3FF7154760000000
  %171 = tail call float @llvm.rint.f32(float %170)
  %172 = fcmp ogt float %168, 0x40562E4300000000
  %173 = fcmp olt float %168, 0xC059D1DA00000000
  %174 = fneg float %170
  %175 = tail call float @llvm.fma.f32(float %168, float 0x3FF7154760000000, float %174)
  %176 = tail call float @llvm.fma.f32(float %168, float 0x3E54AE0BE0000000, float %175)
  %177 = fsub float %170, %171
  %178 = fadd float %176, %177
  %179 = tail call float @llvm.exp2.f32(float %178)
  %180 = fptosi float %171 to i32
  %181 = tail call float @llvm.amdgcn.ldexp.f32(float %179, i32 %180)
  %182 = select i1 %173, float 0.000000e+00, float %181
  %183 = select i1 %172, float 0x7FF0000000000000, float %182
  %184 = tail call float @llvm.fma.f32(float %183, float %169, float %183)
  %185 = tail call float @llvm.fabs.f32(float %183) #3
  %186 = fcmp oeq float %185, 0x7FF0000000000000
  %187 = select i1 %186, float %183, float %184
  %188 = tail call float @llvm.fabs.f32(float %44)
  %189 = tail call float @llvm.trunc.f32(float %188)
  %190 = fcmp oeq float %188, %189
  %191 = zext i1 %190 to i32
  %192 = fmul float %189, 5.000000e-01
  %193 = tail call float @llvm.amdgcn.fract.f32(float %192)
  %194 = tail call i1 @llvm.amdgcn.class.f32(float %192, i32 516)
  %195 = select i1 %194, float 0.000000e+00, float %193
  %196 = fcmp oeq float %195, 0.000000e+00
  %197 = and i1 %190, %196
  %198 = zext i1 %197 to i32
  %199 = add nuw nsw i32 %198, %191
  %200 = icmp eq i32 %199, 1
  %201 = fcmp olt float %38, 0.000000e+00
  %202 = and i1 %201, %200
  %203 = select i1 %202, float -0.000000e+00, float 0.000000e+00
  %204 = tail call float @llvm.copysign.f32(float %187, float %203)
  %205 = fcmp uge float %38, 0.000000e+00
  %206 = icmp ne i32 %199, 0
  %207 = select i1 %205, i1 true, i1 %206
  %208 = select i1 %207, float %204, float 0x7FF8000000000000
  %209 = fcmp oeq float %188, 0x7FF0000000000000
  br i1 %209, label %210, label %219

210:                                              ; preds = %32
  %211 = fcmp oeq float %45, 1.000000e+00
  %212 = fadd float %45, -1.000000e+00
  %213 = bitcast float %44 to i32
  %214 = bitcast float %212 to i32
  %215 = xor i32 %214, %213
  %216 = icmp sgt i32 %215, -1
  %217 = select i1 %216, float 0x7FF0000000000000, float 0.000000e+00
  %218 = select i1 %211, float %45, float %217
  br label %219

219:                                              ; preds = %32, %210
  %220 = phi float [ %208, %32 ], [ %218, %210 ]
  %221 = fcmp oeq float %45, 0x7FF0000000000000
  %222 = fcmp oeq float %38, 0.000000e+00
  %223 = or i1 %222, %221
  %224 = fcmp olt float %44, 0.000000e+00
  %225 = xor i1 %222, %224
  %226 = select i1 %225, float 0.000000e+00, float 0x7FF0000000000000
  %227 = select i1 %200, float %38, float 0.000000e+00
  %228 = tail call float @llvm.copysign.f32(float %226, float %227)
  %229 = select i1 %223, float %228, float %220
  %230 = fcmp uno float %38, %44
  %231 = select i1 %230, float 0x7FF8000000000000, float %229
  %232 = fcmp oeq float %38, 1.000000e+00
  %233 = fcmp oeq float %44, 0.000000e+00
  %234 = or i1 %232, %233
  %235 = select i1 %234, float 1.000000e+00, float %231
  %236 = add nsw i32 %20, %9
  %237 = mul nsw i32 %28, %10
  %238 = add nsw i32 %236, %237
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds float, float addrspace(1)* %8, i64 %239
  store float %235, float addrspace(1)* %240, align 4, !tbaa !7
  br label %241

241:                                              ; preds = %219, %11
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
