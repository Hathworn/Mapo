; ModuleID = '../data/hip_kernels/3007/62/main.cu'
source_filename = "../data/hip_kernels/3007/62/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12vector_acoshiPKfiiPfii(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %180

18:                                               ; preds = %7
  %19 = mul nsw i32 %16, %3
  %20 = add nsw i32 %19, %2
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %21
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = fcmp oge float %23, 0x43F0000000000000
  %25 = select i1 %24, float 0x3BF0000000000000, float 1.000000e+00
  %26 = fmul float %23, %25
  %27 = fmul float %26, %26
  %28 = fneg float %27
  %29 = tail call float @llvm.fma.f32(float %26, float %26, float %28)
  %30 = select i1 %24, float 0x37F0000000000000, float 1.000000e+00
  %31 = fsub float %27, %30
  %32 = fsub float %31, %27
  %33 = fsub float %31, %32
  %34 = fsub float %27, %33
  %35 = fadd float %30, %32
  %36 = fsub float %34, %35
  %37 = fadd float %29, %36
  %38 = fadd float %31, %37
  %39 = tail call float @llvm.sqrt.f32(float %38)
  %40 = fmul float %39, %39
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %39, float %39, float %41)
  %43 = fsub float %38, %31
  %44 = fsub float %37, %43
  %45 = fsub float %38, %40
  %46 = fsub float %38, %45
  %47 = fsub float %46, %40
  %48 = fadd float %44, %47
  %49 = fsub float %48, %42
  %50 = fadd float %45, %49
  %51 = fmul float %39, 2.000000e+00
  %52 = tail call float @llvm.amdgcn.rcp.f32(float %51)
  %53 = fmul float %52, %50
  %54 = fcmp oeq float %38, 0.000000e+00
  %55 = select i1 %54, float 0.000000e+00, float %53
  %56 = fadd float %39, %55
  %57 = fsub float %56, %39
  %58 = fsub float %55, %57
  %59 = fadd float %26, %56
  %60 = fsub float %59, %26
  %61 = fsub float %59, %60
  %62 = fsub float %26, %61
  %63 = fsub float %56, %60
  %64 = fadd float %63, %62
  %65 = fadd float %58, %64
  %66 = fadd float %59, %65
  %67 = fsub float %66, %59
  %68 = fsub float %65, %67
  %69 = select i1 %24, i32 64, i32 0
  %70 = tail call float @llvm.amdgcn.frexp.mant.f32(float %66)
  %71 = fcmp olt float %70, 0x3FE5555560000000
  %72 = sext i1 %71 to i32
  %73 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %66)
  %74 = add i32 %73, %72
  %75 = sub nsw i32 0, %74
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %66, i32 %75)
  %77 = tail call float @llvm.amdgcn.ldexp.f32(float %68, i32 %75)
  %78 = fadd float %76, -1.000000e+00
  %79 = fadd float %78, 1.000000e+00
  %80 = fsub float %76, %79
  %81 = fadd float %77, %80
  %82 = fadd float %78, %81
  %83 = fsub float %82, %78
  %84 = fsub float %81, %83
  %85 = fadd float %76, 1.000000e+00
  %86 = fadd float %85, -1.000000e+00
  %87 = fsub float %76, %86
  %88 = fadd float %77, %87
  %89 = fadd float %85, %88
  %90 = fsub float %89, %85
  %91 = fsub float %88, %90
  %92 = tail call float @llvm.amdgcn.rcp.f32(float %89)
  %93 = fmul float %82, %92
  %94 = fmul float %89, %93
  %95 = fneg float %94
  %96 = tail call float @llvm.fma.f32(float %93, float %89, float %95)
  %97 = tail call float @llvm.fma.f32(float %93, float %91, float %96)
  %98 = fadd float %94, %97
  %99 = fsub float %98, %94
  %100 = fsub float %97, %99
  %101 = fsub float %82, %98
  %102 = fsub float %82, %101
  %103 = fsub float %102, %98
  %104 = fadd float %84, %103
  %105 = fsub float %104, %100
  %106 = fadd float %101, %105
  %107 = fmul float %92, %106
  %108 = fmul float %89, %107
  %109 = fneg float %108
  %110 = tail call float @llvm.fma.f32(float %107, float %89, float %109)
  %111 = tail call float @llvm.fma.f32(float %107, float %91, float %110)
  %112 = fsub float %106, %101
  %113 = fsub float %105, %112
  %114 = fadd float %108, %111
  %115 = fsub float %114, %108
  %116 = fsub float %111, %115
  %117 = fsub float %106, %114
  %118 = fsub float %106, %117
  %119 = fsub float %118, %114
  %120 = fadd float %113, %119
  %121 = fsub float %120, %116
  %122 = fadd float %117, %121
  %123 = fmul float %92, %122
  %124 = fadd float %93, %107
  %125 = fsub float %124, %93
  %126 = fsub float %107, %125
  %127 = fadd float %126, %123
  %128 = fadd float %124, %127
  %129 = fmul float %128, %128
  %130 = tail call float @llvm.fmuladd.f32(float %129, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %131 = tail call float @llvm.fmuladd.f32(float %129, float %130, float 0x3FE5555B40000000)
  %132 = add nsw i32 %74, %69
  %133 = sitofp i32 %132 to float
  %134 = fmul float %133, 0x3FE62E4300000000
  %135 = fneg float %134
  %136 = tail call float @llvm.fma.f32(float %133, float 0x3FE62E4300000000, float %135)
  %137 = tail call float @llvm.fma.f32(float %133, float 0xBE205C6100000000, float %136)
  %138 = fsub float %128, %124
  %139 = fsub float %127, %138
  %140 = fadd float %134, %137
  %141 = fsub float %140, %134
  %142 = fsub float %137, %141
  %143 = tail call float @llvm.amdgcn.ldexp.f32(float %128, i32 1)
  %144 = tail call float @llvm.amdgcn.ldexp.f32(float %139, i32 1)
  %145 = fmul float %128, %129
  %146 = fmul float %145, %131
  %147 = fadd float %143, %146
  %148 = fsub float %147, %143
  %149 = fsub float %146, %148
  %150 = fadd float %144, %149
  %151 = fadd float %147, %150
  %152 = fsub float %151, %147
  %153 = fsub float %150, %152
  %154 = fadd float %140, %151
  %155 = fsub float %154, %140
  %156 = fsub float %154, %155
  %157 = fsub float %140, %156
  %158 = fsub float %151, %155
  %159 = fadd float %158, %157
  %160 = fadd float %142, %153
  %161 = fsub float %160, %142
  %162 = fsub float %160, %161
  %163 = fsub float %142, %162
  %164 = fsub float %153, %161
  %165 = fadd float %164, %163
  %166 = fadd float %160, %159
  %167 = fadd float %154, %166
  %168 = fsub float %167, %154
  %169 = fsub float %166, %168
  %170 = fadd float %165, %169
  %171 = fadd float %167, %170
  %172 = tail call i1 @llvm.amdgcn.class.f32(float %23, i32 512)
  %173 = select i1 %172, float %23, float %171
  %174 = fcmp olt float %23, 1.000000e+00
  %175 = select i1 %174, float 0x7FF8000000000000, float %173
  %176 = mul nsw i32 %16, %6
  %177 = add nsw i32 %176, %5
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %4, i64 %178
  store float %175, float addrspace(1)* %179, align 4, !tbaa !7
  br label %180

180:                                              ; preds = %18, %7
  ret void
}

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
