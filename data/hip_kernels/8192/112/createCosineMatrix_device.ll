; ModuleID = '../data/hip_kernels/8192/112/main.cu'
source_filename = "../data/hip_kernels/8192/112/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z18createCosineMatrixPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = getelementptr i8, i8 addrspace(4)* %4, i64 6
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 2, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr i8, i8 addrspace(4)* %4, i64 8
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %3, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !6
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %17, %18
  %22 = mul i32 %21, %12
  %23 = add i32 %22, %19
  %24 = mul i32 %23, %8
  %25 = add i32 %24, %20
  %26 = icmp sgt i32 %1, 0
  br i1 %26, label %27, label %235

27:                                               ; preds = %2
  %28 = icmp eq i32 %25, 0
  %29 = sitofp i32 %1 to float
  %30 = fdiv contract float 2.000000e+00, %29
  %31 = fcmp olt float %30, 0x39F0000000000000
  %32 = select i1 %31, float 0x41F0000000000000, float 1.000000e+00
  %33 = fmul float %30, %32
  %34 = tail call float @llvm.sqrt.f32(float %33)
  %35 = bitcast float %34 to i32
  %36 = add nsw i32 %35, -1
  %37 = bitcast i32 %36 to float
  %38 = add nsw i32 %35, 1
  %39 = bitcast i32 %38 to float
  %40 = tail call i1 @llvm.amdgcn.class.f32(float %33, i32 608)
  %41 = select i1 %31, float 0x3EF0000000000000, float 1.000000e+00
  %42 = fneg float %39
  %43 = tail call float @llvm.fma.f32(float %42, float %34, float %33)
  %44 = fcmp ogt float %43, 0.000000e+00
  %45 = fneg float %37
  %46 = tail call float @llvm.fma.f32(float %45, float %34, float %33)
  %47 = fcmp ole float %46, 0.000000e+00
  %48 = select i1 %47, float %37, float %34
  %49 = select i1 %44, float %39, float %48
  %50 = fmul float %41, %49
  %51 = select i1 %40, float %33, float %50
  %52 = fpext float %51 to double
  %53 = sitofp i32 %25 to double
  %54 = shl nuw nsw i32 %1, 1
  %55 = sitofp i32 %54 to double
  %56 = tail call float @llvm.sqrt.f32(float %29)
  %57 = bitcast float %56 to i32
  %58 = add nsw i32 %57, -1
  %59 = bitcast i32 %58 to float
  %60 = add nsw i32 %57, 1
  %61 = bitcast i32 %60 to float
  %62 = tail call i1 @llvm.amdgcn.class.f32(float %29, i32 608)
  %63 = fneg float %61
  %64 = tail call float @llvm.fma.f32(float %63, float %56, float %29)
  %65 = fcmp ogt float %64, 0.000000e+00
  %66 = fneg float %59
  %67 = tail call float @llvm.fma.f32(float %66, float %56, float %29)
  %68 = fcmp ole float %67, 0.000000e+00
  %69 = select i1 %68, float %59, float %56
  %70 = select i1 %65, float %61, float %69
  %71 = select i1 %62, float %29, float %70
  %72 = fdiv contract float 1.000000e+00, %71
  br label %73

73:                                               ; preds = %27, %228
  %74 = phi i32 [ 0, %27 ], [ %233, %228 ]
  br i1 %28, label %75, label %77

75:                                               ; preds = %73
  %76 = mul nsw i32 %74, %1
  br label %228

77:                                               ; preds = %73
  %78 = shl nuw nsw i32 %74, 1
  %79 = add nuw nsw i32 %78, 1
  %80 = sitofp i32 %79 to double
  %81 = fmul contract double %80, 0x400921FB54442D18
  %82 = fmul contract double %81, %53
  %83 = fdiv contract double %82, %55
  %84 = tail call double @llvm.fabs.f64(double %83)
  %85 = fcmp olt double %84, 0x41D0000000000000
  br i1 %85, label %86, label %105

86:                                               ; preds = %77
  %87 = fmul double %84, 0x3FE45F306DC9C883
  %88 = tail call double @llvm.rint.f64(double %87)
  %89 = tail call double @llvm.fma.f64(double %88, double 0xBFF921FB54442D18, double %84)
  %90 = tail call double @llvm.fma.f64(double %88, double 0xBC91A62633145C00, double %89)
  %91 = fmul double %88, 0x3C91A62633145C00
  %92 = fneg double %91
  %93 = tail call double @llvm.fma.f64(double %88, double 0x3C91A62633145C00, double %92)
  %94 = fsub double %89, %91
  %95 = fsub double %89, %94
  %96 = fsub double %95, %91
  %97 = fsub double %94, %90
  %98 = fadd double %97, %96
  %99 = fsub double %98, %93
  %100 = tail call double @llvm.fma.f64(double %88, double 0xB97B839A252049C0, double %99)
  %101 = fadd double %90, %100
  %102 = fsub double %101, %90
  %103 = fsub double %100, %102
  %104 = fptosi double %88 to i32
  br label %181

105:                                              ; preds = %77
  %106 = tail call double @llvm.amdgcn.trig.preop.f64(double %84, i32 0)
  %107 = tail call double @llvm.amdgcn.trig.preop.f64(double %84, i32 1)
  %108 = tail call double @llvm.amdgcn.trig.preop.f64(double %84, i32 2)
  %109 = fcmp oge double %84, 0x7B00000000000000
  %110 = tail call double @llvm.amdgcn.ldexp.f64(double %84, i32 -128)
  %111 = select i1 %109, double %110, double %84
  %112 = fmul double %108, %111
  %113 = fneg double %112
  %114 = tail call double @llvm.fma.f64(double %108, double %111, double %113)
  %115 = fmul double %107, %111
  %116 = fneg double %115
  %117 = tail call double @llvm.fma.f64(double %107, double %111, double %116)
  %118 = fmul double %106, %111
  %119 = fneg double %118
  %120 = tail call double @llvm.fma.f64(double %106, double %111, double %119)
  %121 = fadd double %115, %120
  %122 = fsub double %121, %115
  %123 = fsub double %121, %122
  %124 = fsub double %120, %122
  %125 = fsub double %115, %123
  %126 = fadd double %124, %125
  %127 = fadd double %112, %117
  %128 = fsub double %127, %112
  %129 = fsub double %127, %128
  %130 = fsub double %117, %128
  %131 = fsub double %112, %129
  %132 = fadd double %130, %131
  %133 = fadd double %127, %126
  %134 = fsub double %133, %127
  %135 = fsub double %133, %134
  %136 = fsub double %126, %134
  %137 = fsub double %127, %135
  %138 = fadd double %136, %137
  %139 = fadd double %132, %138
  %140 = fadd double %114, %139
  %141 = fadd double %118, %121
  %142 = fsub double %141, %118
  %143 = fsub double %121, %142
  %144 = fadd double %143, %133
  %145 = fsub double %144, %143
  %146 = fsub double %133, %145
  %147 = fadd double %146, %140
  %148 = tail call double @llvm.amdgcn.ldexp.f64(double %141, i32 -2)
  %149 = tail call double @llvm.amdgcn.fract.f64(double %148)
  %150 = tail call i1 @llvm.amdgcn.class.f64(double %148, i32 516)
  %151 = select i1 %150, double 0.000000e+00, double %149
  %152 = tail call double @llvm.amdgcn.ldexp.f64(double %151, i32 2)
  %153 = fadd double %152, %144
  %154 = fcmp olt double %153, 0.000000e+00
  %155 = select i1 %154, double 4.000000e+00, double 0.000000e+00
  %156 = fadd double %152, %155
  %157 = fadd double %144, %156
  %158 = fptosi double %157 to i32
  %159 = sitofp i32 %158 to double
  %160 = fsub double %156, %159
  %161 = fadd double %144, %160
  %162 = fsub double %161, %160
  %163 = fsub double %144, %162
  %164 = fadd double %147, %163
  %165 = fcmp oge double %161, 5.000000e-01
  %166 = zext i1 %165 to i32
  %167 = add nsw i32 %166, %158
  %168 = select i1 %165, double 1.000000e+00, double 0.000000e+00
  %169 = fsub double %161, %168
  %170 = fadd double %169, %164
  %171 = fsub double %170, %169
  %172 = fsub double %164, %171
  %173 = fmul double %170, 0x3FF921FB54442D18
  %174 = fneg double %173
  %175 = tail call double @llvm.fma.f64(double %170, double 0x3FF921FB54442D18, double %174)
  %176 = tail call double @llvm.fma.f64(double %170, double 0x3C91A62633145C07, double %175)
  %177 = tail call double @llvm.fma.f64(double %172, double 0x3FF921FB54442D18, double %176)
  %178 = fadd double %173, %177
  %179 = fsub double %178, %173
  %180 = fsub double %177, %179
  br label %181

181:                                              ; preds = %86, %105
  %182 = phi double [ %103, %86 ], [ %180, %105 ]
  %183 = phi double [ %101, %86 ], [ %178, %105 ]
  %184 = phi i32 [ %104, %86 ], [ %167, %105 ]
  %185 = fmul double %183, %183
  %186 = fmul double %185, 5.000000e-01
  %187 = fsub double 1.000000e+00, %186
  %188 = fsub double 1.000000e+00, %187
  %189 = fsub double %188, %186
  %190 = fmul double %185, %185
  %191 = tail call double @llvm.fma.f64(double %185, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %192 = tail call double @llvm.fma.f64(double %185, double %191, double 0xBE927E4FA17F65F6)
  %193 = tail call double @llvm.fma.f64(double %185, double %192, double 0x3EFA01A019F4EC90)
  %194 = tail call double @llvm.fma.f64(double %185, double %193, double 0xBF56C16C16C16967)
  %195 = tail call double @llvm.fma.f64(double %185, double %194, double 0x3FA5555555555555)
  %196 = fneg double %182
  %197 = tail call double @llvm.fma.f64(double %183, double %196, double %189)
  %198 = tail call double @llvm.fma.f64(double %190, double %195, double %197)
  %199 = fadd double %187, %198
  %200 = tail call double @llvm.fma.f64(double %185, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %201 = tail call double @llvm.fma.f64(double %185, double %200, double 0x3EC71DE3796CDE01)
  %202 = tail call double @llvm.fma.f64(double %185, double %201, double 0xBF2A01A019E83E5C)
  %203 = tail call double @llvm.fma.f64(double %185, double %202, double 0x3F81111111110BB3)
  %204 = fneg double %185
  %205 = fmul double %183, %204
  %206 = fmul double %182, 5.000000e-01
  %207 = tail call double @llvm.fma.f64(double %205, double %203, double %206)
  %208 = tail call double @llvm.fma.f64(double %185, double %207, double %196)
  %209 = tail call double @llvm.fma.f64(double %205, double 0xBFC5555555555555, double %208)
  %210 = fsub double %183, %209
  %211 = fneg double %210
  %212 = and i32 %184, 1
  %213 = icmp eq i32 %212, 0
  %214 = select i1 %213, double %199, double %211
  %215 = bitcast double %214 to <2 x i32>
  %216 = shl i32 %184, 30
  %217 = and i32 %216, -2147483648
  %218 = extractelement <2 x i32> %215, i64 1
  %219 = xor i32 %218, %217
  %220 = insertelement <2 x i32> %215, i32 %219, i64 1
  %221 = tail call i1 @llvm.amdgcn.class.f64(double %84, i32 504)
  %222 = select i1 %221, <2 x i32> %220, <2 x i32> <i32 0, i32 2146959360>
  %223 = bitcast <2 x i32> %222 to double
  %224 = fmul contract double %52, %223
  %225 = fptrunc double %224 to float
  %226 = mul nsw i32 %74, %1
  %227 = add nsw i32 %226, %25
  br label %228

228:                                              ; preds = %75, %181
  %229 = phi i32 [ %76, %75 ], [ %227, %181 ]
  %230 = phi float [ %72, %75 ], [ %225, %181 ]
  %231 = sext i32 %229 to i64
  %232 = getelementptr inbounds float, float addrspace(1)* %0, i64 %231
  store float %230, float addrspace(1)* %232, align 4, !tbaa !7
  %233 = add nuw nsw i32 %74, 1
  %234 = icmp eq i32 %233, %1
  br i1 %234, label %235, label %73, !llvm.loop !11

235:                                              ; preds = %228, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
