; ModuleID = '../data/hip_kernels/6493/33/main.cu'
source_filename = "../data/hip_kernels/6493/33/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16mapRandomNumbersiiiPKfPfPiS1_S2_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !5, !invariant.load !6
  %14 = zext i16 %13 to i32
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = mul i32 %15, %14
  %17 = add i32 %16, %9
  %18 = icmp slt i32 %17, %0
  br i1 %18, label %19, label %217

19:                                               ; preds = %8
  %20 = shl nsw i32 %2, 2
  %21 = shl nsw i32 %1, 3
  %22 = add i32 %20, %21
  %23 = mul i32 %22, %0
  %24 = add i32 %23, %17
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %3, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = fadd contract float %27, 1.000000e+00
  %29 = tail call float @llvm.fabs.f32(float %28)
  %30 = tail call float @llvm.amdgcn.frexp.mant.f32(float %29)
  %31 = fcmp olt float %30, 0x3FE5555560000000
  %32 = zext i1 %31 to i32
  %33 = tail call float @llvm.amdgcn.ldexp.f32(float %30, i32 %32)
  %34 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %29)
  %35 = sub nsw i32 %34, %32
  %36 = fadd float %33, -1.000000e+00
  %37 = fadd float %33, 1.000000e+00
  %38 = fadd float %37, -1.000000e+00
  %39 = fsub float %33, %38
  %40 = tail call float @llvm.amdgcn.rcp.f32(float %37)
  %41 = fmul float %36, %40
  %42 = fmul float %37, %41
  %43 = fneg float %42
  %44 = tail call float @llvm.fma.f32(float %41, float %37, float %43)
  %45 = tail call float @llvm.fma.f32(float %41, float %39, float %44)
  %46 = fadd float %42, %45
  %47 = fsub float %46, %42
  %48 = fsub float %45, %47
  %49 = fsub float %36, %46
  %50 = fsub float %36, %49
  %51 = fsub float %50, %46
  %52 = fsub float %51, %48
  %53 = fadd float %49, %52
  %54 = fmul float %40, %53
  %55 = fadd float %41, %54
  %56 = fsub float %55, %41
  %57 = fsub float %54, %56
  %58 = fmul float %55, %55
  %59 = fneg float %58
  %60 = tail call float @llvm.fma.f32(float %55, float %55, float %59)
  %61 = fmul float %57, 2.000000e+00
  %62 = tail call float @llvm.fma.f32(float %55, float %61, float %60)
  %63 = fadd float %58, %62
  %64 = fsub float %63, %58
  %65 = fsub float %62, %64
  %66 = tail call float @llvm.fmuladd.f32(float %63, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %67 = tail call float @llvm.fmuladd.f32(float %63, float %66, float 0x3FD999BDE0000000)
  %68 = sitofp i32 %35 to float
  %69 = fmul float %68, 0x3FE62E4300000000
  %70 = fneg float %69
  %71 = tail call float @llvm.fma.f32(float %68, float 0x3FE62E4300000000, float %70)
  %72 = tail call float @llvm.fma.f32(float %68, float 0xBE205C6100000000, float %71)
  %73 = fadd float %69, %72
  %74 = fsub float %73, %69
  %75 = fsub float %72, %74
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %55, i32 1)
  %77 = fmul float %55, %63
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %63, float %55, float %78)
  %80 = tail call float @llvm.fma.f32(float %63, float %57, float %79)
  %81 = tail call float @llvm.fma.f32(float %65, float %55, float %80)
  %82 = fadd float %77, %81
  %83 = fsub float %82, %77
  %84 = fsub float %81, %83
  %85 = fmul float %63, %67
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %63, float %67, float %86)
  %88 = tail call float @llvm.fma.f32(float %65, float %67, float %87)
  %89 = fadd float %85, %88
  %90 = fsub float %89, %85
  %91 = fsub float %88, %90
  %92 = fadd float %89, 0x3FE5555540000000
  %93 = fadd float %92, 0xBFE5555540000000
  %94 = fsub float %89, %93
  %95 = fadd float %91, 0x3E2E720200000000
  %96 = fadd float %95, %94
  %97 = fadd float %92, %96
  %98 = fsub float %97, %92
  %99 = fsub float %96, %98
  %100 = fmul float %82, %97
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %82, float %97, float %101)
  %103 = tail call float @llvm.fma.f32(float %82, float %99, float %102)
  %104 = tail call float @llvm.fma.f32(float %84, float %97, float %103)
  %105 = tail call float @llvm.amdgcn.ldexp.f32(float %57, i32 1)
  %106 = fadd float %100, %104
  %107 = fsub float %106, %100
  %108 = fsub float %104, %107
  %109 = fadd float %76, %106
  %110 = fsub float %109, %76
  %111 = fsub float %106, %110
  %112 = fadd float %105, %108
  %113 = fadd float %112, %111
  %114 = fadd float %109, %113
  %115 = fsub float %114, %109
  %116 = fsub float %113, %115
  %117 = fadd float %73, %114
  %118 = fsub float %117, %73
  %119 = fsub float %117, %118
  %120 = fsub float %73, %119
  %121 = fsub float %114, %118
  %122 = fadd float %121, %120
  %123 = fadd float %75, %116
  %124 = fsub float %123, %75
  %125 = fsub float %123, %124
  %126 = fsub float %75, %125
  %127 = fsub float %116, %124
  %128 = fadd float %127, %126
  %129 = fadd float %123, %122
  %130 = fadd float %117, %129
  %131 = fsub float %130, %117
  %132 = fsub float %129, %131
  %133 = fadd float %128, %132
  %134 = fadd float %130, %133
  %135 = fsub float %134, %130
  %136 = fsub float %133, %135
  %137 = fmul float %134, 2.000000e+00
  %138 = fneg float %137
  %139 = tail call float @llvm.fma.f32(float %134, float 2.000000e+00, float %138)
  %140 = tail call float @llvm.fma.f32(float %136, float 2.000000e+00, float %139)
  %141 = fadd float %137, %140
  %142 = fsub float %141, %137
  %143 = fsub float %140, %142
  %144 = tail call float @llvm.fabs.f32(float %137) #3
  %145 = fcmp oeq float %144, 0x7FF0000000000000
  %146 = select i1 %145, float %137, float %141
  %147 = tail call float @llvm.fabs.f32(float %146) #3
  %148 = fcmp oeq float %147, 0x7FF0000000000000
  %149 = select i1 %148, float 0.000000e+00, float %143
  %150 = fcmp oeq float %146, 0x40562E4300000000
  %151 = select i1 %150, float 0x3EE0000000000000, float 0.000000e+00
  %152 = fsub float %146, %151
  %153 = fadd float %151, %149
  %154 = fmul float %152, 0x3FF7154760000000
  %155 = tail call float @llvm.rint.f32(float %154)
  %156 = fcmp ogt float %152, 0x40562E4300000000
  %157 = fcmp olt float %152, 0xC059D1DA00000000
  %158 = fneg float %154
  %159 = tail call float @llvm.fma.f32(float %152, float 0x3FF7154760000000, float %158)
  %160 = tail call float @llvm.fma.f32(float %152, float 0x3E54AE0BE0000000, float %159)
  %161 = fsub float %154, %155
  %162 = fadd float %160, %161
  %163 = tail call float @llvm.exp2.f32(float %162)
  %164 = fptosi float %155 to i32
  %165 = tail call float @llvm.amdgcn.ldexp.f32(float %163, i32 %164)
  %166 = select i1 %157, float 0.000000e+00, float %165
  %167 = select i1 %156, float 0x7FF0000000000000, float %166
  %168 = tail call float @llvm.fma.f32(float %167, float %153, float %167)
  %169 = tail call float @llvm.fabs.f32(float %167) #3
  %170 = fcmp oeq float %169, 0x7FF0000000000000
  %171 = select i1 %170, float %167, float %168
  %172 = tail call float @llvm.fabs.f32(float %171)
  %173 = fcmp oeq float %29, 0x7FF0000000000000
  %174 = fcmp oeq float %28, 0.000000e+00
  %175 = fcmp uno float %28, 0.000000e+00
  %176 = fcmp oeq float %28, 1.000000e+00
  %177 = fmul contract float %172, 5.000000e-01
  %178 = select i1 %173, float 0x7FF0000000000000, float %177
  %179 = select i1 %174, float 0.000000e+00, float %178
  %180 = select i1 %175, float 0x7FF8000000000000, float %179
  %181 = select i1 %176, float 5.000000e-01, float %180
  %182 = sext i32 %17 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %4, i64 %182
  store float %181, float addrspace(1)* %183, align 4, !tbaa !7
  %184 = add i32 %23, %0
  %185 = add i32 %184, %17
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds float, float addrspace(1)* %3, i64 %186
  %188 = load float, float addrspace(1)* %187, align 4, !tbaa !7
  %189 = fpext float %188 to double
  %190 = add nsw i32 %0, -1
  %191 = sitofp i32 %190 to double
  %192 = fadd contract double %191, 0x3FEFFFFDE7210BE9
  %193 = fmul contract double %192, %189
  %194 = fptrunc double %193 to float
  %195 = tail call float @llvm.trunc.f32(float %194)
  %196 = fptosi float %195 to i32
  %197 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %182
  store i32 %196, i32 addrspace(1)* %197, align 4, !tbaa !11
  %198 = shl nsw i32 %0, 1
  %199 = add i32 %23, %198
  %200 = add i32 %199, %17
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %3, i64 %201
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7
  %204 = getelementptr inbounds float, float addrspace(1)* %6, i64 %182
  store float %203, float addrspace(1)* %204, align 4, !tbaa !7
  %205 = mul nsw i32 %0, 3
  %206 = add i32 %23, %205
  %207 = add i32 %206, %17
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds float, float addrspace(1)* %3, i64 %208
  %210 = load float, float addrspace(1)* %209, align 4, !tbaa !7
  %211 = fpext float %210 to double
  %212 = fmul contract double %211, 0x4013FFFFBCE4217D
  %213 = fptrunc double %212 to float
  %214 = tail call float @llvm.trunc.f32(float %213)
  %215 = fptosi float %214 to i32
  %216 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %182
  store i32 %215, i32 addrspace(1)* %216, align 4, !tbaa !11
  br label %217

217:                                              ; preds = %19, %8
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
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
