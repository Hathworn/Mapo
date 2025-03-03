; ModuleID = '../data/hip_kernels/324/84/main.cu'
source_filename = "../data/hip_kernels/324/84/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z4kPowPffS_j(float addrspace(1)* nocapture readonly %0, float %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = udiv i32 %13, %10
  %18 = mul i32 %17, %10
  %19 = icmp ugt i32 %13, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %10
  %23 = icmp ult i32 %16, %3
  br i1 %23, label %24, label %43

24:                                               ; preds = %4
  %25 = tail call float @llvm.fabs.f32(float %1)
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
  %40 = bitcast float %1 to i32
  %41 = fcmp olt float %1, 0.000000e+00
  %42 = fcmp oeq float %1, 0.000000e+00
  br i1 %39, label %215, label %44

43:                                               ; preds = %215, %44, %4
  ret void

44:                                               ; preds = %24, %44
  %45 = phi i32 [ %213, %44 ], [ %16, %24 ]
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = tail call float @llvm.fabs.f32(float %48)
  %50 = tail call float @llvm.amdgcn.frexp.mant.f32(float %49)
  %51 = fcmp olt float %50, 0x3FE5555560000000
  %52 = zext i1 %51 to i32
  %53 = tail call float @llvm.amdgcn.ldexp.f32(float %50, i32 %52)
  %54 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %49)
  %55 = sub nsw i32 %54, %52
  %56 = fadd float %53, -1.000000e+00
  %57 = fadd float %53, 1.000000e+00
  %58 = fadd float %57, -1.000000e+00
  %59 = fsub float %53, %58
  %60 = tail call float @llvm.amdgcn.rcp.f32(float %57)
  %61 = fmul float %56, %60
  %62 = fmul float %57, %61
  %63 = fneg float %62
  %64 = tail call float @llvm.fma.f32(float %61, float %57, float %63)
  %65 = tail call float @llvm.fma.f32(float %61, float %59, float %64)
  %66 = fadd float %62, %65
  %67 = fsub float %66, %62
  %68 = fsub float %65, %67
  %69 = fsub float %56, %66
  %70 = fsub float %56, %69
  %71 = fsub float %70, %66
  %72 = fsub float %71, %68
  %73 = fadd float %69, %72
  %74 = fmul float %60, %73
  %75 = fadd float %61, %74
  %76 = fsub float %75, %61
  %77 = fsub float %74, %76
  %78 = fmul float %75, %75
  %79 = fneg float %78
  %80 = tail call float @llvm.fma.f32(float %75, float %75, float %79)
  %81 = fmul float %77, 2.000000e+00
  %82 = tail call float @llvm.fma.f32(float %75, float %81, float %80)
  %83 = fadd float %78, %82
  %84 = fsub float %83, %78
  %85 = fsub float %82, %84
  %86 = tail call float @llvm.fmuladd.f32(float %83, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %87 = tail call float @llvm.fmuladd.f32(float %83, float %86, float 0x3FD999BDE0000000)
  %88 = sitofp i32 %55 to float
  %89 = fmul float %88, 0x3FE62E4300000000
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %88, float 0x3FE62E4300000000, float %90)
  %92 = tail call float @llvm.fma.f32(float %88, float 0xBE205C6100000000, float %91)
  %93 = fadd float %89, %92
  %94 = fsub float %93, %89
  %95 = fsub float %92, %94
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %75, i32 1)
  %97 = fmul float %75, %83
  %98 = fneg float %97
  %99 = tail call float @llvm.fma.f32(float %83, float %75, float %98)
  %100 = tail call float @llvm.fma.f32(float %83, float %77, float %99)
  %101 = tail call float @llvm.fma.f32(float %85, float %75, float %100)
  %102 = fadd float %97, %101
  %103 = fsub float %102, %97
  %104 = fsub float %101, %103
  %105 = fmul float %83, %87
  %106 = fneg float %105
  %107 = tail call float @llvm.fma.f32(float %83, float %87, float %106)
  %108 = tail call float @llvm.fma.f32(float %85, float %87, float %107)
  %109 = fadd float %105, %108
  %110 = fsub float %109, %105
  %111 = fsub float %108, %110
  %112 = fadd float %109, 0x3FE5555540000000
  %113 = fadd float %112, 0xBFE5555540000000
  %114 = fsub float %109, %113
  %115 = fadd float %111, 0x3E2E720200000000
  %116 = fadd float %115, %114
  %117 = fadd float %112, %116
  %118 = fsub float %117, %112
  %119 = fsub float %116, %118
  %120 = fmul float %102, %117
  %121 = fneg float %120
  %122 = tail call float @llvm.fma.f32(float %102, float %117, float %121)
  %123 = tail call float @llvm.fma.f32(float %102, float %119, float %122)
  %124 = tail call float @llvm.fma.f32(float %104, float %117, float %123)
  %125 = tail call float @llvm.amdgcn.ldexp.f32(float %77, i32 1)
  %126 = fadd float %120, %124
  %127 = fsub float %126, %120
  %128 = fsub float %124, %127
  %129 = fadd float %96, %126
  %130 = fsub float %129, %96
  %131 = fsub float %126, %130
  %132 = fadd float %125, %128
  %133 = fadd float %132, %131
  %134 = fadd float %129, %133
  %135 = fsub float %134, %129
  %136 = fsub float %133, %135
  %137 = fadd float %93, %134
  %138 = fsub float %137, %93
  %139 = fsub float %137, %138
  %140 = fsub float %93, %139
  %141 = fsub float %134, %138
  %142 = fadd float %141, %140
  %143 = fadd float %95, %136
  %144 = fsub float %143, %95
  %145 = fsub float %143, %144
  %146 = fsub float %95, %145
  %147 = fsub float %136, %144
  %148 = fadd float %147, %146
  %149 = fadd float %143, %142
  %150 = fadd float %137, %149
  %151 = fsub float %150, %137
  %152 = fsub float %149, %151
  %153 = fadd float %148, %152
  %154 = fadd float %150, %153
  %155 = fsub float %154, %150
  %156 = fsub float %153, %155
  %157 = fmul float %154, %1
  %158 = fneg float %157
  %159 = tail call float @llvm.fma.f32(float %1, float %154, float %158)
  %160 = tail call float @llvm.fma.f32(float %1, float %156, float %159)
  %161 = fadd float %157, %160
  %162 = fsub float %161, %157
  %163 = fsub float %160, %162
  %164 = tail call float @llvm.fabs.f32(float %157) #3
  %165 = fcmp oeq float %164, 0x7FF0000000000000
  %166 = select i1 %165, float %157, float %161
  %167 = tail call float @llvm.fabs.f32(float %166) #3
  %168 = fcmp oeq float %167, 0x7FF0000000000000
  %169 = select i1 %168, float 0.000000e+00, float %163
  %170 = fcmp oeq float %166, 0x40562E4300000000
  %171 = select i1 %170, float 0x3EE0000000000000, float 0.000000e+00
  %172 = fsub float %166, %171
  %173 = fadd float %171, %169
  %174 = fmul float %172, 0x3FF7154760000000
  %175 = tail call float @llvm.rint.f32(float %174)
  %176 = fcmp ogt float %172, 0x40562E4300000000
  %177 = fcmp olt float %172, 0xC059D1DA00000000
  %178 = fneg float %174
  %179 = tail call float @llvm.fma.f32(float %172, float 0x3FF7154760000000, float %178)
  %180 = tail call float @llvm.fma.f32(float %172, float 0x3E54AE0BE0000000, float %179)
  %181 = fsub float %174, %175
  %182 = fadd float %180, %181
  %183 = tail call float @llvm.exp2.f32(float %182)
  %184 = fptosi float %175 to i32
  %185 = tail call float @llvm.amdgcn.ldexp.f32(float %183, i32 %184)
  %186 = select i1 %177, float 0.000000e+00, float %185
  %187 = select i1 %176, float 0x7FF0000000000000, float %186
  %188 = tail call float @llvm.fma.f32(float %187, float %173, float %187)
  %189 = tail call float @llvm.fabs.f32(float %187) #3
  %190 = fcmp oeq float %189, 0x7FF0000000000000
  %191 = select i1 %190, float %187, float %188
  %192 = fcmp olt float %48, 0.000000e+00
  %193 = and i1 %37, %192
  %194 = select i1 %193, float -0.000000e+00, float 0.000000e+00
  %195 = tail call float @llvm.copysign.f32(float %191, float %194)
  %196 = fcmp uge float %48, 0.000000e+00
  %197 = select i1 %196, i1 true, i1 %38
  %198 = select i1 %197, float %195, float 0x7FF8000000000000
  %199 = fcmp oeq float %49, 0x7FF0000000000000
  %200 = fcmp oeq float %48, 0.000000e+00
  %201 = or i1 %200, %199
  %202 = xor i1 %41, %200
  %203 = select i1 %202, float 0.000000e+00, float 0x7FF0000000000000
  %204 = select i1 %37, float %48, float 0.000000e+00
  %205 = tail call float @llvm.copysign.f32(float %203, float %204)
  %206 = select i1 %201, float %205, float %198
  %207 = fcmp uno float %48, %1
  %208 = select i1 %207, float 0x7FF8000000000000, float %206
  %209 = fcmp oeq float %48, 1.000000e+00
  %210 = or i1 %42, %209
  %211 = select i1 %210, float 1.000000e+00, float %208
  %212 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  store float %211, float addrspace(1)* %212, align 4, !tbaa !16
  %213 = add i32 %45, %22
  %214 = icmp ult i32 %213, %3
  br i1 %214, label %44, label %43, !llvm.loop !20

215:                                              ; preds = %24, %215
  %216 = phi i32 [ %242, %215 ], [ %16, %24 ]
  %217 = zext i32 %216 to i64
  %218 = getelementptr inbounds float, float addrspace(1)* %0, i64 %217
  %219 = load float, float addrspace(1)* %218, align 4, !tbaa !16
  %220 = tail call float @llvm.fabs.f32(float %219)
  %221 = fcmp oeq float %220, 1.000000e+00
  %222 = fadd float %220, -1.000000e+00
  %223 = bitcast float %222 to i32
  %224 = xor i32 %223, %40
  %225 = icmp sgt i32 %224, -1
  %226 = select i1 %225, float 0x7FF0000000000000, float 0.000000e+00
  %227 = select i1 %221, float %220, float %226
  %228 = fcmp oeq float %220, 0x7FF0000000000000
  %229 = fcmp oeq float %219, 0.000000e+00
  %230 = or i1 %229, %228
  %231 = xor i1 %41, %229
  %232 = select i1 %231, float 0.000000e+00, float 0x7FF0000000000000
  %233 = select i1 %37, float %219, float 0.000000e+00
  %234 = tail call float @llvm.copysign.f32(float %232, float %233)
  %235 = select i1 %230, float %234, float %227
  %236 = fcmp uno float %219, %1
  %237 = select i1 %236, float 0x7FF8000000000000, float %235
  %238 = fcmp oeq float %219, 1.000000e+00
  %239 = or i1 %42, %238
  %240 = select i1 %239, float 1.000000e+00, float %237
  %241 = getelementptr inbounds float, float addrspace(1)* %2, i64 %217
  store float %240, float addrspace(1)* %241, align 4, !tbaa !16
  %242 = add i32 %216, %22
  %243 = icmp ult i32 %242, %3
  br i1 %243, label %215, label %43, !llvm.loop !20
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
