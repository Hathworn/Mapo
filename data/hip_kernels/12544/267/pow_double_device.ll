; ModuleID = '../data/hip_kernels/12544/267/main.cu'
source_filename = "../data/hip_kernels/12544/267/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10pow_doubleiiPdidS_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, i32 %3, double %4, double addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = mul i32 %7, %12
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %18 = add i32 %16, %17
  %19 = icmp slt i32 %18, %0
  br i1 %19, label %20, label %46

20:                                               ; preds = %6
  %21 = tail call double @llvm.fabs.f64(double %4)
  %22 = tail call double @llvm.trunc.f64(double %21)
  %23 = fcmp oeq double %21, %22
  %24 = zext i1 %23 to i32
  %25 = fmul double %22, 5.000000e-01
  %26 = tail call double @llvm.amdgcn.fract.f64(double %25)
  %27 = tail call i1 @llvm.amdgcn.class.f64(double %25, i32 516)
  %28 = select i1 %27, double 0.000000e+00, double %26
  %29 = fcmp oeq double %28, 0.000000e+00
  %30 = and i1 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add nuw nsw i32 %31, %24
  %33 = icmp eq i32 %32, 1
  %34 = icmp ne i32 %32, 0
  %35 = fcmp oeq double %21, 0x7FF0000000000000
  %36 = bitcast double %4 to <2 x i32>
  %37 = extractelement <2 x i32> %36, i64 1
  %38 = fcmp olt double %4, 0.000000e+00
  %39 = fcmp oeq double %4, 0.000000e+00
  %40 = udiv i32 %15, %12
  %41 = mul i32 %40, %12
  %42 = icmp ugt i32 %15, %41
  %43 = zext i1 %42 to i32
  %44 = add i32 %40, %43
  %45 = mul i32 %44, %12
  br label %47

46:                                               ; preds = %245, %6
  ret void

47:                                               ; preds = %20, %245
  %48 = phi i32 [ %18, %20 ], [ %246, %245 ]
  %49 = icmp slt i32 %48, %1
  br i1 %49, label %245, label %50

50:                                               ; preds = %47
  %51 = srem i32 %48, %3
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %245

53:                                               ; preds = %50
  %54 = sext i32 %48 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %2, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !16
  %57 = tail call double @llvm.fabs.f64(double %56)
  %58 = tail call double @llvm.amdgcn.frexp.mant.f64(double %57)
  %59 = fcmp olt double %58, 0x3FE5555555555555
  %60 = zext i1 %59 to i32
  %61 = tail call double @llvm.amdgcn.ldexp.f64(double %58, i32 %60)
  %62 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %57)
  %63 = sub nsw i32 %62, %60
  %64 = fadd double %61, -1.000000e+00
  %65 = fadd double %61, 1.000000e+00
  %66 = fadd double %65, -1.000000e+00
  %67 = fsub double %61, %66
  %68 = tail call double @llvm.amdgcn.rcp.f64(double %65)
  %69 = fneg double %65
  %70 = tail call double @llvm.fma.f64(double %69, double %68, double 1.000000e+00)
  %71 = tail call double @llvm.fma.f64(double %70, double %68, double %68)
  %72 = tail call double @llvm.fma.f64(double %69, double %71, double 1.000000e+00)
  %73 = tail call double @llvm.fma.f64(double %72, double %71, double %71)
  %74 = fmul double %64, %73
  %75 = fmul double %65, %74
  %76 = fneg double %75
  %77 = tail call double @llvm.fma.f64(double %74, double %65, double %76)
  %78 = tail call double @llvm.fma.f64(double %74, double %67, double %77)
  %79 = fadd double %75, %78
  %80 = fsub double %79, %75
  %81 = fsub double %78, %80
  %82 = fsub double %64, %79
  %83 = fsub double %64, %82
  %84 = fsub double %83, %79
  %85 = fsub double %84, %81
  %86 = fadd double %82, %85
  %87 = fmul double %73, %86
  %88 = fadd double %74, %87
  %89 = fsub double %88, %74
  %90 = fsub double %87, %89
  %91 = fmul double %88, %88
  %92 = fneg double %91
  %93 = tail call double @llvm.fma.f64(double %88, double %88, double %92)
  %94 = fmul double %90, 2.000000e+00
  %95 = tail call double @llvm.fma.f64(double %88, double %94, double %93)
  %96 = fadd double %91, %95
  %97 = fsub double %96, %91
  %98 = fsub double %95, %97
  %99 = tail call double @llvm.fma.f64(double %96, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %100 = tail call double @llvm.fma.f64(double %96, double %99, double 0x3FBE25E43ABE935A)
  %101 = tail call double @llvm.fma.f64(double %96, double %100, double 0x3FC110EF47E6C9C2)
  %102 = tail call double @llvm.fma.f64(double %96, double %101, double 0x3FC3B13BCFA74449)
  %103 = tail call double @llvm.fma.f64(double %96, double %102, double 0x3FC745D171BF3C30)
  %104 = tail call double @llvm.fma.f64(double %96, double %103, double 0x3FCC71C71C7792CE)
  %105 = tail call double @llvm.fma.f64(double %96, double %104, double 0x3FD24924924920DA)
  %106 = tail call double @llvm.fma.f64(double %96, double %105, double 0x3FD999999999999C)
  %107 = sitofp i32 %63 to double
  %108 = fmul double %107, 0x3FE62E42FEFA39EF
  %109 = fneg double %108
  %110 = tail call double @llvm.fma.f64(double %107, double 0x3FE62E42FEFA39EF, double %109)
  %111 = tail call double @llvm.fma.f64(double %107, double 0x3C7ABC9E3B39803F, double %110)
  %112 = fadd double %108, %111
  %113 = fsub double %112, %108
  %114 = fsub double %111, %113
  %115 = tail call double @llvm.amdgcn.ldexp.f64(double %88, i32 1)
  %116 = tail call double @llvm.amdgcn.ldexp.f64(double %90, i32 1)
  %117 = fmul double %88, %96
  %118 = fneg double %117
  %119 = tail call double @llvm.fma.f64(double %96, double %88, double %118)
  %120 = tail call double @llvm.fma.f64(double %96, double %90, double %119)
  %121 = tail call double @llvm.fma.f64(double %98, double %88, double %120)
  %122 = fadd double %117, %121
  %123 = fsub double %122, %117
  %124 = fsub double %121, %123
  %125 = fmul double %96, %106
  %126 = fneg double %125
  %127 = tail call double @llvm.fma.f64(double %96, double %106, double %126)
  %128 = tail call double @llvm.fma.f64(double %98, double %106, double %127)
  %129 = fadd double %125, %128
  %130 = fsub double %129, %125
  %131 = fsub double %128, %130
  %132 = fadd double %129, 0x3FE5555555555555
  %133 = fadd double %132, 0xBFE5555555555555
  %134 = fsub double %129, %133
  %135 = fadd double %131, 0x3C8543B0D5DF274D
  %136 = fadd double %135, %134
  %137 = fadd double %132, %136
  %138 = fsub double %137, %132
  %139 = fsub double %136, %138
  %140 = fmul double %122, %137
  %141 = fneg double %140
  %142 = tail call double @llvm.fma.f64(double %122, double %137, double %141)
  %143 = tail call double @llvm.fma.f64(double %122, double %139, double %142)
  %144 = tail call double @llvm.fma.f64(double %124, double %137, double %143)
  %145 = fadd double %140, %144
  %146 = fsub double %145, %140
  %147 = fsub double %144, %146
  %148 = fadd double %115, %145
  %149 = fsub double %148, %115
  %150 = fsub double %145, %149
  %151 = fadd double %116, %147
  %152 = fadd double %151, %150
  %153 = fadd double %148, %152
  %154 = fsub double %153, %148
  %155 = fsub double %152, %154
  %156 = fadd double %112, %153
  %157 = fsub double %156, %112
  %158 = fsub double %156, %157
  %159 = fsub double %112, %158
  %160 = fsub double %153, %157
  %161 = fadd double %160, %159
  %162 = fadd double %114, %155
  %163 = fsub double %162, %114
  %164 = fsub double %162, %163
  %165 = fsub double %114, %164
  %166 = fsub double %155, %163
  %167 = fadd double %166, %165
  %168 = fadd double %162, %161
  %169 = fadd double %156, %168
  %170 = fsub double %169, %156
  %171 = fsub double %168, %170
  %172 = fadd double %167, %171
  %173 = fadd double %169, %172
  %174 = fsub double %173, %169
  %175 = fsub double %172, %174
  %176 = fmul double %173, %4
  %177 = fneg double %176
  %178 = tail call double @llvm.fma.f64(double %4, double %173, double %177)
  %179 = tail call double @llvm.fma.f64(double %4, double %175, double %178)
  %180 = fadd double %176, %179
  %181 = fsub double %180, %176
  %182 = fsub double %179, %181
  %183 = tail call double @llvm.fabs.f64(double %176) #3
  %184 = fcmp oeq double %183, 0x7FF0000000000000
  %185 = select i1 %184, double %176, double %180
  %186 = tail call double @llvm.fabs.f64(double %185) #3
  %187 = fcmp oeq double %186, 0x7FF0000000000000
  %188 = select i1 %187, double 0.000000e+00, double %182
  %189 = fmul double %185, 0x3FF71547652B82FE
  %190 = tail call double @llvm.rint.f64(double %189)
  %191 = fneg double %190
  %192 = tail call double @llvm.fma.f64(double %191, double 0x3FE62E42FEFA39EF, double %185)
  %193 = tail call double @llvm.fma.f64(double %191, double 0x3C7ABC9E3B39803F, double %192)
  %194 = tail call double @llvm.fma.f64(double %193, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %195 = tail call double @llvm.fma.f64(double %193, double %194, double 0x3EC71DEE623FDE64)
  %196 = tail call double @llvm.fma.f64(double %193, double %195, double 0x3EFA01997C89E6B0)
  %197 = tail call double @llvm.fma.f64(double %193, double %196, double 0x3F2A01A014761F6E)
  %198 = tail call double @llvm.fma.f64(double %193, double %197, double 0x3F56C16C1852B7B0)
  %199 = tail call double @llvm.fma.f64(double %193, double %198, double 0x3F81111111122322)
  %200 = tail call double @llvm.fma.f64(double %193, double %199, double 0x3FA55555555502A1)
  %201 = tail call double @llvm.fma.f64(double %193, double %200, double 0x3FC5555555555511)
  %202 = tail call double @llvm.fma.f64(double %193, double %201, double 0x3FE000000000000B)
  %203 = tail call double @llvm.fma.f64(double %193, double %202, double 1.000000e+00)
  %204 = tail call double @llvm.fma.f64(double %193, double %203, double 1.000000e+00)
  %205 = fptosi double %190 to i32
  %206 = tail call double @llvm.amdgcn.ldexp.f64(double %204, i32 %205)
  %207 = fcmp ogt double %185, 1.024000e+03
  %208 = select i1 %207, double 0x7FF0000000000000, double %206
  %209 = fcmp olt double %185, -1.075000e+03
  %210 = select i1 %209, double 0.000000e+00, double %208
  %211 = tail call double @llvm.fma.f64(double %210, double %188, double %210)
  %212 = tail call double @llvm.fabs.f64(double %210) #3
  %213 = fcmp oeq double %212, 0x7FF0000000000000
  %214 = select i1 %213, double %210, double %211
  %215 = fcmp olt double %56, 0.000000e+00
  %216 = and i1 %33, %215
  %217 = select i1 %216, double -0.000000e+00, double 0.000000e+00
  %218 = tail call double @llvm.copysign.f64(double %214, double %217)
  %219 = fcmp uge double %56, 0.000000e+00
  %220 = select i1 %219, i1 true, i1 %34
  %221 = select i1 %220, double %218, double 0x7FF8000000000000
  %222 = fcmp oeq double %57, 1.000000e+00
  %223 = fadd double %57, -1.000000e+00
  %224 = bitcast double %223 to <2 x i32>
  %225 = extractelement <2 x i32> %224, i64 1
  %226 = xor i32 %225, %37
  %227 = icmp sgt i32 %226, -1
  %228 = select i1 %227, double 0x7FF0000000000000, double 0.000000e+00
  %229 = select i1 %222, double %57, double %228
  %230 = select i1 %35, double %229, double %221
  %231 = fcmp oeq double %57, 0x7FF0000000000000
  %232 = fcmp oeq double %56, 0.000000e+00
  %233 = or i1 %232, %231
  %234 = xor i1 %38, %232
  %235 = select i1 %234, double 0.000000e+00, double 0x7FF0000000000000
  %236 = select i1 %33, double %56, double 0.000000e+00
  %237 = tail call double @llvm.copysign.f64(double %235, double %236)
  %238 = select i1 %233, double %237, double %230
  %239 = fcmp uno double %56, %4
  %240 = select i1 %239, double 0x7FF8000000000000, double %238
  %241 = fcmp oeq double %56, 1.000000e+00
  %242 = or i1 %39, %241
  %243 = select i1 %242, double 1.000000e+00, double %240
  %244 = getelementptr inbounds double, double addrspace(1)* %5, i64 %54
  store double %243, double addrspace(1)* %244, align 8, !tbaa !16
  br label %245

245:                                              ; preds = %47, %50, %53
  %246 = add i32 %45, %48
  %247 = icmp slt i32 %246, %0
  br i1 %247, label %47, label %46, !llvm.loop !20
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
