; ModuleID = '../data/hip_kernels/16034/73/main.cu'
source_filename = "../data/hip_kernels/16034/73/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_tanh(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !7
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = udiv i32 %13, %10
  %23 = mul i32 %22, %10
  %24 = icmp ugt i32 %13, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 %22, %25
  %27 = mul i32 %26, %21
  %28 = add i32 %27, %5
  %29 = mul i32 %28, %10
  %30 = add i32 %29, %4
  %31 = icmp slt i32 %30, %0
  br i1 %31, label %32, label %187

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fmul double %36, 0x3FF71547652B82FE
  %38 = tail call double @llvm.rint.f64(double %37)
  %39 = tail call double @llvm.fma.f64(double %38, double 0xBFE62E42FEFA3000, double %36)
  %40 = fadd double %39, 0.000000e+00
  %41 = fsub double %39, %40
  %42 = fadd double %41, 0.000000e+00
  %43 = fmul double %38, 0x3D53DE6AF278E000
  %44 = fsub double %40, %43
  %45 = fsub double %40, %44
  %46 = fsub double %45, %43
  %47 = fadd double %42, %46
  %48 = fadd double %44, %47
  %49 = fsub double %48, %44
  %50 = fsub double %47, %49
  %51 = fmul double %38, 0x3AC9CC01F97B57A0
  %52 = fsub double %48, %51
  %53 = fsub double %48, %52
  %54 = fsub double %53, %51
  %55 = fadd double %50, %54
  %56 = fadd double %52, %55
  %57 = fsub double %56, %52
  %58 = fsub double %55, %57
  %59 = tail call double @llvm.fma.f64(double %56, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %60 = tail call double @llvm.fma.f64(double %56, double %59, double 0x3EC71DEE623FDE64)
  %61 = tail call double @llvm.fma.f64(double %56, double %60, double 0x3EFA01997C89E6B0)
  %62 = tail call double @llvm.fma.f64(double %56, double %61, double 0x3F2A01A014761F6E)
  %63 = tail call double @llvm.fma.f64(double %56, double %62, double 0x3F56C16C1852B7B0)
  %64 = tail call double @llvm.fma.f64(double %56, double %63, double 0x3F81111111122322)
  %65 = tail call double @llvm.fma.f64(double %56, double %64, double 0x3FA55555555502A1)
  %66 = tail call double @llvm.fma.f64(double %56, double %65, double 0x3FC5555555555511)
  %67 = tail call double @llvm.fma.f64(double %56, double %66, double 0x3FE000000000000B)
  %68 = fmul double %56, %56
  %69 = fneg double %68
  %70 = tail call double @llvm.fma.f64(double %56, double %56, double %69)
  %71 = fmul double %58, 2.000000e+00
  %72 = tail call double @llvm.fma.f64(double %56, double %71, double %70)
  %73 = fadd double %68, %72
  %74 = fsub double %73, %68
  %75 = fsub double %72, %74
  %76 = fmul double %73, %67
  %77 = fneg double %76
  %78 = tail call double @llvm.fma.f64(double %73, double %67, double %77)
  %79 = tail call double @llvm.fma.f64(double %75, double %67, double %78)
  %80 = fadd double %76, %79
  %81 = fsub double %80, %76
  %82 = fsub double %79, %81
  %83 = fadd double %56, %80
  %84 = fsub double %83, %56
  %85 = fsub double %80, %84
  %86 = fadd double %58, %82
  %87 = fadd double %86, %85
  %88 = fadd double %83, %87
  %89 = fsub double %88, %83
  %90 = fsub double %87, %89
  %91 = fadd double %88, 1.000000e+00
  %92 = fadd double %91, -1.000000e+00
  %93 = fsub double %88, %92
  %94 = fadd double %90, %93
  %95 = fadd double %91, %94
  %96 = fsub double %95, %91
  %97 = fsub double %94, %96
  %98 = fptosi double %38 to i32
  %99 = tail call double @llvm.amdgcn.ldexp.f64(double %95, i32 %98)
  %100 = tail call double @llvm.amdgcn.ldexp.f64(double %97, i32 %98)
  %101 = tail call double @llvm.amdgcn.rcp.f64(double %99)
  %102 = fneg double %99
  %103 = tail call double @llvm.fma.f64(double %102, double %101, double 1.000000e+00)
  %104 = tail call double @llvm.fma.f64(double %103, double %101, double %101)
  %105 = tail call double @llvm.fma.f64(double %102, double %104, double 1.000000e+00)
  %106 = tail call double @llvm.fma.f64(double %105, double %104, double %104)
  %107 = fmul double %99, %106
  %108 = fneg double %107
  %109 = tail call double @llvm.fma.f64(double %106, double %99, double %108)
  %110 = tail call double @llvm.fma.f64(double %106, double %100, double %109)
  %111 = fadd double %107, %110
  %112 = fsub double %111, %107
  %113 = fsub double %110, %112
  %114 = fsub double 1.000000e+00, %111
  %115 = fsub double 1.000000e+00, %114
  %116 = fsub double %115, %111
  %117 = fsub double %116, %113
  %118 = fadd double %114, %117
  %119 = fsub double %118, %114
  %120 = fsub double %117, %119
  %121 = fmul double %106, %118
  %122 = fmul double %99, %121
  %123 = fneg double %122
  %124 = tail call double @llvm.fma.f64(double %121, double %99, double %123)
  %125 = tail call double @llvm.fma.f64(double %121, double %100, double %124)
  %126 = fadd double %122, %125
  %127 = fsub double %126, %122
  %128 = fsub double %125, %127
  %129 = fsub double %118, %126
  %130 = fsub double %118, %129
  %131 = fsub double %130, %126
  %132 = fadd double %120, %131
  %133 = fsub double %132, %128
  %134 = fadd double %129, %133
  %135 = fmul double %106, %134
  %136 = fadd double %106, %121
  %137 = fsub double %136, %106
  %138 = fsub double %121, %137
  %139 = fadd double %138, %135
  %140 = fadd double %136, %139
  %141 = fsub double %140, %136
  %142 = fsub double %139, %141
  %143 = fsub double %99, %140
  %144 = fsub double %99, %143
  %145 = fsub double %144, %140
  %146 = fadd double %100, %145
  %147 = fsub double %146, %142
  %148 = fadd double %143, %147
  %149 = fsub double %148, %143
  %150 = fsub double %147, %149
  %151 = fadd double %99, %140
  %152 = fsub double %151, %99
  %153 = fsub double %140, %152
  %154 = fadd double %100, %142
  %155 = fadd double %154, %153
  %156 = fadd double %151, %155
  %157 = fsub double %156, %151
  %158 = fsub double %155, %157
  %159 = tail call double @llvm.amdgcn.rcp.f64(double %156)
  %160 = fneg double %156
  %161 = tail call double @llvm.fma.f64(double %160, double %159, double 1.000000e+00)
  %162 = tail call double @llvm.fma.f64(double %161, double %159, double %159)
  %163 = tail call double @llvm.fma.f64(double %160, double %162, double 1.000000e+00)
  %164 = tail call double @llvm.fma.f64(double %163, double %162, double %162)
  %165 = fmul double %148, %164
  %166 = fmul double %156, %165
  %167 = fneg double %166
  %168 = tail call double @llvm.fma.f64(double %165, double %156, double %167)
  %169 = tail call double @llvm.fma.f64(double %165, double %158, double %168)
  %170 = fadd double %166, %169
  %171 = fsub double %170, %166
  %172 = fsub double %169, %171
  %173 = fsub double %148, %170
  %174 = fsub double %148, %173
  %175 = fsub double %174, %170
  %176 = fsub double %175, %172
  %177 = fadd double %150, %176
  %178 = fadd double %173, %177
  %179 = fmul double %164, %178
  %180 = fadd double %165, %179
  %181 = fcmp ogt double %36, 1.906250e+01
  %182 = select i1 %181, double 1.000000e+00, double %180
  %183 = fcmp olt double %36, 0x3E40000000000000
  %184 = select i1 %183, double %36, double %182
  %185 = tail call double @llvm.copysign.f64(double %184, double %35)
  %186 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %185, double addrspace(1)* %186, align 8, !tbaa !16
  br label %187

187:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.copysign.f64(double, double) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

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
