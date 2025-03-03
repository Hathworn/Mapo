; ModuleID = '../data/hip_kernels/3007/160/main.cu'
source_filename = "../data/hip_kernels/3007/160/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11uplo_pow3o2iiiPKfiiPfii(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %203

30:                                               ; preds = %9
  %31 = icmp eq i32 %1, 132
  %32 = mul nsw i32 %18, %2
  %33 = mul nsw i32 %26, %2
  %34 = icmp sgt i32 %32, %33
  %35 = icmp sge i32 %32, %33
  %36 = select i1 %31, i1 %34, i1 %35
  br i1 %36, label %37, label %203

37:                                               ; preds = %30
  %38 = add nsw i32 %18, %4
  %39 = mul nsw i32 %26, %5
  %40 = add nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %3, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = tail call float @llvm.fabs.f32(float %43)
  %45 = tail call float @llvm.amdgcn.frexp.mant.f32(float %44)
  %46 = fcmp olt float %45, 0x3FE5555560000000
  %47 = zext i1 %46 to i32
  %48 = tail call float @llvm.amdgcn.ldexp.f32(float %45, i32 %47)
  %49 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %44)
  %50 = sub nsw i32 %49, %47
  %51 = fadd float %48, -1.000000e+00
  %52 = fadd float %48, 1.000000e+00
  %53 = fadd float %52, -1.000000e+00
  %54 = fsub float %48, %53
  %55 = tail call float @llvm.amdgcn.rcp.f32(float %52)
  %56 = fmul float %51, %55
  %57 = fmul float %52, %56
  %58 = fneg float %57
  %59 = tail call float @llvm.fma.f32(float %56, float %52, float %58)
  %60 = tail call float @llvm.fma.f32(float %56, float %54, float %59)
  %61 = fadd float %57, %60
  %62 = fsub float %61, %57
  %63 = fsub float %60, %62
  %64 = fsub float %51, %61
  %65 = fsub float %51, %64
  %66 = fsub float %65, %61
  %67 = fsub float %66, %63
  %68 = fadd float %64, %67
  %69 = fmul float %55, %68
  %70 = fadd float %56, %69
  %71 = fsub float %70, %56
  %72 = fsub float %69, %71
  %73 = fmul float %70, %70
  %74 = fneg float %73
  %75 = tail call float @llvm.fma.f32(float %70, float %70, float %74)
  %76 = fmul float %72, 2.000000e+00
  %77 = tail call float @llvm.fma.f32(float %70, float %76, float %75)
  %78 = fadd float %73, %77
  %79 = fsub float %78, %73
  %80 = fsub float %77, %79
  %81 = tail call float @llvm.fmuladd.f32(float %78, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %82 = tail call float @llvm.fmuladd.f32(float %78, float %81, float 0x3FD999BDE0000000)
  %83 = sitofp i32 %50 to float
  %84 = fmul float %83, 0x3FE62E4300000000
  %85 = fneg float %84
  %86 = tail call float @llvm.fma.f32(float %83, float 0x3FE62E4300000000, float %85)
  %87 = tail call float @llvm.fma.f32(float %83, float 0xBE205C6100000000, float %86)
  %88 = fadd float %84, %87
  %89 = fsub float %88, %84
  %90 = fsub float %87, %89
  %91 = tail call float @llvm.amdgcn.ldexp.f32(float %70, i32 1)
  %92 = fmul float %70, %78
  %93 = fneg float %92
  %94 = tail call float @llvm.fma.f32(float %78, float %70, float %93)
  %95 = tail call float @llvm.fma.f32(float %78, float %72, float %94)
  %96 = tail call float @llvm.fma.f32(float %80, float %70, float %95)
  %97 = fadd float %92, %96
  %98 = fsub float %97, %92
  %99 = fsub float %96, %98
  %100 = fmul float %78, %82
  %101 = fneg float %100
  %102 = tail call float @llvm.fma.f32(float %78, float %82, float %101)
  %103 = tail call float @llvm.fma.f32(float %80, float %82, float %102)
  %104 = fadd float %100, %103
  %105 = fsub float %104, %100
  %106 = fsub float %103, %105
  %107 = fadd float %104, 0x3FE5555540000000
  %108 = fadd float %107, 0xBFE5555540000000
  %109 = fsub float %104, %108
  %110 = fadd float %106, 0x3E2E720200000000
  %111 = fadd float %110, %109
  %112 = fadd float %107, %111
  %113 = fsub float %112, %107
  %114 = fsub float %111, %113
  %115 = fmul float %97, %112
  %116 = fneg float %115
  %117 = tail call float @llvm.fma.f32(float %97, float %112, float %116)
  %118 = tail call float @llvm.fma.f32(float %97, float %114, float %117)
  %119 = tail call float @llvm.fma.f32(float %99, float %112, float %118)
  %120 = tail call float @llvm.amdgcn.ldexp.f32(float %72, i32 1)
  %121 = fadd float %115, %119
  %122 = fsub float %121, %115
  %123 = fsub float %119, %122
  %124 = fadd float %91, %121
  %125 = fsub float %124, %91
  %126 = fsub float %121, %125
  %127 = fadd float %120, %123
  %128 = fadd float %127, %126
  %129 = fadd float %124, %128
  %130 = fsub float %129, %124
  %131 = fsub float %128, %130
  %132 = fadd float %88, %129
  %133 = fsub float %132, %88
  %134 = fsub float %132, %133
  %135 = fsub float %88, %134
  %136 = fsub float %129, %133
  %137 = fadd float %136, %135
  %138 = fadd float %90, %131
  %139 = fsub float %138, %90
  %140 = fsub float %138, %139
  %141 = fsub float %90, %140
  %142 = fsub float %131, %139
  %143 = fadd float %142, %141
  %144 = fadd float %138, %137
  %145 = fadd float %132, %144
  %146 = fsub float %145, %132
  %147 = fsub float %144, %146
  %148 = fadd float %143, %147
  %149 = fadd float %145, %148
  %150 = fsub float %149, %145
  %151 = fsub float %148, %150
  %152 = fmul float %149, 1.500000e+00
  %153 = fneg float %152
  %154 = tail call float @llvm.fma.f32(float %149, float 1.500000e+00, float %153)
  %155 = tail call float @llvm.fma.f32(float %151, float 1.500000e+00, float %154)
  %156 = fadd float %152, %155
  %157 = fsub float %156, %152
  %158 = fsub float %155, %157
  %159 = tail call float @llvm.fabs.f32(float %152) #3
  %160 = fcmp oeq float %159, 0x7FF0000000000000
  %161 = select i1 %160, float %152, float %156
  %162 = tail call float @llvm.fabs.f32(float %161) #3
  %163 = fcmp oeq float %162, 0x7FF0000000000000
  %164 = select i1 %163, float 0.000000e+00, float %158
  %165 = fcmp oeq float %161, 0x40562E4300000000
  %166 = select i1 %165, float 0x3EE0000000000000, float 0.000000e+00
  %167 = fsub float %161, %166
  %168 = fadd float %166, %164
  %169 = fmul float %167, 0x3FF7154760000000
  %170 = tail call float @llvm.rint.f32(float %169)
  %171 = fcmp ogt float %167, 0x40562E4300000000
  %172 = fcmp olt float %167, 0xC059D1DA00000000
  %173 = fneg float %169
  %174 = tail call float @llvm.fma.f32(float %167, float 0x3FF7154760000000, float %173)
  %175 = tail call float @llvm.fma.f32(float %167, float 0x3E54AE0BE0000000, float %174)
  %176 = fsub float %169, %170
  %177 = fadd float %175, %176
  %178 = tail call float @llvm.exp2.f32(float %177)
  %179 = fptosi float %170 to i32
  %180 = tail call float @llvm.amdgcn.ldexp.f32(float %178, i32 %179)
  %181 = select i1 %172, float 0.000000e+00, float %180
  %182 = select i1 %171, float 0x7FF0000000000000, float %181
  %183 = tail call float @llvm.fma.f32(float %182, float %168, float %182)
  %184 = tail call float @llvm.fabs.f32(float %182) #3
  %185 = fcmp oeq float %184, 0x7FF0000000000000
  %186 = select i1 %185, float %182, float %183
  %187 = fcmp uge float %43, 0.000000e+00
  %188 = tail call float @llvm.fabs.f32(float %186)
  %189 = select i1 %187, float %188, float 0x7FF8000000000000
  %190 = fcmp oeq float %44, 0x7FF0000000000000
  %191 = fcmp oeq float %43, 0.000000e+00
  %192 = select i1 %190, float 0x7FF0000000000000, float %189
  %193 = select i1 %191, float 0.000000e+00, float %192
  %194 = fcmp uno float %43, 0.000000e+00
  %195 = select i1 %194, float 0x7FF8000000000000, float %193
  %196 = fcmp oeq float %43, 1.000000e+00
  %197 = select i1 %196, float 1.000000e+00, float %195
  %198 = add nsw i32 %18, %7
  %199 = mul nsw i32 %26, %8
  %200 = add nsw i32 %198, %199
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %6, i64 %201
  store float %197, float addrspace(1)* %202, align 4, !tbaa !7
  br label %203

203:                                              ; preds = %9, %37, %30
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
