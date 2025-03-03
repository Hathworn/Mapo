; ModuleID = '../data/hip_kernels/9100/9/main.cu'
source_filename = "../data/hip_kernels/9100/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16_bcnn_pow_kerneliPffS_(i32 %0, float addrspace(1)* nocapture readonly %1, float %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = mul i32 %19, %6
  %21 = add i32 %20, %5
  %22 = mul i32 %21, %14
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %0
  br i1 %25, label %26, label %222

26:                                               ; preds = %4
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16, !amdgpu.noclobber !14
  %30 = tail call float @llvm.fabs.f32(float %29)
  %31 = tail call float @llvm.amdgcn.frexp.mant.f32(float %30)
  %32 = fcmp olt float %31, 0x3FE5555560000000
  %33 = zext i1 %32 to i32
  %34 = tail call float @llvm.amdgcn.ldexp.f32(float %31, i32 %33)
  %35 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %30)
  %36 = sub nsw i32 %35, %33
  %37 = fadd float %34, -1.000000e+00
  %38 = fadd float %34, 1.000000e+00
  %39 = fadd float %38, -1.000000e+00
  %40 = fsub float %34, %39
  %41 = tail call float @llvm.amdgcn.rcp.f32(float %38)
  %42 = fmul float %37, %41
  %43 = fmul float %38, %42
  %44 = fneg float %43
  %45 = tail call float @llvm.fma.f32(float %42, float %38, float %44)
  %46 = tail call float @llvm.fma.f32(float %42, float %40, float %45)
  %47 = fadd float %43, %46
  %48 = fsub float %47, %43
  %49 = fsub float %46, %48
  %50 = fsub float %37, %47
  %51 = fsub float %37, %50
  %52 = fsub float %51, %47
  %53 = fsub float %52, %49
  %54 = fadd float %50, %53
  %55 = fmul float %41, %54
  %56 = fadd float %42, %55
  %57 = fsub float %56, %42
  %58 = fsub float %55, %57
  %59 = fmul float %56, %56
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %56, float %56, float %60)
  %62 = fmul float %58, 2.000000e+00
  %63 = tail call float @llvm.fma.f32(float %56, float %62, float %61)
  %64 = fadd float %59, %63
  %65 = fsub float %64, %59
  %66 = fsub float %63, %65
  %67 = tail call float @llvm.fmuladd.f32(float %64, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %68 = tail call float @llvm.fmuladd.f32(float %64, float %67, float 0x3FD999BDE0000000)
  %69 = sitofp i32 %36 to float
  %70 = fmul float %69, 0x3FE62E4300000000
  %71 = fneg float %70
  %72 = tail call float @llvm.fma.f32(float %69, float 0x3FE62E4300000000, float %71)
  %73 = tail call float @llvm.fma.f32(float %69, float 0xBE205C6100000000, float %72)
  %74 = fadd float %70, %73
  %75 = fsub float %74, %70
  %76 = fsub float %73, %75
  %77 = tail call float @llvm.amdgcn.ldexp.f32(float %56, i32 1)
  %78 = fmul float %56, %64
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %64, float %56, float %79)
  %81 = tail call float @llvm.fma.f32(float %64, float %58, float %80)
  %82 = tail call float @llvm.fma.f32(float %66, float %56, float %81)
  %83 = fadd float %78, %82
  %84 = fsub float %83, %78
  %85 = fsub float %82, %84
  %86 = fmul float %64, %68
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %64, float %68, float %87)
  %89 = tail call float @llvm.fma.f32(float %66, float %68, float %88)
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = fadd float %90, 0x3FE5555540000000
  %94 = fadd float %93, 0xBFE5555540000000
  %95 = fsub float %90, %94
  %96 = fadd float %92, 0x3E2E720200000000
  %97 = fadd float %96, %95
  %98 = fadd float %93, %97
  %99 = fsub float %98, %93
  %100 = fsub float %97, %99
  %101 = fmul float %83, %98
  %102 = fneg float %101
  %103 = tail call float @llvm.fma.f32(float %83, float %98, float %102)
  %104 = tail call float @llvm.fma.f32(float %83, float %100, float %103)
  %105 = tail call float @llvm.fma.f32(float %85, float %98, float %104)
  %106 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 1)
  %107 = fadd float %101, %105
  %108 = fsub float %107, %101
  %109 = fsub float %105, %108
  %110 = fadd float %77, %107
  %111 = fsub float %110, %77
  %112 = fsub float %107, %111
  %113 = fadd float %106, %109
  %114 = fadd float %113, %112
  %115 = fadd float %110, %114
  %116 = fsub float %115, %110
  %117 = fsub float %114, %116
  %118 = fadd float %74, %115
  %119 = fsub float %118, %74
  %120 = fsub float %118, %119
  %121 = fsub float %74, %120
  %122 = fsub float %115, %119
  %123 = fadd float %122, %121
  %124 = fadd float %76, %117
  %125 = fsub float %124, %76
  %126 = fsub float %124, %125
  %127 = fsub float %76, %126
  %128 = fsub float %117, %125
  %129 = fadd float %128, %127
  %130 = fadd float %124, %123
  %131 = fadd float %118, %130
  %132 = fsub float %131, %118
  %133 = fsub float %130, %132
  %134 = fadd float %129, %133
  %135 = fadd float %131, %134
  %136 = fsub float %135, %131
  %137 = fsub float %134, %136
  %138 = fmul float %135, %2
  %139 = fneg float %138
  %140 = tail call float @llvm.fma.f32(float %2, float %135, float %139)
  %141 = tail call float @llvm.fma.f32(float %2, float %137, float %140)
  %142 = fadd float %138, %141
  %143 = fsub float %142, %138
  %144 = fsub float %141, %143
  %145 = tail call float @llvm.fabs.f32(float %138) #3
  %146 = fcmp oeq float %145, 0x7FF0000000000000
  %147 = select i1 %146, float %138, float %142
  %148 = tail call float @llvm.fabs.f32(float %147) #3
  %149 = fcmp oeq float %148, 0x7FF0000000000000
  %150 = select i1 %149, float 0.000000e+00, float %144
  %151 = fcmp oeq float %147, 0x40562E4300000000
  %152 = select i1 %151, float 0x3EE0000000000000, float 0.000000e+00
  %153 = fsub float %147, %152
  %154 = fadd float %152, %150
  %155 = fmul float %153, 0x3FF7154760000000
  %156 = tail call float @llvm.rint.f32(float %155)
  %157 = fcmp ogt float %153, 0x40562E4300000000
  %158 = fcmp olt float %153, 0xC059D1DA00000000
  %159 = fneg float %155
  %160 = tail call float @llvm.fma.f32(float %153, float 0x3FF7154760000000, float %159)
  %161 = tail call float @llvm.fma.f32(float %153, float 0x3E54AE0BE0000000, float %160)
  %162 = fsub float %155, %156
  %163 = fadd float %161, %162
  %164 = tail call float @llvm.exp2.f32(float %163)
  %165 = fptosi float %156 to i32
  %166 = tail call float @llvm.amdgcn.ldexp.f32(float %164, i32 %165)
  %167 = select i1 %158, float 0.000000e+00, float %166
  %168 = select i1 %157, float 0x7FF0000000000000, float %167
  %169 = tail call float @llvm.fma.f32(float %168, float %154, float %168)
  %170 = tail call float @llvm.fabs.f32(float %168) #3
  %171 = fcmp oeq float %170, 0x7FF0000000000000
  %172 = select i1 %171, float %168, float %169
  %173 = tail call float @llvm.fabs.f32(float %2)
  %174 = tail call float @llvm.trunc.f32(float %173)
  %175 = fcmp oeq float %173, %174
  %176 = zext i1 %175 to i32
  %177 = fmul float %174, 5.000000e-01
  %178 = tail call float @llvm.amdgcn.fract.f32(float %177)
  %179 = tail call i1 @llvm.amdgcn.class.f32(float %177, i32 516)
  %180 = select i1 %179, float 0.000000e+00, float %178
  %181 = fcmp oeq float %180, 0.000000e+00
  %182 = and i1 %175, %181
  %183 = zext i1 %182 to i32
  %184 = add nuw nsw i32 %183, %176
  %185 = icmp eq i32 %184, 1
  %186 = fcmp olt float %29, 0.000000e+00
  %187 = and i1 %185, %186
  %188 = select i1 %187, float -0.000000e+00, float 0.000000e+00
  %189 = tail call float @llvm.copysign.f32(float %172, float %188)
  %190 = fcmp uge float %29, 0.000000e+00
  %191 = icmp ne i32 %184, 0
  %192 = select i1 %190, i1 true, i1 %191
  %193 = select i1 %192, float %189, float 0x7FF8000000000000
  %194 = fcmp oeq float %173, 0x7FF0000000000000
  br i1 %194, label %195, label %204

195:                                              ; preds = %26
  %196 = fcmp oeq float %30, 1.000000e+00
  %197 = fadd float %30, -1.000000e+00
  %198 = bitcast float %2 to i32
  %199 = bitcast float %197 to i32
  %200 = xor i32 %199, %198
  %201 = icmp sgt i32 %200, -1
  %202 = select i1 %201, float 0x7FF0000000000000, float 0.000000e+00
  %203 = select i1 %196, float %30, float %202
  br label %204

204:                                              ; preds = %26, %195
  %205 = phi float [ %193, %26 ], [ %203, %195 ]
  %206 = fcmp oeq float %30, 0x7FF0000000000000
  %207 = fcmp oeq float %29, 0.000000e+00
  %208 = or i1 %207, %206
  %209 = fcmp olt float %2, 0.000000e+00
  %210 = xor i1 %209, %207
  %211 = select i1 %210, float 0.000000e+00, float 0x7FF0000000000000
  %212 = select i1 %185, float %29, float 0.000000e+00
  %213 = tail call float @llvm.copysign.f32(float %211, float %212)
  %214 = select i1 %208, float %213, float %205
  %215 = fcmp uno float %29, %2
  %216 = select i1 %215, float 0x7FF8000000000000, float %214
  %217 = fcmp oeq float %29, 1.000000e+00
  %218 = fcmp oeq float %2, 0.000000e+00
  %219 = or i1 %218, %217
  %220 = select i1 %219, float 1.000000e+00, float %216
  %221 = getelementptr inbounds float, float addrspace(1)* %3, i64 %27
  store float %220, float addrspace(1)* %221, align 4, !tbaa !16
  br label %222

222:                                              ; preds = %204, %4
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
