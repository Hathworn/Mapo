; ModuleID = '../data/hip_kernels/14395/17/main.cu'
source_filename = "../data/hip_kernels/14395/17/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6cu_powPKfPffi(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, float %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %11
  %23 = icmp slt i32 %16, %3
  br i1 %23, label %24, label %243

24:                                               ; preds = %4
  %25 = tail call float @llvm.fabs.f32(float %2)
  %26 = tail call float @llvm.trunc.f32(float %25)
  %27 = fcmp oeq float %25, %26
  %28 = zext i1 %27 to i32
  %29 = fmul float %26, 5.000000e-01
  %30 = tail call float @llvm.amdgcn.fract.f32(float %29)
  %31 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 516)
  %32 = select i1 %31, float 0.000000e+00, float %30
  %33 = fcmp oeq float %32, 0.000000e+00
  %34 = and i1 %27, %33
  %35 = zext i1 %34 to i32
  %36 = add nuw nsw i32 %35, %28
  %37 = icmp eq i32 %36, 1
  %38 = icmp ne i32 %36, 0
  %39 = fcmp oeq float %25, 0x7FF0000000000000
  %40 = bitcast float %2 to i32
  %41 = fcmp olt float %2, 0.000000e+00
  %42 = fcmp oeq float %2, 0.000000e+00
  br i1 %39, label %214, label %43

43:                                               ; preds = %24, %43
  %44 = phi i32 [ %212, %43 ], [ %16, %24 ]
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !16
  %48 = tail call float @llvm.fabs.f32(float %47)
  %49 = tail call float @llvm.amdgcn.frexp.mant.f32(float %48)
  %50 = fcmp olt float %49, 0x3FE5555560000000
  %51 = zext i1 %50 to i32
  %52 = tail call float @llvm.amdgcn.ldexp.f32(float %49, i32 %51)
  %53 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %48)
  %54 = sub nsw i32 %53, %51
  %55 = fadd float %52, -1.000000e+00
  %56 = fadd float %52, 1.000000e+00
  %57 = fadd float %56, -1.000000e+00
  %58 = fsub float %52, %57
  %59 = tail call float @llvm.amdgcn.rcp.f32(float %56)
  %60 = fmul float %55, %59
  %61 = fmul float %56, %60
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %60, float %56, float %62)
  %64 = tail call float @llvm.fma.f32(float %60, float %58, float %63)
  %65 = fadd float %61, %64
  %66 = fsub float %65, %61
  %67 = fsub float %64, %66
  %68 = fsub float %55, %65
  %69 = fsub float %55, %68
  %70 = fsub float %69, %65
  %71 = fsub float %70, %67
  %72 = fadd float %68, %71
  %73 = fmul float %59, %72
  %74 = fadd float %60, %73
  %75 = fsub float %74, %60
  %76 = fsub float %73, %75
  %77 = fmul float %74, %74
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %74, float %74, float %78)
  %80 = fmul float %76, 2.000000e+00
  %81 = tail call float @llvm.fma.f32(float %74, float %80, float %79)
  %82 = fadd float %77, %81
  %83 = fsub float %82, %77
  %84 = fsub float %81, %83
  %85 = tail call float @llvm.fmuladd.f32(float %82, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %86 = tail call float @llvm.fmuladd.f32(float %82, float %85, float 0x3FD999BDE0000000)
  %87 = sitofp i32 %54 to float
  %88 = fmul float %87, 0x3FE62E4300000000
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %87, float 0x3FE62E4300000000, float %89)
  %91 = tail call float @llvm.fma.f32(float %87, float 0xBE205C6100000000, float %90)
  %92 = fadd float %88, %91
  %93 = fsub float %92, %88
  %94 = fsub float %91, %93
  %95 = tail call float @llvm.amdgcn.ldexp.f32(float %74, i32 1)
  %96 = fmul float %74, %82
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %82, float %74, float %97)
  %99 = tail call float @llvm.fma.f32(float %82, float %76, float %98)
  %100 = tail call float @llvm.fma.f32(float %84, float %74, float %99)
  %101 = fadd float %96, %100
  %102 = fsub float %101, %96
  %103 = fsub float %100, %102
  %104 = fmul float %82, %86
  %105 = fneg float %104
  %106 = tail call float @llvm.fma.f32(float %82, float %86, float %105)
  %107 = tail call float @llvm.fma.f32(float %84, float %86, float %106)
  %108 = fadd float %104, %107
  %109 = fsub float %108, %104
  %110 = fsub float %107, %109
  %111 = fadd float %108, 0x3FE5555540000000
  %112 = fadd float %111, 0xBFE5555540000000
  %113 = fsub float %108, %112
  %114 = fadd float %110, 0x3E2E720200000000
  %115 = fadd float %114, %113
  %116 = fadd float %111, %115
  %117 = fsub float %116, %111
  %118 = fsub float %115, %117
  %119 = fmul float %101, %116
  %120 = fneg float %119
  %121 = tail call float @llvm.fma.f32(float %101, float %116, float %120)
  %122 = tail call float @llvm.fma.f32(float %101, float %118, float %121)
  %123 = tail call float @llvm.fma.f32(float %103, float %116, float %122)
  %124 = tail call float @llvm.amdgcn.ldexp.f32(float %76, i32 1)
  %125 = fadd float %119, %123
  %126 = fsub float %125, %119
  %127 = fsub float %123, %126
  %128 = fadd float %95, %125
  %129 = fsub float %128, %95
  %130 = fsub float %125, %129
  %131 = fadd float %124, %127
  %132 = fadd float %131, %130
  %133 = fadd float %128, %132
  %134 = fsub float %133, %128
  %135 = fsub float %132, %134
  %136 = fadd float %92, %133
  %137 = fsub float %136, %92
  %138 = fsub float %136, %137
  %139 = fsub float %92, %138
  %140 = fsub float %133, %137
  %141 = fadd float %140, %139
  %142 = fadd float %94, %135
  %143 = fsub float %142, %94
  %144 = fsub float %142, %143
  %145 = fsub float %94, %144
  %146 = fsub float %135, %143
  %147 = fadd float %146, %145
  %148 = fadd float %142, %141
  %149 = fadd float %136, %148
  %150 = fsub float %149, %136
  %151 = fsub float %148, %150
  %152 = fadd float %147, %151
  %153 = fadd float %149, %152
  %154 = fsub float %153, %149
  %155 = fsub float %152, %154
  %156 = fmul float %153, %2
  %157 = fneg float %156
  %158 = tail call float @llvm.fma.f32(float %2, float %153, float %157)
  %159 = tail call float @llvm.fma.f32(float %2, float %155, float %158)
  %160 = fadd float %156, %159
  %161 = fsub float %160, %156
  %162 = fsub float %159, %161
  %163 = tail call float @llvm.fabs.f32(float %156) #3
  %164 = fcmp oeq float %163, 0x7FF0000000000000
  %165 = select i1 %164, float %156, float %160
  %166 = tail call float @llvm.fabs.f32(float %165) #3
  %167 = fcmp oeq float %166, 0x7FF0000000000000
  %168 = select i1 %167, float 0.000000e+00, float %162
  %169 = fcmp oeq float %165, 0x40562E4300000000
  %170 = select i1 %169, float 0x3EE0000000000000, float 0.000000e+00
  %171 = fsub float %165, %170
  %172 = fadd float %170, %168
  %173 = fmul float %171, 0x3FF7154760000000
  %174 = tail call float @llvm.rint.f32(float %173)
  %175 = fcmp ogt float %171, 0x40562E4300000000
  %176 = fcmp olt float %171, 0xC059D1DA00000000
  %177 = fneg float %173
  %178 = tail call float @llvm.fma.f32(float %171, float 0x3FF7154760000000, float %177)
  %179 = tail call float @llvm.fma.f32(float %171, float 0x3E54AE0BE0000000, float %178)
  %180 = fsub float %173, %174
  %181 = fadd float %179, %180
  %182 = tail call float @llvm.exp2.f32(float %181)
  %183 = fptosi float %174 to i32
  %184 = tail call float @llvm.amdgcn.ldexp.f32(float %182, i32 %183)
  %185 = select i1 %176, float 0.000000e+00, float %184
  %186 = select i1 %175, float 0x7FF0000000000000, float %185
  %187 = tail call float @llvm.fma.f32(float %186, float %172, float %186)
  %188 = tail call float @llvm.fabs.f32(float %186) #3
  %189 = fcmp oeq float %188, 0x7FF0000000000000
  %190 = select i1 %189, float %186, float %187
  %191 = fcmp olt float %47, 0.000000e+00
  %192 = and i1 %37, %191
  %193 = select i1 %192, float -0.000000e+00, float 0.000000e+00
  %194 = tail call float @llvm.copysign.f32(float %190, float %193)
  %195 = fcmp uge float %47, 0.000000e+00
  %196 = select i1 %195, i1 true, i1 %38
  %197 = select i1 %196, float %194, float 0x7FF8000000000000
  %198 = fcmp oeq float %48, 0x7FF0000000000000
  %199 = fcmp oeq float %47, 0.000000e+00
  %200 = or i1 %199, %198
  %201 = xor i1 %41, %199
  %202 = select i1 %201, float 0.000000e+00, float 0x7FF0000000000000
  %203 = select i1 %37, float %47, float 0.000000e+00
  %204 = tail call float @llvm.copysign.f32(float %202, float %203)
  %205 = select i1 %200, float %204, float %197
  %206 = fcmp uno float %47, %2
  %207 = select i1 %206, float 0x7FF8000000000000, float %205
  %208 = fcmp oeq float %47, 1.000000e+00
  %209 = or i1 %42, %208
  %210 = select i1 %209, float 1.000000e+00, float %207
  %211 = getelementptr inbounds float, float addrspace(1)* %1, i64 %45
  store float %210, float addrspace(1)* %211, align 4, !tbaa !16
  %212 = add nsw i32 %44, %22
  %213 = icmp slt i32 %212, %3
  br i1 %213, label %43, label %243, !llvm.loop !20

214:                                              ; preds = %24, %214
  %215 = phi i32 [ %241, %214 ], [ %16, %24 ]
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds float, float addrspace(1)* %0, i64 %216
  %218 = load float, float addrspace(1)* %217, align 4, !tbaa !16
  %219 = tail call float @llvm.fabs.f32(float %218)
  %220 = fcmp oeq float %219, 1.000000e+00
  %221 = fadd float %219, -1.000000e+00
  %222 = bitcast float %221 to i32
  %223 = xor i32 %222, %40
  %224 = icmp sgt i32 %223, -1
  %225 = select i1 %224, float 0x7FF0000000000000, float 0.000000e+00
  %226 = select i1 %220, float %219, float %225
  %227 = fcmp oeq float %219, 0x7FF0000000000000
  %228 = fcmp oeq float %218, 0.000000e+00
  %229 = or i1 %228, %227
  %230 = xor i1 %41, %228
  %231 = select i1 %230, float 0.000000e+00, float 0x7FF0000000000000
  %232 = select i1 %37, float %218, float 0.000000e+00
  %233 = tail call float @llvm.copysign.f32(float %231, float %232)
  %234 = select i1 %229, float %233, float %226
  %235 = fcmp uno float %218, %2
  %236 = select i1 %235, float 0x7FF8000000000000, float %234
  %237 = fcmp oeq float %218, 1.000000e+00
  %238 = or i1 %42, %237
  %239 = select i1 %238, float 1.000000e+00, float %236
  %240 = getelementptr inbounds float, float addrspace(1)* %1, i64 %216
  store float %239, float addrspace(1)* %240, align 4, !tbaa !16
  %241 = add nsw i32 %215, %22
  %242 = icmp slt i32 %241, %3
  br i1 %242, label %214, label %243, !llvm.loop !20

243:                                              ; preds = %214, %43, %4
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
