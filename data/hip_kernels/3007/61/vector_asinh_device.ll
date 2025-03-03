; ModuleID = '../data/hip_kernels/3007/61/main.cu'
source_filename = "../data/hip_kernels/3007/61/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_asinhiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %182

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = tail call float @llvm.fabs.f32(float %23)
  %25 = fcmp oge float %24, 0x43F0000000000000
  %26 = select i1 %25, float 0x3BF0000000000000, float 1.000000e+00
  %27 = fmul float %24, %26
  %28 = fmul float %27, %27
  %29 = fneg float %28
  %30 = tail call float @llvm.fma.f32(float %27, float %27, float %29)
  %31 = select i1 %25, float 0x37F0000000000000, float 1.000000e+00
  %32 = fadd float %31, %28
  %33 = fsub float %32, %28
  %34 = fsub float %32, %33
  %35 = fsub float %28, %34
  %36 = fsub float %31, %33
  %37 = fadd float %36, %35
  %38 = fadd float %30, %37
  %39 = fadd float %32, %38
  %40 = tail call float @llvm.sqrt.f32(float %39)
  %41 = fmul float %40, %40
  %42 = fneg float %41
  %43 = tail call float @llvm.fma.f32(float %40, float %40, float %42)
  %44 = fsub float %39, %32
  %45 = fsub float %38, %44
  %46 = fsub float %39, %41
  %47 = fsub float %39, %46
  %48 = fsub float %47, %41
  %49 = fadd float %45, %48
  %50 = fsub float %49, %43
  %51 = fadd float %46, %50
  %52 = fmul float %40, 2.000000e+00
  %53 = tail call float @llvm.amdgcn.rcp.f32(float %52)
  %54 = fmul float %53, %51
  %55 = fcmp oeq float %39, 0.000000e+00
  %56 = select i1 %55, float 0.000000e+00, float %54
  %57 = fadd float %40, %56
  %58 = fsub float %57, %40
  %59 = fsub float %56, %58
  %60 = fadd float %27, %57
  %61 = fsub float %60, %27
  %62 = fsub float %60, %61
  %63 = fsub float %27, %62
  %64 = fsub float %57, %61
  %65 = fadd float %64, %63
  %66 = fadd float %59, %65
  %67 = fadd float %60, %66
  %68 = fsub float %67, %60
  %69 = fsub float %66, %68
  %70 = select i1 %25, i32 64, i32 0
  %71 = tail call float @llvm.amdgcn.frexp.mant.f32(float %67)
  %72 = fcmp olt float %71, 0x3FE5555560000000
  %73 = sext i1 %72 to i32
  %74 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %67)
  %75 = add i32 %74, %73
  %76 = sub nsw i32 0, %75
  %77 = tail call float @llvm.amdgcn.ldexp.f32(float %67, i32 %76)
  %78 = tail call float @llvm.amdgcn.ldexp.f32(float %69, i32 %76)
  %79 = fadd float %77, -1.000000e+00
  %80 = fadd float %79, 1.000000e+00
  %81 = fsub float %77, %80
  %82 = fadd float %78, %81
  %83 = fadd float %79, %82
  %84 = fsub float %83, %79
  %85 = fsub float %82, %84
  %86 = fadd float %77, 1.000000e+00
  %87 = fadd float %86, -1.000000e+00
  %88 = fsub float %77, %87
  %89 = fadd float %78, %88
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = tail call float @llvm.amdgcn.rcp.f32(float %90)
  %94 = fmul float %83, %93
  %95 = fmul float %90, %94
  %96 = fneg float %95
  %97 = tail call float @llvm.fma.f32(float %94, float %90, float %96)
  %98 = tail call float @llvm.fma.f32(float %94, float %92, float %97)
  %99 = fadd float %95, %98
  %100 = fsub float %99, %95
  %101 = fsub float %98, %100
  %102 = fsub float %83, %99
  %103 = fsub float %83, %102
  %104 = fsub float %103, %99
  %105 = fadd float %85, %104
  %106 = fsub float %105, %101
  %107 = fadd float %102, %106
  %108 = fmul float %93, %107
  %109 = fmul float %90, %108
  %110 = fneg float %109
  %111 = tail call float @llvm.fma.f32(float %108, float %90, float %110)
  %112 = tail call float @llvm.fma.f32(float %108, float %92, float %111)
  %113 = fsub float %107, %102
  %114 = fsub float %106, %113
  %115 = fadd float %109, %112
  %116 = fsub float %115, %109
  %117 = fsub float %112, %116
  %118 = fsub float %107, %115
  %119 = fsub float %107, %118
  %120 = fsub float %119, %115
  %121 = fadd float %114, %120
  %122 = fsub float %121, %117
  %123 = fadd float %118, %122
  %124 = fmul float %93, %123
  %125 = fadd float %94, %108
  %126 = fsub float %125, %94
  %127 = fsub float %108, %126
  %128 = fadd float %127, %124
  %129 = fadd float %125, %128
  %130 = fmul float %129, %129
  %131 = tail call float @llvm.fmuladd.f32(float %130, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %132 = tail call float @llvm.fmuladd.f32(float %130, float %131, float 0x3FE5555B40000000)
  %133 = add nsw i32 %75, %70
  %134 = sitofp i32 %133 to float
  %135 = fmul float %134, 0x3FE62E4300000000
  %136 = fneg float %135
  %137 = tail call float @llvm.fma.f32(float %134, float 0x3FE62E4300000000, float %136)
  %138 = tail call float @llvm.fma.f32(float %134, float 0xBE205C6100000000, float %137)
  %139 = fsub float %129, %125
  %140 = fsub float %128, %139
  %141 = fadd float %135, %138
  %142 = fsub float %141, %135
  %143 = fsub float %138, %142
  %144 = tail call float @llvm.amdgcn.ldexp.f32(float %129, i32 1)
  %145 = tail call float @llvm.amdgcn.ldexp.f32(float %140, i32 1)
  %146 = fmul float %129, %130
  %147 = fmul float %146, %132
  %148 = fadd float %144, %147
  %149 = fsub float %148, %144
  %150 = fsub float %147, %149
  %151 = fadd float %145, %150
  %152 = fadd float %148, %151
  %153 = fsub float %152, %148
  %154 = fsub float %151, %153
  %155 = fadd float %141, %152
  %156 = fsub float %155, %141
  %157 = fsub float %155, %156
  %158 = fsub float %141, %157
  %159 = fsub float %152, %156
  %160 = fadd float %159, %158
  %161 = fadd float %143, %154
  %162 = fsub float %161, %143
  %163 = fsub float %161, %162
  %164 = fsub float %143, %163
  %165 = fsub float %154, %162
  %166 = fadd float %165, %164
  %167 = fadd float %161, %160
  %168 = fadd float %155, %167
  %169 = fsub float %168, %155
  %170 = fsub float %167, %169
  %171 = fadd float %166, %170
  %172 = fadd float %168, %171
  %173 = fcmp olt float %24, 0x3F30000000000000
  %174 = tail call i1 @llvm.amdgcn.class.f32(float %24, i32 512)
  %175 = select i1 %174, i1 true, i1 %173
  %176 = select i1 %175, float %24, float %172
  %177 = tail call float @llvm.copysign.f32(float %176, float %23)
  %178 = mul nsw i32 %16, %6
  %179 = add nsw i32 %178, %5
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %4, i64 %180
  store float %177, float addrspace(1)* %181, align 4, !tbaa !7
  br label %182

182:                                              ; preds = %18, %7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.frexp.mant.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="64" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
