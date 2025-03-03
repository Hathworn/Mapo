; ModuleID = '../data/hip_kernels/11810/4/main.cu'
source_filename = "../data/hip_kernels/11810/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z22InitComputeAccelKernelPdS_S_ii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %8, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = icmp slt i32 %22, %4
  %24 = icmp slt i32 %14, %3
  %25 = select i1 %23, i1 %24, i1 false
  br i1 %25, label %26, label %235

26:                                               ; preds = %5
  %27 = sext i32 %22 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7, !amdgpu.noclobber !6
  %30 = sitofp i32 %14 to double
  %31 = fmul contract double %30, 0x401921FB54442D18
  %32 = sitofp i32 %3 to double
  %33 = fdiv contract double %31, %32
  %34 = tail call double @llvm.fabs.f64(double %33)
  %35 = fcmp olt double %34, 0x41D0000000000000
  br i1 %35, label %36, label %93

36:                                               ; preds = %26
  %37 = fmul double %34, 0x3FE45F306DC9C883
  %38 = tail call double @llvm.rint.f64(double %37)
  %39 = tail call double @llvm.fma.f64(double %38, double 0xBFF921FB54442D18, double %34)
  %40 = tail call double @llvm.fma.f64(double %38, double 0xBC91A62633145C00, double %39)
  %41 = fmul double %38, 0x3C91A62633145C00
  %42 = fneg double %41
  %43 = tail call double @llvm.fma.f64(double %38, double 0x3C91A62633145C00, double %42)
  %44 = fsub double %39, %41
  %45 = fsub double %39, %44
  %46 = fsub double %45, %41
  %47 = fsub double %44, %40
  %48 = fadd double %47, %46
  %49 = fsub double %48, %43
  %50 = tail call double @llvm.fma.f64(double %38, double 0xB97B839A252049C0, double %49)
  %51 = fadd double %40, %50
  %52 = fsub double %51, %40
  %53 = fsub double %50, %52
  %54 = fptosi double %38 to i32
  %55 = fmul double %51, %51
  %56 = fmul double %55, 5.000000e-01
  %57 = fsub double 1.000000e+00, %56
  %58 = fsub double 1.000000e+00, %57
  %59 = fsub double %58, %56
  %60 = fmul double %55, %55
  %61 = tail call double @llvm.fma.f64(double %55, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %62 = tail call double @llvm.fma.f64(double %55, double %61, double 0xBE927E4FA17F65F6)
  %63 = tail call double @llvm.fma.f64(double %55, double %62, double 0x3EFA01A019F4EC90)
  %64 = tail call double @llvm.fma.f64(double %55, double %63, double 0xBF56C16C16C16967)
  %65 = tail call double @llvm.fma.f64(double %55, double %64, double 0x3FA5555555555555)
  %66 = fneg double %53
  %67 = tail call double @llvm.fma.f64(double %51, double %66, double %59)
  %68 = tail call double @llvm.fma.f64(double %60, double %65, double %67)
  %69 = fadd double %57, %68
  %70 = tail call double @llvm.fma.f64(double %55, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %71 = tail call double @llvm.fma.f64(double %55, double %70, double 0x3EC71DE3796CDE01)
  %72 = tail call double @llvm.fma.f64(double %55, double %71, double 0xBF2A01A019E83E5C)
  %73 = tail call double @llvm.fma.f64(double %55, double %72, double 0x3F81111111110BB3)
  %74 = fneg double %55
  %75 = fmul double %51, %74
  %76 = fmul double %53, 5.000000e-01
  %77 = tail call double @llvm.fma.f64(double %75, double %73, double %76)
  %78 = tail call double @llvm.fma.f64(double %55, double %77, double %66)
  %79 = tail call double @llvm.fma.f64(double %75, double 0xBFC5555555555555, double %78)
  %80 = fsub double %51, %79
  %81 = fneg double %80
  %82 = and i32 %54, 1
  %83 = icmp eq i32 %82, 0
  %84 = select i1 %83, double %69, double %81
  %85 = bitcast double %84 to <2 x i32>
  %86 = shl i32 %54, 30
  %87 = and i32 %86, -2147483648
  %88 = extractelement <2 x i32> %85, i64 1
  %89 = xor i32 %88, %87
  %90 = insertelement <2 x i32> %85, i32 %89, i64 1
  %91 = tail call i1 @llvm.amdgcn.class.f64(double %34, i32 504)
  %92 = select i1 %91, <2 x i32> %90, <2 x i32> <i32 0, i32 2146959360>
  br label %207

93:                                               ; preds = %26
  %94 = tail call double @llvm.amdgcn.trig.preop.f64(double %34, i32 0)
  %95 = tail call double @llvm.amdgcn.trig.preop.f64(double %34, i32 1)
  %96 = tail call double @llvm.amdgcn.trig.preop.f64(double %34, i32 2)
  %97 = fcmp oge double %34, 0x7B00000000000000
  %98 = tail call double @llvm.amdgcn.ldexp.f64(double %34, i32 -128)
  %99 = select i1 %97, double %98, double %34
  %100 = fmul double %96, %99
  %101 = fneg double %100
  %102 = tail call double @llvm.fma.f64(double %96, double %99, double %101)
  %103 = fmul double %95, %99
  %104 = fneg double %103
  %105 = tail call double @llvm.fma.f64(double %95, double %99, double %104)
  %106 = fmul double %94, %99
  %107 = fneg double %106
  %108 = tail call double @llvm.fma.f64(double %94, double %99, double %107)
  %109 = fadd double %103, %108
  %110 = fsub double %109, %103
  %111 = fsub double %109, %110
  %112 = fsub double %108, %110
  %113 = fsub double %103, %111
  %114 = fadd double %112, %113
  %115 = fadd double %100, %105
  %116 = fsub double %115, %100
  %117 = fsub double %115, %116
  %118 = fsub double %105, %116
  %119 = fsub double %100, %117
  %120 = fadd double %118, %119
  %121 = fadd double %115, %114
  %122 = fsub double %121, %115
  %123 = fsub double %121, %122
  %124 = fsub double %114, %122
  %125 = fsub double %115, %123
  %126 = fadd double %124, %125
  %127 = fadd double %120, %126
  %128 = fadd double %102, %127
  %129 = fadd double %106, %109
  %130 = fsub double %129, %106
  %131 = fsub double %109, %130
  %132 = fadd double %131, %121
  %133 = fsub double %132, %131
  %134 = fsub double %121, %133
  %135 = fadd double %134, %128
  %136 = tail call double @llvm.amdgcn.ldexp.f64(double %129, i32 -2)
  %137 = tail call double @llvm.amdgcn.fract.f64(double %136)
  %138 = tail call i1 @llvm.amdgcn.class.f64(double %136, i32 516)
  %139 = select i1 %138, double 0.000000e+00, double %137
  %140 = tail call double @llvm.amdgcn.ldexp.f64(double %139, i32 2)
  %141 = fadd double %140, %132
  %142 = fcmp olt double %141, 0.000000e+00
  %143 = select i1 %142, double 4.000000e+00, double 0.000000e+00
  %144 = fadd double %140, %143
  %145 = fadd double %132, %144
  %146 = fptosi double %145 to i32
  %147 = sitofp i32 %146 to double
  %148 = fsub double %144, %147
  %149 = fadd double %132, %148
  %150 = fsub double %149, %148
  %151 = fsub double %132, %150
  %152 = fadd double %135, %151
  %153 = fcmp oge double %149, 5.000000e-01
  %154 = zext i1 %153 to i32
  %155 = add nsw i32 %154, %146
  %156 = select i1 %153, double 1.000000e+00, double 0.000000e+00
  %157 = fsub double %149, %156
  %158 = fadd double %157, %152
  %159 = fsub double %158, %157
  %160 = fsub double %152, %159
  %161 = fmul double %158, 0x3FF921FB54442D18
  %162 = fneg double %161
  %163 = tail call double @llvm.fma.f64(double %158, double 0x3FF921FB54442D18, double %162)
  %164 = tail call double @llvm.fma.f64(double %158, double 0x3C91A62633145C07, double %163)
  %165 = tail call double @llvm.fma.f64(double %160, double 0x3FF921FB54442D18, double %164)
  %166 = fadd double %161, %165
  %167 = fsub double %166, %161
  %168 = fsub double %165, %167
  %169 = fmul double %166, %166
  %170 = fmul double %169, 5.000000e-01
  %171 = fsub double 1.000000e+00, %170
  %172 = fsub double 1.000000e+00, %171
  %173 = fsub double %172, %170
  %174 = fmul double %169, %169
  %175 = tail call double @llvm.fma.f64(double %169, double 0xBDA907DB46CC5E42, double 0x3E21EEB69037AB78)
  %176 = tail call double @llvm.fma.f64(double %169, double %175, double 0xBE927E4FA17F65F6)
  %177 = tail call double @llvm.fma.f64(double %169, double %176, double 0x3EFA01A019F4EC90)
  %178 = tail call double @llvm.fma.f64(double %169, double %177, double 0xBF56C16C16C16967)
  %179 = tail call double @llvm.fma.f64(double %169, double %178, double 0x3FA5555555555555)
  %180 = fneg double %168
  %181 = tail call double @llvm.fma.f64(double %166, double %180, double %173)
  %182 = tail call double @llvm.fma.f64(double %174, double %179, double %181)
  %183 = fadd double %171, %182
  %184 = tail call double @llvm.fma.f64(double %169, double 0x3DE5E0B2F9A43BB8, double 0xBE5AE600B42FDFA7)
  %185 = tail call double @llvm.fma.f64(double %169, double %184, double 0x3EC71DE3796CDE01)
  %186 = tail call double @llvm.fma.f64(double %169, double %185, double 0xBF2A01A019E83E5C)
  %187 = tail call double @llvm.fma.f64(double %169, double %186, double 0x3F81111111110BB3)
  %188 = fneg double %169
  %189 = fmul double %166, %188
  %190 = fmul double %168, 5.000000e-01
  %191 = tail call double @llvm.fma.f64(double %189, double %187, double %190)
  %192 = tail call double @llvm.fma.f64(double %169, double %191, double %180)
  %193 = tail call double @llvm.fma.f64(double %189, double 0xBFC5555555555555, double %192)
  %194 = fsub double %166, %193
  %195 = fneg double %194
  %196 = and i32 %155, 1
  %197 = icmp eq i32 %196, 0
  %198 = select i1 %197, double %183, double %195
  %199 = bitcast double %198 to <2 x i32>
  %200 = shl i32 %155, 30
  %201 = and i32 %200, -2147483648
  %202 = extractelement <2 x i32> %199, i64 1
  %203 = xor i32 %202, %201
  %204 = insertelement <2 x i32> %199, i32 %203, i64 1
  %205 = tail call i1 @llvm.amdgcn.class.f64(double %34, i32 504)
  %206 = select i1 %205, <2 x i32> %204, <2 x i32> <i32 0, i32 2146959360>
  br label %207

207:                                              ; preds = %36, %93
  %208 = phi <2 x i32> [ %92, %36 ], [ %206, %93 ]
  %209 = phi i32 [ %86, %36 ], [ %200, %93 ]
  %210 = phi i32 [ %82, %36 ], [ %196, %93 ]
  %211 = phi double [ %80, %36 ], [ %194, %93 ]
  %212 = phi double [ %69, %36 ], [ %183, %93 ]
  %213 = phi i1 [ %91, %36 ], [ %205, %93 ]
  %214 = bitcast <2 x i32> %208 to double
  %215 = fmul contract double %29, %214
  %216 = mul nsw i32 %22, %3
  %217 = add nsw i32 %216, %14
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds double, double addrspace(1)* %0, i64 %218
  store double %215, double addrspace(1)* %219, align 8, !tbaa !7
  %220 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %221 = icmp eq i32 %210, 0
  %222 = select i1 %221, double %211, double %212
  %223 = bitcast double %222 to <2 x i32>
  %224 = bitcast double %33 to <2 x i32>
  %225 = extractelement <2 x i32> %224, i64 1
  %226 = xor i32 %209, %225
  %227 = and i32 %226, -2147483648
  %228 = extractelement <2 x i32> %223, i64 1
  %229 = xor i32 %228, %227
  %230 = insertelement <2 x i32> %223, i32 %229, i64 1
  %231 = select i1 %213, <2 x i32> %230, <2 x i32> <i32 0, i32 2146959360>
  %232 = bitcast <2 x i32> %231 to double
  %233 = fmul contract double %220, %232
  %234 = getelementptr inbounds double, double addrspace(1)* %1, i64 %218
  store double %233, double addrspace(1)* %234, align 8, !tbaa !7
  br label %235

235:                                              ; preds = %207, %5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.trig.preop.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
