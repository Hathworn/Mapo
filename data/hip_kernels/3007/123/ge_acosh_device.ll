; ModuleID = '../data/hip_kernels/3007/123/main.cu'
source_filename = "../data/hip_kernels/3007/123/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ge_acoshiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %193

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fcmp oge float %35, 0x43F0000000000000
  %37 = select i1 %36, float 0x3BF0000000000000, float 1.000000e+00
  %38 = fmul float %35, %37
  %39 = fmul float %38, %38
  %40 = fneg float %39
  %41 = tail call float @llvm.fma.f32(float %38, float %38, float %40)
  %42 = select i1 %36, float 0x37F0000000000000, float 1.000000e+00
  %43 = fsub float %39, %42
  %44 = fsub float %43, %39
  %45 = fsub float %43, %44
  %46 = fsub float %39, %45
  %47 = fadd float %42, %44
  %48 = fsub float %46, %47
  %49 = fadd float %41, %48
  %50 = fadd float %43, %49
  %51 = tail call float @llvm.sqrt.f32(float %50)
  %52 = fmul float %51, %51
  %53 = fneg float %52
  %54 = tail call float @llvm.fma.f32(float %51, float %51, float %53)
  %55 = fsub float %50, %43
  %56 = fsub float %49, %55
  %57 = fsub float %50, %52
  %58 = fsub float %50, %57
  %59 = fsub float %58, %52
  %60 = fadd float %56, %59
  %61 = fsub float %60, %54
  %62 = fadd float %57, %61
  %63 = fmul float %51, 2.000000e+00
  %64 = tail call float @llvm.amdgcn.rcp.f32(float %63)
  %65 = fmul float %64, %62
  %66 = fcmp oeq float %50, 0.000000e+00
  %67 = select i1 %66, float 0.000000e+00, float %65
  %68 = fadd float %51, %67
  %69 = fsub float %68, %51
  %70 = fsub float %67, %69
  %71 = fadd float %38, %68
  %72 = fsub float %71, %38
  %73 = fsub float %71, %72
  %74 = fsub float %38, %73
  %75 = fsub float %68, %72
  %76 = fadd float %75, %74
  %77 = fadd float %70, %76
  %78 = fadd float %71, %77
  %79 = fsub float %78, %71
  %80 = fsub float %77, %79
  %81 = select i1 %36, i32 64, i32 0
  %82 = tail call float @llvm.amdgcn.frexp.mant.f32(float %78)
  %83 = fcmp olt float %82, 0x3FE5555560000000
  %84 = sext i1 %83 to i32
  %85 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %78)
  %86 = add i32 %85, %84
  %87 = sub nsw i32 0, %86
  %88 = tail call float @llvm.amdgcn.ldexp.f32(float %78, i32 %87)
  %89 = tail call float @llvm.amdgcn.ldexp.f32(float %80, i32 %87)
  %90 = fadd float %88, -1.000000e+00
  %91 = fadd float %90, 1.000000e+00
  %92 = fsub float %88, %91
  %93 = fadd float %89, %92
  %94 = fadd float %90, %93
  %95 = fsub float %94, %90
  %96 = fsub float %93, %95
  %97 = fadd float %88, 1.000000e+00
  %98 = fadd float %97, -1.000000e+00
  %99 = fsub float %88, %98
  %100 = fadd float %89, %99
  %101 = fadd float %97, %100
  %102 = fsub float %101, %97
  %103 = fsub float %100, %102
  %104 = tail call float @llvm.amdgcn.rcp.f32(float %101)
  %105 = fmul float %94, %104
  %106 = fmul float %101, %105
  %107 = fneg float %106
  %108 = tail call float @llvm.fma.f32(float %105, float %101, float %107)
  %109 = tail call float @llvm.fma.f32(float %105, float %103, float %108)
  %110 = fadd float %106, %109
  %111 = fsub float %110, %106
  %112 = fsub float %109, %111
  %113 = fsub float %94, %110
  %114 = fsub float %94, %113
  %115 = fsub float %114, %110
  %116 = fadd float %96, %115
  %117 = fsub float %116, %112
  %118 = fadd float %113, %117
  %119 = fmul float %104, %118
  %120 = fmul float %101, %119
  %121 = fneg float %120
  %122 = tail call float @llvm.fma.f32(float %119, float %101, float %121)
  %123 = tail call float @llvm.fma.f32(float %119, float %103, float %122)
  %124 = fsub float %118, %113
  %125 = fsub float %117, %124
  %126 = fadd float %120, %123
  %127 = fsub float %126, %120
  %128 = fsub float %123, %127
  %129 = fsub float %118, %126
  %130 = fsub float %118, %129
  %131 = fsub float %130, %126
  %132 = fadd float %125, %131
  %133 = fsub float %132, %128
  %134 = fadd float %129, %133
  %135 = fmul float %104, %134
  %136 = fadd float %105, %119
  %137 = fsub float %136, %105
  %138 = fsub float %119, %137
  %139 = fadd float %138, %135
  %140 = fadd float %136, %139
  %141 = fmul float %140, %140
  %142 = tail call float @llvm.fmuladd.f32(float %141, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %143 = tail call float @llvm.fmuladd.f32(float %141, float %142, float 0x3FE5555B40000000)
  %144 = add nsw i32 %86, %81
  %145 = sitofp i32 %144 to float
  %146 = fmul float %145, 0x3FE62E4300000000
  %147 = fneg float %146
  %148 = tail call float @llvm.fma.f32(float %145, float 0x3FE62E4300000000, float %147)
  %149 = tail call float @llvm.fma.f32(float %145, float 0xBE205C6100000000, float %148)
  %150 = fsub float %140, %136
  %151 = fsub float %139, %150
  %152 = fadd float %146, %149
  %153 = fsub float %152, %146
  %154 = fsub float %149, %153
  %155 = tail call float @llvm.amdgcn.ldexp.f32(float %140, i32 1)
  %156 = tail call float @llvm.amdgcn.ldexp.f32(float %151, i32 1)
  %157 = fmul float %140, %141
  %158 = fmul float %157, %143
  %159 = fadd float %155, %158
  %160 = fsub float %159, %155
  %161 = fsub float %158, %160
  %162 = fadd float %156, %161
  %163 = fadd float %159, %162
  %164 = fsub float %163, %159
  %165 = fsub float %162, %164
  %166 = fadd float %152, %163
  %167 = fsub float %166, %152
  %168 = fsub float %166, %167
  %169 = fsub float %152, %168
  %170 = fsub float %163, %167
  %171 = fadd float %170, %169
  %172 = fadd float %154, %165
  %173 = fsub float %172, %154
  %174 = fsub float %172, %173
  %175 = fsub float %154, %174
  %176 = fsub float %165, %173
  %177 = fadd float %176, %175
  %178 = fadd float %172, %171
  %179 = fadd float %166, %178
  %180 = fsub float %179, %166
  %181 = fsub float %178, %180
  %182 = fadd float %177, %181
  %183 = fadd float %179, %182
  %184 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 512)
  %185 = select i1 %184, float %35, float %183
  %186 = fcmp olt float %35, 1.000000e+00
  %187 = select i1 %186, float 0x7FF8000000000000, float %185
  %188 = add nsw i32 %17, %6
  %189 = mul nsw i32 %25, %7
  %190 = add nsw i32 %188, %189
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds float, float addrspace(1)* %5, i64 %191
  store float %187, float addrspace(1)* %192, align 4, !tbaa !7
  br label %193

193:                                              ; preds = %29, %8
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
