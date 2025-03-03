; ModuleID = '../data/hip_kernels/13211/3/main.cu'
source_filename = "../data/hip_kernels/13211/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z5stanhidPKdPd(i32 %0, double %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %171

15:                                               ; preds = %4
  %16 = sext i32 %13 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %2, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !6
  %19 = tail call double @llvm.fabs.f64(double %18)
  %20 = fmul double %19, 0x3FF71547652B82FE
  %21 = tail call double @llvm.rint.f64(double %20)
  %22 = tail call double @llvm.fma.f64(double %21, double 0xBFE62E42FEFA3000, double %19)
  %23 = fadd double %22, 0.000000e+00
  %24 = fsub double %22, %23
  %25 = fadd double %24, 0.000000e+00
  %26 = fmul double %21, 0x3D53DE6AF278E000
  %27 = fsub double %23, %26
  %28 = fsub double %23, %27
  %29 = fsub double %28, %26
  %30 = fadd double %25, %29
  %31 = fadd double %27, %30
  %32 = fsub double %31, %27
  %33 = fsub double %30, %32
  %34 = fmul double %21, 0x3AC9CC01F97B57A0
  %35 = fsub double %31, %34
  %36 = fsub double %31, %35
  %37 = fsub double %36, %34
  %38 = fadd double %33, %37
  %39 = fadd double %35, %38
  %40 = fsub double %39, %35
  %41 = fsub double %38, %40
  %42 = tail call double @llvm.fma.f64(double %39, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %43 = tail call double @llvm.fma.f64(double %39, double %42, double 0x3EC71DEE623FDE64)
  %44 = tail call double @llvm.fma.f64(double %39, double %43, double 0x3EFA01997C89E6B0)
  %45 = tail call double @llvm.fma.f64(double %39, double %44, double 0x3F2A01A014761F6E)
  %46 = tail call double @llvm.fma.f64(double %39, double %45, double 0x3F56C16C1852B7B0)
  %47 = tail call double @llvm.fma.f64(double %39, double %46, double 0x3F81111111122322)
  %48 = tail call double @llvm.fma.f64(double %39, double %47, double 0x3FA55555555502A1)
  %49 = tail call double @llvm.fma.f64(double %39, double %48, double 0x3FC5555555555511)
  %50 = tail call double @llvm.fma.f64(double %39, double %49, double 0x3FE000000000000B)
  %51 = fmul double %39, %39
  %52 = fneg double %51
  %53 = tail call double @llvm.fma.f64(double %39, double %39, double %52)
  %54 = fmul double %41, 2.000000e+00
  %55 = tail call double @llvm.fma.f64(double %39, double %54, double %53)
  %56 = fadd double %51, %55
  %57 = fsub double %56, %51
  %58 = fsub double %55, %57
  %59 = fmul double %56, %50
  %60 = fneg double %59
  %61 = tail call double @llvm.fma.f64(double %56, double %50, double %60)
  %62 = tail call double @llvm.fma.f64(double %58, double %50, double %61)
  %63 = fadd double %59, %62
  %64 = fsub double %63, %59
  %65 = fsub double %62, %64
  %66 = fadd double %39, %63
  %67 = fsub double %66, %39
  %68 = fsub double %63, %67
  %69 = fadd double %41, %65
  %70 = fadd double %69, %68
  %71 = fadd double %66, %70
  %72 = fsub double %71, %66
  %73 = fsub double %70, %72
  %74 = fadd double %71, 1.000000e+00
  %75 = fadd double %74, -1.000000e+00
  %76 = fsub double %71, %75
  %77 = fadd double %73, %76
  %78 = fadd double %74, %77
  %79 = fsub double %78, %74
  %80 = fsub double %77, %79
  %81 = fptosi double %21 to i32
  %82 = tail call double @llvm.amdgcn.ldexp.f64(double %78, i32 %81)
  %83 = tail call double @llvm.amdgcn.ldexp.f64(double %80, i32 %81)
  %84 = tail call double @llvm.amdgcn.rcp.f64(double %82)
  %85 = fneg double %82
  %86 = tail call double @llvm.fma.f64(double %85, double %84, double 1.000000e+00)
  %87 = tail call double @llvm.fma.f64(double %86, double %84, double %84)
  %88 = tail call double @llvm.fma.f64(double %85, double %87, double 1.000000e+00)
  %89 = tail call double @llvm.fma.f64(double %88, double %87, double %87)
  %90 = fmul double %82, %89
  %91 = fneg double %90
  %92 = tail call double @llvm.fma.f64(double %89, double %82, double %91)
  %93 = tail call double @llvm.fma.f64(double %89, double %83, double %92)
  %94 = fadd double %90, %93
  %95 = fsub double %94, %90
  %96 = fsub double %93, %95
  %97 = fsub double 1.000000e+00, %94
  %98 = fsub double 1.000000e+00, %97
  %99 = fsub double %98, %94
  %100 = fsub double %99, %96
  %101 = fadd double %97, %100
  %102 = fsub double %101, %97
  %103 = fsub double %100, %102
  %104 = fmul double %89, %101
  %105 = fmul double %82, %104
  %106 = fneg double %105
  %107 = tail call double @llvm.fma.f64(double %104, double %82, double %106)
  %108 = tail call double @llvm.fma.f64(double %104, double %83, double %107)
  %109 = fadd double %105, %108
  %110 = fsub double %109, %105
  %111 = fsub double %108, %110
  %112 = fsub double %101, %109
  %113 = fsub double %101, %112
  %114 = fsub double %113, %109
  %115 = fadd double %103, %114
  %116 = fsub double %115, %111
  %117 = fadd double %112, %116
  %118 = fmul double %89, %117
  %119 = fadd double %89, %104
  %120 = fsub double %119, %89
  %121 = fsub double %104, %120
  %122 = fadd double %121, %118
  %123 = fadd double %119, %122
  %124 = fsub double %123, %119
  %125 = fsub double %122, %124
  %126 = fsub double %82, %123
  %127 = fsub double %82, %126
  %128 = fsub double %127, %123
  %129 = fadd double %83, %128
  %130 = fsub double %129, %125
  %131 = fadd double %126, %130
  %132 = fsub double %131, %126
  %133 = fsub double %130, %132
  %134 = fadd double %82, %123
  %135 = fsub double %134, %82
  %136 = fsub double %123, %135
  %137 = fadd double %83, %125
  %138 = fadd double %137, %136
  %139 = fadd double %134, %138
  %140 = fsub double %139, %134
  %141 = fsub double %138, %140
  %142 = tail call double @llvm.amdgcn.rcp.f64(double %139)
  %143 = fneg double %139
  %144 = tail call double @llvm.fma.f64(double %143, double %142, double 1.000000e+00)
  %145 = tail call double @llvm.fma.f64(double %144, double %142, double %142)
  %146 = tail call double @llvm.fma.f64(double %143, double %145, double 1.000000e+00)
  %147 = tail call double @llvm.fma.f64(double %146, double %145, double %145)
  %148 = fmul double %131, %147
  %149 = fmul double %139, %148
  %150 = fneg double %149
  %151 = tail call double @llvm.fma.f64(double %148, double %139, double %150)
  %152 = tail call double @llvm.fma.f64(double %148, double %141, double %151)
  %153 = fadd double %149, %152
  %154 = fsub double %153, %149
  %155 = fsub double %152, %154
  %156 = fsub double %131, %153
  %157 = fsub double %131, %156
  %158 = fsub double %157, %153
  %159 = fsub double %158, %155
  %160 = fadd double %133, %159
  %161 = fadd double %156, %160
  %162 = fmul double %147, %161
  %163 = fadd double %148, %162
  %164 = fcmp ogt double %19, 1.906250e+01
  %165 = select i1 %164, double 1.000000e+00, double %163
  %166 = fcmp olt double %19, 0x3E40000000000000
  %167 = select i1 %166, double %19, double %165
  %168 = tail call double @llvm.copysign.f64(double %167, double %18)
  %169 = fmul contract double %168, %1
  %170 = getelementptr inbounds double, double addrspace(1)* %3, i64 %16
  store double %169, double addrspace(1)* %170, align 8, !tbaa !7
  br label %171

171:                                              ; preds = %15, %4
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
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
