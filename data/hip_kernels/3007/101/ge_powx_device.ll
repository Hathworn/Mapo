; ModuleID = '../data/hip_kernels/3007/101/main.cu'
source_filename = "../data/hip_kernels/3007/101/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7ge_powxiiPKfiifPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float %5, float addrspace(1)* nocapture writeonly %6, i32 %7, i32 %8) local_unnamed_addr #0 {
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
  %28 = icmp slt i32 %26, %1
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %233

30:                                               ; preds = %9
  %31 = add nsw i32 %18, %3
  %32 = mul nsw i32 %26, %4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = tail call float @llvm.fabs.f32(float %36)
  %38 = tail call float @llvm.amdgcn.frexp.mant.f32(float %37)
  %39 = fcmp olt float %38, 0x3FE5555560000000
  %40 = zext i1 %39 to i32
  %41 = tail call float @llvm.amdgcn.ldexp.f32(float %38, i32 %40)
  %42 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f32(float %37)
  %43 = sub nsw i32 %42, %40
  %44 = fadd float %41, -1.000000e+00
  %45 = fadd float %41, 1.000000e+00
  %46 = fadd float %45, -1.000000e+00
  %47 = fsub float %41, %46
  %48 = tail call float @llvm.amdgcn.rcp.f32(float %45)
  %49 = fmul float %44, %48
  %50 = fmul float %45, %49
  %51 = fneg float %50
  %52 = tail call float @llvm.fma.f32(float %49, float %45, float %51)
  %53 = tail call float @llvm.fma.f32(float %49, float %47, float %52)
  %54 = fadd float %50, %53
  %55 = fsub float %54, %50
  %56 = fsub float %53, %55
  %57 = fsub float %44, %54
  %58 = fsub float %44, %57
  %59 = fsub float %58, %54
  %60 = fsub float %59, %56
  %61 = fadd float %57, %60
  %62 = fmul float %48, %61
  %63 = fadd float %49, %62
  %64 = fsub float %63, %49
  %65 = fsub float %62, %64
  %66 = fmul float %63, %63
  %67 = fneg float %66
  %68 = tail call float @llvm.fma.f32(float %63, float %63, float %67)
  %69 = fmul float %65, 2.000000e+00
  %70 = tail call float @llvm.fma.f32(float %63, float %69, float %68)
  %71 = fadd float %66, %70
  %72 = fsub float %71, %66
  %73 = fsub float %70, %72
  %74 = tail call float @llvm.fmuladd.f32(float %71, float 0x3FCED89C20000000, float 0x3FD23E9880000000)
  %75 = tail call float @llvm.fmuladd.f32(float %71, float %74, float 0x3FD999BDE0000000)
  %76 = sitofp i32 %43 to float
  %77 = fmul float %76, 0x3FE62E4300000000
  %78 = fneg float %77
  %79 = tail call float @llvm.fma.f32(float %76, float 0x3FE62E4300000000, float %78)
  %80 = tail call float @llvm.fma.f32(float %76, float 0xBE205C6100000000, float %79)
  %81 = fadd float %77, %80
  %82 = fsub float %81, %77
  %83 = fsub float %80, %82
  %84 = tail call float @llvm.amdgcn.ldexp.f32(float %63, i32 1)
  %85 = fmul float %63, %71
  %86 = fneg float %85
  %87 = tail call float @llvm.fma.f32(float %71, float %63, float %86)
  %88 = tail call float @llvm.fma.f32(float %71, float %65, float %87)
  %89 = tail call float @llvm.fma.f32(float %73, float %63, float %88)
  %90 = fadd float %85, %89
  %91 = fsub float %90, %85
  %92 = fsub float %89, %91
  %93 = fmul float %71, %75
  %94 = fneg float %93
  %95 = tail call float @llvm.fma.f32(float %71, float %75, float %94)
  %96 = tail call float @llvm.fma.f32(float %73, float %75, float %95)
  %97 = fadd float %93, %96
  %98 = fsub float %97, %93
  %99 = fsub float %96, %98
  %100 = fadd float %97, 0x3FE5555540000000
  %101 = fadd float %100, 0xBFE5555540000000
  %102 = fsub float %97, %101
  %103 = fadd float %99, 0x3E2E720200000000
  %104 = fadd float %103, %102
  %105 = fadd float %100, %104
  %106 = fsub float %105, %100
  %107 = fsub float %104, %106
  %108 = fmul float %90, %105
  %109 = fneg float %108
  %110 = tail call float @llvm.fma.f32(float %90, float %105, float %109)
  %111 = tail call float @llvm.fma.f32(float %90, float %107, float %110)
  %112 = tail call float @llvm.fma.f32(float %92, float %105, float %111)
  %113 = tail call float @llvm.amdgcn.ldexp.f32(float %65, i32 1)
  %114 = fadd float %108, %112
  %115 = fsub float %114, %108
  %116 = fsub float %112, %115
  %117 = fadd float %84, %114
  %118 = fsub float %117, %84
  %119 = fsub float %114, %118
  %120 = fadd float %113, %116
  %121 = fadd float %120, %119
  %122 = fadd float %117, %121
  %123 = fsub float %122, %117
  %124 = fsub float %121, %123
  %125 = fadd float %81, %122
  %126 = fsub float %125, %81
  %127 = fsub float %125, %126
  %128 = fsub float %81, %127
  %129 = fsub float %122, %126
  %130 = fadd float %129, %128
  %131 = fadd float %83, %124
  %132 = fsub float %131, %83
  %133 = fsub float %131, %132
  %134 = fsub float %83, %133
  %135 = fsub float %124, %132
  %136 = fadd float %135, %134
  %137 = fadd float %131, %130
  %138 = fadd float %125, %137
  %139 = fsub float %138, %125
  %140 = fsub float %137, %139
  %141 = fadd float %136, %140
  %142 = fadd float %138, %141
  %143 = fsub float %142, %138
  %144 = fsub float %141, %143
  %145 = fmul float %142, %5
  %146 = fneg float %145
  %147 = tail call float @llvm.fma.f32(float %5, float %142, float %146)
  %148 = tail call float @llvm.fma.f32(float %5, float %144, float %147)
  %149 = fadd float %145, %148
  %150 = fsub float %149, %145
  %151 = fsub float %148, %150
  %152 = tail call float @llvm.fabs.f32(float %145) #3
  %153 = fcmp oeq float %152, 0x7FF0000000000000
  %154 = select i1 %153, float %145, float %149
  %155 = tail call float @llvm.fabs.f32(float %154) #3
  %156 = fcmp oeq float %155, 0x7FF0000000000000
  %157 = select i1 %156, float 0.000000e+00, float %151
  %158 = fcmp oeq float %154, 0x40562E4300000000
  %159 = select i1 %158, float 0x3EE0000000000000, float 0.000000e+00
  %160 = fsub float %154, %159
  %161 = fadd float %159, %157
  %162 = fmul float %160, 0x3FF7154760000000
  %163 = tail call float @llvm.rint.f32(float %162)
  %164 = fcmp ogt float %160, 0x40562E4300000000
  %165 = fcmp olt float %160, 0xC059D1DA00000000
  %166 = fneg float %162
  %167 = tail call float @llvm.fma.f32(float %160, float 0x3FF7154760000000, float %166)
  %168 = tail call float @llvm.fma.f32(float %160, float 0x3E54AE0BE0000000, float %167)
  %169 = fsub float %162, %163
  %170 = fadd float %168, %169
  %171 = tail call float @llvm.exp2.f32(float %170)
  %172 = fptosi float %163 to i32
  %173 = tail call float @llvm.amdgcn.ldexp.f32(float %171, i32 %172)
  %174 = select i1 %165, float 0.000000e+00, float %173
  %175 = select i1 %164, float 0x7FF0000000000000, float %174
  %176 = tail call float @llvm.fma.f32(float %175, float %161, float %175)
  %177 = tail call float @llvm.fabs.f32(float %175) #3
  %178 = fcmp oeq float %177, 0x7FF0000000000000
  %179 = select i1 %178, float %175, float %176
  %180 = tail call float @llvm.fabs.f32(float %5)
  %181 = tail call float @llvm.trunc.f32(float %180)
  %182 = fcmp oeq float %180, %181
  %183 = zext i1 %182 to i32
  %184 = fmul float %181, 5.000000e-01
  %185 = tail call float @llvm.amdgcn.fract.f32(float %184)
  %186 = tail call i1 @llvm.amdgcn.class.f32(float %184, i32 516)
  %187 = select i1 %186, float 0.000000e+00, float %185
  %188 = fcmp oeq float %187, 0.000000e+00
  %189 = and i1 %182, %188
  %190 = zext i1 %189 to i32
  %191 = add nuw nsw i32 %190, %183
  %192 = icmp eq i32 %191, 1
  %193 = fcmp olt float %36, 0.000000e+00
  %194 = and i1 %192, %193
  %195 = select i1 %194, float -0.000000e+00, float 0.000000e+00
  %196 = tail call float @llvm.copysign.f32(float %179, float %195)
  %197 = fcmp uge float %36, 0.000000e+00
  %198 = icmp ne i32 %191, 0
  %199 = select i1 %197, i1 true, i1 %198
  %200 = select i1 %199, float %196, float 0x7FF8000000000000
  %201 = fcmp oeq float %180, 0x7FF0000000000000
  br i1 %201, label %202, label %211

202:                                              ; preds = %30
  %203 = fcmp oeq float %37, 1.000000e+00
  %204 = fadd float %37, -1.000000e+00
  %205 = bitcast float %5 to i32
  %206 = bitcast float %204 to i32
  %207 = xor i32 %206, %205
  %208 = icmp sgt i32 %207, -1
  %209 = select i1 %208, float 0x7FF0000000000000, float 0.000000e+00
  %210 = select i1 %203, float %37, float %209
  br label %211

211:                                              ; preds = %30, %202
  %212 = phi float [ %200, %30 ], [ %210, %202 ]
  %213 = fcmp oeq float %37, 0x7FF0000000000000
  %214 = fcmp oeq float %36, 0.000000e+00
  %215 = or i1 %214, %213
  %216 = fcmp olt float %5, 0.000000e+00
  %217 = xor i1 %216, %214
  %218 = select i1 %217, float 0.000000e+00, float 0x7FF0000000000000
  %219 = select i1 %192, float %36, float 0.000000e+00
  %220 = tail call float @llvm.copysign.f32(float %218, float %219)
  %221 = select i1 %215, float %220, float %212
  %222 = fcmp uno float %36, %5
  %223 = select i1 %222, float 0x7FF8000000000000, float %221
  %224 = fcmp oeq float %36, 1.000000e+00
  %225 = fcmp oeq float %5, 0.000000e+00
  %226 = or i1 %225, %224
  %227 = select i1 %226, float 1.000000e+00, float %223
  %228 = add nsw i32 %18, %7
  %229 = mul nsw i32 %26, %8
  %230 = add nsw i32 %228, %229
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %6, i64 %231
  store float %227, float addrspace(1)* %232, align 4, !tbaa !7
  br label %233

233:                                              ; preds = %211, %9
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.fract.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #1

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
