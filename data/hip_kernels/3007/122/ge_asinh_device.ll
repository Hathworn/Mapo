; ModuleID = '../data/hip_kernels/3007/122/main.cu'
source_filename = "../data/hip_kernels/3007/122/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8ge_asinhiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  br i1 %28, label %29, label %195

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp oge float %36, 0x43F0000000000000
  %38 = select i1 %37, float 0x3BF0000000000000, float 1.000000e+00
  %39 = fmul float %36, %38
  %40 = fmul float %39, %39
  %41 = fneg float %40
  %42 = tail call float @llvm.fma.f32(float %39, float %39, float %41)
  %43 = select i1 %37, float 0x37F0000000000000, float 1.000000e+00
  %44 = fadd float %43, %40
  %45 = fsub float %44, %40
  %46 = fsub float %44, %45
  %47 = fsub float %40, %46
  %48 = fsub float %43, %45
  %49 = fadd float %48, %47
  %50 = fadd float %42, %49
  %51 = fadd float %44, %50
  %52 = tail call float @llvm.sqrt.f32(float %51)
  %53 = fmul float %52, %52
  %54 = fneg float %53
  %55 = tail call float @llvm.fma.f32(float %52, float %52, float %54)
  %56 = fsub float %51, %44
  %57 = fsub float %50, %56
  %58 = fsub float %51, %53
  %59 = fsub float %51, %58
  %60 = fsub float %59, %53
  %61 = fadd float %57, %60
  %62 = fsub float %61, %55
  %63 = fadd float %58, %62
  %64 = fmul float %52, 2.000000e+00
  %65 = tail call float @llvm.amdgcn.rcp.f32(float %64)
  %66 = fmul float %65, %63
  %67 = fcmp oeq float %51, 0.000000e+00
  %68 = select i1 %67, float 0.000000e+00, float %66
  %69 = fadd float %52, %68
  %70 = fsub float %69, %52
  %71 = fsub float %68, %70
  %72 = fadd float %39, %69
  %73 = fsub float %72, %39
  %74 = fsub float %72, %73
  %75 = fsub float %39, %74
  %76 = fsub float %69, %73
  %77 = fadd float %76, %75
  %78 = fadd float %71, %77
  %79 = fadd float %72, %78
  %80 = fsub float %79, %72
  %81 = fsub float %78, %80
  %82 = select i1 %37, i32 64, i32 0
  %83 = tail call float @llvm.amdgcn.frexp.mant.f32(float %79)
  %84 = fcmp olt float %83, 0x3FE5555560000000
  %85 = sext i1 %84 to i32
  %86 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %79)
  %87 = add i32 %86, %85
  %88 = sub nsw i32 0, %87
  %89 = tail call float @llvm.amdgcn.ldexp.f32(float %79, i32 %88)
  %90 = tail call float @llvm.amdgcn.ldexp.f32(float %81, i32 %88)
  %91 = fadd float %89, -1.000000e+00
  %92 = fadd float %91, 1.000000e+00
  %93 = fsub float %89, %92
  %94 = fadd float %90, %93
  %95 = fadd float %91, %94
  %96 = fsub float %95, %91
  %97 = fsub float %94, %96
  %98 = fadd float %89, 1.000000e+00
  %99 = fadd float %98, -1.000000e+00
  %100 = fsub float %89, %99
  %101 = fadd float %90, %100
  %102 = fadd float %98, %101
  %103 = fsub float %102, %98
  %104 = fsub float %101, %103
  %105 = tail call float @llvm.amdgcn.rcp.f32(float %102)
  %106 = fmul float %95, %105
  %107 = fmul float %102, %106
  %108 = fneg float %107
  %109 = tail call float @llvm.fma.f32(float %106, float %102, float %108)
  %110 = tail call float @llvm.fma.f32(float %106, float %104, float %109)
  %111 = fadd float %107, %110
  %112 = fsub float %111, %107
  %113 = fsub float %110, %112
  %114 = fsub float %95, %111
  %115 = fsub float %95, %114
  %116 = fsub float %115, %111
  %117 = fadd float %97, %116
  %118 = fsub float %117, %113
  %119 = fadd float %114, %118
  %120 = fmul float %105, %119
  %121 = fmul float %102, %120
  %122 = fneg float %121
  %123 = tail call float @llvm.fma.f32(float %120, float %102, float %122)
  %124 = tail call float @llvm.fma.f32(float %120, float %104, float %123)
  %125 = fsub float %119, %114
  %126 = fsub float %118, %125
  %127 = fadd float %121, %124
  %128 = fsub float %127, %121
  %129 = fsub float %124, %128
  %130 = fsub float %119, %127
  %131 = fsub float %119, %130
  %132 = fsub float %131, %127
  %133 = fadd float %126, %132
  %134 = fsub float %133, %129
  %135 = fadd float %130, %134
  %136 = fmul float %105, %135
  %137 = fadd float %106, %120
  %138 = fsub float %137, %106
  %139 = fsub float %120, %138
  %140 = fadd float %139, %136
  %141 = fadd float %137, %140
  %142 = fmul float %141, %141
  %143 = tail call float @llvm.fmuladd.f32(float %142, float 0x3FD36DB580000000, float 0x3FD992B460000000)
  %144 = tail call float @llvm.fmuladd.f32(float %142, float %143, float 0x3FE5555B40000000)
  %145 = add nsw i32 %87, %82
  %146 = sitofp i32 %145 to float
  %147 = fmul float %146, 0x3FE62E4300000000
  %148 = fneg float %147
  %149 = tail call float @llvm.fma.f32(float %146, float 0x3FE62E4300000000, float %148)
  %150 = tail call float @llvm.fma.f32(float %146, float 0xBE205C6100000000, float %149)
  %151 = fsub float %141, %137
  %152 = fsub float %140, %151
  %153 = fadd float %147, %150
  %154 = fsub float %153, %147
  %155 = fsub float %150, %154
  %156 = tail call float @llvm.amdgcn.ldexp.f32(float %141, i32 1)
  %157 = tail call float @llvm.amdgcn.ldexp.f32(float %152, i32 1)
  %158 = fmul float %141, %142
  %159 = fmul float %158, %144
  %160 = fadd float %156, %159
  %161 = fsub float %160, %156
  %162 = fsub float %159, %161
  %163 = fadd float %157, %162
  %164 = fadd float %160, %163
  %165 = fsub float %164, %160
  %166 = fsub float %163, %165
  %167 = fadd float %153, %164
  %168 = fsub float %167, %153
  %169 = fsub float %167, %168
  %170 = fsub float %153, %169
  %171 = fsub float %164, %168
  %172 = fadd float %171, %170
  %173 = fadd float %155, %166
  %174 = fsub float %173, %155
  %175 = fsub float %173, %174
  %176 = fsub float %155, %175
  %177 = fsub float %166, %174
  %178 = fadd float %177, %176
  %179 = fadd float %173, %172
  %180 = fadd float %167, %179
  %181 = fsub float %180, %167
  %182 = fsub float %179, %181
  %183 = fadd float %178, %182
  %184 = fadd float %180, %183
  %185 = fcmp olt float %36, 0x3F30000000000000
  %186 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 512)
  %187 = select i1 %186, i1 true, i1 %185
  %188 = select i1 %187, float %36, float %184
  %189 = tail call float @llvm.copysign.f32(float %188, float %35)
  %190 = add nsw i32 %17, %6
  %191 = mul nsw i32 %25, %7
  %192 = add nsw i32 %190, %191
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %5, i64 %193
  store float %189, float addrspace(1)* %194, align 4, !tbaa !7
  br label %195

195:                                              ; preds = %29, %8
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
