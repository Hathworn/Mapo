; ModuleID = '../data/hip_kernels/5473/43/main.cu'
source_filename = "../data/hip_kernels/5473/43/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z21logistic_x_ent_kerneliPfS_S_S_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %10 = bitcast i8 addrspace(4)* %9 to i32 addrspace(4)*
  %11 = load i32, i32 addrspace(4)* %10, align 4, !tbaa !4
  %12 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !13, !invariant.load !14
  %15 = zext i16 %14 to i32
  %16 = udiv i32 %11, %15
  %17 = mul i32 %16, %15
  %18 = icmp ugt i32 %11, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %7
  %22 = add i32 %21, %6
  %23 = mul i32 %22, %15
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %25, %0
  br i1 %26, label %27, label %217

27:                                               ; preds = %5
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !14
  %31 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !14
  %33 = fneg contract float %30
  %34 = fpext float %33 to double
  %35 = fpext float %32 to double
  %36 = fadd contract double %35, 0x3E7AD7F29ABCAF48
  %37 = tail call double @llvm.amdgcn.frexp.mant.f64(double %36)
  %38 = fcmp olt double %37, 0x3FE5555555555555
  %39 = zext i1 %38 to i32
  %40 = tail call double @llvm.amdgcn.ldexp.f64(double %37, i32 %39)
  %41 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %36)
  %42 = sub nsw i32 %41, %39
  %43 = fadd double %40, -1.000000e+00
  %44 = fadd double %40, 1.000000e+00
  %45 = fadd double %44, -1.000000e+00
  %46 = fsub double %40, %45
  %47 = tail call double @llvm.amdgcn.rcp.f64(double %44)
  %48 = fneg double %44
  %49 = tail call double @llvm.fma.f64(double %48, double %47, double 1.000000e+00)
  %50 = tail call double @llvm.fma.f64(double %49, double %47, double %47)
  %51 = tail call double @llvm.fma.f64(double %48, double %50, double 1.000000e+00)
  %52 = tail call double @llvm.fma.f64(double %51, double %50, double %50)
  %53 = fmul double %43, %52
  %54 = fmul double %44, %53
  %55 = fneg double %54
  %56 = tail call double @llvm.fma.f64(double %53, double %44, double %55)
  %57 = tail call double @llvm.fma.f64(double %53, double %46, double %56)
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fsub double %43, %58
  %62 = fsub double %43, %61
  %63 = fsub double %62, %58
  %64 = fsub double %63, %60
  %65 = fadd double %61, %64
  %66 = fmul double %52, %65
  %67 = fadd double %53, %66
  %68 = fsub double %67, %53
  %69 = fsub double %66, %68
  %70 = fmul double %67, %67
  %71 = tail call double @llvm.fma.f64(double %70, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %72 = tail call double @llvm.fma.f64(double %70, double %71, double 0x3FC7474DD7F4DF2E)
  %73 = tail call double @llvm.fma.f64(double %70, double %72, double 0x3FCC71C016291751)
  %74 = tail call double @llvm.fma.f64(double %70, double %73, double 0x3FD249249B27ACF1)
  %75 = tail call double @llvm.fma.f64(double %70, double %74, double 0x3FD99999998EF7B6)
  %76 = tail call double @llvm.fma.f64(double %70, double %75, double 0x3FE5555555555780)
  %77 = tail call double @llvm.amdgcn.ldexp.f64(double %67, i32 1)
  %78 = tail call double @llvm.amdgcn.ldexp.f64(double %69, i32 1)
  %79 = fmul double %67, %70
  %80 = fmul double %79, %76
  %81 = fadd double %77, %80
  %82 = fsub double %81, %77
  %83 = fsub double %80, %82
  %84 = fadd double %78, %83
  %85 = fadd double %81, %84
  %86 = fsub double %85, %81
  %87 = fsub double %84, %86
  %88 = sitofp i32 %42 to double
  %89 = fmul double %88, 0x3FE62E42FEFA39EF
  %90 = fneg double %89
  %91 = tail call double @llvm.fma.f64(double %88, double 0x3FE62E42FEFA39EF, double %90)
  %92 = tail call double @llvm.fma.f64(double %88, double 0x3C7ABC9E3B39803F, double %91)
  %93 = fadd double %89, %92
  %94 = fsub double %93, %89
  %95 = fsub double %92, %94
  %96 = fadd double %93, %85
  %97 = fsub double %96, %93
  %98 = fsub double %96, %97
  %99 = fsub double %93, %98
  %100 = fsub double %85, %97
  %101 = fadd double %100, %99
  %102 = fadd double %95, %87
  %103 = fsub double %102, %95
  %104 = fsub double %102, %103
  %105 = fsub double %95, %104
  %106 = fsub double %87, %103
  %107 = fadd double %106, %105
  %108 = fadd double %102, %101
  %109 = fadd double %96, %108
  %110 = fsub double %109, %96
  %111 = fsub double %108, %110
  %112 = fadd double %107, %111
  %113 = fadd double %109, %112
  %114 = tail call double @llvm.fabs.f64(double %36) #3
  %115 = fcmp oeq double %114, 0x7FF0000000000000
  %116 = select i1 %115, double %36, double %113
  %117 = fcmp olt double %36, 0.000000e+00
  %118 = select i1 %117, double 0x7FF8000000000000, double %116
  %119 = fcmp oeq double %36, 0.000000e+00
  %120 = select i1 %119, double 0xFFF0000000000000, double %118
  %121 = fmul contract double %120, %34
  %122 = fsub contract float 1.000000e+00, %30
  %123 = fpext float %122 to double
  %124 = fsub contract float 1.000000e+00, %32
  %125 = fpext float %124 to double
  %126 = fadd contract double %125, 0x3E7AD7F29ABCAF48
  %127 = tail call double @llvm.amdgcn.frexp.mant.f64(double %126)
  %128 = fcmp olt double %127, 0x3FE5555555555555
  %129 = zext i1 %128 to i32
  %130 = tail call double @llvm.amdgcn.ldexp.f64(double %127, i32 %129)
  %131 = tail call i32 @llvm.amdgcn.frexp.exp.i32.f64(double %126)
  %132 = sub nsw i32 %131, %129
  %133 = fadd double %130, -1.000000e+00
  %134 = fadd double %130, 1.000000e+00
  %135 = fadd double %134, -1.000000e+00
  %136 = fsub double %130, %135
  %137 = tail call double @llvm.amdgcn.rcp.f64(double %134)
  %138 = fneg double %134
  %139 = tail call double @llvm.fma.f64(double %138, double %137, double 1.000000e+00)
  %140 = tail call double @llvm.fma.f64(double %139, double %137, double %137)
  %141 = tail call double @llvm.fma.f64(double %138, double %140, double 1.000000e+00)
  %142 = tail call double @llvm.fma.f64(double %141, double %140, double %140)
  %143 = fmul double %133, %142
  %144 = fmul double %134, %143
  %145 = fneg double %144
  %146 = tail call double @llvm.fma.f64(double %143, double %134, double %145)
  %147 = tail call double @llvm.fma.f64(double %143, double %136, double %146)
  %148 = fadd double %144, %147
  %149 = fsub double %148, %144
  %150 = fsub double %147, %149
  %151 = fsub double %133, %148
  %152 = fsub double %133, %151
  %153 = fsub double %152, %148
  %154 = fsub double %153, %150
  %155 = fadd double %151, %154
  %156 = fmul double %142, %155
  %157 = fadd double %143, %156
  %158 = fsub double %157, %143
  %159 = fsub double %156, %158
  %160 = fmul double %157, %157
  %161 = tail call double @llvm.fma.f64(double %160, double 0x3FC3AB76BF559E2B, double 0x3FC385386B47B09A)
  %162 = tail call double @llvm.fma.f64(double %160, double %161, double 0x3FC7474DD7F4DF2E)
  %163 = tail call double @llvm.fma.f64(double %160, double %162, double 0x3FCC71C016291751)
  %164 = tail call double @llvm.fma.f64(double %160, double %163, double 0x3FD249249B27ACF1)
  %165 = tail call double @llvm.fma.f64(double %160, double %164, double 0x3FD99999998EF7B6)
  %166 = tail call double @llvm.fma.f64(double %160, double %165, double 0x3FE5555555555780)
  %167 = tail call double @llvm.amdgcn.ldexp.f64(double %157, i32 1)
  %168 = tail call double @llvm.amdgcn.ldexp.f64(double %159, i32 1)
  %169 = fmul double %157, %160
  %170 = fmul double %169, %166
  %171 = fadd double %167, %170
  %172 = fsub double %171, %167
  %173 = fsub double %170, %172
  %174 = fadd double %168, %173
  %175 = fadd double %171, %174
  %176 = fsub double %175, %171
  %177 = fsub double %174, %176
  %178 = sitofp i32 %132 to double
  %179 = fmul double %178, 0x3FE62E42FEFA39EF
  %180 = fneg double %179
  %181 = tail call double @llvm.fma.f64(double %178, double 0x3FE62E42FEFA39EF, double %180)
  %182 = tail call double @llvm.fma.f64(double %178, double 0x3C7ABC9E3B39803F, double %181)
  %183 = fadd double %179, %182
  %184 = fsub double %183, %179
  %185 = fsub double %182, %184
  %186 = fadd double %183, %175
  %187 = fsub double %186, %183
  %188 = fsub double %186, %187
  %189 = fsub double %183, %188
  %190 = fsub double %175, %187
  %191 = fadd double %190, %189
  %192 = fadd double %185, %177
  %193 = fsub double %192, %185
  %194 = fsub double %192, %193
  %195 = fsub double %185, %194
  %196 = fsub double %177, %193
  %197 = fadd double %196, %195
  %198 = fadd double %192, %191
  %199 = fadd double %186, %198
  %200 = fsub double %199, %186
  %201 = fsub double %198, %200
  %202 = fadd double %197, %201
  %203 = fadd double %199, %202
  %204 = tail call double @llvm.fabs.f64(double %126) #3
  %205 = fcmp oeq double %204, 0x7FF0000000000000
  %206 = select i1 %205, double %126, double %203
  %207 = fcmp olt double %126, 0.000000e+00
  %208 = select i1 %207, double 0x7FF8000000000000, double %206
  %209 = fcmp oeq double %126, 0.000000e+00
  %210 = select i1 %209, double 0xFFF0000000000000, double %208
  %211 = fmul contract double %210, %123
  %212 = fsub contract double %121, %211
  %213 = fptrunc double %212 to float
  %214 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  store float %213, float addrspace(1)* %214, align 4, !tbaa !16
  %215 = fsub contract float %30, %32
  %216 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %215, float addrspace(1)* %216, align 4, !tbaa !16
  br label %217

217:                                              ; preds = %27, %5
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
