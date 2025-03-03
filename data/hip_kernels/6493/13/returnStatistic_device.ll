; ModuleID = '../data/hip_kernels/6493/13/main.cu'
source_filename = "../data/hip_kernels/6493/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z15returnStatisticiiPKfPf(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %13, %0
  %23 = icmp slt i32 %21, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %184

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %0
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = tail call float @llvm.fabs.f32(float %30)
  %32 = tail call float @llvm.amdgcn.frexp.mant.f32(float %31)
  %33 = fcmp olt float %32, 0x3FE5555560000000
  %34 = zext i1 %33 to i32
  %35 = tail call float @llvm.amdgcn.ldexp.f32(float %32, i32 %34)
  %36 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %31)
  %37 = sub nsw i32 %36, %34
  %38 = fadd float %35, -1.000000e+00
  %39 = fadd float %35, 1.000000e+00
  %40 = fadd float %39, -1.000000e+00
  %41 = fsub float %35, %40
  %42 = tail call float @llvm.amdgcn.rcp.f32(float %39)
  %43 = fmul float %38, %42
  %44 = fmul float %39, %43
  %45 = fneg float %44
  %46 = tail call float @llvm.fma.f32(float %43, float %39, float %45)
  %47 = tail call float @llvm.fma.f32(float %43, float %41, float %46)
  %48 = fadd float %44, %47
  %49 = fsub float %48, %44
  %50 = fsub float %47, %49
  %51 = fsub float %38, %48
  %52 = fsub float %38, %51
  %53 = fsub float %52, %48
  %54 = fsub float %53, %50
  %55 = fadd float %51, %54
  %56 = fmul float %42, %55
  %57 = fadd float %43, %56
  %58 = fsub float %57, %43
  %59 = fsub float %56, %58
  %60 = fmul float %57, %57
  %61 = fneg float %60
  %62 = tail call float @llvm.fma.f32(float %57, float %57, float %61)
  %63 = fmul float %59, 2.000000e+00
  %64 = tail call float @llvm.fma.f32(float %57, float %63, float %62)
  %65 = fadd float %60, %64
  %66 = fsub float %65, %60
  %67 = fsub float %64, %66
  %68 = tail call float @llvm.fmuladd.f32(float %65, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %69 = tail call float @llvm.fmuladd.f32(float %65, float %68, float 0x3FD999BDE0000000)
  %70 = sitofp i32 %37 to float
  %71 = fmul float %70, 0x3FE62E4300000000
  %72 = fneg float %71
  %73 = tail call float @llvm.fma.f32(float %70, float 0x3FE62E4300000000, float %72)
  %74 = tail call float @llvm.fma.f32(float %70, float 0xBE205C6100000000, float %73)
  %75 = fadd float %71, %74
  %76 = fsub float %75, %71
  %77 = fsub float %74, %76
  %78 = tail call float @llvm.amdgcn.ldexp.f32(float %57, i32 1)
  %79 = fmul float %57, %65
  %80 = fneg float %79
  %81 = tail call float @llvm.fma.f32(float %65, float %57, float %80)
  %82 = tail call float @llvm.fma.f32(float %65, float %59, float %81)
  %83 = tail call float @llvm.fma.f32(float %67, float %57, float %82)
  %84 = fadd float %79, %83
  %85 = fsub float %84, %79
  %86 = fsub float %83, %85
  %87 = fmul float %65, %69
  %88 = fneg float %87
  %89 = tail call float @llvm.fma.f32(float %65, float %69, float %88)
  %90 = tail call float @llvm.fma.f32(float %67, float %69, float %89)
  %91 = fadd float %87, %90
  %92 = fsub float %91, %87
  %93 = fsub float %90, %92
  %94 = fadd float %91, 0x3FE5555540000000
  %95 = fadd float %94, 0xBFE5555540000000
  %96 = fsub float %91, %95
  %97 = fadd float %93, 0x3E2E720200000000
  %98 = fadd float %97, %96
  %99 = fadd float %94, %98
  %100 = fsub float %99, %94
  %101 = fsub float %98, %100
  %102 = fmul float %84, %99
  %103 = fneg float %102
  %104 = tail call float @llvm.fma.f32(float %84, float %99, float %103)
  %105 = tail call float @llvm.fma.f32(float %84, float %101, float %104)
  %106 = tail call float @llvm.fma.f32(float %86, float %99, float %105)
  %107 = tail call float @llvm.amdgcn.ldexp.f32(float %59, i32 1)
  %108 = fadd float %102, %106
  %109 = fsub float %108, %102
  %110 = fsub float %106, %109
  %111 = fadd float %78, %108
  %112 = fsub float %111, %78
  %113 = fsub float %108, %112
  %114 = fadd float %107, %110
  %115 = fadd float %114, %113
  %116 = fadd float %111, %115
  %117 = fsub float %116, %111
  %118 = fsub float %115, %117
  %119 = fadd float %75, %116
  %120 = fsub float %119, %75
  %121 = fsub float %119, %120
  %122 = fsub float %75, %121
  %123 = fsub float %116, %120
  %124 = fadd float %123, %122
  %125 = fadd float %77, %118
  %126 = fsub float %125, %77
  %127 = fsub float %125, %126
  %128 = fsub float %77, %127
  %129 = fsub float %118, %126
  %130 = fadd float %129, %128
  %131 = fadd float %125, %124
  %132 = fadd float %119, %131
  %133 = fsub float %132, %119
  %134 = fsub float %131, %133
  %135 = fadd float %130, %134
  %136 = fadd float %132, %135
  %137 = fsub float %136, %132
  %138 = fsub float %135, %137
  %139 = fmul float %136, 2.000000e+00
  %140 = fneg float %139
  %141 = tail call float @llvm.fma.f32(float %136, float 2.000000e+00, float %140)
  %142 = tail call float @llvm.fma.f32(float %138, float 2.000000e+00, float %141)
  %143 = fadd float %139, %142
  %144 = fsub float %143, %139
  %145 = fsub float %142, %144
  %146 = tail call float @llvm.fabs.f32(float %139) #3
  %147 = fcmp oeq float %146, 0x7FF0000000000000
  %148 = select i1 %147, float %139, float %143
  %149 = tail call float @llvm.fabs.f32(float %148) #3
  %150 = fcmp oeq float %149, 0x7FF0000000000000
  %151 = select i1 %150, float 0.000000e+00, float %145
  %152 = fcmp oeq float %148, 0x40562E4300000000
  %153 = select i1 %152, float 0x3EE0000000000000, float 0.000000e+00
  %154 = fsub float %148, %153
  %155 = fadd float %153, %151
  %156 = fmul float %154, 0x3FF7154760000000
  %157 = tail call float @llvm.rint.f32(float %156)
  %158 = fcmp ogt float %154, 0x40562E4300000000
  %159 = fcmp olt float %154, 0xC059D1DA00000000
  %160 = fneg float %156
  %161 = tail call float @llvm.fma.f32(float %154, float 0x3FF7154760000000, float %160)
  %162 = tail call float @llvm.fma.f32(float %154, float 0x3E54AE0BE0000000, float %161)
  %163 = fsub float %156, %157
  %164 = fadd float %162, %163
  %165 = tail call float @llvm.exp2.f32(float %164)
  %166 = fptosi float %157 to i32
  %167 = tail call float @llvm.amdgcn.ldexp.f32(float %165, i32 %166)
  %168 = select i1 %159, float 0.000000e+00, float %167
  %169 = select i1 %158, float 0x7FF0000000000000, float %168
  %170 = tail call float @llvm.fma.f32(float %169, float %155, float %169)
  %171 = tail call float @llvm.fabs.f32(float %169) #3
  %172 = fcmp oeq float %171, 0x7FF0000000000000
  %173 = select i1 %172, float %169, float %170
  %174 = tail call float @llvm.fabs.f32(float %173)
  %175 = fcmp oeq float %31, 0x7FF0000000000000
  %176 = fcmp oeq float %30, 0.000000e+00
  %177 = select i1 %175, float 0x7FF0000000000000, float %174
  %178 = select i1 %176, float 0.000000e+00, float %177
  %179 = fcmp uno float %30, 0.000000e+00
  %180 = select i1 %179, float 0x7FF8000000000000, float %178
  %181 = fcmp oeq float %30, 1.000000e+00
  %182 = select i1 %181, float 1.000000e+00, float %180
  %183 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %182, float addrspace(1)* %183, align 4, !tbaa !7
  br label %184

184:                                              ; preds = %25, %4
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
