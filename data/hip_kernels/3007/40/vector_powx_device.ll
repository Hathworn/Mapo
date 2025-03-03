; ModuleID = '../data/hip_kernels/3007/40/main.cu'
source_filename = "../data/hip_kernels/3007/40/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11vector_powxiPKfiifPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %18, label %19, label %220

19:                                               ; preds = %8
  %20 = mul nsw i32 %17, %3
  %21 = add nsw i32 %20, %2
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !5
  %25 = tail call float @llvm.fabs.f32(float %24)
  %26 = tail call float @llvm.amdgcn.frexp.mant.f32(float %25)
  %27 = fcmp olt float %26, 0x3FE5555560000000
  %28 = zext i1 %27 to i32
  %29 = tail call float @llvm.amdgcn.ldexp.f32(float %26, i32 %28)
  %30 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %25)
  %31 = sub nsw i32 %30, %28
  %32 = fadd float %29, -1.000000e+00
  %33 = fadd float %29, 1.000000e+00
  %34 = fadd float %33, -1.000000e+00
  %35 = fsub float %29, %34
  %36 = tail call float @llvm.amdgcn.rcp.f32(float %33)
  %37 = fmul float %32, %36
  %38 = fmul float %33, %37
  %39 = fneg float %38
  %40 = tail call float @llvm.fma.f32(float %37, float %33, float %39)
  %41 = tail call float @llvm.fma.f32(float %37, float %35, float %40)
  %42 = fadd float %38, %41
  %43 = fsub float %42, %38
  %44 = fsub float %41, %43
  %45 = fsub float %32, %42
  %46 = fsub float %32, %45
  %47 = fsub float %46, %42
  %48 = fsub float %47, %44
  %49 = fadd float %45, %48
  %50 = fmul float %36, %49
  %51 = fadd float %37, %50
  %52 = fsub float %51, %37
  %53 = fsub float %50, %52
  %54 = fmul float %51, %51
  %55 = fneg float %54
  %56 = tail call float @llvm.fma.f32(float %51, float %51, float %55)
  %57 = fmul float %53, 2.000000e+00
  %58 = tail call float @llvm.fma.f32(float %51, float %57, float %56)
  %59 = fadd float %54, %58
  %60 = fsub float %59, %54
  %61 = fsub float %58, %60
  %62 = tail call float @llvm.fmuladd.f32(float %59, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %63 = tail call float @llvm.fmuladd.f32(float %59, float %62, float 0x3FD999BDE0000000)
  %64 = sitofp i32 %31 to float
  %65 = fmul float %64, 0x3FE62E4300000000
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %64, float 0x3FE62E4300000000, float %66)
  %68 = tail call float @llvm.fma.f32(float %64, float 0xBE205C6100000000, float %67)
  %69 = fadd float %65, %68
  %70 = fsub float %69, %65
  %71 = fsub float %68, %70
  %72 = tail call float @llvm.amdgcn.ldexp.f32(float %51, i32 1)
  %73 = fmul float %51, %59
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %59, float %51, float %74)
  %76 = tail call float @llvm.fma.f32(float %59, float %53, float %75)
  %77 = tail call float @llvm.fma.f32(float %61, float %51, float %76)
  %78 = fadd float %73, %77
  %79 = fsub float %78, %73
  %80 = fsub float %77, %79
  %81 = fmul float %59, %63
  %82 = fneg float %81
  %83 = tail call float @llvm.fma.f32(float %59, float %63, float %82)
  %84 = tail call float @llvm.fma.f32(float %61, float %63, float %83)
  %85 = fadd float %81, %84
  %86 = fsub float %85, %81
  %87 = fsub float %84, %86
  %88 = fadd float %85, 0x3FE5555540000000
  %89 = fadd float %88, 0xBFE5555540000000
  %90 = fsub float %85, %89
  %91 = fadd float %87, 0x3E2E720200000000
  %92 = fadd float %91, %90
  %93 = fadd float %88, %92
  %94 = fsub float %93, %88
  %95 = fsub float %92, %94
  %96 = fmul float %78, %93
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %78, float %93, float %97)
  %99 = tail call float @llvm.fma.f32(float %78, float %95, float %98)
  %100 = tail call float @llvm.fma.f32(float %80, float %93, float %99)
  %101 = tail call float @llvm.amdgcn.ldexp.f32(float %53, i32 1)
  %102 = fadd float %96, %100
  %103 = fsub float %102, %96
  %104 = fsub float %100, %103
  %105 = fadd float %72, %102
  %106 = fsub float %105, %72
  %107 = fsub float %102, %106
  %108 = fadd float %101, %104
  %109 = fadd float %108, %107
  %110 = fadd float %105, %109
  %111 = fsub float %110, %105
  %112 = fsub float %109, %111
  %113 = fadd float %69, %110
  %114 = fsub float %113, %69
  %115 = fsub float %113, %114
  %116 = fsub float %69, %115
  %117 = fsub float %110, %114
  %118 = fadd float %117, %116
  %119 = fadd float %71, %112
  %120 = fsub float %119, %71
  %121 = fsub float %119, %120
  %122 = fsub float %71, %121
  %123 = fsub float %112, %120
  %124 = fadd float %123, %122
  %125 = fadd float %119, %118
  %126 = fadd float %113, %125
  %127 = fsub float %126, %113
  %128 = fsub float %125, %127
  %129 = fadd float %124, %128
  %130 = fadd float %126, %129
  %131 = fsub float %130, %126
  %132 = fsub float %129, %131
  %133 = fmul float %130, %4
  %134 = fneg float %133
  %135 = tail call float @llvm.fma.f32(float %4, float %130, float %134)
  %136 = tail call float @llvm.fma.f32(float %4, float %132, float %135)
  %137 = fadd float %133, %136
  %138 = fsub float %137, %133
  %139 = fsub float %136, %138
  %140 = tail call float @llvm.fabs.f32(float %133) #3
  %141 = fcmp oeq float %140, 0x7FF0000000000000
  %142 = select i1 %141, float %133, float %137
  %143 = tail call float @llvm.fabs.f32(float %142) #3
  %144 = fcmp oeq float %143, 0x7FF0000000000000
  %145 = select i1 %144, float 0.000000e+00, float %139
  %146 = fcmp oeq float %142, 0x40562E4300000000
  %147 = select i1 %146, float 0x3EE0000000000000, float 0.000000e+00
  %148 = fsub float %142, %147
  %149 = fadd float %147, %145
  %150 = fmul float %148, 0x3FF7154760000000
  %151 = tail call float @llvm.rint.f32(float %150)
  %152 = fcmp ogt float %148, 0x40562E4300000000
  %153 = fcmp olt float %148, 0xC059D1DA00000000
  %154 = fneg float %150
  %155 = tail call float @llvm.fma.f32(float %148, float 0x3FF7154760000000, float %154)
  %156 = tail call float @llvm.fma.f32(float %148, float 0x3E54AE0BE0000000, float %155)
  %157 = fsub float %150, %151
  %158 = fadd float %156, %157
  %159 = tail call float @llvm.exp2.f32(float %158)
  %160 = fptosi float %151 to i32
  %161 = tail call float @llvm.amdgcn.ldexp.f32(float %159, i32 %160)
  %162 = select i1 %153, float 0.000000e+00, float %161
  %163 = select i1 %152, float 0x7FF0000000000000, float %162
  %164 = tail call float @llvm.fma.f32(float %163, float %149, float %163)
  %165 = tail call float @llvm.fabs.f32(float %163) #3
  %166 = fcmp oeq float %165, 0x7FF0000000000000
  %167 = select i1 %166, float %163, float %164
  %168 = tail call float @llvm.fabs.f32(float %4)
  %169 = tail call float @llvm.trunc.f32(float %168)
  %170 = fcmp oeq float %168, %169
  %171 = zext i1 %170 to i32
  %172 = fmul float %169, 5.000000e-01
  %173 = tail call float @llvm.amdgcn.fract.f32(float %172)
  %174 = tail call i1 @llvm.amdgcn.class.f32(float %172, i32 516)
  %175 = select i1 %174, float 0.000000e+00, float %173
  %176 = fcmp oeq float %175, 0.000000e+00
  %177 = and i1 %170, %176
  %178 = zext i1 %177 to i32
  %179 = add nuw nsw i32 %178, %171
  %180 = icmp eq i32 %179, 1
  %181 = fcmp olt float %24, 0.000000e+00
  %182 = and i1 %180, %181
  %183 = select i1 %182, float -0.000000e+00, float 0.000000e+00
  %184 = tail call float @llvm.copysign.f32(float %167, float %183)
  %185 = fcmp uge float %24, 0.000000e+00
  %186 = icmp ne i32 %179, 0
  %187 = select i1 %185, i1 true, i1 %186
  %188 = select i1 %187, float %184, float 0x7FF8000000000000
  %189 = fcmp oeq float %168, 0x7FF0000000000000
  br i1 %189, label %190, label %199

190:                                              ; preds = %19
  %191 = fcmp oeq float %25, 1.000000e+00
  %192 = fadd float %25, -1.000000e+00
  %193 = bitcast float %4 to i32
  %194 = bitcast float %192 to i32
  %195 = xor i32 %194, %193
  %196 = icmp sgt i32 %195, -1
  %197 = select i1 %196, float 0x7FF0000000000000, float 0.000000e+00
  %198 = select i1 %191, float %25, float %197
  br label %199

199:                                              ; preds = %19, %190
  %200 = phi float [ %188, %19 ], [ %198, %190 ]
  %201 = fcmp oeq float %25, 0x7FF0000000000000
  %202 = fcmp oeq float %24, 0.000000e+00
  %203 = or i1 %202, %201
  %204 = fcmp olt float %4, 0.000000e+00
  %205 = xor i1 %204, %202
  %206 = select i1 %205, float 0.000000e+00, float 0x7FF0000000000000
  %207 = select i1 %180, float %24, float 0.000000e+00
  %208 = tail call float @llvm.copysign.f32(float %206, float %207)
  %209 = select i1 %203, float %208, float %200
  %210 = fcmp uno float %24, %4
  %211 = select i1 %210, float 0x7FF8000000000000, float %209
  %212 = fcmp oeq float %24, 1.000000e+00
  %213 = fcmp oeq float %4, 0.000000e+00
  %214 = or i1 %213, %212
  %215 = select i1 %214, float 1.000000e+00, float %211
  %216 = mul nsw i32 %17, %7
  %217 = add nsw i32 %216, %6
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds float, float addrspace(1)* %5, i64 %218
  store float %215, float addrspace(1)* %219, align 4, !tbaa !7
  br label %220

220:                                              ; preds = %199, %8
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
