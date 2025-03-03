; ModuleID = '../data/hip_kernels/1296/25/main.cu'
source_filename = "../data/hip_kernels/1296/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10pow_kernelifPfiS_i(i32 %0, float %1, float addrspace(1)* nocapture readonly %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !4
  %13 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !13, !invariant.load !14
  %16 = zext i16 %15 to i32
  %17 = udiv i32 %12, %16
  %18 = mul i32 %17, %16
  %19 = icmp ugt i32 %12, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %8
  %23 = add i32 %22, %7
  %24 = mul i32 %23, %16
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %26, %0
  br i1 %27, label %28, label %227

28:                                               ; preds = %6
  %29 = mul nsw i32 %26, %3
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !14
  %33 = tail call float @llvm.fabs.f32(float %32)
  %34 = tail call float @llvm.amdgcn.frexp.mant.f32(float %33)
  %35 = fcmp olt float %34, 0x3FE5555560000000
  %36 = zext i1 %35 to i32
  %37 = tail call float @llvm.amdgcn.ldexp.f32(float %34, i32 %36)
  %38 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %33)
  %39 = sub nsw i32 %38, %36
  %40 = fadd float %37, -1.000000e+00
  %41 = fadd float %37, 1.000000e+00
  %42 = fadd float %41, -1.000000e+00
  %43 = fsub float %37, %42
  %44 = tail call float @llvm.amdgcn.rcp.f32(float %41)
  %45 = fmul float %40, %44
  %46 = fmul float %41, %45
  %47 = fneg float %46
  %48 = tail call float @llvm.fma.f32(float %45, float %41, float %47)
  %49 = tail call float @llvm.fma.f32(float %45, float %43, float %48)
  %50 = fadd float %46, %49
  %51 = fsub float %50, %46
  %52 = fsub float %49, %51
  %53 = fsub float %40, %50
  %54 = fsub float %40, %53
  %55 = fsub float %54, %50
  %56 = fsub float %55, %52
  %57 = fadd float %53, %56
  %58 = fmul float %44, %57
  %59 = fadd float %45, %58
  %60 = fsub float %59, %45
  %61 = fsub float %58, %60
  %62 = fmul float %59, %59
  %63 = fneg float %62
  %64 = tail call float @llvm.fma.f32(float %59, float %59, float %63)
  %65 = fmul float %61, 2.000000e+00
  %66 = tail call float @llvm.fma.f32(float %59, float %65, float %64)
  %67 = fadd float %62, %66
  %68 = fsub float %67, %62
  %69 = fsub float %66, %68
  %70 = tail call float @llvm.fmuladd.f32(float %67, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %71 = tail call float @llvm.fmuladd.f32(float %67, float %70, float 0x3FD999BDE0000000)
  %72 = sitofp i32 %39 to float
  %73 = fmul float %72, 0x3FE62E4300000000
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %72, float 0x3FE62E4300000000, float %74)
  %76 = tail call float @llvm.fma.f32(float %72, float 0xBE205C6100000000, float %75)
  %77 = fadd float %73, %76
  %78 = fsub float %77, %73
  %79 = fsub float %76, %78
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %59, i32 1)
  %81 = fmul float %59, %67
  %82 = fneg float %81
  %83 = tail call float @llvm.fma.f32(float %67, float %59, float %82)
  %84 = tail call float @llvm.fma.f32(float %67, float %61, float %83)
  %85 = tail call float @llvm.fma.f32(float %69, float %59, float %84)
  %86 = fadd float %81, %85
  %87 = fsub float %86, %81
  %88 = fsub float %85, %87
  %89 = fmul float %67, %71
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %67, float %71, float %90)
  %92 = tail call float @llvm.fma.f32(float %69, float %71, float %91)
  %93 = fadd float %89, %92
  %94 = fsub float %93, %89
  %95 = fsub float %92, %94
  %96 = fadd float %93, 0x3FE5555540000000
  %97 = fadd float %96, 0xBFE5555540000000
  %98 = fsub float %93, %97
  %99 = fadd float %95, 0x3E2E720200000000
  %100 = fadd float %99, %98
  %101 = fadd float %96, %100
  %102 = fsub float %101, %96
  %103 = fsub float %100, %102
  %104 = fmul float %86, %101
  %105 = fneg float %104
  %106 = tail call float @llvm.fma.f32(float %86, float %101, float %105)
  %107 = tail call float @llvm.fma.f32(float %86, float %103, float %106)
  %108 = tail call float @llvm.fma.f32(float %88, float %101, float %107)
  %109 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 1)
  %110 = fadd float %104, %108
  %111 = fsub float %110, %104
  %112 = fsub float %108, %111
  %113 = fadd float %80, %110
  %114 = fsub float %113, %80
  %115 = fsub float %110, %114
  %116 = fadd float %109, %112
  %117 = fadd float %116, %115
  %118 = fadd float %113, %117
  %119 = fsub float %118, %113
  %120 = fsub float %117, %119
  %121 = fadd float %77, %118
  %122 = fsub float %121, %77
  %123 = fsub float %121, %122
  %124 = fsub float %77, %123
  %125 = fsub float %118, %122
  %126 = fadd float %125, %124
  %127 = fadd float %79, %120
  %128 = fsub float %127, %79
  %129 = fsub float %127, %128
  %130 = fsub float %79, %129
  %131 = fsub float %120, %128
  %132 = fadd float %131, %130
  %133 = fadd float %127, %126
  %134 = fadd float %121, %133
  %135 = fsub float %134, %121
  %136 = fsub float %133, %135
  %137 = fadd float %132, %136
  %138 = fadd float %134, %137
  %139 = fsub float %138, %134
  %140 = fsub float %137, %139
  %141 = fmul float %138, %1
  %142 = fneg float %141
  %143 = tail call float @llvm.fma.f32(float %1, float %138, float %142)
  %144 = tail call float @llvm.fma.f32(float %1, float %140, float %143)
  %145 = fadd float %141, %144
  %146 = fsub float %145, %141
  %147 = fsub float %144, %146
  %148 = tail call float @llvm.fabs.f32(float %141) #3
  %149 = fcmp oeq float %148, 0x7FF0000000000000
  %150 = select i1 %149, float %141, float %145
  %151 = tail call float @llvm.fabs.f32(float %150) #3
  %152 = fcmp oeq float %151, 0x7FF0000000000000
  %153 = select i1 %152, float 0.000000e+00, float %147
  %154 = fcmp oeq float %150, 0x40562E4300000000
  %155 = select i1 %154, float 0x3EE0000000000000, float 0.000000e+00
  %156 = fsub float %150, %155
  %157 = fadd float %155, %153
  %158 = fmul float %156, 0x3FF7154760000000
  %159 = tail call float @llvm.rint.f32(float %158)
  %160 = fcmp ogt float %156, 0x40562E4300000000
  %161 = fcmp olt float %156, 0xC059D1DA00000000
  %162 = fneg float %158
  %163 = tail call float @llvm.fma.f32(float %156, float 0x3FF7154760000000, float %162)
  %164 = tail call float @llvm.fma.f32(float %156, float 0x3E54AE0BE0000000, float %163)
  %165 = fsub float %158, %159
  %166 = fadd float %164, %165
  %167 = tail call float @llvm.exp2.f32(float %166)
  %168 = fptosi float %159 to i32
  %169 = tail call float @llvm.amdgcn.ldexp.f32(float %167, i32 %168)
  %170 = select i1 %161, float 0.000000e+00, float %169
  %171 = select i1 %160, float 0x7FF0000000000000, float %170
  %172 = tail call float @llvm.fma.f32(float %171, float %157, float %171)
  %173 = tail call float @llvm.fabs.f32(float %171) #3
  %174 = fcmp oeq float %173, 0x7FF0000000000000
  %175 = select i1 %174, float %171, float %172
  %176 = tail call float @llvm.fabs.f32(float %1)
  %177 = tail call float @llvm.trunc.f32(float %176)
  %178 = fcmp oeq float %176, %177
  %179 = zext i1 %178 to i32
  %180 = fmul float %177, 5.000000e-01
  %181 = tail call float @llvm.amdgcn.fract.f32(float %180)
  %182 = tail call i1 @llvm.amdgcn.class.f32(float %180, i32 516)
  %183 = select i1 %182, float 0.000000e+00, float %181
  %184 = fcmp oeq float %183, 0.000000e+00
  %185 = and i1 %178, %184
  %186 = zext i1 %185 to i32
  %187 = add nuw nsw i32 %186, %179
  %188 = icmp eq i32 %187, 1
  %189 = fcmp olt float %32, 0.000000e+00
  %190 = and i1 %188, %189
  %191 = select i1 %190, float -0.000000e+00, float 0.000000e+00
  %192 = tail call float @llvm.copysign.f32(float %175, float %191)
  %193 = fcmp uge float %32, 0.000000e+00
  %194 = icmp ne i32 %187, 0
  %195 = select i1 %193, i1 true, i1 %194
  %196 = select i1 %195, float %192, float 0x7FF8000000000000
  %197 = fcmp oeq float %176, 0x7FF0000000000000
  br i1 %197, label %198, label %207

198:                                              ; preds = %28
  %199 = fcmp oeq float %33, 1.000000e+00
  %200 = fadd float %33, -1.000000e+00
  %201 = bitcast float %1 to i32
  %202 = bitcast float %200 to i32
  %203 = xor i32 %202, %201
  %204 = icmp sgt i32 %203, -1
  %205 = select i1 %204, float 0x7FF0000000000000, float 0.000000e+00
  %206 = select i1 %199, float %33, float %205
  br label %207

207:                                              ; preds = %28, %198
  %208 = phi float [ %196, %28 ], [ %206, %198 ]
  %209 = fcmp oeq float %33, 0x7FF0000000000000
  %210 = fcmp oeq float %32, 0.000000e+00
  %211 = or i1 %210, %209
  %212 = fcmp olt float %1, 0.000000e+00
  %213 = xor i1 %212, %210
  %214 = select i1 %213, float 0.000000e+00, float 0x7FF0000000000000
  %215 = select i1 %188, float %32, float 0.000000e+00
  %216 = tail call float @llvm.copysign.f32(float %214, float %215)
  %217 = select i1 %211, float %216, float %208
  %218 = fcmp uno float %32, %1
  %219 = select i1 %218, float 0x7FF8000000000000, float %217
  %220 = fcmp oeq float %32, 1.000000e+00
  %221 = fcmp oeq float %1, 0.000000e+00
  %222 = or i1 %221, %220
  %223 = select i1 %222, float 1.000000e+00, float %219
  %224 = mul nsw i32 %26, %5
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds float, float addrspace(1)* %4, i64 %225
  store float %223, float addrspace(1)* %226, align 4, !tbaa !16
  br label %227

227:                                              ; preds = %207, %6
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
