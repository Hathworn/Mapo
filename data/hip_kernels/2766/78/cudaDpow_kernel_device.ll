; ModuleID = '../data/hip_kernels/2766/78/main.cu'
source_filename = "../data/hip_kernels/2766/78/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15cudaDpow_kerneljdPKdPd(i32 %0, double %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
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
  %23 = icmp ult i32 %16, %0
  br i1 %23, label %24, label %44

24:                                               ; preds = %4
  %25 = fptrunc double %1 to float
  %26 = tail call float @llvm.fabs.f32(float %25)
  %27 = tail call float @llvm.trunc.f32(float %26)
  %28 = fcmp oeq float %26, %27
  %29 = zext i1 %28 to i32
  %30 = fmul float %27, 5.000000e-01
  %31 = tail call float @llvm.amdgcn.fract.f32(float %30)
  %32 = tail call i1 @llvm.amdgcn.class.f32(float %30, i32 516)
  %33 = select i1 %32, float 0.000000e+00, float %31
  %34 = fcmp oeq float %33, 0.000000e+00
  %35 = and i1 %28, %34
  %36 = zext i1 %35 to i32
  %37 = add nuw nsw i32 %36, %29
  %38 = icmp eq i32 %37, 1
  %39 = icmp ne i32 %37, 0
  %40 = fcmp oeq float %26, 0x7FF0000000000000
  %41 = bitcast float %25 to i32
  %42 = fcmp olt float %25, 0.000000e+00
  %43 = fcmp oeq float %25, 0.000000e+00
  br i1 %40, label %218, label %45

44:                                               ; preds = %218, %45, %4
  ret void

45:                                               ; preds = %24, %45
  %46 = phi i32 [ %216, %45 ], [ %16, %24 ]
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %2, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !16
  %50 = fptrunc double %49 to float
  %51 = tail call float @llvm.fabs.f32(float %50)
  %52 = tail call float @llvm.amdgcn.frexp.mant.f32(float %51)
  %53 = fcmp olt float %52, 0x3FE5555560000000
  %54 = zext i1 %53 to i32
  %55 = tail call float @llvm.amdgcn.ldexp.f32(float %52, i32 %54)
  %56 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %51)
  %57 = sub nsw i32 %56, %54
  %58 = fadd float %55, -1.000000e+00
  %59 = fadd float %55, 1.000000e+00
  %60 = fadd float %59, -1.000000e+00
  %61 = fsub float %55, %60
  %62 = tail call float @llvm.amdgcn.rcp.f32(float %59)
  %63 = fmul float %58, %62
  %64 = fmul float %59, %63
  %65 = fneg float %64
  %66 = tail call float @llvm.fma.f32(float %63, float %59, float %65)
  %67 = tail call float @llvm.fma.f32(float %63, float %61, float %66)
  %68 = fadd float %64, %67
  %69 = fsub float %68, %64
  %70 = fsub float %67, %69
  %71 = fsub float %58, %68
  %72 = fsub float %58, %71
  %73 = fsub float %72, %68
  %74 = fsub float %73, %70
  %75 = fadd float %71, %74
  %76 = fmul float %62, %75
  %77 = fadd float %63, %76
  %78 = fsub float %77, %63
  %79 = fsub float %76, %78
  %80 = fmul float %77, %77
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %77, float %77, float %81)
  %83 = fmul float %79, 2.000000e+00
  %84 = tail call float @llvm.fma.f32(float %77, float %83, float %82)
  %85 = fadd float %80, %84
  %86 = fsub float %85, %80
  %87 = fsub float %84, %86
  %88 = tail call float @llvm.fmuladd.f32(float %85, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %89 = tail call float @llvm.fmuladd.f32(float %85, float %88, float 0x3FD999BDE0000000)
  %90 = sitofp i32 %57 to float
  %91 = fmul float %90, 0x3FE62E4300000000
  %92 = fneg float %91
  %93 = tail call float @llvm.fma.f32(float %90, float 0x3FE62E4300000000, float %92)
  %94 = tail call float @llvm.fma.f32(float %90, float 0xBE205C6100000000, float %93)
  %95 = fadd float %91, %94
  %96 = fsub float %95, %91
  %97 = fsub float %94, %96
  %98 = tail call float @llvm.amdgcn.ldexp.f32(float %77, i32 1)
  %99 = fmul float %77, %85
  %100 = fneg float %99
  %101 = tail call float @llvm.fma.f32(float %85, float %77, float %100)
  %102 = tail call float @llvm.fma.f32(float %85, float %79, float %101)
  %103 = tail call float @llvm.fma.f32(float %87, float %77, float %102)
  %104 = fadd float %99, %103
  %105 = fsub float %104, %99
  %106 = fsub float %103, %105
  %107 = fmul float %85, %89
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %85, float %89, float %108)
  %110 = tail call float @llvm.fma.f32(float %87, float %89, float %109)
  %111 = fadd float %107, %110
  %112 = fsub float %111, %107
  %113 = fsub float %110, %112
  %114 = fadd float %111, 0x3FE5555540000000
  %115 = fadd float %114, 0xBFE5555540000000
  %116 = fsub float %111, %115
  %117 = fadd float %113, 0x3E2E720200000000
  %118 = fadd float %117, %116
  %119 = fadd float %114, %118
  %120 = fsub float %119, %114
  %121 = fsub float %118, %120
  %122 = fmul float %104, %119
  %123 = fneg float %122
  %124 = tail call float @llvm.fma.f32(float %104, float %119, float %123)
  %125 = tail call float @llvm.fma.f32(float %104, float %121, float %124)
  %126 = tail call float @llvm.fma.f32(float %106, float %119, float %125)
  %127 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 1)
  %128 = fadd float %122, %126
  %129 = fsub float %128, %122
  %130 = fsub float %126, %129
  %131 = fadd float %98, %128
  %132 = fsub float %131, %98
  %133 = fsub float %128, %132
  %134 = fadd float %127, %130
  %135 = fadd float %134, %133
  %136 = fadd float %131, %135
  %137 = fsub float %136, %131
  %138 = fsub float %135, %137
  %139 = fadd float %95, %136
  %140 = fsub float %139, %95
  %141 = fsub float %139, %140
  %142 = fsub float %95, %141
  %143 = fsub float %136, %140
  %144 = fadd float %143, %142
  %145 = fadd float %97, %138
  %146 = fsub float %145, %97
  %147 = fsub float %145, %146
  %148 = fsub float %97, %147
  %149 = fsub float %138, %146
  %150 = fadd float %149, %148
  %151 = fadd float %145, %144
  %152 = fadd float %139, %151
  %153 = fsub float %152, %139
  %154 = fsub float %151, %153
  %155 = fadd float %150, %154
  %156 = fadd float %152, %155
  %157 = fsub float %156, %152
  %158 = fsub float %155, %157
  %159 = fmul float %156, %25
  %160 = fneg float %159
  %161 = tail call float @llvm.fma.f32(float %25, float %156, float %160)
  %162 = tail call float @llvm.fma.f32(float %25, float %158, float %161)
  %163 = fadd float %159, %162
  %164 = fsub float %163, %159
  %165 = fsub float %162, %164
  %166 = tail call float @llvm.fabs.f32(float %159) #3
  %167 = fcmp oeq float %166, 0x7FF0000000000000
  %168 = select i1 %167, float %159, float %163
  %169 = tail call float @llvm.fabs.f32(float %168) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float 0.000000e+00, float %165
  %172 = fcmp oeq float %168, 0x40562E4300000000
  %173 = select i1 %172, float 0x3EE0000000000000, float 0.000000e+00
  %174 = fsub float %168, %173
  %175 = fadd float %173, %171
  %176 = fmul float %174, 0x3FF7154760000000
  %177 = tail call float @llvm.rint.f32(float %176)
  %178 = fcmp ogt float %174, 0x40562E4300000000
  %179 = fcmp olt float %174, 0xC059D1DA00000000
  %180 = fneg float %176
  %181 = tail call float @llvm.fma.f32(float %174, float 0x3FF7154760000000, float %180)
  %182 = tail call float @llvm.fma.f32(float %174, float 0x3E54AE0BE0000000, float %181)
  %183 = fsub float %176, %177
  %184 = fadd float %182, %183
  %185 = tail call float @llvm.exp2.f32(float %184)
  %186 = fptosi float %177 to i32
  %187 = tail call float @llvm.amdgcn.ldexp.f32(float %185, i32 %186)
  %188 = select i1 %179, float 0.000000e+00, float %187
  %189 = select i1 %178, float 0x7FF0000000000000, float %188
  %190 = tail call float @llvm.fma.f32(float %189, float %175, float %189)
  %191 = tail call float @llvm.fabs.f32(float %189) #3
  %192 = fcmp oeq float %191, 0x7FF0000000000000
  %193 = select i1 %192, float %189, float %190
  %194 = fcmp olt float %50, 0.000000e+00
  %195 = and i1 %38, %194
  %196 = select i1 %195, float -0.000000e+00, float 0.000000e+00
  %197 = tail call float @llvm.copysign.f32(float %193, float %196)
  %198 = fcmp uge float %50, 0.000000e+00
  %199 = select i1 %198, i1 true, i1 %39
  %200 = select i1 %199, float %197, float 0x7FF8000000000000
  %201 = fcmp oeq float %51, 0x7FF0000000000000
  %202 = fcmp oeq float %50, 0.000000e+00
  %203 = or i1 %202, %201
  %204 = xor i1 %42, %202
  %205 = select i1 %204, float 0.000000e+00, float 0x7FF0000000000000
  %206 = select i1 %38, float %50, float 0.000000e+00
  %207 = tail call float @llvm.copysign.f32(float %205, float %206)
  %208 = select i1 %203, float %207, float %200
  %209 = fcmp uno float %50, %25
  %210 = select i1 %209, float 0x7FF8000000000000, float %208
  %211 = fcmp oeq float %50, 1.000000e+00
  %212 = or i1 %43, %211
  %213 = fpext float %210 to double
  %214 = select i1 %212, double 1.000000e+00, double %213
  %215 = getelementptr inbounds double, double addrspace(1)* %3, i64 %47
  store double %214, double addrspace(1)* %215, align 8, !tbaa !16
  %216 = add i32 %46, %22
  %217 = icmp ult i32 %216, %0
  br i1 %217, label %45, label %44, !llvm.loop !20

218:                                              ; preds = %24, %218
  %219 = phi i32 [ %247, %218 ], [ %16, %24 ]
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds double, double addrspace(1)* %2, i64 %220
  %222 = load double, double addrspace(1)* %221, align 8, !tbaa !16
  %223 = fptrunc double %222 to float
  %224 = tail call float @llvm.fabs.f32(float %223)
  %225 = fcmp oeq float %224, 1.000000e+00
  %226 = fadd float %224, -1.000000e+00
  %227 = bitcast float %226 to i32
  %228 = xor i32 %227, %41
  %229 = icmp sgt i32 %228, -1
  %230 = select i1 %229, float 0x7FF0000000000000, float 0.000000e+00
  %231 = select i1 %225, float %224, float %230
  %232 = fcmp oeq float %224, 0x7FF0000000000000
  %233 = fcmp oeq float %223, 0.000000e+00
  %234 = or i1 %233, %232
  %235 = xor i1 %42, %233
  %236 = select i1 %235, float 0.000000e+00, float 0x7FF0000000000000
  %237 = select i1 %38, float %223, float 0.000000e+00
  %238 = tail call float @llvm.copysign.f32(float %236, float %237)
  %239 = select i1 %234, float %238, float %231
  %240 = fcmp uno float %223, %25
  %241 = select i1 %240, float 0x7FF8000000000000, float %239
  %242 = fcmp oeq float %223, 1.000000e+00
  %243 = or i1 %43, %242
  %244 = fpext float %241 to double
  %245 = select i1 %243, double 1.000000e+00, double %244
  %246 = getelementptr inbounds double, double addrspace(1)* %3, i64 %220
  store double %245, double addrspace(1)* %246, align 8, !tbaa !16
  %247 = add i32 %219, %22
  %248 = icmp ult i32 %247, %0
  br i1 %248, label %218, label %44, !llvm.loop !20
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
