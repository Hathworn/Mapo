; ModuleID = '../data/hip_kernels/6493/24/main.cu'
source_filename = "../data/hip_kernels/6493/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10powWalkersifPKfPf(i32 %0, float %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %211

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %2, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = tail call float @llvm.fabs.f32(float %18)
  %20 = tail call float @llvm.amdgcn.frexp.mant.f32(float %19)
  %21 = fcmp olt float %20, 0x3FE5555560000000
  %22 = zext i1 %21 to i32
  %23 = tail call float @llvm.amdgcn.ldexp.f32(float %20, i32 %22)
  %24 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %19)
  %25 = sub nsw i32 %24, %22
  %26 = fadd float %23, -1.000000e+00
  %27 = fadd float %23, 1.000000e+00
  %28 = fadd float %27, -1.000000e+00
  %29 = fsub float %23, %28
  %30 = tail call float @llvm.amdgcn.rcp.f32(float %27)
  %31 = fmul float %26, %30
  %32 = fmul float %27, %31
  %33 = fneg float %32
  %34 = tail call float @llvm.fma.f32(float %31, float %27, float %33)
  %35 = tail call float @llvm.fma.f32(float %31, float %29, float %34)
  %36 = fadd float %32, %35
  %37 = fsub float %36, %32
  %38 = fsub float %35, %37
  %39 = fsub float %26, %36
  %40 = fsub float %26, %39
  %41 = fsub float %40, %36
  %42 = fsub float %41, %38
  %43 = fadd float %39, %42
  %44 = fmul float %30, %43
  %45 = fadd float %31, %44
  %46 = fsub float %45, %31
  %47 = fsub float %44, %46
  %48 = fmul float %45, %45
  %49 = fneg float %48
  %50 = tail call float @llvm.fma.f32(float %45, float %45, float %49)
  %51 = fmul float %47, 2.000000e+00
  %52 = tail call float @llvm.fma.f32(float %45, float %51, float %50)
  %53 = fadd float %48, %52
  %54 = fsub float %53, %48
  %55 = fsub float %52, %54
  %56 = tail call float @llvm.fmuladd.f32(float %53, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %57 = tail call float @llvm.fmuladd.f32(float %53, float %56, float 0x3FD999BDE0000000)
  %58 = sitofp i32 %25 to float
  %59 = fmul float %58, 0x3FE62E4300000000
  %60 = fneg float %59
  %61 = tail call float @llvm.fma.f32(float %58, float 0x3FE62E4300000000, float %60)
  %62 = tail call float @llvm.fma.f32(float %58, float 0xBE205C6100000000, float %61)
  %63 = fadd float %59, %62
  %64 = fsub float %63, %59
  %65 = fsub float %62, %64
  %66 = tail call float @llvm.amdgcn.ldexp.f32(float %45, i32 1)
  %67 = fmul float %45, %53
  %68 = fneg float %67
  %69 = tail call float @llvm.fma.f32(float %53, float %45, float %68)
  %70 = tail call float @llvm.fma.f32(float %53, float %47, float %69)
  %71 = tail call float @llvm.fma.f32(float %55, float %45, float %70)
  %72 = fadd float %67, %71
  %73 = fsub float %72, %67
  %74 = fsub float %71, %73
  %75 = fmul float %53, %57
  %76 = fneg float %75
  %77 = tail call float @llvm.fma.f32(float %53, float %57, float %76)
  %78 = tail call float @llvm.fma.f32(float %55, float %57, float %77)
  %79 = fadd float %75, %78
  %80 = fsub float %79, %75
  %81 = fsub float %78, %80
  %82 = fadd float %79, 0x3FE5555540000000
  %83 = fadd float %82, 0xBFE5555540000000
  %84 = fsub float %79, %83
  %85 = fadd float %81, 0x3E2E720200000000
  %86 = fadd float %85, %84
  %87 = fadd float %82, %86
  %88 = fsub float %87, %82
  %89 = fsub float %86, %88
  %90 = fmul float %72, %87
  %91 = fneg float %90
  %92 = tail call float @llvm.fma.f32(float %72, float %87, float %91)
  %93 = tail call float @llvm.fma.f32(float %72, float %89, float %92)
  %94 = tail call float @llvm.fma.f32(float %74, float %87, float %93)
  %95 = tail call float @llvm.amdgcn.ldexp.f32(float %47, i32 1)
  %96 = fadd float %90, %94
  %97 = fsub float %96, %90
  %98 = fsub float %94, %97
  %99 = fadd float %66, %96
  %100 = fsub float %99, %66
  %101 = fsub float %96, %100
  %102 = fadd float %95, %98
  %103 = fadd float %102, %101
  %104 = fadd float %99, %103
  %105 = fsub float %104, %99
  %106 = fsub float %103, %105
  %107 = fadd float %63, %104
  %108 = fsub float %107, %63
  %109 = fsub float %107, %108
  %110 = fsub float %63, %109
  %111 = fsub float %104, %108
  %112 = fadd float %111, %110
  %113 = fadd float %65, %106
  %114 = fsub float %113, %65
  %115 = fsub float %113, %114
  %116 = fsub float %65, %115
  %117 = fsub float %106, %114
  %118 = fadd float %117, %116
  %119 = fadd float %113, %112
  %120 = fadd float %107, %119
  %121 = fsub float %120, %107
  %122 = fsub float %119, %121
  %123 = fadd float %118, %122
  %124 = fadd float %120, %123
  %125 = fsub float %124, %120
  %126 = fsub float %123, %125
  %127 = fmul float %124, %1
  %128 = fneg float %127
  %129 = tail call float @llvm.fma.f32(float %1, float %124, float %128)
  %130 = tail call float @llvm.fma.f32(float %1, float %126, float %129)
  %131 = fadd float %127, %130
  %132 = fsub float %131, %127
  %133 = fsub float %130, %132
  %134 = tail call float @llvm.fabs.f32(float %127) #3
  %135 = fcmp oeq float %134, 0x7FF0000000000000
  %136 = select i1 %135, float %127, float %131
  %137 = tail call float @llvm.fabs.f32(float %136) #3
  %138 = fcmp oeq float %137, 0x7FF0000000000000
  %139 = select i1 %138, float 0.000000e+00, float %133
  %140 = fcmp oeq float %136, 0x40562E4300000000
  %141 = select i1 %140, float 0x3EE0000000000000, float 0.000000e+00
  %142 = fsub float %136, %141
  %143 = fadd float %141, %139
  %144 = fmul float %142, 0x3FF7154760000000
  %145 = tail call float @llvm.rint.f32(float %144)
  %146 = fcmp ogt float %142, 0x40562E4300000000
  %147 = fcmp olt float %142, 0xC059D1DA00000000
  %148 = fneg float %144
  %149 = tail call float @llvm.fma.f32(float %142, float 0x3FF7154760000000, float %148)
  %150 = tail call float @llvm.fma.f32(float %142, float 0x3E54AE0BE0000000, float %149)
  %151 = fsub float %144, %145
  %152 = fadd float %150, %151
  %153 = tail call float @llvm.exp2.f32(float %152)
  %154 = fptosi float %145 to i32
  %155 = tail call float @llvm.amdgcn.ldexp.f32(float %153, i32 %154)
  %156 = select i1 %147, float 0.000000e+00, float %155
  %157 = select i1 %146, float 0x7FF0000000000000, float %156
  %158 = tail call float @llvm.fma.f32(float %157, float %143, float %157)
  %159 = tail call float @llvm.fabs.f32(float %157) #3
  %160 = fcmp oeq float %159, 0x7FF0000000000000
  %161 = select i1 %160, float %157, float %158
  %162 = tail call float @llvm.fabs.f32(float %1)
  %163 = tail call float @llvm.trunc.f32(float %162)
  %164 = fcmp oeq float %162, %163
  %165 = zext i1 %164 to i32
  %166 = fmul float %163, 5.000000e-01
  %167 = tail call float @llvm.amdgcn.fract.f32(float %166)
  %168 = tail call i1 @llvm.amdgcn.class.f32(float %166, i32 516)
  %169 = select i1 %168, float 0.000000e+00, float %167
  %170 = fcmp oeq float %169, 0.000000e+00
  %171 = and i1 %164, %170
  %172 = zext i1 %171 to i32
  %173 = add nuw nsw i32 %172, %165
  %174 = icmp eq i32 %173, 1
  %175 = fcmp olt float %18, 0.000000e+00
  %176 = and i1 %174, %175
  %177 = select i1 %176, float -0.000000e+00, float 0.000000e+00
  %178 = tail call float @llvm.copysign.f32(float %161, float %177)
  %179 = fcmp uge float %18, 0.000000e+00
  %180 = icmp ne i32 %173, 0
  %181 = select i1 %179, i1 true, i1 %180
  %182 = select i1 %181, float %178, float 0x7FF8000000000000
  %183 = fcmp oeq float %162, 0x7FF0000000000000
  br i1 %183, label %184, label %193

184:                                              ; preds = %15
  %185 = fcmp oeq float %19, 1.000000e+00
  %186 = fadd float %19, -1.000000e+00
  %187 = bitcast float %1 to i32
  %188 = bitcast float %186 to i32
  %189 = xor i32 %188, %187
  %190 = icmp sgt i32 %189, -1
  %191 = select i1 %190, float 0x7FF0000000000000, float 0.000000e+00
  %192 = select i1 %185, float %19, float %191
  br label %193

193:                                              ; preds = %15, %184
  %194 = phi float [ %182, %15 ], [ %192, %184 ]
  %195 = fcmp oeq float %19, 0x7FF0000000000000
  %196 = fcmp oeq float %18, 0.000000e+00
  %197 = or i1 %196, %195
  %198 = fcmp olt float %1, 0.000000e+00
  %199 = xor i1 %198, %196
  %200 = select i1 %199, float 0.000000e+00, float 0x7FF0000000000000
  %201 = select i1 %174, float %18, float 0.000000e+00
  %202 = tail call float @llvm.copysign.f32(float %200, float %201)
  %203 = select i1 %197, float %202, float %194
  %204 = fcmp uno float %18, %1
  %205 = select i1 %204, float 0x7FF8000000000000, float %203
  %206 = fcmp oeq float %18, 1.000000e+00
  %207 = fcmp oeq float %1, 0.000000e+00
  %208 = or i1 %207, %206
  %209 = select i1 %208, float 1.000000e+00, float %205
  %210 = getelementptr inbounds float, float addrspace(1)* %3, i64 %16
  store float %209, float addrspace(1)* %210, align 4, !tbaa !7
  br label %211

211:                                              ; preds = %193, %4
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
