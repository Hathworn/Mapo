; ModuleID = '../data/hip_kernels/3007/184/main.cu'
source_filename = "../data/hip_kernels/3007/184/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10uplo_acoshiiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %201

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %201

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = fcmp oge float %43, 0x43F0000000000000
  %45 = select i1 %44, float 0x3BF0000000000000, float 1.000000e+00
  %46 = fmul float %43, %45
  %47 = fmul float %46, %46
  %48 = fneg float %47
  %49 = tail call float @llvm.fma.f32(float %46, float %46, float %48)
  %50 = select i1 %44, float 0x37F0000000000000, float 1.000000e+00
  %51 = fsub float %47, %50
  %52 = fsub float %51, %47
  %53 = fsub float %51, %52
  %54 = fsub float %47, %53
  %55 = fadd float %50, %52
  %56 = fsub float %54, %55
  %57 = fadd float %49, %56
  %58 = fadd float %51, %57
  %59 = tail call float @llvm.sqrt.f32(float %58)
  %60 = fmul float %59, %59
  %61 = fneg float %60
  %62 = tail call float @llvm.fma.f32(float %59, float %59, float %61)
  %63 = fsub float %58, %51
  %64 = fsub float %57, %63
  %65 = fsub float %58, %60
  %66 = fsub float %58, %65
  %67 = fsub float %66, %60
  %68 = fadd float %64, %67
  %69 = fsub float %68, %62
  %70 = fadd float %65, %69
  %71 = fmul float %59, 2.000000e+00
  %72 = tail call float @llvm.amdgcn.rcp.f32(float %71)
  %73 = fmul float %72, %70
  %74 = fcmp oeq float %58, 0.000000e+00
  %75 = select i1 %74, float 0.000000e+00, float %73
  %76 = fadd float %59, %75
  %77 = fsub float %76, %59
  %78 = fsub float %75, %77
  %79 = fadd float %46, %76
  %80 = fsub float %79, %46
  %81 = fsub float %79, %80
  %82 = fsub float %46, %81
  %83 = fsub float %76, %80
  %84 = fadd float %83, %82
  %85 = fadd float %78, %84
  %86 = fadd float %79, %85
  %87 = fsub float %86, %79
  %88 = fsub float %85, %87
  %89 = select i1 %44, i32 64, i32 0
  %90 = tail call float @llvm.amdgcn.frexp.mant.f32(float %86)
  %91 = fcmp olt float %90, 0x3FE5555560000000
  %92 = sext i1 %91 to i32
  %93 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %86)
  %94 = add i32 %93, %92
  %95 = sub nsw i32 0, %94
  %96 = tail call float @llvm.amdgcn.ldexp.f32(float %86, i32 %95)
  %97 = tail call float @llvm.amdgcn.ldexp.f32(float %88, i32 %95)
  %98 = fadd float %96, -1.000000e+00
  %99 = fadd float %98, 1.000000e+00
  %100 = fsub float %96, %99
  %101 = fadd float %97, %100
  %102 = fadd float %98, %101
  %103 = fsub float %102, %98
  %104 = fsub float %101, %103
  %105 = fadd float %96, 1.000000e+00
  %106 = fadd float %105, -1.000000e+00
  %107 = fsub float %96, %106
  %108 = fadd float %97, %107
  %109 = fadd float %105, %108
  %110 = fsub float %109, %105
  %111 = fsub float %108, %110
  %112 = tail call float @llvm.amdgcn.rcp.f32(float %109)
  %113 = fmul float %102, %112
  %114 = fmul float %109, %113
  %115 = fneg float %114
  %116 = tail call float @llvm.fma.f32(float %113, float %109, float %115)
  %117 = tail call float @llvm.fma.f32(float %113, float %111, float %116)
  %118 = fadd float %114, %117
  %119 = fsub float %118, %114
  %120 = fsub float %117, %119
  %121 = fsub float %102, %118
  %122 = fsub float %102, %121
  %123 = fsub float %122, %118
  %124 = fadd float %104, %123
  %125 = fsub float %124, %120
  %126 = fadd float %121, %125
  %127 = fmul float %112, %126
  %128 = fmul float %109, %127
  %129 = fneg float %128
  %130 = tail call float @llvm.fma.f32(float %127, float %109, float %129)
  %131 = tail call float @llvm.fma.f32(float %127, float %111, float %130)
  %132 = fsub float %126, %121
  %133 = fsub float %125, %132
  %134 = fadd float %128, %131
  %135 = fsub float %134, %128
  %136 = fsub float %131, %135
  %137 = fsub float %126, %134
  %138 = fsub float %126, %137
  %139 = fsub float %138, %134
  %140 = fadd float %133, %139
  %141 = fsub float %140, %136
  %142 = fadd float %137, %141
  %143 = fmul float %112, %142
  %144 = fadd float %113, %127
  %145 = fsub float %144, %113
  %146 = fsub float %127, %145
  %147 = fadd float %146, %143
  %148 = fadd float %144, %147
  %149 = fmul float %148, %148
  %150 = tail call float @llvm.fmuladd.f32(float %149, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %151 = tail call float @llvm.fmuladd.f32(float %149, float %150, float 0x3FE5555B40000000)
  %152 = add nsw i32 %94, %89
  %153 = sitofp i32 %152 to float
  %154 = fmul float %153, 0x3FE62E4300000000
  %155 = fneg float %154
  %156 = tail call float @llvm.fma.f32(float %153, float 0x3FE62E4300000000, float %155)
  %157 = tail call float @llvm.fma.f32(float %153, float 0xBE205C6100000000, float %156)
  %158 = fsub float %148, %144
  %159 = fsub float %147, %158
  %160 = fadd float %154, %157
  %161 = fsub float %160, %154
  %162 = fsub float %157, %161
  %163 = tail call float @llvm.amdgcn.ldexp.f32(float %148, i32 1)
  %164 = tail call float @llvm.amdgcn.ldexp.f32(float %159, i32 1)
  %165 = fmul float %148, %149
  %166 = fmul float %165, %151
  %167 = fadd float %163, %166
  %168 = fsub float %167, %163
  %169 = fsub float %166, %168
  %170 = fadd float %164, %169
  %171 = fadd float %167, %170
  %172 = fsub float %171, %167
  %173 = fsub float %170, %172
  %174 = fadd float %160, %171
  %175 = fsub float %174, %160
  %176 = fsub float %174, %175
  %177 = fsub float %160, %176
  %178 = fsub float %171, %175
  %179 = fadd float %178, %177
  %180 = fadd float %162, %173
  %181 = fsub float %180, %162
  %182 = fsub float %180, %181
  %183 = fsub float %162, %182
  %184 = fsub float %173, %181
  %185 = fadd float %184, %183
  %186 = fadd float %180, %179
  %187 = fadd float %174, %186
  %188 = fsub float %187, %174
  %189 = fsub float %186, %188
  %190 = fadd float %185, %189
  %191 = fadd float %187, %190
  %192 = tail call i1 @llvm.amdgcn.class.f32(float %43, i32 512)
  %193 = select i1 %192, float %43, float %191
  %194 = fcmp olt float %43, 1.000000e+00
  %195 = select i1 %194, float 0x7FF8000000000000, float %193
  %196 = add nsw i32 %18, %7
  %197 = mul nsw i32 %26, %8
  %198 = add nsw i32 %196, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds float, float addrspace(1)* %6, i64 %199
  store float %195, float addrspace(1)* %200, align 4, !tbaa !7
  br label %201

201:                                              ; preds = %9, %37, %30
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
