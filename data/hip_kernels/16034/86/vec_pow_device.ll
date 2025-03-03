; ModuleID = '../data/hip_kernels/16034/86/main.cu'
source_filename = "../data/hip_kernels/16034/86/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_pow(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !7
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = udiv i32 %14, %11
  %24 = mul i32 %23, %11
  %25 = icmp ugt i32 %14, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = add i32 %28, %6
  %30 = mul i32 %29, %11
  %31 = add i32 %30, %5
  %32 = icmp slt i32 %31, %0
  br i1 %32, label %33, label %246

33:                                               ; preds = %4
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !16, !amdgpu.noclobber !6
  %37 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !16, !amdgpu.noclobber !6
  %39 = tail call double @llvm.fabs.f64(double %36)
  %40 = tail call double @llvm.amdgcn.frexp.mant.f64(double %39)
  %41 = fcmp olt double %40, 0x3FE5555555555555
  %42 = zext i1 %41 to i32
  %43 = tail call double @llvm.amdgcn.ldexp.f64(double %40, i32 %42)
  %44 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %39)
  %45 = sub nsw i32 %44, %42
  %46 = fadd double %43, -1.000000e+00
  %47 = fadd double %43, 1.000000e+00
  %48 = fadd double %47, -1.000000e+00
  %49 = fsub double %43, %48
  %50 = tail call double @llvm.amdgcn.rcp.f64(double %47)
  %51 = fneg double %47
  %52 = tail call double @llvm.fma.f64(double %51, double %50, double 1.000000e+00)
  %53 = tail call double @llvm.fma.f64(double %52, double %50, double %50)
  %54 = tail call double @llvm.fma.f64(double %51, double %53, double 1.000000e+00)
  %55 = tail call double @llvm.fma.f64(double %54, double %53, double %53)
  %56 = fmul double %46, %55
  %57 = fmul double %47, %56
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %56, double %47, double %58)
  %60 = tail call double @llvm.fma.f64(double %56, double %49, double %59)
  %61 = fadd double %57, %60
  %62 = fsub double %61, %57
  %63 = fsub double %60, %62
  %64 = fsub double %46, %61
  %65 = fsub double %46, %64
  %66 = fsub double %65, %61
  %67 = fsub double %66, %63
  %68 = fadd double %64, %67
  %69 = fmul double %55, %68
  %70 = fadd double %56, %69
  %71 = fsub double %70, %56
  %72 = fsub double %69, %71
  %73 = fmul double %70, %70
  %74 = fneg double %73
  %75 = tail call double @llvm.fma.f64(double %70, double %70, double %74)
  %76 = fmul double %72, 2.000000e+00
  %77 = tail call double @llvm.fma.f64(double %70, double %76, double %75)
  %78 = fadd double %73, %77
  %79 = fsub double %78, %73
  %80 = fsub double %77, %79
  %81 = tail call double @llvm.fma.f64(double %78, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %82 = tail call double @llvm.fma.f64(double %78, double %81, double 0x3FBE25E43ABE935A)
  %83 = tail call double @llvm.fma.f64(double %78, double %82, double 0x3FC110EF47E6C9C2)
  %84 = tail call double @llvm.fma.f64(double %78, double %83, double 0x3FC3B13BCFA74449)
  %85 = tail call double @llvm.fma.f64(double %78, double %84, double 0x3FC745D171BF3C30)
  %86 = tail call double @llvm.fma.f64(double %78, double %85, double 0x3FCC71C71C7792CE)
  %87 = tail call double @llvm.fma.f64(double %78, double %86, double 0x3FD24924924920DA)
  %88 = tail call double @llvm.fma.f64(double %78, double %87, double 0x3FD999999999999C)
  %89 = sitofp i32 %45 to double
  %90 = fmul double %89, 0x3FE62E42FEFA39EF
  %91 = fneg double %90
  %92 = tail call double @llvm.fma.f64(double %89, double 0x3FE62E42FEFA39EF, double %91)
  %93 = tail call double @llvm.fma.f64(double %89, double 0x3C7ABC9E3B39803F, double %92)
  %94 = fadd double %90, %93
  %95 = fsub double %94, %90
  %96 = fsub double %93, %95
  %97 = tail call double @llvm.amdgcn.ldexp.f64(double %70, i32 1)
  %98 = tail call double @llvm.amdgcn.ldexp.f64(double %72, i32 1)
  %99 = fmul double %70, %78
  %100 = fneg double %99
  %101 = tail call double @llvm.fma.f64(double %78, double %70, double %100)
  %102 = tail call double @llvm.fma.f64(double %78, double %72, double %101)
  %103 = tail call double @llvm.fma.f64(double %80, double %70, double %102)
  %104 = fadd double %99, %103
  %105 = fsub double %104, %99
  %106 = fsub double %103, %105
  %107 = fmul double %78, %88
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %78, double %88, double %108)
  %110 = tail call double @llvm.fma.f64(double %80, double %88, double %109)
  %111 = fadd double %107, %110
  %112 = fsub double %111, %107
  %113 = fsub double %110, %112
  %114 = fadd double %111, 0x3FE5555555555555
  %115 = fadd double %114, 0xBFE5555555555555
  %116 = fsub double %111, %115
  %117 = fadd double %113, 0x3C8543B0D5DF274D
  %118 = fadd double %117, %116
  %119 = fadd double %114, %118
  %120 = fsub double %119, %114
  %121 = fsub double %118, %120
  %122 = fmul double %104, %119
  %123 = fneg double %122
  %124 = tail call double @llvm.fma.f64(double %104, double %119, double %123)
  %125 = tail call double @llvm.fma.f64(double %104, double %121, double %124)
  %126 = tail call double @llvm.fma.f64(double %106, double %119, double %125)
  %127 = fadd double %122, %126
  %128 = fsub double %127, %122
  %129 = fsub double %126, %128
  %130 = fadd double %97, %127
  %131 = fsub double %130, %97
  %132 = fsub double %127, %131
  %133 = fadd double %98, %129
  %134 = fadd double %133, %132
  %135 = fadd double %130, %134
  %136 = fsub double %135, %130
  %137 = fsub double %134, %136
  %138 = fadd double %94, %135
  %139 = fsub double %138, %94
  %140 = fsub double %138, %139
  %141 = fsub double %94, %140
  %142 = fsub double %135, %139
  %143 = fadd double %142, %141
  %144 = fadd double %96, %137
  %145 = fsub double %144, %96
  %146 = fsub double %144, %145
  %147 = fsub double %96, %146
  %148 = fsub double %137, %145
  %149 = fadd double %148, %147
  %150 = fadd double %144, %143
  %151 = fadd double %138, %150
  %152 = fsub double %151, %138
  %153 = fsub double %150, %152
  %154 = fadd double %149, %153
  %155 = fadd double %151, %154
  %156 = fsub double %155, %151
  %157 = fsub double %154, %156
  %158 = fmul double %38, %155
  %159 = fneg double %158
  %160 = tail call double @llvm.fma.f64(double %38, double %155, double %159)
  %161 = tail call double @llvm.fma.f64(double %38, double %157, double %160)
  %162 = fadd double %158, %161
  %163 = fsub double %162, %158
  %164 = fsub double %161, %163
  %165 = tail call double @llvm.fabs.f64(double %158) #3
  %166 = fcmp oeq double %165, 0x7FF0000000000000
  %167 = select i1 %166, double %158, double %162
  %168 = tail call double @llvm.fabs.f64(double %167) #3
  %169 = fcmp oeq double %168, 0x7FF0000000000000
  %170 = select i1 %169, double 0.000000e+00, double %164
  %171 = fmul double %167, 0x3FF71547652B82FE
  %172 = tail call double @llvm.rint.f64(double %171)
  %173 = fneg double %172
  %174 = tail call double @llvm.fma.f64(double %173, double 0x3FE62E42FEFA39EF, double %167)
  %175 = tail call double @llvm.fma.f64(double %173, double 0x3C7ABC9E3B39803F, double %174)
  %176 = tail call double @llvm.fma.f64(double %175, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %177 = tail call double @llvm.fma.f64(double %175, double %176, double 0x3EC71DEE623FDE64)
  %178 = tail call double @llvm.fma.f64(double %175, double %177, double 0x3EFA01997C89E6B0)
  %179 = tail call double @llvm.fma.f64(double %175, double %178, double 0x3F2A01A014761F6E)
  %180 = tail call double @llvm.fma.f64(double %175, double %179, double 0x3F56C16C1852B7B0)
  %181 = tail call double @llvm.fma.f64(double %175, double %180, double 0x3F81111111122322)
  %182 = tail call double @llvm.fma.f64(double %175, double %181, double 0x3FA55555555502A1)
  %183 = tail call double @llvm.fma.f64(double %175, double %182, double 0x3FC5555555555511)
  %184 = tail call double @llvm.fma.f64(double %175, double %183, double 0x3FE000000000000B)
  %185 = tail call double @llvm.fma.f64(double %175, double %184, double 1.000000e+00)
  %186 = tail call double @llvm.fma.f64(double %175, double %185, double 1.000000e+00)
  %187 = fptosi double %172 to i32
  %188 = tail call double @llvm.amdgcn.ldexp.f64(double %186, i32 %187)
  %189 = fcmp ogt double %167, 1.024000e+03
  %190 = select i1 %189, double 0x7FF0000000000000, double %188
  %191 = fcmp olt double %167, -1.075000e+03
  %192 = select i1 %191, double 0.000000e+00, double %190
  %193 = tail call double @llvm.fma.f64(double %192, double %170, double %192)
  %194 = tail call double @llvm.fabs.f64(double %192) #3
  %195 = fcmp oeq double %194, 0x7FF0000000000000
  %196 = select i1 %195, double %192, double %193
  %197 = tail call double @llvm.fabs.f64(double %38)
  %198 = tail call double @llvm.trunc.f64(double %197)
  %199 = fcmp oeq double %197, %198
  %200 = zext i1 %199 to i32
  %201 = fmul double %198, 5.000000e-01
  %202 = tail call double @llvm.amdgcn.fract.f64(double %201)
  %203 = tail call i1 @llvm.amdgcn.class.f64(double %201, i32 516)
  %204 = select i1 %203, double 0.000000e+00, double %202
  %205 = fcmp oeq double %204, 0.000000e+00
  %206 = and i1 %199, %205
  %207 = zext i1 %206 to i32
  %208 = add nuw nsw i32 %207, %200
  %209 = icmp eq i32 %208, 1
  %210 = fcmp olt double %36, 0.000000e+00
  %211 = and i1 %210, %209
  %212 = select i1 %211, double -0.000000e+00, double 0.000000e+00
  %213 = tail call double @llvm.copysign.f64(double %196, double %212)
  %214 = fcmp uge double %36, 0.000000e+00
  %215 = icmp ne i32 %208, 0
  %216 = select i1 %214, i1 true, i1 %215
  %217 = select i1 %216, double %213, double 0x7FF8000000000000
  %218 = fcmp oeq double %197, 0x7FF0000000000000
  %219 = fcmp oeq double %39, 1.000000e+00
  %220 = fadd double %39, -1.000000e+00
  %221 = bitcast double %38 to <2 x i32>
  %222 = extractelement <2 x i32> %221, i64 1
  %223 = bitcast double %220 to <2 x i32>
  %224 = extractelement <2 x i32> %223, i64 1
  %225 = xor i32 %224, %222
  %226 = icmp sgt i32 %225, -1
  %227 = select i1 %226, double 0x7FF0000000000000, double 0.000000e+00
  %228 = select i1 %219, double %39, double %227
  %229 = select i1 %218, double %228, double %217
  %230 = fcmp oeq double %39, 0x7FF0000000000000
  %231 = fcmp oeq double %36, 0.000000e+00
  %232 = or i1 %231, %230
  %233 = fcmp olt double %38, 0.000000e+00
  %234 = xor i1 %231, %233
  %235 = select i1 %234, double 0.000000e+00, double 0x7FF0000000000000
  %236 = select i1 %209, double %36, double 0.000000e+00
  %237 = tail call double @llvm.copysign.f64(double %235, double %236)
  %238 = select i1 %232, double %237, double %229
  %239 = fcmp uno double %36, %38
  %240 = select i1 %239, double 0x7FF8000000000000, double %238
  %241 = fcmp oeq double %36, 1.000000e+00
  %242 = fcmp oeq double %38, 0.000000e+00
  %243 = or i1 %241, %242
  %244 = select i1 %243, double 1.000000e+00, double %240
  %245 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  store double %244, double addrspace(1)* %245, align 8, !tbaa !16
  br label %246

246:                                              ; preds = %33, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.trunc.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.fract.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.frexp.mant.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.frexp.exp.i32.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
