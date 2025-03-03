; ModuleID = '../data/hip_kernels/15505/31/main.cu'
source_filename = "../data/hip_kernels/15505/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10pow_kernelPfif(float addrspace(1)* nocapture %0, i32 %1, float %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %1
  br i1 %13, label %14, label %209

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = tail call float @llvm.fabs.f32(float %17)
  %19 = tail call float @llvm.amdgcn.frexp.mant.f32(float %18)
  %20 = fcmp olt float %19, 0x3FE5555560000000
  %21 = zext i1 %20 to i32
  %22 = tail call float @llvm.amdgcn.ldexp.f32(float %19, i32 %21)
  %23 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %18)
  %24 = sub nsw i32 %23, %21
  %25 = fadd float %22, -1.000000e+00
  %26 = fadd float %22, 1.000000e+00
  %27 = fadd float %26, -1.000000e+00
  %28 = fsub float %22, %27
  %29 = tail call float @llvm.amdgcn.rcp.f32(float %26)
  %30 = fmul float %25, %29
  %31 = fmul float %26, %30
  %32 = fneg float %31
  %33 = tail call float @llvm.fma.f32(float %30, float %26, float %32)
  %34 = tail call float @llvm.fma.f32(float %30, float %28, float %33)
  %35 = fadd float %31, %34
  %36 = fsub float %35, %31
  %37 = fsub float %34, %36
  %38 = fsub float %25, %35
  %39 = fsub float %25, %38
  %40 = fsub float %39, %35
  %41 = fsub float %40, %37
  %42 = fadd float %38, %41
  %43 = fmul float %29, %42
  %44 = fadd float %30, %43
  %45 = fsub float %44, %30
  %46 = fsub float %43, %45
  %47 = fmul float %44, %44
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %44, float %44, float %48)
  %50 = fmul float %46, 2.000000e+00
  %51 = tail call float @llvm.fma.f32(float %44, float %50, float %49)
  %52 = fadd float %47, %51
  %53 = fsub float %52, %47
  %54 = fsub float %51, %53
  %55 = tail call float @llvm.fmuladd.f32(float %52, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %56 = tail call float @llvm.fmuladd.f32(float %52, float %55, float 0x3FD999BDE0000000)
  %57 = sitofp i32 %24 to float
  %58 = fmul float %57, 0x3FE62E4300000000
  %59 = fneg float %58
  %60 = tail call float @llvm.fma.f32(float %57, float 0x3FE62E4300000000, float %59)
  %61 = tail call float @llvm.fma.f32(float %57, float 0xBE205C6100000000, float %60)
  %62 = fadd float %58, %61
  %63 = fsub float %62, %58
  %64 = fsub float %61, %63
  %65 = tail call float @llvm.amdgcn.ldexp.f32(float %44, i32 1)
  %66 = fmul float %44, %52
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %52, float %44, float %67)
  %69 = tail call float @llvm.fma.f32(float %52, float %46, float %68)
  %70 = tail call float @llvm.fma.f32(float %54, float %44, float %69)
  %71 = fadd float %66, %70
  %72 = fsub float %71, %66
  %73 = fsub float %70, %72
  %74 = fmul float %52, %56
  %75 = fneg float %74
  %76 = tail call float @llvm.fma.f32(float %52, float %56, float %75)
  %77 = tail call float @llvm.fma.f32(float %54, float %56, float %76)
  %78 = fadd float %74, %77
  %79 = fsub float %78, %74
  %80 = fsub float %77, %79
  %81 = fadd float %78, 0x3FE5555540000000
  %82 = fadd float %81, 0xBFE5555540000000
  %83 = fsub float %78, %82
  %84 = fadd float %80, 0x3E2E720200000000
  %85 = fadd float %84, %83
  %86 = fadd float %81, %85
  %87 = fsub float %86, %81
  %88 = fsub float %85, %87
  %89 = fmul float %71, %86
  %90 = fneg float %89
  %91 = tail call float @llvm.fma.f32(float %71, float %86, float %90)
  %92 = tail call float @llvm.fma.f32(float %71, float %88, float %91)
  %93 = tail call float @llvm.fma.f32(float %73, float %86, float %92)
  %94 = tail call float @llvm.amdgcn.ldexp.f32(float %46, i32 1)
  %95 = fadd float %89, %93
  %96 = fsub float %95, %89
  %97 = fsub float %93, %96
  %98 = fadd float %65, %95
  %99 = fsub float %98, %65
  %100 = fsub float %95, %99
  %101 = fadd float %94, %97
  %102 = fadd float %101, %100
  %103 = fadd float %98, %102
  %104 = fsub float %103, %98
  %105 = fsub float %102, %104
  %106 = fadd float %62, %103
  %107 = fsub float %106, %62
  %108 = fsub float %106, %107
  %109 = fsub float %62, %108
  %110 = fsub float %103, %107
  %111 = fadd float %110, %109
  %112 = fadd float %64, %105
  %113 = fsub float %112, %64
  %114 = fsub float %112, %113
  %115 = fsub float %64, %114
  %116 = fsub float %105, %113
  %117 = fadd float %116, %115
  %118 = fadd float %112, %111
  %119 = fadd float %106, %118
  %120 = fsub float %119, %106
  %121 = fsub float %118, %120
  %122 = fadd float %117, %121
  %123 = fadd float %119, %122
  %124 = fsub float %123, %119
  %125 = fsub float %122, %124
  %126 = fmul float %123, %2
  %127 = fneg float %126
  %128 = tail call float @llvm.fma.f32(float %2, float %123, float %127)
  %129 = tail call float @llvm.fma.f32(float %2, float %125, float %128)
  %130 = fadd float %126, %129
  %131 = fsub float %130, %126
  %132 = fsub float %129, %131
  %133 = tail call float @llvm.fabs.f32(float %126) #3
  %134 = fcmp oeq float %133, 0x7FF0000000000000
  %135 = select i1 %134, float %126, float %130
  %136 = tail call float @llvm.fabs.f32(float %135) #3
  %137 = fcmp oeq float %136, 0x7FF0000000000000
  %138 = select i1 %137, float 0.000000e+00, float %132
  %139 = fcmp oeq float %135, 0x40562E4300000000
  %140 = select i1 %139, float 0x3EE0000000000000, float 0.000000e+00
  %141 = fsub float %135, %140
  %142 = fadd float %140, %138
  %143 = fmul float %141, 0x3FF7154760000000
  %144 = tail call float @llvm.rint.f32(float %143)
  %145 = fcmp ogt float %141, 0x40562E4300000000
  %146 = fcmp olt float %141, 0xC059D1DA00000000
  %147 = fneg float %143
  %148 = tail call float @llvm.fma.f32(float %141, float 0x3FF7154760000000, float %147)
  %149 = tail call float @llvm.fma.f32(float %141, float 0x3E54AE0BE0000000, float %148)
  %150 = fsub float %143, %144
  %151 = fadd float %149, %150
  %152 = tail call float @llvm.exp2.f32(float %151)
  %153 = fptosi float %144 to i32
  %154 = tail call float @llvm.amdgcn.ldexp.f32(float %152, i32 %153)
  %155 = select i1 %146, float 0.000000e+00, float %154
  %156 = select i1 %145, float 0x7FF0000000000000, float %155
  %157 = tail call float @llvm.fma.f32(float %156, float %142, float %156)
  %158 = tail call float @llvm.fabs.f32(float %156) #3
  %159 = fcmp oeq float %158, 0x7FF0000000000000
  %160 = select i1 %159, float %156, float %157
  %161 = tail call float @llvm.fabs.f32(float %2)
  %162 = tail call float @llvm.trunc.f32(float %161)
  %163 = fcmp oeq float %161, %162
  %164 = zext i1 %163 to i32
  %165 = fmul float %162, 5.000000e-01
  %166 = tail call float @llvm.amdgcn.fract.f32(float %165)
  %167 = tail call i1 @llvm.amdgcn.class.f32(float %165, i32 516)
  %168 = select i1 %167, float 0.000000e+00, float %166
  %169 = fcmp oeq float %168, 0.000000e+00
  %170 = and i1 %163, %169
  %171 = zext i1 %170 to i32
  %172 = add nuw nsw i32 %171, %164
  %173 = icmp eq i32 %172, 1
  %174 = fcmp olt float %17, 0.000000e+00
  %175 = and i1 %173, %174
  %176 = select i1 %175, float -0.000000e+00, float 0.000000e+00
  %177 = tail call float @llvm.copysign.f32(float %160, float %176)
  %178 = fcmp uge float %17, 0.000000e+00
  %179 = icmp ne i32 %172, 0
  %180 = select i1 %178, i1 true, i1 %179
  %181 = select i1 %180, float %177, float 0x7FF8000000000000
  %182 = fcmp oeq float %161, 0x7FF0000000000000
  br i1 %182, label %183, label %192

183:                                              ; preds = %14
  %184 = fcmp oeq float %18, 1.000000e+00
  %185 = fadd float %18, -1.000000e+00
  %186 = bitcast float %2 to i32
  %187 = bitcast float %185 to i32
  %188 = xor i32 %187, %186
  %189 = icmp sgt i32 %188, -1
  %190 = select i1 %189, float 0x7FF0000000000000, float 0.000000e+00
  %191 = select i1 %184, float %18, float %190
  br label %192

192:                                              ; preds = %14, %183
  %193 = phi float [ %181, %14 ], [ %191, %183 ]
  %194 = fcmp oeq float %18, 0x7FF0000000000000
  %195 = fcmp oeq float %17, 0.000000e+00
  %196 = or i1 %195, %194
  %197 = fcmp olt float %2, 0.000000e+00
  %198 = xor i1 %197, %195
  %199 = select i1 %198, float 0.000000e+00, float 0x7FF0000000000000
  %200 = select i1 %173, float %17, float 0.000000e+00
  %201 = tail call float @llvm.copysign.f32(float %199, float %200)
  %202 = select i1 %196, float %201, float %193
  %203 = fcmp uno float %17, %2
  %204 = select i1 %203, float 0x7FF8000000000000, float %202
  %205 = fcmp oeq float %17, 1.000000e+00
  %206 = fcmp oeq float %2, 0.000000e+00
  %207 = or i1 %206, %205
  %208 = select i1 %207, float 1.000000e+00, float %204
  store float %208, float addrspace(1)* %16, align 4, !tbaa !7
  br label %209

209:                                              ; preds = %3, %192
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
