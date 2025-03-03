; ModuleID = '../data/hip_kernels/16096/7/main.cu'
source_filename = "../data/hip_kernels/16096/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10matrixTanhPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp slt i32 %13, %3
  %23 = icmp slt i32 %21, %2
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %182

25:                                               ; preds = %4
  %26 = mul nsw i32 %21, %3
  %27 = add nsw i32 %26, %13
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !5
  %31 = tail call double @llvm.fabs.f64(double %30)
  %32 = fmul double %31, 0x3FF71547652B82FE
  %33 = tail call double @llvm.rint.f64(double %32)
  %34 = tail call double @llvm.fma.f64(double %33, double 0xBFE62E42FEFA3000, double %31)
  %35 = fadd double %34, 0.000000e+00
  %36 = fsub double %34, %35
  %37 = fadd double %36, 0.000000e+00
  %38 = fmul double %33, 0x3D53DE6AF278E000
  %39 = fsub double %35, %38
  %40 = fsub double %35, %39
  %41 = fsub double %40, %38
  %42 = fadd double %37, %41
  %43 = fadd double %39, %42
  %44 = fsub double %43, %39
  %45 = fsub double %42, %44
  %46 = fmul double %33, 0x3AC9CC01F97B57A0
  %47 = fsub double %43, %46
  %48 = fsub double %43, %47
  %49 = fsub double %48, %46
  %50 = fadd double %45, %49
  %51 = fadd double %47, %50
  %52 = fsub double %51, %47
  %53 = fsub double %50, %52
  %54 = tail call double @llvm.fma.f64(double %51, double 0x3E5ADE156A5DCB37, double 0x3E928AF3FCA7AB0C)
  %55 = tail call double @llvm.fma.f64(double %51, double %54, double 0x3EC71DEE623FDE64)
  %56 = tail call double @llvm.fma.f64(double %51, double %55, double 0x3EFA01997C89E6B0)
  %57 = tail call double @llvm.fma.f64(double %51, double %56, double 0x3F2A01A014761F6E)
  %58 = tail call double @llvm.fma.f64(double %51, double %57, double 0x3F56C16C1852B7B0)
  %59 = tail call double @llvm.fma.f64(double %51, double %58, double 0x3F81111111122322)
  %60 = tail call double @llvm.fma.f64(double %51, double %59, double 0x3FA55555555502A1)
  %61 = tail call double @llvm.fma.f64(double %51, double %60, double 0x3FC5555555555511)
  %62 = tail call double @llvm.fma.f64(double %51, double %61, double 0x3FE000000000000B)
  %63 = fmul double %51, %51
  %64 = fneg double %63
  %65 = tail call double @llvm.fma.f64(double %51, double %51, double %64)
  %66 = fmul double %53, 2.000000e+00
  %67 = tail call double @llvm.fma.f64(double %51, double %66, double %65)
  %68 = fadd double %63, %67
  %69 = fsub double %68, %63
  %70 = fsub double %67, %69
  %71 = fmul double %68, %62
  %72 = fneg double %71
  %73 = tail call double @llvm.fma.f64(double %68, double %62, double %72)
  %74 = tail call double @llvm.fma.f64(double %70, double %62, double %73)
  %75 = fadd double %71, %74
  %76 = fsub double %75, %71
  %77 = fsub double %74, %76
  %78 = fadd double %51, %75
  %79 = fsub double %78, %51
  %80 = fsub double %75, %79
  %81 = fadd double %53, %77
  %82 = fadd double %81, %80
  %83 = fadd double %78, %82
  %84 = fsub double %83, %78
  %85 = fsub double %82, %84
  %86 = fadd double %83, 1.000000e+00
  %87 = fadd double %86, -1.000000e+00
  %88 = fsub double %83, %87
  %89 = fadd double %85, %88
  %90 = fadd double %86, %89
  %91 = fsub double %90, %86
  %92 = fsub double %89, %91
  %93 = fptosi double %33 to i32
  %94 = tail call double @llvm.amdgcn.ldexp.f64(double %90, i32 %93)
  %95 = tail call double @llvm.amdgcn.ldexp.f64(double %92, i32 %93)
  %96 = tail call double @llvm.amdgcn.rcp.f64(double %94)
  %97 = fneg double %94
  %98 = tail call double @llvm.fma.f64(double %97, double %96, double 1.000000e+00)
  %99 = tail call double @llvm.fma.f64(double %98, double %96, double %96)
  %100 = tail call double @llvm.fma.f64(double %97, double %99, double 1.000000e+00)
  %101 = tail call double @llvm.fma.f64(double %100, double %99, double %99)
  %102 = fmul double %94, %101
  %103 = fneg double %102
  %104 = tail call double @llvm.fma.f64(double %101, double %94, double %103)
  %105 = tail call double @llvm.fma.f64(double %101, double %95, double %104)
  %106 = fadd double %102, %105
  %107 = fsub double %106, %102
  %108 = fsub double %105, %107
  %109 = fsub double 1.000000e+00, %106
  %110 = fsub double 1.000000e+00, %109
  %111 = fsub double %110, %106
  %112 = fsub double %111, %108
  %113 = fadd double %109, %112
  %114 = fsub double %113, %109
  %115 = fsub double %112, %114
  %116 = fmul double %101, %113
  %117 = fmul double %94, %116
  %118 = fneg double %117
  %119 = tail call double @llvm.fma.f64(double %116, double %94, double %118)
  %120 = tail call double @llvm.fma.f64(double %116, double %95, double %119)
  %121 = fadd double %117, %120
  %122 = fsub double %121, %117
  %123 = fsub double %120, %122
  %124 = fsub double %113, %121
  %125 = fsub double %113, %124
  %126 = fsub double %125, %121
  %127 = fadd double %115, %126
  %128 = fsub double %127, %123
  %129 = fadd double %124, %128
  %130 = fmul double %101, %129
  %131 = fadd double %101, %116
  %132 = fsub double %131, %101
  %133 = fsub double %116, %132
  %134 = fadd double %133, %130
  %135 = fadd double %131, %134
  %136 = fsub double %135, %131
  %137 = fsub double %134, %136
  %138 = fsub double %94, %135
  %139 = fsub double %94, %138
  %140 = fsub double %139, %135
  %141 = fadd double %95, %140
  %142 = fsub double %141, %137
  %143 = fadd double %138, %142
  %144 = fsub double %143, %138
  %145 = fsub double %142, %144
  %146 = fadd double %94, %135
  %147 = fsub double %146, %94
  %148 = fsub double %135, %147
  %149 = fadd double %95, %137
  %150 = fadd double %149, %148
  %151 = fadd double %146, %150
  %152 = fsub double %151, %146
  %153 = fsub double %150, %152
  %154 = tail call double @llvm.amdgcn.rcp.f64(double %151)
  %155 = fneg double %151
  %156 = tail call double @llvm.fma.f64(double %155, double %154, double 1.000000e+00)
  %157 = tail call double @llvm.fma.f64(double %156, double %154, double %154)
  %158 = tail call double @llvm.fma.f64(double %155, double %157, double 1.000000e+00)
  %159 = tail call double @llvm.fma.f64(double %158, double %157, double %157)
  %160 = fmul double %143, %159
  %161 = fmul double %151, %160
  %162 = fneg double %161
  %163 = tail call double @llvm.fma.f64(double %160, double %151, double %162)
  %164 = tail call double @llvm.fma.f64(double %160, double %153, double %163)
  %165 = fadd double %161, %164
  %166 = fsub double %165, %161
  %167 = fsub double %164, %166
  %168 = fsub double %143, %165
  %169 = fsub double %143, %168
  %170 = fsub double %169, %165
  %171 = fsub double %170, %167
  %172 = fadd double %145, %171
  %173 = fadd double %168, %172
  %174 = fmul double %159, %173
  %175 = fadd double %160, %174
  %176 = fcmp ogt double %31, 1.906250e+01
  %177 = select i1 %176, double 1.000000e+00, double %175
  %178 = fcmp olt double %31, 0x3E40000000000000
  %179 = select i1 %178, double %31, double %177
  %180 = tail call double @llvm.copysign.f64(double %179, double %30)
  %181 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  store double %180, double addrspace(1)* %181, align 8, !tbaa !7
  br label %182

182:                                              ; preds = %25, %4
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
