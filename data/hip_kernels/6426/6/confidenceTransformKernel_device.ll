; ModuleID = '../data/hip_kernels/6426/6/main.cu'
source_filename = "../data/hip_kernels/6426/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z25confidenceTransformKerneliifffPKfPf(i32 %0, i32 %1, float %2, float %3, float %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp ult i32 %16, %0
  %26 = icmp ult i32 %24, %1
  %27 = select i1 %25, i1 %26, i1 false
  br i1 %27, label %28, label %230

28:                                               ; preds = %7
  %29 = mul i32 %24, %0
  %30 = add i32 %29, %16
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %5, i64 %31
  %33 = load float, float addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  %34 = fcmp contract olt float %33, %2
  br i1 %34, label %227, label %35

35:                                               ; preds = %28
  %36 = tail call float @llvm.fabs.f32(float %33)
  %37 = tail call float @llvm.amdgcn.frexp.mant.f32(float %36)
  %38 = fcmp olt float %37, 0x3FE5555560000000
  %39 = zext i1 %38 to i32
  %40 = tail call float @llvm.amdgcn.ldexp.f32(float %37, i32 %39)
  %41 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %36)
  %42 = sub nsw i32 %41, %39
  %43 = fadd float %40, -1.000000e+00
  %44 = fadd float %40, 1.000000e+00
  %45 = fadd float %44, -1.000000e+00
  %46 = fsub float %40, %45
  %47 = tail call float @llvm.amdgcn.rcp.f32(float %44)
  %48 = fmul float %43, %47
  %49 = fmul float %44, %48
  %50 = fneg float %49
  %51 = tail call float @llvm.fma.f32(float %48, float %44, float %50)
  %52 = tail call float @llvm.fma.f32(float %48, float %46, float %51)
  %53 = fadd float %49, %52
  %54 = fsub float %53, %49
  %55 = fsub float %52, %54
  %56 = fsub float %43, %53
  %57 = fsub float %43, %56
  %58 = fsub float %57, %53
  %59 = fsub float %58, %55
  %60 = fadd float %56, %59
  %61 = fmul float %47, %60
  %62 = fadd float %48, %61
  %63 = fsub float %62, %48
  %64 = fsub float %61, %63
  %65 = fmul float %62, %62
  %66 = fneg float %65
  %67 = tail call float @llvm.fma.f32(float %62, float %62, float %66)
  %68 = fmul float %64, 2.000000e+00
  %69 = tail call float @llvm.fma.f32(float %62, float %68, float %67)
  %70 = fadd float %65, %69
  %71 = fsub float %70, %65
  %72 = fsub float %69, %71
  %73 = tail call float @llvm.fmuladd.f32(float %70, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %74 = tail call float @llvm.fmuladd.f32(float %70, float %73, float 0x3FD999BDE0000000)
  %75 = sitofp i32 %42 to float
  %76 = fmul float %75, 0x3FE62E4300000000
  %77 = fneg float %76
  %78 = tail call float @llvm.fma.f32(float %75, float 0x3FE62E4300000000, float %77)
  %79 = tail call float @llvm.fma.f32(float %75, float 0xBE205C6100000000, float %78)
  %80 = fadd float %76, %79
  %81 = fsub float %80, %76
  %82 = fsub float %79, %81
  %83 = tail call float @llvm.amdgcn.ldexp.f32(float %62, i32 1)
  %84 = fmul float %62, %70
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %70, float %62, float %85)
  %87 = tail call float @llvm.fma.f32(float %70, float %64, float %86)
  %88 = tail call float @llvm.fma.f32(float %72, float %62, float %87)
  %89 = fadd float %84, %88
  %90 = fsub float %89, %84
  %91 = fsub float %88, %90
  %92 = fmul float %70, %74
  %93 = fneg float %92
  %94 = tail call float @llvm.fma.f32(float %70, float %74, float %93)
  %95 = tail call float @llvm.fma.f32(float %72, float %74, float %94)
  %96 = fadd float %92, %95
  %97 = fsub float %96, %92
  %98 = fsub float %95, %97
  %99 = fadd float %96, 0x3FE5555540000000
  %100 = fadd float %99, 0xBFE5555540000000
  %101 = fsub float %96, %100
  %102 = fadd float %98, 0x3E2E720200000000
  %103 = fadd float %102, %101
  %104 = fadd float %99, %103
  %105 = fsub float %104, %99
  %106 = fsub float %103, %105
  %107 = fmul float %89, %104
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %89, float %104, float %108)
  %110 = tail call float @llvm.fma.f32(float %89, float %106, float %109)
  %111 = tail call float @llvm.fma.f32(float %91, float %104, float %110)
  %112 = tail call float @llvm.amdgcn.ldexp.f32(float %64, i32 1)
  %113 = fadd float %107, %111
  %114 = fsub float %113, %107
  %115 = fsub float %111, %114
  %116 = fadd float %83, %113
  %117 = fsub float %116, %83
  %118 = fsub float %113, %117
  %119 = fadd float %112, %115
  %120 = fadd float %119, %118
  %121 = fadd float %116, %120
  %122 = fsub float %121, %116
  %123 = fsub float %120, %122
  %124 = fadd float %80, %121
  %125 = fsub float %124, %80
  %126 = fsub float %124, %125
  %127 = fsub float %80, %126
  %128 = fsub float %121, %125
  %129 = fadd float %128, %127
  %130 = fadd float %82, %123
  %131 = fsub float %130, %82
  %132 = fsub float %130, %131
  %133 = fsub float %82, %132
  %134 = fsub float %123, %131
  %135 = fadd float %134, %133
  %136 = fadd float %130, %129
  %137 = fadd float %124, %136
  %138 = fsub float %137, %124
  %139 = fsub float %136, %138
  %140 = fadd float %135, %139
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = fmul float %141, %3
  %145 = fneg float %144
  %146 = tail call float @llvm.fma.f32(float %3, float %141, float %145)
  %147 = tail call float @llvm.fma.f32(float %3, float %143, float %146)
  %148 = fadd float %144, %147
  %149 = fsub float %148, %144
  %150 = fsub float %147, %149
  %151 = tail call float @llvm.fabs.f32(float %144) #3
  %152 = fcmp oeq float %151, 0x7FF0000000000000
  %153 = select i1 %152, float %144, float %148
  %154 = tail call float @llvm.fabs.f32(float %153) #3
  %155 = fcmp oeq float %154, 0x7FF0000000000000
  %156 = select i1 %155, float 0.000000e+00, float %150
  %157 = fcmp oeq float %153, 0x40562E4300000000
  %158 = select i1 %157, float 0x3EE0000000000000, float 0.000000e+00
  %159 = fsub float %153, %158
  %160 = fadd float %158, %156
  %161 = fmul float %159, 0x3FF7154760000000
  %162 = tail call float @llvm.rint.f32(float %161)
  %163 = fcmp ogt float %159, 0x40562E4300000000
  %164 = fcmp olt float %159, 0xC059D1DA00000000
  %165 = fneg float %161
  %166 = tail call float @llvm.fma.f32(float %159, float 0x3FF7154760000000, float %165)
  %167 = tail call float @llvm.fma.f32(float %159, float 0x3E54AE0BE0000000, float %166)
  %168 = fsub float %161, %162
  %169 = fadd float %167, %168
  %170 = tail call float @llvm.exp2.f32(float %169)
  %171 = fptosi float %162 to i32
  %172 = tail call float @llvm.amdgcn.ldexp.f32(float %170, i32 %171)
  %173 = select i1 %164, float 0.000000e+00, float %172
  %174 = select i1 %163, float 0x7FF0000000000000, float %173
  %175 = tail call float @llvm.fma.f32(float %174, float %160, float %174)
  %176 = tail call float @llvm.fabs.f32(float %174) #3
  %177 = fcmp oeq float %176, 0x7FF0000000000000
  %178 = select i1 %177, float %174, float %175
  %179 = tail call float @llvm.fabs.f32(float %3)
  %180 = tail call float @llvm.trunc.f32(float %179)
  %181 = fcmp oeq float %179, %180
  %182 = zext i1 %181 to i32
  %183 = fmul float %180, 5.000000e-01
  %184 = tail call float @llvm.amdgcn.fract.f32(float %183)
  %185 = tail call i1 @llvm.amdgcn.class.f32(float %183, i32 516)
  %186 = select i1 %185, float 0.000000e+00, float %184
  %187 = fcmp oeq float %186, 0.000000e+00
  %188 = and i1 %181, %187
  %189 = zext i1 %188 to i32
  %190 = add nuw nsw i32 %189, %182
  %191 = icmp eq i32 %190, 1
  %192 = fcmp olt float %33, 0.000000e+00
  %193 = and i1 %191, %192
  %194 = select i1 %193, float -0.000000e+00, float 0.000000e+00
  %195 = tail call float @llvm.copysign.f32(float %178, float %194)
  %196 = fcmp uge float %33, 0.000000e+00
  %197 = icmp ne i32 %190, 0
  %198 = select i1 %196, i1 true, i1 %197
  %199 = select i1 %198, float %195, float 0x7FF8000000000000
  %200 = fcmp oeq float %179, 0x7FF0000000000000
  br i1 %200, label %201, label %210

201:                                              ; preds = %35
  %202 = fcmp oeq float %36, 1.000000e+00
  %203 = fadd float %36, -1.000000e+00
  %204 = bitcast float %3 to i32
  %205 = bitcast float %203 to i32
  %206 = xor i32 %205, %204
  %207 = icmp sgt i32 %206, -1
  %208 = select i1 %207, float 0x7FF0000000000000, float 0.000000e+00
  %209 = select i1 %202, float %36, float %208
  br label %210

210:                                              ; preds = %35, %201
  %211 = phi float [ %199, %35 ], [ %209, %201 ]
  %212 = fcmp oeq float %36, 0x7FF0000000000000
  %213 = fcmp oeq float %33, 0.000000e+00
  %214 = or i1 %213, %212
  %215 = fcmp olt float %3, 0.000000e+00
  %216 = xor i1 %215, %213
  %217 = select i1 %216, float 0.000000e+00, float 0x7FF0000000000000
  %218 = select i1 %191, float %33, float 0.000000e+00
  %219 = tail call float @llvm.copysign.f32(float %217, float %218)
  %220 = select i1 %214, float %219, float %211
  %221 = fcmp uno float %33, %3
  %222 = select i1 %221, float 0x7FF8000000000000, float %220
  %223 = fcmp oeq float %33, 1.000000e+00
  %224 = fcmp oeq float %3, 0.000000e+00
  %225 = or i1 %224, %223
  %226 = select i1 %225, float 1.000000e+00, float %222
  br label %227

227:                                              ; preds = %28, %210
  %228 = phi float [ %226, %210 ], [ 0.000000e+00, %28 ]
  %229 = getelementptr inbounds float, float addrspace(1)* %6, i64 %31
  store float %228, float addrspace(1)* %229, align 4, !tbaa !7
  br label %230

230:                                              ; preds = %227, %7
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
