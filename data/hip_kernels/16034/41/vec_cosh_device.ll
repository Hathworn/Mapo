; ModuleID = '../data/hip_kernels/16034/41/main.cu'
source_filename = "../data/hip_kernels/16034/41/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @vec_cosh(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2) local_unnamed_addr #0 {
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
  br i1 %31, label %32, label %164

32:                                               ; preds = %3
  %33 = sext i32 %30 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call double @llvm.fabs.f64(double %35)
  %37 = fadd double %36, 0xBFE62E42FEFA39EF
  %38 = fsub double %37, %36
  %39 = fsub double %38, %37
  %40 = fadd double %36, %39
  %41 = fadd double %38, 0x3FE62E42FEFA39EF
  %42 = fsub double %40, %41
  %43 = fadd double %42, 0xBC7ABC9E3B39803F
  %44 = fadd double %37, %43
  %45 = fsub double %44, %37
  %46 = fsub double %43, %45
  %47 = fmul double %44, 0x3FF71547652B82FE
  %48 = tail call double @llvm.rint.f64(double %47)
  %49 = tail call double @llvm.fma.f64(double %48, double 0xBFE62E42FEFA3000, double %44)
  %50 = fadd double %46, %49
  %51 = fsub double %50, %49
  %52 = fsub double %46, %51
  %53 = fmul double %48, 0x3D53DE6AF278E000
  %54 = fsub double %50, %53
  %55 = fsub double %50, %54
  %56 = fsub double %55, %53
  %57 = fadd double %52, %56
  %58 = fadd double %54, %57
  %59 = fsub double %58, %54
  %60 = fsub double %57, %59
  %61 = fmul double %48, 0x3AC9CC01F97B57A0
  %62 = fsub double %58, %61
  %63 = fsub double %58, %62
  %64 = fsub double %63, %61
  %65 = fadd double %60, %64
  %66 = fadd double %62, %65
  %67 = fsub double %66, %62
  %68 = fsub double %65, %67
  %69 = tail call double @llvm.fma.f64(double %66, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %70 = tail call double @llvm.fma.f64(double %66, double %69, double 0x3EC71DEE623FDE64)
  %71 = tail call double @llvm.fma.f64(double %66, double %70, double 0x3EFA01997C89E6B0)
  %72 = tail call double @llvm.fma.f64(double %66, double %71, double 0x3F2A01A014761F6E)
  %73 = tail call double @llvm.fma.f64(double %66, double %72, double 0x3F56C16C1852B7B0)
  %74 = tail call double @llvm.fma.f64(double %66, double %73, double 0x3F81111111122322)
  %75 = tail call double @llvm.fma.f64(double %66, double %74, double 0x3FA55555555502A1)
  %76 = tail call double @llvm.fma.f64(double %66, double %75, double 0x3FC5555555555511)
  %77 = tail call double @llvm.fma.f64(double %66, double %76, double 0x3FE000000000000B)
  %78 = fmul double %66, %66
  %79 = fneg double %78
  %80 = tail call double @llvm.fma.f64(double %66, double %66, double %79)
  %81 = fmul double %68, 2.000000e+00
  %82 = tail call double @llvm.fma.f64(double %66, double %81, double %80)
  %83 = fadd double %78, %82
  %84 = fsub double %83, %78
  %85 = fsub double %82, %84
  %86 = fmul double %83, %77
  %87 = fneg double %86
  %88 = tail call double @llvm.fma.f64(double %83, double %77, double %87)
  %89 = tail call double @llvm.fma.f64(double %85, double %77, double %88)
  %90 = fadd double %86, %89
  %91 = fsub double %90, %86
  %92 = fsub double %89, %91
  %93 = fadd double %66, %90
  %94 = fsub double %93, %66
  %95 = fsub double %90, %94
  %96 = fadd double %68, %92
  %97 = fadd double %96, %95
  %98 = fadd double %93, %97
  %99 = fsub double %98, %93
  %100 = fsub double %97, %99
  %101 = fadd double %98, 1.000000e+00
  %102 = fadd double %101, -1.000000e+00
  %103 = fsub double %98, %102
  %104 = fadd double %100, %103
  %105 = fadd double %101, %104
  %106 = fsub double %105, %101
  %107 = fsub double %104, %106
  %108 = fptosi double %48 to i32
  %109 = tail call double @llvm.amdgcn.ldexp.f64(double %105, i32 %108)
  %110 = tail call double @llvm.amdgcn.ldexp.f64(double %107, i32 %108)
  %111 = tail call double @llvm.amdgcn.rcp.f64(double %109)
  %112 = fneg double %109
  %113 = tail call double @llvm.fma.f64(double %112, double %111, double 1.000000e+00)
  %114 = tail call double @llvm.fma.f64(double %113, double %111, double %111)
  %115 = tail call double @llvm.fma.f64(double %112, double %114, double 1.000000e+00)
  %116 = tail call double @llvm.fma.f64(double %115, double %114, double %114)
  %117 = fmul double %109, %116
  %118 = fneg double %117
  %119 = tail call double @llvm.fma.f64(double %116, double %109, double %118)
  %120 = tail call double @llvm.fma.f64(double %116, double %110, double %119)
  %121 = fadd double %117, %120
  %122 = fsub double %121, %117
  %123 = fsub double %120, %122
  %124 = fsub double 1.000000e+00, %121
  %125 = fsub double 1.000000e+00, %124
  %126 = fsub double %125, %121
  %127 = fsub double %126, %123
  %128 = fadd double %124, %127
  %129 = fsub double %128, %124
  %130 = fsub double %127, %129
  %131 = fmul double %116, %128
  %132 = fmul double %109, %131
  %133 = fneg double %132
  %134 = tail call double @llvm.fma.f64(double %131, double %109, double %133)
  %135 = tail call double @llvm.fma.f64(double %131, double %110, double %134)
  %136 = fadd double %132, %135
  %137 = fsub double %136, %132
  %138 = fsub double %135, %137
  %139 = fsub double %128, %136
  %140 = fsub double %128, %139
  %141 = fsub double %140, %136
  %142 = fadd double %130, %141
  %143 = fsub double %142, %138
  %144 = fadd double %139, %143
  %145 = fmul double %116, %144
  %146 = fadd double %116, %131
  %147 = fsub double %146, %116
  %148 = fsub double %131, %147
  %149 = fadd double %148, %145
  %150 = fadd double %146, %149
  %151 = fsub double %150, %146
  %152 = fsub double %149, %151
  %153 = tail call double @llvm.amdgcn.ldexp.f64(double %150, i32 -2)
  %154 = tail call double @llvm.amdgcn.ldexp.f64(double %152, i32 -2)
  %155 = fadd double %109, %153
  %156 = fsub double %155, %109
  %157 = fsub double %153, %156
  %158 = fadd double %110, %154
  %159 = fadd double %158, %157
  %160 = fadd double %155, %159
  %161 = fcmp oge double %36, 0x408633CE8FB9F87E
  %162 = select i1 %161, double 0x7FF0000000000000, double %160
  %163 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  store double %162, double addrspace(1)* %163, align 8, !tbaa !16
  br label %164

164:                                              ; preds = %32, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.rcp.f64(double) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fma.f64(double, double, double) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.amdgcn.ldexp.f64(double, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.rint.f64(double) #1

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
