; ModuleID = '../data/hip_kernels/17141/5/main.cu'
source_filename = "../data/hip_kernels/17141/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24MultinomialNBLearnKernelPfS_PKfjjj(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = icmp ult i32 %15, %5
  %17 = icmp ne i32 %4, 0
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %243

19:                                               ; preds = %6
  %20 = uitofp i32 %5 to double
  %21 = icmp eq i32 %15, 0
  %22 = uitofp i32 %3 to float
  br i1 %21, label %125, label %23

23:                                               ; preds = %19, %23
  %24 = phi i32 [ %123, %23 ], [ 0, %19 ]
  %25 = mul i32 %24, %5
  %26 = add i32 %25, %15
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %30 = fpext float %29 to double
  %31 = fadd contract double %30, 1.000000e+00
  %32 = zext i32 %24 to i64
  %33 = getelementptr inbounds float, float addrspace(1)* %2, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7
  %35 = fpext float %34 to double
  %36 = fsub contract double %35, %20
  %37 = fdiv contract double %31, %36
  %38 = tail call double @llvm.amdgcn.frexp.mant.f64(double %37)
  %39 = fcmp olt double %38, 0x3FE5555555555555
  %40 = zext i1 %39 to i32
  %41 = tail call double @llvm.amdgcn.ldexp.f64(double %38, i32 %40)
  %42 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %37)
  %43 = sub nsw i32 %42, %40
  %44 = fadd double %41, -1.000000e+00
  %45 = fadd double %41, 1.000000e+00
  %46 = fadd double %45, -1.000000e+00
  %47 = fsub double %41, %46
  %48 = tail call double @llvm.amdgcn.rcp.f64(double %45)
  %49 = fneg double %45
  %50 = tail call double @llvm.fma.f64(double %49, double %48, double 1.000000e+00)
  %51 = tail call double @llvm.fma.f64(double %50, double %48, double %48)
  %52 = tail call double @llvm.fma.f64(double %49, double %51, double 1.000000e+00)
  %53 = tail call double @llvm.fma.f64(double %52, double %51, double %51)
  %54 = fmul double %44, %53
  %55 = fmul double %45, %54
  %56 = fneg double %55
  %57 = tail call double @llvm.fma.f64(double %54, double %45, double %56)
  %58 = tail call double @llvm.fma.f64(double %54, double %47, double %57)
  %59 = fadd double %55, %58
  %60 = fsub double %59, %55
  %61 = fsub double %58, %60
  %62 = fsub double %44, %59
  %63 = fsub double %44, %62
  %64 = fsub double %63, %59
  %65 = fsub double %64, %61
  %66 = fadd double %62, %65
  %67 = fmul double %53, %66
  %68 = fadd double %54, %67
  %69 = fsub double %68, %54
  %70 = fsub double %67, %69
  %71 = fmul double %68, %68
  %72 = tail call double @llvm.fma.f64(double %71, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %73 = tail call double @llvm.fma.f64(double %71, double %72, double 0x3FC7474DD7F4DF2E)
  %74 = tail call double @llvm.fma.f64(double %71, double %73, double 0x3FCC71C016291751)
  %75 = tail call double @llvm.fma.f64(double %71, double %74, double 0x3FD249249B27ACF1)
  %76 = tail call double @llvm.fma.f64(double %71, double %75, double 0x3FD99999998EF7B6)
  %77 = tail call double @llvm.fma.f64(double %71, double %76, double 0x3FE5555555555780)
  %78 = tail call double @llvm.amdgcn.ldexp.f64(double %68, i32 1)
  %79 = tail call double @llvm.amdgcn.ldexp.f64(double %70, i32 1)
  %80 = fmul double %68, %71
  %81 = fmul double %80, %77
  %82 = fadd double %78, %81
  %83 = fsub double %82, %78
  %84 = fsub double %81, %83
  %85 = fadd double %79, %84
  %86 = fadd double %82, %85
  %87 = fsub double %86, %82
  %88 = fsub double %85, %87
  %89 = sitofp i32 %43 to double
  %90 = fmul double %89, 0x3FE62E42FEFA39EF
  %91 = fneg double %90
  %92 = tail call double @llvm.fma.f64(double %89, double 0x3FE62E42FEFA39EF, double %91)
  %93 = tail call double @llvm.fma.f64(double %89, double 0x3C7ABC9E3B39803F, double %92)
  %94 = fadd double %90, %93
  %95 = fsub double %94, %90
  %96 = fsub double %93, %95
  %97 = fadd double %94, %86
  %98 = fsub double %97, %94
  %99 = fsub double %97, %98
  %100 = fsub double %94, %99
  %101 = fsub double %86, %98
  %102 = fadd double %101, %100
  %103 = fadd double %96, %88
  %104 = fsub double %103, %96
  %105 = fsub double %103, %104
  %106 = fsub double %96, %105
  %107 = fsub double %88, %104
  %108 = fadd double %107, %106
  %109 = fadd double %103, %102
  %110 = fadd double %97, %109
  %111 = fsub double %110, %97
  %112 = fsub double %109, %111
  %113 = fadd double %108, %112
  %114 = fadd double %110, %113
  %115 = tail call double @llvm.fabs.f64(double %37) #3
  %116 = fcmp oeq double %115, 0x7FF0000000000000
  %117 = select i1 %116, double %37, double %114
  %118 = fcmp olt double %37, 0.000000e+00
  %119 = select i1 %118, double 0x7FF8000000000000, double %117
  %120 = fcmp oeq double %37, 0.000000e+00
  %121 = select i1 %120, double 0xFFF0000000000000, double %119
  %122 = fptrunc double %121 to float
  store float %122, float addrspace(1)* %28, align 4, !tbaa !7
  %123 = add nuw i32 %24, 1
  %124 = icmp eq i32 %123, %4
  br i1 %124, label %243, label %23, !llvm.loop !11

125:                                              ; preds = %19, %125
  %126 = phi i32 [ %241, %125 ], [ 0, %19 ]
  %127 = mul i32 %126, %5
  %128 = add i32 %127, %15
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = fpext float %131 to double
  %133 = fadd contract double %132, 1.000000e+00
  %134 = zext i32 %126 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %2, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fpext float %136 to double
  %138 = fsub contract double %137, %20
  %139 = fdiv contract double %133, %138
  %140 = tail call double @llvm.amdgcn.frexp.mant.f64(double %139)
  %141 = fcmp olt double %140, 0x3FE5555555555555
  %142 = zext i1 %141 to i32
  %143 = tail call double @llvm.amdgcn.ldexp.f64(double %140, i32 %142)
  %144 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %139)
  %145 = sub nsw i32 %144, %142
  %146 = fadd double %143, -1.000000e+00
  %147 = fadd double %143, 1.000000e+00
  %148 = fadd double %147, -1.000000e+00
  %149 = fsub double %143, %148
  %150 = tail call double @llvm.amdgcn.rcp.f64(double %147)
  %151 = fneg double %147
  %152 = tail call double @llvm.fma.f64(double %151, double %150, double 1.000000e+00)
  %153 = tail call double @llvm.fma.f64(double %152, double %150, double %150)
  %154 = tail call double @llvm.fma.f64(double %151, double %153, double 1.000000e+00)
  %155 = tail call double @llvm.fma.f64(double %154, double %153, double %153)
  %156 = fmul double %146, %155
  %157 = fmul double %147, %156
  %158 = fneg double %157
  %159 = tail call double @llvm.fma.f64(double %156, double %147, double %158)
  %160 = tail call double @llvm.fma.f64(double %156, double %149, double %159)
  %161 = fadd double %157, %160
  %162 = fsub double %161, %157
  %163 = fsub double %160, %162
  %164 = fsub double %146, %161
  %165 = fsub double %146, %164
  %166 = fsub double %165, %161
  %167 = fsub double %166, %163
  %168 = fadd double %164, %167
  %169 = fmul double %155, %168
  %170 = fadd double %156, %169
  %171 = fsub double %170, %156
  %172 = fsub double %169, %171
  %173 = fmul double %170, %170
  %174 = tail call double @llvm.fma.f64(double %173, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %175 = tail call double @llvm.fma.f64(double %173, double %174, double 0x3FC7474DD7F4DF2E)
  %176 = tail call double @llvm.fma.f64(double %173, double %175, double 0x3FCC71C016291751)
  %177 = tail call double @llvm.fma.f64(double %173, double %176, double 0x3FD249249B27ACF1)
  %178 = tail call double @llvm.fma.f64(double %173, double %177, double 0x3FD99999998EF7B6)
  %179 = tail call double @llvm.fma.f64(double %173, double %178, double 0x3FE5555555555780)
  %180 = tail call double @llvm.amdgcn.ldexp.f64(double %170, i32 1)
  %181 = tail call double @llvm.amdgcn.ldexp.f64(double %172, i32 1)
  %182 = fmul double %170, %173
  %183 = fmul double %182, %179
  %184 = fadd double %180, %183
  %185 = fsub double %184, %180
  %186 = fsub double %183, %185
  %187 = fadd double %181, %186
  %188 = fadd double %184, %187
  %189 = fsub double %188, %184
  %190 = fsub double %187, %189
  %191 = sitofp i32 %145 to double
  %192 = fmul double %191, 0x3FE62E42FEFA39EF
  %193 = fneg double %192
  %194 = tail call double @llvm.fma.f64(double %191, double 0x3FE62E42FEFA39EF, double %193)
  %195 = tail call double @llvm.fma.f64(double %191, double 0x3C7ABC9E3B39803F, double %194)
  %196 = fadd double %192, %195
  %197 = fsub double %196, %192
  %198 = fsub double %195, %197
  %199 = fadd double %196, %188
  %200 = fsub double %199, %196
  %201 = fsub double %199, %200
  %202 = fsub double %196, %201
  %203 = fsub double %188, %200
  %204 = fadd double %203, %202
  %205 = fadd double %198, %190
  %206 = fsub double %205, %198
  %207 = fsub double %205, %206
  %208 = fsub double %198, %207
  %209 = fsub double %190, %206
  %210 = fadd double %209, %208
  %211 = fadd double %205, %204
  %212 = fadd double %199, %211
  %213 = fsub double %212, %199
  %214 = fsub double %211, %213
  %215 = fadd double %210, %214
  %216 = fadd double %212, %215
  %217 = tail call double @llvm.fabs.f64(double %139) #3
  %218 = fcmp oeq double %217, 0x7FF0000000000000
  %219 = select i1 %218, double %139, double %216
  %220 = fcmp olt double %139, 0.000000e+00
  %221 = select i1 %220, double 0x7FF8000000000000, double %219
  %222 = fcmp oeq double %139, 0.000000e+00
  %223 = select i1 %222, double 0xFFF0000000000000, double %221
  %224 = fptrunc double %223 to float
  store float %224, float addrspace(1)* %130, align 4, !tbaa !7
  %225 = getelementptr inbounds float, float addrspace(1)* %1, i64 %134
  %226 = load float, float addrspace(1)* %225, align 4, !tbaa !7
  %227 = fdiv contract float %226, %22
  %228 = tail call i1 @llvm.amdgcn.class.f32(float %227, i32 144)
  %229 = select i1 %228, float 0x41F0000000000000, float 1.000000e+00
  %230 = fmul float %227, %229
  %231 = tail call float @llvm.log2.f32(float %230)
  %232 = fmul float %231, 0x3FE62E42E0000000
  %233 = tail call i1 @llvm.amdgcn.class.f32(float %231, i32 519)
  %234 = fneg float %232
  %235 = tail call float @llvm.fma.f32(float %231, float 0x3FE62E42E0000000, float %234)
  %236 = tail call float @llvm.fma.f32(float %231, float 0x3E6EFA39E0000000, float %235)
  %237 = fadd float %232, %236
  %238 = select i1 %233, float %231, float %237
  %239 = select i1 %228, float 0x40362E4300000000, float 0.000000e+00
  %240 = fsub float %238, %239
  store float %240, float addrspace(1)* %225, align 4, !tbaa !7
  %241 = add nuw i32 %126, 1
  %242 = icmp eq i32 %241, %4
  br i1 %242, label %243, label %125, !llvm.loop !11

243:                                              ; preds = %125, %23, %6
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

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
