; ModuleID = '../data/hip_kernels/59/89/main.cu'
source_filename = "../data/hip_kernels/59/89/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10kPowMatrixPfS_S_j(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
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
  br i1 %23, label %25, label %24

24:                                               ; preds = %206, %4
  ret void

25:                                               ; preds = %4, %206
  %26 = phi i32 [ %224, %206 ], [ %16, %4 ]
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !16
  %30 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16
  %32 = tail call float @llvm.fabs.f32(float %29)
  %33 = tail call float @llvm.amdgcn.frexp.mant.f32(float %32)
  %34 = fcmp olt float %33, 0x3FE5555560000000
  %35 = zext i1 %34 to i32
  %36 = tail call float @llvm.amdgcn.ldexp.f32(float %33, i32 %35)
  %37 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %32)
  %38 = sub nsw i32 %37, %35
  %39 = fadd float %36, -1.000000e+00
  %40 = fadd float %36, 1.000000e+00
  %41 = fadd float %40, -1.000000e+00
  %42 = fsub float %36, %41
  %43 = tail call float @llvm.amdgcn.rcp.f32(float %40)
  %44 = fmul float %39, %43
  %45 = fmul float %40, %44
  %46 = fneg float %45
  %47 = tail call float @llvm.fma.f32(float %44, float %40, float %46)
  %48 = tail call float @llvm.fma.f32(float %44, float %42, float %47)
  %49 = fadd float %45, %48
  %50 = fsub float %49, %45
  %51 = fsub float %48, %50
  %52 = fsub float %39, %49
  %53 = fsub float %39, %52
  %54 = fsub float %53, %49
  %55 = fsub float %54, %51
  %56 = fadd float %52, %55
  %57 = fmul float %43, %56
  %58 = fadd float %44, %57
  %59 = fsub float %58, %44
  %60 = fsub float %57, %59
  %61 = fmul float %58, %58
  %62 = fneg float %61
  %63 = tail call float @llvm.fma.f32(float %58, float %58, float %62)
  %64 = fmul float %60, 2.000000e+00
  %65 = tail call float @llvm.fma.f32(float %58, float %64, float %63)
  %66 = fadd float %61, %65
  %67 = fsub float %66, %61
  %68 = fsub float %65, %67
  %69 = tail call float @llvm.fmuladd.f32(float %66, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %70 = tail call float @llvm.fmuladd.f32(float %66, float %69, float 0x3FD999BDE0000000)
  %71 = sitofp i32 %38 to float
  %72 = fmul float %71, 0x3FE62E4300000000
  %73 = fneg float %72
  %74 = tail call float @llvm.fma.f32(float %71, float 0x3FE62E4300000000, float %73)
  %75 = tail call float @llvm.fma.f32(float %71, float 0xBE205C6100000000, float %74)
  %76 = fadd float %72, %75
  %77 = fsub float %76, %72
  %78 = fsub float %75, %77
  %79 = tail call float @llvm.amdgcn.ldexp.f32(float %58, i32 1)
  %80 = fmul float %58, %66
  %81 = fneg float %80
  %82 = tail call float @llvm.fma.f32(float %66, float %58, float %81)
  %83 = tail call float @llvm.fma.f32(float %66, float %60, float %82)
  %84 = tail call float @llvm.fma.f32(float %68, float %58, float %83)
  %85 = fadd float %80, %84
  %86 = fsub float %85, %80
  %87 = fsub float %84, %86
  %88 = fmul float %66, %70
  %89 = fneg float %88
  %90 = tail call float @llvm.fma.f32(float %66, float %70, float %89)
  %91 = tail call float @llvm.fma.f32(float %68, float %70, float %90)
  %92 = fadd float %88, %91
  %93 = fsub float %92, %88
  %94 = fsub float %91, %93
  %95 = fadd float %92, 0x3FE5555540000000
  %96 = fadd float %95, 0xBFE5555540000000
  %97 = fsub float %92, %96
  %98 = fadd float %94, 0x3E2E720200000000
  %99 = fadd float %98, %97
  %100 = fadd float %95, %99
  %101 = fsub float %100, %95
  %102 = fsub float %99, %101
  %103 = fmul float %85, %100
  %104 = fneg float %103
  %105 = tail call float @llvm.fma.f32(float %85, float %100, float %104)
  %106 = tail call float @llvm.fma.f32(float %85, float %102, float %105)
  %107 = tail call float @llvm.fma.f32(float %87, float %100, float %106)
  %108 = tail call float @llvm.amdgcn.ldexp.f32(float %60, i32 1)
  %109 = fadd float %103, %107
  %110 = fsub float %109, %103
  %111 = fsub float %107, %110
  %112 = fadd float %79, %109
  %113 = fsub float %112, %79
  %114 = fsub float %109, %113
  %115 = fadd float %108, %111
  %116 = fadd float %115, %114
  %117 = fadd float %112, %116
  %118 = fsub float %117, %112
  %119 = fsub float %116, %118
  %120 = fadd float %76, %117
  %121 = fsub float %120, %76
  %122 = fsub float %120, %121
  %123 = fsub float %76, %122
  %124 = fsub float %117, %121
  %125 = fadd float %124, %123
  %126 = fadd float %78, %119
  %127 = fsub float %126, %78
  %128 = fsub float %126, %127
  %129 = fsub float %78, %128
  %130 = fsub float %119, %127
  %131 = fadd float %130, %129
  %132 = fadd float %126, %125
  %133 = fadd float %120, %132
  %134 = fsub float %133, %120
  %135 = fsub float %132, %134
  %136 = fadd float %131, %135
  %137 = fadd float %133, %136
  %138 = fsub float %137, %133
  %139 = fsub float %136, %138
  %140 = fmul float %31, %137
  %141 = fneg float %140
  %142 = tail call float @llvm.fma.f32(float %31, float %137, float %141)
  %143 = tail call float @llvm.fma.f32(float %31, float %139, float %142)
  %144 = fadd float %140, %143
  %145 = fsub float %144, %140
  %146 = fsub float %143, %145
  %147 = tail call float @llvm.fabs.f32(float %140) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float %140, float %144
  %150 = tail call float @llvm.fabs.f32(float %149) #3
  %151 = fcmp oeq float %150, 0x7FF0000000000000
  %152 = select i1 %151, float 0.000000e+00, float %146
  %153 = fcmp oeq float %149, 0x40562E4300000000
  %154 = select i1 %153, float 0x3EE0000000000000, float 0.000000e+00
  %155 = fsub float %149, %154
  %156 = fadd float %154, %152
  %157 = fmul float %155, 0x3FF7154760000000
  %158 = tail call float @llvm.rint.f32(float %157)
  %159 = fcmp ogt float %155, 0x40562E4300000000
  %160 = fcmp olt float %155, 0xC059D1DA00000000
  %161 = fneg float %157
  %162 = tail call float @llvm.fma.f32(float %155, float 0x3FF7154760000000, float %161)
  %163 = tail call float @llvm.fma.f32(float %155, float 0x3E54AE0BE0000000, float %162)
  %164 = fsub float %157, %158
  %165 = fadd float %163, %164
  %166 = tail call float @llvm.exp2.f32(float %165)
  %167 = fptosi float %158 to i32
  %168 = tail call float @llvm.amdgcn.ldexp.f32(float %166, i32 %167)
  %169 = select i1 %160, float 0.000000e+00, float %168
  %170 = select i1 %159, float 0x7FF0000000000000, float %169
  %171 = tail call float @llvm.fma.f32(float %170, float %156, float %170)
  %172 = tail call float @llvm.fabs.f32(float %170) #3
  %173 = fcmp oeq float %172, 0x7FF0000000000000
  %174 = select i1 %173, float %170, float %171
  %175 = tail call float @llvm.fabs.f32(float %31)
  %176 = tail call float @llvm.trunc.f32(float %175)
  %177 = fcmp oeq float %175, %176
  %178 = zext i1 %177 to i32
  %179 = fmul float %176, 5.000000e-01
  %180 = tail call float @llvm.amdgcn.fract.f32(float %179)
  %181 = tail call i1 @llvm.amdgcn.class.f32(float %179, i32 516)
  %182 = select i1 %181, float 0.000000e+00, float %180
  %183 = fcmp oeq float %182, 0.000000e+00
  %184 = and i1 %177, %183
  %185 = zext i1 %184 to i32
  %186 = add nuw nsw i32 %185, %178
  %187 = icmp eq i32 %186, 1
  %188 = fcmp olt float %29, 0.000000e+00
  %189 = and i1 %188, %187
  %190 = select i1 %189, float -0.000000e+00, float 0.000000e+00
  %191 = tail call float @llvm.copysign.f32(float %174, float %190)
  %192 = fcmp uge float %29, 0.000000e+00
  %193 = icmp ne i32 %186, 0
  %194 = select i1 %192, i1 true, i1 %193
  %195 = select i1 %194, float %191, float 0x7FF8000000000000
  %196 = fcmp oeq float %175, 0x7FF0000000000000
  br i1 %196, label %197, label %206

197:                                              ; preds = %25
  %198 = fcmp oeq float %32, 1.000000e+00
  %199 = fadd float %32, -1.000000e+00
  %200 = bitcast float %31 to i32
  %201 = bitcast float %199 to i32
  %202 = xor i32 %201, %200
  %203 = icmp sgt i32 %202, -1
  %204 = select i1 %203, float 0x7FF0000000000000, float 0.000000e+00
  %205 = select i1 %198, float %32, float %204
  br label %206

206:                                              ; preds = %25, %197
  %207 = phi float [ %195, %25 ], [ %205, %197 ]
  %208 = fcmp oeq float %32, 0x7FF0000000000000
  %209 = fcmp oeq float %29, 0.000000e+00
  %210 = or i1 %209, %208
  %211 = fcmp olt float %31, 0.000000e+00
  %212 = xor i1 %209, %211
  %213 = select i1 %212, float 0.000000e+00, float 0x7FF0000000000000
  %214 = select i1 %187, float %29, float 0.000000e+00
  %215 = tail call float @llvm.copysign.f32(float %213, float %214)
  %216 = select i1 %210, float %215, float %207
  %217 = fcmp uno float %29, %31
  %218 = select i1 %217, float 0x7FF8000000000000, float %216
  %219 = fcmp oeq float %29, 1.000000e+00
  %220 = fcmp oeq float %31, 0.000000e+00
  %221 = or i1 %219, %220
  %222 = select i1 %221, float 1.000000e+00, float %218
  %223 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  store float %222, float addrspace(1)* %223, align 4, !tbaa !16
  %224 = add i32 %26, %22
  %225 = icmp ult i32 %224, %3
  br i1 %225, label %25, label %24, !llvm.loop !20
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
