; ModuleID = '../data/hip_kernels/15412/146/main.cu'
source_filename = "../data/hip_kernels/15412/146/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z26gradient_array_mish_kerneliPfS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = add i32 %19, %4
  %21 = mul i32 %20, %13
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %23, %0
  br i1 %24, label %25, label %229

25:                                               ; preds = %3
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %26
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !14
  %29 = fcmp contract ogt float %28, 2.000000e+01
  br i1 %29, label %163, label %30

30:                                               ; preds = %25
  %31 = fcmp contract olt float %28, -2.000000e+01
  %32 = fmul float %28, 0x3FF7154760000000
  %33 = tail call float @llvm.rint.f32(float %32)
  %34 = fcmp ogt float %28, 0x40562E4300000000
  %35 = fcmp olt float %28, 0xC059D1DA00000000
  %36 = fneg float %32
  %37 = tail call float @llvm.fma.f32(float %28, float 0x3FF7154760000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %28, float 0x3E54AE0BE0000000, float %37)
  %39 = fsub float %32, %33
  %40 = fadd float %38, %39
  %41 = tail call float @llvm.exp2.f32(float %40)
  %42 = fptosi float %33 to i32
  %43 = tail call float @llvm.amdgcn.ldexp.f32(float %41, i32 %42)
  %44 = select i1 %35, float 0.000000e+00, float %43
  %45 = select i1 %34, float 0x7FF0000000000000, float %44
  br i1 %31, label %163, label %46

46:                                               ; preds = %30
  %47 = fadd float %45, 1.000000e+00
  %48 = fadd float %47, -1.000000e+00
  %49 = fsub float %48, %47
  %50 = fadd float %49, 1.000000e+00
  %51 = fsub float %45, %48
  %52 = fadd float %51, %50
  %53 = tail call float @llvm.amdgcn.frexp.mant.f32(float %47)
  %54 = fcmp olt float %53, 0x3FE5555560000000
  %55 = sext i1 %54 to i32
  %56 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %47)
  %57 = add i32 %56, %55
  %58 = sub nsw i32 0, %57
  %59 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 %58)
  %60 = tail call float @llvm.amdgcn.ldexp.f32(float %52, i32 %58)
  %61 = fadd float %59, -1.000000e+00
  %62 = fadd float %61, 1.000000e+00
  %63 = fsub float %59, %62
  %64 = fadd float %60, %63
  %65 = fadd float %61, %64
  %66 = fsub float %65, %61
  %67 = fsub float %64, %66
  %68 = fadd float %59, 1.000000e+00
  %69 = fadd float %68, -1.000000e+00
  %70 = fsub float %59, %69
  %71 = fadd float %60, %70
  %72 = fadd float %68, %71
  %73 = fsub float %72, %68
  %74 = fsub float %71, %73
  %75 = tail call float @llvm.amdgcn.rcp.f32(float %72)
  %76 = fmul float %65, %75
  %77 = fmul float %72, %76
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %76, float %72, float %78)
  %80 = tail call float @llvm.fma.f32(float %76, float %74, float %79)
  %81 = fadd float %77, %80
  %82 = fsub float %81, %77
  %83 = fsub float %80, %82
  %84 = fsub float %65, %81
  %85 = fsub float %65, %84
  %86 = fsub float %85, %81
  %87 = fadd float %67, %86
  %88 = fsub float %87, %83
  %89 = fadd float %84, %88
  %90 = fmul float %75, %89
  %91 = fmul float %72, %90
  %92 = fneg float %91
  %93 = tail call float @llvm.fma.f32(float %90, float %72, float %92)
  %94 = tail call float @llvm.fma.f32(float %90, float %74, float %93)
  %95 = fsub float %89, %84
  %96 = fsub float %88, %95
  %97 = fadd float %91, %94
  %98 = fsub float %97, %91
  %99 = fsub float %94, %98
  %100 = fsub float %89, %97
  %101 = fsub float %89, %100
  %102 = fsub float %101, %97
  %103 = fadd float %96, %102
  %104 = fsub float %103, %99
  %105 = fadd float %100, %104
  %106 = fmul float %75, %105
  %107 = fadd float %76, %90
  %108 = fsub float %107, %76
  %109 = fsub float %90, %108
  %110 = fadd float %109, %106
  %111 = fadd float %107, %110
  %112 = fmul float %111, %111
  %113 = tail call float @llvm.fmuladd.f32(float %112, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %114 = tail call float @llvm.fmuladd.f32(float %112, float %113, float 0x3FE5555B40000000)
  %115 = sitofp i32 %57 to float
  %116 = fmul float %115, 0x3FE62E4300000000
  %117 = fneg float %116
  %118 = tail call float @llvm.fma.f32(float %115, float 0x3FE62E4300000000, float %117)
  %119 = tail call float @llvm.fma.f32(float %115, float 0xBE205C6100000000, float %118)
  %120 = fsub float %111, %107
  %121 = fsub float %110, %120
  %122 = fadd float %116, %119
  %123 = fsub float %122, %116
  %124 = fsub float %119, %123
  %125 = tail call float @llvm.amdgcn.ldexp.f32(float %111, i32 1)
  %126 = tail call float @llvm.amdgcn.ldexp.f32(float %121, i32 1)
  %127 = fmul float %111, %112
  %128 = fmul float %127, %114
  %129 = fadd float %125, %128
  %130 = fsub float %129, %125
  %131 = fsub float %128, %130
  %132 = fadd float %126, %131
  %133 = fadd float %129, %132
  %134 = fsub float %133, %129
  %135 = fsub float %132, %134
  %136 = fadd float %122, %133
  %137 = fsub float %136, %122
  %138 = fsub float %136, %137
  %139 = fsub float %122, %138
  %140 = fsub float %133, %137
  %141 = fadd float %140, %139
  %142 = fadd float %124, %135
  %143 = fsub float %142, %124
  %144 = fsub float %142, %143
  %145 = fsub float %124, %144
  %146 = fsub float %135, %143
  %147 = fadd float %146, %145
  %148 = fadd float %142, %141
  %149 = fadd float %136, %148
  %150 = fsub float %149, %136
  %151 = fsub float %148, %150
  %152 = fadd float %147, %151
  %153 = fadd float %149, %152
  %154 = tail call i1 @llvm.amdgcn.class.f32(float %45, i32 512)
  %155 = select i1 %154, float %45, float %153
  %156 = fcmp olt float %45, -1.000000e+00
  %157 = select i1 %156, float 0x7FF8000000000000, float %155
  %158 = fcmp oeq float %45, -1.000000e+00
  %159 = select i1 %158, float 0xFFF0000000000000, float %157
  %160 = tail call float @llvm.fabs.f32(float %45)
  %161 = fcmp olt float %160, 0x3E70000000000000
  %162 = select i1 %161, float %45, float %159
  br label %163

163:                                              ; preds = %25, %30, %46
  %164 = phi float [ %162, %46 ], [ %28, %25 ], [ %45, %30 ]
  %165 = fneg contract float %164
  %166 = fmul float %164, 0xBFF7154760000000
  %167 = tail call float @llvm.rint.f32(float %166)
  %168 = fneg float %167
  %169 = tail call float @llvm.fma.f32(float %168, float 0x3FE62E4300000000, float %165)
  %170 = tail call float @llvm.fma.f32(float %168, float 0xBE205C6100000000, float %169)
  %171 = tail call float @llvm.fmuladd.f32(float %170, float 0x3F2A267620000000, float 0x3F56D2E000000000)
  %172 = tail call float @llvm.fmuladd.f32(float %170, float %171, float 0x3F8110FF20000000)
  %173 = tail call float @llvm.fmuladd.f32(float %170, float %172, float 0x3FA5555020000000)
  %174 = tail call float @llvm.fmuladd.f32(float %170, float %173, float 0x3FC5555560000000)
  %175 = tail call float @llvm.fmuladd.f32(float %170, float %174, float 5.000000e-01)
  %176 = fmul float %170, %175
  %177 = tail call float @llvm.fma.f32(float %170, float %176, float %170)
  %178 = fcmp oeq float %167, 1.280000e+02
  %179 = fptosi float %167 to i32
  %180 = select i1 %178, i32 127, i32 %179
  %181 = tail call float @llvm.amdgcn.ldexp.f32(float 1.000000e+00, i32 %180)
  %182 = fadd float %181, -1.000000e+00
  %183 = tail call float @llvm.fma.f32(float %181, float %177, float %182)
  %184 = fmul float %183, 2.000000e+00
  %185 = select i1 %178, float %184, float %183
  %186 = fcmp olt float %164, 0xC0562E42E0000000
  %187 = select i1 %186, float 0x7FF0000000000000, float %185
  %188 = fcmp ogt float %164, 1.700000e+01
  %189 = select i1 %188, float -1.000000e+00, float %187
  %190 = fneg contract float %189
  %191 = tail call float @llvm.fabs.f32(float %164)
  %192 = fcmp olt float %191, 6.250000e-01
  br i1 %192, label %193, label %201

193:                                              ; preds = %163
  %194 = fmul float %164, %164
  %195 = tail call float @llvm.fmuladd.f32(float %194, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %196 = tail call float @llvm.fmuladd.f32(float %194, float %195, float 0xBFAB8389C0000000)
  %197 = tail call float @llvm.fmuladd.f32(float %194, float %196, float 0x3FC1107040000000)
  %198 = tail call float @llvm.fmuladd.f32(float %194, float %197, float 0xBFD5555320000000)
  %199 = fmul float %191, %198
  %200 = tail call float @llvm.fmuladd.f32(float %194, float %199, float %191)
  br label %218

201:                                              ; preds = %163
  %202 = fmul float %191, 2.000000e+00
  %203 = fmul float %202, 0x3FF7154760000000
  %204 = tail call float @llvm.rint.f32(float %203)
  %205 = fcmp ogt float %202, 0x40562E4300000000
  %206 = fneg float %203
  %207 = tail call float @llvm.fma.f32(float %202, float 0x3FF7154760000000, float %206)
  %208 = tail call float @llvm.fma.f32(float %202, float 0x3E54AE0BE0000000, float %207)
  %209 = fsub float %203, %204
  %210 = fadd float %208, %209
  %211 = tail call float @llvm.exp2.f32(float %210)
  %212 = fptosi float %204 to i32
  %213 = tail call float @llvm.amdgcn.ldexp.f32(float %211, i32 %212)
  %214 = fadd float %213, 1.000000e+00
  %215 = select i1 %205, float 0x7FF0000000000000, float %214
  %216 = tail call float @llvm.amdgcn.rcp.f32(float %215)
  %217 = tail call float @llvm.fmuladd.f32(float %216, float -2.000000e+00, float 1.000000e+00)
  br label %218

218:                                              ; preds = %193, %201
  %219 = phi float [ %200, %193 ], [ %217, %201 ]
  %220 = tail call float @llvm.copysign.f32(float %219, float %164)
  %221 = fmul contract float %220, %220
  %222 = fsub contract float 1.000000e+00, %221
  %223 = fmul contract float %222, %190
  %224 = fmul contract float %28, %223
  %225 = fadd contract float %220, %224
  %226 = getelementptr inbounds float, float addrspace(1)* %2, i64 %26
  %227 = load float, float addrspace(1)* %226, align 4, !tbaa !16, !amdgpu.noclobber !14
  %228 = fmul contract float %227, %225
  store float %228, float addrspace(1)* %226, align 4, !tbaa !16
  br label %229

229:                                              ; preds = %218, %3
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
