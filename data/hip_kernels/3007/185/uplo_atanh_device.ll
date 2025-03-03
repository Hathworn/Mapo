; ModuleID = '../data/hip_kernels/3007/185/main.cu'
source_filename = "../data/hip_kernels/3007/185/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10uplo_atanhiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %20 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 2, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %26 = add i32 %24, %25
  %27 = icmp slt i32 %18, %0
  %28 = icmp slt i32 %26, %0
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %184

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %184

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = fadd float %44, 1.000000e+00
  %46 = fsub float 1.000000e+00, %44
  %47 = fsub float 1.000000e+00, %46
  %48 = fsub float %47, %44
  %49 = tail call float @llvm.amdgcn.rcp.f32(float %46)
  %50 = fmul float %45, %49
  %51 = fmul float %46, %50
  %52 = fneg float %51
  %53 = tail call float @llvm.fma.f32(float %50, float %46, float %52)
  %54 = tail call float @llvm.fma.f32(float %50, float %48, float %53)
  %55 = fadd float %45, -1.000000e+00
  %56 = fsub float %44, %55
  %57 = fadd float %51, %54
  %58 = fsub float %57, %51
  %59 = fsub float %54, %58
  %60 = fsub float %45, %57
  %61 = fsub float %45, %60
  %62 = fsub float %61, %57
  %63 = fsub float %62, %59
  %64 = fadd float %56, %63
  %65 = fadd float %60, %64
  %66 = fmul float %49, %65
  %67 = fadd float %50, %66
  %68 = fsub float %67, %50
  %69 = fsub float %66, %68
  %70 = tail call float @llvm.amdgcn.frexp.mant.f32(float %67)
  %71 = fcmp olt float %70, 0x3FE5555560000000
  %72 = sext i1 %71 to i32
  %73 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %67)
  %74 = add i32 %73, %72
  %75 = sub nsw i32 0, %74
  %76 = tail call float @llvm.amdgcn.ldexp.f32(float %67, i32 %75)
  %77 = tail call float @llvm.amdgcn.ldexp.f32(float %69, i32 %75)
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
  %132 = sitofp i32 %74 to float
  %133 = fmul float %132, 0x3FE62E4300000000
  %134 = fneg float %133
  %135 = tail call float @llvm.fma.f32(float %132, float 0x3FE62E4300000000, float %134)
  %136 = tail call float @llvm.fma.f32(float %132, float 0xBE205C6100000000, float %135)
  %137 = fsub float %128, %124
  %138 = fsub float %127, %137
  %139 = fadd float %133, %136
  %140 = fsub float %139, %133
  %141 = fsub float %136, %140
  %142 = tail call float @llvm.amdgcn.ldexp.f32(float %128, i32 1)
  %143 = tail call float @llvm.amdgcn.ldexp.f32(float %138, i32 1)
  %144 = fmul float %128, %129
  %145 = fmul float %144, %131
  %146 = fadd float %142, %145
  %147 = fsub float %146, %142
  %148 = fsub float %145, %147
  %149 = fadd float %143, %148
  %150 = fadd float %146, %149
  %151 = fsub float %150, %146
  %152 = fsub float %149, %151
  %153 = fadd float %139, %150
  %154 = fsub float %153, %139
  %155 = fsub float %153, %154
  %156 = fsub float %139, %155
  %157 = fsub float %150, %154
  %158 = fadd float %157, %156
  %159 = fadd float %141, %152
  %160 = fsub float %159, %141
  %161 = fsub float %159, %160
  %162 = fsub float %141, %161
  %163 = fsub float %152, %160
  %164 = fadd float %163, %162
  %165 = fadd float %159, %158
  %166 = fadd float %153, %165
  %167 = fsub float %166, %153
  %168 = fsub float %165, %167
  %169 = fadd float %164, %168
  %170 = fadd float %166, %169
  %171 = fmul float %170, 5.000000e-01
  %172 = fcmp olt float %44, 0x3F30000000000000
  %173 = select i1 %172, float %44, float %171
  %174 = fcmp ogt float %44, 1.000000e+00
  %175 = select i1 %174, float 0x7FF8000000000000, float %173
  %176 = fcmp oeq float %44, 1.000000e+00
  %177 = select i1 %176, float 0x7FF0000000000000, float %175
  %178 = tail call float @llvm.copysign.f32(float %177, float %43)
  %179 = add nsw i32 %18, %7
  %180 = mul nsw i32 %26, %8
  %181 = add nsw i32 %179, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds float, float addrspace(1)* %6, i64 %182
  store float %178, float addrspace(1)* %183, align 4, !tbaa !7
  br label %184

184:                                              ; preds = %9, %37, %30
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
