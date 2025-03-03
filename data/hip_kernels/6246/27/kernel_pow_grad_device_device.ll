; ModuleID = '../data/hip_kernels/6246/27/main.cu'
source_filename = "../data/hip_kernels/6246/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z22kernel_pow_grad_devicePiiS_S_bj(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture writeonly %3, i1 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = udiv i32 %15, %12
  %20 = mul i32 %19, %12
  %21 = icmp ugt i32 %15, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %12
  %25 = icmp ult i32 %18, %5
  br i1 %25, label %26, label %47

26:                                               ; preds = %6
  %27 = add nsw i32 %1, -1
  %28 = sitofp i32 %27 to float
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = tail call float @llvm.trunc.f32(float %29)
  %31 = fcmp oeq float %29, %30
  %32 = zext i1 %31 to i32
  %33 = fmul float %30, 5.000000e-01
  %34 = tail call float @llvm.amdgcn.fract.f32(float %33)
  %35 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 516)
  %36 = select i1 %35, float 0.000000e+00, float %34
  %37 = fcmp oeq float %36, 0.000000e+00
  %38 = and i1 %31, %37
  %39 = zext i1 %38 to i32
  %40 = add nuw nsw i32 %39, %32
  %41 = icmp eq i32 %40, 1
  %42 = icmp ne i32 %40, 0
  %43 = fcmp oeq float %29, 0x7FF0000000000000
  %44 = bitcast float %28 to i32
  %45 = icmp slt i32 %1, 1
  %46 = icmp eq i32 %27, 0
  br i1 %43, label %224, label %48

47:                                               ; preds = %224, %48, %6
  ret void

48:                                               ; preds = %26, %48
  %49 = phi i32 [ %222, %48 ], [ %18, %26 ]
  %50 = zext i32 %49 to i64
  %51 = select i1 %4, i64 0, i64 %50
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !16
  %54 = mul nsw i32 %53, %1
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !16
  %57 = sitofp i32 %56 to float
  %58 = tail call float @llvm.fabs.f32(float %57)
  %59 = tail call float @llvm.amdgcn.frexp.mant.f32(float %58)
  %60 = fcmp olt float %59, 0x3FE5555560000000
  %61 = zext i1 %60 to i32
  %62 = tail call float @llvm.amdgcn.ldexp.f32(float %59, i32 %61)
  %63 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %58)
  %64 = sub nsw i32 %63, %61
  %65 = fadd float %62, -1.000000e+00
  %66 = fadd float %62, 1.000000e+00
  %67 = fadd float %66, -1.000000e+00
  %68 = fsub float %62, %67
  %69 = tail call float @llvm.amdgcn.rcp.f32(float %66)
  %70 = fmul float %65, %69
  %71 = fmul float %66, %70
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %70, float %66, float %72)
  %74 = tail call float @llvm.fma.f32(float %70, float %68, float %73)
  %75 = fadd float %71, %74
  %76 = fsub float %75, %71
  %77 = fsub float %74, %76
  %78 = fsub float %65, %75
  %79 = fsub float %65, %78
  %80 = fsub float %79, %75
  %81 = fsub float %80, %77
  %82 = fadd float %78, %81
  %83 = fmul float %69, %82
  %84 = fadd float %70, %83
  %85 = fsub float %84, %70
  %86 = fsub float %83, %85
  %87 = fmul float %84, %84
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %84, float %84, float %88)
  %90 = fmul float %86, 2.000000e+00
  %91 = tail call float @llvm.fma.f32(float %84, float %90, float %89)
  %92 = fadd float %87, %91
  %93 = fsub float %92, %87
  %94 = fsub float %91, %93
  %95 = tail call float @llvm.fmuladd.f32(float %92, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %96 = tail call float @llvm.fmuladd.f32(float %92, float %95, float 0x3FD999BDE0000000)
  %97 = sitofp i32 %64 to float
  %98 = fmul float %97, 0x3FE62E4300000000
  %99 = fneg float %98
  %100 = tail call float @llvm.fma.f32(float %97, float 0x3FE62E4300000000, float %99)
  %101 = tail call float @llvm.fma.f32(float %97, float 0xBE205C6100000000, float %100)
  %102 = fadd float %98, %101
  %103 = fsub float %102, %98
  %104 = fsub float %101, %103
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 1)
  %106 = fmul float %84, %92
  %107 = fneg float %106
  %108 = tail call float @llvm.fma.f32(float %92, float %84, float %107)
  %109 = tail call float @llvm.fma.f32(float %92, float %86, float %108)
  %110 = tail call float @llvm.fma.f32(float %94, float %84, float %109)
  %111 = fadd float %106, %110
  %112 = fsub float %111, %106
  %113 = fsub float %110, %112
  %114 = fmul float %92, %96
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %92, float %96, float %115)
  %117 = tail call float @llvm.fma.f32(float %94, float %96, float %116)
  %118 = fadd float %114, %117
  %119 = fsub float %118, %114
  %120 = fsub float %117, %119
  %121 = fadd float %118, 0x3FE5555540000000
  %122 = fadd float %121, 0xBFE5555540000000
  %123 = fsub float %118, %122
  %124 = fadd float %120, 0x3E2E720200000000
  %125 = fadd float %124, %123
  %126 = fadd float %121, %125
  %127 = fsub float %126, %121
  %128 = fsub float %125, %127
  %129 = fmul float %111, %126
  %130 = fneg float %129
  %131 = tail call float @llvm.fma.f32(float %111, float %126, float %130)
  %132 = tail call float @llvm.fma.f32(float %111, float %128, float %131)
  %133 = tail call float @llvm.fma.f32(float %113, float %126, float %132)
  %134 = tail call float @llvm.amdgcn.ldexp.f32(float %86, i32 1)
  %135 = fadd float %129, %133
  %136 = fsub float %135, %129
  %137 = fsub float %133, %136
  %138 = fadd float %105, %135
  %139 = fsub float %138, %105
  %140 = fsub float %135, %139
  %141 = fadd float %134, %137
  %142 = fadd float %141, %140
  %143 = fadd float %138, %142
  %144 = fsub float %143, %138
  %145 = fsub float %142, %144
  %146 = fadd float %102, %143
  %147 = fsub float %146, %102
  %148 = fsub float %146, %147
  %149 = fsub float %102, %148
  %150 = fsub float %143, %147
  %151 = fadd float %150, %149
  %152 = fadd float %104, %145
  %153 = fsub float %152, %104
  %154 = fsub float %152, %153
  %155 = fsub float %104, %154
  %156 = fsub float %145, %153
  %157 = fadd float %156, %155
  %158 = fadd float %152, %151
  %159 = fadd float %146, %158
  %160 = fsub float %159, %146
  %161 = fsub float %158, %160
  %162 = fadd float %157, %161
  %163 = fadd float %159, %162
  %164 = fsub float %163, %159
  %165 = fsub float %162, %164
  %166 = fmul float %163, %28
  %167 = fneg float %166
  %168 = tail call float @llvm.fma.f32(float %28, float %163, float %167)
  %169 = tail call float @llvm.fma.f32(float %28, float %165, float %168)
  %170 = fadd float %166, %169
  %171 = fsub float %170, %166
  %172 = fsub float %169, %171
  %173 = tail call float @llvm.fabs.f32(float %166) #3
  %174 = fcmp oeq float %173, 0x7FF0000000000000
  %175 = select i1 %174, float %166, float %170
  %176 = tail call float @llvm.fabs.f32(float %175) #3
  %177 = fcmp oeq float %176, 0x7FF0000000000000
  %178 = select i1 %177, float 0.000000e+00, float %172
  %179 = fcmp oeq float %175, 0x40562E4300000000
  %180 = select i1 %179, float 0x3EE0000000000000, float 0.000000e+00
  %181 = fsub float %175, %180
  %182 = fadd float %180, %178
  %183 = fmul float %181, 0x3FF7154760000000
  %184 = tail call float @llvm.rint.f32(float %183)
  %185 = fcmp ogt float %181, 0x40562E4300000000
  %186 = fcmp olt float %181, 0xC059D1DA00000000
  %187 = fneg float %183
  %188 = tail call float @llvm.fma.f32(float %181, float 0x3FF7154760000000, float %187)
  %189 = tail call float @llvm.fma.f32(float %181, float 0x3E54AE0BE0000000, float %188)
  %190 = fsub float %183, %184
  %191 = fadd float %189, %190
  %192 = tail call float @llvm.exp2.f32(float %191)
  %193 = fptosi float %184 to i32
  %194 = tail call float @llvm.amdgcn.ldexp.f32(float %192, i32 %193)
  %195 = select i1 %186, float 0.000000e+00, float %194
  %196 = select i1 %185, float 0x7FF0000000000000, float %195
  %197 = tail call float @llvm.fma.f32(float %196, float %182, float %196)
  %198 = tail call float @llvm.fabs.f32(float %196) #3
  %199 = fcmp oeq float %198, 0x7FF0000000000000
  %200 = select i1 %199, float %196, float %197
  %201 = icmp slt i32 %56, 0
  %202 = and i1 %41, %201
  %203 = select i1 %202, float -0.000000e+00, float 0.000000e+00
  %204 = tail call float @llvm.copysign.f32(float %200, float %203)
  %205 = icmp sgt i32 %56, -1
  %206 = select i1 %205, i1 true, i1 %42
  %207 = select i1 %206, float %204, float 0x7FF8000000000000
  %208 = fcmp oeq float %58, 0x7FF0000000000000
  %209 = icmp eq i32 %56, 0
  %210 = or i1 %209, %208
  %211 = xor i1 %45, %209
  %212 = select i1 %211, float 0.000000e+00, float 0x7FF0000000000000
  %213 = select i1 %41, float %57, float 0.000000e+00
  %214 = tail call float @llvm.copysign.f32(float %212, float %213)
  %215 = select i1 %210, float %214, float %207
  %216 = icmp eq i32 %56, 1
  %217 = or i1 %46, %216
  %218 = fptosi float %215 to i32
  %219 = select i1 %217, i32 1, i32 %218
  %220 = mul nsw i32 %54, %219
  %221 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %50
  store i32 %220, i32 addrspace(1)* %221, align 4, !tbaa !16
  %222 = add i32 %49, %24
  %223 = icmp ult i32 %222, %5
  br i1 %223, label %48, label %47, !llvm.loop !20

224:                                              ; preds = %26, %224
  %225 = phi i32 [ %256, %224 ], [ %18, %26 ]
  %226 = zext i32 %225 to i64
  %227 = select i1 %4, i64 0, i64 %226
  %228 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %227
  %229 = load i32, i32 addrspace(1)* %228, align 4, !tbaa !16
  %230 = mul nsw i32 %229, %1
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %226
  %232 = load i32, i32 addrspace(1)* %231, align 4, !tbaa !16
  %233 = sitofp i32 %232 to float
  %234 = tail call float @llvm.fabs.f32(float %233)
  %235 = fcmp oeq float %234, 1.000000e+00
  %236 = fadd float %234, -1.000000e+00
  %237 = bitcast float %236 to i32
  %238 = xor i32 %237, %44
  %239 = icmp sgt i32 %238, -1
  %240 = select i1 %239, float 0x7FF0000000000000, float 0.000000e+00
  %241 = select i1 %235, float %234, float %240
  %242 = fcmp oeq float %234, 0x7FF0000000000000
  %243 = icmp eq i32 %232, 0
  %244 = or i1 %243, %242
  %245 = xor i1 %45, %243
  %246 = select i1 %245, float 0.000000e+00, float 0x7FF0000000000000
  %247 = select i1 %41, float %233, float 0.000000e+00
  %248 = tail call float @llvm.copysign.f32(float %246, float %247)
  %249 = select i1 %244, float %248, float %241
  %250 = icmp eq i32 %232, 1
  %251 = or i1 %46, %250
  %252 = fptosi float %249 to i32
  %253 = select i1 %251, i32 1, i32 %252
  %254 = mul nsw i32 %230, %253
  %255 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %226
  store i32 %254, i32 addrspace(1)* %255, align 4, !tbaa !16
  %256 = add i32 %225, %24
  %257 = icmp ult i32 %256, %5
  br i1 %257, label %224, label %47, !llvm.loop !20
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
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
