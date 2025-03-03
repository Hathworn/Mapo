; ModuleID = '../data/hip_kernels/5755/1/main.cu'
source_filename = "../data/hip_kernels/5755/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10normKernelPdiS_i(double addrspace(1)* nocapture readonly %0, i32 %1, double addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %7 = bitcast i8 addrspace(4)* %6 to i32 addrspace(4)*
  %8 = load i32, i32 addrspace(4)* %7, align 4, !tbaa !4
  %9 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !13, !invariant.load !14
  %12 = zext i16 %11 to i32
  %13 = udiv i32 %8, %12
  %14 = mul i32 %13, %12
  %15 = icmp ugt i32 %8, %14
  %16 = zext i1 %15 to i32
  %17 = add i32 %13, %16
  %18 = freeze i32 %1
  %19 = freeze i32 %17
  %20 = sdiv i32 %18, %19
  %21 = mul i32 %20, %19
  %22 = sub i32 %18, %21
  %23 = icmp ne i32 %22, 0
  %24 = zext i1 %23 to i32
  %25 = add nsw i32 %20, %24
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %27 = mul i32 %25, %26
  %28 = add nsw i32 %27, %25
  %29 = tail call i32 @llvm.smin.i32(i32 %28, i32 %1)
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %43

31:                                               ; preds = %4
  %32 = icmp sgt i32 %3, 0
  br label %33

33:                                               ; preds = %31, %44
  %34 = phi i32 [ %27, %31 ], [ %70, %44 ]
  br i1 %32, label %39, label %35

35:                                               ; preds = %33
  %36 = sext i32 %34 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !15
  br label %44

39:                                               ; preds = %33
  %40 = mul nsw i32 %34, %3
  %41 = sext i32 %34 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %2, i64 %41
  br label %72

43:                                               ; preds = %44, %4
  ret void

44:                                               ; preds = %72, %35
  %45 = phi i64 [ %36, %35 ], [ %41, %72 ]
  %46 = phi double [ %38, %35 ], [ %244, %72 ]
  %47 = getelementptr inbounds double, double addrspace(1)* %2, i64 %45
  %48 = fcmp olt double %46, 0x1000000000000000
  %49 = select i1 %48, double 0x4FF0000000000000, double 1.000000e+00
  %50 = fmul double %46, %49
  %51 = tail call double @llvm.amdgcn.rsq.f64(double %50)
  %52 = fmul double %50, %51
  %53 = fmul double %51, 5.000000e-01
  %54 = fneg double %53
  %55 = tail call double @llvm.fma.f64(double %54, double %52, double 5.000000e-01)
  %56 = tail call double @llvm.fma.f64(double %53, double %55, double %53)
  %57 = tail call double @llvm.fma.f64(double %52, double %55, double %52)
  %58 = fneg double %57
  %59 = tail call double @llvm.fma.f64(double %58, double %57, double %50)
  %60 = tail call double @llvm.fma.f64(double %59, double %56, double %57)
  %61 = fneg double %60
  %62 = tail call double @llvm.fma.f64(double %61, double %60, double %50)
  %63 = tail call double @llvm.fma.f64(double %62, double %56, double %60)
  %64 = select i1 %48, double 0x37F0000000000000, double 1.000000e+00
  %65 = fmul double %64, %63
  %66 = fcmp oeq double %50, 0.000000e+00
  %67 = fcmp oeq double %50, 0x7FF0000000000000
  %68 = or i1 %66, %67
  %69 = select i1 %68, double %50, double %65
  store double %69, double addrspace(1)* %47, align 8, !tbaa !15
  %70 = add nsw i32 %34, 1
  %71 = icmp slt i32 %70, %29
  br i1 %71, label %33, label %43, !llvm.loop !19

72:                                               ; preds = %39, %72
  %73 = phi i32 [ 0, %39 ], [ %245, %72 ]
  %74 = add nsw i32 %73, %40
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !15
  %78 = tail call double @llvm.fabs.f64(double %77)
  %79 = tail call double @llvm.amdgcn.frexp.mant.f64(double %78)
  %80 = fcmp olt double %79, 0x3FE5555555555555
  %81 = zext i1 %80 to i32
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %79, i32 %81)
  %83 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %78)
  %84 = sub nsw i32 %83, %81
  %85 = fadd double %82, -1.000000e+00
  %86 = fadd double %82, 1.000000e+00
  %87 = fadd double %86, -1.000000e+00
  %88 = fsub double %82, %87
  %89 = tail call double @llvm.amdgcn.rcp.f64(double %86)
  %90 = fneg double %86
  %91 = tail call double @llvm.fma.f64(double %90, double %89, double 1.000000e+00)
  %92 = tail call double @llvm.fma.f64(double %91, double %89, double %89)
  %93 = tail call double @llvm.fma.f64(double %90, double %92, double 1.000000e+00)
  %94 = tail call double @llvm.fma.f64(double %93, double %92, double %92)
  %95 = fmul double %85, %94
  %96 = fmul double %86, %95
  %97 = fneg double %96
  %98 = tail call double @llvm.fma.f64(double %95, double %86, double %97)
  %99 = tail call double @llvm.fma.f64(double %95, double %88, double %98)
  %100 = fadd double %96, %99
  %101 = fsub double %100, %96
  %102 = fsub double %99, %101
  %103 = fsub double %85, %100
  %104 = fsub double %85, %103
  %105 = fsub double %104, %100
  %106 = fsub double %105, %102
  %107 = fadd double %103, %106
  %108 = fmul double %94, %107
  %109 = fadd double %95, %108
  %110 = fsub double %109, %95
  %111 = fsub double %108, %110
  %112 = fmul double %109, %109
  %113 = fneg double %112
  %114 = tail call double @llvm.fma.f64(double %109, double %109, double %113)
  %115 = fmul double %111, 2.000000e+00
  %116 = tail call double @llvm.fma.f64(double %109, double %115, double %114)
  %117 = fadd double %112, %116
  %118 = fsub double %117, %112
  %119 = fsub double %116, %118
  %120 = tail call double @llvm.fma.f64(double %117, double 0x3FBDEE674222DE17, double 0x3FBA6564968915A9)
  %121 = tail call double @llvm.fma.f64(double %117, double %120, double 0x3FBE25E43ABE935A)
  %122 = tail call double @llvm.fma.f64(double %117, double %121, double 0x3FC110EF47E6C9C2)
  %123 = tail call double @llvm.fma.f64(double %117, double %122, double 0x3FC3B13BCFA74449)
  %124 = tail call double @llvm.fma.f64(double %117, double %123, double 0x3FC745D171BF3C30)
  %125 = tail call double @llvm.fma.f64(double %117, double %124, double 0x3FCC71C71C7792CE)
  %126 = tail call double @llvm.fma.f64(double %117, double %125, double 0x3FD24924924920DA)
  %127 = tail call double @llvm.fma.f64(double %117, double %126, double 0x3FD999999999999C)
  %128 = sitofp i32 %84 to double
  %129 = fmul double %128, 0x3FE62E42FEFA39EF
  %130 = fneg double %129
  %131 = tail call double @llvm.fma.f64(double %128, double 0x3FE62E42FEFA39EF, double %130)
  %132 = tail call double @llvm.fma.f64(double %128, double 0x3C7ABC9E3B39803F, double %131)
  %133 = fadd double %129, %132
  %134 = fsub double %133, %129
  %135 = fsub double %132, %134
  %136 = tail call double @llvm.amdgcn.ldexp.f64(double %109, i32 1)
  %137 = tail call double @llvm.amdgcn.ldexp.f64(double %111, i32 1)
  %138 = fmul double %109, %117
  %139 = fneg double %138
  %140 = tail call double @llvm.fma.f64(double %117, double %109, double %139)
  %141 = tail call double @llvm.fma.f64(double %117, double %111, double %140)
  %142 = tail call double @llvm.fma.f64(double %119, double %109, double %141)
  %143 = fadd double %138, %142
  %144 = fsub double %143, %138
  %145 = fsub double %142, %144
  %146 = fmul double %117, %127
  %147 = fneg double %146
  %148 = tail call double @llvm.fma.f64(double %117, double %127, double %147)
  %149 = tail call double @llvm.fma.f64(double %119, double %127, double %148)
  %150 = fadd double %146, %149
  %151 = fsub double %150, %146
  %152 = fsub double %149, %151
  %153 = fadd double %150, 0x3FE5555555555555
  %154 = fadd double %153, 0xBFE5555555555555
  %155 = fsub double %150, %154
  %156 = fadd double %152, 0x3C8543B0D5DF274D
  %157 = fadd double %156, %155
  %158 = fadd double %153, %157
  %159 = fsub double %158, %153
  %160 = fsub double %157, %159
  %161 = fmul double %143, %158
  %162 = fneg double %161
  %163 = tail call double @llvm.fma.f64(double %143, double %158, double %162)
  %164 = tail call double @llvm.fma.f64(double %143, double %160, double %163)
  %165 = tail call double @llvm.fma.f64(double %145, double %158, double %164)
  %166 = fadd double %161, %165
  %167 = fsub double %166, %161
  %168 = fsub double %165, %167
  %169 = fadd double %136, %166
  %170 = fsub double %169, %136
  %171 = fsub double %166, %170
  %172 = fadd double %137, %168
  %173 = fadd double %172, %171
  %174 = fadd double %169, %173
  %175 = fsub double %174, %169
  %176 = fsub double %173, %175
  %177 = fadd double %133, %174
  %178 = fsub double %177, %133
  %179 = fsub double %177, %178
  %180 = fsub double %133, %179
  %181 = fsub double %174, %178
  %182 = fadd double %181, %180
  %183 = fadd double %135, %176
  %184 = fsub double %183, %135
  %185 = fsub double %183, %184
  %186 = fsub double %135, %185
  %187 = fsub double %176, %184
  %188 = fadd double %187, %186
  %189 = fadd double %183, %182
  %190 = fadd double %177, %189
  %191 = fsub double %190, %177
  %192 = fsub double %189, %191
  %193 = fadd double %188, %192
  %194 = fadd double %190, %193
  %195 = fsub double %194, %190
  %196 = fsub double %193, %195
  %197 = fmul double %194, 2.000000e+00
  %198 = fneg double %197
  %199 = tail call double @llvm.fma.f64(double %194, double 2.000000e+00, double %198)
  %200 = tail call double @llvm.fma.f64(double %196, double 2.000000e+00, double %199)
  %201 = fadd double %197, %200
  %202 = fsub double %201, %197
  %203 = fsub double %200, %202
  %204 = tail call double @llvm.fabs.f64(double %197) #4
  %205 = fcmp oeq double %204, 0x7FF0000000000000
  %206 = select i1 %205, double %197, double %201
  %207 = tail call double @llvm.fabs.f64(double %206) #4
  %208 = fcmp oeq double %207, 0x7FF0000000000000
  %209 = select i1 %208, double 0.000000e+00, double %203
  %210 = fmul double %206, 0x3FF71547652B82FE
  %211 = tail call double @llvm.rint.f64(double %210)
  %212 = fneg double %211
  %213 = tail call double @llvm.fma.f64(double %212, double 0x3FE62E42FEFA39EF, double %206)
  %214 = tail call double @llvm.fma.f64(double %212, double 0x3C7ABC9E3B39803F, double %213)
  %215 = tail call double @llvm.fma.f64(double %214, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %216 = tail call double @llvm.fma.f64(double %214, double %215, double 0x3EC71DEE623FDE64)
  %217 = tail call double @llvm.fma.f64(double %214, double %216, double 0x3EFA01997C89E6B0)
  %218 = tail call double @llvm.fma.f64(double %214, double %217, double 0x3F2A01A014761F6E)
  %219 = tail call double @llvm.fma.f64(double %214, double %218, double 0x3F56C16C1852B7B0)
  %220 = tail call double @llvm.fma.f64(double %214, double %219, double 0x3F81111111122322)
  %221 = tail call double @llvm.fma.f64(double %214, double %220, double 0x3FA55555555502A1)
  %222 = tail call double @llvm.fma.f64(double %214, double %221, double 0x3FC5555555555511)
  %223 = tail call double @llvm.fma.f64(double %214, double %222, double 0x3FE000000000000B)
  %224 = tail call double @llvm.fma.f64(double %214, double %223, double 1.000000e+00)
  %225 = tail call double @llvm.fma.f64(double %214, double %224, double 1.000000e+00)
  %226 = fptosi double %211 to i32
  %227 = tail call double @llvm.amdgcn.ldexp.f64(double %225, i32 %226)
  %228 = fcmp ogt double %206, 1.024000e+03
  %229 = select i1 %228, double 0x7FF0000000000000, double %227
  %230 = fcmp olt double %206, -1.075000e+03
  %231 = select i1 %230, double 0.000000e+00, double %229
  %232 = tail call double @llvm.fma.f64(double %231, double %209, double %231)
  %233 = tail call double @llvm.fabs.f64(double %231) #4
  %234 = fcmp oeq double %233, 0x7FF0000000000000
  %235 = select i1 %234, double %231, double %232
  %236 = tail call double @llvm.fabs.f64(double %235)
  %237 = fcmp oeq double %78, 0x7FF0000000000000
  %238 = fcmp oeq double %77, 0.000000e+00
  %239 = select i1 %237, double 0x7FF0000000000000, double %236
  %240 = select i1 %238, double 0.000000e+00, double %239
  %241 = fcmp uno double %77, 0.000000e+00
  %242 = select i1 %241, double 0x7FF8000000000000, double %240
  %243 = load double, double addrspace(1)* %42, align 8, !tbaa !15
  %244 = fadd contract double %243, %242
  store double %244, double addrspace(1)* %42, align 8, !tbaa !15
  %245 = add nuw nsw i32 %73, 1
  %246 = icmp eq i32 %245, %3
  br i1 %246, label %44, label %72, !llvm.loop !21
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

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
declare double @llvm.amdgcn.rsq.f64(double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"double", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.mustprogress"}
!21 = distinct !{!21, !20}
