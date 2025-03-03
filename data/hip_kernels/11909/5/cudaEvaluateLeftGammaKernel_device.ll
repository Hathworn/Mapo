; ModuleID = '../data/hip_kernels/11909/5/main.cu'
source_filename = "../data/hip_kernels/11909/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL27cudaEvaluateLeftGammaKernelPiPdS0_PhS0_S0_i = comdat any

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define amdgpu_kernel void @_ZL27cudaEvaluateLeftGammaKernelPiPdS0_PhS0_S0_i(i32 addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, i8 addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5, i32 %6) local_unnamed_addr #0 comdat {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %6
  %18 = sext i32 %16 to i64
  br i1 %17, label %19, label %232

19:                                               ; preds = %7
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %3, i64 %18
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !5
  %22 = zext i8 %21 to i64
  %23 = shl nuw nsw i64 %22, 2
  %24 = getelementptr inbounds double, double addrspace(1)* %2, i64 %23
  %25 = shl nsw i32 %16, 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %1, i64 %26
  %28 = load double, double addrspace(1)* %24, align 8, !tbaa !10, !amdgpu.noclobber !5
  %29 = getelementptr inbounds double, double addrspace(1)* %24, i64 1
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !10, !amdgpu.noclobber !5
  %31 = getelementptr inbounds double, double addrspace(1)* %24, i64 2
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !10, !amdgpu.noclobber !5
  %33 = getelementptr inbounds double, double addrspace(1)* %24, i64 3
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !10, !amdgpu.noclobber !5
  %35 = load double, double addrspace(1)* %27, align 8, !tbaa !10
  %36 = fmul contract double %28, %35
  %37 = load double, double addrspace(1)* %4, align 8, !tbaa !10
  %38 = fmul contract double %36, %37
  %39 = fadd contract double %38, 0.000000e+00
  %40 = getelementptr inbounds double, double addrspace(1)* %27, i64 1
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !10
  %42 = fmul contract double %30, %41
  %43 = getelementptr inbounds double, double addrspace(1)* %4, i64 1
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !10
  %45 = fmul contract double %42, %44
  %46 = fadd contract double %39, %45
  %47 = getelementptr inbounds double, double addrspace(1)* %27, i64 2
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !10
  %49 = fmul contract double %32, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %4, i64 2
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !10
  %52 = fmul contract double %49, %51
  %53 = fadd contract double %46, %52
  %54 = getelementptr inbounds double, double addrspace(1)* %27, i64 3
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !10
  %56 = fmul contract double %34, %55
  %57 = getelementptr inbounds double, double addrspace(1)* %4, i64 3
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !10
  %59 = fmul contract double %56, %58
  %60 = fadd contract double %53, %59
  %61 = getelementptr inbounds double, double addrspace(1)* %27, i64 4
  %62 = getelementptr inbounds double, double addrspace(1)* %4, i64 4
  %63 = load double, double addrspace(1)* %61, align 8, !tbaa !10
  %64 = fmul contract double %28, %63
  %65 = load double, double addrspace(1)* %62, align 8, !tbaa !10
  %66 = fmul contract double %64, %65
  %67 = fadd contract double %60, %66
  %68 = getelementptr inbounds double, double addrspace(1)* %61, i64 1
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !10
  %70 = fmul contract double %30, %69
  %71 = getelementptr inbounds double, double addrspace(1)* %4, i64 5
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !10
  %73 = fmul contract double %70, %72
  %74 = fadd contract double %67, %73
  %75 = getelementptr inbounds double, double addrspace(1)* %61, i64 2
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !10
  %77 = fmul contract double %32, %76
  %78 = getelementptr inbounds double, double addrspace(1)* %4, i64 6
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !10
  %80 = fmul contract double %77, %79
  %81 = fadd contract double %74, %80
  %82 = getelementptr inbounds double, double addrspace(1)* %61, i64 3
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !10
  %84 = fmul contract double %34, %83
  %85 = getelementptr inbounds double, double addrspace(1)* %4, i64 7
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !10
  %87 = fmul contract double %84, %86
  %88 = fadd contract double %81, %87
  %89 = getelementptr inbounds double, double addrspace(1)* %61, i64 4
  %90 = getelementptr inbounds double, double addrspace(1)* %4, i64 8
  %91 = load double, double addrspace(1)* %89, align 8, !tbaa !10
  %92 = fmul contract double %28, %91
  %93 = load double, double addrspace(1)* %90, align 8, !tbaa !10
  %94 = fmul contract double %92, %93
  %95 = fadd contract double %88, %94
  %96 = getelementptr inbounds double, double addrspace(1)* %89, i64 1
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !10
  %98 = fmul contract double %30, %97
  %99 = getelementptr inbounds double, double addrspace(1)* %4, i64 9
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !10
  %101 = fmul contract double %98, %100
  %102 = fadd contract double %95, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %89, i64 2
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !10
  %105 = fmul contract double %32, %104
  %106 = getelementptr inbounds double, double addrspace(1)* %4, i64 10
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !10
  %108 = fmul contract double %105, %107
  %109 = fadd contract double %102, %108
  %110 = getelementptr inbounds double, double addrspace(1)* %89, i64 3
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !10
  %112 = fmul contract double %34, %111
  %113 = getelementptr inbounds double, double addrspace(1)* %4, i64 11
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !10
  %115 = fmul contract double %112, %114
  %116 = fadd contract double %109, %115
  %117 = getelementptr inbounds double, double addrspace(1)* %89, i64 4
  %118 = getelementptr inbounds double, double addrspace(1)* %4, i64 12
  %119 = load double, double addrspace(1)* %117, align 8, !tbaa !10
  %120 = fmul contract double %28, %119
  %121 = load double, double addrspace(1)* %118, align 8, !tbaa !10
  %122 = fmul contract double %120, %121
  %123 = fadd contract double %116, %122
  %124 = getelementptr inbounds double, double addrspace(1)* %117, i64 1
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !10
  %126 = fmul contract double %30, %125
  %127 = getelementptr inbounds double, double addrspace(1)* %4, i64 13
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !10
  %129 = fmul contract double %126, %128
  %130 = fadd contract double %123, %129
  %131 = getelementptr inbounds double, double addrspace(1)* %117, i64 2
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !10
  %133 = fmul contract double %32, %132
  %134 = getelementptr inbounds double, double addrspace(1)* %4, i64 14
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !10
  %136 = fmul contract double %133, %135
  %137 = fadd contract double %130, %136
  %138 = getelementptr inbounds double, double addrspace(1)* %117, i64 3
  %139 = load double, double addrspace(1)* %138, align 8, !tbaa !10
  %140 = fmul contract double %34, %139
  %141 = getelementptr inbounds double, double addrspace(1)* %4, i64 15
  %142 = load double, double addrspace(1)* %141, align 8, !tbaa !10
  %143 = fmul contract double %140, %142
  %144 = fadd contract double %137, %143
  %145 = tail call double @llvm.fabs.f64(double %144)
  %146 = fmul contract double %145, 2.500000e-01
  %147 = tail call double @llvm.amdgcn.frexp.mant.f64(double %146)
  %148 = fcmp olt double %147, 0x3FE5555555555555
  %149 = zext i1 %148 to i32
  %150 = tail call double @llvm.amdgcn.ldexp.f64(double %147, i32 %149)
  %151 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %146)
  %152 = sub nsw i32 %151, %149
  %153 = fadd double %150, -1.000000e+00
  %154 = fadd double %150, 1.000000e+00
  %155 = fadd double %154, -1.000000e+00
  %156 = fsub double %150, %155
  %157 = tail call double @llvm.amdgcn.rcp.f64(double %154)
  %158 = fneg double %154
  %159 = tail call double @llvm.fma.f64(double %158, double %157, double 1.000000e+00)
  %160 = tail call double @llvm.fma.f64(double %159, double %157, double %157)
  %161 = tail call double @llvm.fma.f64(double %158, double %160, double 1.000000e+00)
  %162 = tail call double @llvm.fma.f64(double %161, double %160, double %160)
  %163 = fmul double %153, %162
  %164 = fmul double %154, %163
  %165 = fneg double %164
  %166 = tail call double @llvm.fma.f64(double %163, double %154, double %165)
  %167 = tail call double @llvm.fma.f64(double %163, double %156, double %166)
  %168 = fadd double %164, %167
  %169 = fsub double %168, %164
  %170 = fsub double %167, %169
  %171 = fsub double %153, %168
  %172 = fsub double %153, %171
  %173 = fsub double %172, %168
  %174 = fsub double %173, %170
  %175 = fadd double %171, %174
  %176 = fmul double %162, %175
  %177 = fadd double %163, %176
  %178 = fsub double %177, %163
  %179 = fsub double %176, %178
  %180 = fmul double %177, %177
  %181 = tail call double @llvm.fma.f64(double %180, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %182 = tail call double @llvm.fma.f64(double %180, double %181, double 0x3FC7474DD7F4DF2E)
  %183 = tail call double @llvm.fma.f64(double %180, double %182, double 0x3FCC71C016291751)
  %184 = tail call double @llvm.fma.f64(double %180, double %183, double 0x3FD249249B27ACF1)
  %185 = tail call double @llvm.fma.f64(double %180, double %184, double 0x3FD99999998EF7B6)
  %186 = tail call double @llvm.fma.f64(double %180, double %185, double 0x3FE5555555555780)
  %187 = tail call double @llvm.amdgcn.ldexp.f64(double %177, i32 1)
  %188 = tail call double @llvm.amdgcn.ldexp.f64(double %179, i32 1)
  %189 = fmul double %177, %180
  %190 = fmul double %189, %186
  %191 = fadd double %187, %190
  %192 = fsub double %191, %187
  %193 = fsub double %190, %192
  %194 = fadd double %188, %193
  %195 = fadd double %191, %194
  %196 = fsub double %195, %191
  %197 = fsub double %194, %196
  %198 = sitofp i32 %152 to double
  %199 = fmul double %198, 0x3FE62E42FEFA39EF
  %200 = fneg double %199
  %201 = tail call double @llvm.fma.f64(double %198, double 0x3FE62E42FEFA39EF, double %200)
  %202 = tail call double @llvm.fma.f64(double %198, double 0x3C7ABC9E3B39803F, double %201)
  %203 = fadd double %199, %202
  %204 = fsub double %203, %199
  %205 = fsub double %202, %204
  %206 = fadd double %203, %195
  %207 = fsub double %206, %203
  %208 = fsub double %206, %207
  %209 = fsub double %203, %208
  %210 = fsub double %195, %207
  %211 = fadd double %210, %209
  %212 = fadd double %205, %197
  %213 = fsub double %212, %205
  %214 = fsub double %212, %213
  %215 = fsub double %205, %214
  %216 = fsub double %197, %213
  %217 = fadd double %216, %215
  %218 = fadd double %212, %211
  %219 = fadd double %206, %218
  %220 = fsub double %219, %206
  %221 = fsub double %218, %220
  %222 = fadd double %217, %221
  %223 = fadd double %219, %222
  %224 = fcmp oeq double %146, 0x7FF0000000000000
  %225 = select i1 %224, double %146, double %223
  %226 = fcmp oeq double %146, 0.000000e+00
  %227 = select i1 %226, double 0xFFF0000000000000, double %225
  %228 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %229 = load i32, i32 addrspace(1)* %228, align 4, !tbaa !12, !amdgpu.noclobber !5
  %230 = sitofp i32 %229 to double
  %231 = fmul contract double %227, %230
  br label %232

232:                                              ; preds = %7, %19
  %233 = phi double [ %231, %19 ], [ 0.000000e+00, %7 ]
  %234 = getelementptr inbounds double, double addrspace(1)* %5, i64 %18
  store double %233, double addrspace(1)* %234, align 8, !tbaa !10
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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"double", !8, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !8, i64 0}
