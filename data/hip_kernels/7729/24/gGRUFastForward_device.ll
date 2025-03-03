; ModuleID = '../data/hip_kernels/7729/24/main.cu'
source_filename = "../data/hip_kernels/7729/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15gGRUFastForwardPfPKfS1_S1_S1_S1_mmb(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* readonly %5, i64 %6, i64 %7, i1 %8) local_unnamed_addr #0 {
  %10 = icmp eq i64 %6, 0
  br i1 %10, label %30, label %11

11:                                               ; preds = %9
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = icmp eq float addrspace(1)* %5, addrspacecast (float* null to float addrspace(1)*)
  %14 = icmp eq i64 %7, 0
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %16 = trunc i64 %7 to i32
  %17 = shl i32 %16, 1
  %18 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %19 = getelementptr i8, i8 addrspace(4)* %18, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %18, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !4
  %24 = load i16, i16 addrspace(4)* %20, align 4, !range !13, !invariant.load !14
  %25 = zext i16 %24 to i32
  %26 = udiv i32 %23, %25
  %27 = mul i32 %26, %25
  %28 = icmp ugt i32 %23, %27
  %29 = zext i1 %28 to i32
  br label %31

30:                                               ; preds = %250, %9
  ret void

31:                                               ; preds = %11, %250
  %32 = phi i32 [ 0, %11 ], [ %252, %250 ]
  %33 = add i32 %32, %12
  %34 = sext i32 %33 to i64
  %35 = icmp ult i64 %34, %6
  br i1 %35, label %36, label %250

36:                                               ; preds = %31
  br i1 %13, label %41, label %37

37:                                               ; preds = %36
  %38 = getelementptr inbounds float, float addrspace(1)* %5, i64 %34
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !15
  %40 = fcmp contract une float %39, 0.000000e+00
  br label %41

41:                                               ; preds = %37, %36
  %42 = phi i1 [ true, %36 ], [ %40, %37 ]
  %43 = uitofp i1 %42 to float
  %44 = mul i64 %34, %7
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = getelementptr inbounds float, float addrspace(1)* %1, i64 %44
  %47 = mul i64 %44, 3
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %47
  %49 = getelementptr inbounds float, float addrspace(1)* %3, i64 %47
  br i1 %14, label %250, label %50

50:                                               ; preds = %41
  %51 = fsub contract float 1.000000e+00, %43
  br label %52

52:                                               ; preds = %50, %246
  %53 = phi i32 [ 0, %50 ], [ %247, %246 ]
  %54 = add i32 %53, %15
  %55 = sext i32 %54 to i64
  %56 = icmp ult i64 %55, %7
  br i1 %56, label %57, label %246

57:                                               ; preds = %52
  %58 = getelementptr inbounds float, float addrspace(1)* %48, i64 %55
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !15
  %60 = getelementptr inbounds float, float addrspace(1)* %49, i64 %55
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !15
  %62 = fadd contract float %59, %61
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %55
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !15
  %65 = fadd contract float %62, %64
  %66 = fcmp contract ult float %65, 0.000000e+00
  br i1 %66, label %84, label %67

67:                                               ; preds = %57
  %68 = fneg contract float %65
  %69 = fmul float %65, 0xBFF7154760000000
  %70 = tail call float @llvm.rint.f32(float %69)
  %71 = fcmp olt float %65, 0xC0562E4300000000
  %72 = fcmp ogt float %65, 0x4059D1DA00000000
  %73 = fneg float %69
  %74 = tail call float @llvm.fma.f32(float %68, float 0x3FF7154760000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %68, float 0x3E54AE0BE0000000, float %74)
  %76 = fsub float %69, %70
  %77 = fadd float %75, %76
  %78 = tail call float @llvm.exp2.f32(float %77)
  %79 = fptosi float %70 to i32
  %80 = tail call float @llvm.amdgcn.ldexp.f32(float %78, i32 %79)
  %81 = select i1 %72, float 0.000000e+00, float %80
  %82 = select i1 %71, float 0x7FF0000000000000, float %81
  %83 = fpext float %82 to double
  br label %100

84:                                               ; preds = %57
  %85 = fmul float %65, 0x3FF7154760000000
  %86 = tail call float @llvm.rint.f32(float %85)
  %87 = fcmp ogt float %65, 0x40562E4300000000
  %88 = fcmp olt float %65, 0xC059D1DA00000000
  %89 = fneg float %85
  %90 = tail call float @llvm.fma.f32(float %65, float 0x3FF7154760000000, float %89)
  %91 = tail call float @llvm.fma.f32(float %65, float 0x3E54AE0BE0000000, float %90)
  %92 = fsub float %85, %86
  %93 = fadd float %91, %92
  %94 = tail call float @llvm.exp2.f32(float %93)
  %95 = fptosi float %86 to i32
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %94, i32 %95)
  %97 = select i1 %88, float 0.000000e+00, float %96
  %98 = select i1 %87, float 0x7FF0000000000000, float %97
  %99 = fpext float %98 to double
  br label %100

100:                                              ; preds = %67, %84
  %101 = phi double [ %99, %84 ], [ %83, %67 ]
  %102 = phi double [ %99, %84 ], [ 1.000000e+00, %67 ]
  %103 = fadd contract double %101, 1.000000e+00
  %104 = fdiv contract double %102, %103
  %105 = fptrunc double %104 to float
  %106 = add i32 %54, %16
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %48, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !15
  %110 = getelementptr inbounds float, float addrspace(1)* %49, i64 %107
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !15
  %112 = fadd contract float %109, %111
  %113 = getelementptr inbounds float, float addrspace(1)* %4, i64 %107
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !15
  %115 = fadd contract float %112, %114
  %116 = fcmp contract ult float %115, 0.000000e+00
  br i1 %116, label %134, label %117

117:                                              ; preds = %100
  %118 = fneg contract float %115
  %119 = fmul float %115, 0xBFF7154760000000
  %120 = tail call float @llvm.rint.f32(float %119)
  %121 = fcmp olt float %115, 0xC0562E4300000000
  %122 = fcmp ogt float %115, 0x4059D1DA00000000
  %123 = fneg float %119
  %124 = tail call float @llvm.fma.f32(float %118, float 0x3FF7154760000000, float %123)
  %125 = tail call float @llvm.fma.f32(float %118, float 0x3E54AE0BE0000000, float %124)
  %126 = fsub float %119, %120
  %127 = fadd float %125, %126
  %128 = tail call float @llvm.exp2.f32(float %127)
  %129 = fptosi float %120 to i32
  %130 = tail call float @llvm.amdgcn.ldexp.f32(float %128, i32 %129)
  %131 = select i1 %122, float 0.000000e+00, float %130
  %132 = select i1 %121, float 0x7FF0000000000000, float %131
  %133 = fpext float %132 to double
  br label %150

134:                                              ; preds = %100
  %135 = fmul float %115, 0x3FF7154760000000
  %136 = tail call float @llvm.rint.f32(float %135)
  %137 = fcmp ogt float %115, 0x40562E4300000000
  %138 = fcmp olt float %115, 0xC059D1DA00000000
  %139 = fneg float %135
  %140 = tail call float @llvm.fma.f32(float %115, float 0x3FF7154760000000, float %139)
  %141 = tail call float @llvm.fma.f32(float %115, float 0x3E54AE0BE0000000, float %140)
  %142 = fsub float %135, %136
  %143 = fadd float %141, %142
  %144 = tail call float @llvm.exp2.f32(float %143)
  %145 = fptosi float %136 to i32
  %146 = tail call float @llvm.amdgcn.ldexp.f32(float %144, i32 %145)
  %147 = select i1 %138, float 0.000000e+00, float %146
  %148 = select i1 %137, float 0x7FF0000000000000, float %147
  %149 = fpext float %148 to double
  br label %150

150:                                              ; preds = %117, %134
  %151 = phi double [ %149, %134 ], [ %133, %117 ]
  %152 = phi double [ %149, %134 ], [ 1.000000e+00, %117 ]
  %153 = fadd contract double %151, 1.000000e+00
  %154 = fdiv contract double %152, %153
  %155 = fptrunc double %154 to float
  %156 = add i32 %54, %17
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %48, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !15
  %160 = getelementptr inbounds float, float addrspace(1)* %49, i64 %157
  %161 = load float, float addrspace(1)* %160, align 4, !tbaa !15
  br i1 %8, label %162, label %198

162:                                              ; preds = %150
  %163 = getelementptr inbounds float, float addrspace(1)* %4, i64 %157
  %164 = load float, float addrspace(1)* %163, align 4, !tbaa !15
  %165 = fadd contract float %161, %164
  %166 = fmul contract float %165, %105
  %167 = fadd contract float %159, %166
  %168 = tail call float @llvm.fabs.f32(float %167)
  %169 = fcmp olt float %168, 6.250000e-01
  br i1 %169, label %170, label %178

170:                                              ; preds = %162
  %171 = fmul float %167, %167
  %172 = tail call float @llvm.fmuladd.f32(float %171, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %173 = tail call float @llvm.fmuladd.f32(float %171, float %172, float 0xBFAB8389C0000000)
  %174 = tail call float @llvm.fmuladd.f32(float %171, float %173, float 0x3FC1107040000000)
  %175 = tail call float @llvm.fmuladd.f32(float %171, float %174, float 0xBFD5555320000000)
  %176 = fmul float %168, %175
  %177 = tail call float @llvm.fmuladd.f32(float %171, float %176, float %168)
  br label %195

178:                                              ; preds = %162
  %179 = fmul float %168, 2.000000e+00
  %180 = fmul float %179, 0x3FF7154760000000
  %181 = tail call float @llvm.rint.f32(float %180)
  %182 = fcmp ogt float %179, 0x40562E4300000000
  %183 = fneg float %180
  %184 = tail call float @llvm.fma.f32(float %179, float 0x3FF7154760000000, float %183)
  %185 = tail call float @llvm.fma.f32(float %179, float 0x3E54AE0BE0000000, float %184)
  %186 = fsub float %180, %181
  %187 = fadd float %185, %186
  %188 = tail call float @llvm.exp2.f32(float %187)
  %189 = fptosi float %181 to i32
  %190 = tail call float @llvm.amdgcn.ldexp.f32(float %188, i32 %189)
  %191 = fadd float %190, 1.000000e+00
  %192 = select i1 %182, float 0x7FF0000000000000, float %191
  %193 = tail call float @llvm.amdgcn.rcp.f32(float %192)
  %194 = tail call float @llvm.fmuladd.f32(float %193, float -2.000000e+00, float 1.000000e+00)
  br label %195

195:                                              ; preds = %170, %178
  %196 = phi float [ %177, %170 ], [ %194, %178 ]
  %197 = tail call float @llvm.copysign.f32(float %196, float %167)
  br label %234

198:                                              ; preds = %150
  %199 = fmul contract float %161, %105
  %200 = fadd contract float %159, %199
  %201 = getelementptr inbounds float, float addrspace(1)* %4, i64 %157
  %202 = load float, float addrspace(1)* %201, align 4, !tbaa !15
  %203 = fadd contract float %202, %200
  %204 = tail call float @llvm.fabs.f32(float %203)
  %205 = fcmp olt float %204, 6.250000e-01
  br i1 %205, label %206, label %214

206:                                              ; preds = %198
  %207 = fmul float %203, %203
  %208 = tail call float @llvm.fmuladd.f32(float %207, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %209 = tail call float @llvm.fmuladd.f32(float %207, float %208, float 0xBFAB8389C0000000)
  %210 = tail call float @llvm.fmuladd.f32(float %207, float %209, float 0x3FC1107040000000)
  %211 = tail call float @llvm.fmuladd.f32(float %207, float %210, float 0xBFD5555320000000)
  %212 = fmul float %204, %211
  %213 = tail call float @llvm.fmuladd.f32(float %207, float %212, float %204)
  br label %231

214:                                              ; preds = %198
  %215 = fmul float %204, 2.000000e+00
  %216 = fmul float %215, 0x3FF7154760000000
  %217 = tail call float @llvm.rint.f32(float %216)
  %218 = fcmp ogt float %215, 0x40562E4300000000
  %219 = fneg float %216
  %220 = tail call float @llvm.fma.f32(float %215, float 0x3FF7154760000000, float %219)
  %221 = tail call float @llvm.fma.f32(float %215, float 0x3E54AE0BE0000000, float %220)
  %222 = fsub float %216, %217
  %223 = fadd float %221, %222
  %224 = tail call float @llvm.exp2.f32(float %223)
  %225 = fptosi float %217 to i32
  %226 = tail call float @llvm.amdgcn.ldexp.f32(float %224, i32 %225)
  %227 = fadd float %226, 1.000000e+00
  %228 = select i1 %218, float 0x7FF0000000000000, float %227
  %229 = tail call float @llvm.amdgcn.rcp.f32(float %228)
  %230 = tail call float @llvm.fmuladd.f32(float %229, float -2.000000e+00, float 1.000000e+00)
  br label %231

231:                                              ; preds = %206, %214
  %232 = phi float [ %213, %206 ], [ %230, %214 ]
  %233 = tail call float @llvm.copysign.f32(float %232, float %203)
  br label %234

234:                                              ; preds = %231, %195
  %235 = phi float [ %197, %195 ], [ %233, %231 ]
  %236 = fsub contract float 1.000000e+00, %155
  %237 = fmul contract float %236, %235
  %238 = getelementptr inbounds float, float addrspace(1)* %46, i64 %55
  %239 = load float, float addrspace(1)* %238, align 4, !tbaa !15
  %240 = fmul contract float %239, %155
  %241 = fadd contract float %237, %240
  %242 = fmul contract float %241, %43
  %243 = fmul contract float %51, %239
  %244 = fadd contract float %243, %242
  %245 = getelementptr inbounds float, float addrspace(1)* %45, i64 %55
  store float %244, float addrspace(1)* %245, align 4, !tbaa !15
  br label %246

246:                                              ; preds = %234, %52
  %247 = add i32 %53, %25
  %248 = sext i32 %247 to i64
  %249 = icmp ult i64 %248, %7
  br i1 %249, label %52, label %250, !llvm.loop !19

250:                                              ; preds = %246, %41, %31
  %251 = add i32 %26, %32
  %252 = add i32 %251, %29
  %253 = sext i32 %252 to i64
  %254 = icmp ult i64 %253, %6
  br i1 %254, label %31, label %30, !llvm.loop !21
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
