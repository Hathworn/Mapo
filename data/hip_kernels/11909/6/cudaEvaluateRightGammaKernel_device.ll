; ModuleID = '../data/hip_kernels/11909/6/main.cu'
source_filename = "../data/hip_kernels/11909/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL28cudaEvaluateRightGammaKernelPiPdS0_S0_S0_i = comdat any

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL28cudaEvaluateRightGammaKernelPiPdS0_S0_S0_i(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4, i32 %5) local_unnamed_addr #0 comdat {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %4, i64 %16
  store double 0.000000e+00, double addrspace(1)* %17, align 8, !tbaa !7
  %18 = icmp slt i32 %15, %5
  br i1 %18, label %19, label %253

19:                                               ; preds = %6
  %20 = shl nsw i32 %15, 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double, double addrspace(1)* %1, i64 %21
  %23 = getelementptr inbounds double, double addrspace(1)* %2, i64 %21
  %24 = load double, double addrspace(1)* %22, align 8, !tbaa !7
  %25 = load double, double addrspace(1)* %23, align 8, !tbaa !7
  %26 = fmul contract double %24, %25
  %27 = load double, double addrspace(1)* %3, align 8, !tbaa !7
  %28 = fmul contract double %26, %27
  %29 = fadd contract double %28, 0.000000e+00
  %30 = getelementptr inbounds double, double addrspace(1)* %22, i64 1
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %32 = getelementptr inbounds double, double addrspace(1)* %23, i64 1
  %33 = load double, double addrspace(1)* %32, align 8, !tbaa !7
  %34 = fmul contract double %31, %33
  %35 = getelementptr inbounds double, double addrspace(1)* %3, i64 1
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7
  %37 = fmul contract double %34, %36
  %38 = fadd contract double %29, %37
  %39 = getelementptr inbounds double, double addrspace(1)* %22, i64 2
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7
  %41 = getelementptr inbounds double, double addrspace(1)* %23, i64 2
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = fmul contract double %40, %42
  %44 = getelementptr inbounds double, double addrspace(1)* %3, i64 2
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fmul contract double %43, %45
  %47 = fadd contract double %38, %46
  %48 = getelementptr inbounds double, double addrspace(1)* %22, i64 3
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = getelementptr inbounds double, double addrspace(1)* %23, i64 3
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = fmul contract double %49, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %3, i64 3
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7
  %55 = fmul contract double %52, %54
  %56 = fadd contract double %47, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %22, i64 4
  %58 = getelementptr inbounds double, double addrspace(1)* %23, i64 4
  %59 = getelementptr inbounds double, double addrspace(1)* %3, i64 4
  %60 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %61 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %62 = fmul contract double %60, %61
  %63 = load double, double addrspace(1)* %59, align 8, !tbaa !7
  %64 = fmul contract double %62, %63
  %65 = fadd contract double %56, %64
  %66 = getelementptr inbounds double, double addrspace(1)* %57, i64 1
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7
  %68 = getelementptr inbounds double, double addrspace(1)* %58, i64 1
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = fmul contract double %67, %69
  %71 = getelementptr inbounds double, double addrspace(1)* %3, i64 5
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = fmul contract double %70, %72
  %74 = fadd contract double %65, %73
  %75 = getelementptr inbounds double, double addrspace(1)* %57, i64 2
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = getelementptr inbounds double, double addrspace(1)* %58, i64 2
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7
  %79 = fmul contract double %76, %78
  %80 = getelementptr inbounds double, double addrspace(1)* %3, i64 6
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = fmul contract double %79, %81
  %83 = fadd contract double %74, %82
  %84 = getelementptr inbounds double, double addrspace(1)* %57, i64 3
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = getelementptr inbounds double, double addrspace(1)* %58, i64 3
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7
  %88 = fmul contract double %85, %87
  %89 = getelementptr inbounds double, double addrspace(1)* %3, i64 7
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !7
  %91 = fmul contract double %88, %90
  %92 = fadd contract double %83, %91
  %93 = getelementptr inbounds double, double addrspace(1)* %57, i64 4
  %94 = getelementptr inbounds double, double addrspace(1)* %58, i64 4
  %95 = getelementptr inbounds double, double addrspace(1)* %3, i64 8
  %96 = load double, double addrspace(1)* %93, align 8, !tbaa !7
  %97 = load double, double addrspace(1)* %94, align 8, !tbaa !7
  %98 = fmul contract double %96, %97
  %99 = load double, double addrspace(1)* %95, align 8, !tbaa !7
  %100 = fmul contract double %98, %99
  %101 = fadd contract double %92, %100
  %102 = getelementptr inbounds double, double addrspace(1)* %93, i64 1
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = getelementptr inbounds double, double addrspace(1)* %94, i64 1
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = fmul contract double %103, %105
  %107 = getelementptr inbounds double, double addrspace(1)* %3, i64 9
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !7
  %109 = fmul contract double %106, %108
  %110 = fadd contract double %101, %109
  %111 = getelementptr inbounds double, double addrspace(1)* %93, i64 2
  %112 = load double, double addrspace(1)* %111, align 8, !tbaa !7
  %113 = getelementptr inbounds double, double addrspace(1)* %94, i64 2
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = fmul contract double %112, %114
  %116 = getelementptr inbounds double, double addrspace(1)* %3, i64 10
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7
  %118 = fmul contract double %115, %117
  %119 = fadd contract double %110, %118
  %120 = getelementptr inbounds double, double addrspace(1)* %93, i64 3
  %121 = load double, double addrspace(1)* %120, align 8, !tbaa !7
  %122 = getelementptr inbounds double, double addrspace(1)* %94, i64 3
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7
  %124 = fmul contract double %121, %123
  %125 = getelementptr inbounds double, double addrspace(1)* %3, i64 11
  %126 = load double, double addrspace(1)* %125, align 8, !tbaa !7
  %127 = fmul contract double %124, %126
  %128 = fadd contract double %119, %127
  %129 = getelementptr inbounds double, double addrspace(1)* %93, i64 4
  %130 = getelementptr inbounds double, double addrspace(1)* %94, i64 4
  %131 = getelementptr inbounds double, double addrspace(1)* %3, i64 12
  %132 = load double, double addrspace(1)* %129, align 8, !tbaa !7
  %133 = load double, double addrspace(1)* %130, align 8, !tbaa !7
  %134 = fmul contract double %132, %133
  %135 = load double, double addrspace(1)* %131, align 8, !tbaa !7
  %136 = fmul contract double %134, %135
  %137 = fadd contract double %128, %136
  %138 = getelementptr inbounds double, double addrspace(1)* %129, i64 1
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !7
  %140 = getelementptr inbounds double, double addrspace(1)* %130, i64 1
  %141 = load double, double addrspace(1)* %140, align 8, !tbaa !7
  %142 = fmul contract double %139, %141
  %143 = getelementptr inbounds double, double addrspace(1)* %3, i64 13
  %144 = load double, double addrspace(1)* %143, align 8, !tbaa !7
  %145 = fmul contract double %142, %144
  %146 = fadd contract double %137, %145
  %147 = getelementptr inbounds double, double addrspace(1)* %129, i64 2
  %148 = load double, double addrspace(1)* %147, align 8, !tbaa !7
  %149 = getelementptr inbounds double, double addrspace(1)* %130, i64 2
  %150 = load double, double addrspace(1)* %149, align 8, !tbaa !7
  %151 = fmul contract double %148, %150
  %152 = getelementptr inbounds double, double addrspace(1)* %3, i64 14
  %153 = load double, double addrspace(1)* %152, align 8, !tbaa !7
  %154 = fmul contract double %151, %153
  %155 = fadd contract double %146, %154
  %156 = getelementptr inbounds double, double addrspace(1)* %129, i64 3
  %157 = load double, double addrspace(1)* %156, align 8, !tbaa !7
  %158 = getelementptr inbounds double, double addrspace(1)* %130, i64 3
  %159 = load double, double addrspace(1)* %158, align 8, !tbaa !7
  %160 = fmul contract double %157, %159
  %161 = getelementptr inbounds double, double addrspace(1)* %3, i64 15
  %162 = load double, double addrspace(1)* %161, align 8, !tbaa !7
  %163 = fmul contract double %160, %162
  %164 = fadd contract double %155, %163
  %165 = tail call double @llvm.fabs.f64(double %164)
  %166 = fmul contract double %165, 2.500000e-01
  %167 = tail call double @llvm.amdgcn.frexp.mant.f64(double %166)
  %168 = fcmp olt double %167, 0x3FE5555555555555
  %169 = zext i1 %168 to i32
  %170 = tail call double @llvm.amdgcn.ldexp.f64(double %167, i32 %169)
  %171 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %166)
  %172 = sub nsw i32 %171, %169
  %173 = fadd double %170, -1.000000e+00
  %174 = fadd double %170, 1.000000e+00
  %175 = fadd double %174, -1.000000e+00
  %176 = fsub double %170, %175
  %177 = tail call double @llvm.amdgcn.rcp.f64(double %174)
  %178 = fneg double %174
  %179 = tail call double @llvm.fma.f64(double %178, double %177, double 1.000000e+00)
  %180 = tail call double @llvm.fma.f64(double %179, double %177, double %177)
  %181 = tail call double @llvm.fma.f64(double %178, double %180, double 1.000000e+00)
  %182 = tail call double @llvm.fma.f64(double %181, double %180, double %180)
  %183 = fmul double %173, %182
  %184 = fmul double %174, %183
  %185 = fneg double %184
  %186 = tail call double @llvm.fma.f64(double %183, double %174, double %185)
  %187 = tail call double @llvm.fma.f64(double %183, double %176, double %186)
  %188 = fadd double %184, %187
  %189 = fsub double %188, %184
  %190 = fsub double %187, %189
  %191 = fsub double %173, %188
  %192 = fsub double %173, %191
  %193 = fsub double %192, %188
  %194 = fsub double %193, %190
  %195 = fadd double %191, %194
  %196 = fmul double %182, %195
  %197 = fadd double %183, %196
  %198 = fsub double %197, %183
  %199 = fsub double %196, %198
  %200 = fmul double %197, %197
  %201 = tail call double @llvm.fma.f64(double %200, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %202 = tail call double @llvm.fma.f64(double %200, double %201, double 0x3FC7474DD7F4DF2E)
  %203 = tail call double @llvm.fma.f64(double %200, double %202, double 0x3FCC71C016291751)
  %204 = tail call double @llvm.fma.f64(double %200, double %203, double 0x3FD249249B27ACF1)
  %205 = tail call double @llvm.fma.f64(double %200, double %204, double 0x3FD99999998EF7B6)
  %206 = tail call double @llvm.fma.f64(double %200, double %205, double 0x3FE5555555555780)
  %207 = tail call double @llvm.amdgcn.ldexp.f64(double %197, i32 1)
  %208 = tail call double @llvm.amdgcn.ldexp.f64(double %199, i32 1)
  %209 = fmul double %197, %200
  %210 = fmul double %209, %206
  %211 = fadd double %207, %210
  %212 = fsub double %211, %207
  %213 = fsub double %210, %212
  %214 = fadd double %208, %213
  %215 = fadd double %211, %214
  %216 = fsub double %215, %211
  %217 = fsub double %214, %216
  %218 = sitofp i32 %172 to double
  %219 = fmul double %218, 0x3FE62E42FEFA39EF
  %220 = fneg double %219
  %221 = tail call double @llvm.fma.f64(double %218, double 0x3FE62E42FEFA39EF, double %220)
  %222 = tail call double @llvm.fma.f64(double %218, double 0x3C7ABC9E3B39803F, double %221)
  %223 = fadd double %219, %222
  %224 = fsub double %223, %219
  %225 = fsub double %222, %224
  %226 = fadd double %223, %215
  %227 = fsub double %226, %223
  %228 = fsub double %226, %227
  %229 = fsub double %223, %228
  %230 = fsub double %215, %227
  %231 = fadd double %230, %229
  %232 = fadd double %225, %217
  %233 = fsub double %232, %225
  %234 = fsub double %232, %233
  %235 = fsub double %225, %234
  %236 = fsub double %217, %233
  %237 = fadd double %236, %235
  %238 = fadd double %232, %231
  %239 = fadd double %226, %238
  %240 = fsub double %239, %226
  %241 = fsub double %238, %240
  %242 = fadd double %237, %241
  %243 = fadd double %239, %242
  %244 = fcmp oeq double %166, 0x7FF0000000000000
  %245 = select i1 %244, double %166, double %243
  %246 = fcmp oeq double %166, 0.000000e+00
  %247 = select i1 %246, double 0xFFF0000000000000, double %245
  %248 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %249 = load i32, i32 addrspace(1)* %248, align 4, !tbaa !11, !amdgpu.noclobber !5
  %250 = sitofp i32 %249 to double
  %251 = fmul contract double %247, %250
  %252 = fadd contract double %251, 0.000000e+00
  store double %252, double addrspace(1)* %17, align 8, !tbaa !7
  br label %253

253:                                              ; preds = %6, %19
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
