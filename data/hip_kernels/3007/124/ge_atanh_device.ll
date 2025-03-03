; ModuleID = '../data/hip_kernels/3007/124/main.cu'
source_filename = "../data/hip_kernels/3007/124/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ge_atanhiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %176

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fadd float %36, 1.000000e+00
  %38 = fsub float 1.000000e+00, %36
  %39 = fsub float 1.000000e+00, %38
  %40 = fsub float %39, %36
  %41 = tail call float @llvm.amdgcn.rcp.f32(float %38)
  %42 = fmul float %37, %41
  %43 = fmul float %38, %42
  %44 = fneg float %43
  %45 = tail call float @llvm.fma.f32(float %42, float %38, float %44)
  %46 = tail call float @llvm.fma.f32(float %42, float %40, float %45)
  %47 = fadd float %37, -1.000000e+00
  %48 = fsub float %36, %47
  %49 = fadd float %43, %46
  %50 = fsub float %49, %43
  %51 = fsub float %46, %50
  %52 = fsub float %37, %49
  %53 = fsub float %37, %52
  %54 = fsub float %53, %49
  %55 = fsub float %54, %51
  %56 = fadd float %48, %55
  %57 = fadd float %52, %56
  %58 = fmul float %41, %57
  %59 = fadd float %42, %58
  %60 = fsub float %59, %42
  %61 = fsub float %58, %60
  %62 = tail call float @llvm.amdgcn.frexp.mant.f32(float %59)
  %63 = fcmp olt float %62, 0x3FE5555560000000
  %64 = sext i1 %63 to i32
  %65 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %59)
  %66 = add i32 %65, %64
  %67 = sub nsw i32 0, %66
  %68 = tail call float @llvm.amdgcn.ldexp.f32(float %59, i32 %67)
  %69 = tail call float @llvm.amdgcn.ldexp.f32(float %61, i32 %67)
  %70 = fadd float %68, -1.000000e+00
  %71 = fadd float %70, 1.000000e+00
  %72 = fsub float %68, %71
  %73 = fadd float %69, %72
  %74 = fadd float %70, %73
  %75 = fsub float %74, %70
  %76 = fsub float %73, %75
  %77 = fadd float %68, 1.000000e+00
  %78 = fadd float %77, -1.000000e+00
  %79 = fsub float %68, %78
  %80 = fadd float %69, %79
  %81 = fadd float %77, %80
  %82 = fsub float %81, %77
  %83 = fsub float %80, %82
  %84 = tail call float @llvm.amdgcn.rcp.f32(float %81)
  %85 = fmul float %74, %84
  %86 = fmul float %81, %85
  %87 = fneg float %86
  %88 = tail call float @llvm.fma.f32(float %85, float %81, float %87)
  %89 = tail call float @llvm.fma.f32(float %85, float %83, float %88)
  %90 = fadd float %86, %89
  %91 = fsub float %90, %86
  %92 = fsub float %89, %91
  %93 = fsub float %74, %90
  %94 = fsub float %74, %93
  %95 = fsub float %94, %90
  %96 = fadd float %76, %95
  %97 = fsub float %96, %92
  %98 = fadd float %93, %97
  %99 = fmul float %84, %98
  %100 = fmul float %81, %99
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %99, float %81, float %101)
  %103 = tail call float @llvm.fma.f32(float %99, float %83, float %102)
  %104 = fsub float %98, %93
  %105 = fsub float %97, %104
  %106 = fadd float %100, %103
  %107 = fsub float %106, %100
  %108 = fsub float %103, %107
  %109 = fsub float %98, %106
  %110 = fsub float %98, %109
  %111 = fsub float %110, %106
  %112 = fadd float %105, %111
  %113 = fsub float %112, %108
  %114 = fadd float %109, %113
  %115 = fmul float %84, %114
  %116 = fadd float %85, %99
  %117 = fsub float %116, %85
  %118 = fsub float %99, %117
  %119 = fadd float %118, %115
  %120 = fadd float %116, %119
  %121 = fmul float %120, %120
  %122 = tail call float @llvm.fmuladd.f32(float %121, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %123 = tail call float @llvm.fmuladd.f32(float %121, float %122, float 0x3FE5555B40000000)
  %124 = sitofp i32 %66 to float
  %125 = fmul float %124, 0x3FE62E4300000000
  %126 = fneg float %125
  %127 = tail call float @llvm.fma.f32(float %124, float 0x3FE62E4300000000, float %126)
  %128 = tail call float @llvm.fma.f32(float %124, float 0xBE205C6100000000, float %127)
  %129 = fsub float %120, %116
  %130 = fsub float %119, %129
  %131 = fadd float %125, %128
  %132 = fsub float %131, %125
  %133 = fsub float %128, %132
  %134 = tail call float @llvm.amdgcn.ldexp.f32(float %120, i32 1)
  %135 = tail call float @llvm.amdgcn.ldexp.f32(float %130, i32 1)
  %136 = fmul float %120, %121
  %137 = fmul float %136, %123
  %138 = fadd float %134, %137
  %139 = fsub float %138, %134
  %140 = fsub float %137, %139
  %141 = fadd float %135, %140
  %142 = fadd float %138, %141
  %143 = fsub float %142, %138
  %144 = fsub float %141, %143
  %145 = fadd float %131, %142
  %146 = fsub float %145, %131
  %147 = fsub float %145, %146
  %148 = fsub float %131, %147
  %149 = fsub float %142, %146
  %150 = fadd float %149, %148
  %151 = fadd float %133, %144
  %152 = fsub float %151, %133
  %153 = fsub float %151, %152
  %154 = fsub float %133, %153
  %155 = fsub float %144, %152
  %156 = fadd float %155, %154
  %157 = fadd float %151, %150
  %158 = fadd float %145, %157
  %159 = fsub float %158, %145
  %160 = fsub float %157, %159
  %161 = fadd float %156, %160
  %162 = fadd float %158, %161
  %163 = fmul float %162, 5.000000e-01
  %164 = fcmp olt float %36, 0x3F30000000000000
  %165 = select i1 %164, float %36, float %163
  %166 = fcmp ogt float %36, 1.000000e+00
  %167 = select i1 %166, float 0x7FF8000000000000, float %165
  %168 = fcmp oeq float %36, 1.000000e+00
  %169 = select i1 %168, float 0x7FF0000000000000, float %167
  %170 = tail call float @llvm.copysign.f32(float %169, float %35)
  %171 = add nsw i32 %17, %6
  %172 = mul nsw i32 %25, %7
  %173 = add nsw i32 %171, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %5, i64 %174
  store float %170, float addrspace(1)* %175, align 4, !tbaa !7
  br label %176

176:                                              ; preds = %29, %8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

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
