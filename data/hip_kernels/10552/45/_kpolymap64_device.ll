; ModuleID = '../data/hip_kernels/10552/45/main.cu'
source_filename = "../data/hip_kernels/10552/45/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11_kpolymap64iPddd(i32 %0, double addrspace(1)* nocapture %1, double %2, double %3) local_unnamed_addr #0 {
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
  %15 = mul i32 %6, %11
  %16 = add i32 %15, %5
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %18, label %239

18:                                               ; preds = %4
  %19 = tail call double @llvm.fabs.f64(double %3)
  %20 = tail call double @llvm.trunc.f64(double %19)
  %21 = fcmp oeq double %19, %20
  %22 = zext i1 %21 to i32
  %23 = fmul double %20, 5.000000e-01
  %24 = tail call double @llvm.amdgcn.fract.f64(double %23)
  %25 = tail call i1 @llvm.amdgcn.class.f64(double %23, i32 516)
  %26 = select i1 %25, double 0.000000e+00, double %24
  %27 = fcmp oeq double %26, 0.000000e+00
  %28 = and i1 %21, %27
  %29 = zext i1 %28 to i32
  %30 = add nuw nsw i32 %29, %22
  %31 = icmp eq i32 %30, 1
  %32 = icmp ne i32 %30, 0
  %33 = fcmp oeq double %19, 0x7FF0000000000000
  %34 = bitcast double %3 to <2 x i32>
  %35 = extractelement <2 x i32> %34, i64 1
  %36 = fcmp olt double %3, 0.000000e+00
  %37 = fcmp oeq double %3, 0.000000e+00
  %38 = udiv i32 %14, %11
  %39 = mul i32 %38, %11
  %40 = icmp ugt i32 %14, %39
  %41 = zext i1 %40 to i32
  %42 = add i32 %38, %41
  %43 = mul i32 %42, %11
  br label %44

44:                                               ; preds = %18, %44
  %45 = phi i32 [ %16, %18 ], [ %237, %44 ]
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !16
  %49 = fadd contract double %48, %2
  %50 = tail call double @llvm.fabs.f64(double %49)
  %51 = tail call double @llvm.amdgcn.frexp.mant.f64(double %50)
  %52 = fcmp olt double %51, 0x3FE5555555555555
  %53 = zext i1 %52 to i32
  %54 = tail call double @llvm.amdgcn.ldexp.f64(double %51, i32 %53)
  %55 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %50)
  %56 = sub nsw i32 %55, %53
  %57 = fadd double %54, -1.000000e+00
  %58 = fadd double %54, 1.000000e+00
  %59 = fadd double %58, -1.000000e+00
  %60 = fsub double %54, %59
  %61 = tail call double @llvm.amdgcn.rcp.f64(double %58)
  %62 = fneg double %58
  %63 = tail call double @llvm.fma.f64(double %62, double %61, double 1.000000e+00)
  %64 = tail call double @llvm.fma.f64(double %63, double %61, double %61)
  %65 = tail call double @llvm.fma.f64(double %62, double %64, double 1.000000e+00)
  %66 = tail call double @llvm.fma.f64(double %65, double %64, double %64)
  %67 = fmul double %57, %66
  %68 = fmul double %58, %67
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %67, double %58, double %69)
  %71 = tail call double @llvm.fma.f64(double %67, double %60, double %70)
  %72 = fadd double %68, %71
  %73 = fsub double %72, %68
  %74 = fsub double %71, %73
  %75 = fsub double %57, %72
  %76 = fsub double %57, %75
  %77 = fsub double %76, %72
  %78 = fsub double %77, %74
  %79 = fadd double %75, %78
  %80 = fmul double %66, %79
  %81 = fadd double %67, %80
  %82 = fsub double %81, %67
  %83 = fsub double %80, %82
  %84 = fmul double %81, %81
  %85 = fneg double %84
  %86 = tail call double @llvm.fma.f64(double %81, double %81, double %85)
  %87 = fmul double %83, 2.000000e+00
  %88 = tail call double @llvm.fma.f64(double %81, double %87, double %86)
  %89 = fadd double %84, %88
  %90 = fsub double %89, %84
  %91 = fsub double %88, %90
  %92 = tail call double @llvm.fma.f64(double %89, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %93 = tail call double @llvm.fma.f64(double %89, double %92, double 0x3FBE25E43ABE935A)
  %94 = tail call double @llvm.fma.f64(double %89, double %93, double 0x3FC110EF47E6C9C2)
  %95 = tail call double @llvm.fma.f64(double %89, double %94, double 0x3FC3B13BCFA74449)
  %96 = tail call double @llvm.fma.f64(double %89, double %95, double 0x3FC745D171BF3C30)
  %97 = tail call double @llvm.fma.f64(double %89, double %96, double 0x3FCC71C71C7792CE)
  %98 = tail call double @llvm.fma.f64(double %89, double %97, double 0x3FD24924924920DA)
  %99 = tail call double @llvm.fma.f64(double %89, double %98, double 0x3FD999999999999C)
  %100 = sitofp i32 %56 to double
  %101 = fmul double %100, 0x3FE62E42FEFA39EF
  %102 = fneg double %101
  %103 = tail call double @llvm.fma.f64(double %100, double 0x3FE62E42FEFA39EF, double %102)
  %104 = tail call double @llvm.fma.f64(double %100, double 0x3C7ABC9E3B39803F, double %103)
  %105 = fadd double %101, %104
  %106 = fsub double %105, %101
  %107 = fsub double %104, %106
  %108 = tail call double @llvm.amdgcn.ldexp.f64(double %81, i32 1)
  %109 = tail call double @llvm.amdgcn.ldexp.f64(double %83, i32 1)
  %110 = fmul double %81, %89
  %111 = fneg double %110
  %112 = tail call double @llvm.fma.f64(double %89, double %81, double %111)
  %113 = tail call double @llvm.fma.f64(double %89, double %83, double %112)
  %114 = tail call double @llvm.fma.f64(double %91, double %81, double %113)
  %115 = fadd double %110, %114
  %116 = fsub double %115, %110
  %117 = fsub double %114, %116
  %118 = fmul double %89, %99
  %119 = fneg double %118
  %120 = tail call double @llvm.fma.f64(double %89, double %99, double %119)
  %121 = tail call double @llvm.fma.f64(double %91, double %99, double %120)
  %122 = fadd double %118, %121
  %123 = fsub double %122, %118
  %124 = fsub double %121, %123
  %125 = fadd double %122, 0x3FE5555555555555
  %126 = fadd double %125, 0xBFE5555555555555
  %127 = fsub double %122, %126
  %128 = fadd double %124, 0x3C8543B0D5DF274D
  %129 = fadd double %128, %127
  %130 = fadd double %125, %129
  %131 = fsub double %130, %125
  %132 = fsub double %129, %131
  %133 = fmul double %115, %130
  %134 = fneg double %133
  %135 = tail call double @llvm.fma.f64(double %115, double %130, double %134)
  %136 = tail call double @llvm.fma.f64(double %115, double %132, double %135)
  %137 = tail call double @llvm.fma.f64(double %117, double %130, double %136)
  %138 = fadd double %133, %137
  %139 = fsub double %138, %133
  %140 = fsub double %137, %139
  %141 = fadd double %108, %138
  %142 = fsub double %141, %108
  %143 = fsub double %138, %142
  %144 = fadd double %109, %140
  %145 = fadd double %144, %143
  %146 = fadd double %141, %145
  %147 = fsub double %146, %141
  %148 = fsub double %145, %147
  %149 = fadd double %105, %146
  %150 = fsub double %149, %105
  %151 = fsub double %149, %150
  %152 = fsub double %105, %151
  %153 = fsub double %146, %150
  %154 = fadd double %153, %152
  %155 = fadd double %107, %148
  %156 = fsub double %155, %107
  %157 = fsub double %155, %156
  %158 = fsub double %107, %157
  %159 = fsub double %148, %156
  %160 = fadd double %159, %158
  %161 = fadd double %155, %154
  %162 = fadd double %149, %161
  %163 = fsub double %162, %149
  %164 = fsub double %161, %163
  %165 = fadd double %160, %164
  %166 = fadd double %162, %165
  %167 = fsub double %166, %162
  %168 = fsub double %165, %167
  %169 = fmul double %166, %3
  %170 = fneg double %169
  %171 = tail call double @llvm.fma.f64(double %3, double %166, double %170)
  %172 = tail call double @llvm.fma.f64(double %3, double %168, double %171)
  %173 = fadd double %169, %172
  %174 = fsub double %173, %169
  %175 = fsub double %172, %174
  %176 = tail call double @llvm.fabs.f64(double %169) #3
  %177 = fcmp oeq double %176, 0x7FF0000000000000
  %178 = select i1 %177, double %169, double %173
  %179 = tail call double @llvm.fabs.f64(double %178) #3
  %180 = fcmp oeq double %179, 0x7FF0000000000000
  %181 = select i1 %180, double 0.000000e+00, double %175
  %182 = fmul double %178, 0x3FF71547652B82FE
  %183 = tail call double @llvm.rint.f64(double %182)
  %184 = fneg double %183
  %185 = tail call double @llvm.fma.f64(double %184, double 0x3FE62E42FEFA39EF, double %178)
  %186 = tail call double @llvm.fma.f64(double %184, double 0x3C7ABC9E3B39803F, double %185)
  %187 = tail call double @llvm.fma.f64(double %186, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %188 = tail call double @llvm.fma.f64(double %186, double %187, double 0x3EC71DEE623FDE64)
  %189 = tail call double @llvm.fma.f64(double %186, double %188, double 0x3EFA01997C89E6B0)
  %190 = tail call double @llvm.fma.f64(double %186, double %189, double 0x3F2A01A014761F6E)
  %191 = tail call double @llvm.fma.f64(double %186, double %190, double 0x3F56C16C1852B7B0)
  %192 = tail call double @llvm.fma.f64(double %186, double %191, double 0x3F81111111122322)
  %193 = tail call double @llvm.fma.f64(double %186, double %192, double 0x3FA55555555502A1)
  %194 = tail call double @llvm.fma.f64(double %186, double %193, double 0x3FC5555555555511)
  %195 = tail call double @llvm.fma.f64(double %186, double %194, double 0x3FE000000000000B)
  %196 = tail call double @llvm.fma.f64(double %186, double %195, double 1.000000e+00)
  %197 = tail call double @llvm.fma.f64(double %186, double %196, double 1.000000e+00)
  %198 = fptosi double %183 to i32
  %199 = tail call double @llvm.amdgcn.ldexp.f64(double %197, i32 %198)
  %200 = fcmp ogt double %178, 1.024000e+03
  %201 = select i1 %200, double 0x7FF0000000000000, double %199
  %202 = fcmp olt double %178, -1.075000e+03
  %203 = select i1 %202, double 0.000000e+00, double %201
  %204 = tail call double @llvm.fma.f64(double %203, double %181, double %203)
  %205 = tail call double @llvm.fabs.f64(double %203) #3
  %206 = fcmp oeq double %205, 0x7FF0000000000000
  %207 = select i1 %206, double %203, double %204
  %208 = fcmp olt double %49, 0.000000e+00
  %209 = and i1 %31, %208
  %210 = select i1 %209, double -0.000000e+00, double 0.000000e+00
  %211 = tail call double @llvm.copysign.f64(double %207, double %210)
  %212 = fcmp uge double %49, 0.000000e+00
  %213 = select i1 %212, i1 true, i1 %32
  %214 = select i1 %213, double %211, double 0x7FF8000000000000
  %215 = fcmp oeq double %50, 1.000000e+00
  %216 = fadd double %50, -1.000000e+00
  %217 = bitcast double %216 to <2 x i32>
  %218 = extractelement <2 x i32> %217, i64 1
  %219 = xor i32 %218, %35
  %220 = icmp sgt i32 %219, -1
  %221 = select i1 %220, double 0x7FF0000000000000, double 0.000000e+00
  %222 = select i1 %215, double %50, double %221
  %223 = select i1 %33, double %222, double %214
  %224 = fcmp oeq double %50, 0x7FF0000000000000
  %225 = fcmp oeq double %49, 0.000000e+00
  %226 = or i1 %225, %224
  %227 = xor i1 %36, %225
  %228 = select i1 %227, double 0.000000e+00, double 0x7FF0000000000000
  %229 = select i1 %31, double %49, double 0.000000e+00
  %230 = tail call double @llvm.copysign.f64(double %228, double %229)
  %231 = select i1 %226, double %230, double %223
  %232 = fcmp uno double %49, %3
  %233 = select i1 %232, double 0x7FF8000000000000, double %231
  %234 = fcmp oeq double %49, 1.000000e+00
  %235 = or i1 %37, %234
  %236 = select i1 %235, double 1.000000e+00, double %233
  store double %236, double addrspace(1)* %47, align 8, !tbaa !16
  %237 = add i32 %43, %45
  %238 = icmp slt i32 %237, %0
  br i1 %238, label %44, label %239, !llvm.loop !20

239:                                              ; preds = %44, %4
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
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
