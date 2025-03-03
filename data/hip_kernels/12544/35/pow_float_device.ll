; ModuleID = '../data/hip_kernels/12544/35/main.cu'
source_filename = "../data/hip_kernels/12544/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @pow_float(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, float %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
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
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %45

20:                                               ; preds = %6
  %21 = tail call float @llvm.fabs.f32(float %4)
  %22 = tail call float @llvm.trunc.f32(float %21)
  %23 = fcmp oeq float %21, %22
  %24 = zext i1 %23 to i32
  %25 = fmul float %22, 5.000000e-01
  %26 = tail call float @llvm.amdgcn.fract.f32(float %25)
  %27 = tail call i1 @llvm.amdgcn.class.f32(float %25, i32 516)
  %28 = select i1 %27, float 0.000000e+00, float %26
  %29 = fcmp oeq float %28, 0.000000e+00
  %30 = and i1 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add nuw nsw i32 %31, %24
  %33 = icmp eq i32 %32, 1
  %34 = icmp ne i32 %32, 0
  %35 = fcmp oeq float %21, 0x7FF0000000000000
  %36 = bitcast float %4 to i32
  %37 = fcmp olt float %4, 0.000000e+00
  %38 = fcmp oeq float %4, 0.000000e+00
  %39 = udiv i32 %15, %12
  %40 = mul i32 %39, %12
  %41 = icmp ugt i32 %15, %40
  %42 = zext i1 %41 to i32
  %43 = add i32 %39, %42
  %44 = mul i32 %43, %12
  br label %46

45:                                               ; preds = %230, %6
  ret void

46:                                               ; preds = %20, %230
  %47 = phi i32 [ %18, %20 ], [ %231, %230 ]
  %48 = icmp slt i32 %47, %1
  br i1 %48, label %230, label %49

49:                                               ; preds = %46
  %50 = srem i32 %47, %3
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %230

52:                                               ; preds = %49
  %53 = sext i32 %47 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = tail call float @llvm.fabs.f32(float %55)
  %57 = tail call float @llvm.amdgcn.frexp.mant.f32(float %56)
  %58 = fcmp olt float %57, 0x3FE5555560000000
  %59 = zext i1 %58 to i32
  %60 = tail call float @llvm.amdgcn.ldexp.f32(float %57, i32 %59)
  %61 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %56)
  %62 = sub nsw i32 %61, %59
  %63 = fadd float %60, -1.000000e+00
  %64 = fadd float %60, 1.000000e+00
  %65 = fadd float %64, -1.000000e+00
  %66 = fsub float %60, %65
  %67 = tail call float @llvm.amdgcn.rcp.f32(float %64)
  %68 = fmul float %63, %67
  %69 = fmul float %64, %68
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %68, float %64, float %70)
  %72 = tail call float @llvm.fma.f32(float %68, float %66, float %71)
  %73 = fadd float %69, %72
  %74 = fsub float %73, %69
  %75 = fsub float %72, %74
  %76 = fsub float %63, %73
  %77 = fsub float %63, %76
  %78 = fsub float %77, %73
  %79 = fsub float %78, %75
  %80 = fadd float %76, %79
  %81 = fmul float %67, %80
  %82 = fadd float %68, %81
  %83 = fsub float %82, %68
  %84 = fsub float %81, %83
  %85 = fmul float %82, %82
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %82, float %82, float %86)
  %88 = fmul float %84, 2.000000e+00
  %89 = tail call float @llvm.fma.f32(float %82, float %88, float %87)
  %90 = fadd float %85, %89
  %91 = fsub float %90, %85
  %92 = fsub float %89, %91
  %93 = tail call float @llvm.fmuladd.f32(float %90, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %94 = tail call float @llvm.fmuladd.f32(float %90, float %93, float 0x3FD999BDE0000000)
  %95 = sitofp i32 %62 to float
  %96 = fmul float %95, 0x3FE62E4300000000
  %97 = fneg float %96
  %98 = tail call float @llvm.fma.f32(float %95, float 0x3FE62E4300000000, float %97)
  %99 = tail call float @llvm.fma.f32(float %95, float 0xBE205C6100000000, float %98)
  %100 = fadd float %96, %99
  %101 = fsub float %100, %96
  %102 = fsub float %99, %101
  %103 = tail call float @llvm.amdgcn.ldexp.f32(float %82, i32 1)
  %104 = fmul float %82, %90
  %105 = fneg float %104
  %106 = tail call float @llvm.fma.f32(float %90, float %82, float %105)
  %107 = tail call float @llvm.fma.f32(float %90, float %84, float %106)
  %108 = tail call float @llvm.fma.f32(float %92, float %82, float %107)
  %109 = fadd float %104, %108
  %110 = fsub float %109, %104
  %111 = fsub float %108, %110
  %112 = fmul float %90, %94
  %113 = fneg float %112
  %114 = tail call float @llvm.fma.f32(float %90, float %94, float %113)
  %115 = tail call float @llvm.fma.f32(float %92, float %94, float %114)
  %116 = fadd float %112, %115
  %117 = fsub float %116, %112
  %118 = fsub float %115, %117
  %119 = fadd float %116, 0x3FE5555540000000
  %120 = fadd float %119, 0xBFE5555540000000
  %121 = fsub float %116, %120
  %122 = fadd float %118, 0x3E2E720200000000
  %123 = fadd float %122, %121
  %124 = fadd float %119, %123
  %125 = fsub float %124, %119
  %126 = fsub float %123, %125
  %127 = fmul float %109, %124
  %128 = fneg float %127
  %129 = tail call float @llvm.fma.f32(float %109, float %124, float %128)
  %130 = tail call float @llvm.fma.f32(float %109, float %126, float %129)
  %131 = tail call float @llvm.fma.f32(float %111, float %124, float %130)
  %132 = tail call float @llvm.amdgcn.ldexp.f32(float %84, i32 1)
  %133 = fadd float %127, %131
  %134 = fsub float %133, %127
  %135 = fsub float %131, %134
  %136 = fadd float %103, %133
  %137 = fsub float %136, %103
  %138 = fsub float %133, %137
  %139 = fadd float %132, %135
  %140 = fadd float %139, %138
  %141 = fadd float %136, %140
  %142 = fsub float %141, %136
  %143 = fsub float %140, %142
  %144 = fadd float %100, %141
  %145 = fsub float %144, %100
  %146 = fsub float %144, %145
  %147 = fsub float %100, %146
  %148 = fsub float %141, %145
  %149 = fadd float %148, %147
  %150 = fadd float %102, %143
  %151 = fsub float %150, %102
  %152 = fsub float %150, %151
  %153 = fsub float %102, %152
  %154 = fsub float %143, %151
  %155 = fadd float %154, %153
  %156 = fadd float %150, %149
  %157 = fadd float %144, %156
  %158 = fsub float %157, %144
  %159 = fsub float %156, %158
  %160 = fadd float %155, %159
  %161 = fadd float %157, %160
  %162 = fsub float %161, %157
  %163 = fsub float %160, %162
  %164 = fmul float %161, %4
  %165 = fneg float %164
  %166 = tail call float @llvm.fma.f32(float %4, float %161, float %165)
  %167 = tail call float @llvm.fma.f32(float %4, float %163, float %166)
  %168 = fadd float %164, %167
  %169 = fsub float %168, %164
  %170 = fsub float %167, %169
  %171 = tail call float @llvm.fabs.f32(float %164) #3
  %172 = fcmp oeq float %171, 0x7FF0000000000000
  %173 = select i1 %172, float %164, float %168
  %174 = tail call float @llvm.fabs.f32(float %173) #3
  %175 = fcmp oeq float %174, 0x7FF0000000000000
  %176 = select i1 %175, float 0.000000e+00, float %170
  %177 = fcmp oeq float %173, 0x40562E4300000000
  %178 = select i1 %177, float 0x3EE0000000000000, float 0.000000e+00
  %179 = fsub float %173, %178
  %180 = fadd float %178, %176
  %181 = fmul float %179, 0x3FF7154760000000
  %182 = tail call float @llvm.rint.f32(float %181)
  %183 = fcmp ogt float %179, 0x40562E4300000000
  %184 = fcmp olt float %179, 0xC059D1DA00000000
  %185 = fneg float %181
  %186 = tail call float @llvm.fma.f32(float %179, float 0x3FF7154760000000, float %185)
  %187 = tail call float @llvm.fma.f32(float %179, float 0x3E54AE0BE0000000, float %186)
  %188 = fsub float %181, %182
  %189 = fadd float %187, %188
  %190 = tail call float @llvm.exp2.f32(float %189)
  %191 = fptosi float %182 to i32
  %192 = tail call float @llvm.amdgcn.ldexp.f32(float %190, i32 %191)
  %193 = select i1 %184, float 0.000000e+00, float %192
  %194 = select i1 %183, float 0x7FF0000000000000, float %193
  %195 = tail call float @llvm.fma.f32(float %194, float %180, float %194)
  %196 = tail call float @llvm.fabs.f32(float %194) #3
  %197 = fcmp oeq float %196, 0x7FF0000000000000
  %198 = select i1 %197, float %194, float %195
  %199 = fcmp olt float %55, 0.000000e+00
  %200 = and i1 %33, %199
  %201 = select i1 %200, float -0.000000e+00, float 0.000000e+00
  %202 = tail call float @llvm.copysign.f32(float %198, float %201)
  %203 = fcmp uge float %55, 0.000000e+00
  %204 = select i1 %203, i1 true, i1 %34
  %205 = select i1 %204, float %202, float 0x7FF8000000000000
  br i1 %35, label %206, label %214

206:                                              ; preds = %52
  %207 = fcmp oeq float %56, 1.000000e+00
  %208 = fadd float %56, -1.000000e+00
  %209 = bitcast float %208 to i32
  %210 = xor i32 %209, %36
  %211 = icmp sgt i32 %210, -1
  %212 = select i1 %211, float 0x7FF0000000000000, float 0.000000e+00
  %213 = select i1 %207, float %56, float %212
  br label %214

214:                                              ; preds = %52, %206
  %215 = phi float [ %205, %52 ], [ %213, %206 ]
  %216 = fcmp oeq float %56, 0x7FF0000000000000
  %217 = fcmp oeq float %55, 0.000000e+00
  %218 = or i1 %217, %216
  %219 = xor i1 %37, %217
  %220 = select i1 %219, float 0.000000e+00, float 0x7FF0000000000000
  %221 = select i1 %33, float %55, float 0.000000e+00
  %222 = tail call float @llvm.copysign.f32(float %220, float %221)
  %223 = select i1 %218, float %222, float %215
  %224 = fcmp uno float %55, %4
  %225 = select i1 %224, float 0x7FF8000000000000, float %223
  %226 = fcmp oeq float %55, 1.000000e+00
  %227 = or i1 %38, %226
  %228 = select i1 %227, float 1.000000e+00, float %225
  %229 = getelementptr inbounds float, float addrspace(1)* %5, i64 %53
  store float %228, float addrspace(1)* %229, align 4, !tbaa !16
  br label %230

230:                                              ; preds = %46, %49, %214
  %231 = add i32 %44, %47
  %232 = icmp slt i32 %231, %0
  br i1 %232, label %46, label %45, !llvm.loop !20
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
